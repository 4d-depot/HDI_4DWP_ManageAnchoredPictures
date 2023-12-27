var $info : cs:C1710.INFOSelection
var $col : Collection
var $xy : Integer
var $elem : Object
var $i; $x; $y : Integer

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		$info:=ds:C1482.INFO.all().orderBy("pageNumber")
		Form:C1466.tabs:=New object:C1471("values"; $info.extract("tabTitle"); "index"; 0)
		
		WParea:=ds:C1482.INFO.all().first().wp
		
		Form:C1466.trace:=False:C215
		Form:C1466.animate:=False:C215
		
		Form:C1466.pictNames:=["pict_header"; "pict_body"; "textBox_body"; "pict_footer"]
		
		Form:C1466.moveX:=[1; 1; -1; -1]  // 1 means left to right; -1 means right to left
		Form:C1466.moveY:=[1; 1; -1; -1]  // 1 means top to bottom; -1 mean bottom to top
		
		
		
		Form:C1466.minX:=[0; 0; 8; 0]
		Form:C1466.maxX:=[18; 10; 14; 19]
		Form:C1466.shiftX:=[1; 0.5; 0.5; 1]
		
		Form:C1466.minY:=[0; 3; 6; 0]
		Form:C1466.maxY:=[0; 20; 20; 0]
		Form:C1466.shiftY:=[0; 0.5; 0.5; 0]
		
		
		//If (Shift down)
		//Form.ping:=File(Folder(fk resources folder).path+"Sounds/ping.mp3").platformPath
		//Form.pong:=File(Folder(fk resources folder).path+"Sounds/pong.mp3").platformPath
		//Else 
		//Form.ping:=""
		//Form.pong:=""
		//End if 
		
		Form:C1466.zoom:=75
		
		
		
	: (Form event code:C388=On Page Change:K2:54)
		
		WParea:=ds:C1482.INFO.query("pageNumber = :1"; FORM Get current page:C276).first().wp
		If (FORM Get current page:C276=2)
			Form:C1466.init:=True:C214
			SET TIMER:C645(-1)
		End if 
		
	: (Form event code:C388=On Timer:K2:25)
		SET TIMER:C645(0)
		
		If (Form:C1466.init=True:C214)
			
			Form:C1466.posX:=[]  // new collection
			Form:C1466.posY:=[]
			
			For ($i; 0; 3)
				$elem:=WP Get element by ID:C1549(WParea; Form:C1466.pictNames[$i])
				If ($elem#Null:C1517)
					WP GET ATTRIBUTES:C1345($elem; wk anchor horizontal offset:K81:236; $x; wk anchor vertical offset:K81:238; $y)
					Form:C1466.posX[$i]:=$x
					Form:C1466.posY[$i]:=$y
				Else 
					Form:C1466.posX[$i]:=0
					Form:C1466.posY[$i]:=0
				End if 
			End for 
			
			WP SET VIEW PROPERTIES:C1648(*; "WPareaPage2"; New object:C1471(wk zoom:K81:283; Form:C1466.zoom))
			
			Form:C1466.init:=False:C215
		End if 
		
		
		If (Form:C1466.animate=True:C214)
			
			For ($i; 0; 3)  // just the picture to test
				$elem:=WP Get element by ID:C1549(WParea; Form:C1466.pictNames[$i])
				If ($elem#Null:C1517)
					
					
					If (Form:C1466.moveX[$i]=1)  // left to right
						
						If ((Form:C1466.posX[$i]+(Form:C1466.moveX[$i]*Form:C1466.shiftX[$i]))>=Form:C1466.maxX[$i])
							Form:C1466.moveX[$i]:=-1
						End if 
					Else   // right to left
						If ((Form:C1466.posX[$i]+(Form:C1466.moveX[$i]*Form:C1466.shiftX[$i]))<=Form:C1466.minX[$i])
							Form:C1466.moveX[$i]:=1
						End if 
					End if 
					Form:C1466.posX[$i]+=(Form:C1466.moveX[$i]*Form:C1466.shiftX[$i])
					
					If (Form:C1466.moveY[$i]=1)  // Top to bottom
						If ((Form:C1466.posY[$i]+(Form:C1466.moveY[$i]*Form:C1466.shiftY[$i]))>=Form:C1466.maxY[$i])
							Form:C1466.moveY[$i]:=-1
						End if 
					Else   // right to left
						If ((Form:C1466.posY[$i]+(Form:C1466.moveY[$i]*Form:C1466.shiftY[$i]))<=Form:C1466.minY[$i])
							Form:C1466.moveY[$i]:=1
						End if 
					End if 
					Form:C1466.posY[$i]+=(Form:C1466.moveY[$i]*Form:C1466.shiftY[$i])
					
					WP SET ATTRIBUTES:C1342($elem\
						; wk anchor horizontal offset:K81:236; String:C10(Form:C1466.posX[$i]; "&xml")+"cm"\
						; wk anchor vertical offset:K81:238; String:C10(Form:C1466.posY[$i]; "&xml")+"cm")
				End if 
				
			End for 
			
			SET TIMER:C645(-1)
		End if 
		
End case 

