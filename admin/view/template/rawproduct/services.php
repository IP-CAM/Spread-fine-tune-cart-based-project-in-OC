<?php
//error_reporting(E_ALL);
error_reporting(0);
if (file_exists('config.php')) {
	require_once('config.php');
}  
// connect code start ----------------------

$con= mysql_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD) or die("Cannot connect to MySQL" . mysql_error());
mysql_select_db(DB_DATABASE) or die(mysql_error());
mysql_query('SET NAMES utf8');

// connect code end ----------------------
// table consant start--------------------
define('PREFIX','oc_');
define('LANG_ID',1);
define('TBL_CATEGORY',PREFIX.'category');
define('TBL_CATEGORY_DESC',PREFIX.'category_description');

define('TBL_RAW_PRODUCT',PREFIX.'raw_product');
define('TBL_RAW_PRODUCT_CATEGORY',PREFIX.'raw_product_category');
define('TBL_RAW_PRODUCT_COLOR',PREFIX.'raw_product_color');
define('TBL_RAW_PRODUCT_SIZE_QUANTITY',PREFIX.'raw_product_color_size_quantity');
define('TBL_RAW_PRODUCT_COLOR_VIEW',PREFIX.'raw_product_color_view');
define('TBL_RAW_PRODUCT_VIEW',PREFIX.'raw_product_view');
define('TBL_RAW_PRODUCT_DESC',PREFIX.'raw_product_description');
define('TBL_RAW_PRODUCT_SIZE',PREFIX.'raw_product_size');

define('TBL_COLOR',PREFIX.'color');
define('TBL_COLOR_OPTION',PREFIX.'color_option');

define('TBL_OPTION',PREFIX.'option');
define('TBL_OPTION_DESC',PREFIX.'option_description');
define('TBL_OPTION_VALUE',PREFIX.'option_value');
define('TBL_OPTION_VALUE_DESC',PREFIX.'option_value_description');

define('TBL_FONT',PREFIX.'font');
define('TBL_FONT_VALUE',PREFIX.'font_value');

// table consant END--------------------

function getproducts($cat_id=''){
		$result1 = (object) $result1;
		
		
		$prod = array();
		
		 $query='select pc.category_id,p.raw_product_id,p.image,pd.name,pd.description from '.TBL_RAW_PRODUCT_CATEGORY.' as pc inner join '.TBL_RAW_PRODUCT.' as p on p.raw_product_id=pc.raw_product_id  inner join '.TBL_RAW_PRODUCT_DESC.' as pd on pd.raw_product_id=pc.raw_product_id where  pc.category_id="'.$cat_id.'" AND p.status="1" AND p.is_deleted="0"  AND  pd.language_id="'.LANG_ID.'" ';
	$rst=mysql_query($query);
	$num=mysql_num_rows($rst);
	
	$result = (object) $result;
	if($num>0)
	{
		
		$prod = array();
		$i=0;
		while($row = mysql_fetch_object($rst))
		{
			
			$obj = (object) $obj;
			if($i==0){
		$result1->default=$row->raw_product_id;
			}
		$obj->id=$row->raw_product_id;
		$obj->name=$row->name;
		$obj->description=$row->description;
		$obj->source=RAWPRODUCT_41x41.$row->image;
		$prod[] = $obj;
		unset($obj);
			
			$i++;
			}
			$result1->products=$prod;
	}
/*   	echo "<pre>";
		print_r($result1);*/
		return $result1; 
	}

function getProductCategories($post){
    
	 $query='select c.category_id,cd.name,cd.description from '.TBL_CATEGORY.' as c left join '.TBL_CATEGORY_DESC.' as cd on cd.category_id=c.category_id where cd.language_id="'.LANG_ID.'" and c.parent_id="0" order by c.sort_order ';
	$rst=mysql_query($query);
	$num=mysql_num_rows($rst);
	
	$result = (object) $result;
	if($num>0)
	{
		
		$cat = array();
		$i=0;
		while($row = mysql_fetch_object($rst))
		{
			if($i==0){
			$result->default=$row->category_id;
			$i++;
				}
			$obj = (object) $obj;
			
			$obj->id=$row->category_id;
			$obj->name=$row->name;
			//$obj->description=strip_tags($row->description);
			$obj->productData=getproducts($row->category_id);
			$cat[] = $obj;
			unset($obj);
		}
		$result->category=$cat ;
		}
//   	echo "<pre>";
//		print_r($result);
	$var = json_encode($result);
	echo $var;
	/*$callback = $_POST["callback"];
   echo $callback . "(" . $var. ")";*/

	}
	
	function dummyarea($i){
	 	    $prod= array();
	    $obj = (object) $obj;
		$obj->id=$i.'1';
		$obj->x=0 + 150*$i;
		$obj->y=0 + 150*$i;
		$obj->width=150;
		$obj->height=150;
		$prod[] = $obj;
		unset($obj);
		
		$obj = (object) $obj;
		$obj->id=$i.'2';
		$obj->x=150 + 150*$i;
		$obj->y=150 + 150*$i;
		$obj->width=150;
		$obj->height=150;
		$prod[] = $obj;
		unset($obj);
		
		
		return $prod;
	}

