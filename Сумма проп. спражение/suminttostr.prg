********************************************************************************************
*   —”ћћј ѕ–ќѕ»—№ё   Visual   FoxPro
*
*  ѕринимает число от 0 до 999'999'999'999,99
*  ¬озвращает текстовую строку с суммой в рубл€х
*
*  ≈сли число отрицательное, то берет модуль числа.
*  ѕо желании не сложно доработать, чтобы второй параметр указывал тип валюты,
*  и вместо "рублей" и "копеек" подставл€ть соответствующие слова.
*
*  ќптимизаци€ по скорости дл€ многократного вызова в цикле не проводилась.
*
* ѕараметры
* tnSum - сумма , tnPron - род склонени€ (1-муж., 2-жен., 3-ср.)
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
	         Asw1="сто "
	      case  substr(m.Asw,1,1)="2"
	         Asw1="двести "
	      case  substr(m.Asw,1,1)="3"
	         Asw1="триста "
	      case  substr(m.Asw,1,1)="4"
	         Asw1="четыреста "
	      case  substr(m.Asw,1,1)="5"
	         Asw1="п€тьсот "
	      case  substr(m.Asw,1,1)="6"
	         Asw1="шестьсот "
	      case  substr(m.Asw,1,1)="7"
	         Asw1="семьсот "
	      case  substr(m.Asw,1,1)="8"
	         Asw1="восемьсот "
	      case  substr(m.Asw,1,1)="9"
	         Asw1="дев€тьсот "
	   endcase
	   cRet=m.cRet+m.Asw1
	   Asw1=""
	   if substr(m.Asw,2,1)="1"
	      do case
	         case substr(m.Asw,3,1)="0"
	            Asw1="дес€ть "
	         case substr(m.Asw,3,1)="1"
	            Asw1="одиннадцать "
	         case substr(m.Asw,3,1)="2"
	            Asw1="двенадцать "
	         case substr(m.Asw,3,1)="3"
	            Asw1="тринадцать "
	         case substr(m.Asw,3,1)="4"
	            Asw1="четырнадцать "
	         case substr(m.Asw,3,1)="5"
	            Asw1="п€тнадцать "
	         case substr(m.Asw,3,1)="6"
	            Asw1="шестнадцать "
	         case substr(m.Asw,3,1)="7"
	            Asw1="семнадцать "
	         case substr(m.Asw,3,1)="8"
	            Asw1="восемнадцать "
	         case substr(m.Asw,3,1)="9"
	            Asw1="дев€тнадцать "
	      endcase
	      cRet=m.cRet+m.Asw1
	      do case
	         case m.AswCounter=1
	            cRet=m.cRet+"миллиардов "
	         case m.AswCounter=4
	            cRet=m.cRet+"миллионов "
	         case m.AswCounter=7
	            cRet=m.cRet+"тыс€ч "
	      endcase
	   else
	      do case
	         case substr(m.Asw,2,1)="2"
	            Asw1="двадцать "
	         case substr(m.Asw,2,1)="3"
	            Asw1="тридцать "
	         case substr(m.Asw,2,1)="4"
	            Asw1="сорок "
	         case substr(m.Asw,2,1)="5"
	            Asw1="п€тьдес€т "
	         case substr(m.Asw,2,1)="6"
	            Asw1="шестьдес€т "
	         case substr(m.Asw,2,1)="7"
	            Asw1="семьдес€т "
	         case substr(m.Asw,2,1)="8"
	            Asw1="восемьдес€т "
	         case  substr(m.Asw,2,1)="9"
	            Asw1="дев€носто "
	      endcase
	      cRet=cRet+Asw1
	      Asw1=""
	      do case
	         case substr(m.Asw,1,3)="000"
	            Asw1=""
	         case substr(m.Asw,3,1)="0" and substr(m.Asw,1,3)<>"000"
	            Asw1=iif(m.AswCounter=7,"тыс€ч ",;
	             iif(m.AswCounter=1,"миллиардов ",iif(m.AswCounter=4,"миллионов ","")))
	         case substr(m.Asw,3,1)="1"
	            Asw1=iif(m.AswCounter=7,"одна тыс€ча ",;
	             iif(m.AswCounter=1,"один миллиард ",iif(m.AswCounter=4,"один миллион ",;
	             icase(m.tnPron=1, "один", m.tnPron=2,"одна","одно"))))
	         case substr(m.Asw,3,1)="2"
	            Asw1=iif(m.AswCounter=7,"две тыс€чи ",;
	             iif(m.AswCounter=1,"два миллиарда ",iif(m.AswCounter=4,"два миллиона ",;
	             iif(m.tnPron=2, "две", "два"))))
	         case substr(m.Asw,3,1)="3"
	            Asw1=iif(m.AswCounter=7,"три тыс€чи ",;
	             "три "+iif(AswCounter=1,"миллиарда ",iif(m.AswCounter=4,"миллиона ","")))
	         case substr(m.Asw,3,1)="4"
	            Asw1=iif(m.AswCounter=7,"четыре тыс€чи ",;
	             "четыре "+iif(AswCounter=1,"миллиарда ",iif(m.AswCounter=4,"миллиона ","")))
	         case substr(m.Asw,3,1)="5"
	            Asw1=iif(m.AswCounter=7,"п€ть тыс€ч ",;
	             "п€ть "+iif(m.AswCounter=1,"миллиардов ",iif(m.AswCounter=4,"миллионов ","")))
	         case substr(m.Asw,3,1)="6"
	            Asw1=iif(m.AswCounter=7,"шесть тыс€ч ",;
	             "шесть "+iif(AswCounter=1,"миллиардов ",iif(m.AswCounter=4,"миллионов ","")))
	         case substr(m.Asw,3,1)="7"
	            Asw1=iif(m.AswCounter=7,"семь тыс€ч ",;
	             "семь "+iif(AswCounter=1,"миллиардов ",iif(m.AswCounter=4,"миллионов ","")))
	         case substr(m.Asw,3,1)="8"
	            Asw1=iif(m.AswCounter=7,"восемь тыс€ч ",;
	             "восемь "+iif(m.AswCounter=1,"миллиардов ",iif(m.AswCounter=4,"миллионов ","")))
	         case substr(m.Asw,3,1)="9"
	            Asw1=iif(m.AswCounter=7,"дев€ть тыс€ч ",;
	             "дев€ть "+iif(m.AswCounter=1,"миллиардов ",iif(m.AswCounter=4,"миллионов ","")))
	      endcase
	      cRet=m.cRet+m.Asw1
	   endif
	endif
endfor

cRet=upper(left(m.cRet,1))+substr(m.cRet,2)
if m.tnSum<1
   cRet="Ќоль "+m.cRet
endif
return m.cRet