********************************************************************************
*!* ctl32_functions.prg
********************************************************************************
#Include "D:\JokerClasses\For VFP_9\ctl32_\ctl32.h"
Set Procedure To Sys(16) Additive
Return

********************************************************************************
*!* ctlClientToScreen(nhWnd, @nX, @nY)
********************************************************************************
*!* Returns client coords x, y translated into screen coords x, y
********************************************************************************
Function ctlClientToScreen(nhWnd, pnX, pnY)

	Local lcPoint, lnRetVal

	lcPoint = BinToC(m.pnX, "4RS") + BinToC(m.pnY, "4RS")
	lnRetVal = apiClientToScreen(m.nhWnd, @m.lcPoint)

	pnX = CToBin(Substr(m.lcPoint , 1, 4), "4RS")
	pnY = CToBin(Substr(m.lcPoint , 5, 4), "4RS")

	Return m.lnRetVal <> 0
Endfunc

********************************************************************************
*!* ctlComRegister(cFileName)
********************************************************************************
*!* Registers a self registering dll or activex
********************************************************************************
Function ctlComRegister(pcFileName)

	Local lnHandle, llRetVal

	llRetVal = FALSE

	lnHandle = apiLoadLibrary(m.pcFileName)

	If m.lnHandle <> 0

		If apiGetProcAddress(m.lnHandle, "DllRegisterServer") <> 0

			Declare Integer DllRegisterServer In (m.pcFileName) ;
				As _2CC11JLUG_DllRegisterServer

			If _2CC11JLUG_DllRegisterServer() = S_OK
				m.llRetVal = TRUE
			Endif

			Clear Dlls _2CC11JLUG_DllRegisterServer
		Endif
		apiFreeLibrary(m.lnHandle)
	Endif
	Return m.llRetVal
Endfunc

********************************************************************************
*!* ctlComUnregister(cFileName)
********************************************************************************
*!* Unregisters a self registering dll or activex
********************************************************************************
Function ctlComUnregister(pcFileName)

	Local lnHandle, llRetVal

	llRetVal = FALSE

	lnHandle = apiLoadLibrary(m.pcFileName)

	If m.lnHandle <> 0

		If apiGetProcAddress(m.lnHandle, "DllRegisterServer") <> 0

			Declare Integer DllUnregisterServer In (m.pcFileName) ;
				As _2CC11JLUG_DllUnregisterServer

			If _2CC11JLUG_DllUnregisterServer() = S_OK
				m.llRetVal = TRUE
			Endif

			Clear Dlls _2CC11JLUG_DllUnregisterServer

		Endif
		apiFreeLibrary(m.lnHandle)
	Endif

Endfunc

********************************************************************************
*!* ctlCToLargeInteger(cLargeInt)
********************************************************************************
*!* Converts a large integer binary value (8 bytes) to a VFP number
********************************************************************************
Function ctlCToLargeInteger(pcLargeInt)

	Local lnLow, lnHigh, lnLargeInt

	lnLow = CToBin(Left(m.pcLargeInt, 4), "4rs")
	lnHigh = CToBin(Right(m.pcLargeInt, 4), "4rs")
	lnLargeInt = ctlLowHighToLargeInteger(m.lnLow, m.lnHigh)

	Return m.lnLargeInt
Endfunc

********************************************************************************
*!* ctlGetOsVersion()
********************************************************************************
*!* Returns the operating system version in a NTDDI format
********************************************************************************
*!* NTDDI version constants
*!* /http://forums.microsoft.com/MSDN/ShowPost.aspx?PostID=2095548&SiteID=1
*!* #define NTDDI_WIN2K                         05000000
*!* #define NTDDI_WIN2KSP1                      05000100
*!* #define NTDDI_WIN2KSP2                      05000200
*!* #define NTDDI_WIN2KSP3                      05000300
*!* #define NTDDI_WIN2KSP4                      05000400

*!* #define NTDDI_WINXP                         05010000
*!* #define NTDDI_WINXPSP1                      05010100
*!* #define NTDDI_WINXPSP2                      05010200
*!* #define NTDDI_WINXPSP3                      05010300
*!* #define NTDDI_WINXPSP4                      05010400

*!* #define NTDDI_WS03                          05020000
*!* #define NTDDI_WS03SP1                       05020100
*!* #define NTDDI_WS03SP2                       05020200
*!* #define NTDDI_WS03SP3                       05020300
*!* #define NTDDI_WS03SP4                       05020400

*!* #define NTDDI_WIN6                          06000000
*!* #define NTDDI_WIN6SP1                       06000100
*!* #define NTDDI_WIN6SP2                       06000200
*!* #define NTDDI_WIN6SP3                       06000300
*!* #define NTDDI_WIN6SP4                       06000400
*!* #define NTDDI_VISTA                         NTDDI_WIN6
*!* #define NTDDI_VISTASP1                      NTDDI_WIN6SP1
*!* #define NTDDI_VISTASP2                      NTDDI_WIN6SP2
*!* #define NTDDI_VISTASP3                      NTDDI_WIN6SP3
*!* #define NTDDI_VISTASP4                      NTDDI_WIN6SP4
*!* #define NTDDI_WS08                          NTDDI_WIN6SP1
*!* #define NTDDI_WS08SP2                       NTDDI_WIN6SP2
*!* #define NTDDI_WS08SP3                       NTDDI_WIN6SP3
*!* #define NTDDI_WS08SP4                       NTDDI_WIN6SP4
*!* #define NTDDI_LONGHORN  					NTDDI_VISTA
********************************************************************************
Function ctlGetOsVersion()
	Return Val(Os(3)) * 1000000 + Val(Os(4)) * 10000 + Val(Os(8)) * 100 + Val(Os(9))
Endfunc

********************************************************************************
*!* ctlGetCaretPos(@nX, @nY)
********************************************************************************
*!* Returns the position of the caret in CLIENT coordinates.
********************************************************************************
Function ctlGetCaretPos(pnX, pnY)

	Local lcPoint, lnRetVal

	lcPoint = 0h0000000000000000
	lnRetVal = apiGetCaretPos(@m.lcPoint)
	pnX = CToBin(Substr(m.lcPoint, 1, 4), "4RS")
	pnY = CToBin(Substr(m.lcPoint, 5, 4), "4RS")
	Return m.lnRetVal <> 0
Endfunc

********************************************************************************
*!* ctlGetCaretPosX()
********************************************************************************
*!* Returns the X coordinate of the caret position in CLIENT coordinates
********************************************************************************
Function ctlGetCaretPosX()

	Local lcPoint

	lcPoint = 0h0000000000000000
	apiGetCaretPos(@m.lcPoint)
	Return CToBin(Substr(m.lcPoint, 1, 4), "4RS")
Endfunc

********************************************************************************
*!* ctlGetCaretPosY()
********************************************************************************
*!* Returns the Y coordinate of the caret position in CLIENT coordinates
********************************************************************************
Function ctlGetCaretPosY()

	Local lcPoint

	lcPoint = 0h0000000000000000
	apiGetCaretPos(@m.lcPoint)
	Return CToBin(Substr(m.lcPoint, 5, 4), "4RS")
Endfunc

********************************************************************************
*!* ctlGetCursorPos(@nX, @nY)
********************************************************************************
*!* Returns the position of the mouse cursor in SCREEN coordinates.
********************************************************************************
Function ctlGetCursorPos(pnX, pnY)

	Local lcPoint, lnRetVal

	lcPoint = 0h0000000000000000
	lnRetVal = apiGetCursorPos(@m.lcPoint)
	pnX = CToBin(Substr(m.lcPoint, 1, 4), "4RS")
	pnY = CToBin(Substr(m.lcPoint, 5, 4), "4RS")
	Return m.lnRetVal <> 0
