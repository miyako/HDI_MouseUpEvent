
Case of 
	: (Form event code:C388=On Load:K2:1)
		
		If (Get menu bar reference:C979="")
			SET MENU BAR:C67(1)
		End if 
		
		DISABLE MENU ITEM:C150(Get menu bar reference:C979; 1; Current process:C322)
		
		initHDI
		
		CLEAR VARIABLE:C89(Move_Col1)
		CLEAR VARIABLE:C89(Move_Col2)
		CLEAR VARIABLE:C89(SVG_Col1)
		CLEAR VARIABLE:C89(SVG_Col2)
		
		ARRAY TEXT:C222(Move_Col1; 0)
		ARRAY TEXT:C222(Move_Col2; 0)
		ARRAY TEXT:C222(SVG_Col1; 0)
		ARRAY TEXT:C222(SVG_Col2; 0)
		
		// advanced example
		var timer; tracking : Boolean
		var drag_dimmed; vPicture; drag_src; src : Picture
		var src_width; src_height : Integer  // size of background image
		var drag_org_X; drag_org_Y : Integer  // click position in the image to be drag
		var drag_src_width; drag_src_height : Integer  // size of the image to be drag
		var pos_x; pos_y : Integer  //size of the image
		var drag_pos_x; drag_pos_y : Integer  //position of the image during the drag
		
		timer:=False:C215
		pos_x:=0
		pos_y:=0
		drag_pos_x:=0
		drag_pos_y:=0
		drag_src_width:=0
		drag_src_height:=0
		
		$respath:=Get 4D folder:C485(Current resources folder:K5:16)
		READ PICTURE FILE:C678($respath+"eiffel-tower-3.jpg"; src)
		READ PICTURE FILE:C678($respath+"4D-Summit-2016-Paris-square.png"; drag_src)
		drag_dimmed:=drag_src
		PICTURE PROPERTIES:C457(src; src_width; src_height)
		PICTURE PROPERTIES:C457(drag_src; drag_src_width; drag_src_height)
		TRANSFORM PICTURE:C988(drag_dimmed; 1972; 50)
		
		COMBINE PICTURES:C987(vPicture; src; Superimposition:K61:10; drag_src; pos_x; pos_y)
		tracking:=False:C215
		
		//Simple example
		svgRef:=SVG_New(500; 500)
		vPictSvg:=SVG_Export_to_picture(svgRef)
		
		var $svgFg; $svgBg : Integer
		OBJECT GET RGB COLORS:C1074(*; "refSvgRectColour"; $svgFg; $svgBg)
		vSvgFillColor:=RGBToHex($svgBg)
		
		orig_X:=-1
		orig_Y:=-1
		
	: (Form event code:C388=On Timer:K2:25)  // Advanced example
		
		logEvent(Form event code:C388; 0)
		doTracking(tracking; "Picture"; ->vPicture; src; drag_dimmed; ->drag_pos_x; ->drag_pos_y)
		
	: (Form event code:C388=On Unload:K2:2)
		
		ENABLE MENU ITEM:C149(Get menu bar reference:C979; 1; Current process:C322)
		SET TIMER:C645(0)
		
End case 

