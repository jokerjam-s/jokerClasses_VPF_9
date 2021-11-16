**************************************************************************
*! переопределение класса заголовка для исп. сортировочного грида
**************************************************************************
define class Hdr as Header
	Alignment = 2
	WordWrap = .T.
	FontName = 'Tahoma'
	FontSize = 8
	SelfPicture=[]
	
	procedure Init
		this.SelfPicture = this.Picture
	endproc
enddefine

**************************************************************************
*! переопределение класса колонок, для использования сортировочного ГРИДА
**************************************************************************
define class Cln as Column
	TagName=''   && индекс для сортировки поля
	SortState=0  && Состояние сортировки 0 - None, 1-Asc, 2-Desc
	FilterState=0	&& Состояние фильтра 
	ReadOnly=.T.
	SelfTag=.F.
	OrderNo=0
	Filtered=.t.	&& признак использования фильтра на колонку
	Sortable=.t.	&& признак использования сортировки
	QSearched=.t.	&& признак быстрого поиска
 	dimension FRows[1,4]		&& операция, фильр, регистр, условие (И\ИЛИ)
	FRowsCnt=0		&& кол-во условий на колонку
	FUnion=1			&& условие между колонками
	
	_memberdata = [<VFPData>]+;
		[<memberdata name="filtered" type="property" display="Filtered"/>]+;
		[<memberdata name="sortable" type="property" display="Sortable"/>]+;
		[<memberdata name="qsearched" type="property" display="QSearched"/>]+;
		[</VFPData>]

	HeaderClass = 'Hdr'
	HeaderClassLibrary = 'D:\JokerClasses\For VFP_9\Bricks\ClnDef.Prg'

	hidden procedure Enable_Assign
	lparameters vNewVal
		this.Enabled = m.vNewVal
		this.SetAll("Enabled", m.vNewVal)
	endproc

	hidden procedure SortState_Assign
	lparameters m.vNewVal
		this.SortState = m.vNewVal
		this.ColPicture()
	endproc

	hidden procedure FilterState_Assign
	lparameters m.vNewVal
		this.FilterState = m.vNewVal
		this.ColPicture()
	endproc

	hidden procedure FRowsCnt_Assign
	lparameters m.vNewVal
		this.FRowsCnt = m.vNewVal
		this.FilterState = Iif(m.vNewVal=0, 0, 3)
		m.vNewVal = Iif(m.vNewVal=0, 1, m.vNewVal)
		dimension this.FRows[m.vNewVal,4]
		if m.vNewVal=0
			this.FUnion=1
		endif
	endproc

	hidden procedure ColPicture
	local loHdr, lnPictNo

	for each loHdr in this.Objects
		if loHdr.BaseClass = 'Header'
			exit
		endif
	next

	if not PemStatus(_screen, "_FP1",5)
		loHdr.Picture = Iif(PemStatus(loHdr,"SelfPicture",5), loHdr.SelfPicture, "")
		return
	endif
	lnPictNo = this.SortState+this.FilterState
	loHdr.Picture = ICase(m.lnPictNo=1, _screen._FP1.Picture,;
		m.lnPictNo=2, _screen._FP2.Picture,;
		m.lnPictNo=3, _screen._FP3.Picture,;
		m.lnPictNo=4, _screen._FP4.Picture,;
		m.lnPictNo=5, _screen._FP5.Picture,;
		Iif(PemStatus(loHdr,"SelfPicture",5), loHdr.SelfPicture, ""))
	endproc
enddefine
