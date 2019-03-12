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
system("we_imscripts/texteffect -t 'Hello Moto' -s roundbevel -f webroot/font/ttf/2013081405123813765003581851129448.ttf -S 500x -e convex-bottom -i 0 -d 0.5 -c red -o yellow -g pink -w 1 -a 0 -A 90 -m 2 -l 3 -u none -b none webroot/genimg/1399623971.png");
	return base64_encode('webroot/genimg/1399623971.png');
}

$action = $_GET['action'];

//$_SESSION['server']= $_SERVER;
if ($action != '') {
	$action($_GET);
}
?>