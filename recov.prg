*!*	�� ������ �������.
*!*	����� ������� ?
*!*	�������������� ������

*!*	procedure TFD
&& lparameters n_f
private all like mas

n_f = GetFile('dbf',[����],[�������],0,[���� ��� ��������������])
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
		'���������� ����� ���� ������ - '+upper(n_f)+chr(13)+;
		'������������ ������� ������������ ����.'+chr(13)+;
		'����� ������� ������H�� �����HH�� '+str(n_z-nz_act,4)+' �������'

	h=fopen(n_f,2)
	clen=cnzap(nz_act)
	hed=subst(hed,1,4)+clen+subst(hed,8)
	=fseek(h,0,0)
	nb=fwrite(h,hed)
	yc=fclose(h)
	return (nb<>0 and yc)
else
	wait wind ;
		' ���������� ����� ���� ������ - '+upper(n_f)+chr(13)+;
		'��������� ����������� ����� ������ ��� �������������� ������'+chr(13)+;
		'��������� ��� �� ����� ������'+chr(13)+;
		'����� ������� ������H�� �����HH�� '+str(n_z-nz_act,4)+' ������� !!!'
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