**************************************************************************
*! открытие документа по расширению
**************************************************************************
lparameters tcDocument
Local lnResult, lcMsg

declare integer ShellExecute ;
	in SHELL32 ;
	integer nWinHandle, ;
	string cOperation, ;
	string cFileName, ;
	string cParameters, ;
	string cDirectory, ;
	integer nShowWindow

lnResult=ShellExecute(_Screen.HWnd, "Open", tcDocument, "", Sys(2023), 1)

**Error messages if the return value is < 32
if lnResult < 32
	do case 
	case lnResult=2
		lcMsg = "Invalid association or URL."
	case lnResult=31
		lcMsg = "No association."
	case lnResult=29
		lcMsg = "Can't start application."
	case lnResult=30
		lcMsg ="Application already open."
	endcase
	Messagebox(lcMsg, 48, "Caution")
endif
