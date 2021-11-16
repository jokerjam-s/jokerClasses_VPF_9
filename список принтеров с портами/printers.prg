&& Получение списка принтеров с портами в формате Excel
&& 
&& taPRN - массив вида [x,2], где [x,1] - имя принтера
&& 										 [x,2] - порт
#define BUF_SIZE	1024

function GetPrinters
lparameters taPRN
local lcBuf, lnRet, lnPos, i

	Decl_DLL()

	lcBuf = Replicate(Chr(0), BUF_SIZE)
	lnRet = GetProfileString([devices], 0, 0, @lcBuf, BUF_SIZE)

	if lnRet=0
		return 0
	endif

	&& Get printers
	i=1
	do while m.lnRet > 0
		dimension taPRN[i, 2]
		lnPos = At(Chr(0), m.lcBuf)
		taPRN[i,1] = Left(m.lcBuf, m.lnPos-1)
		lcBuf = Substr(m.lcBuf, m.lnPos+1)
		i = i + 1
		m.lnRet = m.lnRet - m.lnPos
	enddo

	&& Get ports
	for i=1 to Alen(taPRN,1)
		taPRN[i,2] = GetPRNPort(taPRN[i,1])
	next

	return Alen(taPRN,1)
endproc

&& return port name for tcPRN_Name, if tcPRN_Name's Name is wrong - empty string
function GetPRNPort
lparameters tcPRN_Name
local lcBuf, lnRet

	Decl_DLL()
	lcBuf = Replicate(Chr(0), BUF_SIZE)
	lnRet = GetProfileString("devices", m.tcPRN_Name, 0, @lcBuf, BUF_SIZE)
	return Substr(lcBuf, At([,],lcBuf)+1, m.lnRet-At([,],lcBuf))
endproc


procedure Decl_DLL
	declare integer GetProfileString in kernel32;
		string lpAppName, string lpKeyName, string lpDefault, string @lpReturnedString, integer nSize
endproc
#undef BUF_SIZE

