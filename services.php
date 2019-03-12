<?php
session_start();
error_reporting(E_ERROR);
//error_reporting(0);
if (file_exists('config.php')) {
	require_once ('config.php');
}
// connect code start ----------------------

$con = mysql_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD) or die("Cannot connect to MySQL" . mysql_error());
mysql_select_db(DB_DATABASE) or die(mysql_error());
mysql_query('SET NAMES utf8');

// connect code end ----------------------
// table consant start--------------------
define('PREFIX', 'oc_');
define('LANG_ID', 1);
define('TBL_CATEGORY', PREFIX . 'category');
define('TBL_CURRENCY', PREFIX . 'currency');
define('TBL_CATEGORY_DESC', PREFIX . 'category_description');

define('TBL_RAW_PRODUCT', PREFIX . 'raw_product');
define('TBL_RAW_PRODUCT_CATEGORY', PREFIX . 'raw_product_category');
define('TBL_RAW_PRODUCT_COLOR', PREFIX . 'raw_product_color');
define('TBL_RAW_PRODUCT_SIZE_QUANTITY', PREFIX . 'raw_product_color_size_quantity');
define('TBL_RAW_PRODUCT_COLOR_VIEW', PREFIX . 'raw_product_color_view');
define('TBL_RAW_PRODUCT_VIEW', PREFIX . 'raw_product_view');
define('TBL_RAW_PRODUCT_DESC', PREFIX . 'raw_product_description');
define('TBL_RAW_PRODUCT_SIZE', PREFIX . 'raw_product_size');

define('TBL_PRODUCT', PREFIX . 'product');
define('TBL_PRODUCT_TO_CATEGORY', PREFIX . 'product_to_category');
define('TBL_PRODUCT_TO_STORE', PREFIX . 'product_to_store');
define('TBL_PRODUCT_OPTION', PREFIX . 'product_option');
define('TBL_PRODUCT_OPTION_VALUE', PREFIX . 'product_option_value');
define('TBL_PRODUCT_IMAGE', PREFIX . 'product_image');
define('TBL_PRODUCT_DESC', PREFIX . 'product_description');

define('TBL_COLOR', PREFIX . 'color');
define('TBL_COLOR_OPTION', PREFIX . 'color_option');

define('TBL_OPTION', PREFIX . 'option');
define('TBL_OPTION_DESC', PREFIX . 'option_description');
define('TBL_OPTION_VALUE', PREFIX . 'option_value');
define('TBL_OPTION_VALUE_DESC', PREFIX . 'option_value_description');

define('TBL_FONT', PREFIX . 'font');
define('TBL_FONT_VALUE', PREFIX . 'font_value');

define('TBL_LANG', PREFIX . 'language');

define('TBL_DESIGN_CATEGORY', PREFIX . 'design_category');
define('TBL_DESIGN_CATEGORY_DESC', PREFIX . 'design_category_description');

define('TBL_DESIGN', PREFIX . 'design');
define('TBL_DESIGN_DESC', PREFIX . 'design_description');

define('TBL_MAIN_PRODUCT', PREFIX . 'main_product');
define('TBL_USER_IMAGE', PREFIX . 'user_image');
define('TBL_SCREEN_PRINTING_COLORS', PREFIX . 'screen_printing_color');

define('COLOR_OPTION', '5');
define('VIEW_OPTION', '13');
define('SIZE_OPTION', '11');

define('SIZE_OPTION', '11');

define('TOOLSECURE', '20131401234345.txt');
define('HOSTSECURE', 'inkfi.com');

// table consant END--------------------
// SESSION CONSTANT START-----------------
define('TOKEN', $_SESSION['token']);

if ($_SESSION['user_id'] != '') {
	define('USERID', $_SESSION['user_id']);
	define('USERTYPE', 0);

} else if ($_SESSION['customer_id'] != '') {
	define('USERID', $_SESSION['customer_id']);
	define('USERTYPE', 1);
} else {
	define('USERID', 0);
	define('USERTYPE', 1);
}

define('CURRENCYCODE', $_SESSION['currency']);
define('LANGUAGECODE', $_SESSION['language']);

// SESSION CONSTANT END-------------------
function secure($data) {
	$host = str_replace("www.", "", $_SERVER['HTTP_HOST']);
	$filename = _CLIPART_ORIGINAL_ . TOOLSECURE;
	if (file_exists($filename)) {
		echo '';
		die ;
	}
	if (HOSTSECURE != $host) {
		echo '';
		die ;
	}
}

function getCommonFields($post) {
	secure($post);
	$result = (object)$result;
	$query = 'select * from  ' . TBL_CURRENCY . ' where  code="' . CURRENCYCODE . '"';

	$rst = mysql_query($query);
	$num = mysql_num_rows($rst);
	$row = mysql_fetch_object($rst);

	$result -> currencyId = $row -> currency_id;
	$result -> currencyMultiplier = $row -> value;
	if ($row -> symbol_left != '') {
		$result -> currencySymbol = $row -> symbol_left;
		$result -> currencySymbolPosition = 'left';
	} else {
		$result -> currencySymbol = $row -> symbol_right;
		$result -> currencySymbolPosition = 'right';
	}
	$result -> language = LANGUAGECODE;
	$result -> isIframe = '1';
	$result -> userType = USERTYPE;
	$result -> screen_printing_colors = getScreenPrintingColors();
	$var = json_encode($result);
	echo $var;
}

function getproducts($cat_id = '') {

	$result1 = (object)$result1;

	$prod = array();

	$query = 'select pc.category_id,p.is_screen_printing,p.raw_product_id,p.image,pd.name,pd.description from ' . TBL_RAW_PRODUCT_CATEGORY . ' as pc inner join ' . TBL_RAW_PRODUCT . ' as p on p.raw_product_id=pc.raw_product_id  inner join ' . TBL_RAW_PRODUCT_DESC . ' as pd on pd.raw_product_id=pc.raw_product_id where  pc.category_id="' . $cat_id . '" AND p.status="1" AND p.is_deleted="0"  AND  pd.language_id="' . LANG_ID . '" ';
	$rst = mysql_query($query);
	$num = mysql_num_rows($rst);

	$result = (object)$result;
	if ($num > 0) {
		$prod = array();
		$i = 0;
		while ($row = mysql_fetch_object($rst)) {

			$obj = (object)$obj;
			if ($i == 0) {
				$result1 -> default = $row -> raw_product_id;
			}
			$obj -> id = $row -> raw_product_id;
			$obj -> name = $row -> name;
			$obj -> description = strip_tags(htmlspecialchars_decode(stripslashes($row -> description)));
			$obj -> source = RAWPRODUCT_41x41 . $row -> image;
			$prod[] = $obj;
			unset($obj);

			$i++;
		}
		$result1 -> products = $prod;
	}
	/*   	echo "<pre>";
	 print_r($result1);*/
	return $result1;
}

