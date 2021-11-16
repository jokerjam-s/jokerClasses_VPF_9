**************************************************************************
*! Copyright by Anjel
*! 
*! ��������� ������ ������� � �������� ��
*! 
**************************************************************************
lparameters mErrNo
local sMsg

do case
	case mErrNo.ErrorNo=1884
		sMsg = "���������� �������� ��� �������� ������! ���� ��� ��������� ";
					+"�������� ����� �������� ��� ��������� � ������� ��������."
	case mErrNo.ErrorNo=1582
		sMsg = "�������� ������."+Chr(13)+mErrNo.Message
	case mErrNo.ErrorNo=1539	&& ������ ��� �������� 
										&& � �������� - ��������� � ��������
	otherwise
		sMsg = "����������� ������ �"+Transform(mErrNo.ErrorNo)+Chr(13);
	      +[  Procedure: ] + oErr.Procedure+Chr(13);
			+[  LineNo: ] + STR(oErr.LineNo)+Chr(13);
	      +[  Message: ] + oErr.Message+Chr(13);
	      +[  Details: ] + oErr.Details+Chr(13);
	      +[  StackLevel: ] + STR(oErr.StackLevel)+Chr(13);
	      +[  LineContents: ] + oErr.LineContents+Chr(13);
	      +[  UserValue: ] + oErr.UserValue
endcase 

if !Empty(sMsg)
	MessageBox(sMsg,48,"��������!")
endif