function getProductColorViews($raw_product_id,$raw_product_color_id){
		
	
	 $query='select pv.*,ovd.name from  '.TBL_RAW_PRODUCT_COLOR_VIEW.' as pv left join '.TBL_OPTION_VALUE_DESC.' as ovd on ovd.option_value_id =pv.view_id where  pv.raw_product_id="'.$raw_product_id.'" AND pv.raw_product_color_id="'.$raw_product_color_id.'" AND  ovd.language_id="'.LANG_ID.'" ';
	$rst=mysql_query($query);
	$num=mysql_num_rows($rst);
	
	//$resultview = (object) $resultview;
	if($num>0)
	{
		
	
		$view=array();
		while($row = mysql_fetch_object($rst))
		{
			

			$objview = (object) $objview;
	/*		if($row->is_default==1){
		$resultview->default=$row->id;
			}*/
						
		$objview->id=$row->id;
	
		$objview->viewId=$row->view_id;
		
		//$objview->title=$row->name;
	   // $objview->price=$row->price; 
		$objview->thumbnail=RAWPRODUCT_41x41.$row->image;
		$objview->url=RAWPRODUCTORIGINAL.$row->image;
		//$objview->designAreas=dummyarea();
		
			$view[]= $objview;

		unset($objview);
		
			}
	 // $resultview->view =$view;
		
	}
		//print_r($resultview);
		return $view;
		}
	

function getProductColors($raw_product_id){
		
	
	$query='select pc.*,c.name from '.TBL_RAW_PRODUCT_COLOR.' as pc left join '.TBL_COLOR.' as c on c.color_id=pc.color_id where  pc.raw_product_id="'.$raw_product_id.'" AND pc.status="1"';
	$rst=mysql_query($query);
	$num=mysql_num_rows($rst);
	
	$resultcolor = (object) $resultcolor;
	if($num>0)
	{
		
	
		$color=array();
		while($row = mysql_fetch_object($rst))
		{
			
			$objcolor = (object) $objcolor;
			if($row->is_default==1){
		$resultcolor->default=$row->id;
			}
		$objcolor->id=$row->id;
		$objcolor->colorId=$row->color_id;
		$objcolor->hexValue=trim($row->color_code);
		$objcolor->price=$row->color_price;
		$objcolor->title=$row->name;
		$objcolor->views=getProductColorViews($raw_product_id,$row->id);
		$color[] = $objcolor;
		unset($objcolor);
		
			}
	  $resultcolor->color=$color;
		
	}
		
	return $resultcolor;
		}
		
function getProductSizes($raw_product_id){
		
	
	 $query='select ps.*,ovd.name  from '.TBL_RAW_PRODUCT_SIZE.' as ps left join '.TBL_OPTION_VALUE_DESC.' as ovd on ovd.option_value_id =ps.size_id where  ps.raw_product_id="'.$raw_product_id.'" AND  ovd.language_id="'.LANG_ID.'" ';
	$rst=mysql_query($query);
	$num=mysql_num_rows($rst);
	
	$resultsize = (object) $resultsize;
	if($num>0)
	{
		
	
		$i=0;
		$size=array();
		while($row = mysql_fetch_object($rst))
		{
			
			$objsize = (object) $objsize;
			if($i==0){
		$resultsize->default=$row->id;
			}
		$objsize->id=$row->id;
		$objsize->sizeId=$row->size_id;
		$objsize->price=$row->price;
		$objsize->title=$row->name;
		
		$size[]= $objsize;
		unset($objsize);
		$i++;
			}
			$resultsize->size =$size; 
		
	}
		
		return $resultsize;
		}		

function getProductViews($raw_product_id){
		
	
	 $query='select ps.*,ovd.name  from '.TBL_RAW_PRODUCT_VIEW.' as ps left join '.TBL_OPTION_VALUE_DESC.' as ovd on ovd.option_value_id =ps.view_id where  ps.raw_product_id="'.$raw_product_id.'" AND  ovd.language_id="'.LANG_ID.'" ';
	$rst=mysql_query($query);
	$num=mysql_num_rows($rst);

	$resultsize = (object) $resultsize;
	if($num>0)
	{
		
	
		$i=0;
		$size=array();
		while($row = mysql_fetch_object($rst))
		{
			
			$objsize = (object) $objsize;
			if($row->is_default==1){
		$resultsize->default=$row->view_id;
			}
		
		$objsize->id=$row->view_id;
		$objsize->price=$row->price;
		$objsize->title=$row->name;
		$objsize->designAreas=dummyarea($i);
		$size[]= $objsize;
		unset($objsize);
		$i++;
			}
			$resultsize->view =$size; 
		
	}
		
		return $resultsize;
		}