function getScreenPrintingColors() {
	$prod = array();

	$query = 'select * from ' . TBL_SCREEN_PRINTING_COLORS;
	$rst = mysql_query($query);
	$num = mysql_num_rows($rst);

	$result = array();
	if ($num > 0) {
		while ($row = mysql_fetch_object($rst)) {
			if ($row -> status == 1) {
				$obj = (object)$obj;
				$obj -> id = $row -> color_id;
				$obj -> name = $row -> name;
				$obj -> hexValue = $row -> code;
				$result[] = $obj;
				unset($obj);
			}
		}		
	}
	return $result;	
}

function getProductCategories($post) {
	secure($post);
	$query = 'select c.category_id,cd.name,cd.description from ' . TBL_CATEGORY . ' as c left join ' . TBL_CATEGORY_DESC . ' as cd on cd.category_id=c.category_id where cd.language_id="' . LANG_ID . '" and c.parent_id="0" order by c.sort_order ';
	$rst = mysql_query($query);
	$num = mysql_num_rows($rst);

	$result = (object)$result;
	if ($num > 0) {

		$cat = array();
		$i = 0;
		while ($row = mysql_fetch_object($rst)) {
			if ($i == 0) {
				$result -> default = $row -> category_id;
				$i++;
			}
			$obj = (object)$obj;

			$obj -> id = $row -> category_id;
			$obj -> name = $row -> name;
			//$obj->description=strip_tags($row->description);
			$obj -> productData = getproducts($row -> category_id);
			$cat[] = $obj;
			unset($obj);
		}
		$result -> category = $cat;
	}
	//   	echo "<pre>";
	//		print_r($result);
	$var = json_encode($result);
	echo $var;
	/*$callback = $_POST["callback"];
	 echo $callback . "(" . $var. ")";*/

}

function dummyarea() {
	//$prod= array();
	$obj = (object)$obj;
	$obj -> default = '1';
	//$obj->x=0 + 150*$i;
	//$obj->y=0 + 150*$i;
	//$obj->width=150;
	$obj -> designArea = '[]';
	//$prod[] = $obj;
	//unset($obj);
	/*
	 $obj = (object) $obj;
	 $obj->id=$i.'2';
	 $obj->x=150 + 150*$i;
	 $obj->y=150 + 150*$i;
	 $obj->width=150;
	 $obj->height=150;
	 $prod[] = $obj;
	 unset($obj);*/

	return $obj;
}

