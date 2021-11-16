&&	������� ���	��������	- ����������� �� (word,excel,	...) �� ���������� ������������
&&	��������	��� �������	������ �	��������	��� ��� ������������� ����	��������� �����������.
&&	16-01-2007 �����:	��������	�.�. �������� �� ���������� ����������� www.foxclub.ru
&&	���� ����� �����������,	��	��������	���� ������


  SET	TALK OFF
  CLEAR

  ? 'WordExists()	= '
  ?? WordExists()
  ? 'ExcelExists() =	'
  ?? ExcelExists()
  ? 'OfficeReg("Word") = '
  ?? OfficeReg("Word")
  ? 'OfficeReg("EXCEL")	= '
  ?? OfficeReg("EXCEL")
  ? 'OfficeReg("aCCeSS") =	'
  ?? OfficeReg("aCCeSS")
  ? 'OfficeReg("publisher") =	'
  ?? OfficeReg("publisher")
  ? 'OfficeReg("poWerPOint") = '
  ?? OfficeReg("poWerPOint")
  ?
  ? 'OfficeReg("MyProg") =	'
  ?? OfficeReg("MyProg")
  ?? ' -	������, ������� �������� lcOfficeType �� ������	� ����� �������'
  ?
  ? 'OfficeReg(1234)	= '
  ?? OfficeReg(1234)
  ?? ' -	������, ������� �������� lcOfficeType �� �����'
  ?
  ? '�������� ������	������������ �������� OfficeReg()'
  ? 'RETURN	-1	- ������, �������	��������	lcOfficeType �� �����'
  ?
  ? 'RETURN	-2	- ������, �������	��������	lcOfficeType �� ������ � ����� �������'
  ?
  ? 'RETURN	-3	- ������	OLE ��� � �������	��� ����� ��� ���������	���������'
  ? '							��	���������� ������������	������ ��������� �� �����������'
  ?
  ? 'RETURN	0	- � �������	���� ������, �� ������������ ���������	��	Microsoft Office'
  ?
  ? 'RETURN	1	- ��.	���� ������� ������ � ������������ ���������	Microsoft Office'


  FUNCTION WordExists
  PRIVATE poReg1,	poReg2,poShell
  TRY
	poShell = CreateObject("WScript.Shell")
	poReg1  = poShell.RegRead("HKEY_CLASSES_ROOT\\.doc\\")
	poReg2  = poShell.RegRead("HKEY_CLASSES_ROOT\\.doc\\Content	Type")
  CATCH
	EXIT
  ENDTRY
  IF (VARTYPE(poReg1) =	"C" .AND. !ISNULL(poReg1))	.AND.;
	  (VARTYPE(poReg2) =	"C" .AND. !ISNULL(poReg2))
	RETURN IIF(("WORD" $	UPPER(poReg1))	.AND.;
				  ("WORD" $	UPPER(poReg2)),.T.,.F.)
  ELSE
	RETURN .F.
  ENDIF
  ENDFUNC

	FUNCTION ExcelExists
	PRIVATE poReg1,	poReg2, poShell
	TRY
	poShell = CreateObject("WScript.Shell")
	poReg1  = poShell.RegRead("HKEY_CLASSES_ROOT\\.xls\\")
	poReg2  = poShell.RegRead("HKEY_CLASSES_ROOT\\.xls\\Content	Type")
  CATCH
	EXIT
  ENDTRY
  IF (VARTYPE(poReg1) =	"C" .AND. !ISNULL(poReg1))	.AND.;
	  (VARTYPE(poReg2) =	"C" .AND. !ISNULL(poReg2))
	RETURN IIF(("EXCEL" $ UPPER(poReg1)) .AND.;
				  ("EXCEL" $ UPPER(poReg2)),.T.,.F.)
  ELSE
	RETURN .F.
  ENDIF
  ENDFUNC

  FUNCTION OfficeReg
  PARAMETERS lcOfficeType
  PRIVATE poReg1,	poReg2, poShell, pcExtension
  IF VARTYPE(lcOfficeType)	= "C"	.AND.	!ISNULL(lcOfficeType)
	lcOfficeType =	UPPER(ALLTRIM(lcOfficeType))
	DO	CASE
		CASE lcOfficeType	==	"WORD"
			pcExtension	= "doc"
		CASE lcOfficeType	==	"EXCEL"
			pcExtension	= "xls"
		CASE lcOfficeType	==	"ACCESS"
			pcExtension	= "mdb"
		CASE lcOfficeType	==	"POWERPOINT"
			pcExtension	= "ppt"
		CASE lcOfficeType	==	"PUBLISHER"
			pcExtension	= "pub"
	OTHERWISE
		RETURN -2 && ������,	������� �������� lcOfficeType	��	������ �	�����	�������
	ENDCASE
	TRY
		poShell = CreateObject("WScript.Shell")
		poReg1  = poShell.RegRead("HKEY_CLASSES_ROOT\\.&pcExtension\\")
		poReg2  = poShell.RegRead("HKEY_CLASSES_ROOT\\.&pcExtension\\Content	Type")
	CATCH
		EXIT
	ENDTRY
	IF	(VARTYPE(poReg1) = "C" .AND. !ISNULL(poReg1)) .AND.;
		(VARTYPE(poReg2) = "C" .AND. !ISNULL(poReg2))
		RETURN IIF((lcOfficeType $	UPPER(poReg1))	.AND.;
					  (lcOfficeType $	UPPER(poReg2)),1,0)
	ELSE
		RETURN -3 && ������ OLE	��� �	������� ���	�����	��� ��������� ���������
						  && �� ���������� ������������ ������	��������� �� �����������'
	ENDIF
  ELSE
	RETURN -1 && ������,	������� �������� lcOfficeType	��	�����
  ENDIF
  ENDFUNC