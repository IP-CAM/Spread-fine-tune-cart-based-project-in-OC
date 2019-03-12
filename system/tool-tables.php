<?php 
$db1 = mysql_connect(DB_HOSTNAME, DB_USERNAME, DB_PASSWORD);
$rv = mysql_select_db(DB_DATABASE, $db1);

/*
 * Adding new tables in database
 */
$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."system_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sys_name` varchar(255) NOT NULL,
  `sys_value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
)";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."color` (
  `color_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `is_default` int(3) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`color_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21" ;
mysql_query($sql);


$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."color_option` (
  `color_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8";
mysql_query($sql);	

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."design` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL DEFAULT '0',
  `image` varchar(100) DEFAULT NULL,
  `colorable` int(1) NOT NULL DEFAULT '0',
  `designArray` longtext NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `keyword` varchar(255) DEFAULT NULL COMMENT 'not in use',
  `cat_id` int(11) NOT NULL,
  `sub_cat_id` int(11) NOT NULL,
  `toolarr` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=131 ";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."design_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=73 ";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."design_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."design_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."design_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."design_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."design_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."design_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `design_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `detail` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=225 ";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."font` (
  `font_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `fontSWF` varchar(255) NOT NULL DEFAULT '0',
  `directionshow` int(2) NOT NULL DEFAULT '1' COMMENT '1= left to right, 2= right to left',
  `is_default` int(3) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`font_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."font_value` (
  `font_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `font_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `font_ttf` varchar(255) NOT NULL,
  `font_type` varchar(255) NOT NULL,
  PRIMARY KEY (`font_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."main_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `raw_product_id` int(11) NOT NULL,
  `raw_product_color_id` int(11) NOT NULL,
  `encoded_arr` longtext CHARACTER SET utf8 NOT NULL,
  `data_arr` longtext CHARACTER SET utf8 NOT NULL,
  `user_type` int(2) NOT NULL COMMENT '0=admin,1=customer',
  `user_id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=442";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."raw_product` (
  `raw_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `length` float NOT NULL,
  `width` float NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL COMMENT '= kg',
  `image` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `minimum` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `status` int(5) NOT NULL,
  `is_deleted` tinyint(2) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `is_screen_printing` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`raw_product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=58";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."raw_product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raw_product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=225";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."raw_product_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raw_product_id` int(11) NOT NULL DEFAULT '0',
  `color_code` varchar(50) DEFAULT NULL,
  `color_id` int(11) NOT NULL,
  `color_price` double NOT NULL DEFAULT '0',
  `is_default` int(5) NOT NULL DEFAULT '0',
  `status` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=154";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."raw_product_color_size_quantity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raw_product_id` int(11) NOT NULL,
  `raw_product_color_id` int(11) NOT NULL,
  `raw_product_size_id` int(11) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=166";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."raw_product_color_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raw_product_id` int(11) NOT NULL DEFAULT '0',
  `raw_product_color_id` int(5) NOT NULL DEFAULT '0',
  `view_id` int(5) NOT NULL DEFAULT '0',
  `image` varchar(250) NOT NULL DEFAULT '',
  `is_default` enum('0','1') NOT NULL DEFAULT '0',
  `design_area` text NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=343";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."raw_product_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raw_product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` text NOT NULL,
  `tag` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=420";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."raw_product_size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raw_product_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `price` double NOT NULL COMMENT '1=white ,2 =light ,3 =dark',
  `status` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=789";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."raw_product_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `raw_product_id` int(11) NOT NULL DEFAULT '0',
  `view_id` int(5) NOT NULL DEFAULT '0',
  `is_default` enum('0','1') NOT NULL DEFAULT '0',
  `design_area` text NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=221";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."screen_printing_color` (
  `color_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `is_default` int(3) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`color_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."screen_printing_color_option` (
  `color_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8";
mysql_query($sql);


$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."user_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id_ip` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
)";
mysql_query($sql);

$sql = "CREATE TABLE IF NOT EXISTS `".DB_PREFIX."order_product_pdf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `zipname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
)";
mysql_query($sql);
/*
 * Inserting sample data to new tables and in existing tables
 */
 
$sql = "INSERT INTO `".DB_PREFIX."system_config` (`id`, `sys_name`, `sys_value`) VALUES
(1, 'COLOR_OPTION', '5'),
(2, 'VIEW_OPTION', '13'),
(3, 'SIZE_OPTION', '11')";
mysql_query($sql);


$sql = "INSERT INTO `".DB_PREFIX."category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, '', 0, 1, 1, 0, 1, '2013-09-11 06:25:54', '2013-09-11 06:50:38')";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES
(1, 1, 'Men', 'Men', 'Men', 'Men')";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."category_path` (`category_id`, `path_id`, `level`) VALUES
(1, 1, 0)";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."category_to_store` (`category_id`, `store_id`) VALUES
(1, 0)";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."option` (`option_id`, `type`, `sort_order`) VALUES ('13', 'select', '0')";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."option_description` (`option_id`, `language_id`, `name`) VALUES ('13', '1', 'View')";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(78, 5, '', 3),
(77, 5, '', 2),
(76, 5, '', 1),
(75, 5, '', 1),
(74, 5, '', 0),
(73, 5, '', 0),
(72, 5, '', 0),
(71, 5, '', 0),
(70, 5, '', 0),
(69, 5, '', 0),
(68, 5, '', 0),
(67, 5, '', 0),
(66, 5, '', 0),
(65, 5, '', 0),
(64, 5, '', 0),
(63, 5, '', 0),
(62, 5, '', 1),
(61, 5, '', 0),
(56, 11, '', 0),
(52, 13, 'no_image.jpg', 4),
(51, 13, 'no_image.jpg', 3),
(50, 13, 'no_image.jpg', 2),
(49, 13, 'no_image.jpg', 1)";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(78, 1, 5, 'White'),
(77, 1, 5, 'Plum'),
(76, 1, 5, 'Beige'),
(75, 1, 5, 'Athletic Gold'),
(74, 1, 5, 'Black'),
(73, 1, 5, 'White'),
(72, 1, 5, 'Gray'),
(71, 1, 5, 'Orange'),
(70, 1, 5, 'Brown'),
(69, 1, 5, 'Pink'),
(68, 1, 5, 'Green'),
(67, 1, 5, 'Yellow'),
(66, 1, 5, 'Black'),
(65, 1, 5, 'Red'),
(64, 1, 5, 'White'),
(63, 1, 5, 'CornflowerBlue'),
(62, 1, 5, 'BlueViolet'),
(61, 1, 5, 'Blue'),
(56, 1, 11, 'XL'),
(52, 1, 13, 'Right'),
(51, 1, 13, 'Left'),
(50, 1, 13, 'Back'),
(49, 1, 13, 'Front')";
mysql_query($sql);


$sql = "INSERT INTO `".DB_PREFIX."color` (`color_id`, `name`, `code`, `is_default`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, 'White', 'ffffff', 1, 0, 1, '2013-08-14 11:59:28', '2013-08-14 11:59:28'),
(2, 'Red', 'FF0000', 0, 0, 1, '2013-08-14 12:00:26', '2013-08-14 12:00:26'),
(3, 'Black', '000000', 0, 0, 1, '2013-08-14 12:00:43', '2014-04-25 06:09:52'),
(4, 'Yellow', 'FFFF00', 0, 0, 1, '2013-09-11 06:31:33', '2013-09-11 06:31:33'),
(5, 'Green', '00FF00', 0, 0, 1, '2013-09-11 06:32:12', '2013-09-11 06:57:19'),
(6, 'Pink', 'FF00FF', 0, 0, 1, '2013-09-11 06:32:55', '2013-09-11 06:32:55'),
(7, 'Brown', 'C8B560', 0, 0, 1, '2013-09-11 07:45:16', '2013-09-11 07:45:16'),
(8, 'Orange', 'FF8C00', 0, 0, 1, '2013-09-11 08:26:19', '2013-09-11 08:26:19'),
(9, 'Gray', 'CCCCCC', 0, 0, 1, '2013-09-11 08:31:47', '2013-09-11 08:31:47'),
(10, 'CornflowerBlue', '6495ED', 0, 0, 1, '2013-08-14 11:58:46', '2013-08-14 11:58:46'),
(11, 'BlueViolet', '8A2BE2', 0, 1, 1, '2013-08-14 11:58:07', '2013-08-14 11:58:07'),
(12, 'Blue', '0000FF', 0, 0, 1, '2013-08-14 11:57:20', '2013-08-14 11:57:20')";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."color_option` (`color_id`, `option_value_id`) VALUES
(1, 78),
(2, 65),
(3, 74),
(4, 67),
(5, 68),
(6, 69),
(7, 70),
(8, 68),
(9, 69),
(10, 70),
(11, 71),
(12, 72)";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."design` (`id`, `price`, `image`, `colorable`, `designArray`, `status`, `keyword`, `cat_id`, `sub_cat_id`, `toolarr`) VALUES
(1, 0, '201307261159581374839998454258161.png', 1, 'a:1:{i:0;O:8:\"stdClass\":2:{s:5:\"color\";s:6:\"CC9933\";s:3:\"url\";s:41:\"webroot/clipart/300x300/1374839892947.png\";}}', '1', NULL, 1, 1, '{\"printingProcessCSV\":\"\",\"images\":[{\"color\":\"CC9933\",\"url\":\"webroot/clipart/300x300/1374839892947.png\"}],\"subCategoryId\":1,\"price\":\"0\",\"titleArr\":[{\"name\":\"English\",\"id\":1,\"value\":\"Super men\"}],\"descriptionArr\":[{\"name\":\"English\",\"id\":1,\"value\":\"super man\"}],\"categoryId\":1,\"colorable\":true,\"keyWordsArr\":[{\"name\":\"English\",\"id\":1,\"value\":\"super men\"}],\"thumbnail\":\"webroot/clipart/45x45/201307261159581374839998454258161.png\",\"id\":1}')";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."design_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, '', 0, 1, 1, 0, 1, '2013-09-18 07:03:51', '2013-09-18 08:12:12')";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."design_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES
(1, 1, 'Logos', '&lt;p&gt;Logos&lt;/p&gt;\r\n', 'Logos', 'Logos')";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."design_category_path` (`category_id`, `path_id`, `level`) VALUES
(1, 1, 0)";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."design_category_to_store` (`category_id`, `store_id`) VALUES
(1, 0)";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."design_description` (`id`, `design_id`, `language_id`, `title`, `keywords`, `description`, `detail`) VALUES
(1, 1, 1, 'Super Man', 'SuperMan', 'Super Man', 'Super Man')";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."raw_product` (`raw_product_id`, `length`, `width`, `height`, `weight`, `image`, `price`, `minimum`, `model`, `manufacturer_id`, `status`, `is_deleted`, `date_added`, `is_screen_printing`) VALUES
(1, 10, 10, 10, 1, '2013072611541913748396591492225446.png', 100, '1', 'dt123', 6, 1, 0, '2013-04-21 06:00:53', 1)";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."raw_product_category` (`id`, `raw_product_id`, `category_id`) VALUES
(1, 1, 1)";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."raw_product_color` (`id`, `raw_product_id`, `color_code`, `color_id`, `color_price`, `is_default`, `status`) VALUES
(1, 1, 'FFFFFF', 1, 10, 1, 1),
(2, 1, 'FF0000', 2, 20, 0, 1)"
;mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."raw_product_color_size_quantity` (`id`, `raw_product_id`, `raw_product_color_id`, `raw_product_size_id`, `quantity`) VALUES
(1, 1, 1, 1, '400'),
(2, 1, 1, 2, '300'),
(3, 1, 1, 3, '400'),
(4, 1, 2, 1, '300'),
(5, 1, 2, 2, '200'),
(6, 1, 2, 3, '100')";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."raw_product_color_view` (`id`, `raw_product_id`, `raw_product_color_id`, `view_id`, `image`, `is_default`, `design_area`, `price`) VALUES
(1, 1, 2, 49, '2013072611541413748396541447871363.png', '0', '', 7),
(2, 1, 2, 50, '2013072611541513748396551847912606.png', '1', '', 9),
(3, 1, 1, 49, '2013072611541913748396591492225446.png', '0', '', 7),
(4, 1, 1, 50, '2013072611542313748396631482717.png', '1', '', 9)";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."raw_product_description` (`id`, `raw_product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(1, 1, 1, 'Men\'s Tshirt', 'Men Tshirt', 'Men Tshirt', '0', '0')";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."raw_product_size` (`id`, `raw_product_id`, `size_id`, `price`, `status`) VALUES
(1, 1, 48, 10, 1),
(2, 1, 46, 10, 1),
(3, 1, 47, 10, 1),
(4, 1, 56, 15, 1)";mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."raw_product_view` (`id`, `raw_product_id`, `view_id`, `is_default`, `design_area`, `price`) VALUES
(1, 1, 49, '0', 'O:8:\"stdClass\":2:{s:10:\"designArea\";a:1:{i:0;O:8:\"stdClass\":8:{s:6:\"printH\";d:7.26012793176972337505503674037754535675048828125;s:1:\"x\";d:129.5;s:6:\"height\";d:340.5;s:2:\"id\";i:1374839812211;s:6:\"printW\";i:5;s:1:\"y\";d:87.5;s:14:\"decoMethodType\";i:1;s:5:\"width\";d:234.5;}}s:7:\"default\";i:1374839812211;}', 7),
(2, 1, 50, '1', 'O:8:\"stdClass\":2:{s:10:\"designArea\";a:1:{i:0;O:8:\"stdClass\":8:{s:6:\"printH\";d:7.3665893271461708735614593024365603923797607421875;s:1:\"x\";d:139.5;s:6:\"height\";d:317.5;s:2:\"id\";i:1374839795262;s:6:\"printW\";i:5;s:1:\"y\";d:105.5;s:14:\"decoMethodType\";i:1;s:5:\"width\";d:215.5;}}s:7:\"default\";i:1374839795262;}', 9)";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."screen_printing_color` (`color_id`, `name`, `code`, `is_default`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(26, 'White', 'FEFEFE', 0, 3, 1, '2014-04-27 11:33:53', '2014-04-27 11:33:53'),
(25, 'Plum', '6B123C', 0, 2, 1, '2014-04-27 11:27:36', '2014-04-27 11:27:36'),
(24, 'Beige', 'B2A668', 0, 1, 1, '2014-04-27 11:27:00', '2014-04-27 11:27:00'),
(13, 'Red', 'FF0000', 0, 0, 1, '2013-08-14 12:00:26', '2013-08-14 12:00:26'),
(23, 'Athletic Gold', 'ffcc00', 0, 1, 1, '2014-04-27 10:58:06', '2014-04-27 10:58:06'),
(16, 'Green', '00ff00', 1, 0, 1, '2013-09-11 06:32:12', '2014-04-25 06:10:49'),
(22, 'Black', '000000', 0, 0, 1, '2014-04-25 06:11:18', '2014-04-25 06:11:18'),
(21, 'White', 'ffffff', 0, 0, 1, '2014-04-25 06:11:05', '2014-04-25 06:11:05'),
(19, 'Orange', 'FF8C00', 0, 0, 1, '2013-09-11 08:26:19', '2013-09-11 08:26:19')";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."screen_printing_color_option` (`color_id`, `option_value_id`) VALUES
(13, 65),
(16, 68),
(19, 71),
(21, 73),
(22, 74),
(23, 75),
(24, 76),
(25, 77),
(26, 78)";
mysql_query($sql);

$sql = "INSERT INTO `".DB_PREFIX."font` (`font_id`, `name`, `image`, `fontSWF`, `directionshow`, `is_default`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Comic Sans MS', '2013072612523513748431551157899957.png', '0', 1, 0, 1	, 1, '2013-08-14 17:24:32', '2013-08-14 17:24:32'),
(2, 'Arial', '201307261253051374843185420230360.png', '0', 1, 0, 0, 1, '2013-08-14 17:25:08', '2013-08-14 17:25:08')";
mysql_query($sql);


$sql = "INSERT INTO `".DB_PREFIX."font_value` (`font_value_id`, `font_id`, `image`, `font_ttf`, `font_type`) VALUES
(1, 1, '2013072612523513748431551157899957.png', '2013072612523513748431551157899957.ttf', 'normal'),
(2, 2, '201307261253051374843185420230360.png', '201307261253051374843185420230360.ttf', 'normal')";
mysql_query($sql);


$sql = "ALTER TABLE `".DB_PREFIX."product`  ADD  `is_printable` TINYINT( 1 ) NOT NULL DEFAULT '0'";
mysql_query($sql);

$sql = "CREATE TABLE `".DB_PREFIX."screen_printing_pricing` ( `id` int( 11 ) NOT NULL AUTO_INCREMENT ,
`product_id` int( 11 ) NOT NULL ,
`quantities` longtext,
`screen_charges` longtext NOT NULL ,
`price` longtext NOT NULL ,
PRIMARY KEY ( `id` )
) ENGINE = MYISAM DEFAULT CHARSET = utf8";
mysql_query($sql);

$sql = "ALTER TABLE `".DB_PREFIX."product_option_value`  ADD  `default_view` TINYINT( 1 ) NOT NULL DEFAULT '0',ADD `default_size` TINYINT( 1 ) NOT NULL DEFAULT '0',ADD  `default_color` TINYINT( 1 ) NOT NULL DEFAULT '0'";
mysql_query($sql);


$sql = "ALTER TABLE `".DB_PREFIX."product_image` ADD `views_id` INT NOT NULL ;";
mysql_query($sql);
//===============adding files to theme folders================================

function recurse_copy($src,$dst) { 
    $dir = opendir($src); 
    @mkdir($dst); 
    while(false !== ( $file = readdir($dir)) ) { 
        if (( $file != '.' ) && ( $file != '..' )) { 
            if ( is_dir($src . '/' . $file) ) { 
                recurse_copy($src . '/' . $file,$dst . '/' . $file); 
            } 
            else { 
                copy($src . '/' . $file,$dst . '/' . $file); 
            } 
        } 
    } 
    closedir($dir); 
} 

$dir = opendir(DIR_TEMPLATE);
while(false !== ( $file = readdir($dir)) ) {		 
        if (( $file != '.' ) && ( $file != '..' )) {        	
        	if ( is_dir(DIR_TEMPLATE.'default/template/rawproduct') && $file!='default' && is_dir(DIR_TEMPLATE.$file.'/template/rawproduct')!=1) {        		 
                recurse_copy(DIR_TEMPLATE.'default/template/rawproduct',DIR_TEMPLATE. $file.'/template/rawproduct');				
            }
			if ( is_dir(DIR_TEMPLATE.'default/template/designer') && $file!='default' && is_dir(DIR_TEMPLATE.$file.'/template/designer')!=1) {               
				recurse_copy(DIR_TEMPLATE.'default/template/designer',DIR_TEMPLATE.$file.'/template/designer');
            } 
        } 
    } 
    closedir($dir);
?>