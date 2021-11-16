#Include  API_Menu.h

Private po_Menu, po_Toolbar

Local lh_Popup, lh_Popup2, ln_OldGdiBatchLimit
Local ln_PopupIndex, ln_SubPopupIndex, ln_ItemPos
Local ll_Bold, ll_Italic, ll_Underline, lc_GraphDir
Local lc_OldTalk, lc_OldNotify, lc_OldNotifyCursor

po_Menu = NewObject( 'PopupMenu', 'OwnerDrawn_Menu' )
If (VarType( po_Menu ) != 'O')
	Return
endif

Set SysMenu save  && save VFP system menu

** Just in case somethings going wrong (for debugging purposes)
On key label ALT+F10 Do QuitProg
On shutdown Do QuitProg

lc_OldTalk = set( 'Talk' )
lc_OldNotify = set( 'Notify' )
lc_OldNotifyCursor = set( 'Notify', 1 )
ln_OldGdiBatchLimit = GdiSetBatchLimit( 1 )
Set talk off
Set notify off
Set notify cursor off

lc_GraphDir = AddBS( home( 4 )) + 'bitmaps\outline\Redmask\'
With po_Menu
	.hWndParent = _VFP.hWnd
	.Gdiplus_Start()  && Initialize GDI+

	** Set menu properties
	Store .F. to .lUseGradientPad, .lThemed
	.lUseGradient = .T.
	.lGlassy = .T.
	.nHiliteStyle = ODHS_ALL
	.SetRightColor( GetSysColor( COLOR_WINDOW ), .F. )
	.lEnhancedHilite = .T.

	** Create Main Menu Pad
	Dimension .aMenuPad[ 3, 2 ]
	.aMenuPad[ 1, 1 ] = 'MyMenu \<1'
	.aMenuPad[ 1, 2 ] = '1'  && Key is Alt+1

	.aMenuPad[ 2, 1 ] = 'MyMenu \<2'
	.aMenuPad[ 2, 2 ] = '2'  && Key is Alt+2

	.aMenuPad[ 3, 1 ] = 'MyMenu \<3'
	.aMenuPad[ 3, 2 ] = '3'  && Key is Alt+3
	.CreatePad()

	Private pl_Skipped
	pl_Skipped = .F.

	** Popup Index = 1
	.CreatePopupItem( 8 )
	.aPopupItem[1] = 'Disable &this item'
	.aPopupItem[2] = '&Enable first item'
	.aPopupItem[3] = 'Disable &2nd menu pad'
	.aPopupItem[4] = 'Enable 2nd menu &pad'
	.aPopupItem[5] = 'Form &Menu - Popup Sample'
	.aPopupItem[6] = 'Testing mode&less form'
	.aPopupItem[8] = 'E&xit'
	.aPopupBmp[1] = lc_GraphDir + 'Doc.BMP'
	.aPopupBmp[5] = lc_GraphDir + 'OpenFold.BMP'
	.aPopupBmp[6] = lc_GraphDir + 'WinDoc.BMP'
	ln_PopupIndex = 1
	ln_ItemPos = 2
	.CreatePopup( 1001, ln_PopupIndex )
	.DisablePopupItem( ln_PopupIndex, ln_ItemPos )
	.DisablePopupItem( ln_PopupIndex, 4 )

	** Popup Index = 2
	.CreatePopupItem( 6 )
	.aPopupItem[1] = 'Open Document'
	.aPopupItem[2] = 'www.bdurham.com/vfprocks/hermantan/downloads.htm'
	.aPopupItem[3] = 'SubPopup #1'
	.aPopupItem[5] = 'Help'
	.aPopupItem[6] = 'SubPopup #2'
	.aPopupBmp[1] = lc_GraphDir + 'Doc.BMP'
	.aPopupBmp[2] = lc_GraphDir + 'EntirNet.BMP'
	.aPopupBmp[5] = lc_GraphDir + 'Hlp.BMP'

	.aPopupFlags[2] = BitOr( myODF_WEBLINK, myODF_SKIPFOR )
	Store myODF_SKIPFOR to .aPopupFlags[1], .aPopupFlags[6]
	Store 'pl_Skipped' to .aCmdSkipForItem[1], .aCmdSkipForItem[2], .aCmdSkipForItem[6]
	ll_Bold = .F.
	ll_Italic = .F.
	ll_Underline = .T.

	.hFontCustom = .CreateCustomFont( ll_Bold, ll_Italic , ll_Underline )
	lh_Popup = .CreatePopup( 2001, 2 )
	.DisablePopupItem( 2, 6 )

	** Popup Index = 3
	.CreatePopupItem( 6 )
	.aPopupItem[1] = '&1. Skip for (pl_Skipped == .T.)'
	.aPopupItem[2] = '&2. Skip for (pl_Skipped == .T.)'
	.aPopupItem[3] = '&3. Skip for (pl_Skipped == .T.)'
	.aPopupItem[4] = 'Toggle  "pl_Skipped"  variable'
	.aPopupItem[6] = 'SubMenu #1'
	Store myODF_SKIPFOR to .aPopupFlags[1], .aPopupFlags[2], ;
		.aPopupFlags[3], .aPopupFlags[6]
	Store 'pl_Skipped' to .aCmdSkipForItem[1], .aCmdSkipForItem[2], ;
		.aCmdSkipForItem[3], .aCmdSkipForItem[6]
	lh_PopMenu3 = .CreatePopup( 3001, 3 )

	** Popup Index = 4 (Sub popup)
	.CreatePopupItem( 5 )
	.aPopupItem[1] = 'SubPopup #1 - 1'
	.aPopupItem[2] = 'SubPopup #1 - 2'
	.aPopupItem[3] = 'SubPopup #1 - 3'
	.aPopupItem[5] = 'SubPopup 2nd level   '
	.aPopupFlags[1] = myODF_SKIPFOR
	.aCmdSkipForItem[1] = 'pl_Skipped'
	ln_SubPopupIndex = 4
	ln_ItemPos = 3  && Parent Popup item position to be modify
	lh_Popup2 = .CreatePopup( 2201, ln_SubPopupIndex )
	.SetSubPopup( lh_Popup, ln_ItemPos, ln_SubPopupIndex )

	** Popup Index = 5 (Sub popup)
	.CreatePopupItem( 3 )
	.aPopupItem[1] = 'SubPopup #2 - 1'
	.aPopupItem[2] = 'SubPopup #2 - 2'
	.aPopupItem[3] = 'SubPopup #2 - 3'
	ln_SubPopupIndex = 5
	ln_ItemPos = 6
	.CreatePopup( 2401, ln_SubPopupIndex )
	.SetSubPopup( lh_Popup, ln_ItemPos, ln_SubPopupIndex )

	** Popup Index = 6 (Sub popup 2nd level)
	.CreatePopupItem( 3 )
	.aPopupItem[1] = 'SubPopup 2nd level #1 - &1'
	.aPopupItem[2] = 'SubPopup 2nd level #1 - 2'
	.aPopupItem[3] = 'SubPopup 2nd level #1 - 3'
	.aPopupFlags[2] = myODF_SKIPFOR
	.aCmdSkipForItem[2] = 'pl_Skipped'
	.CreatePopup( 2221, 6 )
	.SetSubPopup( lh_Popup2, 5, 6 )

	** Popup Index = 7 (Sub popup)
	.CreatePopupItem( 2 )
	.aPopupItem[1] = 'SubMenu #1 - 1'
	.aPopupItem[2] = 'SubMenu #1 - 2'
	ln_SubPopupIndex = 7
	ln_ItemPos = 6  && Parent Popup item position to be modify
	.CreatePopup( 3201, ln_SubPopupIndex )
	.SetSubPopup( lh_PopMenu3, ln_ItemPos, ln_SubPopupIndex )

	** Set Submenu to MainMenu
	.SetSubmenu( 1, 1 )
	.SetSubmenu( 2, 2 )
	.SetSubmenu( 3, 3 )
	.BindMessages()
	Activate menu (.cMenuName) nowait