function getProductColorViews($raw_product_id, $raw_product_color_id) {

	$query = 'select pv.*,ovd.name from  ' . TBL_RAW_PRODUCT_COLOR_VIEW . ' as pv left join ' . TBL_OPTION_VALUE_DESC . ' as ovd on ovd.option_value_id =pv.view_id where  pv.raw_product_id="' . $raw_product_id . '" AND pv.raw_product_color_id="' . $raw_product_color_id . '" AND  ovd.language_id="' . LANG_ID . '" ';
	$rst = mysql_query($query);
	$num = mysql_num_rows($rst);

	//$resultview = (object) $resultview;
	if ($num > 0) {

		$view = array();
		while ($row = mysql_fetch_object($rst)) {

			$objview = (object)$objview;
			/*		if($row->is_default==1){
			 $resultview->default=$row->id;
			 }*/

			$objview -> id = $row -> id;

			$objview -> viewId = $row -> view_id;

			//$objview->title=$row->name;
			// $objview->price=$row->price;
			$objview -> thumbnail = RAWPRODUCT_41x41 . $row -> image;
			$objview -> url = RAWPRODUCTORIGINAL . $row -> image;
			//$objview->designAreas=dummyarea();

			$view[] = $objview;

			unset($objview);

		}
		// $resultview->view =$view;

	}
	//print_r($resultview);
	return $view;
}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function getProductColors($raw_product_id) {

	$query = 'select pc.*,c.name from ' . TBL_RAW_PRODUCT_COLOR . ' as pc left join ' . TBL_COLOR . ' as c on c.color_id=pc.color_id where  pc.raw_product_id="' . $raw_product_id . '" AND pc.status="1"';
	$rst = mysql_query($query);
	$num = mysql_num_rows($rst);

	$resultcolor = (object)$resultcolor;
	if ($num > 0) {

		$color = array();
		while ($row = mysql_fetch_object($rst)) {

			$objcolor = (object)$objcolor;
			if ($row -> is_default == 1) {
				$resultcolor -> default = $row -> id;
			}
			$objcolor -> id = $row -> id;
			$objcolor -> colorId = $row -> color_id;
			$objcolor -> hexValue = trim($row -> color_code);
			$objcolor -> price = $row -> color_price;
			$objcolor -> title = $row -> name;
			$objcolor -> views = getProductColorViews($raw_product_id, $row -> id);
			$color[] = $objcolor;
			unset($objcolor);

		}
		$resultcolor -> color = $color;

	}

	return $resultcolor;
}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function getProductSizes($raw_product_id) {

	$query = 'select ps.*,ovd.name  from ' . TBL_RAW_PRODUCT_SIZE . ' as ps left join ' . TBL_OPTION_VALUE_DESC . ' as ovd on ovd.option_value_id =ps.size_id where  ps.raw_product_id="' . $raw_product_id . '" AND  ovd.language_id="' . LANG_ID . '" ';
	$rst = mysql_query($query);
	$num = mysql_num_rows($rst);

	$resultsize = (object)$resultsize;
	if ($num > 0) {

		$i = 0;
		$size = array();
		while ($row = mysql_fetch_object($rst)) {

			$objsize = (object)$objsize;
			if ($i == 0) {
				$resultsize -> default = $row -> id;
			}
			$objsize -> id = $row -> id;
			$objsize -> sizeId = $row -> size_id;
			$objsize -> price = $row -> price;
			$objsize -> title = $row -> name;

			$size[] = $objsize;
			unset($objsize);
			$i++;
		}
		$resultsize -> size = $size;

	}

	return $resultsize;
}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function getProductViews($raw_product_id) {

	$query = 'select ps.*,ovd.name  from ' . TBL_RAW_PRODUCT_VIEW . ' as ps left join ' . TBL_OPTION_VALUE_DESC . ' as ovd on ovd.option_value_id =ps.view_id where  ps.raw_product_id="' . $raw_product_id . '" AND  ovd.language_id="' . LANG_ID . '" ';
	$rst = mysql_query($query);
	$num = mysql_num_rows($rst);

	$resultsize = (object)$resultsize;
	if ($num > 0) {

		$i = 0;
		$size = array();
		while ($row = mysql_fetch_object($rst)) {

			$objsize = (object)$objsize;
			if ($row -> is_default == 1) {
				$resultsize -> default = $row -> view_id;
			}

			$objsize -> id = $row -> view_id;
			$objsize -> price = $row -> price;
			$objsize -> title = $row -> name;
			//$objsize->designAreas=dummyarea($i);

			$objsize -> designAreas = ($row -> design_area != '') ? unserialize($row -> design_area) : dummyarea();

			$size[] = $objsize;
			unset($objsize);
			$i++;
		}
		$resultsize -> view = $size;

	}

	return $resultsize;
}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function getProductById($post) {
	secure($post);
	$raw_product_id = $post['productId'];
	$query = 'select p.*,pd.name,pd.description from  ' . TBL_RAW_PRODUCT . ' as p left join ' . TBL_RAW_PRODUCT_DESC . ' as pd on pd.raw_product_id=p.raw_product_id where  p.raw_product_id="' . $raw_product_id . '" AND p.status="1" AND p.is_deleted="0" AND  pd.language_id="' . LANG_ID . '" ';
	$rst = mysql_query($query);
	$num = mysql_num_rows($rst);

	$result = (object)$result;
	if ($num > 0) {
		$row = mysql_fetch_object($rst);
		$result -> id = $row -> raw_product_id;
		$result -> title = $row -> name;
		$result -> description = $row -> description;
		$result -> price = $row -> price;
		$result -> colors = getProductColors($raw_product_id);
		$result -> is_screen_printing = $row -> is_screen_printing;		
		$result -> sizes = getProductSizes($raw_product_id);
		$result -> views = getProductViews($raw_product_id);
	}
	/*   	echo "<pre>";
	 print_r($result);*/
	$var = json_encode($result);
	echo $var;
}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function getFonts($post) {
	secure($post);

	$query = 'select *  from ' . TBL_FONT . ' where 1';
	$rst = mysql_query($query);
	$num = mysql_num_rows($rst);

	$fonts = (object)$fonts;
	if ($num > 0) {

		$font = array();
		while ($row = mysql_fetch_object($rst)) {

			$objfont = (object)$objfont;
			if ($row -> is_default == 1) {
				$fonts -> default = $row -> font_id;
			}

			$objfont -> id = $row -> font_id;
			$objfont -> title = $row -> name;
			$objfont -> image = FONTPATH . $row -> image;

			$objfont -> normal = 0;

			$objfont -> bold = 0;

			$objfont -> italic = 0;

			$objfont -> boldItalic = 0;

			$querysub = 'select  	font_type, 	font_value_id  from ' . TBL_FONT_VALUE . ' where 1 and font_id="' . $row -> font_id . '"';

			$rstsub = mysql_query($querysub);
			$numsub = mysql_num_rows($rstsub);
			if ($numsub > 0) {
				while ($rowsub = mysql_fetch_object($rstsub)) {
					if ($rowsub -> font_type == 'normal') {
						$objfont -> normal = 1;
					} else if ($rowsub -> font_type == 'bold') {
						$objfont -> bold = 1;
					} else if ($rowsub -> font_type == 'italic') {
						$objfont -> italic = 1;
					} else if ($rowsub -> font_type == 'boldI') {
						$objfont -> boldItalic = 1;
					}
				}

			}

			$font[] = $objfont;
			unset($objfont);

		}
		$fonts -> fonts = $font;

	}

	$var = json_encode($fonts);
	echo $var;

}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function generateImage($post) {
	secure($post);
	$data = $post['data'];

	$font = '';
	$boldtype = $data['bold'];
	$italictype = $data['italic'];
	$cond = '';
	if ($boldtype == '1' && $italictype == '1')
		$cond = 'boldI';
	elseif ($boldtype == '1')
		$cond = 'bold';
	elseif ($italictype == '1')
		$cond = 'italic';
	else
		$cond = 'normal';

	$query = 'select font_ttf  from ' . TBL_FONT_VALUE . ' where font_id="' . $data['fontId'] . '" and font_type ="' . $cond . '"';
	//$_SESSION['qqqq']= $query;
	$fontArr = mysql_fetch_object(mysql_query($query));
	$font = _FONTTTF_ . $fontArr -> font_ttf;

	$querydirection = 'select directionshow  from ' . TBL_FONT . ' where font_id="' . $data['fontId'] . '" ';
	//$_SESSION['qqqq']= $query;
	$directionshw = mysql_fetch_object(mysql_query($querydirection));
	$directionshow = '';
	if ($directionshw -> directionshow == 2) {
		$directionshow = " -direction right-to-left ";
	}

	$w = 500;
	$h = 500;
	$color = $data['color'];
	$label = $data['text'];
	$lancount = strlen($data['text']);
	if ($lancount < 4) {
		$label = '   ' . $label . '  ';
	} else {
		$label = ' ' . $label . ' ';
	}
	$abst = abs($data['arc']);
	$arctype = ($abst == 0) ? 1 : $data['arc'] / $abst;
	$angle = $abst;
	$degree = ($arctype == 1) ? 0 : 180;

	$outline = $data['outlineWidth'];
	$outlinecolor = $data['outlineColor'];
	$cmdoutline = '';
	if ($outline > 0 && $outlinecolor != '') {
		$cmdoutline = ' -strokewidth ' . $outline . ' -stroke "' . $outlinecolor . '" ';
	}
	//$font=DIR_WEBROOT.'2013041903235313663598331171412095.ttf';
	$image = time() . '.png';
	// echo IMAGEMAGICPATH.' -background transparent -depth 8 -font "'.$font.'" -gravity "center" -fill "'.$color.'" -size "'.$w.'"x"'.$h.'"! label:"'.$label.'" -rotate 0 -distort Arc "'.$angle.' '.$degree.'" -trim "'._GENIMG_.'/'.$image.'"';

	// -direction right-to-left

	/*$File = "font.txt";
	 $Handle = fopen($File, 'w');
	 fwrite($Handle,$label);
	 fclose($Handle);
	 */
	$_SESSION['arc'] = IMAGEMAGICPATH . ' -background transparent -depth 8  ' . $cmdoutline . ' -font "' . $font . '" -encoding Unicode    -gravity "NorthWest" -fill "' . $color . '" -size "' . $w . '"x"' . $h . '"! ' . $directionshow . ' label:"' . $label . '" -rotate ' . $degree . ' -distort Arc "' . $angle . ' ' . $degree . '" -trim "' . _GENIMG_ . $image . '"';
	exec(IMAGEMAGICPATH . ' -background transparent -depth 8  ' . $cmdoutline . ' -font "' . $font . '" -encoding Unicode    -gravity "NorthWest" -fill "' . $color . '" -size "' . $w . '"x"' . $h . '"! ' . $directionshow . '  label:"' . $label . '" -rotate ' . $degree . ' -distort Arc "' . $angle . ' ' . $degree . '" -trim "' . _GENIMG_ . $image . '"');

	echo 'data:image/png;base64,' . base64_encode(file_get_contents(GENIMG . $image));
	@unlink(_GENIMG_ . $image);

}

