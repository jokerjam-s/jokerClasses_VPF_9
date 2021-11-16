#IFNDEF	__VFP_SBCONTAINER_H_INCLUDED
#DEFINE	__VFP_SBCONTAINER_H_INCLUDED

#DEFINE	SBC_HORS			1
#DEFINE	SBC_VERT			2


#DEFINE	SB_LINEUP			0
#DEFINE	SB_LINELEFT			0
#DEFINE	SB_LINEDOWN			1
#DEFINE	SB_LINERIGHT		1
#DEFINE	SB_PAGEUP			2
#DEFINE	SB_PAGELEFT			2
#DEFINE	SB_PAGEDOWN			3
#DEFINE	SB_PAGERIGHT		3
#DEFINE	SB_THUMBPOSITION	4
#DEFINE	SB_THUMBTRACK		5
#DEFINE	SB_TOP				6
#DEFINE	SB_LEFT				6
#DEFINE	SB_BOTTOM			7
#DEFINE	SB_RIGHT			7

#define COLOR_SCROLLBAR			0
#define COLOR_BACKGROUND		1
#define COLOR_ACTIVECAPTION		2
#define COLOR_INACTIVECAPTION		3
#define COLOR_MENU			4
#define COLOR_WINDOW			5
#define COLOR_WINDOWFRAME		6
#define COLOR_MENUTEXT			7
#define COLOR_WINDOWTEXT		8
#define COLOR_CAPTIONTEXT		9
#define COLOR_ACTIVEBORDER		10
#define COLOR_INACTIVEBORDER		11
#define COLOR_APPWORKSPACE		12
#define COLOR_HIGHLIGHT			13
#define COLOR_HIGHLIGHTTEXT		14
#define COLOR_BTNFACE			15
#define COLOR_BTNSHADOW			16
#define COLOR_GRAYTEXT			17
#define COLOR_BTNTEXT			18
#define COLOR_INACTIVECAPTIONTEXT	19
#define COLOR_BTNHIGHLIGHT		20

*-- #if(WINVER >= 0x0400)
#define COLOR_3DDKSHADOW        21
#define COLOR_3DLIGHT           22
#define COLOR_INFOTEXT          23
#define COLOR_INFOBK            24
*-- #endif /* WINVER >= 0x0400 */

*-- #if(WINVER >= 0x0500)
#define COLOR_HOTLIGHT                  26
#define COLOR_GRADIENTACTIVECAPTION     27
#define COLOR_GRADIENTINACTIVECAPTION   28
*-- #endif /* WINVER >= 0x0500 */

*-- #if(WINVER >= 0x0400)
#define COLOR_DESKTOP           COLOR_BACKGROUND
#define COLOR_3DFACE            COLOR_BTNFACE
#define COLOR_3DSHADOW          COLOR_BTNSHADOW
#define COLOR_3DHIGHLIGHT       COLOR_BTNHIGHLIGHT
#define COLOR_3DHILIGHT         COLOR_BTNHIGHLIGHT
#define COLOR_BTNHILIGHT        COLOR_BTNHIGHLIGHT
*-- #endif /* WINVER >= 0x0400 */


#ENDIF		&&	__VFP_SBCONTAINER_H_INCLUDED
