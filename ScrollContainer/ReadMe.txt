==========================================================
   ScrollContainer class for Microsoft Visual FoxPro
==========================================================
(c) Copyright ARG-Software Design Lab. 1998-2005

Author:
    Alex Grigorjev
    AlexG@arg.kirov.ru
----------------------------------------------------------

DESCRIPTION
===========

  The ScrollContainer is a container that allows you to scroll its contents using horizontal and/or vertical scroll bar(s).


PROPERTIES, METHODS AND EVENTS
==============================

Properties
----------

AutoScroll
~~~~~~~~~~
  Indicates whether scroll bars appear automatically on the scrolling container if it is not large enough to display all of its contents.

  If AutoScroll is True, the scroll bars appear automatically when necessary. For example, if the user resizes the scrolling container so that some of its controls are partially obscured, scroll bars appear.

  If AutoScroll is False, scroll bars don't appear automatically. In this case, use the SetScrollRange method to make scroll bars appear.

ClientArea
~~~~~~~~~~
  Contains reference to the ClientArea container. That allows using the following in the code:
"ThisForm.SBC.ClientArea.Control1.SomeProperty"
instead of the
"ThisForm.SBC.ViewFrame.ClientArea.Control1.SomeProperty".

ContinuousScroll
~~~~~~~~~~~~~~~~
  Specifies if scrolling within a control is continuous, or if scrolling occurs only when a scroll box is released.

HScrollSmallChange
~~~~~~~~~~~~~~~~~~
  Specifies the increment a container scrolls in the horizontal direction when you click on a horizontal scroll arrow.

Margin
~~~~~~
  Specifies the margin between the client area and the inside edges of the scrolling container.

ScrollBars
~~~~~~~~~~
  Specifies the type of scroll bars a container has.
  The settings are:
    0 - None, 1 - Horizontal, 2 - Vertical, 3 - Both vertical and horizontal.

VScrollSmallChange
~~~~~~~~~~~~~~~~~~
  Specifies the increment a container scrolls vertically when you click on a scroll arrow.

WheelScrollLines
~~~~~~~~~~~~~~~~

  The number of lines to scroll when the mouse wheel is rotated. If this number is less than 0 control will use system default value (3 lines). If this number is equal to 0 control will not support mouse wheel.


Methods
-------

CalcAutoRange
~~~~~~~~~~~~~
  Calculates the size of the client area depending on the size and position of controls and updates scroll bars.


EnsureIsVisible( toControl)
~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Scrolls specified control into the visible area of the scrolling container.

  Use EnsureIsVisible Method to ensure that a specified control is in the visible area of the scrolling container. toControl specifies the object to scroll into view.


ScrollBy( tnDeltaX, tnDeltaY)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

  Scrolls the contents of the scrolling container.

  Call ScrollBy to scroll the contents within the scrolling container.

  The tnDeltaX parameter is the change in pixels along the X axis. A positive tnDeltaX value scrolls the contents to the right; a negative value scrolls the contents to the left. The tnDeltaY parameter is the change in pixels along the Y axis. A positive tnDeltaY value scrolls the contents down; a negative value scrolls the contents up.

SetScrollRange( tnNewRange, tnBar)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Sets the scrolling range of specified scroll bar (tnBar parameter: 1 - horizontal, 2 - vertical)

UpdateScrollBars
~~~~~~~~~~~~~~~~
  Updates scroll bars.


Events
------

Scrolled( tnDirection)
~~~~~~~~~~~~~~~~~~~~~~
  See VFP documentation.


USAGE
=====
  Add the ScrollContainer class onto your form and then place controls that need to be scrolled into the ClientArea container. Make sure you added controls into the ClientArea container and not into the ViewFrame.

  Set appropriate values for common properties of ScrollContainer (AutoScroll, ScrollBars, etc.).

  Run your form and enjoy!


  Hope this class will be useful for you.
==========================================================

Alex Grigorjev (AlexG@arg.kirov.ru)
