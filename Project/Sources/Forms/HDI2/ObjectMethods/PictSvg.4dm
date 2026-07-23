
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		If ((MouseX#-1) & (MouseY#-1))
			
			orig_X:=MouseX
			orig_Y:=MouseY
			
			RectRef:=SVG_New_rect(svgRef; orig_X; orig_Y; 1; 1; 0; 0; "gray"; "gray:10")  // Draw Rect with size (1;1)
			SVG_SET_ID(RectRef; "ghostRect")  //Give an id to the ghost rect
			vPictSvg:=SVG_Export_to_picture(svgRef)
		End if 
		
	: (Form event code:C388=On Mouse Move:K2:35)
		
		If ((Is waiting mouse up:C1422=False:C215) & (orig_X#-1))
			SVG_CLEAR(RectRef)
			vPictSvg:=SVG_Export_to_picture(svgRef)
			orig_X:=-1
			orig_Y:=-1
			
		Else 
			
			If ((MouseX#-1) & (orig_X#-1))
				
				end_X:=MouseX
				end_Y:=MouseY
				
				begin_X:=orig_X
				beginY:=orig_Y
				
				width:=end_X-orig_X
				height:=end_Y-orig_Y
				
				If (width=0)
					width:=1
				End if 
				
				If (width<0)
					begin_X:=orig_X+width
				End if 
				
				If (height=0)
					height:=1
				End if 
				
				If (height<0)
					beginY:=orig_Y+height
				End if 
				
				SVG SET ATTRIBUTE:C1055(vPictSvg; "ghostRect"; "x"; begin_X; "y"; beginY; "height"; Abs:C99(height); "width"; Abs:C99(width); *)
				
			End if 
		End if 
		
	: (Form event code:C388=On Mouse Up:K2:58)
		
		If (MouseX#-1)
			
			SVG_CLEAR(RectRef)
			
			end_X:=MouseX
			end_Y:=MouseY
			
			begin_X:=orig_X
			beginY:=orig_Y
			
			width:=end_X-orig_X
			height:=end_Y-orig_Y
			
			If (width=0)
				width:=1
			End if 
			
			If (width<0)
				begin_X:=orig_X+width
			End if 
			
			If (height=0)
				height:=1
			End if 
			
			If (height<0)
				beginY:=orig_Y+height
			End if 
			
			RectRef:=SVG_New_rect(svgRef; begin_X; beginY; Abs:C99(width); Abs:C99(height); 0; 0; vSvgFillColor; vSvgFillColor+":10")
			vPictSvg:=SVG_Export_to_picture(svgRef)
			
			orig_X:=-1
			orig_Y:=-1
		End if 
		
		
End case 

logEvent(Form event code:C388; 1)
