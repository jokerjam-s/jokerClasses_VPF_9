**************************************************************************
*! Copyright by Anjel 
*!
*! Запрос имени файла "Сохранить как"
*! typedef struct tagOFN { 
*!	  DWORD         lStructSize			 0:4  +
*!	  HWND          hwndOwner				 4:4
*!	  HINSTANCE     hInstance				 8:4
*!	  LPCTSTR       lpstrFilter			12:4  +
*!	  LPTSTR        lpstrCustomFilter	16:4
*!	  DWORD         nMaxCustFilter		20:4
*!	  DWORD         nFilterIndex			24:4  +
*!	  LPTSTR        lpstrFile				28:4  +
*!	  DWORD         nMaxFile				32:4  +
*!	  LPTSTR        lpstrFileTitle		36:4
*!	  DWORD         nMaxFileTitle			40:4
*!	  LPCTSTR       lpstrInitialDir		44:4
*!	  LPCTSTR       lpstrTitle				48:4  +
*!	  DWORD         Flags					52:4  +
*!	  WORD          nFileOffset			56:2
*!	  WORD          nFileExtension		58:2
*!	  LPCTSTR       lpstrDefExt			60:4
*!	  LPARAM        lCustData				64:4
*!	  LPOFNHOOKPROC lpfnHook				68:4
*!	  LPCTSTR       lpTemplateName		72:4
*!	  void *        pvReserved				76:4
*!	  DWORD         dwReserved				80:4
*!	  DWORD         FlagsEx					84:4
*!	} OPENFILENAME, *LPOPENFILENAME		Total 88
*! 
*! tnFlag - флаг обработки:
*! 	 1 - проверять правильность допустимость имени файла
*!		 2 - запрос о замене файла
*!	   16 - показать кнопку 'Справка'
*!   512 - диалог в старом стиле
*!  2048 - проверять существование каталога
*!	32768 - не испльзовать R\O файлы
*!
*!	tcFilter - строка отбираемых фильтров
*!	tcWTitle - заголовок окна
*!	tcName   - имя по умолчанию
**************************************************************************
lparameters tnFlag, tcFilter, tcWTitle, tcName

declare long GlobalAlloc in WIN32API long uFlags, Long dwBytes
declare long GlobalFree in WIN32API long hGlobal
declare integer GetSaveFileName in comdlg32 string @lpofn

local lcStruct,lhFilter,lhFile,lcFile,lcResult,lhCFilter,lcCFilter,lhWTitle,lcOldDrive,lcOldPath

if Vartype(tnFlag)<>'N'
	tnFlag = 0
endif

&& сохранить старые текущие 
lcOldDrive = Sys(5)
lcOldPath = Sys(2003)

&& подготовка строки фильтров
if Empty(tcFilter) or Vartype(tcFilter)<>'C'
	tcFilter="Zip архивы"+Chr(0)+"*.zip"+Chr(0)+"Все файлы"+Chr(0)+"*.*"+Chr(0)+Chr(0)
endif
lhFilter = GlobalAlloc(0x0040,Len(tcFilter))
Sys(2600,lhFilter,Len(tcFilter),tcFilter)

&& буфер для имени файла
lcFile = Iif(Empty(tcName),Replicate(Chr(0),512),Padr(tcName,512,Chr(0)))
lhFile = GlobalAlloc(0x0040,512)
Sys(2600,lhFile,512,lcFile)

&& Выбранный фильтр
lcCFilter = Replicate(Chr(0),120)
lhCFilter = GlobalAlloc(0x0040,120)
Sys(2600,lhCFilter,40,lcCFilter)

&& заголовок окна
lhWTitle=0
if Vartype(tcWTitle)='C'
	tcWTitle = tcWTitle+Chr(0)
	lhWTitle = GlobalAlloc(0x0040,Len(tcWTitle))
	Sys(2600, lhWTitle, Len(tcWTitle), tcWTitle)
endif

lcStruct = BinToC(88,[4rs])+BinToC(Application.hWnd,[4rs])+Replicate(Chr(0),4)+BinToC(lhfilter,[4rs])+;
			BinToC(lhCFilter,[4rs])+BinToC(40,[4rs])+BinToC(1,[4rs])+BinToC(lhFile,[4rs])+;
			BinToC(512,[4rs])+Replicate(Chr(0),12)+BinToC(lhWTitle,[4rs])+BinToC(tnFlag,[4rs])+Replicate(Chr(0),40)

if GetSaveFileName(@lcStruct)>0
	lcResult = Strtran(Sys(2600,lhFile,260),Chr(0),"")
	if Right(lcResult,1)='.'
		lcResult=Substr(lcResult,1,Len(lcResult)-1)
	endif
	lcCFilter = Strtran(Sys(2600,lhCFilter,40),Chr(0),"")
	if Empty(JustExt(lcResult)) and JustExt(lcCFilter)<>'*'
		lcResult = lcResult+Iif(Empty(JustExt(lcCFilter)),"","."+JustExt(lcCFilter))
	endif
else
	lcResult = ""
endif

GlobalFree(lhFile)
GlobalFree(lhFilter)
GlobalFree(lhCFilter)
if lhWTitle>0
	GlobalFree(lhWTitle)
endif

set default to (lcOldDrive+lcOldPath)

return lcResult
