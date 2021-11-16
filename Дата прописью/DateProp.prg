*****************************************************************
*						ƒата ѕрописью
*				  yu (rsl_my@mail.ru)
*****************************************************************
FUNCTION	GetDateWrittenOut(dDate	AS	Date,	nPadeg AS Integer) AS String
LOCAL	lcSaveValue, lcResult

lcSaveValue	= SET("DATE")
SET DATE	TO	LONG
lcResult= DTOC(m.dDate)
SET DATE	TO	(m.lcSaveValue)

lcResult= ALLTRIM(STUFF(m.lcResult,	1,	AT(" ", m.lcResult) - 1, TranslateBeforeThousand(DAY(m.dDate),	m.nPadeg)))
lcResult= ALLTRIM(STUFF(m.lcResult,	RAT("	",	m.lcResult,	2)	+ 1, 1000, TranslateThousand(YEAR(m.dDate)))) +	" года"


RETURN m.lcResult
ENDFUNC

*****************************************************************
*	далее	- служебные	процедуры
*****************************************************************

FUNCTION	TranslateNumFrom1To20(nNum	AS	Integer,	nPadeg AS Integer) AS String
LOCAL	lcCompletion, lcResult

IF	m.nPadeg	==	0
	lcCompletion =	"е"
ELSE
	lcCompletion =	"го"
ENDIF

DO	CASE
CASE m.nNum	 == 1
	lcResult	= " перво" + m.lcCompletion
CASE m.nNum	 == 2
	lcResult	= " второ" + m.lcCompletion
CASE m.nNum	 == 3
	lcResult	= " треть" + IIF(m.nPadeg == 0, "",	"е") + m.lcCompletion
CASE m.nNum	 == 4
	lcResult	= " четверто" + m.lcCompletion
CASE m.nNum	 == 5
	lcResult	= " п€то" +	m.lcCompletion
CASE m.nNum	 == 6
	lcResult	= " шесто" + m.lcCompletion
CASE m.nNum	 == 7
	lcResult	= " седьмо"	+ m.lcCompletion
CASE m.nNum	 == 8
	lcResult	= " восьмо"	+ m.lcCompletion
CASE m.nNum	 == 9
	lcResult	= " дев€то"	+ m.lcCompletion
CASE m.nNum	 == 10
	lcResult	= " дес€то"	+ m.lcCompletion
CASE m.nNum	 == 11
	lcResult	= " одиннадцато" + m.lcCompletion
CASE m.nNum	 == 12
	lcResult	= " двенадцато" +	m.lcCompletion
CASE m.nNum	 == 13
	lcResult	= " тринадцато" +	m.lcCompletion
CASE m.nNum	 == 14
	lcResult	= " четырнадцато"	+ m.lcCompletion
CASE m.nNum	 == 15
	lcResult	= " п€тнадцато" +	m.lcCompletion
CASE m.nNum	 == 16
	lcResult	= " шестнадцато" + m.lcCompletion
CASE m.nNum	 == 17
	lcResult	= " семнадцато" +	m.lcCompletion
CASE m.nNum	 == 18
	lcResult	= " восемнадцато"	+ m.lcCompletion
CASE m.nNum	 == 19
	lcResult	= " дев€тнадцато"	+ m.lcCompletion
CASE m.nNum	 == 20
	lcResult	= " двадцато" + m.lcCompletion
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
	lcCompletion= "ое"
CASE m.nPadeg == 1 AND m.nNum	==	90
	lcCompletion =	"го"
CASE m.nPadeg == 1
	lcCompletion =	"ого"
CASE m.nPadeg == 2  AND	m.nNum <	40
	lcCompletion =	"ь"
OTHERWISE
ENDCASE

DO	CASE
CASE m.nNum	 == 20
	lcResult	= " двадцат" +	m.lcCompletion
CASE m.nNum	 == 30
	lcResult	= " тридцат" +	m.lcCompletion