Endfunc

********************************************************************************
*!* ctlGetCursorPosX()
********************************************************************************
*!* Returns the x coordinate position of the mouse cursor in SCREEN coordinates.
********************************************************************************
Function ctlGetCursorPosX()

	Local lcPoint

	lcPoint = 0h0000000000000000
	apiGetCursorPos(@m.lcPoint)
	Return CToBin(Substr(m.lcPoint, 1, 4), "4RS")
Endfunc

********************************************************************************
*!* ctlGetCursorPosY()
********************************************************************************
*!* Returns the y coordinate position of the mouse cursor in SCREEN coordinates.
********************************************************************************
Function ctlGetCursorPosY()

	Local lcPoint

	lcPoint = 0h0000000000000000
	apiGetCursorPos(@m.lcPoint)
	Return CToBin(Substr(m.lcPoint, 5, 4), "4RS")
Endfunc

********************************************************************************
*!* ctlHiMetricToPixelsX(nHiMetricX)
********************************************************************************
*!* :http://www.experts-exchange.com/Programming/Languages/Visual_Basic/Q_20024530.html
*!*	HIMETRIC / 2540 = INCHES
*!*	INCHES * 1440 = TWIPS
*!*	TWIPS / TwipsPerPixel = PIXELS
********************************************************************************
Function ctlHiMetricToPixelsX(pnHiMetricX)
	Return Round(m.pnHiMetricX / 2540 * 1440 / ctlTwipsPerPixelX(), 0)
Endfunc

********************************************************************************
*!* :http://www.experts-exchange.com/Programming/Languages/Visual_Basic/Q_20024530.html
*!*	HIMETRIC / 2540 = INCHES
*!*	INCHES * 1440 = TWIPS
*!*	TWIPS / TwipsPerPixel = PIXELS
********************************************************************************
Function ctlHiMetricToPixelsY(pnHiMetricY)
	Return Round(m.pnHiMetricY / 2540 * 1440 / ctlTwipsPerPixelY(), 0)
Endfunc

********************************************************************************
*!* ctlIsObjectInPage(oControl)
********************************************************************************
*!* Determines if a control is contained in a page somewhere
*!* along its object hierarchy
********************************************************************************
Function ctlIsObjectInPage(poControl)

	Local llIsInPage, loControl

	llIsInPage = FALSE

	loControl = m.poControl
	Do While Inlist(Upper(m.loControl.BaseClass), "FORM", "TOOLBAR") = FALSE
		If Upper(m.loControl.BaseClass) == "PAGE"
			llIsInPage = TRUE
			Exit
		Endif
		loControl = m.loControl.Parent
	Enddo
	loControl = Null
	poControl = Null

	Return m.llIsInPage
Endfunc

********************************************************************************
Function ctlIsThemeActive(poObject)
	If Vartype(m.poObject) = T_OBJECT

		Local loForm, llFormThemeActive, llControlThemeActive

		*!* Get theme status of object:
		Do Case
			Case Pemstatus(m.poObject, "ctlThemes", CON_PEMSTAT_DEFINED)
				llControlThemeActive = m.poObject.ctlThemes
			Case Pemstatus(m.poObject, "Themes", CON_PEMSTAT_DEFINED)
				llControlThemeActive = m.poObject.Themes
			Otherwise
				llControlThemeActive = TRUE
		Endcase

		*!* Get theme status of parent form
		loForm = m.poObject

		Do While Inlist(Upper(m.loForm.BaseClass), "FORM", "TOOLBAR") = FALSE
			loForm = m.loForm.Parent
		Enddo

		llFormThemeActive = m.loForm.Themes

		loForm = Null
		poObject = Null

		Return apiIsThemeActive() = 1 And _Screen.Themes And m.llFormThemeActive And m.llControlThemeActive
	Else
		Return apiIsThemeActive() <> 0
	Endif
Endfunc

********************************************************************************
*!* Allocates a block of memory of m.pnBytes
*!* Returns a handle to the allocated memory
*!* Must be freed after use
********************************************************************************
Function ctlMemAlloc(pnBytesToAllocate)
	Return apiHeapAlloc(apiGetProcessHeap(), HEAP_ZERO_MEMORY, m.pnBytesToAllocate)
Endfunc

********************************************************************************
*!* Frees a block of memory allocated with ctlMemAlloc
********************************************************************************
Function ctlMemFree(pnMem)
	Return apiHeapFree(apiGetProcessHeap(), 0, m.pnMem)
Endfunc

********************************************************************************
*!* Reads from a memory handle exactly m.pnBytes
********************************************************************************
Function ctlMemRead(pnMem, pnBytesToRead)
	If Vartype(m.pnMem) <> T_NUMERIC Or m.pnMem <= 0
		Return ""
	Endif
	If Vartype(m.pnBytesToRead) <> T_NUMERIC Or m.pnBytesToRead <= 0
		m.pnBytesToRead = apiHeapSize(apiGetProcessHeap(), 0, m.pnMem)
	Endif
	Return Sys(2600, m.pnMem, m.pnBytesToRead)
Endfunc

********************************************************************************
*!* Returns the size of a block of memory allocated with ctlMemAlloc
*!* Returns -1 on failure
********************************************************************************
Function ctlMemSize(pnMem)
	Return apiHeapSize(apiGetProcessHeap(), 0, m.pnMem)
Endfunc

********************************************************************************
*!* Writes to a memory heap handle, m.pnBytes of m.pcData
*!* pads with NULAs if len(m.pcData) < m.pnBytes
********************************************************************************
Function ctlMemWrite(pnMem, pcData, pnBytesToWrite)
	If Vartype(m.pcData) = T_NUMERIC
		pcData = BinToC(m.pcData, "4rs")
	Endif
	If Vartype(m.pnBytesToWrite) = T_NUMERIC And m.pnBytesToWrite > Len(m.pcData)
		pcData = m.pcData + Replicate(NULCHAR, m.pnBytesToWrite - Len(m.pcData))
	Else
		pnBytesToWrite = Len(m.pcData)
	Endif
	If m.pnMem = 0
		pnMem = ctlMemAlloc(m.pnBytesToWrite)
	Endif
	pcData = Sys(2600, m.pnMem, m.pnBytesToWrite, m.pcData)
	Return m.pnMem
Endfunc

********************************************************************************
*!* converts an integer to an unsigned integer
********************************************************************************
Function ctlIntegerToUnsigned(pnValue)
	Local lnRetVal

	If m.pnValue < 0
		lnRetVal = m.pnValue + 4294967296
	Else
		lnRetVal = m.pnValue
	Endif

	Return m.lnRetVal
Endfunc

