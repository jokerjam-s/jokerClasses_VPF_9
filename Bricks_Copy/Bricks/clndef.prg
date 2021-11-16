**************************************************************************
*! переопределение класса заголовка для исп. сортировочного грида
**************************************************************************
define class Hdr as Header
	Alignment = 2
	WordWrap = .T.
	FontName = 'Tahoma'
	FontSize = 8
enddefine

**************************************************************************
*! переопределение класса колонок, для использования сортировочного ГРИДА
**************************************************************************
define class Cln as Column
	TagName = ''   && индекс для сортировки поля
	SortState = 0  && Состояние сортировки 0 - None, 1-Asc, 2-Desc
	ReadOnly = .T.
	SelfTag = .F.
	FontName = 'Tahoma'
	FontSize = 8

	HeaderClass = 'Hdr'
	HeaderClassLibrary = 'D:\JokerClasses\For VFP_9\Bricks\ClnDef.Prg'

	hidden procedure SortState_Assign
	lparameters m.vNewVal
	local loHdr as Header

		for each loHdr in this.Objects
			if loHdr.BaseClass = 'Header'
				exit
			endif
		next

		this.SortState = m.vNewVal

		do case
		case m.vNewVal=0			&& нет сортировки
			loHdr.Picture = []
		case m.vNewVal=1			&& по возрастанию
			loHdr.Picture = _screen.__ImgSortAsc.Picture
		otherwise 					&& по убыванию
			loHdr.Picture = _screen.__ImgSortDsc.Picture
		endcase
	endproc
enddefine
