&& Закрытие программы (с исп MUTEX) [AppQuit]
local i

for i=Application.Forms.Count to 1 step -1
	Application.Forms.Item[i].Release
next

on shutdown
if PemStatus(_screen,"MutexHandle",5) 
	declare integer ReleaseMutex in Win32API Integer hMutex
	declare integer CloseHandle in Kernel32 Integer hObject
	ReleaseMutex(_screen.MutexHandle)
	CloseHandle(_screen.MutexHandle)
	clear dlls "ReleaseMutex", "CloseHandle"
endif
quit