********************************************************************************
*!* pcValueToReturn can be: T, B, L, R for Top, Bottom, Left, Right
*!* This replaces OBJTOCLIENT that has bugs with pageframes
********************************************************************************
Function ctlObjToClient(poControl, pcValueToReturn)

	Local lnPosition

	pcValueToReturn = Upper(m.pcValueToReturn)
	lnPosition = 0

	Do Case

		Case m.pcValueToReturn $ "TB"
			*!* 20070711 Modified to account for toolbars
			Do While Inlist(Upper(m.poControl.BaseClass), "FORM", "TOOLBAR") = FALSE
				If Pemstatus(m.poControl, "Top", CON_PEMSTAT_DEFINED)
					lnPosition = m.lnPosition + m.poControl.Top
				Endif
				If Upper(m.poControl.BaseClass) == "PAGE"
					If m.poControl.Parent.TabOrientation = CON_TABOR_TOP	&& Top
						lnPosition = m.lnPosition + ;
							poControl.Parent.Height - ;
							poControl.Parent.PageHeight - ;
							poControl.Parent.BorderWidth * 2
					Else
						lnPosition = m.lnPosition + 1
					Endif
				Endif
				poControl = m.poControl.Parent
			Enddo

			If m.pcValueToReturn == "B"
				lnPosition = m.lnPosition + This.Height
			Endif

		Case m.pcValueToReturn $ "LR"
			*!* 20070711 Modified to account for toolbars
			Do While Inlist(Upper(m.poControl.BaseClass), "FORM", "TOOLBAR") = FALSE
				If Pemstatus(m.poControl, "Left", CON_PEMSTAT_DEFINED)
					lnPosition = m.lnPosition + m.poControl.Left
				Endif
				If Upper(m.poControl.BaseClass) == "PAGE"
					If m.poControl.Parent.TabOrientation = CON_TABOR_LEFT	&& Left
						lnPosition = m.lnPosition + ;
							poControl.Parent.Width - ;
							poControl.Parent.PageWidth - ;
							poControl.Parent.BorderWidth * 2
					Else
						lnPosition = m.lnPosition + 1
					Endif
				Endif
				poControl = m.poControl.Parent
			Enddo

			If m.pcValueToReturn == "R"
				lnPosition = m.lnPosition + This.Width
			Endif

	Endcase

	Return m.lnPosition
Endfunc

*!* * Inverse of VFP's DTOS() function.
Function ctlSTOD(pcDate)
	Local m.ldDate As Date
	ldDate = Date(Val(Substr(m.pcDate,1,4)), Val(Substr(m.pcDate,5,2)), Val(Substr(m.pcDate,7,2)))
	Return m.ldDate
Endfunc

********************************************************************************
*!* Converts a numeric value into a string that represents the number expressed
*!* as a size value in bytes, kilobytes, megabytes, or gigabytes, depending on the size.
*!* API StrFormatByteSize only work for files up to 4GB
*!*	Local ;
*!*		m.lcBuffer As String
*!*	m.lcBuffer = Space(254)
*!*	StrFormatByteSize(m.pnSizeInBytes, @m.lcBuffer, Len(m.lcBuffer))
*!*	* Remove NUL CHAR
*!*	m.lcBuffer = Left(m.lcBuffer, At(NULA, m.lcBuffer) - 1)
*!*	Return m.lcBuffer
********************************************************************************
Function ctlStrFormatByteSize(pnSizeInBytes)
	Local lnSize, lcUnit

	Do Case
		Case m.pnSizeInBytes < 999					&& Bytes
			lnSize = m.pnSizeInBytes
			lcUnit = " Bytes"
		Case m.pnSizeInBytes < 1024^1 * 999			&& KiloBytes
			lnSize = m.pnSizeInBytes / 1024^1
			lcUnit = " KB"
		Case m.pnSizeInBytes < 1024^2 * 999			&& MegaBytes
			lnSize = m.pnSizeInBytes / 1024^2
			lcUnit = " MB"
		Case m.pnSizeInBytes < 1024^3 * 999			&& GigaBytes
			lnSize = m.pnSizeInBytes / 1024^3
			lcUnit = " GB"
		Otherwise
			lnSize = m.pnSizeInBytes / 1024^4		&& TeraBytes
			lcUnit = " TB"
	Endcase

	Do Case
		Case m.lnSize > 100
			lnSize = Round(m.lnSize , 0)
		Case m.lnSize > 10
			lnSize = Round(m.lnSize , 1)
		Otherwise
			lnSize = Round(m.lnSize , 2)
	Endcase

	Return Transform(m.lnSize) + m.lcUnit
Endfunc

********************************************************************************
Function ctlStrFormatSeconds(pnSeconds)

	pnSeconds = Round(m.pnSeconds, 0)

	Local lcHours, lcMinutes, lcSeconds

	If Int(m.pnSeconds / 3600) > 0
		lcHours 	= Padl(Alltrim(Str(Int(m.pnSeconds / 3600))), 2, "0") + ":"
	Else
		lcHours   = ""
	Endif

	lcMinutes = Padl(Alltrim(Str(Int((m.pnSeconds % 3600) / 60))), 2, "0") + ":"
	lcSeconds = Padl(Alltrim(Str((m.pnSeconds % 3600) % 60)), 2, "0")

	Return m.lcHours +  m.lcMinutes +  m.lcSeconds
Endfunc

********************************************************************************
*!* Converts an unsigned integer to an integer.
********************************************************************************
Function ctlUnsignedToInteger(pnValue)

	Local lnRetVal

	If m.pnValue <= 2147483647
		lnRetVal = m.pnValue
	Else
		lnRetVal= m.pnValue - 4294967296
	Endif

	Return m.lnRetVal
Endfunc

********************************************************************************
Function ctlFClose(pnFileHandle)

	Local lnApiRetVal, llRetVal

	lnApiRetVal = apiCloseHandle(m.pnFileHandle)

	If m.lnApiRetVal = 0
		llRetVal = FALSE
	Else
		llRetVal = TRUE
	Endif

	Return m.llRetVal
Endfunc

********************************************************************************
*!* ctlFgets(nFileHandle [, nBytes])
********************************************************************************
*!* Returns a series of bytes from a file or a communication port opened with a
*!* low-level file function until it encounters a carriage return.
********************************************************************************
Function ctlFGets(m.pnFileHandle As Integer, m.pnBytesToRead As Integer)

	Local lcByteString, lnBytesRead, lnApiRetVal, lnOverlapped, lnCrLfPos, lnOffset

	If Vartype(m.pnBytesToRead) <> T_NUMERIC
		pnBytesToRead = 254
	Endif

	lnBytesRead = 0
	lcByteString = Space(m.pnBytesToRead)
	lnOverlapped = 0

	lnApiRetVal = apiReadFile(m.pnFileHandle, ;
		@m.lcByteString, ;
		m.pnBytesToRead , ;
		@m.lnBytesRead , ;
		m.lnOverlapped)

	If m.lnApiRetVal = 0
		lcByteString = ""
	Else
		lcByteString = Left(m.lcByteString, m.lnBytesRead)
	Endif

	*!* Now search for CRLF in the string:
	lnCrLfPos = At(CRLF, m.lcByteString)

	*!* if we find a CRLF in the string
	If m.lnCrLfPos <> 0

		*!* Set file pointer for next read to after CRLF
		lnOffset = (m.lnBytesRead - m.lnCrLfPos - 1) * (-1)
		ctlFSeek(m.pnFileHandle, m.lnOffset , 1)

		*!* Remove trailing characters after CRLF
		lcByteString = Left(m.lcByteString, m.lnCrLfPos - 1)
	Endif

	Return m.lcByteString
Endfunc

********************************************************************************
Function ctlFileTimeToDateTime(poFileTime)

	Local loSystemTime, lcSystemTime, lcFileTime, ltFileDateTime

	loSystemTime = Createobject("ctlSystemTime")
	lcSystemTime = m.loSystemTime.Value
	lcFileTime = m.poFileTime.Value

	If apiFileTimeToSystemTime(@m.lcFileTime, @m.lcSystemTime) = 1
		With m.loSystemTime
			.Value = m.lcSystemTime
			ltFileDateTime = Datetime(.wYear, .wMonth, .wDay, .wHour, .wMinute, .wSecond)
		Endwith
	Else
		ltFileDateTime = Ctot("")
	Endif

	loSystemTime = Null

	Return m.ltFileDateTime
Endfunc

********************************************************************************
Function ctlFontHeightToPoints(pnHeight)

	Local lnDc, lnLogPixelsY

	lnDc = apiGetDC(HWND_DESKTOP)
	lnLogPixelsY = apiGetDeviceCaps(m.lnDc, LOGPIXELSY)
	apiReleaseDC(HWND_DESKTOP, m.lnDc)
	Return Round(72 * m.pnHeight / m.lnLogPixelsY * (-1), 0)
