local loGUID, lcGUID, i

for i=1 to 2
	loGUID = CreateObject("scriptlet.typelib")
	lcGUID = Substr(loGUID.GUID, 2, 36)+Chr(10)
	StrToFile(m.lcGUID, "GUID.txt",Iif(i=1, 0,1))
next

quit