//%attributes = {"invisible":true}
#DECLARE($eventCode : Integer; $col : Integer)

var $ev : Text
var $appendCoords : Boolean
$appendCoords:=False:C215

Case of 
	: $eventCode=On Clicked:K2:4
		$ev:="On Clicked"
		$appendCoords:=True:C214
	: $eventCode=On Double Clicked:K2:5
		$ev:="On Clicked"
		$appendCoords:=True:C214
	: $eventCode=On Mouse Move:K2:35
		$ev:="On Mouse Move"
		$appendCoords:=True:C214
	: $eventCode=On Mouse Enter:K2:33
		$ev:="On Mouse Enter"
		$appendCoords:=True:C214
	: $eventCode=On Mouse Leave:K2:34
		$ev:="On Mouse Leave"
		$appendCoords:=True:C214
	: $eventCode=On Mouse Up:K2:58
		$ev:="On Mouse Up"
		$appendCoords:=True:C214
	: $eventCode=On Activate:K2:9
		$ev:="On Activate"
	: $eventCode=On Deactivate:K2:10
		$ev:="On Deactivate"
	: $eventCode=On Timer:K2:25
		$ev:="On Timer"
End case 

If ($ev#"")
	
	If ($col=0)
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