function clipartsById($post) {
	secure($post);
	$subCategoryId = $post['subCategoryId'];
	$categoryId = (!empty($post['categoryId'])) ? $post['categoryId'] : '';

	$sqlCategory = "
						SELECT des.* , dd.title, dd.description
						FROM " . TBL_DESIGN . " AS des
						LEFT JOIN " . TBL_DESIGN_DESC . " AS dd ON dd.design_id = des.id
						WHERE des.status = '1'
						AND des.sub_cat_id = '" . $categoryId . "'
						AND dd.language_id = '" . LANG_ID . "'";

	/*if($categoryId!=''){
	 $sqlCategory = "
	 SELECT des.* , dd.title, dd.description
	 FROM ".TBL_DESIGN." AS des
	 LEFT JOIN ".TBL_DESIGN_DESC." AS dd ON dd.design_id = des.id
	 WHERE des.status = '1'
	 AND des.cat_id='".$categoryId."'
	 AND dd.language_id = '".LANG_ID."'";

	 }*/

	$res = mysql_query($sqlCategory);
	$num = mysql_num_rows($res);
	//return $sqlCategory;

	$result = (object)$result;
	if ($num > 0) {

		$clipart = array();
		$i = 0;
		while ($row = mysql_fetch_object($res)) {
			//echo $row->toolarr;
			$objclipart = (object)$objclipart;
			$objclipart -> id = $row -> id;
			$objclipart -> price = $row -> price;
			$objclipart -> thumbnail = CLIPART_300X300 . $row -> image;
			$objclipart -> title = $row -> title;
			$objclipart -> description = $row -> description;
			$objclipart -> images = unserialize($row -> designArray);
			$objclipart -> colorable = $row -> colorable;

			$clipart[] = $objclipart;
			unset($objclipart);

		}
		$result = $clipart;
		unset($clipart);
	}
	//echo "<pre>";
	//	print_r($result);
	$var = json_encode($result);
	echo $var;

}

function getUserImages($post) {
	$user_id = $_SESSION['customer_id'];
	$ip = $_SERVER['REMOTE_ADDR'];
	$con = '';
	if (!empty($user_id)) {
		$con = " OR user_id_ip='" . $user_id . "'";
	}
	$sqlImage = "SELECT * 
						FROM " . TBL_USER_IMAGE . " 
						WHERE user_id_ip = '" . $ip . "' " . $con;

	$res = mysql_query($sqlImage);
	$num = mysql_num_rows($res);
	//return $sqlCategory;

	$result = (object)$result;
	if ($num > 0) {

		$clipart = array();
		$i = 0;
		while ($row = mysql_fetch_object($res)) {
			//echo $row->toolarr;
			$objs = array();
			$objs[0] = (object)$objs[0];

			$objs[0] -> url = USERUPLOAD_300x300 . $row -> image;
			$objs[0] -> color = '#000000';
			$objclipart = (object)$objclipart;
			$objclipart -> id = $row -> id;
			$objclipart -> price = 0;
			$objclipart -> thumbnail = USERUPLOAD_45x45 . $row -> image;
			$objclipart -> title = '';
			$objclipart -> description = '';
			$objclipart -> images = $objs;
			$objclipart -> colorable = 0;
			$objclipart -> imagetype = 'image';

			$clipart[] = $objclipart;
			unset($objclipart);
			unset($objs);

		}
		$result = $clipart;
		unset($clipart);
	}
	//	echo "<pre>";
	//	print_r($result);
	$var = json_encode($result);
	echo $var;

}

////////////////////// ADMIN work start =========================

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function saveProductArea($post) {
	secure($post);
	//$_SESSION['save']=$post;
	$data = json_decode($post['data']);
	//echo '<pre>';
	//print_r($data);
	foreach ($data as $key) {
		//echo $key->productId;
		$query = "UPDATE " . TBL_RAW_PRODUCT_VIEW . " SET 
		design_area='" . serialize($key -> designArea) . "'
		WHERE raw_product_id='" . $key -> productId . "' AND view_id='" . $key -> viewId . "' 
		";
		$rst = mysql_query($query);
		//echo $key.' = '.$value."<br>";
	}
	echo '1';

}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function getAllLanguages($post, $typ = '') {

	$querysub = 'select * from ' . TBL_LANG . ' where 1 and language_id="' . LANG_ID . '"';

	$rstsub = mysql_query($querysub);
	$numsub = mysql_num_rows($rstsub);
	$objLang = (object)$objLang;
	$objLang -> language = array();
	if ($numsub > 0) {
		$row = mysql_fetch_object($rstsub);
		$objLang -> default = $row -> language_id;

		$objLang -> language[] = $row;
	}

	//return $objLang;
	//echo $typ;echo '00000';
	if ($typ == '') {
		$var = json_encode($objLang);
		echo $var;
	} else {
		return $objLang;
	}

}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function getClipartCategoriesAdmin() {

	$fixId = 63;
	$sqlCategory = "SELECT dc.category_id AS id,dc.top, dc.parent_id, dcd.name
FROM " . TBL_DESIGN_CATEGORY . " AS dc
LEFT JOIN " . TBL_DESIGN_CATEGORY_DESC . " AS dcd ON dcd.category_id = dc.category_id
WHERE 1";
	$res = mysql_query($sqlCategory);
	$num = mysql_num_rows($res);
	//return $sqlCategory;

	$result = (object)$result;
	if ($num > 0) {

		$cat = array();
		$i = 0;
		while ($row = mysql_fetch_object($res)) {
			$obj = (object)$obj;

			$obj -> id = $row -> id;
			$obj -> label = $row -> name;
			if ($row -> top == 0) {
				$obj -> categoryId = 0;
			} else {
				if ($row -> parent_id != 0) {
					$obj -> categoryId = $row -> parent_id;
				} else {
					$obj -> categoryId = $fixId;
				}
			}

			$cat[] = $obj;
			unset($obj);
		}
		$result = $cat;
	}
	//   	echo "<pre>";
	//		print_r($result);
	$var = json_encode($result);
	echo $var;

}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function getClipartCategories() {

	$sqlCategory = "SELECT dc.category_id AS id, dc.parent_id, dcd.name
FROM " . TBL_DESIGN_CATEGORY . " AS dc
LEFT JOIN " . TBL_DESIGN_CATEGORY_DESC . " AS dcd ON dcd.category_id = dc.category_id
WHERE 1 AND dc.top=1 ";
	$res = mysql_query($sqlCategory);
	$num = mysql_num_rows($res);
	//return $sqlCategory;

	$result = (object)$result;
	$result -> default = 0;
	$result -> cliparts = array();
	if ($num > 0) {

		$cat = array();
		$i = 0;

		while ($row = mysql_fetch_object($res)) {
			$obj = (object)$obj;
			if ($i == 0) {
				$result -> default = $row -> id;
			}
			$obj -> id = $row -> id;
			$obj -> label = $row -> name;
			$obj -> categoryId = $row -> parent_id;

			$cat[] = $obj;
			unset($obj);
			$i++;
		}
		$result -> cliparts = $cat;
	}
	//   	echo "<pre>";
	//		print_r($result);
	$var = json_encode($result);
	echo $var;

}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
/*
 function getLanguageData($langId =1)
 {

 }
 */
