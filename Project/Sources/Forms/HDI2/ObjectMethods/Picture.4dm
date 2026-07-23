

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If ((mouseX#-1) & (mouseY#-1))
			If ((mouseX>pos_x) & (mouseX<(pos_x+drag_src_width)) & (mouseY>pos_y) & (mouseY<(pos_Y+drag_src_height)))
				drag_org_X:=mouseX-pos_x
				drag_org_Y:=mouseY-pos_y
				
				tracking:=True:C214
				SET CURSOR:C469(9014)
			End if 
		End if 
		
	: (Form event code:C388=On Mouse Up:K2:58)
		If (tracking=True:C214)
			
			SET TIMER:C645(0)
			
			If (timer=True:C214)
				pos_x:=drag_pos_x
				pos_y:=drag_pos_y
			Else 
				pos_x:=(mouseX-drag_org_X)
				pos_y:=(mouseY-drag_org_Y)
			End if 
			
			COMBINE PICTURES:C987(vPicture; src; Superimposition:K61:10; drag_src; pos_x; pos_y)
			SET CURSOR:C469(9013)
			tracking:=False:C215
			
		End if 
		
		
	: (Form event code:C388=On Mouse Move:K2:35)
		
		If (tracking=True:C214)
			
			If (Is waiting mouse up:C1422=False:C215)
				
				tracking:=False:C215
				If (timer=True:C214)
					SET TIMER:C645(0)
				End if 
				COMBINE PICTURES:C987(vPicture; src; Superimposition:K61:10; drag_src; pos_x; pos_y)
				
			Else 
				
				var $new_x; $new_y : Integer
				$new_x:=mouseX-drag_org_X
				$new_y:=mouseY-drag_org_Y
				If ((mouseX=-1) | (mouseY=-1))
					SET TIMER:C645(1)
					timer:=True:C214
				Else 
					SET TIMER:C645(0)
					timer:=False:C215
					
					If ($new_x<0)
						$new_x:=0
					End if 
					If (($new_x+drag_src_width)>src_width)
						$new_x:=src_width-drag_src_width
					End if 
					
					If ($new_y<0)
						$new_y:=0
					End if 
					If (($new_y+drag_src_height)>src_height)
						$new_y:=src_height-drag_src_height
					End if 
					
					drag_pos_x:=$new_x
					drag_pos_y:=$new_y
					
					COMBINE PICTURES:C987(vPicture; src; Superimposition:K61:10; drag_dimmed; drag_pos_x; drag_pos_y)
				End if 
				
			End if 
			
		Else 
			If ((mouseX#-1) & (mouseY#-1))
				If ((mouseX>pos_x) & (mouseX<(pos_x+drag_src_width)) & (mouseY>pos_y) & (mouseY<(pos_Y+drag_src_height)))
					SET CURSOR:C469(9013)
				Else 
					SET CURSOR:C469
				End if 
			Else 
				SET CURSOR:C469
			End if 
		End if 
		
		
End case 

logEvent(Form event code:C388; 0)
