lparameters tcGUIDMutex, tcGUIDScreen

#DEFINE ERROR_ALREADY_EXISTS	183
#DEFINE GW_CHILD					5
#DEFINE GW_HWNDNEXT				2
#define SW_SHOWNOACTIVATE		4

LOCAL lnhMutex, lnHwnd, llReturn

DO udp_DeclareMutexAPI

lnhMutex = CreateMutex(0, 1, tcGUIDMutex)
if GetLastError()= ERROR_ALREADY_EXISTS
	udp_DeclareWindowsAPI()
	llReturn = .T.
	lnHwnd = GetWindow(GetDesktopWindow(), GW_CHILD)
	do while lnHwnd != 0 && loop through all windows
		if GetProp(lnHwnd, tcGUIDScreen) = 1
			if IsIconic(lnHwnd) # 0
				ShowWindowAsync(lnHwnd, SW_SHOWNOACTIVATE)
			endif
			SetForegroundWindow(lnHwnd)
			llReturn = .T.
			exit
		endif
	lnHwnd = GetWindow(lnHwnd, GW_HWNDNEXT)
	enddo
	CloseHandle(lnHwnd)
	CloseHandle(lnhMutex)
	clear dlls "SetForegroundWindow", "GetDesktopWindow", ;
		"GetProp", "GetWindow", "IsIconic", "CloseHandle", "ShowWindowAsync"
else
	=SetProp(_VFP.HWND, m.tcGUIDScreen, 1)
	_screen.AddProperty("MutexHandle", m.lnhMutex)
	llReturn = .F.
endif

clear dlls "CreateMutex", "GetLastError", "SetProp"
return m.llReturn

procedure udp_DeclareMutexAPI()
	declare integer CloseHandle In Kernel32 Integer hObject 
	declare integer CreateMutex  In Win32API ;
		integer lpMutexAttributes, Integer bInitialOwner, String lpName
	declare integer GetLastError In Win32API
	declare integer  SetProp In User32 Integer hWnd, String lpString, Integer hData
endproc

procedure udp_DeclareWindowsAPI()
	declare integer GetDesktopWindow In User32
	declare integer GetProp In User32 Integer hWnd, String  lpString
	declare integer GetWindow In User32 Integer hWnd, Integer uCmd
	declare integer SetForegroundWindow in Win32API  LONG hWnd
	declare integer IsIconic in Win32API  LONG hWnd
	declare long ShowWindowAsync in Win32API LONG hWnd, LONG nCmdShowendproc
endproc