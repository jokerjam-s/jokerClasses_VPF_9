#Include "D:\JokerClasses\For VFP_9\ctl32_\ctl32.h"
Set Procedure To Sys(16) Additive
Return

********************************************************************************
Define Class ctl32_menu As Custom

	Height = 0
	MenuId = 0

	Protected _MemberData
	_MemberData = '<VFPData>' + ;
		'<memberdata name="" type="property" display=""/>' + ;
		'</VFPData>'

Enddefine

********************************************************************************
Define Class ctl32_menuitem As Custom

	BarBreak = ""
	Break = ""
	CanRaiseEvents = ""
	Caption = ""
	Checked = FALSE
	Container = ""
	DefaultItem = FALSE
	DesignMode = ""
	Enabled = FALSE
	Events = ""
	MenuId = 0
	Index = ""
	IsParent = ""
	MdiList = ""
	MdiListItem = ""
	MenuId = 0
	MenuItems = ""
	MergeOrder = ""
	MergeType = ""
	Mnemonic = ""
	Name = "MenuItem"
	OwnerDrawn = ""
	RadioCheck = FALSE
	Shortcut = ""
	ShowShortcut = ""
	Site = ""
	Tag = ""
	Visible = ""
	ItemID = 0
	Picture = ""
	PictureObject = FALSE
	PictureId = 0
	DisabledPicture = ""
	DisabledPictureObject = FALSE
	DisabledPictureId = 0
	DownPicture = ""
	DownPictureObject = FALSE
	DownPictureId = 0
	SubMenuId = 0

	Protected _MemberData
	_MemberData = '<VFPData>' + ;
		'<memberdata name="" type="property" display=""/>' + ;
		'</VFPData>'

	Procedure SubMenuId_Assign
		Lparameters vNewVal
		*!* Destroy any previous submenu:
		If This.SubMenuId > 0
			apiDestroyMenu(This.SubMenuId)
		Endif

		This.SubMenuId = m.vNewVal

		If This.ItemID = 0
			Return
		Endif

		*!* update menu item submenu info:
		Local lcMenuItemInfo,loMenuItemInfo

		loMenuItemInfo = Createobject("ctlMenuItemInfo")

		loMenuItemInfo.fMask = MIIM_SUBMENU
		loMenuItemInfo.hSubMenu = This.SubMenuId
		lcMenuItemInfo = m.loMenuItemInfo.Value
		apiSetMenuItemInfo(This.MenuId, This.ItemID, MF_BYCOMMAND, @lcMenuItemInfo)
		loMenuItemInfo = .Null.
		Release m.loMenuItemInfo

	Endproc

	Procedure Picture_Assign
		Lparameters vNewVal

		Local hbmpItem

		hbmpItem = 0

		Do Case

			Case Vartype(m.vNewVal) = "N"
				This.Picture = ""
				This.PictureId = m.vNewVal
				hbmpItem = This.PictureId

			Case Vartype(m.vNewVal) = "C"
				This.Picture = m.vNewVal
				If File(m.vNewVal)
					This.PictureObject = LoadPicture(m.vNewVal)
					This.PictureId = This.PictureObject.Handle
				Else
					This.PictureId = 0
				Endif
				If ctlGetOsVersion() < NTDDI_VISTA
					hbmpItem = HBMMENU_CALLBACK
				Endif
			Otherwise
				This.Picture = ""
				This.PictureId = 0
				If ctlGetOsVersion() < NTDDI_VISTA
					hbmpItem = HBMMENU_CALLBACK
				Endif
		Endcase

		If This.ItemID = 0
			Return
		Endif

		Local m.lcMenuItemInfo As String
		Local m.loMenuItemInfo As ctlMenuItemInfo

		loMenuItemInfo = Createobject("ctlMenuItemInfo")
		loMenuItemInfo.fMask = MIIM_BITMAP
		loMenuItemInfo.hbmpItem = m.hbmpItem
		lcMenuItemInfo = m.loMenuItemInfo.Value
		apiSetMenuItemInfo(This.MenuId, This.ItemID, MF_BYCOMMAND, @m.lcMenuItemInfo)
		loMenuItemInfo = .Null.

	Endproc

	Procedure Caption_Assign
		Lparameters vNewVal
		This.Caption = m.vNewVal
	Endproc

	Procedure Caption_Access
		Return This.Caption
	Endproc

	Procedure DefaultItem_Assign
		Lparameters vNewVal

		If Vartype(m.vNewVal) = "N"
			If m.vNewVal = 0
				vNewVal = FALSE
			Else
				vNewVal = TRUE
			Endif
		Endif

		This.DefaultItem = m.vNewVal

		If This.ItemID = 0
			Return
		Endif

		If This.DefaultItem = TRUE
			apiSetMenuDefaultItem(This.MenuId, This.ItemID, MF_BYCOMMAND)
		Else
			apiSetMenuDefaultItem(This.MenuId, -1, MF_BYPOSITION)
		Endif

	Endproc

	Procedure Enabled_Assign
		Lparameters vNewVal

		If Vartype(m.vNewVal) = "N"
			If m.vNewVal = 0
				vNewVal = FALSE
			Else
				vNewVal = TRUE
			Endif
		Endif

		This.Enabled = m.vNewVal

		If This.ItemID = 0
			Return
		Endif
		If This.Enabled = TRUE
			apiEnableMenuItem(This.MenuId, This.ItemID, Bitor(MF_BYCOMMAND, MF_ENABLED))
		Else
			apiEnableMenuItem(This.MenuId, This.ItemID, Bitor(MF_BYCOMMAND, MF_GRAYED))
		Endif

	Endproc

	Procedure Checked_Assign
		Lparameters vNewVal

		If Vartype(m.vNewVal) = "N"
			If m.vNewVal = 0
				vNewVal = FALSE
			Else
				vNewVal = TRUE
			Endif
		Endif

		This.Checked = m.vNewVal

		If This.ItemID = 0
			Return
		Endif

		If This.Checked = TRUE
			apiCheckMenuItem(This.MenuId, This.ItemID , Bitor(MF_BYCOMMAND, MF_CHECKED))
		Else
			apiCheckMenuItem(This.MenuId, This.ItemID , Bitor(MF_BYCOMMAND, MF_UNCHECKED))
		Endif

	Endproc

	Procedure RadioCheck_Assign
		Lparameters vNewVal

		If Vartype(m.vNewVal) = "N"
			If m.vNewVal = 0
				vNewVal = FALSE
			Else
				vNewVal = TRUE
			Endif
		Endif

		This.RadioCheck = m.vNewVal

		If This.ItemID = 0
			Return
		Endif

		*!* Get current fType, we set fMask to MIIM_FTYPE
		Local lcMenuItemInfo, loMenuItemInfo, lfType

		loMenuItemInfo = Createobject("ctlMenuItemInfo")

		*!* Build MenuItemInfo structure:
		loMenuItemInfo.fMask = MIIM_FTYPE
		lcMenuItemInfo = m.loMenuItemInfo.Value

		If apiGetMenuItemInfo(This.MenuId, This.ItemID , MF_BYCOMMAND, @m.lcMenuItemInfo) <> 0

			loMenuItemInfo.Value = m.lcMenuItemInfo

			If This.RadioCheck = TRUE
				loMenuItemInfo.fType = Bitor(MFT_RADIOCHECK, m.loMenuItemInfo.fType)
			Else
				loMenuItemInfo.fType = Bitxor(MFT_RADIOCHECK, Bitor(MFT_RADIOCHECK, m.loMenuItemInfo.fType))
			Endif

			lcMenuItemInfo = m.loMenuItemInfo.Value
			apiSetMenuItemInfo(This.MenuId, This.ItemID , MF_BYCOMMAND, m.lcMenuItemInfo)
			loMenuItemInfo = .Null.

		Endif

	Endproc

