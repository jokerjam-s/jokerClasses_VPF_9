*****************************************************************
*						���� ��������
*				  yu (rsl_my@mail.ru)
*****************************************************************
FUNCTION	GetDateWrittenOut(dDate	AS	Date,	nPadeg AS Integer) AS String
LOCAL	lcSaveValue, lcResult

lcSaveValue	= SET("DATE")
SET DATE	TO	LONG
lcResult= DTOC(m.dDate)
SET DATE	TO	(m.lcSaveValue)

lcResult= ALLTRIM(STUFF(m.lcResult,	1,	AT(" ", m.lcResult) - 1, TranslateBeforeThousand(DAY(m.dDate),	m.nPadeg)))
lcResult= ALLTRIM(STUFF(m.lcResult,	RAT("	",	m.lcResult,	2)	+ 1, 1000, TranslateThousand(YEAR(m.dDate)))) +	" ����"


RETURN m.lcResult
ENDFUNC

*****************************************************************
*	�����	- ���������	���������
*****************************************************************

FUNCTION	TranslateNumFrom1To20(nNum	AS	Integer,	nPadeg AS Integer) AS String
LOCAL	lcCompletion, lcResult

IF	m.nPadeg	==	0
	lcCompletion =	"�"
ELSE
	lcCompletion =	"��"
ENDIF

DO	CASE
CASE m.nNum	 == 1
	lcResult	= " �����" + m.lcCompletion
CASE m.nNum	 == 2
	lcResult	= " �����" + m.lcCompletion
CASE m.nNum	 == 3
	lcResult	= " �����" + IIF(m.nPadeg == 0, "",	"�") + m.lcCompletion
CASE m.nNum	 == 4
	lcResult	= " ��������" + m.lcCompletion
CASE m.nNum	 == 5
	lcResult	= " ����" +	m.lcCompletion
CASE m.nNum	 == 6
	lcResult	= " �����" + m.lcCompletion
CASE m.nNum	 == 7
	lcResult	= " ������"	+ m.lcCompletion
CASE m.nNum	 == 8
	lcResult	= " ������"	+ m.lcCompletion
CASE m.nNum	 == 9
	lcResult	= " ������"	+ m.lcCompletion
CASE m.nNum	 == 10
	lcResult	= " ������"	+ m.lcCompletion
CASE m.nNum	 == 11
	lcResult	= " �����������" + m.lcCompletion
CASE m.nNum	 == 12
	lcResult	= " ����������" +	m.lcCompletion
CASE m.nNum	 == 13
	lcResult	= " ����������" +	m.lcCompletion
CASE m.nNum	 == 14
	lcResult	= " ������������"	+ m.lcCompletion
CASE m.nNum	 == 15
	lcResult	= " ����������" +	m.lcCompletion
CASE m.nNum	 == 16
	lcResult	= " �����������" + m.lcCompletion
CASE m.nNum	 == 17
	lcResult	= " ����������" +	m.lcCompletion
CASE m.nNum	 == 18
	lcResult	= " ������������"	+ m.lcCompletion
CASE m.nNum	 == 19
	lcResult	= " ������������"	+ m.lcCompletion
CASE m.nNum	 == 20
	lcResult	= " ��������" + m.lcCompletion
OTHERWISE
	lcResult	= ""
ENDCASE

RETURN m.lcResult
ENDFUNC

FUNCTION	TranslateNumFrom21To90(nNum AS Integer, nPadeg AS Integer) AS String
LOCAL	lcCompletion, lcAverage, lcResult
STORE	""	TO	lcCompletion, lcAverage

DO	CASE
CASE m.nPadeg == 0
	lcCompletion= "��"
CASE m.nPadeg == 1 AND m.nNum	==	90
	lcCompletion =	"��"
CASE m.nPadeg == 1
	lcCompletion =	"���"
CASE m.nPadeg == 2  AND	m.nNum <	40
	lcCompletion =	"�"
OTHERWISE
ENDCASE

DO	CASE
CASE m.nNum	 == 20
	lcResult	= " �������" +	m.lcCompletion
CASE m.nNum	 == 30
	lcResult	= " �������" +	m.lcCompletion
CASE m.nNum	 == 40
	lcResult	= " �����" + m.lcCompletion
CASE m.nNum	 == 50 AND m.nPadeg == 1
	lcResult	= " ���������"	+ m.lcCompletion
CASE m.nNum	 == 50
	lcResult	= " ���������"	+ m.lcCompletion
CASE m.nNum	 == 60 AND m.nPadeg == 1
	lcResult	= " ����������" +	m.lcCompletion
CASE m.nNum	 == 60
	lcResult	= " ����������" +	m.lcCompletion
