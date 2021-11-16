******************************************************
OwnerDrawn Menu Class version 1.62.053

Author by : Herman Tan
Email     : herman-tan@idola.net.id
Copyright : August 2005 - 2008
******************************************************


You can check for the latest update at:
http://www.bdurham.com/vfprocks/hermantan/downloads.htm

The class was made & tested using VFP9-SP1 under WinXP-SP2

This class is a freeware. You may use it anyway you want. However, please do consider to mail me (plain text only) if you find any bugs. Please send me a notification if you change or update the class, or added new feature based on this class. Also, please do consider to share it with VFP community.


Thanks to:
- Malcolm Greene for his great suggestions to make the menu looks more like office 2003 (such as: subpopup alignment, office 2003 highlight color, etc..) 

- Luis Navas Dangel for offering me some help.

- Handi Rusli for his MnxConverter form. Most of the code in OD_GenMenu form were created by him. I only changed the code to generate the PRG. His code to generate the MNX are in Form.Generated() method and it remains intact.

- Victor Chigne and few others (my apologies for forgetting your names) for giving me the codes to make MNX converter.

- Walter Meester for his idea to support SKIP FOR clause

- Jing Chun Niu (Xinjie) for contributing OD_GenMenu Chinese Version, merging Chinese Version into English version and also added some enhancement for OD GenMenu.


Notes:
- Report Preview when using old engine (SET REPORTBEHAVIOR 80) will destroy the menu!
- Some properties must be set before Menu/Popup creation, while some can be change on the fly.
- For MODAL FORM / PRINT PREVIEW to work properly, SET SYSMENU OFF is require (in Top-Level Menu Form or Main Menu). The drawback is, the MDI form doesn't look like MDI form when maximized.



Recommendation:
- DO NOT USE THIS CLASS under Win98-SE or earlier
- DO NOT USE THIS CLASS when debugging an application


Disclaimer:
- THE USE OF THIS CLASS IS FULLY AT YOUR OWN RISK !!!
 
******************************************************

The ZIP file contain the following files:
OD Menu class:
- OwnerDrawn_Menu.vcx
- OwnerDrawn_Menu.vct

Example program:
- MainMenu.prg

Example form:
1. Frm_PopupMenu.scx  (for top-level menu sample, change ShowWindow = 2)
   Frm_PopupMenu.sct
2. Frm_Modeless.scx  (sample blank modeless form, called from mainmenu)
   Frm_Modeless.sct
3. OD_GenMenu.scx  ( stand alone OD Menu Generator )
   OD_GenMenu.sct

Header constant needed by the class & the samples:
- API_Menu.h
  
- Readme_ODMenu.txt  (this file)


******************************************************

Revision (ver 1.62.053 - September 3, 2008)
OD Menu Class Bug Fixed:
- If the OS is set to SCROLL effect, SubPopup Activation doesn't work properly when activated by Hot-Key (bug submitted by: Vishal Anand)


Revision (ver 1.62.052 - August 22, 2008)
OD Menu Class Bug Fixed:
- If the OS is set to SCROLL effect, SubPopup Activation doesn't work properly when activated by keyboard (bug submitted by: Vishal Anand)


Revision (ver 1.62.051 - July 14, 2008)
OD_Menu class added:
1. Windows System Menu changed to OwnerDrawn (consistent with the MainMenu)
2. Properties:
   - lXP_Or_Higher: Running on WinXP or Higher
   - lGlassy: "Glassy Looks" gradient style for menu-item/menu-pad hiliter (default = .F.)
   - lHiliteUseFontBold: use fontbold for menu-item text when highlighted (default = .F.)
   - nTextHiliteColor: menu-item text hilite color

OD_Menu class Bug Fixed:
- Top-Level Form Menu: If Top-Level form has a child form (MDI form), the class will cause an error for the apps if the child form is maximize (bug submitted by: JingChun Niu)
- Top-Level Form Menu: If the child form maximized, MenuPad highlight rectangle is incorrect
- Top-Level Form Menu: When the MDI form maximized, the MenuPad highlighter highlight all menu including the MDI-menu that is not belong to the class


OD_GenMenu Added (by JingChun Niu):
- Capable to build Top-Level menu form. However, it still generated as a PRG and you still have to put into the form yourself.
- Chinese version is now merged into the English version. It will automatically selected whether you are using Chinese version or other version (English version by default)

