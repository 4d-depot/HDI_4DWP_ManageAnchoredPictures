C_TEXT:C284($Path)

$Path:=Get 4D folder:C485(Data folder:K5:33)+"export.docx"
WP EXPORT DOCUMENT:C1337(WParea; $path; wk docx:K81:277)

OPEN URL:C673($Path)

WP SET VIEW PROPERTIES:C1648(*; "WPareaPage2"; {pageMode: "page"})