EndWith

po_Toolbar = CreateObject( 'MyToolbar' )
po_Toolbar.Visible = .T.
Read events
On shutdown

GdiSetBatchLimit( ln_OldGdiBatchLimit )
po_Menu = Null
Release po_Menu

On key label ALT+F10
Release popup all
Clear class PopupMenu
Clear resources
Set talk &lc_OldTalk
Set notify &lc_OldNotify
Set notify cursor &lc_OldNotifyCursor
Set SysMenu to default
Set SysMenu nosave


******************************************


Procedure QuitProg
	If (VarType( po_Toolbar ) == 'O')
		po_Toolbar = Null
		Release po_Toolbar
	endif

	Clear events
EndProc


Procedure OnSelection( tn_MenuPos, tn_ItemId )
	Do case
		Case (tn_MenuPos == 1)
			MyMenu1( tn_MenuPos, tn_ItemId - 1000 )

		Case (tn_MenuPos == 3)
			MyMenu3( tn_MenuPos, tn_ItemId - 3000 )

		Otherwise
			Wait 'WM_DOCOMMAND: ' + transform( tn_MenuPos ) + '  ' + ;
				transform( tn_ItemId ) window nowait
	EndCase
EndProc


Procedure MyMenu1( tn_MenuPos, tn_ItemPos )
	Local lc_Msg

	With po_Menu
		Do case
			Case (tn_ItemPos == 1)
				.DisablePopupItem( tn_MenuPos, tn_ItemPos )
				.EnablePopupItem( tn_MenuPos, 2 )

			Case (tn_ItemPos == 2)
				.DisablePopupItem( tn_MenuPos, tn_ItemPos )
				.EnablePopupItem( tn_MenuPos, 1 )

			Case (tn_ItemPos == 3)
				.DisablePopupItem( tn_MenuPos, tn_ItemPos )
				.EnablePopupItem( tn_MenuPos, tn_ItemPos+1 )
				.DisableMenuPad( 2 )

			Case (tn_ItemPos == 4)
				.DisablePopupItem( tn_MenuPos, tn_ItemPos )
				.EnablePopupItem( tn_MenuPos, tn_ItemPos-1 )
				.EnableMenuPad( 2 )

			Case (tn_ItemPos == 5)
				.DisableMainMenu()
				po_Toolbar.Enabled = .F.
				Do form Frm_PopupMenu
				po_Toolbar.Enabled = .T.
				.EnableMainMenu()

			Case (tn_ItemPos == 6)
				Do form Frm_Modeless with tn_MenuPos, tn_ItemPos

			Case (tn_ItemPos == 8)
				If (_Screen.FormCount == 0) or ;
					((_Screen.FormCount == 1) and ;
					 (upper( _Screen.Forms[1].Name ) == 'MYTOOLBAR'))
					Do QuitProg
				else
					If (_Screen.FormCount > 1)
						lc_Msg = 'Cannot quit application. ' + CR + CR + ;
							'There are several forms running!'
					else
						lc_Msg = 'Cannot quit application. ' + CR + CR + ;
							'There is a form running!'
					endif

					MessageBox( lc_Msg, MB_ICONINFORMATION, ' ***  ATTENTION  ***' )
				endif
		EndCase
	EndWith