CASE m.nNum	 == 40
	lcResult	= " сорок" + m.lcCompletion
CASE m.nNum	 == 50 AND m.nPadeg == 1
	lcResult	= " п€тидес€т"	+ m.lcCompletion
CASE m.nNum	 == 50
	lcResult	= " п€тьдес€т"	+ m.lcCompletion
CASE m.nNum	 == 60 AND m.nPadeg == 1
	lcResult	= " шестидес€т" +	m.lcCompletion
CASE m.nNum	 == 60
	lcResult	= " шестьдес€т" +	m.lcCompletion
CASE m.nNum	 == 70 AND m.nPadeg == 1
	lcResult	= " семидес€т"	+ m.lcCompletion
CASE m.nNum	 == 70
	lcResult	= " семьдес€т"	+ m.lcCompletion
CASE m.nNum	 == 80 AND m.nPadeg == 1
	lcResult	= " восмидес€т" +	m.lcCompletion
CASE m.nNum	 == 80
	lcResult	= " восемьдес€т" + m.lcCompletion
CASE m.nNum	 == 90
	lcResult	= " дев€носто"	+ m.lcCompletion
OTHERWISE
	lcResult	= ""
ENDCASE

RETURN m.lcResult
ENDFUNC

FUNCTION	TranslateNumFrom100To900(nNum	AS	Integer,	bIsInteger AS Boolean) AS String
LOCAL	lcResult

DO	CASE
CASE m.nNum	 == 100 AND	m.bIsInteger
	lcResult	= " сто"
CASE m.nNum	 == 100
	lcResult	= " сотого"
CASE m.nNum	 == 200 AND	m.bIsInteger
	lcResult	= " двести"
CASE m.nNum	 == 200
	lcResult	= " двухсотого"
CASE m.nNum	 == 300 AND	m.bIsInteger
	lcResult	= " триста"
CASE m.nNum	 == 300
	lcResult	= " трехсотого"
CASE m.nNum	 == 400 AND	m.bIsInteger
	lcResult	= " четыреста"
CASE m.nNum	 == 400
	lcResult	= " четырехсотого"
CASE m.nNum	 == 500 AND	m.bIsInteger
	lcResult	= " п€тьсот"
CASE m.nNum	 == 500
	lcResult	= " п€тисотого"
CASE m.nNum	 == 600 AND	m.bIsInteger
	lcResult	= " шестьсот"
CASE m.nNum	 == 600
	lcResult	= " шестисотого"
CASE m.nNum	 == 700 AND	m.bIsInteger
	lcResult	= " семьсот"
CASE m.nNum	 == 700
	lcResult	= " семисотого"
CASE m.nNum	 == 800 AND	m.bIsInteger
	lcResult	= " восемьсот"
CASE m.nNum	 == 800
	lcResult	= " восьмисотого"
CASE m.nNum	 == 900 AND	m.bIsInteger
	lcResult	= " дев€тьсот"
CASE m.nNum	 == 900
	lcResult	= " дев€тисотого"
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
	lcResult	= "тыс€чного"
CASE m.nNum	> 1000 AND m.nNum	<=	1999
	LOCAL	nVal
	nVal = FLOOR(m.nNum/1000)*1000
	nVal = m.nNum - m.nVal
	lcResult	= "одна тыс€ча" +	TranslateBeforeThousand(m.nVal, 1)
CASE m.nNum	==	2000
	lcResult	= "двухтыс€чного"
CASE m.nNum	> 2000 AND m.nNum	<=	2999
	LOCAL	nVal
	nVal = FLOOR(m.nNum/1000)*1000
	nVal = m.nNum - m.nVal
	lcResult	= "две тыс€чи"	+ TranslateBeforeThousand(m.nVal, 1)
OTHERWISE
	lcResult	= ""
ENDCASE

RETURN m.lcResult
ENDFUNC