'������� ������ ����� �������� � ������ � ������� � ��������
'���������: propis(�����[,�������])
'���� ����� �� �����������
'������ �������� - ����� (Variant) �� 10 ����������
'������ �������� =0 - ���������� ����� � ������ ���������,
'                     ��������� - ��������� �������
'               <>0 ���������� ����� ��������� �������
Public Function propis(xsu As Variant,Optional kb As Byte, Optional mb As Byte) As String
On Error GoTo ersupr
If Not IsNumeric(xsu) Then
    propis = ""
    Exit Function
End If
If xsu >= 10000000000000# Then
    propis = "������� ������� �����"
    Exit Function
End If
Dim ssu As String, nsu, edi, des, sot, ind As Byte, i As Integer
If Fix(xsu) = 0 Then
    propis = "���� "
    if kb=0 Then
     propis =propis +"������ "
    end if 
  Else
    ssu = Mid$(Str$(Fix(xsu)), 2)    ' ������ ������ ��� �����
    nsu = (Len(ssu) + 2) \ 3         ' ���������� ����� ����
    ssu = Right$("00", nsu * 3 - Len(ssu)) + ssu ' ��������� ������
    For i = nsu To 1 Step -1
        sot = Val(Mid$(ssu, (nsu - i) * 3 + 1, 1)) ' �����
        des = Val(Mid$(ssu, (nsu - i) * 3 + 2, 1)) ' �������
        edi = Val(Mid$(ssu, (nsu - i) * 3 + 3, 1)) ' �������
        If sot + des + edi > 0 Or i = 1 Then
            If sot > 0 Then
                propis = propis + Choose(sot, "���", "������", "������", _
"���������", "�������", "��������", "�������", "���������", _
"���������") + " "
            End If
            If des = 1 Then
                propis = propis + Choose(edi + 1, "������", "�����������", _
"����������", "����������", "������������", "����������", "�����������", _
"����������", "������������", "������������") + " "
                ind = 3
              Else
                If des <> 0 Then
                    propis = propis + Choose(des - 1, "��������", _
"��������", "�����", "���������", "����������", "���������", "�����������", _
"���������") + " "
                End If
                If edi <> 0 Then ' ��������� ������ ��� ����� (����,���)
                    If i = 2 And (edi = 1 Or edi = 2) Then
                        ind = 9
                      Else
                        ind = 0
                    End If
                    propis = propis + Choose(edi + ind, "����", "���", _
"���", "������", "����", "�����", "����", "������", "������", "����", _
"���") + " "
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
            propis = propis + Choose((i - 1) * 3 + ind,iif(kb=0,"�����",""), iif(kb=0,"�����",""), _
iif(kb=0,"������",""), "������", "������", "�����", "�������", "��������", "���������", _
"��������", "���������", "����������", "��������", "���������", _
"����������") + " "
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
  propis = propis + ssu + Choose(ind, " �������", " �������", " ������")
 End if
End If

propis = UCase$(Left$(propis, 1)) + Mid$(propis, 2)
Exit Function
ersupr:
propis = "������"
End Function

 


 













