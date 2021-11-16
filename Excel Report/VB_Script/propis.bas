'‘ункци€ вывода суммы прописью в рубл€х и цифрами в копейках
'синтаксис: propis(число[,вариант])
'знак числа не учитываетс€
'первый аргумент - число (Variant) до 10 триллионов
'второй аргумент =0 - возвращает сумму с первой прописной,
'                     остальные - строчными буквами
'               <>0 возвращает сумму строчными буквами
Public Function propis(xsu As Variant,Optional kb As Byte, Optional mb As Byte) As String
On Error GoTo ersupr
If Not IsNumeric(xsu) Then
    propis = ""
    Exit Function
End If
If xsu >= 10000000000000# Then
    propis = "слишком большое число"
    Exit Function
End If
Dim ssu As String, nsu, edi, des, sot, ind As Byte, i As Integer
If Fix(xsu) = 0 Then
    propis = "ноль "
    if kb=0 Then
     propis =propis +"рублей "
    end if 
  Else
    ssu = Mid$(Str$(Fix(xsu)), 2)    ' строка рублей без знака
    nsu = (Len(ssu) + 2) \ 3         ' количество троек цифр
    ssu = Right$("00", nsu * 3 - Len(ssu)) + ssu ' добавл€ем нул€ми
    For i = nsu To 1 Step -1
        sot = Val(Mid$(ssu, (nsu - i) * 3 + 1, 1)) ' сотни
        des = Val(Mid$(ssu, (nsu - i) * 3 + 2, 1)) ' дес€тки
        edi = Val(Mid$(ssu, (nsu - i) * 3 + 3, 1)) ' единицы
        If sot + des + edi > 0 Or i = 1 Then
            If sot > 0 Then
                propis = propis + Choose(sot, "сто", "двести", "триста", _
"четыреста", "п€тьсот", "шестьсот", "семьсот", "восемьсот", _
"дев€тьсот") + " "
            End If
            If des = 1 Then
                propis = propis + Choose(edi + 1, "дес€ть", "одиннадцать", _
"двенадцать", "тринадцать", "четырнадцать", "п€тнадцать", "шестнадцать", _
"семнадцать", "восемнадцать", "дев€тнадцать") + " "
                ind = 3
              Else
                If des <> 0 Then
                    propis = propis + Choose(des - 1, "двадцать", _
"тридцать", "сорок", "п€тьдес€т", "шестьдес€т", "семьдес€т", "восемьдес€т", _
"дев€носто") + " "
                End If
                If edi <> 0 Then ' вычисл€ем индекс дл€ тыс€ч (одна,две)
                    If i = 2 And (edi = 1 Or edi = 2) Then
                        ind = 9
                      Else
                        ind = 0
                    End If
                    propis = propis + Choose(edi + ind, "один", "два", _
"три", "четыре", "п€ть", "шесть", "семь", "восемь", "дев€ть", "одна", _
"две") + " "
                End If
                Select Case edi
                    Case 1
                        ind = 1
                    Case 2, 3, 4
                        ind = 2
                    Case Else
                        ind = 3
                End Select
            End If
            propis = propis + Choose((i - 1) * 3 + ind,iif(kb=0,"рубль",""), iif(kb=0,"рубл€",""), _
iif(kb=0,"рублей",""), "тыс€ча", "тыс€чи", "тыс€ч", "миллион", "миллиона", "миллионов", _
"миллиард", "миллиарда", "миллиардов", "триллион", "триллиона", _
"триллионов") + " "
        End If
    Next i
End If
ssu = Right$(Format$(xsu, "0.00"), 2)
des = Val(Left$(ssu, 1))
edi = Val(Right$(ssu, 1))
If des = 1 Then
    ind = 3
  Else
    Select Case edi
        Case 1
            ind = 1
        Case 2, 3, 4
            ind = 2
        Case Else
            ind = 3
    End Select
End If

If mb = 0 Then
 if kb=0 then
  propis = propis + ssu + Choose(ind, " копейка", " копейки", " копеек")
 End if
End If

propis = UCase$(Left$(propis, 1)) + Mid$(propis, 2)
Exit Function
ersupr:
propis = "ошибка"
End Function

 


 













