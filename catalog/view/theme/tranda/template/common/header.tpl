<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<!-- CSS // Font Awesome -->
<link rel="stylesheet" type="text/css" href="<?php echo $base; ?>catalog/view/tranda_root/fontawesome/css/font-awesome.css" media="all" />
<!-- CSS // Font Awesome -->
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta name="author" content="www.theme-opencart.com">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<!-- .TRANDA THEME -->
<link href="http://fonts.googleapis.com/css?family=Dosis:300,500&subset=latin,latin-ext" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/stylesheet/tranda_stylesheet.css" media="all" />
<?php if($this->config->get('tranda_set_skin') == '') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/stylesheet/skin/tranda_summer.css" media="all" />
<?php } else { ?>
<?php if($this->config->get('tranda_set_skin') == '1') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/stylesheet/skin/tranda_autumn.css" media="all" />
<?php } ?>
<?php if($this->config->get('tranda_set_skin') == '2') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/stylesheet/skin/tranda_racing.css" media="all" />
<?php } ?>
<?php if($this->config->get('tranda_set_skin') == '3') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/stylesheet/skin/tranda_social.css" media="all" />
<?php } ?>
<?php if($this->config->get('tranda_set_skin') == '4') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/stylesheet/skin/tranda_spring.css" media="all" />
<?php } ?>
<?php if($this->config->get('tranda_set_skin') == '5') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/stylesheet/skin/tranda_summer.css" media="all" />
<?php } ?>
<?php if($this->config->get('tranda_set_skin') == '6') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/stylesheet/skin/tranda_winter.css" media="all" />
<?php } ?>
<?php if($this->config->get('tranda_set_skin') == '7') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/stylesheet/skin/tranda_minimal.css" media="all" />
<?php } ?>
<?php } ?>
<?php if($this->config->get('tranda_responsive') == '') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/stylesheet/tranda_responsive.css" media="all" />
<?php } else { ?>
<?php if($this->config->get('tranda_responsive') == '1') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/stylesheet/tranda_responsive.css" media="all" />
<?php } ?>
<?php } ?>
<?php if($this->config->get('tranda_responsive') == '0') { ?>
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/stylesheet/tranda_static.css" media="all" />
<?php } ?>
<!-- .TRANDA THEME -->
<!-- CSS // Bootstrap, Nivo Slider, jCarousel, fancyBox, Cloud Zoom, colorbox -->
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/bootstrap/css/bootstrap-tooltip.css" media="all" />
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/nivo-slider/css/nivo-slider.css" media="all" />
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/jcarousel/css/tranda-jcarousel.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/fancybox/css/jquery.fancybox-1.3.4.css" media="all" />
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/cloud-zoom/css/cloud-zoom.css" media="all" />
<link rel="stylesheet" type="text/css" href="catalog/view/tranda_root/colorbox/css/colorbox.css" media="all" />
<!-- CSS // Bootstrap, Nivo Slider, jCarousel, fancyBox, Cloud Zoom, colorbox -->
<!-- JAVASCRIPT // .TRANDA, Bootstrap, Nivo Slider, jCarousel, fancyBox, Cloud Zoom, colorbox -->
<script type="text/javascript" src="catalog/view/tranda_root/javascript/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/tranda_root/nivo-slider/js/jquery.nivo.slider.js"></script>
<script type="text/javascript" src="catalog/view/tranda_root/jcarousel/js/jquery.jcarousel.min.js"></script>
<script type="text/javascript" src="catalog/view/tranda_root/fancybox/js/jquery.fancybox-1.3.4.js"></script>
<script type="text/javascript" src="catalog/view/tranda_root/cloud-zoom/js/cloud-zoom.1.0.2.js"></script>
<script type="text/javascript" src="catalog/view/tranda_root/colorbox/js/jquery.colorbox-min.js"></script>
<script type="text/javascript" src="catalog/view/tranda_root/javascript/jbmenu.js"></script>
<script type="text/javascript" src="catalog/view/tranda_root/javascript/common.js"></script>
<!-- JAVASCRIPT // .TRANDA, Bootstrap, Nivo Slider, jCarousel, fancyBox, Cloud Zoom, colorbox -->
<!-- OPENCART FILE -->
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.total-storage.min.js"></script>
<!-- OPENCART FILE -->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?><?php echo $google_analytics; ?>
<?php if($this->config->get('tranda_adjustment_skin') == '1') { ?>
<!-- START Adjustment Skin -->
<style type="text/css">
<?php if($this->config->get('bg_html_banner') != '') { ?>
html {<?php if($this->config->get('bg_html_color') != '') { ?> background-color:#<?php echo $this->config->get('bg_html_color'); ?>;<?php } ?> background-image:url(image/<?php echo $this->config->get('bg_html_banner'); ?>);<?php if($this->config->get('bg_html_repeat')!= '') { ?> background-repeat:<?php echo $this->config->get('bg_html_repeat'); ?>;<?php } ?><?php if($this->config->get('bg_html_attachment')!= '') { ?> background-attachment:<?php echo $this->config->get('bg_html_attachment'); ?>;<?php } ?><?php if($this->config->get('bg_html_position')!= '') { ?> background-position:<?php echo $this->config->get('bg_html_position'); ?>;<?php } ?><?php if($this->config->get('bg_html_paddingbottom') != '') { ?> padding-bottom:<?php echo $this->config->get('bg_html_paddingbottom'); ?>px;<?php } ?><?php if($this->config->get('bg_html_paddingtop') != '') { ?> padding-top:<?php echo $this->config->get('bg_html_paddingtop'); ?>px;<?php } ?>}
<?php } ?>
<?php if($this->config->get('transparent_container_top') == '1') { ?>
body { background-color:transparent !important;}
.container { background-color:transparent !important;}
.container-top { background-color:transparent !important;}
<?php } ?>
<?php if($this->config->get('heading_page')!= '') { ?>
.content-top .page_title { color:#<?php echo $this->config->get('heading_page'); ?>;}
<?php } ?>
<?php if($this->config->get('breadcrumb_text')!= '') { ?>
.breadcrumb h2 { color:#<?php echo $this->config->get('breadcrumb_text'); ?>;}
<?php } ?>
<?php if($this->config->get('breadcrumb_link')!= '') { ?>
.breadcrumb h2 a { color:#<?php echo $this->config->get('breadcrumb_link'); ?>;}
<?php } ?>
<?php if($this->config->get('breadcrumb_link_hover')!= '') { ?>
.breadcrumb h2 a:hover { color:#<?php echo $this->config->get('breadcrumb_link_hover'); ?>;}
<?php } ?>
</style>
<!-- END Adjustment Skin -->
<?php } ?>
</head>
<body<?php if($this->config->get('tranda_adjustment_skin') == '1') { ?><?php if($this->config->get('bg_html_banner')!= '') { ?> class="bg-html"<?php }?><?php } ?>>
<!-- START HEADER -->
<div id="header" class="header">
    <!-- start top header -->
	<div class="toph">
        <!-- START TOP RESPONSIVE -->
        <div class="top-responsive">
            <?php if (!$logged) { ?>
            <p class="welcome"><?php echo $text_welcome; ?></p>
            <?php } else { ?>
            <p class="welcome"><?php echo $text_logged; ?></p>
            <?php } ?>
            <?php echo $language; ?>
            <?php echo $currency; ?>
        </div>
        <!-- END TOP RESPONSIVE -->
    	<div id="menu" class="gpc">
        	<div class="logo">
            	<?php if ($logo) { ?>
            	<a href="<?php echo $home; ?>" title="<?php echo $name; ?>"><img src="<?php echo $logo; ?>" alt="<?php echo $name; ?>" /></a>
                <?php } ?>
            </div>
            <?php if ($categories) { ?>
            <!-- START menu -->
        	<div class="top-menu">
              <ul>
               <li><a href="<?php echo $design_your_own; ?>"><?php echo $text_design_your_own; ?></a></li>
  			  <li><a href="<?php echo $raw_product_design; ?>"><?php echo $design_from_raw_product; ?></a></li>
                <?php foreach ($categories as $category) { ?>
                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                  <?php if ($category['children']) { ?>
                  <div>
                    <?php for ($i = 0; $i < count($category['children']);) { ?>
                    <ul>
                      <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                      <?php for (; $i < $j; $i++) { ?>
                      <?php if (isset($category['children'][$i])) { ?>
                      <li><a href="<?php echo $category['children'][$i]['href']; ?>"><i class="<?php if($this->config->get('tranda_icon_submenu') != '') { ?><?php echo $this->config->get('tranda_icon_submenu'); ?><?php } else { ?>icon-chevron-right<?php } ?>"></i><?php echo $category['children'][$i]['name']; ?></a></li>
                      <?php } ?>
                      <?php } ?>
                    </ul>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </li>
                <?php } ?>
              </ul>
            </div>
            <!-- END menu -->
            <!-- START mini menu -->
            <div id="jbmenu" class="jbmenu">
              <div class="jbtitle"><span><i class="icon-plus first-icon"></i><i class="icon-minus second-icon"></i></span><?php if($this->config->get('tranda_text_category') != '') { ?><?php echo $this->config->get('tranda_text_category'); ?><?php } else { ?>Category<?php } ?></div>
              <div class="jbcontent">
              <ul>
                <?php foreach ($categories as $category) { ?>
                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a><?php if ($category['children']) { ?><span class="jbchildren"><i class="icon-plus first-icon"></i><i class="icon-minus second-icon"></i></span><?php } ?>
                  <?php if ($category['children']) { ?>
                  <ul class="jbchildrenlist">
                  <?php for ($i = 0; $i < count($category['children']);) { ?>
                    <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                    <?php for (; $i < $j; $i++) { ?>
                    <?php if (isset($category['children'][$i])) { ?>
                    <li><a href="<?php echo $category['children'][$i]['href']; ?>">- <?php echo $category['children'][$i]['name']; ?></a></li>
                    <?php } ?>
                    <?php } ?>
                  <?php } ?>
                  </ul>
                  <?php } ?>
                </li>
                <?php } ?>
              </ul>
              </div>
            </div>
            <!-- END mini menu -->
            <?php } ?>
            <?php if($this->config->get('tranda_display_header_info_h') == '1') { ?>
            <div class="customer-support">
            
            	<table style="cursor:pointer" onclick="if(navigator.userAgent.toLowerCase().indexOf('opera') != -1 &amp;&amp; window.event.preventDefault) window.event.preventDefault();this.newWindow = window.open('http://www.webesperto.com/chat/client.php?locale=en&amp;url='+escape(document.location.href)+'&amp;referrer='+escape(document.referrer), 'webim', 'toolbar=0,scrollbars=0,location=0,status=1,menubar=0,width=640,height=480,resizable=1');this.newWindow.focus();this.newWindow.opener=window;return false;">
                	<tbody>                	
                    	<tr>
                            <td class="icon"><i style="cursor:pointer" class="<?php echo $this->config->get('tranda_header_info_icon'); ?>"></i></td>
                            <td class="info">
                                <span class="title"><?php echo $this->config->get('tranda_header_info_title'); ?></span>
                                <span><?php echo $this->config->get('tranda_header_info_info'); ?></span>
                            </td>
                        </tr>
        
                    </tbody>
                </table>            

            </div>
            
            <?php } ?>
        </div>
    </div>
    <!-- end top header -->
    <!-- start bottom header -->
	<div<?php if($this->config->get('tranda_header_bar') == '1') { ?> id="bottomh"<?php } ?> class="bottomh">
    	<div class="gpc">
            <!-- START SHOP MENU -->
        	<div class="shop-menu">
            	<ul class="links">
                	<li class="links_home">
                    	<a href="<?php echo $home; ?>" id="links_home">
                        	<i class="<?php if($this->config->get('tranda_icon_hometab') != '') { ?><?php echo $this->config->get('tranda_icon_hometab'); ?><?php } else { ?>icon-home<?php } ?>"></i>
                            <span><?php echo $text_home; ?></span>
                        </a>
                        <div class="top-shop-content" id="home_content_links">
                        	<ul class="list-top-shop home-list-top-shop">
                            	<li><a href="<?php echo $home; ?>"><i class="icon-refresh"></i><?php echo $text_home; ?></a></li>
                                <?php if($this->config->get('tranda_display_facebook_h') == '1') { ?>
                                <li><a href="http://<?php echo $this->config->get('tranda_facebook_url'); ?>"><i class="<?php echo $this->config->get('tranda_facebook_icon'); ?>"></i><?php echo $this->config->get('tranda_facebook_title'); ?></a></li>
                                <?php } ?>
                                <?php if($this->config->get('tranda_display_twitter_h') == '1') { ?>
                                <li><a href="http://<?php echo $this->config->get('tranda_twitter_url'); ?>"><i class="<?php echo $this->config->get('tranda_twitter_icon'); ?>"></i><?php echo $this->config->get('tranda_twitter_title'); ?></a></li>
                                <?php } ?>
                                <?php if($this->config->get('tranda_display_google_h') == '1') { ?>
                                <li><a href="http://<?php echo $this->config->get('tranda_google_url'); ?>"><i class="<?php echo $this->config->get('tranda_google_icon'); ?>"></i><?php echo $this->config->get('tranda_google_title'); ?></a></li>
                                <?php } ?>
                                <?php if($this->config->get('tranda_display_github_h') == '1') { ?>
                                <li><a href="http://<?php echo $this->config->get('tranda_github_url'); ?>"><i class="<?php echo $this->config->get('tranda_github_icon'); ?>"></i><?php echo $this->config->get('tranda_github_title'); ?></a></li>
                                <?php } ?>
                                <?php if($this->config->get('tranda_display_linkedin_h') == '1') { ?>
                                <li><a href="http://<?php echo $this->config->get('tranda_linkedin_url'); ?>"><i class="<?php echo $this->config->get('tranda_linkedin_icon'); ?>"></i><?php echo $this->config->get('tranda_linkedin_title'); ?></a></li>
                                <?php } ?>
                                <?php if($this->config->get('tranda_display_pinterest_h') == '1') { ?>
                                <li><a href="http://<?php echo $this->config->get('tranda_pinterest_url'); ?>"><i class="<?php echo $this->config->get('tranda_pinterest_icon'); ?>"></i><?php echo $this->config->get('tranda_pinterest_title'); ?></a></li>
                                <?php } ?>
                                <?php if($this->config->get('tranda_display_myicon1_h') == '1') { ?>
                                <li><a href="http://<?php echo $this->config->get('tranda_myicon1_url'); ?>"><img class="myicon" src="image/<?php echo $this->config->get('tranda_myicon1'); ?>" alt="" /><?php echo $this->config->get('tranda_myicon1_title'); ?></a></li>
                                <?php } ?>
                                <?php if($this->config->get('tranda_display_myicon2_h') == '1') { ?>
                                <li><a href="http://<?php echo $this->config->get('tranda_myicon2_url'); ?>"><img class="myicon" src="image/<?php echo $this->config->get('tranda_myicon2'); ?>" alt="" /><?php echo $this->config->get('tranda_myicon2_title'); ?></a></li>
                                <?php } ?>
                                <?php if($this->config->get('tranda_display_myicon3_h') == '1') { ?>
                                <li><a href="http://<?php echo $this->config->get('tranda_myicon3_url'); ?>"><img class="myicon" src="image/<?php echo $this->config->get('tranda_myicon3'); ?>" alt="" /><?php echo $this->config->get('tranda_myicon3_title'); ?></a></li>
                                <?php } ?>
                            </ul> 
                            <ul class="global-contact">
                                <?php if($this->config->get('tranda_display_phone_h') == '1') { ?>
                                <li>
                                    <i class="<?php echo $this->config->get('tranda_phone_icon'); ?>"></i>
                                    <p>
                                        <b><?php echo $this->config->get('tranda_phone_title'); ?></b><br />
                                        <?php echo $this->config->get('tranda_phone_info_1'); ?>
                                        <?php if($this->config->get('tranda_phone_info_2') != '') { ?><br /><?php echo $this->config->get('tranda_phone_info_2'); ?><?php } ?>
                                        <?php if($this->config->get('tranda_phone_info_3') != '') { ?><br /><?php echo $this->config->get('tranda_phone_info_3'); ?><?php } ?>
                                    </p>
                                </li>
                                <?php } ?>
                                <?php if($this->config->get('tranda_display_email_h') == '1') { ?>
                                <li>
                                    <i class="<?php echo $this->config->get('tranda_email_icon'); ?>"></i>
                                    <p>
                                        <b><?php echo $this->config->get('tranda_email_title'); ?></b><br />
                                        <a href="mailto:<?php echo $this->config->get('tranda_email_info_1'); ?>"><?php echo $this->config->get('tranda_email_info_1'); ?></a>
                                        <?php if($this->config->get('tranda_email_info_2') != '') { ?><br /><a href="mailto:<?php echo $this->config->get('tranda_email_info_2'); ?>"><?php echo $this->config->get('tranda_email_info_2'); ?></a><?php } ?>
                                        <?php if($this->config->get('tranda_email_info_3') != '') { ?><br /><a href="mailto:<?php echo $this->config->get('tranda_email_info_3'); ?>"><?php echo $this->config->get('tranda_email_info_3'); ?></a><?php } ?>
                                    </p>
                                </li>
                                <?php } ?>
                                <?php if($this->config->get('tranda_display_address_h') == '1') { ?>
                                <li>
                                    <i class="<?php echo $this->config->get('tranda_address_icon'); ?>"></i>
                                    <p>
                                        <b><?php echo $this->config->get('tranda_address_title'); ?></b><br />
                                        <?php echo $this->config->get('tranda_address_info'); ?>
                                    </p>
                                </li>
                                <?php } ?>
                                <?php if($this->config->get('tranda_display_gps_h') == '1') { ?>
                                <li>
                                    <i class="<?php echo $this->config->get('tranda_gps_icon'); ?>"></i>
                                    <p>
                                        <b><?php echo $this->config->get('tranda_gps_title'); ?></b><br />
                                        <?php echo $this->config->get('tranda_gps_latitude'); ?>
                                        <br /><?php echo $this->config->get('tranda_gps_longitude'); ?>
                                    </p>
                                </li>
                                <?php } ?>
                                <?php if($this->config->get('tranda_display_schedule_h') == '1') { ?>
                                <li>
                                    <i class="<?php echo $this->config->get('tranda_schedule_icon'); ?>"></i>
                                    <p>
                                        <b><?php echo $this->config->get('tranda_schedule_title'); ?></b><br />
                                        
                                        <?php echo $this->config->get('tranda_schedule_day1'); ?> - <?php echo $this->config->get('tranda_schedule_day2'); ?>: <?php echo $this->config->get('tranda_schedule_hour1'); ?><sup><?php echo $this->config->get('tranda_schedule_minutes1'); ?></sup> - <?php echo $this->config->get('tranda_schedule_hour2'); ?><sup><?php echo $this->config->get('tranda_schedule_minutes2'); ?></sup>
                                        <?php if($this->config->get('tranda_schedule_more_info') != '') { ?><span class="infotext"><?php echo $this->config->get('tranda_schedule_more_info'); ?></span><?php } ?>
                                    </p>
                                </li>
                                <?php } ?>
                                <?php if($this->config->get('tranda_display_shipping_h') == '1') { ?>
                                <li>
                                    <i class="<?php echo $this->config->get('tranda_shipping_icon'); ?>"></i>
                                    <p>
                                        <b><?php echo $this->config->get('tranda_shipping_title'); ?></b><br />
                                        <?php echo $this->config->get('tranda_shipping_info'); ?>
                                    </p>
                                </li>
                                <?php } ?>
                            </ul>
                        </div>
                    </li>
                	<li class="links_my_account">
                    	<a href="<?php echo $account; ?>" id="links_my_account">
                        	<i class="<?php if($this->config->get('tranda_icon_accounttab') != '') { ?><?php echo $this->config->get('tranda_icon_accounttab'); ?><?php } else { ?>icon-paper-clip<?php } ?>"></i>
                            <span><?php echo $text_account; ?></span>
                        </a>
                    	<div class="top-shop-content" id="my_account_content_links">
                        	<ul class="<?php if ($currency || $language) { ?>list-top-shop<?php } else { ?>list-top-shop no-options-shop<?php } ?>">
                            	<?php if (!$logged) { ?>
                            	<li><a href="<?php echo $account; ?>" class="inactive"><i class="icon-signin"></i><?php echo $text_account; ?></a></li>
                            	<li><a href="<?php echo $wishlist; ?>" class="inactive"><i class="<?php if($this->config->get('tranda_icon_wishlist') != '') { ?><?php echo $this->config->get('tranda_icon_wishlist'); ?><?php } else { ?>icon-file-alt<?php } ?>"></i><span id="wishlist-total"><?php echo $text_wishlist; ?></span></a></li>
                                <?php } else { ?>
                            	<li><a href="<?php echo $account; ?>"><i class="icon-signin"></i><?php echo $text_account; ?></a></li>
                            	<li><a href="<?php echo $wishlist; ?>"><i class="<?php if($this->config->get('tranda_icon_wishlist') != '') { ?><?php echo $this->config->get('tranda_icon_wishlist'); ?><?php } else { ?>icon-file-alt<?php } ?>"></i><span id="wishlist-total"><?php echo $text_wishlist; ?></span></a></li>
                                <?php } ?>
                            	<li><a href="<?php echo $shopping_cart; ?>"><i class="<?php if($this->config->get('tranda_icon_cart') != '') { ?><?php echo $this->config->get('tranda_icon_cart'); ?><?php } else { ?>icon-shopping-cart<?php } ?>"></i><?php echo $text_shopping_cart; ?></a></li>
                            	<li><a href="<?php echo $checkout; ?>"><i class="<?php if($this->config->get('tranda_icon_checkout') != '') { ?><?php echo $this->config->get('tranda_icon_checkout'); ?><?php } else { ?>icon-credit-card<?php } ?>"></i><?php echo $text_checkout; ?></a></li>
                            </ul>
                            <?php if ($currency || $language) { ?>
                            <div class="options-shop">
                            	<?php echo $currency; ?>
                                <?php echo $language; ?>
                            </div>
                            <?php } ?>
                        	<div class="bottom-panel">
                            	<?php if (!$logged) { ?>
                            	<p class="user"><i class="icon-lock"></i><?php echo $text_welcome; ?></p>
                                <?php } else { ?>
                            	<p class="user"><i class="icon-unlock"></i><?php echo $text_logged; ?></p>
                                <?php } ?>
                            </div>
                        </div>
                    </li>
                    <?php if ($categories) { ?>
                	<li class="links_category">
                    	<a href="#" id="links_category">
                        	<i class="<?php if($this->config->get('tranda_icon_menutab') != '') { ?><?php echo $this->config->get('tranda_icon_menutab'); ?><?php } else { ?>icon-folder-open-alt<?php } ?>"></i>
                            <span><?php if($this->config->get('tranda_text_category') != '') { ?><?php echo $this->config->get('tranda_text_category'); ?><?php } else { ?>Category<?php } ?></span>
                        </a>
                        <div class="top-shop-content" id="category_content_links">
                            <div class="category-shop">
                                <ul class="list-top-shop">
                                    <?php foreach ($categories as $category) { ?>
                                    <li><a href="<?php echo $category['href']; ?>"><i class="<?php if($this->config->get('tranda_icon_submenu') != '') { ?><?php echo $this->config->get('tranda_icon_submenu'); ?><?php } else { ?>icon-chevron-right<?php } ?>"></i><?php echo $category['name']; ?></a>
                                      <?php if ($category['children']) { ?>
                                      <div>
                                        <?php for ($i = 0; $i < count($category['children']);) { ?>
                                        <ul>
                                          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
                                          <?php for (; $i < $j; $i++) { ?>
                                          <?php if (isset($category['children'][$i])) { ?>
                                          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><i class="<?php if($this->config->get('tranda_icon_submenu') != '') { ?><?php echo $this->config->get('tranda_icon_submenu'); ?><?php } else { ?>icon-chevron-right<?php } ?>"></i><?php echo $category['children'][$i]['name']; ?></a></li>
                                          <?php } ?>
                                          <?php } ?>
                                        </ul>
                                        <?php } ?>
                                      </div>
                                      <?php } ?>
                                    </li>
                                    <?php } ?>
                                </ul>            
                            </div>
                        </div>
                    </li>
                    <?php } ?>
                    <?php if (!$logged) { ?>
                	<li class="tablet_menu tablet_menu_account">
                    	<a href="<?php echo $account; ?>">
                        	<i class="icon-lock"></i>
                            <span><?php echo $text_account; ?></span>
                        </a>
                    </li>
                    <?php } else { ?>
                	<li class="tablet_menu tablet_menu_account">
                    	<a href="<?php echo $account; ?>">
                        	<i class="icon-unlock"></i>
                            <span><?php echo $text_account; ?></span>
                        </a>
                    </li>
                    <?php } ?>
                	<li class="tablet_menu tablet_menu_wishlist">
                    	<a href="<?php echo $wishlist; ?>">
                        	<i class="<?php if($this->config->get('tranda_icon_wishlist') != '') { ?><?php echo $this->config->get('tranda_icon_wishlist'); ?><?php } else { ?>icon-file-alt<?php } ?>"></i>
                            <span><?php echo $text_wishlist; ?></span>
                        </a>
                    </li>
                	<li class="tablet_menu tablet_menu_shopping_cart">
                    	<a href="<?php echo $shopping_cart; ?>">
                        	<i class="<?php if($this->config->get('tranda_icon_cart') != '') { ?><?php echo $this->config->get('tranda_icon_cart'); ?><?php } else { ?>icon-shopping-cart<?php } ?>"></i>
                            <span><?php echo $text_shopping_cart; ?></span>
                        </a>
                    </li>
                	<li class="tablet_menu tablet_menu_checkout">
                    	<a href="<?php echo $checkout; ?>">
                        	<i class="<?php if($this->config->get('tranda_icon_checkout') != '') { ?><?php echo $this->config->get('tranda_icon_checkout'); ?><?php } else { ?>icon-credit-card<?php } ?>"></i>
                            <span><?php echo $text_checkout; ?></span>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- END SHOP MENU -->
            <!-- START CART -->
            <div class="shop-cart">
                <?php echo $cart; ?>
            </div>
            <!-- END CART -->
            <!-- START SEARCH -->
            <div class="shop-search">
            	<div id="search" class="box">
                	<input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
                    <a class="button button-search"><i class="<?php if($this->config->get('tranda_icon_search') != '') { ?><?php echo $this->config->get('tranda_icon_search'); ?><?php } else { ?>icon-search<?php } ?>"></i></a>
                </div>
            </div>
            <!-- END SEARCH -->
        </div>
    </div>
    <!-- end bottom header -->
</div>
<!-- END HEADER -->
<div class="notification" id="notification"></div>
<!-- START CONTAINER -->
<div<?php if($this->config->get('tranda_header_bar') == '1') { ?> id="container"<?php } ?> class="container">