*!*	Со старых запасов.
*!*	Может поможет ?
*!*	восстановление данных

*!*	procedure TFD
&& lparameters n_f
private all like mas

n_f = GetFile('dbf',[Файл],[Открыть],0,[Файл для восстановления])
if Empty(n_f)
	return
endif

if !'.DBF' $ upper(n_f)
	n_f=trim(n_f)+'.dbf'
endif
if !file(n_f)
	return 
endif


h=fopen(n_f)

if h=-1
	retu .f.
endif
mas=fseek(h,0,2)
=fseek(h,8,0)
sl=fread(h,4)
l_h=asc(subst(sl,2,2))*256+asc(subst(sl,1,2))
l_r=asc(subst(sl,4,2))*256+asc(subst(sl,3,2))
=fseek(h,0,0)
nz_act=(mas-l_h-1)/l_r
if nz_act<=0
	nz_act=0
endif

hed=fread(h,l_h)

a1=subs(hed,7,1)
a2=subs(hed,6,1)
a3=subs(hed,5,1)
n_z=asc(a1)*256*256+asc(a2)*256+asc(a3)

if n_z=nz_act
	=fclose(h)
	retu .t.
endif

=fclose(h)

if netf(n_f,2)
	wait wind ;
		'Разрушение файла базы данных - '+upper(n_f)+chr(13)+;
		'производится попытка фосстановить файл.'+chr(13)+;
		'БУДЕТ УТЕРЯНО ПОСЛЕДHИХ ВВЕДЕHHЫХ '+str(n_z-nz_act,4)+' ЗАПИСЕЙ'

	h=fopen(n_f,2)
	clen=cnzap(nz_act)
	hed=subst(hed,1,4)+clen+subst(hed,8)
	=fseek(h,0,0)
	nb=fwrite(h,hed)
	yc=fclose(h)
	return (nb<>0 and yc)
else
	wait wind ;
		' Разрушение файла базы данных - '+upper(n_f)+chr(13)+;
		'Требуется монопольный режим работы для восстановления данных'+chr(13)+;
		'Запустите АРМ на одной машине'+chr(13)+;
		'БУДЕТ УТЕРЯНО ПОСЛЕДHИХ ВВЕДЕHHЫХ '+str(n_z-nz_act,4)+' ЗАПИСЕЙ !!!'
	return  to master
endif
*----------------------------------------------
function cnzap
lparameters np
a11=int(np/(256*256))
a12=int((np-a11*256*256)/256)
a13=np % 256


retu chr(a13)+chr(a12)+chr(a11)
*---------------------------------------------
procedure NETF
lparameters fl,ds
if type('ds')='L'
	ds=0
endif
return (fclose(fopen(fl+iif('.' $ fl,'','.dbf'),ds)))
*====================================