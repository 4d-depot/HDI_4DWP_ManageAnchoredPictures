var $info : cs:C1710.INFOSelection
var $col : Collection
var $xy : Integer
var $elem : Object

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		$info:=ds:C1482.INFO.all().orderBy("pageNumber")
		Form:C1466.tabs:=New object:C1471("values"; $info.extract("tabTitle"); "index"; 0)
		
		WParea:=ds:C1482.INFO.all().first().wp
		
		Form:C1466.trace:=False:C215
		Form:C1466.animate:=False:C215
		
		Form:C1466.posPict:=[10; 20]
		Form:C1466.movePict:=[1; 1]
		Form:C1466.minPict:=[10; 10]
		Form:C1466.maxPict:=[70; 250]
		
		Form:C1466.posTextBox:=[100; 50]
		Form:C1466.moveTextBox:=[-1; 1]
		Form:C1466.minTextBox:=[100; 10]
		Form:C1466.maxTextBox:=[130; 220]
		
		If (Shift down:C543)
			Form:C1466.ping:=File:C1566(Folder:C1567(fk resources folder:K87:11).path+"Sounds/ping.mp3").platformPath
			Form:C1466.pong:=File:C1566(Folder:C1567(fk resources folder:K87:11).path+"Sounds/pong.mp3").platformPath
		Else 
			Form:C1466.ping:=""
			Form:C1466.pong:=""
		End if 
		
		SET TIMER:C645(-1)
		
	: (Form event code:C388=On Page Change:K2:54)
		
		WParea:=ds:C1482.INFO.query("pageNumber = :1"; FORM Get current page:C276).first().wp
		
		
	: (Form event code:C388=On Timer:K2:25)
		SET TIMER:C645(0)
		
		
		If (Form:C1466.animate=True:C214)
			
			$col:=WP Get elements:C1550(WParea; wk type image anchored:K81:248)
			If ($col.length>0)
				$elem:=$col[0]
				
				For ($xy; 0; 1)
					If (Form:C1466.movePict[$xy]=1)  // left to right ot top to bottom
						If (Form:C1466.posPict[$xy]>=Form:C1466.maxPict[$xy])
							Form:C1466.movePict[$xy]:=-1
							PLAY:C290(Form:C1466.ping)
						End if 
					Else   // right to left  or bottom to top
						If (Form:C1466.posPict[$xy]<Form:C1466.minPict[$xy])
							Form:C1466.movePict[$xy]:=1
							PLAY:C290(Form:C1466.pong)
						End if 
					End if 
					Form:C1466.posPict[$xy]+=Form:C1466.movePict[$xy]
				End for 
				WP SET ATTRIBUTES:C1342($elem; wk anchor horizontal offset:K81:236; String:C10(Form:C1466.posPict[0])+"mm"\
					; wk anchor vertical offset:K81:238; String:C10(Form:C1466.posPict[1])+"mm")
			End if 
			
			
			$col:=WP Get elements:C1550(WParea; wk type text box:K81:372)
			If ($col.length>0)
				$elem:=$col[0]
				For ($xy; 0; 1)
					If (Form:C1466.moveTextBox[$xy]=1)  // left to right ot top to bottom
						If (Form:C1466.posTextBox[$xy]>=Form:C1466.maxTextBox[$xy])
							Form:C1466.moveTextBox[$xy]:=-1
							//PLAY(Form.ping)
						End if 
					Else   // right to left  or bottom to top
						If (Form:C1466.posTextBox[$xy]<Form:C1466.minTextBox[$xy])
							Form:C1466.moveTextBox[$xy]:=1
							//PLAY(Form.pong)
						End if 
					End if 
					Form:C1466.posTextBox[$xy]+=Form:C1466.moveTextBox[$xy]
				End for 
				WP SET ATTRIBUTES:C1342($elem; wk anchor horizontal offset:K81:236; String:C10(Form:C1466.posTextBox[0])+"mm"\
					; wk anchor vertical offset:K81:238; String:C10(Form:C1466.posTextBox[1])+"mm")
			End if 
			
			SET TIMER:C645(-1)
		End if 
		
End case 

