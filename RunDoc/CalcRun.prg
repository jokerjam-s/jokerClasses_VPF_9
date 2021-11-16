&& 
&& Запуск системного калькулятора
&& 
#define SW_SHOWNOACTIVATE	4
local lpBuffer, nSizeRet

declare INTEGER SetForegroundWindow in Win32API  LONG hWnd
declare INTEGER IsIconic in Win32API  LONG hWnd
declare LONG FindWindow in Win32API  STRING lpClassName, STRING lpWindowName
declare LONG ShowWindowAsync in Win32API LONG hWnd, LONG nCmdShow
declare INTEGER GetSystemDirectory IN kernel32 STRING @ lpBuffer, INTEGER nSize

local lhWnd
lhWnd = FindWindow(null, "Калькулятор")
if lhWnd # 0
	if IsIconic(lhWnd) # 0
		ShowWindowAsync(lhWnd, SW_SHOWNOACTIVATE)
	endif
	SetForegroundWindow(lhWnd)
else
	lpBuffer = Space(250) 
	nSizeRet = GetSystemDirectory(@lpBuffer, Len(lpBuffer)) 
	lpBuffer = Addbs(Substr(lpBuffer, 1, nSizeRet))+"Calc.exe"
	if File(lpBuffer)
		run /n &lpBuffer
	endif
endif
