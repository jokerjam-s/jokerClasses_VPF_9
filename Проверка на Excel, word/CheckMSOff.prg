&&	Функции для	проверки	- установлено ли (word,excel,	...) на компьютере пользователя
&&	написано	для скрытия	кнопок в	тоолбаре	при его инициализации если	программа отсутствует.
&&	16-01-2007 Автор:	Омеличев	А.В. написаны по материалам конференции www.foxclub.ru
&&	если будут комментарии,	то	напишите	свои отзывы


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
  ?? ' -	ошибка, заданый параметр lcOfficeType не входит	в число искомых'
  ?
  ? 'OfficeReg(1234)	= '
  ?? OfficeReg(1234)
  ?? ' -	ошибка, заданый параметр lcOfficeType не текст'
  ?
  ? 'Перечень ошибок	возвращаемых функцией OfficeReg()'
  ? 'RETURN	-1	- ошибка, заданый	параметр	lcOfficeType не текст'
  ?
  ? 'RETURN	-2	- ошибка, заданый	параметр	lcOfficeType не входит в число искомых'
  ?
  ? 'RETURN	-3	- ошибка	OLE или в реестре	нет ключа для заданного	параметра'
  ? '							на	компьютере пользователя	данная программа не установлена'
  ?
  ? 'RETURN	0	- в реестре	ключ найден, но используется программа	не	Microsoft Office'
  ?
  ? 'RETURN	1	- Ок.	ключ реестре найден и используется программа	Microsoft Office'


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
		RETURN -2 && ошибка,	заданый параметр lcOfficeType	не	входит в	число	искомых
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
		RETURN -3 && ошибка OLE	или в	реестре нет	ключа	для заданного параметра
						  && на компьютере пользователя данная	программа не установлена'
	ENDIF
  ELSE
	RETURN -1 && ошибка,	заданый параметр lcOfficeType	не	текст
  ENDIF
  ENDFUNC