Endfunc

********************************************************************************
Function ctlFontPointsToHeight(pnPoints)

	Local lnDc, lnLogPixelsY

	lnDc = apiGetDC(HWND_DESKTOP)
	lnLogPixelsY = apiGetDeviceCaps(m.lnDc, LOGPIXELSY)
	apiReleaseDC(HWND_DESKTOP, m.lnDc)
	Return apiMulDiv(m.pnPoints, m.lnLogPixelsY, 72) * (-1)
Endfunc

********************************************************************************
*!* ctlFopen(cFilename [, nAttribute])
********************************************************************************
*!*  0 READ-ONLY	BUFFERED
*!*  1 WRITE-ONLY	BUFFERED
*!*  2 READ-WRITE	BUFFERED
*!* 10 READ-ONLY	UNBUFFERED
*!* 11 WRITE-ONLY	UNBUFFERED
*!* 12 READ-WRITE	UNBUFFERED
********************************************************************************
Function ctlFOpen(pcFileName, pnAttribute)

	Local lcFilename, lnDesiredAccess, lnShareMode, lnSecurityAttributes, lnCreationDisposition,;
		lnFlagsAndAttributes, lnTemplateFile, lnBufferFlag, lnFileHandle

	lcFilename = Alltrim(m.pcFileName)

	If Vartype(m.pnAttribute) <> T_NUMERIC
		pnAttribute = 0
	Endif

	Do Case
		Case m.pnAttribute = 0
			lnDesiredAccess = GENERIC_READ
			lnBufferFlag = 0
		Case m.pnAttribute = 1
			lnDesiredAccess = GENERIC_WRITE
			lnBufferFlag = 0
		Case m.pnAttribute = 2
			lnDesiredAccess = Bitor(GENERIC_READ, GENERIC_WRITE)
			lnBufferFlag = 0
		Case m.pnAttribute = 10
			lnDesiredAccess = GENERIC_READ
			lnBufferFlag = FILE_FLAG_WRITE_THROUGH
		Case m.pnAttribute = 11
			lnDesiredAccess = GENERIC_WRITE
			lnBufferFlag = FILE_FLAG_WRITE_THROUGH
		Case m.pnAttribute = 12
			lnDesiredAccess = Bitor(GENERIC_READ, GENERIC_WRITE)
			lnBufferFlag = FILE_FLAG_WRITE_THROUGH
		Otherwise
			lnDesiredAccess = GENERIC_READ
			lnBufferFlag = 0
	Endcase

	lnShareMode = 0
	lnSecurityAttributes = 0
	lnCreationDisposition = OPEN_EXISTING
	lnFlagsAndAttributes = Bitor(FILE_ATTRIBUTE_NORMAL, m.lnBufferFlag)
	lnTemplateFile = 0

	lnFileHandle = apiCreateFile( ;
		m.lcFilename, ;
		m.lnDesiredAccess, ;
		m.lnShareMode, ;
		m.lnSecurityAttributes, ;
		m.lnCreationDisposition, ;
		m.lnFlagsAndAttributes, ;
		m.lnTemplateFile)

	Return m.lnFileHandle
Endfunc

********************************************************************************
Function ctlFRead(pnFileHandle, pnBytesToRead)

	Local lcByteString, lnBytesRead, lnApiRetVal, lnOverlapped

	lnBytesRead = 0
	lcByteString = Space(m.pnBytesToRead)
	lnOverlapped = 0

	lnApiRetVal = apiReadFile(m.pnFileHandle, ;
		@m.lcByteString, ;
		m.pnBytesToRead , ;
		@m.lnBytesRead , ;
		m.lnOverlapped)

	If m.lnApiRetVal = 0
		lcByteString = ""
	Else
		lcByteString = Left(m.lcByteString, m.lnBytesRead)
	Endif

	Return m.lcByteString
Endfunc

********************************************************************************
*!* _Fseek(nFileHandle, nBytesMoved ", nRelativePosition")
*!*	#DEFINE FILE_BEGIN								0
*!*	#DEFINE FILE_CURRENT							1
*!*	#DEFINE FILE_END								2
*!*	#DEFINE INVALID_SET_FILE_POINTER				-1
********************************************************************************
Function ctlFSeek(pnFileHandle, pnBytesMoved, pnRelativePosition)

	Local lnLow, lnHigh, lcNewFilePointer, lnNewFilePointer, lnApiRetVal

	If Vartype(m.pnRelativePosition) <> T_NUMERIC
		pnRelativePosition = 0
	Endif

	*!* Split large integer into low unsigned and high signed

	lnLow = 0
	lnHigh = 0
	ctlLargeIntegerToLowHigh(m.pnBytesMoved, @m.lnLow, @m.lnHigh)

	lcNewFilePointer = Replicate(NULCHAR, 8)

	lnApiRetVal = ;
		apiSetFilePointerEx( ;
		m.pnFileHandle , ;
		m.lnLow , ;
		m.lnHigh, ;
		@m.lcNewFilePointer, ;
		m.pnRelativePosition )

	If m.lnApiRetVal = 0
		lnNewFilePointer = -1
	Else
		lnNewFilePointer = ctlCToLargeInteger(m.lcNewFilePointer)
	Endif

	Return m.lnNewFilePointer
Endfunc

********************************************************************************
*!* ctlFSize(cFilename|nFileHandle)
********************************************************************************
Function ctlFSize(puFnameOrFhandle)

	Local lnFileSize, llCloseFile, lnFileHandle, lcLargeInt, lnApiRetVal

	lnFileSize = -1
	lnFileHandle = HFILE_ERROR
	llCloseFile = FALSE

	Do Case
		Case Vartype(m.puFnameOrFhandle) = T_NUMERIC
			lnFileHandle = m.puFnameOrFhandle

		Case Vartype(m.puFnameOrFhandle) = T_CHARACTER
			llCloseFile = TRUE
			lnFileHandle = ctlFOpen(m.puFnameOrFhandle, 0)

		Otherwise
			Return m.lnFileSize
	Endcase

	If m.lnFileHandle <> HFILE_ERROR

		lcLargeInt = Replicate(NULCHAR, 8)
		lnApiRetVal = apiGetFileSizeEx(m.lnFileHandle, @m.lcLargeInt)

		If m.lnApiRetVal <> 0
			lnFileSize = ctlCToLargeInteger(m.lcLargeInt)
		Endif
	Endif

	*!* Close file
	If m.llCloseFile = TRUE
		ctlFClose(m.lnFileHandle)
	Endif

	Return m.lnFileSize
Endfunc

********************************************************************************
*!* ctlFwrite(nFileHandle, cExpression [, nCharactersWritten])
********************************************************************************
Function ctlFWrite(pnFileHandle, pcExpression, pnCharactersWritten)

	Local lnBytesWritten, lnOverlapped, lnApiRetVal

	lnBytesWritten = 0
	lnOverlapped = 0

	If Vartype(m.pnCharactersWritten) <> T_NUMERIC
		pnCharactersWritten = Len(m.pcExpression)
	Endif

	lnApiRetVal = apiWriteFile(m.pnFileHandle, ;
		m.pcExpression, ;
		m.pnCharactersWritten , ;
		@m.lnBytesWritten, ;
		m.lnOverlapped)

	Return m.lnBytesWritten
Endfunc

********************************************************************************
Function ctlLargeIntegerToC(pnLargeInt)

	Local lnLow, lnHigh, lcLargeInt

	lnLow  = 0
	lnHigh = 0

	ctlLargeIntegerToLowHigh(m.pnLargeInt, @m.lnLow, @m.lnHigh)
	lcLargeInt = BinToC(m.lnLow, "4rs") + BinToC(m.lnHigh, "4rs")
	Return m.lcLargeInt
