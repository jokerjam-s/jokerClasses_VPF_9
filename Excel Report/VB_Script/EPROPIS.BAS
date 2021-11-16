Attribute VB_Name = "numtoword"

Public Function PropisChisla(A As String) As String
 Dim Rubli As String, Kop As String, i As Integer, D(3) As String

     If Len(A) < 0 Then GoTo Err_dlina
     i = InStr(A, ",")
     If i = 0 Then
         Rubli = A
         Kop = "00"
     Else
         Rubli = Left(A, i - 1)
         
         Kop = left(Mid(A, i + 1)+"0", 2)
     End If
     If Len(Rubli) > 9 Then
 Err_dlina:
         PropisChisla = "?"
         Exit Function
     End If
     If Rubli = "0" Then PropisChisla = "Zero dollars": GoTo Kopeiki 
     Select Case Len(Rubli)
         Case 1 To 3: D(1) = Rubli
         Case 4 To 6
             D(1) = Right(Rubli, 3)
             D(2) = Left(Rubli, Len(Rubli) - 3)
         Case 7 To 9
             D(1) = Right(Rubli, 3)
             D(2) = Mid(Rubli, Len(Rubli) - 5, 3)
             D(3) = Left(Rubli, Len(Rubli) - 6)
     End Select
     If Val(D(3)) <> 0 Then
         Tmp = D(3)
         GoSub 10
         If Mid(Tmp, 2, 1) <> "1" Then
             GoSub 20
             Select Case Val(Right(Tmp, 1))
                 Case 1: PropisChisla = PropisChisla + " million"
                 Case 2 To 4: PropisChisla = PropisChisla + " million"
                 Case Else: PropisChisla = PropisChisla + " million"
             End Select
         Else
             PropisChisla = PropisChisla + " million"
         End If
     End If
     If Val(D(2)) <> 0 Then
         Tmp = D(2)
         GoSub 10
         If Mid(Tmp, 2, 1) <> "1" Then
             Select Case Val(Right(Tmp, 1))
                 Case 1: PropisChisla = PropisChisla + " one"
                 Case 2: PropisChisla = PropisChisla + " two"
                 Case 3: PropisChisla = PropisChisla + " three"
                 Case 4: PropisChisla = PropisChisla + " four"
                 Case 5: PropisChisla = PropisChisla + " five"
                 Case 6: PropisChisla = PropisChisla + " six"
                 Case 7: PropisChisla = PropisChisla + " seven"
                 Case 8: PropisChisla = PropisChisla + " eight"
                 Case 9: PropisChisla = PropisChisla + " nine"
             End Select
             Select Case Val(Right(Tmp, 1))
                 Case 1: PropisChisla = PropisChisla + " thousand"
                 Case 2 To 4: PropisChisla = PropisChisla + " thousand"
                 Case Else: PropisChisla = PropisChisla + " thousand"
             End Select
         Else
             PropisChisla = PropisChisla + " thousand"
         End If
     End If
     Tmp = D(1)  
     GoSub 10
     If Mid(Tmp, 2, 1) <> "1" Then
         GoSub 20
         Select Case Val(Right(Tmp, 1))
             Case 1: PropisChisla = PropisChisla + " dollars"
             Case 2 To 4: PropisChisla = PropisChisla + " dollars"
             Case Else: PropisChisla = PropisChisla + " dollars"  
         End Select
     Else
         PropisChisla = PropisChisla + " dollars" 
     End If
 Kopeiki:
     PropisChisla = PropisChisla + " " + Kop
     If Left(Kop, 1) <> "1" Then
         Select Case Val(Right(Kop, 1))
             Case 1: PropisChisla = PropisChisla + " cents"
             Case 2 To 4: PropisChisla = PropisChisla + " cents"
             Case Else: PropisChisla = PropisChisla + " cents"
         End Select
     Else
         PropisChisla = PropisChisla + " cents"
     End If
     PropisChisla = Trim(PropisChisla)
     i = InStr(PropisChisla, " ")
     PropisChisla = StrConv(Left(PropisChisla, i - 1), vbProperCase) _
         + Mid(PropisChisla, i)
     Exit Function
 10:
     Tmp = Right("00" + Tmp, 3)
     Select Case Val(Left(Tmp, 1))
         Case 1: PropisChisla = PropisChisla + " one hundred"  
         Case 2: PropisChisla = PropisChisla + " two hundred"
         Case 3: PropisChisla = PropisChisla + " three hundred"
         Case 4: PropisChisla = PropisChisla + " four hundred"
         Case 5: PropisChisla = PropisChisla + " five hundred"
         Case 6: PropisChisla = PropisChisla + " six hundred"
         Case 7: PropisChisla = PropisChisla + " seven hundred"
         Case 8: PropisChisla = PropisChisla + " eight hundred"
         Case 9: PropisChisla = PropisChisla + " nine hundred"
     End Select
     Select Case Val(Mid(Tmp, 2, 1))
         Case 1
             Select Case Val(Right(Tmp, 1))
                 Case 0: PropisChisla = PropisChisla + " ten"
                 Case 1: PropisChisla = PropisChisla + " eleven"
                 Case 2: PropisChisla = PropisChisla + " twelve"
                 Case 3: PropisChisla = PropisChisla + " thirteen"
                 Case 4: PropisChisla = PropisChisla + " fourteen"
                 Case 5: PropisChisla = PropisChisla + " fifteen"
                 Case 6: PropisChisla = PropisChisla + " sixteen"
                 Case 7: PropisChisla = PropisChisla + " seventeen"
                 Case 8: PropisChisla = PropisChisla + " eighteen"
                 Case 9: PropisChisla = PropisChisla + " nineteen"
             End Select
         Case 2: PropisChisla = PropisChisla + " twenty"
         Case 3: PropisChisla = PropisChisla + " thirty"
         Case 4: PropisChisla = PropisChisla + " fourty"
         Case 5: PropisChisla = PropisChisla + " fifty"
         Case 6: PropisChisla = PropisChisla + " sixty"
         Case 7: PropisChisla = PropisChisla + " seventy"
         Case 8: PropisChisla = PropisChisla + " eighty"
         Case 9: PropisChisla = PropisChisla + " ninety"
     End Select
     Return
 20:
     Select Case Val(Right(Tmp, 1))
         Case 1: PropisChisla = PropisChisla + " one"
         Case 2: PropisChisla = PropisChisla + " two"
         Case 3: PropisChisla = PropisChisla + " three"
         Case 4: PropisChisla = PropisChisla + " four"
         Case 5: PropisChisla = PropisChisla + " five"
         Case 6: PropisChisla = PropisChisla + " six"
         Case 7: PropisChisla = PropisChisla + " seven"
         Case 8: PropisChisla = PropisChisla + " eight"
         Case 9: PropisChisla = PropisChisla + " nine"
     End Select
     Return
 End Function 






