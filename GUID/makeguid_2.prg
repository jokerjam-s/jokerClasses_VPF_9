**************************************************************************
*! Copyright by Anjel, 2005
*! 
*! Класс генератора Globally Unique Identifier
*! 
*! Использованы материалы:
*! Получение уникального идентификатора GUID
*! © by Баянов Д.А. Кубанский Государственный Университет, 1997
*! 
**************************************************************************

#ifdef MS_PER_DAY
	#undef MS_PER_DAY
#endif

#define MS_PER_DAY		8640000		&& количество милисекунд в сутках

define class GUID_Class as Custom 

	hidden UniString_ 		&& строка знаков отображения
	hidden nStartDate_ 	&& дата начала отсчета
	hidden nd96s_ 
	hidden nd96d_ 
	hidden Hid2_Guid_ 

	*! 
	*! Защищенные функции класса
	*! 
	
	&& Построение массива символов для уникального кода
	hidden function GetUniString() as String 
	local cUniS, ni
		&& cUniS - набор знаков для отображениячисел с основанием len(cinis)
		&& исключены символы: [0 - 34] ' " [ ] & (38, 39, 91, 93)
		*! строка знаков
		cUniS = Chr(35) + Chr(36) + Chr(37)
		for ni=40 to 90
			cUniS = cUniS + Chr(ni)
		next

		cUniS = cUniS + Chr(92)
		for ni=94 to 128
			cUniS = cUniS + Chr(ni)
		next
	
		for ni=192 to 255
			cUniS = cUniS + Chr(ni)
		next
	return cUniS

	**************************************************************************
	*! Преобразование числа nNum в строку символов 
	*! т.е. упаковка числа в строку символов 
	*! (аналог BinToC), но обрабатывает больший диапазон
	**************************************************************************
	hidden function NumToB(nNum as Long) as String 
	local cBuf, ni, nOst, nTale, nOsn, nVes, nNum, nLen
		cBuf = ""
		nOst = 0
		nTale = 0
		nLen = 1
		nOsn = Len(this.UniString_)	&& основание итогового числа - длина исп. строки конвертации
		&& Выч. количества разрядов в итоговом числе
		do while .t.
			nOst = nOst+(nOsn-1)*nOsn**(nLen-1)
			if nOst >= nNum
				exit
			endif
			nLen = nLen + 1 
		enddo
		for ni=1 to nLen
			nOst = nNum - nTale
			&& вес ni разряда - каждый разряд может принимать значение от старшего
			&& до младшего элемента cUniStr
			nVes = Int(nOst/nOsn**(nLen-ni))
			&& текущий остаток от границы тек. разрядя
			nTale = nTale+nVes*nOsn**(nLen-ni)
			&& извлечь символ по весу разряда nVes++ для знака по nVes==0
			cBuf = cBuf+Substr(this.UniString_, nVes+1, 1)
		next
	return cBuf

	**************************************************************************
	*! обратное преобразование строки в число
	**************************************************************************
	hidden function BToNum(cB as String) as Long 
	local ni, nOst, nk, nOsn, cCim

		nOst = 0
		nOsn = Len(this.UniString_)
	
		for ni=1 to Len(cB)
			cCim = Substr(cB, Len(cB)-ni+1, 1)
			nk = At(cCim, this.UniString_)-1
			nOst = nOst+nk*(nOsn**(ni-1))
		next
	return nOst

	**************************************************************************
	*! получить число тиков, прошедшее от начальной даты
	*! 6 - байт хватит на 20 лет
	**************************************************************************
	hidden function Tic96() as Long 
	return Int(100*Seconds() + MS_PER_DAY*(Val(Sys(11,Date()))-this.nStartDate_))

	**************************************************************************
	*! Получение уникального числа - тики Tic96 + счетчик-дополнение
	*! т.к. за один тик Tic96 может быть вызван несколько раз - введен
	*! дополнительный счетчик
	**************************************************************************
	hidden function Tic96N() as Long 
	local nNew, nNewS
		nNewS = this.Tic96()
		if nNewS == this.nd96s_		&& старый тик
			if this.nd96d_ == 99 	&& предел счетчика - ждать новую милисекунду
				do while nNewS==this.nd96s_
					nNewS = this.Tic96()
				enddo
				this.nd96d_ = 0
			else 
				this.nd96d_ = this.nd96d_ + 1 && увеличить счетчик
			endif 
		else					&& старый тик
			this.nd96d_ = 0
		endif
		nNew = nNewS*100+this.nd96d_	&& новый id
		this.nd96s_ = nNewS
	return (nNew)

	*! 
	*! Функции доступные пользователю
	*! 

	**************************************************************************
	*! инициализация начальных значений
	**************************************************************************
	procedure Init()
	local cBuf
		&& первичная инициализация данных
		this.nStartDate_ = Val(Sys(11,Ctod("01/01/2005")))	&& начало отсчета
		this.nd96s_ = 0
		this.nd96d_ = 0
		this.UniString_ = this.GetUniString()
		cBuf = Sys(0)+Sys(2020)	&& id - компьютера
		cBuf = cBuf + Sys(2015)	&& подмешать аппаратный код сессии (даже при сдвиге часов обеспечит unique)
		this.Hid2_Guid_ = Padr(this.NumToB(Val(Sys(2007,cBuf))/3), 2, '*')
		this.nd96s_ = this.Tic96()	&& начальный "тик"
	return
	
	**************************************************************************
	*! Восстановить дату генерации из GUID
	**************************************************************************
	function DateFromGUID (cB as String) as Date 
	local nTic, dDate
		nTic = this.BToNum(Alltrim(Substr(cB, 1, 6)))
		nTic = nTic / 100
		dDate = Int(nTic/MS_PER_DAY)	&& дни
		dDate = Ctod(Sys(10, dDate+this.nStartDate_))
	return dDate
	
	**************************************************************************
	*! Восстановить десятичное число из GUID
	**************************************************************************
	function NumFromGUID(cB as String) as Long 
	return this.BToNum(Substr(cB, 1, 6))
	
	**************************************************************************
	*! Получение идентификатора
	**************************************************************************
	function GUID() as String 
	return Padr(Padl(this.NumToB(this.Tic96N()), 6)+this.Hid2_Guid_, 8, "!")
	
enddefine

#undef MS_PER_DAY