//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function createThumbnail($obj, $imagePath) {
	//echo 'tttt<br>';
	$string = $obj -> encoded;
	$file_name = $imagePath;
	if (!$string) {
		parse_str($HTTP_RAW_POST_DATA, $post_vars);
		$string = $obj -> encoded;
		//$type = $post_vars['type'];
	}

	if ($string) {
		$string = base64_decode($string);
		$img_file = fopen(_CLIPART_ORIGINAL_ . $file_name, "w");
		fwrite($img_file, $string);
		fclose($img_file);

		$imgSource = _CLIPART_ORIGINAL_ . $file_name;
		exec(IMAGEMAGICPATH . ' -trim "' . "$imgSource" . '" "' . "$imgSource" . '"', $result);

		$pathThumb = _CLIPART_45X45_ . $file_name;
		$path300x300 = _CLIPART_300X300_ . $file_name;
		exec(IMAGEMAGICPATH . " $imgSource -thumbnail 45x45 $pathThumb");
		exec(IMAGEMAGICPATH . " $imgSource -thumbnail 300x300 $path300x300");

		/*
		 list($width, $height) = getimagesize($imgSource);
		 //echo $width." - ".$height;
		 $_500x500_size='500x500';
		 $pathThumb		= "../../../files/design/500x500/$file_name";
		 if ($width >= 500|| $height >= 500) {
		 exec($this->imageMagickPath." $imgSource -thumbnail $_500x500_size $pathThumb");

		 }else{

		 exec($this->imageMagickPath." $imgSource  $pathThumb");
		 }
		 */

	}
}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function getClipartData($obj) {

	$languageList = array();
	$alllangs = getAllLanguages(array(), '1');
	foreach ($alllangs->language as $lang) {
		$lid = $lang -> language_id;
		$language = array();
		$language['id'] = $lid;
		foreach ($obj->titleArr as $title) {
			if ($lid == $title -> id) {
				$language['title'] = $title -> value;
			}
		}
		foreach ($obj->descriptionArr as $desc) {
			if ($lid == $desc -> id) {
				$language['description'] = $desc -> value;
			}
		}
		foreach ($obj->keyWordsArr as $keyWord) {
			if ($lid == $keyWord -> id) {
				$language['keywords'] = $keyWord -> value;
			}
		}
		$languageList[] = $language;
		unset($language);
	}
	return $languageList;
}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function saveClipart($post) {
	secure($post);
	//echo 'dddd<br>';
	//$_SESSION['saveCliparts']= $post;
	$obj = json_decode($post['data']);
	//$_SESSION['saveClipart']= $obj;
	$objStatus = (object)$objStatus;
	$objectVal = (object)$objectVal;
	/*echo "<pre>";
	 echo $obj->categoryId;
	 echo $obj->images;*/
	//echo 'dddd2<br>';
	$imagePath = date("Ymdhis") . time() . rand() . ".png";

	$thumbCreat = createThumbnail($obj, $imagePath);
	$designArr = serialize($obj -> images);
	$colorable = ($obj -> colorable) ? 1 : 0;
	//echo 'dddd3<br>';
	$Query = "INSERT INTO " . TBL_DESIGN . " SET price='" . $obj -> price . "', image='" . $imagePath . "', designArray='" . $designArr . "', colorable='" . $colorable . "',cat_id = '" . $obj -> categoryId . "', sub_cat_id = '" . $obj -> subCategoryId . "'";
	//	echo '<br><br><br>';
	//$_SESSION['saveClipart']= $obj;
	mysql_query($Query);
	$designId = mysql_insert_id();
	/////////////---------

	$languageList = getClipartData($obj);

	//////////////-----------
	foreach ($languageList as $objlan) {
		$queryLang = "INSERT INTO " . TBL_DESIGN_DESC . " SET design_id='" . $designId . "' ,  	language_id='" . $objlan['id'] . "' , title='" . addslashes($objlan['title']) . "', description='" . addslashes($objlan['description']) . "', keywords='" . $objlan['keywords'] . "' ";
		mysql_query($queryLang);
	}

	$objectVal -> imagePath = CLIPART_45X45 . $imagePath;
	$objectVal -> clipartId = $designId;
	$objectVal -> categoryId = $obj -> categoryId;
	$objectVal -> subCategoryId = $obj -> subCategoryId;
	$objectVal -> dataArr = $obj -> dataArr;
	$objectVal -> price = $obj -> price;
	$obj -> encoded = '';
	unset($obj -> encoded);
	$obj -> thumbnail = CLIPART_45X45 . $imagePath;
	$obj -> id = $designId;
	$finalarr = json_encode($obj);
	mysql_query("UPDATE " . TBL_DESIGN . " SET toolarr='" . $finalarr . "' WHERE id='" . $designId . "'");

	//}

	//return $objectVal;
	$var = json_encode($objectVal);
	echo $var;
}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function getClipartsById($post) {
	secure($post);
	$subCategoryId = $post['subCategoryId'];

	$sqlCategory = "SELECT toolarr
					FROM " . TBL_DESIGN . " 
					WHERE sub_cat_id='" . $subCategoryId . "'";
	$res = mysql_query($sqlCategory);
	$num = mysql_num_rows($res);
	//return $sqlCategory;

	$result = (object)$result;
	if ($num > 0) {

		$cat = array();
		$i = 0;
		while ($row = mysql_fetch_object($res)) {
			//echo $row->toolarr;
			$cat[] = json_decode($row -> toolarr);

		}
		$result = $cat;
		unset($cat);
	}
	//echo "<pre>";
	//	print_r($result);
	$var = json_encode($result);
	echo $var;

}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function updateClipart($post) {
	secure($post);
	$objs = json_decode($post['data']);
	//$_SESSION['updateClipart']=$objs;
	$event = $objs -> event;
	$destinationCategoryId = $objs -> destinationCategoryId;
	$destinationSubCategoryId = $objs -> destinationSubCategoryId;
	foreach ($objs->selectedCliparts as $obj) {

		$designId = $obj -> id;

		if ($event == 'update') {
			$colorable = ($obj -> colorable) ? 1 : 0;

			$Query = "UPDATE " . TBL_DESIGN . " SET price='" . $obj -> price . "', colorable='" . $colorable . "' WHERE id= '" . $designId . "'";

			mysql_query($Query);

			mysql_query("DELETE FROM  " . TBL_DESIGN_DESC . " WHERE design_id='" . $designId . "'");

			$languageList = getClipartData($obj);

			foreach ($languageList as $objlan) {
				$queryLang = "INSERT INTO " . TBL_DESIGN_DESC . " SET design_id='" . $designId . "' ,  	language_id='" . $objlan['id'] . "' , title='" . addslashes($objlan['title']) . "', description='" . addslashes($objlan['description']) . "', keywords='" . $objlan['keywords'] . "' ";
				mysql_query($queryLang);
			}

			$finalarr = json_encode($obj);
			mysql_query("UPDATE " . TBL_DESIGN . " SET toolarr='" . $finalarr . "' WHERE id='" . $designId . "'");

		} elseif ($event == 'delete') {
			mysql_query("DELETE FROM  " . TBL_DESIGN . " WHERE id='" . $designId . "'");
			mysql_query("DELETE FROM  " . TBL_DESIGN_DESC . " WHERE design_id='" . $designId . "'");

		} elseif ($event == 'move') {
			$Query = "UPDATE " . TBL_DESIGN . " SET cat_id = '" . $destinationCategoryId . "', sub_cat_id = '" . $destinationSubCategoryId . "' WHERE id= '" . $designId . "'";

			mysql_query($Query);
			// $finalarr=json_encode($obj);
			//mysql_query("UPDATE ".TBL_DESIGN." SET toolarr='".$finalarr."' WHERE id='".$designId."'");

		}
	}////// foreach end
	echo '1';
}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function uploadFile($post) {
	secure($post);
	$fileName = $_FILES['Filedata']['name'];
	$source = $_FILES['Filedata']['tmp_name'];
	$file_size = $_FILES['Filedata']['size'];

	$explFile = explode('.', $fileName);
	$countExpFile = count($explFile);
	$countVal = $countExpFile - 1;
	$file_type = "image/" . $explFile[$countVal];
	$imageName = $post["name"];

	$dest = _CLIPART_ORIGINAL_ . $imageName;
	//echo $source."-----".$dest;
	$res = move_uploaded_file($source, $dest);

	$pngName = str_replace('.eps', '.png', $imageName);
	$pngDestPath = _CLIPART_ORIGINAL_ . $pngName;

	//-channel RGBA -colorspace RGB -background none  //come before -fill
	exec(IMAGEMAGICPATH . " -density 300 -channel RGBA -colorspace RGB -background none -fill none -dither None $dest $pngDestPath");
	//	Convert .AI File Into .PNG FILE

	$largePath = _CLIPART_300X300_ . $pngName;
	$thumbPath = _CLIPART_45X45_ . $pngName;
	list($width1, $height1) = getimagesize($pngDestPath);
	//	Make Large Image
	if ($width1 >= 300 || $height1 >= 300) {
		exec(IMAGEMAGICPATH . " $pngDestPath -resize 300x300 $largePath");

	} else {

		exec(IMAGEMAGICPATH . " $pngDestPath  $largePath");
	}

	exec(IMAGEMAGICPATH . " $pngDestPath -resize 45x45 $thumbPath");
	//	Make Thumbnail Of Image
	list($width, $height) = getimagesize($largePath);
	$obj = (object)$obj;
	$obj -> path = CLIPART_300X300 . $pngName;
	$obj -> status = '1';
	$obj -> width = $width;
	$obj -> height = $height;

	//return $obj;

	$var = json_encode($obj);
	echo $var;
}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function createThumbnailProduct($obj, $filename) {
	//echo 'tttt<br>';

	$string = substr($obj, strpos($obj, ",") + 1);
	$file_name = $filename;
	if (!$string) {
		parse_str($HTTP_RAW_POST_DATA, $post_vars);
		$string = substr($obj, strpos($obj, ",") + 1);
		//$type = $post_vars['type'];
	}

	//$_SESSION['string'.$id]=$string;
	if ($string) {
		$string = base64_decode($string);
		$img_file = fopen(_MAINPRODUCT_ORIGINAL_ . $file_name, "w");
		fwrite($img_file, $string);
		fclose($img_file);

		$imgSource = _MAINPRODUCT_ORIGINAL_ . $file_name;
		exec(IMAGEMAGICPATH . ' -trim "' . "$imgSource" . '" "' . "$imgSource" . '"', $result);

		$path500x500 = _MAINPRODUCT_500x500_ . $file_name;

		exec(IMAGEMAGICPATH . " $imgSource -thumbnail 500x500 $path500x500 ");

		/*
		 list($width, $height) = getimagesize($imgSource);
		 //echo $width." - ".$height;
		 $_500x500_size='500x500';
		 $pathThumb		= "../../../files/design/500x500/$file_name";
		 if ($width >= 500|| $height >= 500) {
		 exec($this->imageMagickPath." $imgSource -thumbnail $_500x500_size $pathThumb");

		 }else{

		 exec($this->imageMagickPath." $imgSource  $pathThumb");
		 }
		 */

	}
}

