lparameters lcDig
local llRes, i
	llRes = Iif(Len(lcDig)>0, .T., .F.)
	for i=1 to Len(lcDig)
		llRes = llRes and IsDigit(Substr(lcDig,i,1))
	next
return llRes
