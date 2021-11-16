Parameters p1,p2

If Pcount() > 0 Then

  Do Form Builder.scx With m.p1
  Return

Endif

Local lcClass, laFile(1)
Local lcMessage, lnOptions, lcTitle

m.lcClass = [ctl32_ProgressBar]

= InstallFile(m.lcClass, [app], [Builder])

= InstallFile(m.lcClass, [chm], [Help File])

m.lcMessage = [This Builder should be used while in the Form Designer.] + ;
  [ Right click on any ] + m.lcClass + [ Control and choose "Builder" from the] + ;
  [ Context Menu.]
m.lnOptions = 48
m.lcTitle   = m.lcClass + [ Builder]

= Messagebox(m.lcMessage, m.lnOptions, m.lcTitle)

Procedure InstallFile
Parameters tcName, tcExt, tcTitle

Local lbDoCopy, lcFile1, lcFile2, laFile1(1), laFile2(1), lcData

m.lcFile1 = ADDBS(Justpath(Sys(16,0))) + m.tcName + [.] + m.tcExt
m.lcFile2 = Home() + [Wizards\] + m.tcName + [.] + m.tcExt

lbDoCopy = .F.

If Not File(m.lcFile1) Then
  m.lcFile1 = Getfile(m.tcExt, [], [], 0, [Where is the file ] + Justfname(m.lcFile1) + [?])
Endif

If Empty(m.lcFile1) Then
  m.lcMessage = m.tcTitle + [ install canceled!]
  m.lnOptions = 48
  m.tcTitle   =  m.tcName + [ ] + m.tcTitle
  m.lnRetVal = Messagebox(m.lcMessage, m.lnOptions, m.tcTitle)
  Return
Endif

If Not File(m.lcFile2) Then
  lbDoCopy = .T.
  m.lcMessage = m.tcTitle + [ installed!]
Else
  m.lcMessage = m.tcTitle + [ updated!]
  Adir(m.laFile1,m.lcFile1)
  Adir(m.laFile2,m.lcFile2)
  m.laFile1(1,4) = Strtran(m.laFile1(1,4),[ ],[0])
  m.laFile2(1,4) = Strtran(m.laFile2(1,4),[ ],[0])

  If m.laFile1(1,3) > m.laFile2(1,3) Then
    lbDoCopy = .T.
  Endif

  If m.laFile1(1,3) = m.laFile2(1,3) And m.laFile1(1,4) > m.laFile2(1,4) Then
    lbDoCopy = .T.
  Endif

Endif

If lbDoCopy = .F. Then
  Return
Endif

m.lcData = Filetostr(m.lcFile1)
Strtofile(m.lcData, m.lcFile2)

m.lnOptions = 64
m.tcTitle   =  m.tcName + [ ] + m.tcTitle
m.lnRetVal = Messagebox(m.lcMessage, m.lnOptions, m.tcTitle)

Return




