var $mode : Integer
var $elem : Object

If (Form:C1466.trace)
	TRACE:C157
End if 

$mode:=wk text wrap square right:K81:383

$elem:=WP Get elements:C1550(WParea; wk type text box:K81:372)[0]
WP SET ATTRIBUTES:C1342($elem; wk anchor layout:K81:227; $mode)

