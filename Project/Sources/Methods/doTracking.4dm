//%attributes = {"invisible":true}
#DECLARE($tracking : Boolean; $objectName : Text; $targetPict : Pointer; $background : Picture; $dragImage : Picture; $outPosX : Pointer; $outPosY : Pointer)

var $pos_x; $pos_y : Pointer
$pos_x:=$outPosX
$pos_y:=$outPosY

If ($tracking=True:C214)
	var $okcombine : Boolean
	var $scrollStep; $left; $top; $right; $bottom; $x; $y : Integer
	var $src_width; $src_height : Integer
	var $im_width; $im_height : Integer
	$scrollStep:=16
	$okcombine:=False:C215
	MOUSE POSITION:C468($x; $y; $button)
	OBJECT GET COORDINATES:C663(*; $objectName; $left; $top; $right; $bottom)
	OBJECT GET SCROLL POSITION:C1114(*; $objectName; $oy_before; $ox_before)
	If ($x<$left)
		If ($ox_before>0)
			OBJECT SET SCROLL POSITION:C906(*; $objectName; $oy_before; $ox_before-$scrollStep; *)
			OBJECT GET SCROLL POSITION:C1114(*; $objectName; $oy; $ox)
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
			OBJECT SET SCROLL POSITION:C906(*; $objectName; $oy_before; $ox_before+$scrollStep; *)
			OBJECT GET SCROLL POSITION:C1114(*; $objectName; $oy; $ox)
			If ($ox#$ox_before)
				
				PICTURE PROPERTIES:C457($background; $src_width; $src_height)
				PICTURE PROPERTIES:C457($dragImage; $im_width; $im_height)
				
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
			OBJECT SET SCROLL POSITION:C906(*; $objectName; $oy_before-8; $ox_before; *)
			OBJECT GET SCROLL POSITION:C1114(*; $objectName; $oy; $ox)
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
			OBJECT SET SCROLL POSITION:C906(*; $objectName; $oy_before+$scrollStep; $ox_before; *)
			OBJECT GET SCROLL POSITION:C1114(*; $objectName; $oy; $ox)
			If ($oy#$oy_before)
				
				PICTURE PROPERTIES:C457($background; $src_width; $src_height)
				PICTURE PROPERTIES:C457($dragImage; $im_width; $im_height)
				
				$pos_y->:=$pos_y->+($oy-$oy_before)
				If (($pos_y->+$im_height)>$src_height)
					$pos_y->:=$src_height-$im_height
				End if 
				$okcombine:=True:C214
			End if 
		End if 
	End if 
	If ($okcombine)
		COMBINE PICTURES:C987($targetPict->; $background; Superimposition:K61:10; $dragImage; $pos_x->; $pos_y->)
	End if 
End if 
