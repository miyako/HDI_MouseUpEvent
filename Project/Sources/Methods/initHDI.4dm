//%attributes = {"invisible":true}
var $json : Collection
$json:=JSON Parse:C1218(File:C1566(Localized document path:C1105("SAMPLES.json"); fk platform path:K87:2).getText())
$json:=$json.orderBy("SampleSort asc")

ARRAY TEXT:C222(TabControl; 0)
ARRAY TEXT:C222(TextTabControl; 0)
COLLECTION TO ARRAY:C1562($json; TabControl; "Title"; TextTabControl; "Text")

TabControl:=0
Var1:=TextTabControl{1}
Var2:=TextTabControl{2}
Var3:=TextTabControl{3}