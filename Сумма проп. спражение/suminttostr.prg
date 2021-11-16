********************************************************************************************
*   ����� ��������   Visual   FoxPro
*
*  ��������� ����� �� 0 �� 999'999'999'999,99
*  ���������� ��������� ������ � ������ � ������
*
*  ���� ����� �������������, �� ����� ������ �����.
*  �� ������� �� ������ ����������, ����� ������ �������� �������� ��� ������,
*  � ������ "������" � "������" ����������� ��������������� �����.
*
*  ����������� �� �������� ��� ������������� ������ � ����� �� �����������.
*
* ���������
* tnSum - ����� , tnPron - ��� ��������� (1-���., 2-���., 3-��.)
********************************************************************************************
function SumIntToStr
lparameters tnSum, tnPron
local cRet,AswCounter,AswS,Asw,Asw1

cRet=""
tnSum=iif(empty(m.tnSum),0,abs(m.tnSum))
tnPron=iif(empty(m.tnPron),1,iif(not between(m.tnPron,1,3),1,m.tnPron))

AswS=str(tnSum,15,2)
for AswCounter=1 to 10 step 3
	Asw=substr(m.AswS,m.AswCounter,3)
	if Asw<>space(3)
	   Asw1=""
	   do case
	      case  substr(m.Asw,1,1)="1"
	         Asw1="��� "
	      case  substr(m.Asw,1,1)="2"
	         Asw1="������ "
	      case  substr(m.Asw,1,1)="3"
	         Asw1="������ "
	      case  substr(m.Asw,1,1)="4"
	         Asw1="��������� "
	      case  substr(m.Asw,1,1)="5"
	         Asw1="������� "
	      case  substr(m.Asw,1,1)="6"
	         Asw1="�������� "
	      case  substr(m.Asw,1,1)="7"
	         Asw1="������� "
	      case  substr(m.Asw,1,1)="8"
	         Asw1="��������� "
	      case  substr(m.Asw,1,1)="9"
	         Asw1="��������� "
	   endcase
	   cRet=m.cRet+m.Asw1
	   Asw1=""
	   if substr(m.Asw,2,1)="1"
	      do case
	         case substr(m.Asw,3,1)="0"
	            Asw1="������ "
	         case substr(m.Asw,3,1)="1"
	            Asw1="����������� "
	         case substr(m.Asw,3,1)="2"
	            Asw1="���������� "
	         case substr(m.Asw,3,1)="3"
	            Asw1="���������� "
	         case substr(m.Asw,3,1)="4"
	            Asw1="������������ "
	         case substr(m.Asw,3,1)="5"
	            Asw1="���������� "
	         case substr(m.Asw,3,1)="6"
	            Asw1="����������� "
	         case substr(m.Asw,3,1)="7"
	            Asw1="���������� "
	         case substr(m.Asw,3,1)="8"
	            Asw1="������������ "
	         case substr(m.Asw,3,1)="9"
	            Asw1="������������ "
	      endcase
	      cRet=m.cRet+m.Asw1
	      do case
	         case m.AswCounter=1
	            cRet=m.cRet+"���������� "
	         case m.AswCounter=4
	            cRet=m.cRet+"��������� "
	         case m.AswCounter=7
	            cRet=m.cRet+"����� "
	      endcase
	   else
	      do case
	         case substr(m.Asw,2,1)="2"
	            Asw1="�������� "
	         case substr(m.Asw,2,1)="3"
	            Asw1="�������� "
	         case substr(m.Asw,2,1)="4"
	            Asw1="����� "
	         case substr(m.Asw,2,1)="5"
	            Asw1="��������� "
	         case substr(m.Asw,2,1)="6"
	            Asw1="���������� "
	         case substr(m.Asw,2,1)="7"
	            Asw1="��������� "
	         case substr(m.Asw,2,1)="8"
	            Asw1="����������� "
	         case  substr(m.Asw,2,1)="9"
	            Asw1="��������� "
	      endcase
	      cRet=cRet+Asw1
	      Asw1=""
	      do case
	         case substr(m.Asw,1,3)="000"
	            Asw1=""
	         case substr(m.Asw,3,1)="0" and substr(m.Asw,1,3)<>"000"
	            Asw1=iif(m.AswCounter=7,"����� ",;
	             iif(m.AswCounter=1,"���������� ",iif(m.AswCounter=4,"��������� ","")))
	         case substr(m.Asw,3,1)="1"
	            Asw1=iif(m.AswCounter=7,"���� ������ ",;
	             iif(m.AswCounter=1,"���� �������� ",iif(m.AswCounter=4,"���� ������� ",;
	             icase(m.tnPron=1, "����", m.tnPron=2,"����","����"))))
	         case substr(m.Asw,3,1)="2"
	            Asw1=iif(m.AswCounter=7,"��� ������ ",;
	             iif(m.AswCounter=1,"��� ��������� ",iif(m.AswCounter=4,"��� �������� ",;
	             iif(m.tnPron=2, "���", "���"))))
	         case substr(m.Asw,3,1)="3"
	            Asw1=iif(m.AswCounter=7,"��� ������ ",;
	             "��� "+iif(AswCounter=1,"��������� ",iif(m.AswCounter=4,"�������� ","")))
	         case substr(m.Asw,3,1)="4"
	            Asw1=iif(m.AswCounter=7,"������ ������ ",;
	             "������ "+iif(AswCounter=1,"��������� ",iif(m.AswCounter=4,"�������� ","")))
	         case substr(m.Asw,3,1)="5"
	            Asw1=iif(m.AswCounter=7,"���� ����� ",;
	             "���� "+iif(m.AswCounter=1,"���������� ",iif(m.AswCounter=4,"��������� ","")))
	         case substr(m.Asw,3,1)="6"
	            Asw1=iif(m.AswCounter=7,"����� ����� ",;
	             "����� "+iif(AswCounter=1,"���������� ",iif(m.AswCounter=4,"��������� ","")))
	         case substr(m.Asw,3,1)="7"
	            Asw1=iif(m.AswCounter=7,"���� ����� ",;
	             "���� "+iif(AswCounter=1,"���������� ",iif(m.AswCounter=4,"��������� ","")))
	         case substr(m.Asw,3,1)="8"
	            Asw1=iif(m.AswCounter=7,"������ ����� ",;
	             "������ "+iif(m.AswCounter=1,"���������� ",iif(m.AswCounter=4,"��������� ","")))
	         case substr(m.Asw,3,1)="9"
	            Asw1=iif(m.AswCounter=7,"������ ����� ",;
	             "������ "+iif(m.AswCounter=1,"���������� ",iif(m.AswCounter=4,"��������� ","")))
	      endcase
	      cRet=m.cRet+m.Asw1
	   endif
	endif
endfor

cRet=upper(left(m.cRet,1))+substr(m.cRet,2)
if m.tnSum<1
   cRet="���� "+m.cRet
endif
return m.cRet