EndProc


Procedure MyMenu3( tn_MenuPos, tn_ItemPos )
	Do case
		Case (tn_ItemPos == 4)
			pl_Skipped = !( pl_Skipped )

		Otherwise
			Wait 'MyMenu3: ' + transform( tn_MenuPos ) + '  ' + ;
				transform( tn_ItemPos ) window nowait
	EndCase
EndProc


*****************************
** Custom Class


Define class myToolButton as CheckBox
	cPic = ''
	cDownPic = ''


	Procedure Init( tc_Pic, tc_DownPic, tc_Caption )
		With This
			.Style = 1
			.SpecialEffect = 2
			.PicturePosition = 1
			.FontName = 'Webdings'
			.Centered = .T.
			If !empty( tc_Pic )
				Store tc_Pic to .Picture, .cPic
				If !empty( tc_DownPic )
					Store tc_DownPic to .DownPicture, .cDownPic
				endif

				.Caption = '6'  && iif( !empty( tc_Caption ), tc_Caption, '' )
			endif

			.AutoSize = .T.
			.Visible = .T.
			.AutoSize = .F.
			.Width = .Width - 8
		EndWith
	EndProc


	Procedure Click
		Local lo_Popup as PopupMenu of OwnerDrawn_Menu
		Local ln_Result, lh_Popup, lc_GraphDir

		UnBindEvents( po_Menu.hWndParent )
		lc_GraphDir = AddBS( home( 4 )) + 'bitmaps\outline\Redmask\'
		lo_Popup = NewObject( 'PopupMenu', 'OwnerDrawn_Menu', '', 1024 )
		With lo_Popup
			.lClearDLL = .F.
			.hWndParent = This.Parent.hWnd
			.lUseGradient = po_Menu.lUseGradient
			.lThemed = po_Menu.lThemed
			.lGlassy = po_Menu.lGlassy
			.lEnhancedHilite = po_Menu.lEnhancedHilite
			.SetLeftColor( po_Menu.nLeftColor )
			.SetRightColor( po_Menu.nRightColor, .F. )
			.nHiliteStyle = po_Menu.nHiliteStyle

			.CreatePopupItem( 4 )
			.aPopupItem[1] = 'Open Document'
			.aPopupItem[2] = 'Just Testing'
			.aPopupItem[4] = 'Help'
			.aPopupBmp[1] = lc_GraphDir + 'Doc.BMP'
			.aPopupBmp[4] = lc_GraphDir + 'Hlp.BMP'
			lh_Popup = .CreatePopup( 11 )

			.nFirstId = 11
			ln_Result = .ActivatePopup( This, 0 )
			If (ln_Result != 0)
				Wait 'Selected Id: ' + transform( ln_Result ) window nowait
			endif
		EndWith

		This.Value = 0
		lo_Popup = Null
		po_Menu.BindMessages()
	EndProc


	Procedure Destroy
		With This
			Store '' to .Picture, .DownPicture
			If !empty( .cDownPic )
				Clear resources (.cDownPic)
			endif
			Clear resources (.cPic)
		EndWith
	EndProc
EndDefine


Define class myToolbar as Toolbar
	Name = 'myToolbar'

	Procedure Init
		Local lc_GraphDir

		lc_GraphDir = AddBS( home( 4 )) + 'bitmaps\outline\nomask\'
		With This
			.Dock( TBD_TOP )
			.AddObject( 'cmd1', 'myToolButton', ;
				lc_GraphDir + 'ClsdFold.bmp', lc_GraphDir + 'OpenFold.bmp' )
			With .cmd1
				.Height = SysMetric(9) - SysMetric(4)
				.Visible = .T.
				.TooltipText = 'myToolbar Button #1'
			EndWith
		EndWith
	EndProc


	Procedure Enabled_Assign
		LParameters tl_Value

		With This
			If (.ControlCount > 0)
				.SetAll( 'Enabled', tl_Value )
			endif
			.Enabled = tl_Value
		EndWith
	EndProc
EndDefine
