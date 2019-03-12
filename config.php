<?php
/*echo "<pre>";
print_r($_SERVER);
echo "</pre>";
*/
// HTTP
define('HTTP_SERVER', 'http://inkfi.com/demo/spreadshirt/');

// HTTPS
define('HTTPS_SERVER', 'http://inkfi.com/demo/spreadshirt/');

// DIR
define('DIR_APPLICATION', '/home/inkficom/public_html/demo/spreadshirt/catalog/');
define('DIR_SYSTEM', '/home/inkficom/public_html/demo/spreadshirt/system/');
define('DIR_DATABASE', '/home/inkficom/public_html/demo/spreadshirt/system/database/');
define('DIR_LANGUAGE', '/home/inkficom/public_html/demo/spreadshirt/catalog/language/');
define('DIR_TEMPLATE', '/home/inkficom/public_html/demo/spreadshirt/catalog/view/theme/');
define('DIR_CONFIG', '/home/inkficom/public_html/demo/spreadshirt/system/config/');
define('DIR_CACHE', '/home/inkficom/public_html/demo/spreadshirt/system/cache/');
define('DIR_DOWNLOAD', '/home/inkficom/public_html/demo/spreadshirt/download/');
define('DIR_LOGS', '/home/inkficom/public_html/demo/spreadshirt/system/logs/');

// DB
define('DB_DRIVER', 'mysql');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'inkficom_demo');
define('DB_PASSWORD', 'demo123');
define('DB_DATABASE', 'inkficom_jstool');
define('DB_PREFIX', 'oc_');
/////////////////// ODT //////////////////////
define('DIR_WEBROOT', '/home/inkficom/public_html/demo/spreadshirt/webroot/');
define('DIR_IMAGE', '/home/inkficom/public_html/demo/spreadshirt/image/');
define('HTTP_WEBROOT', 'webroot/');//HTTP_SERVER.
define('HTTP_IMAGE', 'image/');//HTTP_SERVER.
define('IMAGEMAGICPATH', "/usr/local/bin/convert");


define('_FONTORIGINAL_',DIR_WEBROOT."font/original/");
define('_FONTTTF_',DIR_WEBROOT."font/ttf/");
define('FONTPATH',HTTP_WEBROOT."font/original/");
// raw product
define('_RAWPRODUCTORIGINAL_',DIR_WEBROOT."product/original/");
define('_RAWPRODUCT_41x41_',DIR_WEBROOT."product/41x41/");
define('_RAWPRODUCT_500x500_',DIR_WEBROOT."product/500x500/");
define('_RAWPRODUCTTHUMB_',DIR_WEBROOT."product/thumb/");

define('RAWPRODUCTORIGINAL',HTTP_WEBROOT."product/original/");
define('RAWPRODUCT_41x41',HTTP_WEBROOT."product/41x41/");
define('RAWPRODUCT_500x500',HTTP_WEBROOT."product/500x500/");
define('RAWPRODUCTTHUMB',HTTP_WEBROOT."product/thumb/");

define('_GENIMG_',DIR_WEBROOT."genimg/");
define('GENIMG',HTTP_WEBROOT."genimg/");

define('_CLIPART_ORIGINAL_',DIR_WEBROOT."clipart/original/");
define('_CLIPART_300X300_',DIR_WEBROOT."clipart/300x300/");
define('_CLIPART_45X45_',DIR_WEBROOT."clipart/45x45/");

define('CLIPART_ORIGINAL',HTTP_WEBROOT."clipart/original/");
define('CLIPART_45X45',HTTP_WEBROOT."clipart/45x45/");
define('CLIPART_300X300',HTTP_WEBROOT."clipart/300x300/");

define('_MAINPRODUCT_ORIGINAL_',DIR_WEBROOT."mainproduct/original/");
define('_MAINPRODUCT_500x500_',DIR_IMAGE."data/product/");


define('MAINPRODUCT_ORIGINAL',HTTP_WEBROOT."mainproduct/original/");
define('MAINPRODUCT_500x500',HTTP_IMAGE."data/product/");
define('MAINPRODUCT_500x500_SAVE',"data/product/");

define('_USERUPLOAD_ORIGINAL_',DIR_WEBROOT."userupload/original/");
define('_USERUPLOAD_300x300_',DIR_WEBROOT."userupload/300x300/");
define('_USERUPLOAD_45x45_',DIR_WEBROOT."userupload/45x45/");

define('USERUPLOAD_ORIGINAL',HTTP_WEBROOT."userupload/original/");
define('USERUPLOAD_300x300',HTTP_WEBROOT."userupload/300x300/");
define('USERUPLOAD_45x45',HTTP_WEBROOT."userupload/45x45/");

?>