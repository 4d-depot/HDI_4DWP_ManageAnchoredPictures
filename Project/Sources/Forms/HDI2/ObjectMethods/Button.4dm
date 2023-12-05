$mode:=wk text wrap top bottom:K81:379

$pict:=WP Get elements:C1550(WParea; wk type image:K81:192)[0]
WP SET ATTRIBUTES:C1342($pict; wk anchor layout:K81:227; $mode)

$tb:=WP Get elements:C1550(WParea; wk type text box:K81:372)[0]
WP SET ATTRIBUTES:C1342($tb; wk anchor layout:K81:227; $mode)
