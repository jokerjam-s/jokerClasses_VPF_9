local array laWeight[13]
local i, m.ch, m.chkSum

if Empty(this.Value)
	return .T.
endif

if Len(Alltrim(this.Value))<14 or !Between(Val(Left(this.Value,1)),3,6) or;
	!Isdigit(Right(this.Value,1))
	Messagebox("Введен неверный личный номер! Проверьте данные.",48,"Ошибка")
	return 0
endif

if ((Val(Left(this.Value,1))%2 = 0) and thisForm.opSex.Value=1) or ;
	((Val(Left(this.Value,1))%2 # 0) and thisForm.opSex.Value=2)
	Messagebox("Пол работника в личном номере не совпадает с указанным в карточке!"+chr(10)+;
				"Проверьте данные!",48,"Несовпадение данных")
	return 0
endif 	

for i=1 to 13 step 3
	laWeight[i] = 7
	if i+1 < 13
		laWeight[i+1] = 3
	endif
	if i+2 < 13
		laWeight[i+2] = 1
	endif
next

this.Value = Chrtran(Upper(this.Value),"АВЕКМНОРСТХ","ABEKMHOPCTX")

m.chkSum = 0
for i=1 to 13
	m.ch = Substr(this.Value,i,1)
	if Isdigit(m.ch)
		m.ch = Val(m.ch)
	else
		m.ch = Asc(m.ch)-55
	endif 
	m.chkSum = m.chkSum + m.ch*laWeight[i]
next

m.chkSum = m.chkSum % 10
if Val(Right(this.Value,1)) # m.chkSum
	Messagebox("Введен неверный личный номер! Проверьте данные.",48,"Ошибка")
	return 0
endif
