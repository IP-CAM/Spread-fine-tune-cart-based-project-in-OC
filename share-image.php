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
$productId=$_GET['productId'];
$query='SELECT p . * , pd . *
FROM '. DB_PREFIX .'product AS p
LEFT JOIN '. DB_PREFIX .'product_description AS pd ON pd.product_id = p.product_id
WHERE p.`product_id` ="'.$productId.'"';
	
	$rst=mysql_query($query);
	$num=mysql_num_rows($rst);
	$row=mysql_fetch_object($rst);


$sqlurl = "SELECT user_type FROM ". DB_PREFIX ."main_product where product_id='".$product_id."'";
	$rsturl=mysql_query($sqlurl);
	$numurl=mysql_num_rows($rsturl);
		if ($numurl) {
	$rowurl=mysql_fetch_object($rsturl);
		
		$httpurl=HTTP_SERVER.'index.php?route=designer/product&mainProductId='.$productId;
		
		   }else{
			 $httpurl=HTTP_SERVER.'index.php?route=product/product&product_id='.$productId;	
			   }
	//https://twitter.com/intent/session?original_referer=http%3A%2F%2Fwww.condocio.com%2Fcustomize&return_to=%2Fintent%2Ftweet%3Fsource%3Dwebclient%26text%3Dhttp%253A%252F%252Fwww.condocio.com%252Ftwitter-share.php%253Ft%253DTWVuJ3MgQ2xhc3NpYyBKZXJzZXkgVC1TaGlydA%253D%253D%2526i%253DMjAxMjEwMjcxMjA5MTAxMzUxMjg5MzUwMTczMTcwMjExMi5wbmc%253D%2526productId%253DNTc1NQ%253D%253D&source=webclient&text=http%3A%2F%2Fwww.condocio.com%2Ftwitter-share.php%3Ft%3DTWVuJ3MgQ2xhc3NpYyBKZXJzZXkgVC1TaGlydA%3D%3D%26i%3DMjAxMjEwMjcxMjA5MTAxMzUxMjg5MzUwMTczMTcwMjExMi5wbmc%3D%26productId%3DNTc1NQ%3D%3D	  
	 $img=explode('/',$row->image);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><?=$row->name;?></title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="title" content="<?=$row->name;?>" />
	<meta name='og:description' content='<?=$row->description;?>' />
	<!--<meta http-equiv="refresh" content="1;URL=<?php echo $httpurl; ?>" />-->
	<link rel="image_src" type="image/png" href="<?php echo HTTP_SERVER.'image/'.$row->image;?>" />
</head>
<body>
	<p >
	<img src="<?php echo HTTP_SERVER.'webroot/mainproduct/original/'.end($img);?>" border="0" alt=""/>
	</p>
</body>
</html>