Endfunc

********************************************************************************
*!* ctlLargeIntegerToLowHigh(nLargeInt, @nLow, @nHigh)
********************************************************************************
Function ctlLargeIntegerToLowHigh(pnLargeInt, lnLow, lnHigh)

	lnLow  = m.pnLargeInt % 2^32
	lnHigh = Int((m.pnLargeInt - m.lnLow) / 2^32)

	If m.lnLow < 0
		lnLow = m.lnLow + 2^32
	Endif

	Return
Endfunc

********************************************************************************
Function ctlLowHighToLargeInteger(pnLow, pnHigh)

	Local lnLargeInt

	If m.pnLow < 0
		pnLow = m.pnLow + 2^32
	Endif
	lnLargeInt = m.pnLow + m.pnHigh * 2^32

	Return m.lnLargeInt
Endfunc

********************************************************************************
*!* ctlGetLangId
********************************************************************************
*!* pnLocale could be LOCALE_USER_DEFAULT, LOCALE_SYSTEM_DEFAULT
*!* /http://msdn.microsoft.com/library/default.asp?url=/library/en-us/intl/nls_34rz.asp
*!* /http://msdn.microsoft.com/library/default.asp?url=/library/en-us/intl/nls_8xo3.asp
*!* /http://msdn.microsoft.com/library/default.asp?url=/library/en-us/intl/nls_61df.asp
*!* Sets the value of strings that are language dependant.
********************************************************************************
Function ctlGetLangId(pnLocale, pnWhatToReturn)

	Local lnLocale, lcLocaleInfo, lnCharsRet, lnLangID, lnPrimaryLangID, lnSubLangID, lnRetVal

	If Pcount() > 0 .And. Vartype(m.pnLocale) = T_NUMERIC
		lnLocale = m.pnLocale
	Else
		lnLocale = LOCALE_SYSTEM_DEFAULT
	Endif

	lcLocaleInfo = Replicate(NULCHAR, 5)
	lnCharsRet = apiGetLocaleInfo(m.pnLocale , LOCALE_ILANGUAGE, @m.lcLocaleInfo, Len(m.lcLocaleInfo))
	*!* remove nul chars
	lcLocaleInfo = Strtran(m.lcLocaleInfo, NULCHAR, "")
	*!* m.lcLocaleInfo is now a character representation of a hex number
	lnLangID = Evaluate("0x" + m.lcLocaleInfo)
	*!*	m.lnPrimaryLangID = Bitand(m.lnLangID, 0x3FF)
	*!*	m.lnSubLangID = Bitrshift(m.lnLangID, 10)

	Do Case
		Case Pcount() < 2 Or m.pnWhatToReturn = 1
			lnRetVal =  m.lnLangID
		Case m.pnWhatToReturn = 2
			lnRetVal =  Bitand(m.lnLangID, 0x3FF)
		Case m.pnWhatToReturn = 3
			lnRetVal =  Bitrshift(m.lnLangID, 10)
		Otherwise
			lnRetVal =  m.lnLangID
	Endcase

	Return m.lnRetVal
Endfunc

********************************************************************************
*!* pnLocale could be LOCALE_USER_DEFAULT, LOCALE_SYSTEM_DEFAULT
********************************************************************************
Function ctlGetPrimaryLangID(pnLocale)
	Return ctlGetLangId(m.pnLocale, 2)
Endfunc

********************************************************************************
*!* Returns the height of a certain string in the font selected into a hwnd
********************************************************************************
Function ctlGetStringHeightFromHwnd(pcString, pnHwnd)

	Local lnDc, lnHeight, lnWidth, lcSize, lnFont, lnPrevFont

	*!* Get font
	lnFont = apiSendMessage(m.pnHwnd, WM_GETFONT, 0, 0)
	*!* Get DC
	lnDc = apiGetDC(m.pnHwnd)
	*!* Apply font to DC, we get previous font as result
	lnPrevFont = apiSelectObject(m.lnDc, m.lnFont)

	lcSize = Space(8)

	apiGetTextExtentPoint32(m.lnDc, m.pcString, Len(m.pcString), @ m.lcSize)

	lnWidth = CToBin(Substr(m.lcSize, 1, 4), "4RS")	&& Width
	lnHeight = CToBin(Substr(m.lcSize, 5, 4), "4RS")	&& Height

	*!* Restore previous font
	apiSelectObject(m.lnDc, m.lnPrevFont )

	*!* Release DC
	apiReleaseDC(m.pnHwnd, m.lnDc)

	Return m.lnWidth
Endfunc

Function ctlGetStringWidthFromHwnd(lcString, lnHwnd)
Endfunc

********************************************************************************
*!* pnLocale could be LOCALE_USER_DEFAULT, LOCALE_SYSTEM_DEFAULT
********************************************************************************
Function ctlGetSubLangID(pnLocale)
	Return ctlGetLangId(m.pnLocale, 3)
Endfunc

********************************************************************************
Function ctlGetPrimaryLangIDFromLangID(pnLangID)
	Return Bitand(m.pnLangID, 0x3FF)
Endfunc

********************************************************************************
Function ctlGetSubLangIDFromLangID(pnLangID)
	Return Bitrshift(m.pnLangID, 10)
Endfunc

********************************************************************************
*!* ctlGetHostHWnd(Object)
********************************************************************************
*!* Returns the HWnd of the form that contains an object, if any
*!* If the object has no parent, returns _VFP.HWnd
*!* If the form is a top level form or has scrollbars,
*!* returns the HWnd of the inner window.
*!* Parameter can be a form, toolbar or control
********************************************************************************
Function ctlGetHostHWnd(poObject)

	Local m.nhWnd As Integer

	*!* Check if we already have a form or toolbar:
	If Inlist(Upper(m.poObject.BaseClass), "FORM", "TOOLBAR")
		nhWnd = m.poObject.HWnd
	Else
		*!* Check if object is contained in another object:
		If Type("m.poObject.Parent") = T_UNDEFINED
			nhWnd = _vfp.HWnd
		Else
			*!* Get first parent:
			poObject = m.poObject.Parent

			*!* Traverse object hierarchy upwards until we find an object with a HWnd:
			Do While Pemstatus(m.poObject, "HWnd", 5) = FALSE
				If Type("m.poObject.Parent") = T_UNDEFINED
					nhWnd = _vfp.HWnd
					Exit
				Else
					poObject = m.poObject.Parent
				Endif
			Enddo
			nhWnd = m.poObject.HWnd
		Endif
	Endif

	*!* If we have a form, and the form is a top level form, or it has scrollbars,
	*!* get hWnd of inner window:
	If Upper(m.poObject.BaseClass) = "FORM"
		If m.poObject.ShowWindow = 2 Or m.poObject.ScrollBars > 0
			*!* Get hWnd of client window of Top Level Form //Craig Boyd//
			If Version(CON_VER_NUM) >= 900
				nhWnd = Sys(2327, Sys(2325, Sys(2326, m.poObject.HWnd)))
			Else
				nhWnd = apiGetWindow(m.poObject.HWnd, GW_CHILD)
			Endif
		Endif
	Endif

	m.poObject = Null
	Release m.poObject

	Return m.nhWnd
Endfunc

