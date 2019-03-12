<?php 
error_reporting(0);
define('IMGConvert', "/usr/local/bin/convert");

//fisheye will take only two parameters,type and format
function we_fisheye($arr){
	exec("fisheye -t ".$arr['type']." -f ".$arr['format']." -m none -v none -b none ".$arr['source']." dest.png");
	system(IMGConvert . ' dest.png -trim dest.png');
	return base64_encode('dest.png');
}

//texteffects
function we_textEffect($arr)
{
	$image = $arr['image'];
	$text = $arr['text'];
	$font = $arr['font'];
	$size = $arr['size'];
	$style = $arr['style'];
	$effect = $arr['effect'];
	$italic = $arr['italic'];
	$distortion = $arr['distortion'];
	$color = "'".$arr['color']."'";
	$lineweight = $arr['lineweight'];
	$outlineColor = "'".$arr['outlineColor']."'";
	$glowShadowColor = "'".$arr['glowShadowColor']."'";
	$waveCycle = $arr['waveCycle'];
	$arcAngle = $arr['arcAngle'];
	$gradientAngle = $arr['gradientAngle'];
	
	system("we_imscripts/texteffect -t '".$text."' -s ".$style." -f ".$font." -S ".$size." -e ".$effect." -i ".$italic." -d ".$distortion." -c ".$color." -o ".$outlineColor." -g ".$glowShadowColor." -w ".$waveCycle." -a ".$arcAngle." -A ".$gradientAngle." -m 2 -l ".$lineweight." -u none -b none ".$image);
	system(IMGConvert . ' ' . $image .' -trim '. $image);
	
	$imgStr = 'data:image/png;base64,' . base64_encode(file_get_contents($image));
	//@unlink($image);
	return $imgStr;
}

?>