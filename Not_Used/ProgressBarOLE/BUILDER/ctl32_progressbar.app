���   'R �Q �                     �20$   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Screen                                                                                            WINDOWS _1QQ014NWE 8782492606      M  d      {                          �      �                       WINDOWS _1QQ014NWF 879060106�      �              �  �E                                              WINDOWS _1QQ17D4H5 879060106h      y  �  �  �                                                           WINDOWS _1QQ17D4H6 878341968P      e  z  �  �      E  �%                                               WINDOWS _1QQ17D4H7 878341968�      �  �  �         �   m#                                               WINDOWS _1QQ17D4H8 878341968�!      "  &"  6"  V"      �"  �                                                WINDOWS _1QQ17D4H9 878341968g$      |$  �$  �$  �$      R%  �                                               WINDOWS _1QQ17D4HA 878341968�&      �&  �&  �&  �&                                                           WINDOWS _1QQ17D4HB 878341968�'      �'  �'  �'  �'                                                           WINDOWS _1QQ17D4HC 878341968�(      �(  �(  �(  )      �)  �                                               WINDOWS _1QQ17D4HD 8783419686+      K+  `+  p+  �+      !,  �                                               WINDOWS _1QQ17D4HE 878341968v-      �-  �-  �-  �-                                                           WINDOWS _1QQ17D4HF 878341968�.      �.  �.  �.  �.                                                           WINDOWS _1QQ17D4HG 878341968w/      �/  �/  �/  �/                                                           WINDOWS _1QQ17D4HH 878341968m0      z0  �0  �0  �0                                                           WINDOWS _1QR0PH28K 878341968g1      w1  �1  �1  �1                                                           WINDOWS _1QR0PH28L 878341968�2      �2  �2  �2  3                                                           WINDOWS _1QR0PH28M 878341968�3      	4  4  )4  I4                                                           WINDOWS _1QR0PH28N 878341968:5      J5  Z5  h5  �5                                                           WINDOWS _1QQ17D4HL 878341968�6      �6  �6  �6  �6      �7                                                 WINDOWS _1QQ17D4HM 878341968�8      �8  �8  9  (9      �9                                                 WINDOWS _1QQ17D4HN 8783419683;      @;  M;  [;  {;                                                           WINDOWS _1QQ17D4HO 878341968,<      <<  L<  \<  |<                                                           WINDOWS _1QQ17D4HP 878341968m=      }=  �=  �=  �=                                                           WINDOWS _1QQ17D4HR 878356761�>      �>  �>  �>  ?      �?                                                 WINDOWS _1QQ17D4HS 878341968�@      �@  A  A  6A                                                           WINDOWS _1QQ17D4HT 878356761�A      �A   B  B  3B      �B                                                 WINDOWS _1QQ17D4HU 878341968D      �@  /D  =D  ]D                                                           WINDOWS _1QQ17D4HV 878356761 D      D  #;  �C  	E      �E                                                 WINDOWS _1QQ17D4HW 878341968�8      i-  (+  �C  C                                                           WINDOWS _1QQ17D4HX 878343385�@      �@  ;  �8  %@      �?  >                                               WINDOWS _1QQ17D4HY 879060106�8  }8  n8  ^8  O8  /:                                                           WINDOWS _1QQ014NWE 878343671:8      %8  8  8  �,      �,  X                                               WINDOWS _1QR0OU546 878343385{,      +      �*      Z*  �                                               COMMENT RESERVED                                0*                      �                                    On                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      ..\..\include\foxpro.h      dataenvironment      dataenvironment      Dataenvironment      YTop = 0
Left = 0
Width = 0
Height = 0
DataSource = .NULL.
Name = "Dataenvironment"
      1      1      form      form      builder     zHeight = 237
Width = 440
DoCreate = .T.
Tag = "ctl32_ProgressBar"
AutoCenter = .T.
BorderStyle = 2
Caption = "Builder"
FontName = "Tahoma"
FontSize = 8
WindowType = 1
AllowOutput = .F.
_memberdata =      135<VFPData><memberdata name="opb" type="property" display="OPB"/><memberdata name="update" type="method" display="Update"/></VFPData>
Name = "builder"
      PROCEDURE update
With Thisform

  Aselobj(oCR)

  If Not m.oCR(1).BackColor = .oControl.BackColor
    m.oCR(1).BackColor = .oControl.BackColor
  Endif
  If Not m.oCR(1).BarColor = .oControl.BarColor
    m.oCR(1).BarColor = .oControl.BarColor
  ENDIF
  If Not m.oCR(1).BorderColor = .oControl.BorderColor
    m.oCR(1).BorderColor = .oControl.BorderColor 
  ENDIF
  
  If Not m.oCR(1).Flat = .oControl.Flat
    m.oCR(1).Flat = .oControl.Flat
  Endif
  If Not m.oCR(1).Marquee = .oControl.Marquee
    m.oCR(1).Marquee = .oControl.Marquee
  Endif
  If Not m.oCR(1).MarqueeSpeed = .oControl.MarqueeSpeed
    m.oCR(1).MarqueeSpeed = .oControl.MarqueeSpeed
  Endif
  If Not m.oCR(1).Maximum = .oControl.Maximum
    m.oCR(1).Maximum = .oControl.Maximum
  Endif
  If Not m.oCR(1).Minimum = .oControl.Minimum
    m.oCR(1).Minimum = .oControl.Minimum
  Endif
  If Not m.oCR(1).Play = .oControl.Play
    m.oCR(1).Play = .oControl.Play
  Endif
  If Not m.oCR(1).Repeat = .oControl.Repeat
    m.oCR(1).Repeat = .oControl.Repeat
  Endif
  If Not m.oCR(1).SizeAdjust = .oControl.SizeAdjust
    m.oCR(1).SizeAdjust = .oControl.SizeAdjust
  Endif
  If Not m.oCR(1).Smooth = .oControl.Smooth
    m.oCR(1).Smooth = .oControl.Smooth
  Endif
  If Not m.oCR(1).Step = .oControl.Step
    m.oCR(1).Step = .oControl.Step
  Endif
  If Not m.oCR(1).Themes = .oControl.Themes
    m.oCR(1).Themes = .oControl.Themes
  Endif

Endwith

ENDPROC
PROCEDURE Unload
SET HELP TO

ENDPROC
PROCEDURE Init
Parameters oControlRef

Thisform.Caption = Thisform.Tag + [ Builder]

If File(Home() + [WIZARDS\CTL32_PROGRESSBAR.CHM]) Then
  Set Help To Home() + [WIZARDS\CTL32_PROGRESSBAR.CHM]
Endif


With Thisform

  If Type("m.oControlRef") = [O] And Upper(m.oControlRef.Class) = [CTL32_PROGRESSBAR] Then

    .oControl.BackColor = m.oControlRef.BackColor
    .oControl.BarColor = m.oControlRef.BarColor
    .oControl.BorderColor = m.oControlRef.BorderColor
    .oControl.Flat = m.oControlRef.Flat
    .oControl.Marquee = m.oControlRef.Marquee
    .oControl.MarqueeSpeed = m.oControlRef.MarqueeSpeed
    .oControl.Maximum = m.oControlRef.Maximum
    .oControl.Minimum = m.oControlRef.Minimum
    .oControl.Play = m.oControlRef.Play
    .oControl.Repeat = m.oControlRef.Repeat
    .oControl.SizeAdjust = m.oControlRef.SizeAdjust
    .oControl.Smooth = m.oControlRef.Smooth
    .oControl.Step = m.oControlRef.Step
    .oControl.Themes = m.oControlRef.Themes

  Else
    Thisform.cmd_Accept.Enabled = .F.
  Endif

  .pageframe1.page2.spn_marqueespeed.Value = .oControl.MarqueeSpeed
  .pageframe1.page3.spn_minimum.Value = .oControl.Minimum
  .pageframe1.page3.spn_maximum.Value = .oControl.Maximum
  .pageframe1.page3.spn_step.Value = .oControl.Step

Endwith

ENDPROC
      ����    �   �                         ^�   %   :       O      I           �  U  
  $�  � U   Click,     ��1 q 3                              )   �                         ����    �   �                         8�   %   e       |      t           �  U    ��C�  � ��
 ��  � � U  THISFORM UPDATE RELEASE Click,     ��1 � � 2                       8       )   �                         ����    �   �                         ��   %   P       e      _           �  U   
 ��  � � U  THISFORM RELEASE Click,     ��1 � 2                       #       )   �                         ����    �   �                         4S   %   p       �      �           �  U    T�  � � �� � �� U  THISFORM OCONTROL STEP THIS VALUE InteractiveChange,     ��1 a1                       @       )   �                         ����    �   �                         �)   %   s       �      �           �  U    T�  � � �� � �� U  THISFORM OCONTROL MAXIMUM THIS VALUE InteractiveChange,     ��1 a1                       C       )   �                         ����    �   �                         �)   %   s       �      �           �  U    T�  � � �� � �� U  THISFORM OCONTROL MINIMUM THIS VALUE InteractiveChange,     ��1 a1                       C       )   �                         ����    �   �                         �   %   x       �      �           �  U    T�  � � �� � �� U  THISFORM OCONTROL MARQUEESPEED THIS VALUE InteractiveChange,     ��1 a1                       H       )   �                         ����    �   �                         ��   %   P       e      _           �  U   
 ��  � � U  THISFORM REFRESH Click,     ��1 � 1                       !       )   �                         ����    �   �                         �@   %   {       �      �           �  U  !  T�  � � ������
 ��  � � U  THISFORM OCONTROL BORDERCOLOR REFRESH Click,     ��1 A� 2                       G       )   �                         ����    �   �                         �   %   �       �      �           �  U  )  T�  � � �C�  � � ���
 ��  � � U  THISFORM OCONTROL BORDERCOLOR REFRESH Click,     ��1 �� 3                       n       )   �                         #  ..\..\..\include\foxpro.h����1      builder      cmd_Help      @_memberdata XML Metadata for customizable properties
*update 
      	pageframe      	pageframe      
Pageframe1      builder     �ErasePage = .T.
PageCount = 3
TabStyle = 1
Top = 6
Left = 6
Width = 426
Height = 156
TabIndex = 1
Name = "Pageframe1"
Page1.FontName = "Tahoma"
Page1.FontSize = 8
Page1.Caption = "Layout"
Page1.Name = "Page1"
Page2.FontName = "Tahoma"
Page2.FontSize = 8
Page2.Caption = "Options"
Page2.Name = "Page2"
Page3.FontName = "Tahoma"
Page3.FontSize = 8
Page3.Caption = "Values"
Page3.Name = "Page3"
      commandbutton      commandbutton      Command2      builder.Pageframe1.Page1      �Top = 18
Left = 227
Height = 23
Width = 23
FontName = "Tahoma"
FontSize = 8
Caption = "..."
TabIndex = 6
Alignment = 2
Name = "Command2"
      sPROCEDURE Click
Thisform.oControl.BackColor = Getcolor(Thisform.oControl.BackColor)
Thisform.Refresh

ENDPROC
      ����    �   �                         t   %   x       �      �           �  U  !  T�  � � ������
 ��  � � U  THISFORM OCONTROL BARCOLOR REFRESH Click,     ��1 A� 2                       D       )   �                         commandbutton      commandbutton      Command3      builder.Pageframe1.Page1      �Top = 18
Left = 341
Height = 23
Width = 48
FontName = "Tahoma"
FontSize = 8
Caption = "Default"
TabIndex = 8
Name = "Command3"
      PPROCEDURE Click
Thisform.oControl.BackColor = -1
Thisform.Refresh

ENDPROC
      ����    �   �                         Q�   %   �       �      �           �  U  )  T�  � � �C�  � � ���
 ��  � � U  THISFORM OCONTROL BARCOLOR REFRESH Click,     ��1 �� 3                       h       )   �                         commandbutton      commandbutton      Command4      builder.Pageframe1.Page1      �Top = 48
Left = 227
Height = 23
Width = 23
FontName = "Tahoma"
FontSize = 8
Caption = "..."
TabIndex = 10
Alignment = 2
Name = "Command4"
      sPROCEDURE Click
Thisform.oControl.BarColor = Getcolor(Thisform.oControl.BarColor)
Thisform.Refresh


ENDPROC
      ����    �   �                         �g   %   y       �      �           �  U  !  T�  � � ������
 ��  � � U  THISFORM OCONTROL	 BACKCOLOR REFRESH Click,     ��1 A� 2                       E       )   �                         commandbutton      commandbutton      Command5      builder.Pageframe1.Page1      �Top = 48
Left = 341
Height = 23
Width = 48
FontName = "Tahoma"
FontSize = 8
Caption = "Default"
TabIndex = 12
Name = "Command5"
      OPROCEDURE Click
Thisform.oControl.BarColor = -1
Thisform.Refresh

ENDPROC
      ����    �   �                         ƀ   %   �       �      �           �  U  )  T�  � � �C�  � � ���
 ��  � � U  THISFORM OCONTROL	 BACKCOLOR REFRESH Click,     ��1 �� 2                       h       )   �                         textbox      textbox      Text1      builder.Pageframe1.Page1      �FontName = "Tahoma"
FontSize = 8
ControlSource = "thisform.ocontrol.backcolor"
Height = 23
Left = 257
SelectOnEntry = .T.
TabIndex = 7
Top = 18
Width = 72
Name = "Text1"
      textbox      textbox      Text2      builder.Pageframe1.Page1      �FontName = "Tahoma"
FontSize = 8
ControlSource = "thisform.ocontrol.barcolor"
Height = 23
Left = 257
SelectOnEntry = .T.
TabIndex = 11
Top = 48
Width = 72
Name = "Text2"
      commandbutton      commandbutton      Command6      builder.Pageframe1.Page1      �Top = 78
Left = 227
Height = 23
Width = 23
FontName = "Tahoma"
FontSize = 8
Caption = "..."
TabIndex = 14
Alignment = 2
Name = "Command6"
      yPROCEDURE Click
Thisform.oControl.BorderColor = Getcolor(Thisform.oControl.BorderColor)
Thisform.Refresh


ENDPROC
      "Tahoma, 0, 8, 5, 13, 11, 21, 2, 0
      $PROCEDURE Click
HELP


ENDPROC
      �Top = 204
Left = 12
Height = 23
Width = 60
FontName = "Tahoma"
FontSize = 8
Caption = "Help"
TabIndex = 3
Name = "cmd_Help"
      commandbutton      Label4      commandbutton      commandbutton      Command7      builder.Pageframe1.Page1      �Top = 78
Left = 341
Height = 23
Width = 48
FontName = "Tahoma"
FontSize = 8
Caption = "Default"
TabIndex = 16
Name = "Command7"
      RPROCEDURE Click
Thisform.oControl.BorderColor = -1
Thisform.Refresh

ENDPROC
      commandbutton      CPROCEDURE Click
Thisform.Update()

Thisform.Release

ENDPROC
      �Top = 204
Left = 306
Height = 23
Width = 60
FontName = "Tahoma"
FontSize = 8
Caption = "OK"
TabIndex = 3
Name = "cmd_Accept"
      label      textbox      textbox      Text3      builder.Pageframe1.Page1      �FontName = "Tahoma"
FontSize = 8
ControlSource = "thisform.ocontrol.bordercolor"
Height = 23
Left = 257
SelectOnEntry = .T.
TabIndex = 15
Top = 78
Width = 72
Name = "Text3"
      label      label      Label5      builder.Pageframe1.Page1      �AutoSize = .T.
FontName = "Tahoma"
FontSize = 8
BackStyle = 0
Caption = "BackColor"
Height = 15
Left = 161
Top = 24
Width = 49
TabIndex = 5
Name = "Label5"
      label      label      Label6      builder.Pageframe1.Page1      �AutoSize = .T.
FontName = "Tahoma"
FontSize = 8
BackStyle = 0
Caption = "BarColor"
Height = 15
Left = 161
Top = 54
Width = 43
TabIndex = 9
Name = "Label6"
      label      label      Label7      builder.Pageframe1.Page1      �AutoSize = .T.
FontName = "Tahoma"
FontSize = 8
BackStyle = 0
Caption = "BorderColor"
Height = 15
Left = 161
Top = 84
Width = 59
TabIndex = 13
Name = "Label7"
      checkbox      checkbox      
chk_Themes      builder.Pageframe1.Page1      �Top = 18
Left = 17
Height = 15
Width = 61
FontName = "Tahoma"
FontSize = 8
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "  Themes"
ControlSource = "thisform.ocontrol.themes"
Style = 0
TabIndex = 1
Name = "chk_Themes"
      checkbox      checkbox      
chk_smooth      builder.Pageframe1.Page1      �Top = 90
Left = 17
Height = 15
Width = 60
FontName = "Tahoma"
FontSize = 8
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "  Smooth"
ControlSource = "thisform.ocontrol.smooth"
Style = 0
TabIndex = 4
Name = "chk_smooth"
      checkbox      checkbox      chk_flat      builder.Pageframe1.Page1      �Top = 42
Left = 17
Height = 15
Width = 42
FontName = "Tahoma"
FontSize = 8
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "  Flat"
ControlSource = "thisform.ocontrol.flat"
Style = 0
TabIndex = 2
Name = "chk_flat"
      checkbox      checkbox      Check1      builder.Pageframe1.Page1      �Top = 66
Left = 17
Height = 15
Width = 74
FontName = "Tahoma"
FontSize = 8
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "  SizeAdjust"
ControlSource = "thisform.ocontrol.sizeadjust"
Style = 0
TabIndex = 3
Name = "Check1"
      checkbox      checkbox      chk_marquee      builder.Pageframe1.Page2      �Top = 18
Left = 17
Height = 15
Width = 66
FontName = "Tahoma"
FontSize = 8
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "  Marquee"
ControlSource = "thisform.ocontrol.marquee"
Style = 0
TabIndex = 1
Name = "chk_marquee"
      ,PROCEDURE Click
THISFORM.REFRESH
ENDPROC
      builder      
cmd_Accept      commandbutton      commandbutton      builder      oControl      control      ..\ctl32_progressbar.vcx      ctl32_progressbar      builder      label      spinner      spinner      spn_marqueespeed      builder.Pageframe1.Page2      �FontName = "Tahoma"
FontSize = 8
Height = 23
Increment =  10.00
Left = 173
SelectOnEntry = .T.
TabIndex = 3
Top = 15
Width = 73
Name = "spn_marqueespeed"
      SPROCEDURE InteractiveChange
thisform.oControl.marqueespeed = this.value
ENDPROC
      �Top = 174
Left = 6
Width = 426
Height = 18
TabIndex = 2
value = 50
Name = "oControl"
lblControlNameH.Name = "lblControlNameH"
tmrControlTimer.Name = "tmrControlTimer"
lblControlNameV.Name = "lblControlNameV"
      
cmd_Cancel      spn_step      label      label      Label1      builder.Pageframe1.Page2      �AutoSize = .T.
FontName = "Tahoma"
FontSize = 8
BackStyle = 0
Caption = "MarqueeSpeed"
Height = 15
Left = 89
Top = 19
Width = 74
TabIndex = 2
Name = "Label1"
      checkbox      checkbox      chk_play      builder.Pageframe1.Page2      �Top = 42
Left = 17
Height = 15
Width = 44
FontName = "Tahoma"
FontSize = 8
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "  Play"
ControlSource = "thisform.ocontrol.play"
Style = 0
TabIndex = 4
Name = "chk_play"
      checkbox      checkbox      
chk_repeat      builder.Pageframe1.Page2      �Top = 66
Left = 17
Height = 15
Width = 59
FontName = "Tahoma"
FontSize = 8
AutoSize = .T.
Alignment = 0
BackStyle = 0
Caption = "  Repeat"
ControlSource = "thisform.ocontrol.repeat"
Style = 0
TabIndex = 5
Name = "chk_repeat"
      spinner      spinner      spn_minimum      builder.Pageframe1.Page3      �FontName = "Tahoma"
FontSize = 8
Height = 23
Left = 77
SelectOnEntry = .T.
TabIndex = 1
Top = 12
Width = 73
Name = "spn_minimum"
      NPROCEDURE InteractiveChange
thisform.oControl.minimum = this.value
ENDPROC
      .PROCEDURE Click
Thisform.Release

ENDPROC
      �Top = 204
Left = 372
Height = 23
Width = 60
FontName = "Tahoma"
FontSize = 8
Caption = "Cancel"
TabIndex = 4
Name = "cmd_Cancel"
      commandbutton      commandbutton      label      label      label      Label2      builder.Pageframe1.Page3      �AutoSize = .T.
FontName = "Tahoma"
FontSize = 8
BackStyle = 0
Caption = "Minimum"
Height = 15
Left = 17
Top = 18
Width = 42
TabIndex = 5
Name = "Label2"
      spinner      spinner      spn_maximum      builder.Pageframe1.Page3      �FontName = "Tahoma"
FontSize = 8
Height = 23
Left = 77
SelectOnEntry = .T.
TabIndex = 2
Top = 42
Width = 73
Name = "spn_maximum"
      NPROCEDURE InteractiveChange
thisform.oControl.maximum = this.value
ENDPROC
      �AutoSize = .T.
FontName = "Tahoma"
FontSize = 8
BackStyle = 0
Caption = "Step"
Height = 15
Left = 17
Top = 78
Width = 24
TabIndex = 6
Name = "Label4"
      builder.Pageframe1.Page3      builder.Pageframe1.Page3      spinner      label      spinner      Label3      builder.Pageframe1.Page3      �AutoSize = .T.
FontName = "Tahoma"
FontSize = 8
BackStyle = 0
Caption = "Maximum"
Height = 15
Left = 17
Top = 48
Width = 46
TabIndex = 4
Name = "Label3"
      �FontName = "Tahoma"
FontSize = 8
Height = 23
Left = 77
SelectOnEntry = .T.
TabIndex = 3
Top = 72
Width = 73
Name = "spn_step"
      KPROCEDURE InteractiveChange
thisform.oControl.step = this.value
ENDPROC
     	{���    b	  b	                        �-   %   -      �  O   [          �  U  � ���  ���� ��C�� �`�� %�C��� � �� � 
��V � T�� ���� ��� � �� � %�C��� � �� � 
��� � T�� ���� ��� � �� � %�C��� � �� � 
��� � T�� ���� ��� � �� � %�C��� � �� � 
��� T�� ���� ��� � �� � %�C��� � �� � 
��R� T�� ���� ��� � �� � %�C��� � �� � 
���� T�� ���� ��� � �� � %�C��� �	 �� �	 
���� T�� ����	 ��� �	 �� � %�C��� �
 �� �
 
��� T�� ����
 ��� �
 �� � %�C��� � �� � 
��N� T�� ���� ��� � �� � %�C��� � �� � 
���� T�� ���� ��� � �� � %�C��� � �� � 
���� T�� ���� ��� � �� � %�C��� � �� � 
��� T�� ���� ��� � �� � %�C��� � �� � 
��J� T�� ���� ��� � �� � %�C��� � �� � 
���� T�� ���� ��� � �� � �� U  THISFORM OCR	 BACKCOLOR OCONTROL BARCOLOR BORDERCOLOR FLAT MARQUEE MARQUEESPEED MAXIMUM MINIMUM PLAY REPEAT
 SIZEADJUST SMOOTH STEP THEMES	  G(� U  � 4�  � T� � �� � �  Builder��0 %�CC�Q� WIZARDS\CTL32_PROGRESSBAR.CHM0��� �, G(�C�Q� WIZARDS\CTL32_PROGRESSBAR.CHM�� � ��� ����D %�C� m.oControlRefb� O�  C��  � f� CTL32_PROGRESSBAR	��� T�� � ���  � �� T�� � ���  � �� T�� � ���  � �� T�� �	 ���  �	 �� T�� �
 ���  �
 �� T�� � ���  � �� T�� � ���  � �� T�� � ���  � �� T�� � ���  � �� T�� � ���  � �� T�� � ���  � �� T�� � ���  � �� T�� � ���  � �� T�� � ���  � �� �$� T� � � �-�� � T�� � � � ��� � �� T�� � � � ��� � �� T�� � � � ��� � �� T�� � � � ��� � �� �� U  OCONTROLREF THISFORM CAPTION TAG CLASS OCONTROL	 BACKCOLOR BARCOLOR BORDERCOLOR FLAT MARQUEE MARQUEESPEED MAXIMUM MINIMUM PLAY REPEAT
 SIZEADJUST SMOOTH STEP THEMES
 CMD_ACCEPT ENABLED
 PAGEFRAME1 PAGE2 SPN_MARQUEESPEED VALUE PAGE3 SPN_MINIMUM SPN_MAXIMUM SPN_STEP update,     �� Unload^    �� Initk    ��1 � � ��A ��A ��A ��A ��A ��A ��A ��A ��A ��A ��A ��A ��A ��A B 3 a 3 q ��A � Bbaaaaaaaaaaaaa� A ����B 2                       �     /   �  �  5   1   �  �
  9    )   b	                  0   m                   PLATFORM   C                  UNIQUEID   C	   
               TIMESTAMP  N   
               CLASS      M                  CLASSLOC   M!                  BASECLASS  M%                  OBJNAME    M)                  PARENT     M-                  PROPERTIES M1                  PROTECTED  M5                  METHODS    M9                  OBJCODE    M=                 OLE        MA                  OLE2       ME                  RESERVED1  MI                  RESERVED2  MM                  RESERVED3  MQ                  RESERVED4  MU                  RESERVED5  MY                  RESERVED6  M]                  RESERVED7  Ma                  RESERVED8  Me                  USER       Mi                                                                                                                                                                                                                                                                                          COMMENT Class                                                                                               WINDOWS _1O61C2TAZ 878941401n      +
  {      �  �  ?  (          X  e  �          J               COMMENT RESERVED                        �                                                                   WINDOWS _1NS0MG7JU 879060312U        d      ��  �  9s  �3          ?  L  k%          1               WINDOWS _1NS0MG7JU 879059833      �  �  �  �
  �
                                                       WINDOWS _1O403W86Q 878865449�
      �
  �
  �  8
  �    �                                               WINDOWS _1O603XLBF 863702772�      �  �  �  �  }                                                       COMMENT RESERVED                                                                                            ��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 VERSION =   3.00      ctl32_progressbar      Pixels      Class      4      control      ctl32_progressbar      TRUE     AutoSize = .T.
FontName = "Tahoma"
FontSize = 8
FontStrikethru = .F.
FontUnderline = .F.
Anchor = 7
BackStyle = 0
Caption = "ctl32_ProgressBar"
Height = 96
Left = 0
Top = 18
Width = 16
ForeColor = 0,0,128
Rotation = 90
Name = "lblControlNameV"
      ctl32_progressbar      lblControlNameV      label      label      TRUE     ���    �   �                         �   %   �       �      �           �  U  E  %��  � � � �� � B� �# T�  � � ��  � � �  � � �� U  THIS PARENT HWND VALUE STEP Timer,     ��1 qA A 22                       |       )   �                         �PROCEDURE Timer
If This.Parent.HWnd = 0 Then
  Return
Endif

This.Parent.Value = This.Parent.Value + This.Parent.Step

ENDPROC
      ctl32_progressbar      ctl32_progressbarlabel      wctl32_name
ctl32_version
ctl32_update^
ctl32_declares^
ctl32_bytestostr^
ctl32_init^
ctl32_bind^
ctl32_unbind^
      Pixels      Class      1      label      ctl32_progressbarlabel     Z_memberdata XML Metadata for customizable properties
buddycontrol Especifies the full name of the ctl32_ProgressBar control to bind this label to. For example: ThisForm.ctl32_ProgressBar1
labelstyle Especifies the Style used to display numbers in label text. N: Number, P: Percent, B: Bytes/KB/MB/GB
labelcaption Especifies the text to display in the label. Any text can be entered, keywords <<Value>> and <<Maximum>> will be replaced by the progressbar respective values.
ctl32_name
ctl32_version
*ctl32_update 
*ctl32_declares 
*ctl32_bytestostr 
*ctl32_init 
*ctl32_bind 
*ctl32_unbind 
     (FontName = "Tahoma"
FontSize = 8
Alignment = 1
BorderStyle = 0
Caption = "ctl32_ProgressBar_Label"
Height = 16
Width = 300
_memberdata = 
buddycontrol = 
labelstyle = N
labelcaption = <<Value>>
ctl32_name = ctl32_ProgressBarLabel
ctl32_version = 1.1
Name = "ctl32_progressbarlabel"
      label      gTop = 0
Left = -25
Height = 23
Width = 23
Enabled = .F.
Interval = 100
Name = "tmrControlTimer"
      tmrControlTimer      timer      timer      TRUE      �FontName = "Tahoma"
FontSize = 8
FontStrikethru = .F.
FontUnderline = .F.
Anchor = 7
BackStyle = 0
Caption = "ctl32_ProgressBar"
Height = 15
Left = 6
Top = 1
Width = 89
ForeColor = 0,0,128
Name = "lblControlNameH"
      ctl32_progressbar      lblControlNameH      label      label      control     ����    �  �                        �q   %   �      �  @   `          �  U  p %�C�  � ��� � B� �# %�C� This.LabelStyleb� C��w �6 R,:��' LabelStyle Property must be Character: Ct�� B� � �� � � � H�� ��� ��  � � N��C�1 T� �CC�  � � .Value�� 999,999,999,999_��3 T� �CC�  � � .Maximum�� 999,999,999,999_��3 T� �CC�  � � .Minimum�� 999,999,999,999_�� ��  � � P����' T� �CC�  � � .Percent�� 999%_�� T� �� 100%�� T� �� 0%�� ��  � � B��!�# T� �CC�  � � .Value��  � ��% T� �CC�  � � .Maximum��  � ��% T� �CC�  � � .Minimum��  � �� 2���1 T� �CC�  � � .Value�� 999,999,999,999_��3 T� �CC�  � � .Maximum�� 999,999,999,999_��3 T� �CC�  � � .Minimum�� 999,999,999,999_�� � T� ��  � ��) T� �C� �	 <<Value>>C� ���
����+ T� �C� � <<Maximum>>C� ���
����+ T� �C� � <<Minimum>>C� ���
���� T�  �	 �� ��
 ��  �
 � U  THIS BUDDYCONTROL LCVALUE	 LCMAXIMUM	 LCCAPTION
 LABELSTYLE	 LCMINIMUM CTL32_BYTESTOSTR LABELCAPTION CAPTION REFRESH. + |�� StrFormatByteSizeA� shlwapi���� U  STRFORMATBYTESIZEA SHLWAPI}  ��  � �� � T�� �C�dX�� ��C ��  �� C�� >� �� T�� �C�� ��� T�� �C�� C�� >�=�� B�C�� ��� U  QDW PSZBUF STRFORMATBYTESIZEA1  T�  � ��  ��
 ��  � �
 ��  � �
 ��  � � U  THIS CAPTION CTL32_DECLARES
 CTL32_BIND CTL32_UPDATE�  %�C�  � �
��| � %�C�  � b� U��J �  T�  � ��	 ThisForm.�  � �� �. ��CC�  � �� VALUE�  � CTL32_UPDATE��� � U  THIS BUDDYCONTROLE  %�C�  � �
��> �+ ��CC�  � �� VALUE�  � CTL32_UPDATE�� � U  THIS BUDDYCONTROL 
 ��  � � U  THIS
 CTL32_INIT 
 ��  � � U  THIS CTL32_UNBIND ctl32_update,     �� ctl32_declares    �� ctl32_bytestostrk    ��
 ctl32_init    ��
 ctl32_bind{    �� ctl32_unbind    �� Inits    �� Destroy�    ��1 !A A 2aA A � � R11Rq� R1QQ� 11B ���� 3 �2 q r �2�� 2 � � � 3 1qA �B 3 1�A 2 � 3 � 2                            "   <  �  -   $   �  �  3   ,   �  !  C   1   B  &	  K   8   I	  �	  V   <   �	  �	  [   >   
  
  _    )   �                       Uctl32_hwnd^
ctl32_dwexstyle^
ctl32_lpclassname^
ctl32_dwstyle^
ctl32_parenthwnd^
ctl32_hinstance^
ctl32_creating^
ctl32_name
ctl32_hmenu^
ctl32_lpparam^
ctl32_lpwindowname^
ctl32_oldstep^
ctl32_version
ctl32_hwnds^
ctl32_left^
ctl32_top^
ctl32_width^
ctl32_height^
builderx
ctl32_resize^
step_assign^
maximum_assign^
marquee_assign^
visible_assign^
ctl32_create^
ctl32_destroy^
ctl32_declaredlls^
ctl32_bindevents^
ctl32_unbindevents^
marqueespeed_assign^
hwnd_access^
value_access^
value_assign^
percent_access^
smooth_assign^
backcolor_assign^
barcolor_assign^
play_assign^
scrolling_assign^
percent_assign^
max_assign^
min_assign^
hwnd_assign^
orientation_assign^
vertical_assign^
themes_assign^
ctl32_themes^
flat_assign^
bordercolor_assign^
ctl32_activateapp^
ctl32_activate^
instatusbar_assign^
StatusBarText^
Picture^
BackStyle^
Click^
ControlCount^
Controls^
DblClick^
ColorSource^
Drag^
DragDrop^
DragIcon^
DragMode^
DragOver^
GotFocus^
LostFocus^
MiddleClick^
MouseDown^
MouseEnter^
MouseIcon^
MouseLeave^
MouseMove^
MousePointer^
MouseUp^
MouseWheel^
OLECompleteDrag^
OLEDrag^
OLEDragDrop^
OLEDragMode^
OLEDragOver^
OLEDragPicture^
OLEDropEffects^
OLEDropHasData^
OLEDropMode^
OLEGiveFeedback^
OLESetData^
OLEStartDrag^
Objects^
RightClick^
Style^
BorderWidth^
ForeColor^
AddProperty^
ActiveControl^
Draw^
Enabled^
HelpContextID^
Move^
Moved^
Refresh^
ResetToDefault^
Resize^
SaveAsClass^
SetFocus^
ShowWhatsThis^
SpecialEffect^
TabStop^
ToolTipText^
WhatsThisHelpID^
WriteExpression^
WriteMethod^
     
$PROCEDURE ctl32_update
If Empty(This.BuddyControl)
  Return
Endif

If Type("This.LabelStyle") <> [C]
  WAIT ([LabelStyle Property must be Character: ] + Program()) WINDOW nowait
  Return
Endif

Local lcValue, lcMaximum, lcCaption
Do Case

Case This.LabelStyle = "N"	&& Value
  lcValue = Transform((Evaluate(This.BuddyControl + ".Value")),"999,999,999,999")
  lcMaximum = Transform((Evaluate(This.BuddyControl + ".Maximum")),"999,999,999,999")
  lcMinimum = Transform((Evaluate(This.BuddyControl + ".Minimum")),"999,999,999,999")

Case This.LabelStyle = "P"	&& Percent
  lcValue = Transform(Evaluate(This.BuddyControl + ".Percent"),"999%")
  lcMaximum = "100%"
  lcMinimum = "0%"

Case This.LabelStyle = "B"	&& Bytes
  lcValue = This.ctl32_bytestostr(Evaluate(This.BuddyControl + ".Value"))
  lcMaximum = This.ctl32_bytestostr(Evaluate(This.BuddyControl + ".Maximum"))
  lcMinimum = This.ctl32_bytestostr(Evaluate(This.BuddyControl + ".Minimum"))

Otherwise	&& same as "N"
  lcValue = Transform((Evaluate(This.BuddyControl + ".Value")),"999,999,999,999")
  lcMaximum = Transform((Evaluate(This.BuddyControl + ".Maximum")),"999,999,999,999")
  lcMinimum = Transform((Evaluate(This.BuddyControl + ".Minimum")),"999,999,999,999")

Endcase

lcCaption = This.LabelCaption
lcCaption = Strtran(lcCaption ,"<<Value>>",Alltrim(lcValue),1,10,1)
lcCaption = Strtran(lcCaption ,"<<Maximum>>",Alltrim(lcMaximum),1,10,1)
lcCaption = Strtran(lcCaption ,"<<Minimum>>",Alltrim(lcMinimum),1,10,1)

This.Caption = lcCaption
This.Refresh

ENDPROC
PROCEDURE ctl32_declares
DECLARE INTEGER StrFormatByteSizeA IN shlwapi;
	INTEGER qdw,;
	STRING @ pszBuf,;
	INTEGER uiBufSize
ENDPROC
PROCEDURE ctl32_bytestostr
LPARAMETERS qdw

LOCAL pszBuf

m.pszBuf = SPACE(100)

StrFormatByteSizeA(m.qdw, @m.pszBuf, Len(m.pszBuf))

m.pszBuf = ALLTRIM(m.pszBuf)

* Remove chr(0)
m.pszBuf = Left(m.pszBuf,Len(m.pszBuf)-1)

RETURN ALLTRIM(m.pszBuf)
ENDPROC
PROCEDURE ctl32_init
This.Caption = ""

This.ctl32_Declares
This.ctl32_Bind
This.ctl32_Update

ENDPROC
PROCEDURE ctl32_bind
If Not Empty(This.BuddyControl) Then
  If Type(This.BuddyControl) = [U] Then
    This.BuddyControl = [ThisForm.] + This.BuddyControl
  Endif

  Bindevent(Evaluate(This.BuddyControl),"VALUE",This,"CTL32_UPDATE",1)

Endif

ENDPROC
PROCEDURE ctl32_unbind
If Not Empty(This.BuddyControl) Then
  Unbindevent(Evaluate(This.BuddyControl),"VALUE",This,"CTL32_UPDATE")
Endif
ENDPROC
PROCEDURE Init
This.ctl32_Init

ENDPROC
PROCEDURE Destroy
This.ctl32_Unbind

ENDPROC
     fctl32_hwnd CreateWindowEx return value.
ctl32_dwexstyle CreateWindowEx parameter.
ctl32_lpclassname CreateWindowEx parameter.
ctl32_dwstyle CreateWindowEx parameter.
ctl32_parenthwnd CreateWindowEx parameter.
ctl32_hinstance CreateWindowEx parameter.
ctl32_creating
minimum Specifies the lower limit of the value property. Must be a positive or negative number smaller than Maximum
maximum Specifies the upper limit of the value property. Must be a positive or negative number larger than minimum.
vertical Specifies if the progressbar is vertical or horizontal.
_memberdata XML Metadata for customizable properties
step Determines the value to use in the stepit method. Can be a positive or negative value.
marquee Especifies if the marquee style is active. When set to true, the Smooth property is set to false to avoid wrong display of bars when using XP with no themes.
ctl32_name Name of the control class
marqueespeed Specifies the speed of the marquee bar, in milliseconds.
hwnd Specifies the Window handle of the Control.
value Specifies the current value of the control.
percent Specifies the percent of the value property relative to the total of maximum - minimum. 
repeat Specifies if the controls rolls over to minimum when value reaches maximum. Use it with Play to display a self updating progressbar.
smooth Specifies if the progressbar is shown using segments, or using a continuous bar.
parenthwnd Especifies the handle of the parent window of the control.
ctl32_hmenu CreateWindowEx parameter.
ctl32_lpparam CreateWindowEx parameter.
ctl32_lpwindowname CreateWindowEx parameter.
barcolor Specifies the color of the progress bar. A value of -1 resets color to system default. Backcolor specifies the color of the background, a value of -1 resets color to system default.
play When True, fires the StepIt method every 100 milliseconds. To set the speed, change the value of the step property.
max For compatibility only. Use Maximum property instead.
min For compatibility only. Use Minimum property instead.
scrolling For compatibility only. Use Smooth property instead.
orientation For compatibility only. Use Vertical  property instead. 0: Horizontal, 1:Vertical
ctl32_oldstep Saves old Step value when the StepIt method is called with a parameter.
sizeadjust Adjusts Width/Height of Horizontal/Vertical ProgressBar so that bars show even and complete at the end/top. Use only with Themes applied in Windows XP.
themes Determines if Themes are used for the control. (Windows XP).
ctl32_version
ctl32_hwnds Static window hwnd
flat Especifies if the flat style is active.
ctl32_left
ctl32_top
ctl32_width
ctl32_height
builderx
instatusbar
ctl32_flat
ctl32_xp
*ctl32_resize Bound to Form.Resize
*step_assign 
*minimum_assign 
*maximum_assign 
*marquee_assign 
*visible_assign 
*ctl32_create 
*ctl32_destroy 
*ctl32_declaredlls DLL declarations.
*ctl32_bindevents Binds events.
*ctl32_unbindevents 
*marqueespeed_assign 
*stepit Increments the value of the control by the amount specified in step. If a numeric parameter is passed, that value is used instead of the value set in the step property.
*hwnd_access 
*value_access 
*value_assign 
*percent_access 
*smooth_assign 
*backcolor_assign 
*barcolor_assign 
*play_assign 
*scrolling_assign 
*percent_assign 
*max_assign 
*min_assign 
*hwnd_assign 
*reset Resets the Value property to the Minimum value.
*orientation_assign 
*vertical_assign 
*themes_assign 
*ctl32_themes Bound to Form.Themes
*flat_assign 
*bordercolor_assign 
*ctl32_activateapp 
*ctl32_activate 
*instatusbar_assign 
*repeat_assign 
*width_assign 
*height_assign 
     ?X���    ??  ??                        ��)   %   �3      v<  h  �7          �  U  0  %��  � a� �  � � ��$ � B� � ���  ��)� %��� a��� �4 ��C�� � �� ��� ��� ���	 ��� �� T��
 ������ T�� ������ T�� ��� ��� T�� ���	 ��� �� T��
 ��� �� T�� ��� �� T�� ��� �� T�� ���	 �� �$ ��C�� � ��
 �� �� �� �� �� �� U  THIS CTL32_CREATING
 CTL32_HWND
 CTL32_FLAT SETWINDOWPOS CTL32_HWNDS LEFT TOP WIDTH HEIGHT
 CTL32_LEFT	 CTL32_TOP CTL32_WIDTH CTL32_HEIGHT�  ��  � %�C�	 m.vNewValb� N��U �- ��C� Parameter must be Numeric: Ct��x�� B� � T� � ���  �� ��C� � �� � � � �� U  VNEWVAL THIS STEP SENDMESSAGEN
 CTL32_HWND�  ��  � %�C�	 m.vNewValb� N��U �- ��C� Parameter must be Numeric: Ct��x�� B� � T� � ���  �� T� � ���  �� %�� � � � ��� � T� � �� � �� �  ��C� � �� � � � � �� U  VNEWVAL THIS MINIMUM MIN VALUE SENDMESSAGEN
 CTL32_HWND MAXIMUM�  ��  � %�C�	 m.vNewValb� N��U �- ��C� Parameter must be Numeric: Ct��x�� B� � T� � ���  �� T� � ���  �� %�� � � � ��� � T� � �� � �� �  ��C� � �� � � � � �� U  VNEWVAL THIS MAXIMUM MAX VALUE SENDMESSAGEN
 CTL32_HWND MINIMUM ��  � %�C�	 m.vNewValb� N��] � %���  � ��D � T��  �-�� �Y � T��  �a�� � � %�C�	 m.vNewValb� L��� �- ��C� Parameter must be Logical: Ct��x�� B� � T� � ���  �� %�� � a��� � T� � �-�� � %�� � � ��� ��C� � �� ��C� � �� � U  VNEWVAL THIS MARQUEE PLAY
 CTL32_HWND CTL32_DESTROY CTL32_CREATEN ��  � %�C�	 m.vNewValb� N��] � %���  � ��D � T��  �-�� �Y � T��  �a�� � � %�C�	 m.vNewValb� L��� �- ��C� Parameter must be Logical: Ct��x�� B� � T� � ���  �� %�� � � ��� � B� � %�� � a��� ��C� � �� �� ��C� � �� �� �G� ��C� � � � �� ��C� � � � �� � U  VNEWVAL THIS VISIBLE
 CTL32_HWND SHOWWINDOWX CTL32_HWNDS� ���  ���� %��� �� � B� � T�� �a�� T�� ��� �� %��� a��� � %��� -�	 C� � ��� � T�� �a�� T�� �-�� � %��� -��� � T�� �a�� � � %��� a���� T�� �� �� T��	 �� static�� T��
 ��  �� T�� �C�
   @�	   ��� T�� �� �� T�� �C�� ���� �� T�� �� ��O T�� �C�� ��	 ��
 �� �� ��� ��� ��� ��� �� �� �� � �� %��� � ����F ��C� Error Creating Common Control � static�  Window��� �x�� � � �� � T�� �� �� T��	 �� msctls_progress32�� T��
 ��  �� T�� �C�
   @�	   ��� %��� a���� T�� ������ T�� ������ T�� ��� ��� T�� ��� ��� T�� ��� �� ��� T�� ��� �� T�� ��� �� T�� ��� �� T�� ��� �� T�� ��� �� � %��� a��#� T�� �C�� ���� � %��� a��L� T�� �C�� ���� � %��� a�	 ��  � ���� T�� �C�� ���� � T�� �� �� T�� �C�� ���� �� T�� �� ��A T��! �C�� ��	 ��
 �� �� �� �� ��  �� �� �� �� � �� %���! � ��L�A ��C� Error Creating Common Control ��	 �  Window��� �x�� � %��� ��� ��" � T�" ��  � �� %��# � -���� T�" �-�� � %�C��
]� 0���� T�" �-�� � %�C� � ���� T�" �-�� � %��" ���� ��C�  �% ���$ �� �� ��C�  �% ��  �$ �� � � T��& ���' �� T��( ���) �� T��* ���* �� T��+ ���+ �� T��, ���, �� T��- ���- �� T��. ���. �� T��/ ���/ �� T��0 ���0 �� ���1 � T�� �-�� �� U2  THIS CTL32_CREATING
 CTL32_FLAT FLAT INSTATUSBAR CTL32_XP ISTHEMEACTIVE THEMES CTL32_DWEXSTYLE CTL32_LPCLASSNAME CTL32_LPWINDOWNAME CTL32_DWSTYLE CTL32_HMENU CTL32_HINSTANCE GETWINDOWLONG CTL32_PARENTHWND CTL32_LPPARAM CTL32_HWNDS CREATEWINDOWEX LEFT TOP WIDTH HEIGHT
 CTL32_NAME LNPARENTHWND
 CTL32_LEFT	 CTL32_TOP CTL32_WIDTH CTL32_HEIGHT MARQUEE SMOOTH VERTICAL ORIENTATION
 CTL32_HWND
 LUSETHEMES THISFORM SETWINDOWTHEME HWND MIN MINIMUM MAX MAXIMUM STEP VALUE MARQUEESPEED PLAY	 BACKCOLOR BARCOLOR VISIBLE CTL32_ACTIVATEC  ��C� � �  �� ��C� � �  �� T� � �� �� T� � �� �� U  DESTROYWINDOW THIS
 CTL32_HWND CTL32_HWNDS] ��  ���� � ��C��  ���� T�� �C��  ����4 %�C��  � CreateWindowEx��� ���� ��� �7 |�� CreateWindowEx� user32������������� �4 %�C��  � CallWindowProc��� ���� �� �) |�� CallWindowProc� user32������ �3 %�C��  � DestroyWindow��� ���� ��W�  |�� DestroyWindow� user32�� �1 %�C��  � GetSysColor��� ���� ���� |�� GetSysColor� user32�� �3 %�C��  � GetWindowLong��� ���� ���" |�� GetWindowLong� user32��� �* %�CC�JgCC�Jg�d�
ףp=
@
����3 %�C��  � IsThemeActive��� ���� ����$ |�� IsThemeActive� uxtheme.Dll� � �1 %�C��  � PostMessage��� ���� ����$ |�� PostMessage� user32����� �2 %�C��  � RedrawWindow��� ���� ��A�& |�� RedrawWindow� user32����� �2 %�C��  � SendMessageN��� ���� ����4 |�� SendMessage� user32Q� SendMessageN����� �3 %�C��  � SetWindowLong��� ���� ���$ |�� SetWindowLong� user32���� �2 %�C��  � SetWindowPos��� ���� ��g�+ |�� SetWindowPos� user32�������� �* %�CC�JgCC�Jg�d�
ףp=
@
����4 %�C��  � SetWindowTheme��� ���� ����& |�� SetWindowTheme� UxTheme���� � �1 %�C��  � ShowWindowX��� ���� ��V�. |��
 ShowWindow� user32Q� ShowWindowX��� � U  LADLLS LNLEN CREATEWINDOWEX USER32 CALLWINDOWPROC DESTROYWINDOW GETSYSCOLOR GETWINDOWLONG ISTHEMEACTIVE UXTHEME DLL POSTMESSAGE REDRAWWINDOW SENDMESSAGE SENDMESSAGEN SETWINDOWLONG SETWINDOWPOS SETWINDOWTHEME
 SHOWWINDOW SHOWWINDOWX:* ��C�  � RESIZE�  � CTL32_RESIZE���' ��C�  � TOP�  � CTL32_RESIZE���( ��C�  � LEFT�  � CTL32_RESIZE���* ��C� � THEMES�  � CTL32_THEMES��� %�� � ���3�+ ��C�C� ��  � CTL32_ACTIVATEAPP��� ��C� CTL32_ACTIVATE-�9� ��3 ��C�9� CTL32_ACTIVATE�  � CTL32_ACTIVATE��� � U  THIS THISFORM
 SHOWWINDOW HWND ADDPROPERTY B� %��  � � �� � B� �' ��C�  � RESIZE�  � CTL32_RESIZE��$ ��C�  � TOP�  � CTL32_RESIZE��% ��C�  � LEFT�  � CTL32_RESIZE��' ��C� � THEMES�  � CTL32_THEMES�� %�� � ���� �0 ��C�9� CTL32_ACTIVATE�  � CTL32_ACTIVATE�� � U  THIS
 CTL32_HWND THISFORM
 SHOWWINDOW�  ��  � %�C�	 m.vNewValb� N��U �- ��C� Parameter must be Numeric: Ct��x�� B� � T� � ���  �� ��C� � �
�� � � �� U  VNEWVAL THIS MARQUEESPEED SENDMESSAGEN
 CTL32_HWND@ ��  � �� � %�C� m.lnValb� N��; � T��  �� � �� �) %�� � -� � � ��  � � 	��l � B� �) %�� � -� � � ��  � � 	��� � B� � %���  � � ��� � T� � �� � �� T� � ���  �� �� � T� � �� �� � ��C� �
 �� � �	 �� %�� � � ��9� T� � �� � �� � U  LNVAL	 LNOLDSTEP THIS STEP REPEAT VALUE MAXIMUM MINIMUM CTL32_OLDSTEP SENDMESSAGEN
 CTL32_HWND  B��  � �� U  THIS
 CTL32_HWNDe  ��  � %�� � a��+ � T��  �� � �� �S �  T��  �C� � �� � � �� � B���  �� U  NVALUE THIS CTL32_CREATING VALUE SENDMESSAGEN
 CTL32_HWNDU ��  � %�C�	 m.vNewValb� N��U �- ��C� Parameter must be Numeric: Ct��x�� B� � %�� � -��� � %���  � � ��� � B� � %���  � � ��� � B� � �� %���  � � ��� � T��  �� � �� � %���  � � ��� T��  �� � �� � � T� � ���  �� %�� � � ��N� ��C� � � ��  � � �� � U	  VNEWVAL THIS REPEAT MAXIMUM MINIMUM VALUE HWND SENDMESSAGEN
 CTL32_HWND. + B�C�d�  � �  � C�  � �  � 8�� U  THIS VALUE MINIMUM MAXIMUM�  ��  � %�C�	 m.vNewValb� N��] � %���  � ��D � T��  �-�� �Y � T��  �a�� � � %�C�	 m.vNewValb� L��� �- ��C� Parameter must be Logical: Ct��x�� B� � T� � ���  �� %�� � � ��� � ��C� � �� ��C� � �� � U  VNEWVAL THIS SMOOTH
 CTL32_HWND CTL32_DESTROY CTL32_CREATE�  ��  � %�C�	 m.vNewValb� N��W �3 ��C�' Parameter for BackColor must be Numeric�x�� � %���  ���� ��� � T��  ������ � %���  ������ � T��  �C�� �� � T� � ���  �� ��C� � � � � � � �� B� U  VNEWVAL GETSYSCOLOR THIS	 BACKCOLOR SENDMESSAGEN
 CTL32_HWND�  ��  � %�C�	 m.vNewValb� N��V �2 ��C�& Parameter for BarColor must be Numeric�x�� � %���  ���� ��� � T��  ������ � %���  ������ � T��  �C�� �� � T� � ���  �� ��C� � �	� � � � �� B� U  VNEWVAL GETSYSCOLOR THIS BARCOLOR SENDMESSAGEN
 CTL32_HWND, ��  � %�C�	 m.vNewValb� N��] � %���  � ��D � T��  �-�� �Y � T��  �a�� � � %�C�	 m.vNewValb� L��� �- ��C� Parameter must be Logical: Ct��x�� B� � %���  a�	 � � a	��� � B� � T� � ���  �� %�� � a��� T� � �� � �� � T� � � �� � �� U  VNEWVAL THIS MARQUEE PLAY VALUE MINIMUM TMRCONTROLTIMER ENABLED�  ��  � %�C�	 m.vNewValb� N��U �- ��C� Parameter must be Numeric: Ct��x�� B� � T� � ���  �� %�� � � ��� � T� � �-�� �� � T� � �a�� � U  VNEWVAL THIS SROLLING	 SCROLLING SMOOTH  ��  � B� U  VNEWVAL�  ��  � %�C�	 m.vNewValb� N��U �- ��C� Parameter must be Numeric: Ct��x�� B� � T� � ���  �� T� � ���  �� U  VNEWVAL THIS MAX MAXIMUM�  ��  � %�C�	 m.vNewValb� N��U �- ��C� Parameter must be Numeric: Ct��x�� B� � T� � ���  �� T� � ���  �� U  VNEWVAL THIS MIN MINIMUM  ��  � B� U  VNEWVAL  T�  � ��  � �� U  THIS VALUE MINIMUM�  ��  � %�C�	 m.vNewValb� N��U �- ��C� Parameter must be Numeric: Ct��x�� B� � T� � ���  �� %�� � � ��� � T� � �-�� �� � T� � �a�� � U  VNEWVAL THIS ORIENTATION VERTICAL8 ��  � %�C�	 m.vNewValb� N��] � %���  � ��D � T��  �-�� �Y � T��  �a�� � � %�C�	 m.vNewValb� L��� �- ��C� Parameter must be Logical: Ct��x�� B� � T� � ���  �� %�� � a��� � T� � ���� �� � T� � �� �� � %�� � � ��1� ��C� � �� ��C� � �� � U  VNEWVAL THIS VERTICAL ORIENTATION
 CTL32_HWND CTL32_DESTROY CTL32_CREATE ��  � %�� � -�� � B� � %�C�	 m.vNewValb� N��w � %���  � ��^ � T��  �-�� �s � T��  �a�� � � %�C�	 m.vNewValb� L��� �- ��C� Parameter must be Logical: Ct��x�� B� � T� � ���  �� %�� � � ��� � B� � ��C� � �� ��C� � �� U  VNEWVAL THIS CTL32_XP THEMES HWND CTL32_DESTROY CTL32_CREATE  T�  � �� � �� U  THIS THEMES THISFORM�  ��  � %�C�	 m.vNewValb� N��] � %���  � ��D � T��  �-�� �Y � T��  �a�� � � %�C�	 m.vNewValb� L��� �- ��C� Parameter must be Logical: Ct��x�� B� � T� � ���  �� %�� � � ��� � ��C� � �� ��C� � �� � U  VNEWVAL THIS FLAT
 CTL32_HWND CTL32_DESTROY CTL32_CREATEL  ��  � %���  �����3 � T��  �C� � � �^�� � T� � ���  �� U  VNEWVAL THIS BORDERCOLOR� ? ��  Q� INTEGER� Q� INTEGER� Q� INTEGER� Q� INTEGER� T� �� �� %�� ���� � %�� ���{ � T�9� �a�� � T� �C�C�  ���� ��" T� �C �  �   �  �  � � �� �	 B�� �� U	  HWND MSG WPARAM LPARAM	 NRETVALUE CTL32_ACTIVATE LPPREVWNDFUNC GETWINDOWLONG CALLWINDOWPROC|  ���  ��u � %��� a��C �& ��C�� � � � � � C���� �� �q �& ��C�� � � � � � C���� �� � �� U  THIS
 CTL32_FLAT SETWINDOWPOS CTL32_HWNDS
 CTL32_HWND  ��  � T� � ���  �� U  VNEWVAL THIS INSTATUSBAR�  ��  � %�C�	 m.vNewValb� N��] � %���  � ��D � T��  �-�� �Y � T��  �a�� � � %�C�	 m.vNewValb� L��� �- ��C� Parameter must be Logical: Ct��x�� B� � T� � ���  �� U  VNEWVAL THIS REPEAT�  ��  � T� � ���  �� ��� �� � %��� a��{ � %��� � � �� -��w �% T�� �C�� ��� T���� � � �� U  VNEWVAL THIS WIDTH
 SIZEADJUST ORIENTATION VERTICAL�  ��  � T� � ���  �� ��� �� � %��� a��{ � %��� �� �� a��w �% T�� �C�� ��� T���� � � �� U  VNEWVAL THIS HEIGHT
 SIZEADJUST ORIENTATION VERTICAL� 4�  � T� � � ��  �� T� � � ��  �� T� � �� �� ��� ����) %�CC�JgCC�Jg�d�
ףp=
@�� � T�� �-�� �� � T�� �a�� � %�C� ThisFormb� O���c ��C�T USAGE: _Screen.Newobject("oProgressBar","ctl32_progressbar","ctl32_progressbar.vcx")��x�� B� � %��� a� C�t� 	��=� B� � %�C�t� ��b� T�� ���  �� �{� T�� ��	 �
 �� �% %��� � � Form�	 �� � 	���� B� �  %��	 � �9� � �� a���� T�� �-�� � %��� a��^� %��� �� �� a��-�% T�� �C�� ��� T���� �Z�% T�� �C�� ��� T���� � � ��C�� �� ��C�� �� ��C�� �� �� U  TNPARENTHWND THIS LBLCONTROLNAMEH CAPTION LBLCONTROLNAMEV	 BACKSTYLE CTL32_XP INSTATUSBAR CTL32_PARENTHWND THISFORM HWND PARENT	 BASECLASS NAME VISIBLE
 SIZEADJUST ORIENTATION VERTICAL HEIGHT WIDTH CTL32_DECLAREDLLS CTL32_BINDEVENTS CTL32_CREATE  ��C�  � �� U  THIS CTL32_DESTROY ctl32_resize,     �� step_assign�    �� minimum_assign�    �� maximum_assign�    �� marquee_assign�    �� visible_assignN    �� ctl32_create�    �� ctl32_destroy�    �� ctl32_declaredllsP    �� ctl32_bindevents�    �� ctl32_unbindevents    �� marqueespeed_assignG    �� stepit    �� hwnd_access�    �� value_access�    �� value_assign�    �� percent_access/    �� smooth_assign�    �� backcolor_assign�    �� barcolor_assign�     �� play_assign"    �� scrolling_assign�#    �� percent_assignd$    ��
 max_assign$    ��
 min_assign %    �� hwnd_assign�%    �� reset�%    �� orientation_assign&    �� vertical_assign�&    �� themes_assignk(    �� ctl32_themes�)    �� flat_assign�)    �� bordercolor_assign9+    �� ctl32_activateapp�+    �� ctl32_activate�,    �� instatusbar_assign�-    �� repeat_assign�-    �� width_assign�.    �� height_assignp/    �� Init40    �� Destroy�3    ��1 A A � F� � 11� � � � � A GB 4 t ��A A "�3 t ��A A "!s1A 3 t ��A A "!s1A 5 q �1� � � A A ��A A ""� A C� � A 3 v �1� � � A A ��A A "BA A "11� 11A 4 p� � A A � � �� � A � A A � A� �� q� �#aA B s � �� �� � 11� � � � � A QA QA �QA � r� #A � q "� A R� A "� A � !� AA B � � � � � � � � � � � B 3 3 � QB}A B�A 2A �A 2#A �1AA A EA "eA "EA 2DA "�A �AdA A �A 3 �q��B��1A 3 C BA A rAQqDA 4 s ��A A "�5 t r �!A �B A �B A c1!� A �C1A : � 3 t #!� A � 2 t ��A A "bA A bA A � b!A b!A B "C�A 7 �5 q �1� � � A A ��A A "C� � A 4 z �1A bA B1A "�B 3 z �!A bA B1A "�B 3 q �1� � � A A ��A A �A A ""1A b3 q ��A A "B� � � A 3 q A 2 q ��A A "!3 q ��A A "!2 q A 2 14 q ��A A "B� � � A 4 q �1� � � A A ��A A ""� A C� � A 3 q "A A �1� � � A A ��A A "BA A � � 4 12 t �1� � � A A ��A A "B� � A 3 q B�A "3 �� � A r!B � 3 � f� fB A 3 q "3 q �1� � � A A ��A A "3 q "� �QA A A 3 q "� �QA A A 3 w 21� �� � � A �1A A �A A � A RA A � A �Q� QA A � � � B 4 � 4                       n        �  �  ,      �  �  =   (   �  �  T   4   	  �
  m   I     �  �   a   �  G"  �   �   k"  �"  �  �   #  �-  �  �   �-  �/  
  �   $0  �1    	  2  93  0    V3  7  A  '  @7  {7  p  )  �7  �8  u  1  9  �;  �  J  �;  <  �  L  1<  �=  �  ^  �=  7@  �  l  ]@  �B  �  z  �B  �D    �  �D  �E  -  �  �E  �E  >  �  F  �F  B  �  �F  �G  N  �  �G  �G  Y  �  �G  H  ]  �  ,H  +I  b  �  QI  RK  t  �  vK  FM  �  �  iM  �M  �  �  �M  eO  �     �O  �O  �    &P  �Q  �    �Q  �S  �    �S  $T      HT  hU    *  �U  �V  !  4  �V  �W  /  >  �W  y\  =  f  �\  �\  y   )   ??                       \�PROCEDURE ctl32_resize
* If we are in the Control Init Stage, or
* we do not have a handle to the Control yet, just return:
If This.ctl32_Creating = .T. Or This.Ctl32_hWnd = 0 Then
  Return
Endif

* Else, resize the Control Window to its container size:

#Define SWP_NOZORDER			0x4

With This

  If .ctl32_Flat = .T. Then
    SetWindowPos(.Ctl32_hWnds, 0,;
      .Left + 1, ;
      .Top + 1, ;
      .Width - 2, ;
      .Height - 2, ;
      SWP_NOZORDER)
      
    .ctl32_Left = -2
    .ctl32_Top = -2
    .ctl32_Width = .Width + 2
    .ctl32_Height = .Height + 2
  Else
    .ctl32_Left = .Left
    .ctl32_Top = .Top
    .ctl32_Width = .Width
    .ctl32_Height = .Height
  Endif .ctl32_Flat = .T.

  SetWindowPos(.Ctl32_hWnd, 0,;
    .ctl32_Left, ;
    .ctl32_Top, ;
    .ctl32_Width, ;
    .ctl32_Height, ;
    SWP_NOZORDER)

Endwith


ENDPROC
PROCEDURE step_assign
#Define WM_USER					0x400
#Define PBM_SETSTEP				(WM_USER+4)

LPARAMETERS vNewVal

If type("m.vNewVal") <> [N]
  Messagebox([Parameter must be Numeric: ] + Program(), 16)
  Return
Endif

THIS.Step = m.vNewVal

* Set Step Value
SendMessageN(This.ctl32_hwnd, PBM_SETSTEP , THIS.Step, 0)

ENDPROC
PROCEDURE minimum_assign
#Define WM_USER					0x400
#Define PBM_SETRANGE32			(WM_USER+6)

Lparameters vNewVal

If Type("m.vNewVal") <> [N]
  Messagebox([Parameter must be Numeric: ] + Program(), 16)
  Return
Endif

This.Minimum = m.vNewVal
This.Min = m.vNewVal

* If actual Value is less than new Minimum, set value to new Minimum
If This.Value < This.Minimum Then
  This.Value =  This.Minimum
Endif

* Set Minimum and Maximum values:
SendMessageN(This.ctl32_hwnd, PBM_SETRANGE32, This.Minimum, This.maximum)

ENDPROC
PROCEDURE maximum_assign
#Define WM_USER					0x400
#Define PBM_SETRANGE32			(WM_USER+6)

Lparameters vNewVal

If Type("m.vNewVal") <> [N]
  Messagebox([Parameter must be Numeric: ] + Program(), 16)
  Return
Endif

This.Maximum = m.vNewVal
This.Max = m.vNewVal

* If actual Value is greater than new Maximum, set value to new Maximum
If This.Value > This.Maximum Then
  This.Value =  This.Maximum
Endif

* Set Minimum and Maximum values:
SendMessageN(This.ctl32_hwnd, PBM_SETRANGE32, This.Minimum, This.Maximum)



ENDPROC
PROCEDURE marquee_assign
Lparameters vNewVal

If Type("m.vNewVal") = [N] Then
  If m.vNewVal = 0 Then
    m.vNewVal = .F.
  Else
    m.vNewVal = .T.
  Endif
ENDIF

If Type("m.vNewVal") <> [L] Then
  Messagebox([Parameter must be Logical: ] + Program(), 16)
  Return
Endif

This.Marquee = m.vNewVal

If This.Marquee = .T. Then
  This.Play = .F.
Endif

* Marquee change needs to recreate Control
If This.ctl32_hwnd <> 0 Then
  This.ctl32_Destroy()
  This.ctl32_Create()
Endif

ENDPROC
PROCEDURE visible_assign
#Define SW_HIDE					0
#Define SW_SHOW					5
#Define SW_SHOWNA				8
#Define SW_SHOWDEFAULT			10

Lparameters vNewVal

If Type("m.vNewVal") = [N] Then
  If m.vNewVal = 0 Then
    m.vNewVal = .F.
  Else
    m.vNewVal = .T.
  Endif
ENDIF

If Type("m.vNewVal") <> [L] Then
  Messagebox([Parameter must be Logical: ] + Program(), 16)
  Return
Endif

This.Visible = m.vNewVal

If This.ctl32_HWnd = 0 Then
  Return
ENDIF

If This.Visible  = .T. Then
  ShowWindowX(This.Ctl32_HWnds, SW_SHOWNA)
  ShowWindowX(This.Ctl32_HWnd, SW_SHOWNA)
Else
  ShowWindowX(This.Ctl32_HWnds, SW_HIDE)
  ShowWindowX(This.Ctl32_HWnd, SW_HIDE)
Endif


ENDPROC
PROCEDURE ctl32_create
#Define WS_EX_CLIENTEDGE		0x200
#Define WS_EX_WINDOWEDGE		0x100
#Define WS_EX_OVERLAPPEDWINDOW	Bitor(WS_EX_WINDOWEDGE, WS_EX_CLIENTEDGE)
#Define WS_EX_STATICEDGE	0x20000

#Define WS_CHILD				0x40000000
#Define WS_VISIBLE				0x10000000
#Define WS_CLIPSIBLINGS			0x4000000
#Define WS_BORDER				0x800000

#Define WM_NCPAINT				0x85

#Define GWL_HINSTANCE			-6
#Define GWL_EXSTYLE				-20
#Define GWL_STYLE				-16

#Define PBS_SMOOTH				0x1			&& Comctl32.dll Version 4.7 or later
#Define PBS_VERTICAL			0x4			&& Comctl32.dll Version 4.7 or later
#Define PBS_MARQUEE				0x8			&& Comctl32.dll version 6

#Define WM_USER					0x400
#Define CCM_FIRST				0x2000
#Define CCM_SETBKCOLOR			(CCM_FIRST + 1)

#Define PBM_DELTAPOS			(WM_USER+3)
#Define PBM_GETPOS				(WM_USER+8)
#Define PBM_GETRANGE			(WM_USER+7)
#Define PBM_SETBARCOLOR			(WM_USER+9)
#Define PBM_SETBKCOLOR			CCM_SETBKCOLOR
#Define PBM_SETPOS				(WM_USER+2)
#Define PBM_SETRANGE			(WM_USER+1)
#Define PBM_SETRANGE32			(WM_USER+6)
#Define PBM_SETSTEP				(WM_USER+4)
#Define PBM_STEPIT				(WM_USER+5)
#Define PBM_SETMARQUEE  		(WM_USER+10)

#Define SW_HIDE					0
#Define SW_SHOW					5
#Define SW_SHOWNA				8

* START Version 1.2
#Define HWND_TOP				0
#Define SWP_NOMOVE				0x2
#Define SWP_NOSIZE				0x1
* END Version 1.2

#Define SW_SHOWDEFAULT			10

#Define COLOR_HIGHLIGHT         13
#Define COLOR_BTNFACE           15

#Define PS_SOLID				0
#Define COLOR_WINDOW            5
#Define COLOR_BTNFACE           15

With This

	If .ctl32_Creating Then
		Return
	Endif

* We enter Initialization Stage... (checked by ctl32_Resize)
	.ctl32_Creating = .T.

* If Win98 or Themes off, set flat for statusbar
	.ctl32_Flat = .Flat
	If .InStatusBar = .T. Then
		If .ctl32_XP = .F. Or isThemeActive() = 0 Then
			.ctl32_Flat = .T.
			.Themes = .F.
		Endif
		If .Themes = .F. Then
			.ctl32_Flat = .T.
		Endif
	Endif

* Create Static window to hold progressbar if needed
	If .ctl32_Flat = .T. Then
*Define parameters for static createwindowex:
		.ctl32_dwExStyle = 0
		.ctl32_lpClassName = [static]
		.ctl32_lpWindowName = ""
		.ctl32_dwStyle = Bitor(WS_CHILD, WS_CLIPSIBLINGS)

		.ctl32_hMenu = 0
		.ctl32_hInstance = GetWindowLong(.ctl32_ParentHWnd, GWL_HINSTANCE)
		.ctl32_lpParam = 0

		.ctl32_hwnds = CreateWindowEx( ;
			.ctl32_dwExStyle, ;
			.ctl32_lpClassName, ;
			.ctl32_lpWindowName, ;
			.ctl32_dwStyle, ;
			.Left + 1, .Top + 1, .Width - 2, .Height - 2,;
			.ctl32_ParentHWnd,;
			.ctl32_hMenu, ;
			.ctl32_hInstance, ;
			.ctl32_lpParam)

* If the handle to the Control is 0 then we have a problem!
		If .ctl32_hwnds = 0
			Messagebox([Error Creating Common Control ] + [static] + [ Window], 0+16, .ctl32_name)
		Endif

	Endif

* Define parameters for progressbar createwindowex:
	Local lnParentHWnd

	.ctl32_dwExStyle = 0
	.ctl32_lpClassName = [msctls_progress32]
	.ctl32_lpWindowName = ""
	.ctl32_dwStyle = Bitor(WS_CHILD, WS_CLIPSIBLINGS)

	If .ctl32_Flat = .T. Then
		.ctl32_Left = -2
		.ctl32_Top = -2
		.ctl32_Width = .Width + 2
		.ctl32_Height = .Height + 2
		m.lnParentHWnd = .ctl32_hwnds
	Else
		.ctl32_Left = .Left
		.ctl32_Top = .Top
		.ctl32_Width = .Width
		.ctl32_Height = .Height
		m.lnParentHWnd = .ctl32_ParentHWnd
	Endif .ctl32_Flat = .T.

* Setup Control specific Styles:
* Marquee
	If .Marquee = .T. Then
		.ctl32_dwStyle = Bitor(.ctl32_dwStyle, PBS_MARQUEE)
	Endif

* Smooth
	If .Smooth = .T.
		.ctl32_dwStyle = Bitor(.ctl32_dwStyle, PBS_SMOOTH)
	Endif

* Orientation
	If .Vertical = .T. Or .Orientation <> 0 Then
		.ctl32_dwStyle = Bitor(.ctl32_dwStyle, PBS_VERTICAL)
	Endif

	.ctl32_hMenu = 0

	.ctl32_hInstance = GetWindowLong(.ctl32_ParentHWnd, GWL_HINSTANCE)

	.ctl32_lpParam = 0

	.ctl32_hwnd = CreateWindowEx( ;
		.ctl32_dwExStyle, ;
		.ctl32_lpClassName, ;
		.ctl32_lpWindowName, ;
		.ctl32_dwStyle, ;
		.ctl32_Left, .ctl32_Top, .ctl32_Width, .ctl32_Height, ;
		m.lnParentHWnd,;
		.ctl32_hMenu, ;
		.ctl32_hInstance, ;
		.ctl32_lpParam)

* If the handle to the Control is 0 then we have a problem!
	If .ctl32_hwnd = 0
		Messagebox([Error Creating Common Control ] + .ctl32_lpClassName + [ Window], 0+16, .ctl32_name)
	Endif

* Set Theme
	If .ctl32_XP Then
		Local lUseThemes

		lUseThemes = This.Themes

		If Thisform.Themes = .F. Then
			lUseThemes = .F.
		Endif

		If Sys(2700) = "0" Then
			lUseThemes = .F.
		Endif

		If isThemeActive() = 0 Then
			lUseThemes = .F.
		Endif

		If lUseThemes Then
			SetWindowTheme(This.HWnd, Null, Null)
		Else
			SetWindowTheme(This.HWnd, Null, "")
		Endif

	Endif

* Set Control Minimum and Maximum values:
	.Min = .Minimum
	.Max = .Maximum

* Set Control Step Value
	.Step = .Step

* Set Control Value to the Container Value property
	.Value = .Value

* Set MarqueeSpeed Value
	.MarqueeSpeed = .MarqueeSpeed

* Set Play state
	.Play = .Play

* Set Colors
	.BackColor = .BackColor
	.BarColor = .BarColor

* Set Visible state
	.Visible = .Visible

* START Version 1.2
* Bring to front in forms with ShowWindow = 2
	.ctl32_activate

* We finish Initialization State
	.ctl32_Creating = .F.

Endwith

ENDPROC
PROCEDURE ctl32_destroy

* Release Control:
DestroyWindow(This.Ctl32_HWnd)
DestroyWindow(This.Ctl32_HWnds)

This.Ctl32_HWnd = 0
This.Ctl32_HWnds = 0

ENDPROC
PROCEDURE ctl32_declaredlls
Local laDLLs[1], lnLen

Adlls( laDLLs )
m.lnLen = Alen( laDLLs, 1 )

If Ascan( laDLLs, "CreateWindowEx", 1, m.lnLen , 1, 15 ) = 0
  Declare Integer CreateWindowEx In user32 ;
    INTEGER dwExStyle,;
    STRING lpClassName,;
    STRING lpWindowName,;
    INTEGER dwStyle,;
    INTEGER x,;
    INTEGER Y,;
    INTEGER nWidth,;
    INTEGER nHeight,;
    INTEGER hWndParent,;
    INTEGER hMenu,;
    INTEGER hInstance,;
    INTEGER lpParam
Endif

If Ascan( laDLLs, "CallWindowProc", 1, m.lnLen , 1, 15 ) = 0
  Declare Integer CallWindowProc In user32 ;
    INTEGER lpPrevWndFunc,;
    INTEGER HWnd,;
    INTEGER msg,;
    INTEGER wParam,;
    INTEGER Lparam
Endif

If Ascan( laDLLs, "DestroyWindow", 1, m.lnLen , 1, 15 ) = 0
  Declare Integer DestroyWindow In user32 ;
    INTEGER HWnd
Endif

If Ascan( laDLLs, "GetSysColor", 1, m.lnLen , 1, 15 ) = 0
  Declare Integer GetSysColor In user32 ;
    INTEGER nIndex
Endif

If Ascan( laDLLs, "GetWindowLong", 1, m.lnLen , 1, 15 ) = 0
  Declare Integer GetWindowLong In user32 ;
    INTEGER HWnd, ;
    INTEGER nIndex
Endif

If Not Val(Os(3)) + Val(Os(4))/100 < 5.01 Then
	If Ascan( laDLLs, "IsThemeActive", 1, m.lnLen , 1, 15 ) = 0
		Declare Integer IsThemeActive In uxtheme.Dll
	Endif
ENDIF

If Ascan( laDLLs, "PostMessage", 1, m.lnLen , 1, 15 ) = 0
  Declare Integer PostMessage In user32 ;
    INTEGER HWnd,;
    INTEGER Msg,;
    INTEGER wParam,;
    INTEGER Lparam
Endif

If Ascan( laDLLs, "RedrawWindow", 1, m.lnLen , 1, 15 ) = 0
  Declare Integer RedrawWindow In user32 ;
    INTEGER HWnd,;
    STRING @ lprcUpdate,;
    INTEGER hrgnUpdate,;
    INTEGER fuRedraw
Endif

If Ascan( laDLLs, "SendMessageN", 1, m.lnLen , 1, 15 ) = 0
  Declare Integer SendMessage In user32 as SendMessageN;
    INTEGER HWnd,;
    INTEGER Msg,;
    INTEGER wParam,;
    INTEGER Lparam
Endif

If Ascan( laDLLs, "SetWindowLong", 1, m.lnLen , 1, 15 ) = 0
  Declare Integer SetWindowLong In user32 ;
    INTEGER HWnd,;
    INTEGER nIndex,;
    INTEGER dwNewLong
Endif

If Ascan( laDLLs, "SetWindowPos", 1, m.lnLen , 1, 15 ) = 0
  Declare Integer SetWindowPos In user32 ;
    INTEGER HWnd,;
    INTEGER hWndInsertAfter,;
    INTEGER x,;
    INTEGER Y,;
    INTEGER cx,;
    INTEGER cy,;
    INTEGER wFlags
Endif

If NOT Val(Os(3)) + Val(Os(4))/100 < 5.01 Then
  If Ascan( laDLLs, "SetWindowTheme", 1, m.lnLen , 1, 15 ) = 0
    Declare Integer SetWindowTheme In UxTheme ;
      INTEGER HWnd,;
      String pszSubAppName,;
      String pszSubIdList
  Endif
Endif

If Ascan( laDLLs, "ShowWindowX", 1, m.lnLen , 1, 15 ) = 0
  Declare Integer ShowWindow In user32 As ShowWindowX ;
    INTEGER HWnd,;
    INTEGER nCmdShow
Endif

ENDPROC
PROCEDURE ctl32_bindevents
#Define WM_ACTIVATEAPP	0x1C

* Bind resize event to refresh Control position and size:
Bindevent(This, [RESIZE], This, [CTL32_RESIZE],1)
Bindevent(This, [TOP], This, [CTL32_RESIZE],1)
Bindevent(This, [LEFT], This, [CTL32_RESIZE],1)
Bindevent(Thisform,[THEMES],This,[CTL32_THEMES],1)

If Thisform.ShowWindow = 2 Then
  Bindevent(_vfp.HWnd, WM_ACTIVATEAPP, This, [CTL32_ACTIVATEAPP],4)
  _Screen.AddProperty([CTL32_ACTIVATE], .F.)
  Bindevent(_Screen,[CTL32_ACTIVATE],This,[CTL32_ACTIVATE],1)
Endif

ENDPROC
PROCEDURE ctl32_unbindevents
#Define WM_ACTIVATEAPP	0x1C

RETURN

If This.ctl32_HWnd = 0 Then
  Return
Endif

Unbindevent(This, [RESIZE], This, [CTL32_RESIZE])
Unbindevent(This, [TOP], This, [CTL32_RESIZE])
Unbindevent(This, [LEFT], This, [CTL32_RESIZE])
Unbindevent(Thisform,[THEMES],This,[CTL32_THEMES])

* Unbindevent(_Screen,[THEMES],This,[CTL32_THEMES])

If Thisform.ShowWindow = 2 Then
  Unbindevent(_Screen,[CTL32_ACTIVATE],This,[CTL32_ACTIVATE])
Endif


ENDPROC
PROCEDURE marqueespeed_assign
#Define PBS_MARQUEE				0x8			&& Comctl32.dll version 6

Lparameters vNewVal

If Type("m.vNewVal") <> [N]
  Messagebox([Parameter must be Numeric: ] + Program(), 16)
  Return
Endif

This.MarqueeSpeed = m.vNewVal

SendMessageN(This.Ctl32_HWnd, PBM_SETMARQUEE, 1, This.MarqueeSpeed)



ENDPROC
PROCEDURE stepit
#Define WM_USER					0x400
#Define PBM_STEPIT				(WM_USER+5)

Lparameters lnVal

Local lnOldStep

* If no numeric parameter, use actual step value:
If Type("m.lnVal") <> "N"
  m.lnVal = This.Step
Endif

If This.Repeat = .F. And This.Value + m.lnVal > This.Maximum Then
*  This.Value = This.Maximum
  Return
Endif

If This.Repeat = .F. And This.Value + m.lnVal < This.Minimum Then
*  This.Value = This.Minimum
  Return
Endif

* If parameter is different from actual step value:
If m.lnVal <> This.Step Then
  This.ctl32_OldStep = This.Step
  This.Step = m.lnVal
Else
  This.ctl32_OldStep = 0
Endif

* Send StepIt message:
SendMessageN(This.ctl32_hwnd, PBM_STEPIT, 0, 0)

*Reset Step Value if old value saved:
If This.ctl32_OldStep <> 0 Then
  This.Step = This.ctl32_OldStep
Endif

* Update Container Value Property with the position property of Control,
* forcing Access and Assign Events to fire:
*This.Value = This.Value




ENDPROC
PROCEDURE hwnd_access
* Returns the HWnd of the Control
RETURN This.Ctl32_HWnd

ENDPROC
PROCEDURE value_access
#Define WM_USER					0x400
#Define PBM_GETPOS				(WM_USER+8)

Local nValue

* If setting up Control, use Value of Container, not Value of Control
If This.ctl32_Creating = .T. Then
  m.nValue = This.Value
Else
  * Ask Control for Value to return:
  m.nValue = SendMessageN(This.ctl32_hwnd, PBM_GETPOS, 0, 0)
Endif

Return m.nValue
ENDPROC
PROCEDURE value_assign
#Define WM_USER					0x400
#Define PBM_SETPOS				(WM_USER+2)

Lparameters vNewVal

If Type("m.vNewVal") <> [N]
  Messagebox([Parameter must be Numeric: ] + Program(), 16)
  Return
Endif

If This.Repeat = .F.

  If m.vNewVal > This.Maximum Then
    Return
  Endif

  If m.vNewVal < This.Minimum Then
    Return
  Endif

Else

  If m.vNewVal > This.Maximum Then
    m.vNewVal = This.Minimum
  Endif

  If m.vNewVal < This.Minimum Then
    m.vNewVal = This.Maximum
  Endif

Endif

This.Value = m.vNewVal


If This.HWnd # 0 Then
  SendMessageN(This.ctl32_hwnd, PBM_SETPOS, m.vNewVal, 0)
Endif





ENDPROC
PROCEDURE percent_access
Return INT(100 * (This.Value - This.Minimum) / (ABS(This.Maximum - This.Minimum)))



ENDPROC
PROCEDURE smooth_assign
Lparameters vNewVal

If Type("m.vNewVal") = [N] Then
  If m.vNewVal = 0 Then
    m.vNewVal = .F.
  Else
    m.vNewVal = .T.
  Endif
ENDIF

If Type("m.vNewVal") <> [L] Then
  Messagebox([Parameter must be Logical: ] + Program(), 16)
  Return
Endif

This.Smooth = m.vNewVal

* Smooth change needs to recreate Control
If This.ctl32_hwnd <> 0 Then
  This.ctl32_destroy()
  This.ctl32_Create()
Endif


ENDPROC
PROCEDURE backcolor_assign
#Define WM_USER					0x400
#Define CCM_FIRST				0x2000
#Define CCM_SETBKCOLOR			(CCM_FIRST + 1)

#Define PBM_SETBARCOLOR			(WM_USER+9)
#Define PBM_SETBKCOLOR			CCM_SETBKCOLOR

#Define COLOR_BTNFACE           15

Lparameters vNewVal

If Type("m.vNewVal") <> [N]
	Messagebox([Parameter for BackColor must be Numeric])
Endif

If m.vNewVal > 16777215 Then
	m.vNewVal = -1
Endif

If m.vNewVal = -1 Then
	m.vNewVal = GetSysColor(COLOR_BTNFACE)
Endif

This.BackColor= m.vNewVal

SendMessageN(This.Ctl32_HWnd, PBM_SETBKCOLOR, 0, This.BackColor)

Return

ENDPROC
PROCEDURE barcolor_assign
#Define WM_USER					0x400
#Define CCM_FIRST				0x2000
#Define CCM_SETBKCOLOR			(CCM_FIRST + 1)

#Define PBM_SETBARCOLOR			(WM_USER+9)
#Define PBM_SETBKCOLOR			CCM_SETBKCOLOR

#Define COLOR_HIGHLIGHT         13

Lparameters vNewVal

If Type("m.vNewVal") <> [N]
  Messagebox([Parameter for BarColor must be Numeric])
Endif

If m.vNewVal > 16777215 Then
  m.vNewVal = -1
Endif

If m.vNewVal = -1 Then
  m.vNewVal = GetSysColor(COLOR_HIGHLIGHT)
Endif

This.BarColor= m.vNewVal

SendMessageN(This.Ctl32_HWnd, PBM_SETBARCOLOR, 0, This.BarColor)

Return

ENDPROC
PROCEDURE play_assign
Lparameters vNewVal

If Type("m.vNewVal") = [N] Then
  If m.vNewVal = 0 Then
    m.vNewVal = .F.
  Else
    m.vNewVal = .T.
  Endif
Endif

If Type("m.vNewVal") <> [L] Then
  Messagebox([Parameter must be Logical: ] + Program(), 16)
  Return
Endif

If m.vNewVal = .T. And This.Marquee = .T. Then
  Return
Endif

This.Play = m.vNewVal

If This.Play = .T. Then
  This.Value = This.Minimum
Endif

This.tmrControlTimer.Enabled = This.Play

ENDPROC
PROCEDURE scrolling_assign
Lparameters vNewVal

If Type("m.vNewVal") <> [N]
  Messagebox([Parameter must be Numeric: ] + Program(), 16)
  Return
Endif

This.Srolling = m.vNewVal

If This.Scrolling = 0 Then
  This.Smooth = .F.
Else
  This.Smooth = .T.
Endif

ENDPROC
PROCEDURE percent_assign
LPARAMETERS vNewVal
RETURN
ENDPROC
PROCEDURE max_assign
Lparameters vNewVal

If Type("m.vNewVal") <> [N]
  Messagebox([Parameter must be Numeric: ] + Program(), 16)
  Return
Endif

This.Max = m.vNewVal
This.Maximum = m.vNewVal

ENDPROC
PROCEDURE min_assign
LPARAMETERS vNewVal

If Type("m.vNewVal") <> [N]
  Messagebox([Parameter must be Numeric: ] + Program(), 16)
  Return
Endif

This.Min = m.vNewVal
This.Minimum = m.vNewVal
ENDPROC
PROCEDURE hwnd_assign
LPARAMETERS vNewVal
RETURN
ENDPROC
PROCEDURE reset
This.Value = This.Minimum


ENDPROC
PROCEDURE orientation_assign
Lparameters vNewVal

If Type("m.vNewVal") <> [N]
  Messagebox([Parameter must be Numeric: ] + Program(), 16)
  Return
Endif

This.Orientation = m.vNewVal

If This.Orientation = 0 Then
  This.Vertical = .F.
Else
  This.Vertical = .T.
Endif


ENDPROC
PROCEDURE vertical_assign
Lparameters vNewVal

If Type("m.vNewVal") = [N] Then
  If m.vNewVal = 0 Then
    m.vNewVal = .F.
  Else
    m.vNewVal = .T.
  Endif
ENDIF

If Type("m.vNewVal") <> [L] Then
  Messagebox([Parameter must be Logical: ] + Program(), 16)
  Return
Endif

This.Vertical = m.vNewVal

If This.Vertical = .T. Then
  This.Orientation = 1
Else
  This.Orientation = 0
Endif

* Vertical change needs to recreate Control
If This.ctl32_hwnd <> 0 Then
  This.ctl32_destroy()
  This.ctl32_Create()
Endif

ENDPROC
PROCEDURE themes_assign
Lparameters vNewVal

If This.ctl32_XP = .F.
	Return
Endif

If Type("m.vNewVal") = [N] Then
	If m.vNewVal = 0 Then
		m.vNewVal = .F.
	Else
		m.vNewVal = .T.
	Endif
Endif

If Type("m.vNewVal") <> [L] Then
	Messagebox([Parameter must be Logical: ] + Program(), 16)
	Return
Endif

This.Themes = m.vNewVal

If This.HWnd = 0 Then
	Return
Endif

* Window is recreated, or artifacts remain in border:
This.ctl32_Destroy()
This.ctl32_Create()


ENDPROC
PROCEDURE ctl32_themes
This.Themes = ThisForm.Themes
ENDPROC
PROCEDURE flat_assign
#Define COLOR_WINDOW            5
#Define COLOR_BTNFACE           15

Lparameters vNewVal

If Type("m.vNewVal") = [N] Then
  If m.vNewVal = 0 Then
    m.vNewVal = .F.
  Else
    m.vNewVal = .T.
  Endif
ENDIF

If Type("m.vNewVal") <> [L] Then
  Messagebox([Parameter must be Logical: ] + Program(), 16)
  Return
Endif

This.Flat = m.vNewVal

If This.ctl32_hwnd <> 0 Then
  This.ctl32_destroy()
  This.ctl32_Create()
Endif

ENDPROC
PROCEDURE bordercolor_assign
LPARAMETERS vNewVal

If m.vNewVal = -1 Then
  m.vNewVal = RGB(0,0,0)
Endif

THIS.BorderColor = m.vNewVal

ENDPROC
PROCEDURE ctl32_activateapp
#DEFINE WM_ACTIVATEAPP	0x1C
#Define GWL_WNDPROC		-4

Lparameters HWnd As Integer, Msg As Integer, wParam As Integer, Lparam As Integer
nRetvalue=0

If Msg = WM_ACTIVATEAPP && App Switching

  If wParam = 1 Then
    _Screen.ctl32_Activate = .T.
  ENDIF
  
  lpPrevWndFunc =GetWindowLong(_vfp.HWnd,GWL_WNDPROC)
  nRetvalue = CallWindowProc(lpPrevWndFunc,HWnd,Msg,wParam,Lparam)

Endif
Return nRetvalue

ENDPROC
PROCEDURE ctl32_activate
#Define HWND_TOP				0
#Define SWP_NOMOVE				0x2
#Define SWP_NOSIZE				0x1

With This
  If .ctl32_Flat = .T. Then
    SetWindowPos(.ctl32_hwnds, HWND_TOP,;
      0, ;
      0, ;
      0, ;
      0, ;
      BITOR(SWP_NOSIZE, SWP_NOMOVE))
  Else
    SetWindowPos(.ctl32_hwnd, HWND_TOP,;
      0, ;
      0, ;
      0, ;
      0, ;
      BITOR(SWP_NOSIZE, SWP_NOMOVE))
    * END Version 1.2
  Endif
Endwith

ENDPROC
PROCEDURE instatusbar_assign
LPARAMETERS vNewVal
*To do: Modify this routine for the Assign method
THIS.InStatusBar = m.vNewVal

ENDPROC
PROCEDURE repeat_assign
LPARAMETERS vNewVal

If Type("m.vNewVal") = [N] Then
  If m.vNewVal = 0 Then
    m.vNewVal = .F.
  Else
    m.vNewVal = .T.
  Endif
ENDIF

If Type("m.vNewVal") <> [L] Then
  Messagebox([Parameter must be Logical: ] + Program(), 16)
  Return
Endif

THIS.Repeat = m.vNewVal

ENDPROC
PROCEDURE width_assign
Lparameters vNewVal
*To do: Modify this routine for the Assign method
This.Width = m.vNewVal

With This
	If .SizeAdjust = .T. Then
		If .Orientation = 0 Or .Vertical = .F. Then
			.Width = Round((.Width - 5)/8,0) * 8 + 5
		Endif
	Endif
Endwith

ENDPROC
PROCEDURE height_assign
Lparameters vNewVal
*To do: Modify this routine for the Assign method
This.Height = m.vNewVal

With This
	If .SizeAdjust = .T. Then
		If .Orientation = 1 Or .Vertical = .T. Then
			.Height = Round((.Height - 8)/8,0) * 8 + 5
		Endif
	Endif
Endwith

ENDPROC
PROCEDURE Init
*	Ctl32_ProgressBar
*	Control creado por Carlos Alloatti - calloatti@gmail.com
*	Utiliza funciones API de Windows
*	Probado con Windows XP, 98 y VFP 9
*	Versi�n  1.00 - 2005-12-01

Parameters tnparenthwnd

This.lblControlNameH.Caption = ""
This.lblControlNameV.Caption = ""
This.BackStyle = 0

With This

	If Val(Os(3)) + Val(Os(4))/100 < 5.01
		.ctl32_XP = .F.
	Else
		.ctl32_XP = .T.
	Endif

	If Type([ThisForm]) <> [O] Then
		Messagebox([USAGE: _Screen.Newobject("oProgressBar","ctl32_progressbar","ctl32_progressbar.vcx")],16)
		Return
	Endif

	If .InStatusBar = .T. And Pcount() = 0 Then
		Return
	Endif

	If Pcount() > 0 Then
		.ctl32_Parenthwnd = m.tnparenthwnd
	Else
		.ctl32_Parenthwnd = Thisform.HWnd
	Endif

	If .Parent.BaseClass <> "Form" And .ctl32_Parenthwnd = 0 Then
		Return
	Endif

	If Thisform.Name = _Screen.Name  OR .InStatusBar = .T. Then
		.Visible = .F.
	Endif

	If .SizeAdjust = .T. Then
		If .Orientation = 1 Or .Vertical = .T. Then
			.Height = Round((.Height - 8)/8,0) * 8 + 5
		Else
			.Width = Round((.Width - 5)/8,0) * 8 + 5
		Endif
	Endif

	.ctl32_declaredlls()
	.ctl32_BindEvents()
	.ctl32_Create()

Endwith


ENDPROC
PROCEDURE Destroy
This.Ctl32_Destroy()



ENDPROC
     �Width = 301
Height = 18
ForeColor = 0,0,0
ctl32_hwnd = 0
ctl32_dwexstyle = 0
ctl32_dwstyle = 0
ctl32_parenthwnd = 0
ctl32_hinstance = 0
minimum = 0
maximum = 100
_memberdata =     3003<VFPData><memberdata name="vertical" type="property" display="Vertical" script="gnobject = ASELOBJ(gObj)&#xA;&#xA;gObj(1).Vertical = NOT gObj(1).Vertical&#xA;&#xA;lnWidth = gObj(1).Height&#xA;lnHeight = gObj(1).Width&#xA;&#xA;gObj(1).Width = lnWidth&#xA;gObj(1).Height = lnHeight&#xA;" favorites="True"/><memberdata name="builderx" type="property" display="BuilderX" script="do home() + &quot;wizards\ctl32_progressbar_builder.app&quot;"/><memberdata name="flat" type="property" display="Flat" script="gnobject = ASELOBJ(gObj)&#xA;&#xA;gObj(1).Flat = NOT gObj(1).Flat" favorites="True"/><memberdata name="marquee" type="property" display="Marquee" script="gnobject = ASELOBJ(gObj)&#xA;&#xA;gObj(1).Marquee = NOT gObj(1).Marquee" favorites="True"/><memberdata name="marqueespeed" type="property" display="MarqueeSpeed" favorites="True"/><memberdata name="maximum" type="property" display="Maximum" favorites="True"/><memberdata name="minimum" type="property" display="Minimum" favorites="True"/><memberdata name="orientation" type="property" display="Orientation"/><memberdata name="parenthwnd" type="property" display="ParenthWnd"/><memberdata name="percent" type="property" display="Percent"/><memberdata name="play" type="property" display="Play" script="gnobject = ASELOBJ(gObj)&#xA;&#xA;gObj(1).Play = NOT gObj(1).Play" favorites="True"/><memberdata name="scrolling" type="property" display="Scrolling"/><memberdata name="sizeadjust" type="property" display="SizeAdjust" favorites="True" script="gnobject = ASELOBJ(gObj)&#xA;&#xA;gObj(1).SizeAdjust = NOT gObj(1).SizeAdjust"/><memberdata name="smooth" type="property" display="Smooth" script="gnobject = ASELOBJ(gObj)&#xA;&#xA;gObj(1).Smooth = NOT gObj(1).Smooth"/><memberdata name="stepit" type="method" display="StepIt"/><memberdata name="builderx" type="property" display="Builderx"/><memberdata name="hwnd" type="property" display="Hwnd"/><memberdata name="step" type="property" display="Step"/><memberdata name="value" type="property" display="Value"/><memberdata name="repeat" type="property" display="Repeat" favorites="True" script="gnobject = ASELOBJ(gObj)&#xA;&#xA;gObj(1).Repeat = NOT gObj(1).Repeat"/><memberdata name="reset" type="method" display="Reset"/><memberdata name="max" type="property" display="Max"/><memberdata name="min" type="property" display="Min"/><memberdata name="themes" type="property" display="Themes" script="gnobject = ASELOBJ(gObj)&#xA;&#xA;gObj(1).Themes = NOT gObj(1).Themes" favorites="True"/><memberdata name="barcolor" type="property" display="BarColor" script="gnobject = Aselobj(gObj)&#xA;&#xA;lnColor = Getcolor(gObj(1).Barcolor)&#xA;&#xA;If lnColor = -1 Then&#xA;  Return&#xA;Endif&#xA;&#xA;gObj(1).Barcolor = lnColor&#xA;" favorites="True"/><memberdata name="backcolor" type="property" favorites="True"/><memberdata name="instatusbar" type="property" display="InStatusBar" script="gnobject = ASELOBJ(gObj)&#xA;&#xA;gObj(1).InStatusBar = NOT gObj(1).InStatusBar "/></VFPData>
step = 1
ctl32_name = ctl32_progressbar
marqueespeed = 100
hwnd = 0
value = 0
percent = 0
parenthwnd = 0
ctl32_hmenu = 0
ctl32_lpparam = 0
ctl32_lpwindowname = ProgressBar
barcolor = -1
max = 0
min = 0
scrolling = 0
orientation = 0
ctl32_oldstep = 0
themes = .T.
ctl32_version = 2.0
ctl32_hwnds = 0
ctl32_left = 0
ctl32_top = 0
ctl32_width = 0
ctl32_height = 0
builderx = (home() + "wizards\ctl32_progressbar.app")
instatusbar = .F.
ctl32_flat = .F.
ctl32_xp = .F.
Name = "ctl32_progressbar"
   %         �  8     ��[4K   �� 4�  � � %�C�t� ��9 � � Builder.scx���  � B� � �� � ���� �� � � �  T�� �� ctl32_ProgressBar��  ��C �� � app� Builder�	 ��" ��C �� � chm�	 Help File�	 ��� T�� ��7 This Builder should be used while in the Form Designer.�  Right click on any �� �&  Control and choose "Builder" from the�  Context Menu.�� T�� ��0�� T�� ��� �  Builder�� ��C�� �� �� �x�� U
  P1 P2 BUILDER SCX LCCLASS LAFILE	 LCMESSAGE	 LNOPTIONS LCTITLE INSTALLFILEr 4�  � � �' �� � � � ���� ���� �+ T�� �CCC�� ]������  � .�� ��, T�� �C�Q� Wizards\��  � .�� �� T� �-�� %�C�� 0
��� �? T�� �C�� �  �  � � Where is the file C�� ��� ?��� � %�C�� ���r�' T��	 ��� �  install canceled!�� T��
 ��0�� T�� ���  �  �� �� T�� �C��	 ��
 �� �x�� B� � %�C�� 0
���� T� �a��  T��	 ��� �  installed!�� ��� T��	 ��� �	  updated!�� ��C��� �� ��� ��C��� �� ���. T�� �������CC���� �  � 0���. T�� �������CC���� �  � 0���# %�C���� C���� ���� T� �a�� �@ %�C���� C���� � C���� C���� 	���� T� �a�� � � %�� -���� B� � T�� �C�� ���� ��C�� �� ���� T��
 ��@�� T�� ���  �  �� �� T�� �C��	 ��
 �� �x�� B� U  TCNAME TCEXT TCTITLE LBDOCOPY LCFILE1 LCFILE2 LAFILE1 LAFILE2 LCDATA	 LCMESSAGE	 LNOPTIONS LNRETVAL InstallFile"    ��� �A B � "
� ��2 � r��� "�A q� ��A A "� � �QQ��2� A � A B � A A B1� ��B 4                    `  �     .\ builder.scx builder.sct ..\ ctl32_progressbar.vcx ctl32_progressbar.vct builder.prg c:\docume~1\admini~1\config~1\temp\ builder.fxp 	)   �                 �  �b                 �b  dj                dj  �J    5            �J �Q W   {           