********************************************************************************
*!* ctlGetHostHWnd()
*!* Returns the HWnd of a form, or the HWnd of the inner window in case of
*!* top level forms or forms with scrollbars
*!* Parameter can be a form, toolbar or control
********************************************************************************
Function ctlGetHostHWnd(poObject)

	Local loForm, nhWnd

	*!* traverse the object hierarchy until we find the form:
	*!* Modified 20070603 to check for toolbars
	Do While Inlist(Upper(m.poObject.BaseClass), "FORM", "TOOLBAR") = FALSE
		poObject = m.poObject.Parent
	Enddo

	loForm = m.poObject
	poObject = Null
	nhWnd = m.loForm.HWnd

	*!* If the form is a top level form, or it has scrollbars, get hWnd of inner window:
	If Upper(m.loForm.BaseClass) = "FORM"
		If m.loForm.ShowWindow = 2 Or m.loForm.ScrollBars > 0
			*!* Get hWnd of client window of Top Level Form //Craig Boyd//
			If Version(CON_VER_NUM) >= 900
				nhWnd = Sys(2327, Sys(2325, Sys(2326, m.loForm.HWnd)))
			Else
				nhWnd = apiGetWindow(m.loForm.HWnd, GW_CHILD)
			Endif
		Endif
	Endif

	m.loForm = Null

	Return m.nhWnd
Endfunc

********************************************************************************
*!*	int GET_X_LPARAM(
*!*	    LPARAM lParam
*!*	);
*!*	Parameters
*!*	lParam
*!*	Specifies the value to be converted.
*!*	Return Value
*!*	The return value is the low-order int of the specified value.
********************************************************************************
Function ctlGet_X_lParam(pnlParam)
	Return Bitand(m.pnlParam, 0xFFFF)
Endfunc

********************************************************************************
Function ctlGetXFromLparam(pnlParam)
	Return Bitand(m.pnlParam, 0xFFFF)
Endfunc

********************************************************************************
*!*	int GET_Y_LPARAM(
*!*	    LPARAM lParam
*!*	);
*!*	Parameters
*!*	lParam
*!*	Specifies the value to be converted.
*!*	Return Value
*!*	The return value is the high-order int of the specified value.
********************************************************************************
Function ctlGet_Y_lParam(pnlParam)
	Return Bitrshift(m.pnlParam, 16)		&& Bitand(Int(m.pnlParam / 0x10000), 0xFFFF)
Endfunc

********************************************************************************
Function ctlGetUserName
	Local lcBuffer, lnBufferLen
	lcBufferLen = UNLEN + 1
	lcBuffer = Replicate(NULCHAR, m.lcBufferLen)
	apiGetUserName(@m.lcBuffer, @m.lcBufferLen)
	Return Left(m.lcBuffer, m.lcBufferLen - 1)
Endfunc

********************************************************************************
Function ctlGetYFromLparam(pnlParam)
	Return Bitrshift(m.pnlParam, 16)		&& Bitand(Int(m.pnlParam / 0x10000), 0xFFFF)
Endfunc

********************************************************************************
Function ctlGetWindowProcedure(pnHwnd)
	If Empty(m.pnHwnd)
		pnHwnd = _vfp.HWnd
	Endif
	Return apiGetWindowLong(m.pnHwnd, GWL_WNDPROC)
Endfunc

********************************************************************************
*!*	BYTE HIBYTE(
*!*	Word wValue
*!*	);
*!*	Parameters
*!*	wValue
*!*	Specifies the Value To be converted.
*!*	Return Value
*!*	the Return Value Is the High-Order BYTE Of the specified Value.
********************************************************************************
Function ctlHiByte(pnlParam)
	Return Bitrshift(m.pnlParam, 8)		&& Bitand(Int(m.pnlParam / 0x10000), 0xFFFF)
Endfunc

********************************************************************************
*!*	BYTE LOBYTE(
*!*	Word wValue
*!*	);
*!*	Parameters
*!*	wValue
*!*	Specifies the Value To be converted.
*!*	Return Value
*!*	the Return Value Is the low-Order BYTE Of the specified Value.
********************************************************************************
Function ctlLoByte(pnlParam)
	Return Bitand(m.pnlParam , 0xFF)
Endfunc

********************************************************************************
*!*	Word HIWORD(
*!*	DWORD dwValue
*!*	);
*!*	Parameters
*!*	dwValue
*!*	Specifies the Value To be converted.
*!*	Return Value
*!*	the Return Value Is the High-Order Word Of the specified Value.
********************************************************************************
Function ctlHiWord(pnlParam)
	Return Bitrshift(m.pnlParam, 16)		&& Bitand(Int(m.pnlParam / 0x10000), 0xFFFF)
Endfunc

********************************************************************************
*!*	Word LOWORD(
*!*	DWORD dwValue
*!*	);
*!*	Parameters
*!*	dwValue
*!*	Specifies the Value To be converted.
*!*	Return Value
*!*	the Return Value Is the low-Order Word Of the specified Value.
********************************************************************************
Function ctlLoWord(pnlParam)
	Return Bitand(m.pnlParam, 0xFFFF)
Endfunc

