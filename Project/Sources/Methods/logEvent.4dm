//%attributes = {}
C_LONGINT:C283($1; $2)

C_TEXT:C284($ev)
C_BOOLEAN:C305($appendCoords)
$appendCoords:=False:C215

Case of 
	: $1=On Clicked:K2:4
		$ev:="On Clicked"
		$appendCoords:=True:C214
	: $1=On Double Clicked:K2:5
		$ev:="On Clicked"
		$appendCoords:=True:C214
	: $1=On Mouse Move:K2:35
		$ev:="On Mouse Move"
		$appendCoords:=True:C214
	: $1=On Mouse Enter:K2:33
		$ev:="On Mouse Enter"
		$appendCoords:=True:C214
	: $1=On Mouse Leave:K2:34
		$ev:="On Mouse Leave"
		$appendCoords:=True:C214
	: $1=On Mouse Up:K2:58
		$ev:="On Mouse Up"
		$appendCoords:=True:C214
	: $1=On Activate:K2:9
		$ev:="On Activate"
	: $1=On Deactivate:K2:10
		$ev:="On Deactivate"
	: $1=On Timer:K2:25
		$ev:="On Timer"
End case 

If ($ev#"")
	
	If ($2=0)
		LISTBOX INSERT ROWS:C913(*; "List Box"; 1)
		If ($ev="On Mouse Up")
			LISTBOX SET ROW COLOR:C1270(*; "List Box"; 1; 0x00FF00FF)
		End if 
		Move_Col1{1}:=$ev
		
		If ($appendCoords=True:C214)
			Move_Col2{1}:="x="+String:C10(mouseX)+"   y="+String:C10(mouseY)
		Else 
			Move_Col2{1}:=""
			
		End if 
		
	Else 
		LISTBOX INSERT ROWS:C913(*; "List Box1"; 1)
		If ($ev="On Mouse Up")
			LISTBOX SET ROW COLOR:C1270(*; "List Box1"; 1; 0x00FF00FF)
		End if 
		SVG_Col1{1}:=$ev
		
		If ($appendCoords=True:C214)
			SVG_Col2{1}:="x="+String:C10(mouseX)+"   y="+String:C10(mouseY)
		Else 
			SVG_Col2{1}:=""
		End if 
		
	End if 
	
End if 