Enddefine

********************************************************************************
Define Class ctl32_statusbar_panel As Custom

	Height = 16
	Width = 120
	*-- Specifies the icon displayed for a Form at run time when the Form is minimized.
	ctlicon = ""
	ctlcaption = ""
	ctlformat = 0
	*-- Specifies the text that appears as a ToolTip for a control.
	ctltooltiptext = ""
	ctlindex = 0
	*-- Right x value position for Panel
	_right = -1
	_oicon = ""
	*-- Specifies if an object is visible or hidden.
	ctlvisible = .T.
	*-- Specifies if a control is automatically resized to fit its contents.
	ctlautosize = .T.
	_width = 0
	*-- Specifies the alignment of text associated with a control.
	ctlalignment = 0
	ctlwidth = ""
	ctlname = ""
	Name = "ctl32_statusbar_panel"

	Procedure ctlIcon_assign
		Lparameters vNewVal

		Local lnHandle

		This.ctlicon = m.vNewVal
		This._oicon = .Null.

		*!* 2006-07-17 Now takes icon handle too //Anton
		Do Case
			Case Vartype(This.ctlicon) = T_NUMERIC
				lnHandle = m.vNewVal
			Case Vartype(This.ctlicon) = T_CHARACTER  And File(This.ctlicon)
				This._oicon = LoadPicture(This.ctlicon)
				lnHandle = This._oicon.Handle
			Otherwise
				lnHandle = 0
		Endcase

		apiSendMessage(This.Parent._ControlHWnd, SB_SETICON, This.ctlindex, m.lnHandle)

		If This.Parent._ControlHWnd <> 0 And This.ctlindex <> 0 And This.Parent._Creating = FALSE
			This.Parent.ctlResizePanels()
		Endif
	Endproc

	Procedure ctlcaption_assign
		Lparameters vNewVal
		*!* 2006-06-27 Added Transform()
		This.ctlcaption = Alltrim(Transform(m.vNewVal))

		Local lcPadLeft, lcPadRight, lcCaption

		lcCaption =  m.vNewVal

		*!* we add spaces so text does not fit and tooltips show
		Do Case
			Case This.ctlalignment = 1	And This.ctlautosize = FALSE		&& Right
				lcPadLeft  = TABCHAR  + TABCHAR
				lcPadRight = Space(1)

			Case This.ctlalignment = 2	And This.ctlautosize = FALSE		&& Center
				lcPadLeft  = TABCHAR
				lcPadRight = Space(0)

			Otherwise										&& Left
				lcPadLeft  = Space(0)
				lcPadRight = Space(10)

				*!* Add one space to left if this is PanelMessage and
				*!* ctlAlignment is left, so it separates the text a little from border
				If This.ctlindex = 0
					lcPadLeft = m.lcPadLeft + Space(1)
				Endif
		Endcase

		*!* If changing indicator panels Caption, let tmrUpdater update captions:
		If This.Name =  "PanelOvr"
			This.Parent._OldOVR  = Not Insmode()
		Endif

		If This.Name =  "PanelNum"
			This.Parent._OldNUM  = Not Numlock()
		Endif

		If This.Name =  "PanelCaps" 
			This.Parent._OldCAPS = Not Capslock()
		Endif

		*!* If setting Caption for Message Panel
		If This.ctlindex = 0
			This.Parent._OldMessage = Sys(2015)
		Endif

		lcCaption = m.lcPadLeft + m.lcCaption + m.lcPadRight + NULA

		*!* Do not set Panel Caption for ProgressBar:
		If This.ctlindex <> 1
			apiSendMessage(This.Parent._ControlHWnd, SB_SETTEXTA, This.ctlindex , m.lcCaption)
		Endif

		If This.Parent._ControlHWnd <> 0 And This.ctlindex <> 0 And This.Parent._Creating = FALSE
			This.Parent.ctlResizePanels()
		Endif
	Endproc

	Procedure ctlformat_assign
		*!* Property only valid for PanelDate

		Lparameters vNewVal

		This.ctlformat = m.vNewVal

		If This.Name = "PanelDate"
			If This.ctlformat > 0
				This.ctlcaption = ctlGetDateFormat(This.ctlformat)
			Else
				This.ctlcaption = ""
			Endif
		Endif
	Endproc

	Procedure ctltooltiptext_assign
		Lparameters vNewVal

		This.ctltooltiptext = m.vNewVal

		If Len(m.vNewVal) > 0
			vNewVal = Space(1) + This.ctltooltiptext + Space(1)
		Endif

		apiSendMessage(This.Parent._ControlHWnd,SB_SETTIPTEXTA, This.ctlindex, m.vNewVal)
	Endproc

	Procedure ctlvisible_assign
		Lparameters vNewVal

		If Vartype(m.vNewVal) = "N"
			If m.vNewVal = 0
				vNewVal = FALSE
			Else
				vNewVal = TRUE
			Endif
		Endif

		If Vartype(m.vNewVal) <> "L"
			Messagebox("Parameter must be Logical: " + Program(), 16)
			Return
		Endif

		This.ctlvisible = m.vNewVal

		If This.Parent._ControlHWnd <> 0 And This.Parent._Creating = FALSE
			This.Parent.ctlResizePanels()
		Endif
	Endproc

	*-- Called when creating the statusbar to update all data of Panels
	Procedure _updateall
		This.ctlcaption     = This.ctlcaption
		This.ctlformat      = This.ctlformat
		This.ctlicon        = This.ctlicon
		This.ctltooltiptext = This.ctltooltiptext
		This.ctlvisible     = This.ctlvisible
	Endproc

	Procedure ctlautosize_assign
		Lparameters vNewVal

		If Vartype(m.vNewVal) = "N"
			If m.vNewVal = 0
				vNewVal = FALSE
			Else
				vNewVal = TRUE
			Endif
		Endif

		*!* Index 0 is first Panel, PanelMessage, that should always have ctlAutosize = FALSE
		If This.ctlindex = 0
			This.ctlautosize = FALSE
		Else
			This.ctlautosize = m.vNewVal
			*!* Reset caption to get rid of center/right codes if ctlAutosize is TRUE
			This.ctlcaption = This.ctlcaption
		Endif
	Endproc

	Procedure ctlalignment_assign
		Lparameters vNewVal

		This.ctlalignment = m.vNewVal

		*!* If message panel, force update
		If This.ctlindex = 0
			This.Parent._OldMessage = Sys(2015)
		Endif

		This.ctlcaption = This.ctlcaption
	Endproc

	Procedure ctlname_access
		Return This.Name
	Endproc

	Procedure ctlname_assign
		Lparameters vNewVal
		This.Name = m.vNewVal
	Endproc

	Procedure ctlwidth_access
		Return This.Width
	Endproc

	Procedure ctlwidth_assign
		Lparameters vNewVal
		This.Width = m.vNewVal
	Endproc

	Procedure Destroy
		This._oicon = .Null.
	Endproc

