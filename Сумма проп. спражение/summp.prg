LPARAMETERS eSumma, elKop
LOCAL v,v123,n1,n2,n12,n3,e10m,e10z,e19,e90,e900,c123,cSumma,lni,cBig,cSmall
m.cSumma=CHRTRAN(IIF(VARTYPE(m.eSumma)='N',TRANSFORM(m.eSumma,'@l'),m.eSumma),',','.')
m.cSumma=m.cSumma+IIF(VARTYPE(m.eSumma)='N','',IIF(AT('.',m.cSumma)>0,REPLICATE('0',2-LEN(m.cSumma)+AT('.',m.cSumma)),'.00'))
m.cSumma=PADL(m.cSumma,3*CEILING(LEN(m.cSumma)/3))
m.e900='���, ������, ������, ���������, �������, ��������, �������, ���������, ���������,'
m.e90='������, ��������, ��������, �����, ���������, ����������, ���������, �����������, ���������,'
m.e19='�����������, ����������, ����������, ������������, ����������, �����������, ����������, ������������, ������������,'
m.e10m='����, ���, ���, ������, ����, �����, ����, ������, ������,'
m.e10z='����, ���, ���, ������, ����, �����, ����, ������, ������,'
m.m='����� ������� �������� �������� ����������� ����������� ����������� ���������� ��������� ��������� ���������'
m.v=''
FOR lni=LEN(m.cSumma)/3-1 TO 1 STEP -1
	m.c123=SUBSTR(m.cSumma,LEN(m.cSumma)-2-3*lni,3)
	m.n12=IIF(BETWEEN(RIGHT(m.c123,2),'11','19'),VAL(RIGHT(m.c123,1)),0)
	m.n2=IIF(m.n12=0,VAL(SUBSTR(m.c123,2,1)),0)
	m.n1=IIF(m.n12=0 and m.n2#1,VAL(RIGHT(m.c123,1)),0)
	m.n3=VAL(LEFT(m.c123,1))
	m.v123=GETWORDNUM(m.e900,n3)+GETWORDNUM(m.e19,m.n12)+GETWORDNUM(m.e90,m.n2)+GETWORDNUM(IIF(lni=2,m.e10z,m.e10m),m.n1)
	m.v=m.v+m.v123+IIF(lni=1,'',IIF(VAL(m.c123)>0,GETWORDNUM(m.m,lni-1)+IIF(m.n1=1,IIF(lni=2,'a',''),IIF(BETWEEN(m.n1,2,4),IIF(lni=2,'�','�'),IIF(lni=2,'','��')))+',',''))
ENDFOR
m.v=IIF(EMPTY(m.v),'���� ',m.v)
m.cBig='����'+ICASE(m.n12>0 OR m.n1=0 OR BETWEEN(m.n1,5,9),'��',m.n12=0 AND BETWEEN(m.n1,2,4),'�','�')+' '
m.cSmall=' ����'+ICASE(LEFT(RIGHT(m.cSumma,2),1)='1' OR RIGHT(m.cSumma,1)='0' OR BETWEEN(RIGHT(m.cSumma,1),'5','9'),'��',BETWEEN(RIGHT(m.cSumma,1),'2','4'),'���','���')

RETURN CHRTRAN(PROPER(m.v),',',' ') + m.cBig + Iif(m.elKop, RIGHT(m.cSumma,2) + m.cSmall, '')
