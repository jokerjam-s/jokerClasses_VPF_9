lparameters p1,p2,p3
local oButt[1], lcClass, laFile(1)

m.lcClass = [cmd]

if ASelObj(oButt)>0
	do form cmd_build
	return
endif

local lcMessage, lnOptions, lcTitle

if InstallFile(m.lcClass, [app], [Builder])
	m.lcMessage = [This Builder should be used while in the Form Designer.] + ;
	  [ Right click on any ] + m.lcClass + [ Control and choose "Builder" from the] + ;
	  [ Context Menu.]
else
	m.lcMessage = [This Builder not Installed!]
endif

m.lnOptions = 48
m.lcTitle   = m.lcClass + [ Builder]

= Messagebox(m.lcMessage, m.lnOptions, m.lcTitle)
quit


Procedure InstallFile
Parameters tcName, tcExt, tcTitle

Local lbDoCopy, lcFile1, lcFile2, laFile1(1), laFile2(1), lcData

m.lcFile1 = ADDBS(Justpath(Sys(16,0))) + m.tcName + [.] + m.tcExt
m.lcFile2 = Home() + [Wizards\] + m.tcName + [.] + m.tcExt

lbDoCopy = .F.

If Not File(m.lcFile1)
  m.lcFile1 = Getfile(m.tcExt, [], [], 0, [Where is the file ] + Justfname(m.lcFile1) + [?])
Endif

If Empty(m.lcFile1)
  m.lcMessage = m.tcTitle + [ install canceled!]
  m.lnOptions = 48
  m.tcTitle   =  m.tcName + [ ] + m.tcTitle
  m.lnRetVal = Messagebox(m.lcMessage, m.lnOptions, m.tcTitle)
  return lbDoCopy
Endif

If Not File(m.lcFile2)
  lbDoCopy = .T.
  m.lcMessage = m.tcTitle + [ installed!]
Else
  m.lcMessage = m.tcTitle + [ updated!]
  Adir(m.laFile1,m.lcFile1)
  Adir(m.laFile2,m.lcFile2)
  m.laFile1(1,4) = Strtran(m.laFile1(1,4),[ ],[0])
  m.laFile2(1,4) = Strtran(m.laFile2(1,4),[ ],[0])

  If m.laFile1(1,3) > m.laFile2(1,3)
    lbDoCopy = .T.
  Endif

  If m.laFile1(1,3) = m.laFile2(1,3) And m.laFile1(1,4) > m.laFile2(1,4)
    lbDoCopy = .T.
  endif 
Endif

try
  	select 0
  	use (Home()+'Wizards\builder.dbf') alias tBuilder
  	lbDoCopy = .T.
catch 
  	 lbDoCopy = .F.
endtry
  
m.lcData = Filetostr(m.lcFile1)
Strtofile(m.lcData, m.lcFile2)

m.lnOptions = 64
m.tcTitle   =  m.tcName + [ ] + m.tcTitle
m.lnRetVal = Messagebox(m.lcMessage, m.lnOptions, m.tcTitle)

select tBuilder
locate for Alltrim(type)==[CMD]
if !Found()
	append blank
endif
replace	Name		with [Joker Command Button],;
			Descript	with [Sets Cmd Button property],;
			Type		with [CMD],;
			Program	with [wizards\]+m.tcName + [.] + m.tcExt
use
return lbDoCopy