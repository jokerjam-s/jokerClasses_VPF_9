**************************************************************************
*! © Сапунов А.В. 2004-2006, г.Гомель, jokerJam@tut.by
*!
*! Обработчик ошибок. Ведет лог.
*!
*! Вызов:
*! on error  =ErrHand(Program(), LineNo())
**************************************************************************
#define LOG_FileName	JustPath(Application.ServerName)+"\ERRORS.Log"

procedure ErrHand
lparameters lcProgName, lnLineNo, lcSQLCommand
local array alErr[1]
local llLogSave, lnMsgRes, oldSel, llErrOpen
private lcUsedTable, lcUsedIndex

lcUsedTable = Iif(Empty(Dbf()),"< none >",Dbf())
lcUsedIndex = Iif(Empty(Order()),"< none >",Order())

llErrOpen=.F.
oldSel = Select()
if !Used("ErrMsg")
	select 0
	use (Addbs(JustPath(Application.ServerName))+"ErrMsg")
	llErrOpen=.T.
else
	select ErrMsg
endif 

lnRes = AError(alErr)
if lnRes=0
	return 0
endif
lnRes = alErr[1]

llLogSave = .F.

do case
case alErr[1]=1526	&& Error from SQL Server
	locate for ErrMsg.ODBC_Err=alErr[5]
	if Found()
		sMsg = ErrMsg.Err_Msg
	else
		llLogSave = .T.
		sMsg = [ODBC Error №] + Transform(alErr[5])+Chr(10);
			+[  Program:      ] + lcProgname+Chr(10);
			+[  Line:         ] + Transform(lnLineNo)+Chr(10);
			+Iif(Empty(lcSQLCommand),"",[  SQL Command:  ]+lcSQLCommand)+Chr(10);
			+[  VFP Message:  ] + alErr[2]+Chr(10);
			+[  ODBC Message: ] + alErr[3]+Chr(10);
			+[  ODBC SQL state: ] + alErr[4]+Chr(10);
			+[  ODBC Connection handl: ] + Transform(alErr[5])
	endif
	
case alErr[1]=1582	&& правило проверки для полей
	sMsg = [Введены неверные данные!]+Chr(10)+alErr[2]

case InList(alErr[1],1427,1429)	&& OLE errors
	llLogSave = .T.
	sMsg = [OLE Error №:]+Transform(alErr[1])+Chr(10);
		+[  Program:      ] + lcProgname+Chr(10);
		+[  Line:         ] + Transform(lnLineNo)+Chr(10);		
		+[  VFP Message: ] + alErr[2]+Chr(10);
		+[  OLE Message: ] + alErr[3]+Chr(10);
		+[  Application: ] + alErr[4]+Chr(10);
		+[  OLE 2.0 exception №: ] + alErr[7]

otherwise
	locate for ErrMsg.VFP_Err = alErr[1]
	if Found()
		sMsg = ErrMsg.Err_Msg
	else
		llLogSave = .T.
		sMsg = "Error № "+Transform(alErr[1])+Chr(10);
			+[  Message: ] + alErr[2]+Chr(10);
			+Iif(Empty(lcProgName),"",[  Program: ]+lcProgname+Chr(10));
			+Iif(Empty(lnLineNo),"",[  Line   : ]+Transform(lnLineNo))+Chr(10);
			+Iif(IsNull(alErr[3]),"",[  Parameter: ] + alErr[3]+Chr(10));
			+Iif(IsNull(alErr[3]),"",[  Work area №: ] + Transform(alErr[3])+Chr(10));
			+Iif(IsNull(alErr[4]),"",[  Trigger: ] ;
				+ICase(alErr[4]=1,"Insert",alErr[4]=2,"Update",alErr[4]=3,"Delete");
				+" trigger failed"+Chr(10))
	endif
endcase
if llErrOpen
	select ErrMsg
	use
endif
Select(oldSel)

if llLogSave
	sMsg = Alltrim(sMsg)+Chr(10)+"Table / Index: "+Chr(10)+[    ]+ lcUsedTable + Chr(10)+[    ]+ lcUsedIndex
	do form fErrMsg with sMsg to lnMsgRes
	= ErrLog(sMsg,lnMsgRes)
	if lnMsgRes	&& Abort
		on shutdown
		quit
	else			&& Ignore
		return 0
	endif
else
	MessageBox(sMsg,48,"Внимание")
endif

return lnRes


*!*	Save LOG
procedure ErrLog
lparameters lcMsg, lnUserAction
private LogHandle

	LogHandle = Fopen(LOG_FileName,1)
	if LogHandle < 0
		LogHandle = Fcreate(LOG_FileName)
		if LogHandle < 0
			wait window 'Ошибка при создании LOG - файла.'
			return
		endif
	endif
	=Fseek(LogHandle,0,2)
	=Fputs(LogHandle,Padc(Ttoc(Datetime()),80,"-"))
	=Fputs(LogHandle,lcMsg)
	=Fputs(LogHandle,Chr(10)+"Reaction: " + Iif(lnUserAction,"Abort","Ignore"))
	=Fputs(LogHandle,Replicate("-",80))
	=Fputs(LogHandle,'')
	=Fclose(LogHandle)
endproc


#undef LOG_FileName
