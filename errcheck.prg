**************************************************************************
*! Copyright by Anjel
*! 
*! Обработка ошибок доступа к таблицам БД
*! 
**************************************************************************
lparameters mErrNo
local sMsg

do case
	case mErrNo.ErrorNo=1884
		sMsg = "Невозможно обновить или добавить данные! Одно или несколько ";
					+"ключевых полей содержат уже имеющиеся в таблице значения."
	case mErrNo.ErrorNo=1582
		sMsg = "Неверные данные."+Chr(13)+mErrNo.Message
	case mErrNo.ErrorNo=1539	&& ошибка при проверке 
										&& в триггере - сообщение в триггере
	otherwise
		sMsg = "Неизвестная ошибка №"+Transform(mErrNo.ErrorNo)+Chr(13);
	      +[  Procedure: ] + oErr.Procedure+Chr(13);
			+[  LineNo: ] + STR(oErr.LineNo)+Chr(13);
	      +[  Message: ] + oErr.Message+Chr(13);
	      +[  Details: ] + oErr.Details+Chr(13);
	      +[  StackLevel: ] + STR(oErr.StackLevel)+Chr(13);
	      +[  LineContents: ] + oErr.LineContents+Chr(13);
	      +[  UserValue: ] + oErr.UserValue
endcase 

if !Empty(sMsg)
	MessageBox(sMsg,48,"Внимание!")
endif
