Lparameters tcReturn, tcTo, tcSubject, tcBody, tcCC, tcBCC, tcUserName, tcPassword, tlOpenEmail

#Define PRIMARY 1
#Define CARBON_COPY 2
#Define BLIND_CARBON_COPY 3

local loSession, loMessages, lnAttachments, loError as Exception , loErrorSend as Exception
local lcDefDrive, lcDefDir

lcDefDrive = Sys(5)
lcDefDir = Sys(2003)

tcReturn = ""

try
	loSession = Createobject( "MSMAPI.MAPISession" )
	if Vartype(tcUserName) = "C"
		loSession.UserName = tcUserName
	endif
	if Vartype(tcPassword) = "C"
		loSession.Password = tcPassword
	endif
	loSession.Signon()
	If (loSession.SessionID > 0)
		loMessages = Createobject( "MSMAPI.MAPIMessages" )
		loMessages.SessionID = loSession.SessionID
	Endif
	With loMessages
		.Compose()
		.RecipDisplayName = tcTo
		.RecipType = PRIMARY
		.ResolveName()
		if Vartype(tcCC) = "C"
			.RecipIndex = .RecipCount
			.RecipDisplayName = tcCC
			.RecipType = CARBON_COPY
			.ResolveName()
		endif
		if Vartype(tcBCC) = "C"
			.RecipIndex = .RecipCount
			.RecipDisplayName = tcBCC
			.RecipType = BLIND_CARBON_COPY
			.ResolveName()
		endif
		.MsgSubject = tcSubject
		.MsgNoteText = tcBody
		try 
			.Send(tlOpenEmail)
		catch to loErrorSend
			if tlOpenEmail && Did user cancel the operation from their email client?
				tcReturn = "User cancelled sending of email."
			else 
				throw loErrorSend
			endif
		endtry
	endwith
	loSession.Signoff()
catch to loError
	tcReturn = [Error: ] + Str(loError.ErrorNo) + Chr(13) + ;
		[LineNo: ] + Str(loError.Lineno) + Chr(13) + ;
		[Message: ] + loError.Message + Chr(13) + ;
		[Procedure: ] + loError.Procedure + Chr(13) + ;
		[Details: ] + loError.Details + Chr(13) + ;
		[StackLevel: ] + Str(loError.StackLevel) + Chr(13) + ;
		[LineContents: ] + loError.LineContents
finally
	Store .Null. To loSession, loMessages
	Release loSession, loMessages
endtry

set default to (lcDefDrive+lcDefDir)

#UnDef PRIMARY
#UnDef CARBON_COPY
#UnDef BLIND_CARBON_COPY