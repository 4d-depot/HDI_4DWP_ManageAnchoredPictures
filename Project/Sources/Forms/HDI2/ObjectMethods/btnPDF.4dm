C_TEXT:C284($Path)

$Path:=Get 4D folder:C485(Data folder:K5:33)+"export.pdf"
WP EXPORT DOCUMENT:C1337(WParea; $path; wk pdf:K81:315)

OPEN URL:C673($Path)

WP SET VIEW PROPERTIES:C1648(*; "WPareaPage2"; {pageMode: "page"})