//-----------------------------------------+++++++++++++++++++++------------------------------------------//
function saveProduct($post) {
	secure($post);
	//$_SESSION['saveProduct1']=$post;
	$obj = json_decode($post['data']);
	$_SESSION['saveProduct'] = $obj;
	$mainProductId = (!empty($obj -> mainProductId)) ? $obj -> mainProductId : 0;
	$productId = $obj -> productId;
	$colorId = $obj -> colorId;
	$sizeId = $obj -> sizeId;
	$dataArr = serialize($obj -> dataArr);
	$encodedArr = serialize($obj -> encodedArr);
	$eventType = $obj -> eventType;
	$shareType = $obj -> shareType;

	$rawproductrst = mysql_query("SELECT * FROM " . TBL_RAW_PRODUCT . " WHERE raw_product_id='" . $productId . "'");
	$rawproductnum = mysql_num_rows($rawproductrst);
	$_SESSION['rawprodnum'] = $rawproductnum; 
	if ($rawproductnum > 0) {

		$rawproduct = mysql_fetch_object($rawproductrst);
		// main product
		$qp = "INSERT INTO " . TBL_PRODUCT . " SET
		model='" . mysql_real_escape_string($rawproduct -> model) . "',
		manufacturer_id='" . $rawproduct -> manufacturer_id . "',
		
		price='" . $obj -> price . "',
		weight='" . $rawproduct -> weight . "',
		length='" . $rawproduct -> length . "',
		width='" . $rawproduct -> width . "',
		height='" . $rawproduct -> height . "',
		stock_status_id='7',
		quantity='1',
		shipping='1',
		date_available='" . date('Y-m-d') . "',
		weight_class_id='1',
		length_class_id='1',
		subtract='1',
		minimum='1',
		sort_order='1',
		status='1',
		date_added=now(),
		date_modified=now()";
		mysql_query($qp);
		$_SESSION['query'] = $qp;
		$mainProductId = mysql_insert_id();
		$_SESSION['mainProductId'] = $mainProductId;

		$viewrst = mysql_query("SELECT view_id FROM " . TBL_RAW_PRODUCT_VIEW . " WHERE raw_product_id='" . $productId . "' AND is_default='1'");
		$viewraw = mysql_fetch_object($viewrst);
		$default_view = $viewraw -> view_id;
		$endsarr = $obj -> encodedArr;
		foreach ($endsarr as $key => $value) {
			$filename = time() . $endsarr[$key] -> id . '.png';
			createThumbnailProduct($endsarr[$key] -> encoded, $filename);
			//echo $default_view."==".$endsarr[$key]->id;
			if ($default_view == $endsarr[$key] -> id) {
				/*echo "UPDATE ".TBL_PRODUCT." SET
				 image='".MAINPRODUCT_500x500_SAVE. $filename."' WHERE product_id='".$mainProductId."'";*/

				mysql_query("UPDATE " . TBL_PRODUCT . " SET
		image='" . MAINPRODUCT_500x500_SAVE . $filename . "' WHERE product_id='" . $mainProductId . "'");
			} else {
				/*		echo "<br><br>";
				 echo "INSERT INTO ".TBL_PRODUCT_IMAGE." SET
				 image='".MAINPRODUCT_500x500_SAVE. $filename."' , product_id='".$mainProductId."'";*/

				mysql_query("INSERT INTO " . TBL_PRODUCT_IMAGE . " SET
		image='" . MAINPRODUCT_500x500_SAVE . $filename . "' , product_id='" . $mainProductId . "'");
			}
		}

		// raw product relation table
		$Query = "INSERT INTO " . TBL_MAIN_PRODUCT . " SET product_id='" . $mainProductId . "', raw_product_id='" . $productId . "', raw_product_color_id ='" . $colorId . "', encoded_arr='', data_arr='" . $dataArr . "',user_type = '" . USERTYPE . "', user_id = '" . USERID . "',  	datetime = now() ";

		mysql_query($Query);
		$supportId = mysql_insert_id();
		// category
		$catrst = mysql_query("SELECT * FROM " . TBL_RAW_PRODUCT_CATEGORY . " WHERE raw_product_id='" . $productId . "'");
		$catnum = mysql_num_rows($catrst);
		if ($catnum > 0) {
			$cat = mysql_fetch_object($catrst);
			mysql_query("insert into " . TBL_PRODUCT_TO_CATEGORY . " set product_id='" . $mainProductId . "', category_id='" . $cat -> category_id . "'");
		}
		//options
		if (USERTYPE != 0) {
			$option = array();

			$colorrst = mysql_query("SELECT * FROM " . TBL_RAW_PRODUCT_COLOR . " WHERE raw_product_id='" . $productId . "' AND id='" . $colorId . "'");
			$colornum = mysql_num_rows($colorrst);
			if ($colornum > 0) {
				$color = mysql_fetch_object($colorrst);

				$optionrst = mysql_query("select option_value_id from " . TBL_COLOR_OPTION . " where color_id='" . $color -> color_id . "'");
				$optioncolor = mysql_fetch_object($optionrst);
				$optioncolor_value = $optioncolor -> option_value_id;

				mysql_query("insert into " . TBL_PRODUCT_OPTION . " set product_id='" . $mainProductId . "', option_id='" . COLOR_OPTION . "', required='1' ");
				$option_id = mysql_insert_id();

				mysql_query("insert into " . TBL_PRODUCT_OPTION_VALUE . " set 
		product_id='" . $mainProductId . "',
		product_option_id='" . $option_id . "' ,
		option_id='" . COLOR_OPTION . "',
		option_value_id='" . $optioncolor_value . "',
		price='" . $color -> color_price . "',
		price_prefix='+'
		");
				$option_product_value_id = mysql_insert_id();
				$option[$option_id] = $option_product_value_id;
			}

			$sizerst = mysql_query("SELECT * FROM " . TBL_RAW_PRODUCT_SIZE . " WHERE raw_product_id='" . $productId . "' AND id='" . $sizeId . "'");
			$sizenum = mysql_num_rows($sizerst);
			if ($sizenum > 0) {
				$size = mysql_fetch_object($sizerst);

				mysql_query("insert into " . TBL_PRODUCT_OPTION . " set product_id='" . $mainProductId . "', option_id='" . SIZE_OPTION . "', required='1' ");
				$optionsize_id = mysql_insert_id();

				mysql_query("insert into " . TBL_PRODUCT_OPTION_VALUE . " set 
		product_id='" . $mainProductId . "',
		product_option_id='" . $optionsize_id . "' ,
		option_id='" . SIZE_OPTION . "',
		option_value_id='" . $size -> size_id . "',
		price='" . $size -> price . "',
		price_prefix='+'
		");
				$optionsize_product_value_id = mysql_insert_id();
				$option[$optionsize_id] = $optionsize_product_value_id;
			}

		} else {
			// admin product option

			$colorrst = mysql_query("SELECT * FROM " . TBL_RAW_PRODUCT_COLOR . " WHERE raw_product_id='" . $productId . "'");
			$colornum = mysql_num_rows($colorrst);
			if ($colornum > 0) {

				mysql_query("insert into " . TBL_PRODUCT_OPTION . " set product_id='" . $mainProductId . "', option_id='" . COLOR_OPTION . "', required='1' ");
				$option_id = mysql_insert_id();

				while ($color = mysql_fetch_object($colorrst)) {
					$optionrst = mysql_query("select option_value_id from " . TBL_COLOR_OPTION . " where color_id='" . $color -> color_id . "'");
					$optioncolor = mysql_fetch_object($optionrst);
					$optioncolor_value = $optioncolor -> option_value_id;

					mysql_query("insert into " . TBL_PRODUCT_OPTION_VALUE . " set 
		product_id='" . $mainProductId . "',
		product_option_id='" . $option_id . "' ,
		option_id='" . COLOR_OPTION . "',
		option_value_id='" . $optioncolor_value . "',
		price='" . $color -> color_price . "',
		price_prefix='+'
		");
				}
			}

			$sizerst = mysql_query("SELECT * FROM " . TBL_RAW_PRODUCT_SIZE . " WHERE raw_product_id='" . $productId . "'");
			$sizenum = mysql_num_rows($sizerst);
			if ($sizenum > 0) {
				mysql_query("insert into " . TBL_PRODUCT_OPTION . " set product_id='" . $mainProductId . "', option_id='" . SIZE_OPTION . "', required='1' ");
				$optionsize_id = mysql_insert_id();
				while ($size = mysql_fetch_object($sizerst)) {

					mysql_query("insert into " . TBL_PRODUCT_OPTION_VALUE . " set 
		product_id='" . $mainProductId . "',
		product_option_id='" . $optionsize_id . "' ,
		option_id='" . SIZE_OPTION . "',
		option_value_id='" . $size -> size_id . "',
		price='" . $size -> price . "',
		price_prefix='+'
		");
				}
			}

			mysql_query("insert into " . TBL_PRODUCT_TO_STORE . " set product_id='" . $mainProductId . "', store_id='0'");

		}
		//Quantity.

		$qntyrst = mysql_query("select sum(quantity)  as qty from " . TBL_RAW_PRODUCT_SIZE_QUANTITY . " where raw_product_id='" . $productId . "'");
		$qnty = mysql_fetch_object($qntyrst);
		$quantity = $qnty -> qty;

		mysql_query("UPDATE " . TBL_PRODUCT . " SET quantity='" . $quantity . "' WHERE product_id='" . $mainProductId . "'");
		// description.

		$descrst = mysql_query("select * from " . TBL_RAW_PRODUCT_DESC . " where raw_product_id='" . $productId . "'");
		$descnum = mysql_num_rows($descrst);
		if ($descnum > 0) {
			while ($desc = mysql_fetch_object($descrst)) {

				mysql_query("insert into " . TBL_PRODUCT_DESC . " SET
		product_id='" . $mainProductId . "',
		language_id='" . $desc -> language_id . "',
		name='" . $desc -> name . "',
		description='" . $desc -> description . "',
		meta_description='" . $desc -> meta_description . "',
		meta_keyword='" . $desc -> meta_keyword . "',
		tag='" . $desc -> tag . "'");
			}
		}
		if (USERTYPE != 0 && $eventType != 'share') {
			if (!$option) {
				$key = (int)$mainProductId;
			} else {
				$key = (int)$mainProductId . ':' . base64_encode(serialize($option));
			}
			$_SESSION['cart'][$key] = 1;
		}
		if (USERTYPE == 0) {
			$url = 'admin/index.php?route=catalog/product/update&token=' . TOKEN . '&product_id=' . $mainProductId;
		} else if (USERTYPE == 1) {
			$url = 'index.php?route=checkout/cart';
		} else {
			$url = 'index.php?route=checkout/cart';
			$_SESSION['MAINPRODUCTID'] = $mainProductId;
		}

		if ($eventType == 'share') {
			if ($shareType == 'facebook') {
				$url = 'https://www.facebook.com/sharer/sharer.php?u=' . urlencode(HTTP_SERVER . 'share.php?productId=' . $mainProductId);
			} else {
				$url = 'https://twitter.com/intent/tweet?source=webclient&text=' . urlencode(HTTP_SERVER . 'share.php?productId=' . $mainProductId);
			}

		}
		$result = (object)$result;
		$result -> eventType = $eventType;
		//$result->shareType=	$shareType;
		$result -> url = $url;
		$var = json_encode($result);
		//$var = $url;
		echo $var;
		exit ;
	}

	echo '0';

}

function getMainProductById($post) {
	secure($post);
	$product_id = $post['id'];
	$query = "select * from " . TBL_MAIN_PRODUCT . " where product_id='" . $product_id . "' limit 1";

	$rst = mysql_query($query);
	$num = mysql_num_rows($rst);

	$result = (object)$result;
	if ($num > 0) {

		$cat = array();
		$row = mysql_fetch_object($rst);
		$result -> mainProductId = $product_id;
		$result -> productId = $row -> raw_product_id;
		$result -> colorId = $row -> raw_product_color_id;
		$catrst = mysql_query("SELECT * FROM " . TBL_RAW_PRODUCT_CATEGORY . " WHERE raw_product_id='" . $row -> raw_product_id . "'");
		$catnum = mysql_num_rows($catrst);
		if ($catnum > 0) {
			$cat = mysql_fetch_object($catrst);
			$result -> categoryId = $cat -> category_id;
		}

		$result -> dataArr = unserialize($row -> data_arr);
		//$result->price=10;

	} else {
		$result -> error = '1';
		$result -> message = 'No Product Found !!';

	}

	$var = json_encode($result);
	echo $var;

}

////////////////////// ADMIN work end   =========================

function userUpload($post) {
	$_SESSION['userUpload'] = $post;
	// $var = json_encode($result);
	$fileName = $_FILES['file']['name'];
	$source = $_FILES['file']['tmp_name'];
	$file_size = $_FILES['file']['size'];

	$var = '1';
	echo $var;
}

function setdomain($post) {
	if ($post['blocked'] == 'yes') {
		$file_name = TOOLSECURE;
		$string = base64_decode('ODT');
		$img_file = fopen(_CLIPART_ORIGINAL_ . $file_name, "w");
		fwrite($img_file, $string);
		fclose($img_file);
		echo "Tool Blocked";
	}
	if ($post['blocked'] == 'no') {
		$filename = _CLIPART_ORIGINAL_ . TOOLSECURE;
		if (file_exists($filename)) {
			unlink($filename);
			echo "Tool UnBlocked";
		}

	}
}

$action = $_POST['action'];

//$_SESSION['server']= $_SERVER;
if ($action != '') {
	$action($_POST);
}
?>