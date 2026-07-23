Case of 
	: (FORM Event.code=On Load)
		
		If (Form.quit)
			OBJECT SET TITLE(*; "BtnDemo"; Localized string("BtnClose"))
			OBJECT SET VISIBLE(*; "TxtSorry@"; True)
			OBJECT SET VISIBLE(*; "TxtInfo@"; False)
		End if 
		
	: (FORM Event.code=On Unload)
		
End case 
