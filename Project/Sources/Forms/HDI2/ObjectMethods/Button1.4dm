var $mode : Integer
var $elem : Object

If (Form:C1466.trace)
	TRACE:C157
End if 

$mode:=wk text wrap square:K81:380

$elem:=WP Get element by ID:C1549(WParea; "pict_body")
WP SET ATTRIBUTES:C1342($elem; wk anchor layout:K81:227; $mode)