function getProductById($post){
		$raw_product_id=$post['productId'];
	$query='select p.*,pd.name,pd.description from  '.TBL_RAW_PRODUCT.' as p left join '.TBL_RAW_PRODUCT_DESC.' as pd on pd.raw_product_id=p.raw_product_id where  p.raw_product_id="'.$raw_product_id.'" AND p.status="1" AND p.is_deleted="0" AND  pd.language_id="'.LANG_ID.'" ';
	$rst=mysql_query($query);
	$num=mysql_num_rows($rst);
	
	$result = (object) $result;
	if($num>0)
	{
		$row=mysql_fetch_object($rst);
		$result->id =$row->raw_product_id;
		$result->title =$row->name;
		$result->description =$row->description;
		$result->colors=getProductColors($raw_product_id);
		$result->sizes=getProductSizes($raw_product_id);
		$result->views=getProductViews($raw_product_id);
		}
/*   	echo "<pre>";
    print_r($result);*/
	$var = json_encode($result);
	echo $var;	
		}
		
function getFonts($post){
	
	
		
	
	  $query='select *  from '.TBL_FONT.' where 1';
	$rst=mysql_query($query);
	$num=mysql_num_rows($rst);

	$fonts = (object) $fonts;
	if($num>0)
	{
		
	
		
		$font=array();
		while($row = mysql_fetch_object($rst))
		{
			
			$objfont = (object) $objfont;
			if($row->is_default==1){
		$fonts->default=$row->font_id;
			}
		
		$objfont->id=$row->font_id;
	    $objfont->title=$row->name;
		$objfont->image=FONTPATH.$row->image;
		$querysub='select  	font_type, 	font_value_id  from '.TBL_FONT_VALUE.' where 1 and font_id="'.$row->font_id.'"';
		
		$rstsub=mysql_query($querysub);
		$numsub=mysql_num_rows($rstsub);
		if($numsub>0)
		{
		while($rowsub = mysql_fetch_object($rstsub))
		{
			$objfont->normal=($rowsub->font_type=='normal')?1:0;
			$objfont->bold=($rowsub->font_type=='bold')?1:0;
			$objfont->italic=($rowsub->font_type=='italic')?1:0;
			//$objfont->underLine=($rowsub->font_type=='underLine')?1:0;
			$objfont->boldItalic=($rowsub->font_type=='boldI')?1:0;
		}
		}
		$font[]= $objfont;
		unset($objfont);
	
			}
			$fonts->fonts =$font; 
		
	}
	
		$var = json_encode($fonts);
	    echo $var;
		
	
	
	}			
		
function generateImage($post){
	
	
	
	    $font = '';
		$boldtype = $_POST['bold'];
		$italictype = $_POST['italic'];
	
		if ($boldtype == '1' && $italictype == '1')
		$cond = 'boldI';
		elseif ($boldtype == '1')
		$cond = 'bold';
		elseif ($italictype == '1')
		$cond = 'italic';
		else
		$cond='normal';
       $query = 'select font_ttf  from '.TBL_FONT_VALUE.' where 1 and font_id="'.$post['id'].'" and font_type 	="'.$cond.'"';
       $fontArr = mysql_fetch_object(mysql_query($query));
	   $font = DIR_WEBROOT. $fontArr->font_ttf;
	
	  
		$w = 400;
		$h = 400;
		$color='#FF0000';
		$label=$post['text'];
		$arctype=1;
		$angle=180;
		$degree=($arctype==1)?0:180;
		//$font=DIR_WEBROOT.'2013041903235313663598331171412095.ttf';
        $image=time().'.png';     
	  exec(IMAGEMAGICPATH.' -background transparent -depth 8 -font "'.$font.'" -gravity "center" -fill "'.$color.'" -size "'.$w.'"x"'.$h.'"! label:"'.$label.'" -rotate 0 -distort Arc "'.$angle.' '.$degree.'" -trim "'._GENIMG_.'/'.$image.'"');
	  
	  echo 'data:image/png;base64,'.base64_encode(file_get_contents(GENIMG.$image));
     // @unlink(_GENIMG_.$image);
	
	}		
	
$action=$_POST['action'];
;
 
if($action!='')
{
	$action($_POST);
}
?>