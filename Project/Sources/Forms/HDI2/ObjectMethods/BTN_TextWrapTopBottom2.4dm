var $mode : Integer
var $elem : Object

If (Form:C1466.trace)
	TRACE:C157
End if 

$mode:=wk text wrap top bottom:K81:379

$elem:=WP Get element by ID:C1549(WParea; "textBox_body")
WP SET ATTRIBUTES:C1342($elem; wk anchor layout:K81:227; $mode)

