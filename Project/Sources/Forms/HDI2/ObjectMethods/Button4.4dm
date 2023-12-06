var $mode : Integer
var $elem : Object

If (Form:C1466.trace)
	TRACE:C157
End if 

$mode:=wk text wrap square left:K81:382

$elem:=WP Get elements:C1550(WParea; wk type image:K81:192)[0]
WP SET ATTRIBUTES:C1342($elem; wk anchor layout:K81:227; $mode)
