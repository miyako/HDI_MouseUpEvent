//%attributes = {"invisible":true}
#DECLARE($rgb : Integer)->$result : Text

var $r; $g; $b : Integer
$r:=($rgb>>16) & 0x0000FF
$g:=($rgb>>8) & 0x0000FF
$b:=$rgb & 0x0000FF

var $hex : Text
$hex:=""

var $i; $val : Integer
var $digits : Text
$digits:="0123456789ABCDEF"

For ($i; 1; 3)
	Case of 
		: ($i=1)
			$val:=$r
		: ($i=2)
			$val:=$g
		: ($i=3)
			$val:=$b
	End case 
	$hex:=$hex+$digits[[$val\16+1]]+$digits[[$val%16+1]]
End for 

$result:="#"+$hex
