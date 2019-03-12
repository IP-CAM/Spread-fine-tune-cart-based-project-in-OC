<?php 
error_reporting(E_ALL);
define('IMGConvert', "/usr/local/bin/convert");

function testingIM($arr)
{
	$base64Img = '';
	switch ($arr['effectType']) {
		case 'fisheye':
			$base64Img = fisheye($arr);
			break;
		case 'textEffect':
			$base64Img = textEffect($arr);
			break;
		default:
			
			break;
	}
	
	echo "<br/>";
	echo "<img title='shivang' src='".base64_decode($base64Img)."'></img>";
}	

//fisheye will take only two parameters,type and format
function fisheye($arr){
	exec("we_imscripts/fisheye -t ".$arr['type']." -f ".$arr['format']." -m none -v none -b none ".$arr['source']." dest.png");
	system(IMGConvert . ' dest.png -trim dest.png');
	return base64_encode('dest.png');
}

//texteffects
function textEffect($arr)
{		
	//system("we_imscripts/texteffect -t 'SOME BEVEL TEXT' -s ".$arr['s']."  -e ".$arr['e']." -d ".$arr['d']." -f webroot/font/ttf/2013081409250813765155081764172656.ttf -S ".$arr['S']." -c skyblue -b none -o black -l ".$arr['l']." -m ".$arr['m']." dest.png 2>&1");
	system('we_imscripts/texteffect -t "SOME ARCHBOTTOM TEXT" -s outline -e concave -d .8 -f webroot/font/ttf/2013081409250813765155081764172656.ttf -S 2000x -c skyblue -b white -o black -l 1 -u lightpink dest.png');
	system(IMGConvert . ' dest.png -trim dest.png');
	return base64_encode('dest.png');
}

$action = $_GET['action'];

//$_SESSION['server']= $_SERVER;
if ($action != '') {
	$action($_GET);
}
?>