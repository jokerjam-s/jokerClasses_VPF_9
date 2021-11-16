*--event handler example
Lparameters nEventId,oEr,oWb,oWs,oTarget,nRecord
Local lCancel
lCancel=.F.
Do Case
 Case nEventId=1
  *---DoubleClick
  If Used()
   If Between(nRecord,1,Reccount())
    Go nRecord
    If !Wexist(Alias())
     Brow Norm Nowa
    Endi
    Do ShowScreen
    lCancel= .T.
   Endif 
  Endif 
 Case nEventId=2
 Case nEventId=3
  Do ShowScreen
  Wait 'Event : WorkbookPrint... ' Window  Timeout 1
 Case nEventId=4
  oWb.Saved = .T.
  Do ShowScreen
  Wait 'Event : WorkbookClose... ' Window  Timeout 1
  oEr.Destroy()
Endcase

Return lCancel

*-----------------
Procedure ShowScreen
*------------------
If _Screen.WindowState= 2
 _Screen.WindowState= 1
Endi
_Screen.WindowState= 2