OD_GenMenu Fixed:
- Long command (longer than 132 char) in MNX is cut off in PRG (bug submitted by Robin Clapworthy)
- Long command only supported up to 255 chars max.

******************************************************

Revision (ver 1.50.019 - December 03, 2007)
Fixed:
- When move between MenuPad, a small dots remains in the edge of MenuPad (bug submitted by Javier Parada)
- Item Text Shadow is not using API from Common Control V6, instead using usual DrawText() from GDI (works on any Windows version)

******************************************************

Revision (ver 1.50.018 - October 30, 2007)
OD GenMenu Added:
- Supported General setup menu in MNX

OD GenMenu Fixed:
- Using single quote (') for menu name generate an error in PRG. (bug submitted by Javid Ansari)
- Popup can have the same Index number for large main menu.
- A long command (longer than 80 char) in MNX is cut off in PRG.

******************************************************

Revision (ver 1.50.017 - October 04, 2007)
- Fixed: Separator as submenu (in MNX) displaying a small dots (bug submitted by Minh Tran)

******************************************************

Revision (ver 1.50.016 - September 25, 2007)
Fixed:
- OD Menu Generator error out when an MNX file is using small char (bug submitted by Mike Sue Ping)

******************************************************

Revision (ver 1.50.015 - September 24, 2007)
Added:
- GDI+ API function to support more images format
- Support Alpha Images (PNG)
- Gradient Menubar color (BETA version)
- Item bar Hiliter color are now consistent with the left side color
- ItemText enhancement (shadowed) when Hilited

Fixed:
- Few minor bugs

Finally:
- OD Menu Generator. Contributes by: Handi Rusli, Victor Chigne and others. All credits goes to them :)

******************************************************

Revision (ver 1.33.042 - July 25, 2007)
Changes:
- Another bug fixed (much more stable menu operation)
- Selected Item Highlight Color is now based on the left color

******************************************************

Revision (ver 1.33.031 - April 28, 2007)
Added:
- Auto enabled/disabled popup item (similar to SKIP FOR command ...)

******************************************************

Revision (ver 1.32.080 - April 16, 2007)
Changes:
- Few bug fixed
- Memory allocated in heap memory instead of using Local memory
- Using API to enable/disable MainMenu/MenuPad (more stable menu operation, I hope)
- Selected menu item is now posting a message to user define message (WM_DOCOMMAND)

Added:
- Enable / Disable Menu Pad
- Hyperlink on menu
- Create Custom Font method
- Popup in Toolbar (MainMenu sample)

******************************************************

Revision (ver 1.30.013 - Nov 15, 2006)
Bug fixed:
- Shortcut menu in top-level form causing top-level menu not responding

Changes:
- Form PopupMenu also shows how to use menu in top-level form.
  Change Frm_PopupMenu.ShowWindow = 2

******************************************************

Revision (ver 1.29.008 - Oct 25, 2006):
- mainmenu hanging / not responding after calling modal form (bug submitted by Handi Rusli)

Changes:
- MainMenu is now defined (work with modal form) instead of using _MSYSMENU
- Main menu can be use in top-level form
- Disabled bitmap icon blended to the color on the left side

Added:
- Sample MainMenu program (example of menu and form)
- Checking Item State (reduce flicker)
- Enabled / Disabled Mainmenu

******************************************************

Revision (ver 1.27.048 - Sep 25, 2006):
- Few bugs fixed
- Added, menu character keyboard selection
- Added, aligned subpopup position with the item in popup parent
- Added, darker bitmap icon on disabled item
- Added, highlighted disabled item when the item selected by keyboard arrow
- Better support for all WinXP Style (including Windows Classic)

******************************************************

New feature (ver 1.23.006 - Sep 17, 2006):
- Added, Menupad highlighted on MouseMove
- Added, Office2003 Theme - Menupad & Item Highlighted
- Added, Highlighted style (i.e.: rounded)

******************************************************

New feature (ver 1.21.002 - Sep 4, 2006):
- Added, enabled/disabled popup item
- Added, set Menubar color
- Added, set Menupad gradient color
- Better selection item highlighted

******************************************************

New feature (ver 1.11.023 - May 21, 2006):
- Added, subpopup
- Added, floating menu style
- Added, display popup position based on object