********************************************************************************
*!*	DWORD MAKELONG(
*!*	Word wLow,
*!*	Word wHigh
*!*	);
*!*	Parameters
*!*	wLow
*!*	Specifies the low-Order Word Of the new Value.
*!*	wHigh
*!*	Specifies the High-Order Word Of the new Value.
*!*	Return Value
*!*	the Return Value Is a Long Value.
********************************************************************************
Function ctlMakeLong(pnLow, pnHigh)
	Return m.pnLow + m.pnHigh * 0x10000	&& Bitor(m.wLow, BITLSHIFT(m.wHigh, 16)
Endfunc

********************************************************************************
*!*	LPARAM MAKELPARAM(
*!*	    WORD wLow,
*!*	    WORD wHigh
*!*	);
*!*	Parameters
*!*	wLow
*!*	Specifies the low-order word of the new value.
*!*	wHigh
*!*	Specifies the high-order word of the new value.
*!*	Return Value
*!*	The return value is an LPARAM value.
********************************************************************************
Function ctlMakelParam(pnLow, pnHigh)
	Return m.pnLow + m.pnHigh * 0x10000	&& Bitor(m.wLow, BITLSHIFT(m.wHigh, 16)
Endfunc

********************************************************************************
*!*	POINT
*!*	The POINT structure defines the x- and y- coordinates of a point.
*!*	typedef struct tagPOINT {
*!*	  LONG x;
*!*	  LONG y;
*!*	} POINT, *PPOINT;
*!*	Members
*!*	x
*!*	Specifies the x-coordinate of the point.
*!*	y
*!*	Specifies the y-coordinate of the point.
*!* This is not a Windows Macro
********************************************************************************
Function ctlMakePoint(pnX, pnY)
	Return BinToC(m.pnX, "4RS") + BinToC(m.pnY, "4RS")
Endfunc

********************************************************************************
Function ctlMakewParam(pnLow, pnHigh)
	********************************************************************************
	Return ctlMakelParam(m.pnLow, m.pnHigh)
Endfunc

********************************************************************************
*!*	POINT
*!*	The POINT structure defines the x- and y- coordinates of a point.
*!*	typedef struct tagPOINT {
*!*	  LONG x;
*!*	  LONG y;
*!*	} POINT, *PPOINT;
*!*	Members
*!*	x
*!*	Specifies the x-coordinate of the point.
*!*	y
*!*	Specifies the y-coordinate of the point.
*!* This is not a Windows Macro
********************************************************************************
Function ctlGetXFromPoint(pcPoint)
	Return CToBin(Substr(m.pcPoint, 1, 4), "4RS")
Endfunc

********************************************************************************
*!*	POINT
*!*	The POINT structure defines the x- and y- coordinates of a point.
*!*	typedef struct tagPOINT {
*!*	  LONG x;
*!*	  LONG y;
*!*	} POINT, *PPOINT;
*!*	Members
*!*	x
*!*	Specifies the x-coordinate of the point.
*!*	y
*!*	Specifies the y-coordinate of the point.
*!* This is not a Windows Macro
********************************************************************************
Function ctlGetYFromPoint(pcPoint)
	Return CToBin(Substr(m.pcPoint, 5, 4), "4RS")
Endfunc

********************************************************************************
*!* This returns an object reference to the parent form
*!* of a non top level form:
*!* the _Screen, or some Top Level Form
*!* accepts as parameter a form reference
********************************************************************************
Function ctlGetParentForm(poForm)
	Local lnHwnd, loForm, lnX

	lnHwnd = apiGetParent(m.poForm.HWnd)

	If _Screen.HWnd = m.lnHwnd
		loForm = _Screen
	Else
		*!* Parent is a Top Level Form, get HWnd of form, what we have
		*!* now is HWnd of inner window of Top Level Form:
		lnHwnd = apiGetParent(m.lnHwnd)

		*!* Find the Top Level Form that has this HWnd:
		For m.lnX = 1 To _Screen.FormCount
			If _Screen.Forms(m.lnX).HWnd = m.lnHwnd
				loForm = _Screen.Forms(m.lnX)
				Exit
			Endif
		Endfor
	Endif

	Return m.loForm
Endfunc

********************************************************************************
*!* Returns current date formated string
*!* 1 DATE_SHORTDATE
*!* 2 DATE_LONGDATE
********************************************************************************
Function ctlGetDateFormat(pnFlags)

	Local lnLocale, lcDate, lcFormat, lcDateStr, lnDateStrLen, lnFlags

	If Vartype(m.pnFlags) # T_NUMERIC
		lnFlags = DATE_LONGDATE
	Else
		lnFlags = m.pnFlags
	Endif

	lnLocale = LOCALE_USER_DEFAULT

	lcDate = .Null.
	lcFormat = .Null.

	lnDateStrLen = 0xFF
	lcDateStr = Space(m.lnDateStrLen)

	lnDateStrLen = apiGetDateFormat( ;
		m.lnLocale, ;
		m.lnFlags, ;
		@m.lcDate, ;
		@m.lcFormat, ;
		@m.lcDateStr, ;
		m.lnDateStrLen)
	lcDateStr= Left(m.lcDateStr, m.lnDateStrLen - 1)

	Return m.lcDateStr
Endfunc

Function ctlGetDateFormatEx(pdDate, pnLocale, pnFlags)

	Local lcDate, lcFormat, lcDateStr, lnDateStrLen, ldDate, lnLocale, lnFlags

	If Vartype(m.pdDate) # T_DATE
		ldDate = Date()
	Else
		ldDate = m.pdDate
	Endif

	If Vartype(m.pnLocale) # T_NUMERIC
		lnLocale = LOCALE_USER_DEFAULT
	Else
		lnLocale = m.pnLocale
	Endif

	If Vartype(m.pnFlags) # T_NUMERIC
		lnFlags = DATE_LONGDATE
	Else
		lnFlags = m.pnFlags
	Endif

	*!* http://msdn.microsoft.com/en-us/library/ms724950(VS.85).aspx
	lcDate = ;
		BinToC(Year(m.ldDate), "2rs") + ;
		BinToC(Month(m.ldDate), "2rs") + ;
		BinToC(Dow(m.ldDate, 1), "2rs") + ;
		BinToC(Day(m.ldDate), "2rs") + ;
		0h0000000000000000

	lcFormat = .Null.

	lnDateStrLen = 0xFF
	lcDateStr = Space(m.lnDateStrLen)

	lnDateStrLen = apiGetDateFormat( ;
		m.lnLocale, ;
		m.lnFlags, ;
		m.lcDate, ;
		m.lcFormat, ;
		@m.lcDateStr, ;
		m.lnDateStrLen)
	
	lcDateStr= Left(m.lcDateStr, m.lnDateStrLen - 1)

	Return m.lcDateStr
Endfunc

********************************************************************************
*!* Returns the type of container a control is in, or the type of form
*!* accepts as parameter a control or a form reference

*!*	 CON_FORMTYPE_DEFAULT       0
*!*	 CON_FORMTYPE_TOPLEVEL      
*!*	 CON_FORMTYPE_SCREEN        2

*!* Determine the type of form the control parameter is in,
*!* or the type of form, if the passed parameter is a form

*!* Parameter can be a form, toolbar or control
********************************************************************************
Function ctlGetFormType(poObject)

	Local loForm, lnFormType

	loForm = m.poObject

	*!* Go up the object hierarchy until we find a form:
	*!* 20070711 Modified to account for toolbars
	Do While Inlist(Upper(m.loForm.BaseClass), "FORM", "TOOLBAR") = FALSE
		If Type("m.loForm.Parent") = T_OBJECT
			loForm = m.loForm.Parent
		Else
			loForm = _Screen.ActiveForm
			Exit
		Endif
	Enddo

	lnFormType = CON_FORMTYPE_DEFAULT

	*!*	If container is a TLF, must have ShowWindow = 2
	If m.loForm.ShowWindow = CON_SHOWWIN_ASTOPLEVELFORM
		lnFormType = CON_FORMTYPE_TOPLEVEL
	Endif

	*!*	If Form.Name equals the _Screen.Name, then container is _Screen
	If m.loForm.Name == _Screen.Name
		lnFormType = CON_FORMTYPE_SCREEN
	Endif

	loForm = Null

	Return m.lnFormType
Endfunc

********************************************************************************
Function ctlTwipsPerPixelX()

	Local lnDc, lnLogPixelsX

	lnDc = apiGetDC(HWND_DESKTOP)
	lnLogPixelsX = apiGetDeviceCaps(m.lnDc, LOGPIXELSX)
	apiReleaseDC(HWND_DESKTOP, m.lnDc)
	Return Round(1440 / m.lnLogPixelsX, 0)
Endfunc

********************************************************************************
Function ctlTwipsPerPixelY()

	Local lnDc, lnLogPixelsY

	lnDc = apiGetDC(HWND_DESKTOP)
	lnLogPixelsY = apiGetDeviceCaps(m.lnDc, LOGPIXELSY)
	apiReleaseDC(HWND_DESKTOP, m.lnDc)
	Return Round(1440 / m.lnLogPixelsY, 0)
Endfunc

********************************************************************************
*!* GUID FUNCTIONS
********************************************************************************
*!* http://www.ietf.org/rfc/rfc4122.txt
*!* http://en.wikipedia.org/wiki/Globally_Unique_Identifier
*!* http://en.wikipedia.org/wiki/Universally_Unique_Identifier

********************************************************************************
*!* Returns a new binary 16 byte GUID

*!*	In Windows NT 4.0, Windows Me/98, and Windows 95 DCOM release, UuidCreate returns
*!*	RPC_S_UUID_LOCAL_ONLY when the originating computer does not have an ethernet/token ring
*!*	(IEEE 802.x) address. In this case, the generated UUID is a valid identifier, and is guaranteed
*!*	to be unique among all UUIDs generated on the computer. However, the possibility exists that
*!*	another computer without an ethernet/token ring address generated the identical UUID.
*!*	Therefore you should never use this UUID to identify an object that is not strictly local to
*!*	your computer. Computers with ethernet/token ring addresses generate UUIDs that are guaranteed
*!*	to be globally unique.
********************************************************************************
Function ctlNewGuid()

	Local lcGuid

	lcGuid = Replicate(Chr(0xFF), 16)
	apiUuidCreate(@m.lcGuid)

	Return m.lcGuid
Endfunc

********************************************************************************
*!* Returns a new 32 char GUID string
*!* Format "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
********************************************************************************
Function ctlNewGuidString32()

	Local lcGuid

	lcGuid = Replicate(Chr(0xFF), 16)
	apiUuidCreate(@m.lcGuid)

	Return ctlGuidToString32(m.lcGuid)
Endfunc

********************************************************************************
*!* Returns a new 36 char GUID string
*!* Format "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
********************************************************************************
Function ctlNewGuidString36()

	Local lcGuid

	lcGuid = Replicate(Chr(0xFF), 16)
	apiUuidCreate(@m.lcGuid)

	Return ctlGuidToString36(m.lcGuid)
Endfunc

********************************************************************************
*!* Returns a new 38 char GUID string
*!* Format "{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}"
********************************************************************************
Function ctlNewGuidString38()

	Local lcGuid

	lcGuid = Replicate(Chr(0xFF), 16)
	apiUuidCreate(@m.lcGuid)

	Return ctlGuidToString38(m.lcGuid)
Endfunc

********************************************************************************
Function ctlNewGuidStringApi1()

	Local lcGuid

	lcGuid = Replicate(Chr(0xFF), 16)
	apiUuidCreate(@m.lcGuid)

	Return ctlGuidToStringApi1(m.lcGuid)
Endfunc

********************************************************************************
Function ctlNewGuidStringApi2()

	Local lcGuid

	lcGuid = Replicate(Chr(0xFF), 16)
	apiUuidCreate(@m.lcGuid)

	Return ctlGuidToStringApi2(m.lcGuid)
Endfunc

********************************************************************************
*!* Converts a binary 16 byte GUID to a 32 char GUID string
*!* format "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
********************************************************************************
Function ctlGuidToString32(m.pcGuid As String)

	Local lcGuidString

	lcGuidString = ""

	*!* Reorder GUID bytes
	lcGuidString = Substr(m.pcGuid, 4, 1) ;
		+ Substr(m.pcGuid, 3, 1) ;
		+ Substr(m.pcGuid, 2, 1) ;
		+ Left(m.pcGuid, 1) ;
		+ Substr(m.pcGuid, 6, 1) ;
		+ Substr(m.pcGuid, 5, 1) ;
		+ Substr(m.pcGuid, 8, 1) ;
		+ Substr(m.pcGuid, 7, 1) ;
		+ Right(m.pcGuid, 8)

	*!* Convert bytes to encoded HexBinary
	lcGuidString = Strconv(m.lcGuidString, 15)

	Return m.lcGuidString
Endfunc

********************************************************************************
*!* Converts a binary 16 byte GUID to a 36 char GUID string
*!* format "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
*!* This is faster that using the StringFromGuid2 API call
********************************************************************************
Function ctlGuidToString36(pcGuid)

	Local lcGuidString, lcGuid

	lcGuidString = ""

	*!* Convert bytes to encoded HexBinary
	lcGuid = Strconv(m.pcGuid, 15)

	*!* Reorder GUID bytes, Add hyphens
	lcGuidString = ;
		+ Substr(m.lcGuid, 7, 2) ;
		+ Substr(m.lcGuid, 5, 2) ;
		+ Substr(m.lcGuid, 3, 2) ;
		+ Left(m.lcGuid, 2) ;
		+ "-" ;
		+ Substr(m.lcGuid, 11, 2) ;
		+ Substr(m.lcGuid, 9, 2) ;
		+ "-" ;
		+ Substr(m.lcGuid, 15, 2) ;
		+ Substr(m.lcGuid, 13, 2) ;
		+ "-" ;
		+ Substr(m.lcGuid, 17, 4) ;
		+ "-" ;
		+ Right(m.lcGuid, 12)

	Return m.lcGuidString
Endfunc

********************************************************************************
*!* Converts a binary 16 byte GUID to a 38 char GUID string
*!* format "{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}"
*!* This is faster that using the StringFromGuid2 API call
********************************************************************************
Function ctlGuidToString38(pcGuid)

	Local lcGuidString, lcGuid

	lcGuidString = ""

	*!* Convert bytes to encoded HexBinary
	lcGuid = Strconv(m.pcGuid, 15)

	*!* Reorder GUID bytes, Add brackets, hyphens
	lcGuidString = "{" ;
		+ Substr(m.lcGuid, 7, 2) ;
		+ Substr(m.lcGuid, 5, 2) ;
		+ Substr(m.lcGuid, 3, 2) ;
		+ Left(m.lcGuid, 2) ;
		+ "-" ;
		+ Substr(m.lcGuid, 11, 2) ;
		+ Substr(m.lcGuid, 9, 2) ;
		+ "-" ;
		+ Substr(m.lcGuid, 15, 2) ;
		+ Substr(m.lcGuid, 13, 2) ;
		+ "-" ;
		+ Substr(m.lcGuid, 17, 4) ;
		+ "-" ;
		+ Right(m.lcGuid, 12) ;
		+ "}"

	Return m.lcGuidString
Endfunc

********************************************************************************
*!* Converts char GUID string to a binary 16 byte GUID
*!* format "{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}"
*!* format "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
*!* format "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
********************************************************************************
Function ctlGuidFromString(pcGuidString)

	Local lcGuid, lcGuidString

	lcGuid = ""

	*!* Strip brackets and hyphens
	lcGuidString = Chrtran(m.pcGuidString, "{-}", "")

	*!* Reorder GUID string chars
	lcGuid = ;
		+ Substr(m.lcGuidString, 7, 2) ;
		+ Substr(m.lcGuidString, 5, 2) ;
		+ Substr(m.lcGuidString, 3, 2) ;
		+ Left(m.lcGuidString, 2) ;
		+ Substr(m.lcGuidString, 11, 2) ;
		+ Substr(m.lcGuidString, 9, 2) ;
		+ Substr(m.lcGuidString, 15, 2) ;
		+ Substr(m.lcGuidString, 13, 2) ;
		+ Right(m.lcGuidString, 16)

	*!* Convert bytes to decoded HexBinary
	lcGuid = Strconv(m.lcGuid, 16)

	Return m.lcGuid
Endfunc

********************************************************************************
*!* Used just to check the other functions
*!* StringUuid parameter of UuidToString:
*!* Pointer to a pointer to the string into which
*!* the UUID specified in the Uuid parameter will be placed.
*!* UuidToString returns a string in the following format:
*!* "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxxx" (lowercase)
********************************************************************************
Function ctlGuidToStringApi1(pcGuid)

	Local lnPointer

	lnPointer = 0
	apiUuidToString(m.pcGuid, @m.lnPointer)

	Return Sys(2600, m.lnPointer, 36)
Endfunc

********************************************************************************
*!* Used just to check the other functions
********************************************************************************
Function ctlGuidToStringApi2(pcGuid)

	Local lcGuidString, lcLen

	*!* Set up buffer: 39 chars * 2 (unicode)
	lcGuidString = Space(78)
	lcLen = 78

	apiStringFromGUID2(m.pcGuid, @m.lcGuidString, m.lcLen)

	*!* Remove double null and convert from Unicode:
	Return Strconv(Left(m.lcGuidString, 76), 6)

Endfunc

********************************************************************************
*!* Used just to check the other functions
********************************************************************************
Function ctlGuidFromStringApi(pcGuidString)

	Local lcUuid, lcGuidString
	*!* Strip brackets and hyphens
	lcGuidString = Chrtran(m.pcGuidString, "{-}", "")

	*!* Add hyphens
	lcGuidString = ;
		LEFT(m.lcGuidString, 8) ;
		+ "-" ;
		+ Substr(m.lcGuidString, 9, 4) ;
		+ "-" ;
		+ Substr(m.lcGuidString, 13, 4) ;
		+ "-" ;
		+ Substr(m.lcGuidString, 17, 4) ;
		+ "-" ;
		+ Right(m.lcGuidString, 12)

	lcUuid = Replicate(Chr(0xFF), 16)
	apiUuidFromString(m.lcGuidString, @m.lcUuid)
	Return m.lcUuid

Endfunc
