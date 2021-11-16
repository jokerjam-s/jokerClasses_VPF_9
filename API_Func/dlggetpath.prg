**************************************************************************
*! Copyright by Anjel 
*! 
*! ������ ��������
*! 
*!	typedef struct _browseinfo {
*!	    HWND hwndOwner					 0:4
*!	    PCIDLIST_ABSOLUTE pidlRoot	 4:4
*!	    LPTSTR pszDisplayName			 8:4
*!	    LPCTSTR lpszTitle				12:4
*!	    UINT ulFlags						16:4
*!	    BFFCALLBACK lpfn					20:4
*!	    LPARAM lParam						24:4
*!	    int iImage							28:4 - 32
*!	} BROWSEINFO, *PBROWSEINFO, *LPBROWSEINFO
*!
*! tcTitle - ������� � ������ ���������
*!	tnFlag  - ����� �������� ����
*!		 1 - ������ �������� ���� (����� - Ok �� ��������, ��� 64 �����)
*!		16 - EditBox
*!		64 - ���� � ������� "�������"
*!	16384 - �������� ����� ��� �����
*!	thWnd - ������������� ���������
*!
**************************************************************************
lparameters tcTitle, tnFlag, thWnd

local lhTitle, lcPath, lhWnd

declare integer SHBrowseForFolder in shell32 string @lpbi
declare integer LocalAlloc in kernel32 integer uFlags, integer uBytes
declare integer LocalFree in kernel32 integer hMem
declare integer SHGetPathFromIDList in shell32 integer pidl, string @pszPath

if Vartype(tcTitle)<>'C' or Empty(tcTitle)
	tcTitle = "������� �������"
endif

if Vartype(tnFlag)<>'N'
	tnFlag = 0
endif

lhWnd = Iif(Pcount()<3, _screen.HWnd, thWnd)
tcTitle = tcTitle + Chr(0)
lhTitle = LocalAlloc(0,Len(tcTitle))
Sys(2600,lhTitle,Len(tcTitle),tcTitle)

lcStruct = BinToC(lhWnd,[4rs])+Replicate(Chr(0),8)+;
	BinToC(lhTitle,[4rs])+BinToC(tnFlag,[4rs])+Replicate(Chr(0),12)

lcPath = Replicate(Chr(0), 260)
SHGetPathFromIDList(SHBrowseForFolder(@lcStruct), @lcPath)
lcPath = Strtran(lcPath, Chr(0), "")

LocalFree(lhTitle)

return lcPath
