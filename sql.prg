**************************************************************************
*! ��������� SQL ������ � ��������� ���������� (���� ����������)
*!   ����������:
*!     >0 - ������� ���������
*!     -1 - ������ ��� ����������
*!     -2 - ���������� �������� �������������
*!     -3 - ������ ���������� � SQL �������� �� ����� ������ SQL �������
*!     -4 - ������ ���������� �� ����� ������ SQL �������
**************************************************************************
lparameters lcCommand, lcCursor, llAsync
local lnTimeOut, lnPCnt, lnRes, lnKey

lnPCnt = Pcount()

if Empty(lcCommand) or Vartype(lcCommand)<>"C"
	MessageBox("SQL ������� ����������� ��� �������!",16,"������")
	return -1
endif

if !InList(Vartype(lcCursor),"C","L")
	MessageBox("��� ������� ����� ������������� ���!",16,"������")
	return -1
endif

if Vartype(lcCursor)="C"
	if Used(lcCursor)
		Select(lcCursor)
		use
	endif
endif

do case
case lnPCnt=1
	llAsync = .T.
case lnPCnt=2
	llAsync = Iif(Vartype(lcCursor)="C", .T., lcCursor)
case lnPCnt=3
	if Vartype(lcCursor)<>"C" or Vartype(llAsync)<>"L"
		MessageBox("� SQL(....) �������� �������� ���������.",16,"������")
		return
	endif
endcase

&& ��������� ����������
if !PemStatus(_screen,"hSQL",5)
	_screen.AddProperty("hSQL",0)
endif
if _screen.hSQL <= 0
	if !GetConnect()
		MessageBox("��� ���������� � SQL ��������.",48,"������")
		return -1
	endif
endif

SQLSetProp(_screen.hSQL,"Asynchronous",llAsync)

do case
case lnPCnt=1
	lnRes=SQL_EXE(lcCommand,.F.)
case InList(lnPCnt,2,3)
	lnRes=SQL_EXE(lcCommand,lcCursor)
otherwise
	MessageBox("������������ ����� ��������� SQL.",48,"������")
	return -1
endcase
return lnRes


procedure SQL_EXE
lparameters lcCommand, lcCursor
local array acWait[12]
local lnSec, lnSecSQL, lnResSQL, i, oldTalk, lnRecRead

acWait[1] = "[>-----]"
acWait[2] = "[->----]"
acWait[3] = "[-->---]"
acWait[4] = "[--->--]"
acWait[5] = "[---->-]"
acWait[6] = "[----->]"
acWait[7] = "[-----<]"
acWait[8] = "[----<-]"
acWait[9] = "[---<--]"
acWait[10] = "[--<---]"
acWait[11] = "[-<----]"
acWait[12] = "[<-----]"

lnRecRead=0
lnSec=Seconds()
lnSecSQL = Seconds()
lnTimeOut = 0.1	&& SQLGetProp(_screen.hSQL,"WaitTime")/100
lnResSQL=0
i=1

oldEsc = Set("Escape")
set escape off
clear typeahead

if Vartype(lcCursor)="L"	&& ��� �������
	if SQLGetProp(_screen.hSQL,"Asynchronous")
		do while lnResSQL=0
			lnResSQL = SQLExec(_screen.hSQL,lcCommand)
			if lnResSQL<0
				=ErrHand(Program(),Lineno(),lcCommand)
				exit
			endif
			lnKey = Inkey()
			if lnKey = 27
				lnResSQL=SQLCancel(_screen.hSQL)
				do case
				case lnResSQL =  1
					MessageBox("���������� ������� �������� �������������.",64,"�������� ������")
					lnResSQL=-2
				case lnResSQL = -1
					MessageBox("��������� ������ ���������� � SQL �������� �� ����� ������ SQL �������.",48,"������")
					lnResSQL = -3
				case lnResSQL = -2
					MessageBox("��������� ������ ���������� �� ����� ������ SQL �������.",48,"������")
					lnResSQL = -4
				endcase
				exit
			endif
			if (Seconds()-lnSec)>lnTimeOut
				wait window "���������� ������� "+acWait[i]+"[ ";
						+Transform(Seconds()-lnSecSQL,"9999.99")+" ���. ]"+Chr(13);
						+"ESC - ������" nowait noclear
				i = Iif(i<Alen(acWait),i+1,1)
				lnSec=Seconds()
			endif 
		enddo 
	else
		lnResSQL = SQLExec(_screen.hSQL,lcCommand)
		=ErrHand(Program(),Lineno(),lcCommand)
	endif
else
	if SQLGetProp(_screen.hSQL,"Asynchronous")
		do while lnResSQL=0
			lnResSQL = SQLExec(_screen.hSQL,lcCommand,lcCursor)
			if lnResSQL<0
				=ErrHand(Program(),Lineno(),lcCommand)
				exit
			endif
			lnKey = Inkey()
			if lnKey = 27
				lnResSQL=SQLCancel(_screen.hSQL)
				do case
				case lnResSQL =  1
					MessageBox("���������� ������� �������� �������������.",64,"�������� ������")
					lnResSQL=-2
				case lnResSQL = -1
					MessageBox("��������� ������ ���������� � SQL �������� �� ����� ������ SQL �������.",48,"������")
					lnResSQL = -3
				case lnResSQL = -2
					MessageBox("��������� ������ ���������� �� ����� ������ SQL �������.",48,"������")
					lnResSQL = -4
				endcase
				exit
			endif
			if (Seconds()-lnSec)>lnTimeOut
				wait window "���������� ������� "+acWait[i]+"[ ";
						+Transform(Seconds()-lnSecSQL,"9999.99")+" ���. ]"+Chr(13);
						+"ESC - ������" nowait noclear
				i = Iif(i<Alen(acWait),i+1,1)
				lnSec=Seconds()
			endif 
		enddo 
	else
		lnResSQL = SQLExec(_screen.hSQL,lcCommand,lcCursor)
		=ErrHand(Program(),Lineno(),lcCommand)
	endif
endif
wait clear
set escape &oldEsc


return lnResSQL


procedure GetConnect
local lcConnectSQL, llREsult
llREsult = .T.
if _screen.hSQL<=0
	wait window "���������� � SQL ��������" nowait noclear
	&& �������� ������ �������� SQL �� INI
	lcConnectSQL = "DRIVER=SQL Server;SERVER=OASUP-SERVER;";
		+"APP=Microsoft Visual FoxPro;WSID="+Alltrim(Left(Id(),At("#",Id())-1));
		+";Network=DBNMPNTW;Trusted_Connection=Yes;Regional=Yes"
	_screen.hSQL = SQLStringConnect(lcConnectSQL,.T.)
	if _screen.hSQL>0
		SQLSetProp(_screen.hSQL,"ConnectTimeOut",20)
		SQLSetProp(_screen.hSQL,"BatchMode",.T.)
		SQLSetProp(_screen.hSQL,"WaitTime",100)
		SQLSetProp(_screen.hSQL,"BatchMode",.T.)
		SQLSetProp(_screen.hSQL,"Transactions",1)
		SQLSetProp(_screen.hSQL,"DispWarnings",.F.)
	else
		llREsult = .F.
	endif
	wait clear
endif
return llREsult
endproc
