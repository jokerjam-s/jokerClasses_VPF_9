lparameters loForm

if loForm.DataSession>1
	*--- Main Setting ---*
	set deleted on
	set century on
	set date GERMAN
	set talk off
	set enginebehavior 70
	set hours to 24
	set seconds on
	set null off
	set nulldisplay to [<***>]

	*--- Net Setting  ---*
	set exclusive off
	set multilocks on
	set refresh to 7
endif
