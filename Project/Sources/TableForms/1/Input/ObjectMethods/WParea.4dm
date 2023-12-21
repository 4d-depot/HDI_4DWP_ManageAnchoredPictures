var $sel : Object
var $id : Text

WP UpdateWidget("WPtoolbar"; "WParea")

If (Shift down:C543) && ((Form event code:C388=On Selection Change:K2:29) || (Form event code:C388=On Clicked:K2:4))
	
	$sel:=WP Selection range:C1340([INFO:1]wp:5)
	
	If ($sel.type=2)
		$id:=Request:C163("ID for pict"; $sel.id)
		If (ok=1)
			WP SET ATTRIBUTES:C1342($sel; "id"; $id)
		End if 
	End if 
	
	If ($sel.container#Null:C1517) && ($sel.container.type=300)
		$id:=Request:C163("ID for text box"; $sel.container.id)
		If (ok=1)
			WP SET ATTRIBUTES:C1342($sel.container; "id"; $id)
		End if 
	End if 
	
End if 