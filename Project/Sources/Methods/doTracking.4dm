//%attributes = {}
C_BOOLEAN:C305($1)  // tracking
C_TEXT:C284($2)  // object name
C_POINTER:C301($3)  // target pict
C_PICTURE:C286($4)  // background
C_PICTURE:C286($5)  // drag image
C_POINTER:C301($6; $pos_x)  // out pos x
C_POINTER:C301($7; $pos_y)  // out pos y

$pos_x:=$6
$pos_y:=$7

If ($1=True:C214)
	C_BOOLEAN:C305($okcombine)
	C_LONGINT:C283($scrollStep; $left; $top; $right; $bottom; $x; $y)
	C_LONGINT:C283($src_width; $src_height)
	C_LONGINT:C283($im_width; $im_height)
	$scrollStep:=16
	$okcombine:=False:C215
	MOUSE POSITION:C468($x; $y; $button)
	OBJECT GET COORDINATES:C663(*; $2; $left; $top; $right; $bottom)
	OBJECT GET SCROLL POSITION:C1114(*; $2; $oy_before; $ox_before)
	If ($x<$left)
		If ($ox_before>0)
			OBJECT SET SCROLL POSITION:C906(*; $2; $oy_before; $ox_before-$scrollStep; *)
			OBJECT GET SCROLL POSITION:C1114(*; $2; $oy; $ox)
			If ($ox_before#$ox)
				$pos_x->:=$pos_x->-($ox_before-$ox)
				If ($pos_x-><0)
					$pos_x->:=0
				End if 
				$okcombine:=True:C214
			End if 
		End if 
	Else 
		If ($x>($right-16))
			OBJECT SET SCROLL POSITION:C906(*; $2; $oy_before; $ox_before+$scrollStep; *)
			OBJECT GET SCROLL POSITION:C1114(*; $2; $oy; $ox)
			If ($ox#$ox_before)
				
				PICTURE PROPERTIES:C457($4; $src_width; $src_height)
				PICTURE PROPERTIES:C457($5; $im_width; $im_height)
				
				$pos_x->:=$pos_x->+($ox-$ox_before)
				If (($pos_x->+$im_width)>$src_width)
					$pos_x->:=$src_width-$im_width
				End if 
				$okcombine:=True:C214
			End if 
		End if 
	End if 
	If ($y<$top)
		If ($oy_before>0)
			OBJECT SET SCROLL POSITION:C906(*; $2; $oy_before-8; $ox_before; *)
			OBJECT GET SCROLL POSITION:C1114(*; $2; $oy; $ox)
			If ($oy#$oy_before)
				$pos_y->:=$pos_y->-($oy_before-$oy)
				If ($pos_y-><0)
					$pos_y->:=0
				End if 
				$okcombine:=True:C214
			End if 
		End if 
	Else 
		If ($y>($bottom-16))
			OBJECT SET SCROLL POSITION:C906(*; $2; $oy_before+$scrollStep; $ox_before; *)
			OBJECT GET SCROLL POSITION:C1114(*; $2; $oy; $ox)
			If ($oy#$oy_before)
				
				PICTURE PROPERTIES:C457($4; $src_width; $src_height)
				PICTURE PROPERTIES:C457($5; $im_width; $im_height)
				
				$pos_y->:=$pos_y->+($oy-$oy_before)
				If (($pos_y->+$im_height)>$src_height)
					$pos_y->:=$src_height-$im_height
				End if 
				$okcombine:=True:C214
			End if 
		End if 
	End if 
	If ($okcombine)
		COMBINE PICTURES:C987($3->; $4; Superimposition:K61:10; $5; $pos_x->; $pos_y->)
	End if 
End if 
