#Define CalculMessage '������ ������ �� �������...'
#Define NoOpenDbf '�� ���������� �������� ������� � ������� ������� ������� '
#Define NoColumField '�� ������� ���� ��� �������� �������'
#Define NoRowField  '�� ���������� ����� ��� �������� �����'
#Define BadColumnFieldType  '�������� ��� ���� ��� ���������� �������'
#Define NoDataField  '�� ���������� ����� ��� ������ x-�������'
#Define BadDataColumnType '�������� ��� ����� ������'
#Define MaxColumns  '���������� �������������� ������� ��������� 255'
#Define NoKeyFieldFound '�������� ���� ,�������� � cKeyFieldList �� �������'
#Define InfoMessage  '�������� ������������ ������� ...'
#Define ErXt_Info  '��������� ������������ ������ er_Xtab'

#If Val(Substr(Version(),15,2))<=7
 #Define ErXFieldPrefix  'x'
#Else 
 #Define ErXFieldPrefix  '_'
#EndIf 