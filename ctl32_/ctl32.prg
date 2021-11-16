#Include "D:\JokerClasses\For VFP_9\ctl32_\ctl32.h"
Local lcPath

m.lcPath = Addbs(Justpath(Sys(16)))

If Empty(Set("Path"))
	Set Path To (m.lcPath)
Else
	If Not m.lcPath $ Set("Path")
		Set Path To (Set("Path") + ";" + m.lcPath)
	Endif
Endif

*!* Load the main visual classes VCX file:
Set Classlib To m.lcPath + "ctl32.vcx" Additive

*!* Load ctl32 modules:
Do ctl32_api.prg
Do ctl32_classes.prg
Do ctl32_functions.prg
Do ctl32_structures.prg

Return


