<?php
session_start();
//error_reporting(E_ALL);
error_reporting(0);
if (file_exists('config.php')) {
	require_once('config.php');
}  
// connect code start ----------------------

$con= mysql_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD) or die("Cannot connect to MySQL" . mysql_error());
mysql_select_db(DB_DATABASE) or die(mysql_error());
mysql_query('SET NAMES utf8');
$_SESSION['datas1']=$_POST;
$_SESSION['datas2']=$_REQUEST;
$_SESSION['datasss']=$_POST['images']['name'];;
$_SESSION['datas']=$_FILES;


function get_ext($file)
{
	$x = explode('.',$file);
	$ext = strtolower($x[count($x)-1]);
	
	if($ext =='png' || $ext =='jpg' || $ext =='jpeg' || $ext =='tiff' || $ext =='bmp')
	{
		return true;
	}
	else{
	return false;
	}
}


$fileName	 = $_FILES['images']['name'];
$fileName = str_replace( ' ', '', $fileName );
$source      = $_FILES['images']['tmp_name'];
$file_size	 = $_FILES['images']['size'];

$explFile 		= explode('.',$fileName);
$countExpFile 	= count($explFile);
$countVal 		= $countExpFile-1;
$file_type 		= "image/".$explFile[$countVal];
$imageName		= time().'.'.$explFile[$countVal];

$dest = _USERUPLOAD_ORIGINAL_.$imageName;
if(get_ext($fileName)==false)
{
	$objs=array();
	$objs[0]=(object) $objs[0];
	$objs[0]->url='';
	$objs[0]->color='';
	$obj = (object) $obj;
	$obj->id='';
	$obj->price=0;
	$obj->thumbnail='';
	$obj->title=$fileName;
	$obj->description='';
	$obj->images=$objs;
	$obj->colorable=0;
	$obj->imagetype='';
	$var = json_encode($obj);
	echo $var;
	return;
}
$res  = move_uploaded_file($source,$dest);

$pngName 	 = str_replace('.eps' , '.png' , $imageName);

$pngDestPath = _USERUPLOAD_ORIGINAL_.$pngName;

//-channel RGBA -colorspace RGB -background none
exec(IMAGEMAGICPATH." -density 300  -fill none -dither None $dest $pngDestPath"); // Convert .AI File Into .PNG FILE


$largePath = _USERUPLOAD_300x300_.$pngName;
$image45x45 = _USERUPLOAD_45x45_.$pngName;
list($width1, $height1) = getimagesize($pngDestPath);
 // Make Large Image
      if ($width1 >= 300|| $height1 >= 300) {
                exec(IMAGEMAGICPATH." $pngDestPath -resize 300x300 $largePath");

                }else{

              exec(IMAGEMAGICPATH." $pngDestPath  $largePath");
                }
		   exec(IMAGEMAGICPATH." $pngDestPath -resize 45x45 $image45x45");		

$user_id_ip=(!empty($_SESSION['customer_id']))?$_SESSION['customer_id']:$_SERVER['REMOTE_ADDR'];
 $query='INSERT INTO  oc_user_image SET
       user_id_ip= "'.$user_id_ip.'",
	   image=  "'.$pngName.'" ';
	$rst=mysql_query($query);
	$id=mysql_insert_id();
	$objs=array();
	$objs[0]=(object) $objs[0];
	$objs[0]->url=USERUPLOAD_300x300.$pngName;
	$objs[0]->color='#000000';
$obj = (object) $obj;
$obj->id=$id;
$obj->price=0;
$obj->thumbnail=USERUPLOAD_45x45.$pngName;
$obj->title='';
$obj->description='';
$obj->images=$objs;
$obj->colorable=0;
$obj->imagetype='image';
$var = json_encode($obj);
echo $var;
?>