CASE m.nNum	 == 70 AND m.nPadeg == 1
	lcResult	= " ���������"	+ m.lcCompletion
CASE m.nNum	 == 70
	lcResult	= " ���������"	+ m.lcCompletion
CASE m.nNum	 == 80 AND m.nPadeg == 1
	lcResult	= " ����������" +	m.lcCompletion
CASE m.nNum	 == 80
	lcResult	= " �����������" + m.lcCompletion
CASE m.nNum	 == 90
	lcResult	= " ���������"	+ m.lcCompletion
OTHERWISE
	lcResult	= ""
ENDCASE

RETURN m.lcResult
ENDFUNC

FUNCTION	TranslateNumFrom100To900(nNum	AS	Integer,	bIsInteger AS Boolean) AS String
LOCAL	lcResult

DO	CASE
CASE m.nNum	 == 100 AND	m.bIsInteger
	lcResult	= " ���"
CASE m.nNum	 == 100
	lcResult	= " ������"
CASE m.nNum	 == 200 AND	m.bIsInteger
	lcResult	= " ������"
CASE m.nNum	 == 200
	lcResult	= " ����������"
CASE m.nNum	 == 300 AND	m.bIsInteger
	lcResult	= " ������"
CASE m.nNum	 == 300
	lcResult	= " ����������"
CASE m.nNum	 == 400 AND	m.bIsInteger
	lcResult	= " ���������"
CASE m.nNum	 == 400
	lcResult	= " �������������"
CASE m.nNum	 == 500 AND	m.bIsInteger
	lcResult	= " �������"
CASE m.nNum	 == 500
	lcResult	= " ����������"
CASE m.nNum	 == 600 AND	m.bIsInteger
	lcResult	= " ��������"
CASE m.nNum	 == 600
	lcResult	= " �����������"
CASE m.nNum	 == 700 AND	m.bIsInteger
	lcResult	= " �������"
CASE m.nNum	 == 700
	lcResult	= " ����������"
CASE m.nNum	 == 800 AND	m.bIsInteger
	lcResult	= " ���������"
CASE m.nNum	 == 800
	lcResult	= " ������������"
CASE m.nNum	 == 900 AND	m.bIsInteger
	lcResult	= " ���������"
CASE m.nNum	 == 900
	lcResult	= " ������������"
OTHERWISE
	lcResult	= ""
ENDCASE

RETURN m.lcResult
ENDFUNC

FUNCTION	TranslateBeforeThousand(nNum AS Integer, nPadeg	AS	Integer)	AS	String
LOCAL	lcResult

DO	CASE
CASE m.nNum	<=	20
	lcResult	= TranslateNumFrom1To20(m.nNum, m.nPadeg)
CASE m.nNum	>=	21	AND m.nNum <= 99
	LOCAL	nVal1, nVal2
	nVal1	= FLOOR(m.nNum/10)*10
	nVal2	= m.nNum	- m.nVal1
	IF	m.nVal2 == 0
		lcResult	= TranslateNumFrom21To90(m.nVal1, m.nPadeg) + TranslateBeforeThousand(m.nVal2, m.nPadeg)
	ELSE
		lcResult	= TranslateNumFrom21To90(m.nVal1, 2) +	TranslateBeforeThousand(m.nVal2,	m.nPadeg)
	ENDIF
CASE m.nNum	>=	100 AND m.nNum	<=	999
	LOCAL	nVal1, nVal2
	nVal1	= FLOOR(m.nNum/100)*100
	nVal2	= m.nNum	- m.nVal1
	lcResult	= TranslateNumFrom100To900(m.nVal1,	(m.nVal2	!=	0)) +	TranslateBeforeThousand(m.nVal2,	m.nPadeg)
OTHERWISE
	lcResult	= ""
ENDCASE

RETURN m.lcResult
ENDFUNC

FUNCTION	TranslateThousand(nNum AS Integer) AS String
LOCAL	lcResult

DO	CASE
CASE m.nNum	==	1000
	lcResult	= "���������"
CASE m.nNum	> 1000 AND m.nNum	<=	1999
	LOCAL	nVal
	nVal = FLOOR(m.nNum/1000)*1000
	nVal = m.nNum - m.nVal
	lcResult	= "���� ������" +	TranslateBeforeThousand(m.nVal, 1)
CASE m.nNum	==	2000
	lcResult	= "�������������"
CASE m.nNum	> 2000 AND m.nNum	<=	2999
	LOCAL	nVal
	nVal = FLOOR(m.nNum/1000)*1000
	nVal = m.nNum - m.nVal
	lcResult	= "��� ������"	+ TranslateBeforeThousand(m.nVal, 1)
OTHERWISE
	lcResult	= ""
ENDCASE

RETURN m.lcResult
ENDFUNC