Enddefine

********************************************************************************
Define Class ctl32_statusbar_toolbar As Toolbar

	Caption = "ctl32_statusbar_toolbar"
	Height = 16
	Left = 0
	Top = 51
	Visible = .F.
	Width = 32028
	ShowWindow = 1
	Name = "ctl32_statusbar_toolbar"

	Add Object ctlHeightShape As Shape With ;
		Top = 3, ;
		Left = 5, ;
		Height = 13, ;
		Width = 16384, ;
		Name = "ctlHeightShape"

	Procedure Init
		*!* Hide the toolbar thru API so it is still there but invisible
		With This
			.Dock(TOOL_BOTTOM, 0, 0)
			.Visible = TRUE
			apiShowWindow(.HWnd, SW_HIDE)
		Endwith
	Endproc

	Procedure ctlHeightShape.Click
		This.Parent.Dock(3, 0, 0)
	Endproc

	Procedure ctlHeightShape.Init

		If ctlGetOsVersion() >= NTDDI_VISTA		&& Vista
			This.Height = 13
		Else
			This.Height = 17
		Endif
	Endproc

Enddefine

********************************************************************************
Define Class ctl32_statusbar_timer As Timer

	Height = 23
	Width = 23
	Interval = 100
	_Interval = 0
	_IntervalTrace = 10000
	Name = "ctl32_statusbar_timer"

	Procedure Timer
		*!* 20070701 Added trace aware timer, suggested by ajh

		If Wvisible("trace") Or  ;
				Wvisible("debugger") Or ;
				Wvisible("call") Or ;
				Wvisible("watch") Or ;
				Wvisible("locals")

			If This.Interval <> This._IntervalTrace
				This._Interval = This.Interval
				This.Interval = This._IntervalTrace
			Endif

		Else

			If This.Interval = This._IntervalTrace
				This.Interval = This._Interval
			Endif
			This._Interval = This.Interval

		Endif

		This.Parent.ctlUpdatePanels()
	Endproc
Enddefine
