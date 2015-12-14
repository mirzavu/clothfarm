-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 14, 2015 at 03:53 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fayas_exlcart`
--
CREATE DATABASE IF NOT EXISTS `fayas_exlcart` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fayas_exlcart`;

-- --------------------------------------------------------

--
-- Table structure for table `oc_address`
--

CREATE TABLE IF NOT EXISTS `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `oc_address`
--

INSERT INTO `oc_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `custom_field`) VALUES
(1, 1, 'krishna', 'murthy', '', 'cbe', '', 'cbe', '6430202', 99, 1503, ''),
(2, 2, 'Fayas', 'kamar', '', 'ajman', '', 'ajman', '6421', 221, 3507, 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_advanced_colors_options`
--

CREATE TABLE IF NOT EXISTS `oc_advanced_colors_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `oc_advanced_colors_options`
--

INSERT INTO `oc_advanced_colors_options` (`id`, `name`, `value`) VALUES
(1, 'enable_product_list', 'enable'),
(2, 'image_width_product_list', '150'),
(3, 'image_height_product_list', '200'),
(4, 'icon_swatch_width_product_list', '15'),
(5, 'icon_swatch_height_product_list', '15'),
(6, 'enable_product_page', 'enable'),
(7, 'image_width_product_page', '450'),
(8, 'image_height_product_page', '450'),
(9, 'submenu_font_size', '15'),
(10, 'icon_swatch_width_product_page', '20'),
(11, 'icon_swatch_height_product_page', '20');

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_activity`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_login`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_api`
--

CREATE TABLE IF NOT EXISTS `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `firstname` varchar(64) NOT NULL,
  `lastname` varchar(64) NOT NULL,
  `password` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `username`, `firstname`, `lastname`, `password`, `status`, `date_added`, `date_modified`) VALUES
(1, 'uleUJutHSsoM9gxqVhJbkuTX1bApCoZwP4HYp0g7jLJis6ODeYeEIyc9QcpTHFFX', '', '', 'ANwpESnoewNMtcPN0uS8jv80NoJVuPsuceahxDLR0Yek1uxrfGqE1o5FTEaDTJywnPUbTftJ4Nuv7hddoJhfydkHhBL1KAnyP7Pjd8tYLdKJAnmpxKKlnvtLx4C74qwKoBtI9dhL6rV7V8mIJwuwid8VYBTTsFdXGNgGqDSmvokGmMPv8Aihdg21iLKRRooX2KejOxM9bwGD8Wy7WXez4Xrci2t0hYOZis8xfLw772A6Pz3lMYbGvIjUBTKirY8Q', 1, '2015-05-18 12:50:56', '2015-05-18 12:50:56');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor');

-- --------------------------------------------------------

--
-- Table structure for table `oc_attribute_group_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_attribute_group_to_store` (
  `attribute_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_autopost_plan`
--

CREATE TABLE IF NOT EXISTS `oc_autopost_plan` (
  `plan_id` int(16) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(256) NOT NULL,
  `plan_amount` varchar(16) NOT NULL,
  `plan_days` varchar(16) NOT NULL,
  `plan_status` int(1) NOT NULL COMMENT '1 - Disable, 0 - Enable',
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_autopost_plan`
--

INSERT INTO `oc_autopost_plan` (`plan_id`, `plan_name`, `plan_amount`, `plan_days`, `plan_status`) VALUES
(1, 'small', '5', '5', 0),
(2, 'medium', '10', '10', 0),
(4, 'Large', '15', '30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_autopost_plan_paypal`
--

CREATE TABLE IF NOT EXISTS `oc_autopost_plan_paypal` (
  `paypal_id` int(16) NOT NULL AUTO_INCREMENT,
  `plan_id` int(16) NOT NULL,
  `merchant_id` int(16) NOT NULL,
  `transaction_id` varchar(128) NOT NULL,
  `item_name` varchar(128) NOT NULL,
  `currency_code` varchar(64) NOT NULL,
  `amount` varchar(64) NOT NULL,
  `payment_status` varchar(64) NOT NULL,
  `activate_date` varchar(64) NOT NULL,
  `serialize_data` text NOT NULL,
  `payment_date` varchar(32) NOT NULL,
  PRIMARY KEY (`paypal_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `oc_autopost_plan_paypal`
--

INSERT INTO `oc_autopost_plan_paypal` (`paypal_id`, `plan_id`, `merchant_id`, `transaction_id`, `item_name`, `currency_code`, `amount`, `payment_status`, `activate_date`, `serialize_data`, `payment_date`) VALUES
(5, 2, 13, '7V141224BN6761533', 'medium', 'USD', '10.00', 'Pending', '04:17:03 Dec 07, 2015 PST', 'a:42:{s:8:"mc_gross";s:5:"10.00";s:22:"protection_eligibility";s:10:"Ineligible";s:14:"address_status";s:11:"unconfirmed";s:8:"payer_id";s:13:"5GJMJR9RXF2A2";s:3:"tax";s:4:"0.00";s:14:"address_street";s:6:"qwerty";s:12:"payment_date";s:25:"04:17:03 Dec 07, 2015 PST";s:14:"payment_status";s:7:"Pending";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:9:"121212121";s:10:"first_name";s:4:"hari";s:6:"mc_fee";s:4:"0.59";s:20:"address_country_code";s:2:"NL";s:12:"address_name";s:6:"murali";s:14:"notify_version";s:3:"3.8";s:6:"custom";s:9:"2__13__10";s:12:"payer_status";s:8:"verified";s:8:"business";s:37:"oskrishnamurthy-facilitator@gmail.com";s:15:"address_country";s:11:"Netherlands";s:12:"address_city";s:6:"qwerty";s:8:"quantity";s:1:"1";s:11:"verify_sign";s:56:"Ae-XDUZhrxwaCSsmGO9JpO33K7P1Aq5g6CkE66GR7-sC4jJSbvwCLa66";s:11:"payer_email";s:21:"hariprasath.s@ndot.in";s:6:"txn_id";s:17:"7V141224BN6761533";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:7:"prasath";s:13:"address_state";s:10:"QWQWQWQWQW";s:14:"receiver_email";s:37:"oskrishnamurthy-facilitator@gmail.com";s:11:"payment_fee";s:4:"0.59";s:11:"receiver_id";s:13:"4QHFKYHDY9K68";s:14:"pending_reason";s:13:"paymentreview";s:8:"txn_type";s:10:"web_accept";s:9:"item_name";s:6:"medium";s:11:"mc_currency";s:3:"USD";s:11:"item_number";s:0:"";s:17:"residence_country";s:2:"US";s:8:"test_ipn";s:1:"1";s:15:"handling_amount";s:4:"0.00";s:19:"transaction_subject";s:9:"2__13__10";s:13:"payment_gross";s:5:"10.00";s:8:"shipping";s:4:"0.00";s:12:"ipn_track_id";s:13:"116d94a821a63";}', '1449490627');

-- --------------------------------------------------------

--
-- Table structure for table `oc_bank_details`
--

CREATE TABLE IF NOT EXISTS `oc_bank_details` (
  `bank_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(16) NOT NULL,
  `name` varchar(64) NOT NULL,
  `bank_name` varchar(100) NOT NULL,
  `account_no` varchar(100) NOT NULL,
  `branch_name` varchar(64) NOT NULL,
  `ifsc_code` varchar(64) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`bank_details_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `oc_bank_details`
--

INSERT INTO `oc_bank_details` (`bank_details_id`, `merchant_id`, `name`, `bank_name`, `account_no`, `branch_name`, `ifsc_code`, `sort_order`) VALUES
(13, 0, 'merchant', 'merchant', '1002010122041010', 'merchant', 'merchant', 0),
(14, 13, 'test', 'Test', '13004257891', 'test1', 'CAN41234651', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_bank_details_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_bank_details_to_store` (
  `bank_details_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`bank_details_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_bank_details_to_store`
--

INSERT INTO `oc_bank_details_to_store` (`bank_details_id`, `store_id`) VALUES
(13, 9),
(14, 9);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner`
--

CREATE TABLE IF NOT EXISTS `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=78 ;

--
-- Dumping data for table `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`, `vendor_id`) VALUES
(6, 'HP Products', 1, 0),
(7, 'Home Page Slideshow', 1, 0),
(8, 'Manufacturers', 1, 0),
(9, 'ghjghjgh', 1, 0),
(10, 'ddas', 1, 2),
(77, 'Theme Brands', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1009 ;

--
-- Dumping data for table `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`) VALUES
(87, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(94, 8, '', 'catalog/demo/manufacturer/nfl.png', 0),
(95, 8, '', 'catalog/demo/manufacturer/redbull.png', 0),
(96, 8, '', 'catalog/demo/manufacturer/sony.png', 0),
(91, 8, '', 'catalog/demo/manufacturer/cocacola.png', 0),
(92, 8, '', 'catalog/demo/manufacturer/burgerking.png', 0),
(93, 8, '', 'catalog/demo/manufacturer/canon.png', 0),
(88, 8, '', 'catalog/demo/manufacturer/harley.png', 0),
(89, 8, '', 'catalog/demo/manufacturer/dell.png', 0),
(90, 8, '', 'catalog/demo/manufacturer/disney.png', 0),
(99, 7, 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(97, 8, '', 'catalog/demo/manufacturer/starbucks.png', 0),
(98, 8, '', 'catalog/demo/manufacturer/nintendo.png', 0),
(100, 7, '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(101, 7, '', 'catalog/Screenshot from 2015-05-17 16:39:22.png', 0),
(1001, 77, 'index.php', 'catalog/brands/brand1.png', 0),
(1002, 77, 'index.php', 'catalog/brands/brand2.png', 0),
(1003, 77, 'index.php', 'catalog/brands/brand3.png', 0),
(1004, 77, 'index.php', 'catalog/brands/brand4.png', 0),
(1005, 77, 'index.php', 'catalog/brands/brand5.png', 0),
(1006, 77, 'index.php', 'catalog/brands/brand6.png', 0),
(1007, 77, 'index.php', 'catalog/brands/brand7.png', 0),
(1008, 77, 'index.php', 'catalog/brands/brand8.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_banner_image_description`
--

CREATE TABLE IF NOT EXISTS `oc_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_banner_image_description`
--

INSERT INTO `oc_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(100, 1, 7, 'MacBookAir'),
(87, 1, 6, 'HP Banner'),
(93, 1, 8, 'Canon'),
(92, 1, 8, 'Burger King'),
(91, 1, 8, 'Coca Cola'),
(90, 1, 8, 'Disney'),
(89, 1, 8, 'Dell'),
(99, 1, 7, 'iPhone 6'),
(88, 1, 8, 'Harley Davidson'),
(94, 1, 8, 'NFL'),
(95, 1, 8, 'RedBull'),
(96, 1, 8, 'Sony'),
(97, 1, 8, 'Starbucks'),
(98, 1, 8, 'Nintendo'),
(101, 1, 7, 'dddd'),
(1001, 1, 77, 'brand01'),
(1002, 1, 77, 'brand02'),
(1003, 1, 77, 'brand03'),
(1004, 1, 77, 'brand04'),
(1005, 1, 77, 'brand05'),
(1006, 1, 77, 'brand06'),
(1007, 1, 77, 'brand07'),
(1008, 1, 77, 'brand08');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category`
--

CREATE TABLE IF NOT EXISTS `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `mtop` tinyint(1) NOT NULL,
  `ctop` tinyint(1) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `mtop`, `ctop`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(73, '', 0, 1, 0, 1, 3, 1, 1, '2015-12-11 04:04:37', '2015-12-11 12:58:12'),
(74, '', 0, 0, 73, 0, 2, 2, 1, '2015-12-11 04:05:56', '2015-12-11 12:02:05'),
(75, '', 0, 0, 74, 0, 1, 0, 1, '2015-12-11 04:07:08', '2015-12-11 04:07:08'),
(76, '', 0, 0, 74, 0, 1, 0, 1, '2015-12-11 04:09:06', '2015-12-11 04:09:06'),
(77, '', 0, 0, 74, 0, 1, 0, 1, '2015-12-11 04:10:38', '2015-12-11 04:10:38'),
(78, '', 0, 0, 74, 0, 1, 0, 1, '2015-12-11 04:11:16', '2015-12-11 04:11:16'),
(79, '', 0, 0, 74, 0, 1, 0, 1, '2015-12-11 04:12:53', '2015-12-11 04:12:53'),
(80, '', 0, 1, 73, 0, 1, 0, 1, '2015-12-11 04:13:19', '2015-12-11 12:22:50'),
(81, '', 0, 0, 80, 0, 1, 0, 1, '2015-12-11 04:14:11', '2015-12-11 04:14:11'),
(82, '', 0, 0, 80, 0, 1, 0, 1, '2015-12-11 04:14:52', '2015-12-11 04:14:52'),
(83, '', 0, 0, 80, 0, 1, 0, 1, '2015-12-11 04:15:29', '2015-12-11 04:15:29'),
(84, '', 0, 0, 73, 0, 2, 6, 1, '2015-12-11 04:17:03', '2015-12-11 12:17:55'),
(85, '', 0, 0, 84, 0, 1, 0, 1, '2015-12-11 04:17:22', '2015-12-11 04:17:22'),
(86, '', 0, 0, 84, 0, 1, 7, 1, '2015-12-11 04:18:02', '2015-12-11 12:18:23'),
(87, '', 0, 0, 84, 0, 1, 0, 1, '2015-12-11 04:18:26', '2015-12-11 04:18:26'),
(88, '', 0, 0, 84, 0, 1, 0, 1, '2015-12-11 04:18:48', '2015-12-11 04:18:48'),
(89, '', 0, 0, 84, 0, 1, 0, 1, '2015-12-11 04:19:12', '2015-12-11 04:19:12'),
(90, '', 0, 1, 0, 1, 3, 2, 1, '2015-12-11 12:42:20', '2015-12-11 12:48:59');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `promo` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `icon` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text NOT NULL,
  `html_description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `html_top` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `html_right` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `html_bottom` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `promo`, `icon`, `description`, `html_description`, `html_top`, `html_right`, `html_bottom`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(74, 1, 'Ethnic Wear', '', '', '', '', '', '', '', 'Ethnic Wear', '', ''),
(75, 1, 'Kurtas &amp; Kurtis', '', '', '', '', '', '', '', 'Kurtas &amp; Kurtis', '', ''),
(76, 1, 'Ethnic Bottoms', '', '', '', '', '', '', '', 'Ethnic Bottoms', '', ''),
(77, 1, 'Dupattas', '', '', '', '', '', '', '', 'Dupattas', '', ''),
(78, 1, 'Ethinic Sets', '', '', '', '', '', '', '', 'Ethinic Sets', '', ''),
(79, 1, 'Sarees', '', '', '', '', '', '', '', 'Sarees', '', ''),
(80, 1, 'Designers Shelf', '', '', '', '', '', '', '', 'Designers Shelf', '', ''),
(81, 1, 'Salvar Kurtha Dupatta', '', '', '', '', '', '', '', 'Salvar Kurtha Dupatta', '', ''),
(82, 1, 'Lehenga Cholis', '', '', '', '', '', '', '', 'Lehenga Cholis', '', ''),
(83, 1, 'Salvar Suites', '', '', '', '', '', '', '', 'Salvar Suites', '', ''),
(84, 1, 'Western Wire', '', '', '', '', '', '', '', 'Western Wire', '', ''),
(85, 1, 'T-Shirts', '', '', '', '', '', '', '', 'T-Shirts', '', ''),
(86, 1, 'Jackets', '', '', '', '', '', '', '', 'Jackets', '', ''),
(87, 1, 'Leggings', '', '', '', '', '', '', '', 'Leggings', '', ''),
(88, 1, 'Trousers', '', '', '', '', '', '', '', 'Trousers', '', ''),
(89, 1, 'Jeans &amp; Shorts', '', '', '', '', '', '', '', 'Jeans &amp; Shorts', '', ''),
(73, 1, 'Women', '&lt;span class=&quot;label label-newl&quot;&gt;NEW&lt;/span&gt; ', '', '', '&lt;div class=&quot;category-slider slick-style5&quot;&gt;\r\n&lt;div class=&quot;carousel-item&quot;&gt;&lt;img src=&quot;image/catalog/blocks/category-banner3.jpg&quot; alt=&quot;&quot;&gt;&lt;/div&gt;\r\n&lt;div class=&quot;carousel-item&quot;&gt;&lt;img src=&quot;image/catalog/blocks/category-banner4.jpg&quot; alt=&quot;&quot;&gt;&lt;/div&gt;\r\n&lt;/div&gt;', '&lt;ul class=&quot;exclusive top html_block_category_top&quot;&gt;\r\n      &lt;li&gt;\r\n           &lt;span class=&quot;icon flaticon-gift1&quot;&gt; &lt;/span&gt;\r\n           &lt;a href=&quot;index.php&quot;&gt;Deals Of The Day&lt;/a&gt;\r\n      &lt;/li&gt;\r\n     \r\n&lt;/ul&gt;', '', '&lt;ul class=&quot;exclusive bottom html_block_category_bottom&quot;&gt;\r\n      &lt;li&gt;\r\n           &lt;span class=&quot;icon flaticon-like&quot;&gt; &lt;/span&gt;\r\n           &lt;a href=&quot;index.php&quot;&gt;SPECIAL OFFER&lt;/a&gt;\r\n      &lt;/li&gt;\r\n      &lt;li&gt;\r\n           &lt;span class=&quot;icon flaticon-outlined3&quot;&gt; &lt;/span&gt; \r\n           &lt;a href=&quot;index.php&quot;&gt;UP TO 50% OFF DISCOUNTS&lt;/a&gt;\r\n      &lt;/li&gt;\r\n&lt;/ul&gt;', 'Women', '', ''),
(90, 1, 'Kids', '&lt;span class=&quot;label label-hot&quot;&gt;HOT&lt;/span&gt;', '', '', '', '&lt;ul class=&quot;exclusive top html_block_category_top&quot;&gt;\r\n      &lt;li&gt;\r\n           &lt;span class=&quot;icon flaticon-gift1&quot;&gt; &lt;/span&gt;\r\n           &lt;a href=&quot;index.php&quot;&gt;Gifts exclusive&lt;/a&gt;\r\n      &lt;/li&gt;\r\n      &lt;li&gt;\r\n           &lt;span class=&quot;icon flaticon-coin11&quot;&gt; &lt;/span&gt; \r\n           &lt;a href=&quot;index.php&quot;&gt;Offers&lt;/a&gt;\r\n      &lt;/li&gt;\r\n&lt;/ul&gt;', '&lt;div class=&quot;img-fullheight&quot;&gt;\r\n      &lt;img class=&quot;img-responsive&quot; src=&quot;image/baby.png&quot; alt=&quot;&quot;&gt;\r\n&lt;/div&gt;', '', 'kids', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_filter`
--

CREATE TABLE IF NOT EXISTS `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_path`
--

CREATE TABLE IF NOT EXISTS `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(85, 84, 1),
(84, 84, 1),
(85, 73, 0),
(83, 80, 1),
(83, 83, 2),
(84, 73, 0),
(82, 80, 1),
(82, 82, 2),
(83, 73, 0),
(81, 81, 2),
(82, 73, 0),
(81, 73, 0),
(81, 80, 1),
(80, 73, 0),
(80, 80, 1),
(79, 74, 1),
(79, 79, 2),
(77, 74, 1),
(75, 75, 2),
(76, 73, 0),
(75, 74, 1),
(73, 73, 0),
(79, 73, 0),
(78, 74, 1),
(78, 78, 2),
(77, 77, 2),
(78, 73, 0),
(90, 90, 0),
(89, 84, 1),
(89, 89, 2),
(88, 84, 1),
(88, 88, 2),
(89, 73, 0),
(87, 87, 2),
(88, 73, 0),
(87, 73, 0),
(87, 84, 1),
(86, 73, 0),
(86, 86, 2),
(85, 85, 2),
(86, 84, 1),
(77, 73, 0),
(75, 73, 0),
(76, 74, 1),
(76, 76, 2),
(74, 74, 1),
(74, 73, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(74, 14, 0),
(74, 13, 0),
(73, 20, 0),
(74, 12, 0),
(73, 19, 0),
(75, 16, 0),
(75, 15, 0),
(75, 18, 0),
(75, 17, 0),
(73, 18, 0),
(73, 17, 0),
(74, 18, 0),
(74, 19, 0),
(74, 20, 0),
(73, 16, 0),
(73, 15, 0),
(73, 14, 0),
(74, 10, 0),
(74, 9, 0),
(74, 0, 0),
(75, 20, 0),
(75, 19, 0),
(73, 13, 0),
(73, 12, 0),
(73, 10, 0),
(73, 9, 0),
(73, 0, 0),
(76, 14, 0),
(76, 13, 0),
(76, 12, 0),
(76, 10, 0),
(76, 9, 0),
(76, 0, 0),
(74, 17, 0),
(74, 16, 0),
(74, 15, 0),
(75, 0, 0),
(75, 9, 0),
(75, 10, 0),
(75, 12, 0),
(75, 13, 0),
(75, 14, 0),
(76, 15, 0),
(76, 16, 0),
(76, 17, 0),
(76, 18, 0),
(76, 19, 0),
(76, 20, 0),
(77, 0, 0),
(77, 9, 0),
(77, 10, 0),
(77, 12, 0),
(77, 13, 0),
(77, 14, 0),
(77, 15, 0),
(77, 16, 0),
(77, 17, 0),
(77, 18, 0),
(77, 19, 0),
(77, 20, 0),
(78, 0, 0),
(78, 9, 0),
(78, 10, 0),
(78, 12, 0),
(78, 13, 0),
(78, 14, 0),
(78, 15, 0),
(78, 16, 0),
(78, 17, 0),
(78, 18, 0),
(78, 19, 0),
(78, 20, 0),
(79, 0, 0),
(79, 9, 0),
(79, 10, 0),
(79, 12, 0),
(79, 13, 0),
(79, 14, 0),
(79, 15, 0),
(79, 16, 0),
(79, 17, 0),
(79, 18, 0),
(79, 19, 0),
(79, 20, 0),
(80, 0, 0),
(80, 9, 0),
(80, 10, 0),
(80, 12, 0),
(80, 13, 0),
(80, 14, 0),
(80, 15, 0),
(80, 16, 0),
(80, 17, 0),
(80, 18, 0),
(80, 19, 0),
(80, 20, 0),
(81, 0, 0),
(81, 9, 0),
(81, 10, 0),
(81, 12, 0),
(81, 13, 0),
(81, 14, 0),
(81, 15, 0),
(81, 16, 0),
(81, 17, 0),
(81, 18, 0),
(81, 19, 0),
(81, 20, 0),
(82, 0, 0),
(82, 9, 0),
(82, 10, 0),
(82, 12, 0),
(82, 13, 0),
(82, 14, 0),
(82, 15, 0),
(82, 16, 0),
(82, 17, 0),
(82, 18, 0),
(82, 19, 0),
(82, 20, 0),
(83, 0, 0),
(83, 9, 0),
(83, 10, 0),
(83, 12, 0),
(83, 13, 0),
(83, 14, 0),
(83, 15, 0),
(83, 16, 0),
(83, 17, 0),
(83, 18, 0),
(83, 19, 0),
(83, 20, 0),
(84, 20, 0),
(84, 19, 0),
(84, 18, 0),
(84, 17, 0),
(84, 16, 0),
(84, 15, 0),
(84, 14, 0),
(84, 13, 0),
(84, 12, 0),
(84, 10, 0),
(84, 9, 0),
(84, 0, 0),
(85, 0, 0),
(85, 9, 0),
(85, 10, 0),
(85, 12, 0),
(85, 13, 0),
(85, 14, 0),
(85, 15, 0),
(85, 16, 0),
(85, 17, 0),
(85, 18, 0),
(85, 19, 0),
(85, 20, 0),
(86, 20, 0),
(86, 19, 0),
(86, 18, 0),
(86, 17, 0),
(86, 16, 0),
(86, 15, 0),
(86, 14, 0),
(86, 13, 0),
(86, 12, 0),
(86, 10, 0),
(86, 9, 0),
(86, 0, 0),
(87, 0, 0),
(87, 9, 0),
(87, 10, 0),
(87, 12, 0),
(87, 13, 0),
(87, 14, 0),
(87, 15, 0),
(87, 16, 0),
(87, 17, 0),
(87, 18, 0),
(87, 19, 0),
(87, 20, 0),
(88, 0, 0),
(88, 9, 0),
(88, 10, 0),
(88, 12, 0),
(88, 13, 0),
(88, 14, 0),
(88, 15, 0),
(88, 16, 0),
(88, 17, 0),
(88, 18, 0),
(88, 19, 0),
(88, 20, 0),
(89, 0, 0),
(89, 9, 0),
(89, 10, 0),
(89, 12, 0),
(89, 13, 0),
(89, 14, 0),
(89, 15, 0),
(89, 16, 0),
(89, 17, 0),
(89, 18, 0),
(89, 19, 0),
(89, 20, 0),
(90, 20, 0),
(90, 19, 0),
(90, 18, 0),
(90, 17, 0),
(90, 16, 0),
(90, 15, 0),
(90, 14, 0),
(90, 13, 0),
(90, 12, 0),
(90, 10, 0),
(90, 9, 0),
(90, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_category_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_country`
--

CREATE TABLE IF NOT EXISTS `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=258 ;

--
-- Dumping data for table `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'Korea, Republic of', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon`
--

CREATE TABLE IF NOT EXISTS `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`, `vendor_id`) VALUES
(4, '-10% Discount', '2222', 'P', '10.0000', 0, 0, '0.0000', '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03', 0),
(5, 'Free Shipping', '3333', 'P', '0.0000', 0, 1, '100.0000', '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53', 0),
(6, '-10.00 Discount', '1111', 'F', '10.0000', 0, 0, '10.0000', '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_category`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_history`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_product`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_coupon_product_vendor`
--

CREATE TABLE IF NOT EXISTS `oc_coupon_product_vendor` (
  `coupon_product_vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,4) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_product_vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_currency`
--

CREATE TABLE IF NOT EXISTS `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Pound Sterling', 'GBP', '£', '', '2', 0.17950000, 1, '2015-12-13 11:56:20'),
(2, 'US Dollar', 'USD', '$', '', '2', 0.27230000, 1, '2015-12-13 11:56:20'),
(3, 'Euro', 'EUR', '', '€', '2', 0.24770001, 1, '2015-12-13 11:56:20'),
(4, 'Dirhams', 'AED', '', ' AED', '', 1.00000000, 1, '2015-12-13 11:56:20');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer`
--

CREATE TABLE IF NOT EXISTS `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `facebook_id` varchar(255) NOT NULL,
  `twitter_id` varchar(255) NOT NULL,
  `google_id` varchar(255) NOT NULL,
  `linkedin_id` varchar(255) NOT NULL,
  `vkontakte_id` varchar(255) NOT NULL,
  `odnoklassniki_id` varchar(255) NOT NULL,
  `live_id` varchar(255) NOT NULL,
  `yandex_id` varchar(255) NOT NULL,
  `mailru_id` varchar(255) NOT NULL,
  `instagram_id` varchar(255) NOT NULL,
  `paypal_id` varchar(255) NOT NULL,
  `vimeo_id` varchar(255) NOT NULL,
  `tumblr_id` varchar(255) NOT NULL,
  `yahoo_id` varchar(255) NOT NULL,
  `foursquare_id` varchar(255) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `oc_customer`
--

INSERT INTO `oc_customer` (`customer_id`, `customer_group_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `approved`, `safe`, `token`, `date_added`, `facebook_id`, `twitter_id`, `google_id`, `linkedin_id`, `vkontakte_id`, `odnoklassniki_id`, `live_id`, `yandex_id`, `mailru_id`, `instagram_id`, `paypal_id`, `vimeo_id`, `tumblr_id`, `yahoo_id`, `foursquare_id`) VALUES
(1, 1, 0, 'krishna', 'murthy', 'krish@gmail.com', '123456', '', '5d2771274e7d8a1bb66261a31e093fe88ac2cbec', '25d9610e8', 'a:0:{}', '', 0, 1, '', '122.178.175.141', 1, 1, 0, '', '2015-05-26 15:18:09', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, 1, 0, 'Fayas', 'kamar', 'fayas@clothfarm.com', '0504040919', '', '02764a90463a7f748df8a3ecda052fdcb59b9ad8', '97b0409c7', 'a:1:{s:40:"YToxOntzOjEwOiJwcm9kdWN0X2lkIjtpOjYyO30=";i:1;}', '', 0, 2, 'a:0:{}', '92.99.226.243', 1, 1, 0, '', '2015-12-07 01:35:58', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_activity`
--

CREATE TABLE IF NOT EXISTS `oc_customer_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `oc_customer_activity`
--

INSERT INTO `oc_customer_activity` (`activity_id`, `customer_id`, `key`, `data`, `ip`, `date_added`) VALUES
(1, 1, 'register', 'a:2:{s:11:"customer_id";i:1;s:4:"name";s:14:"krishna murthy";}', '192.168.8.100', '2015-05-26 15:18:10'),
(2, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";}', '192.168.8.100', '2015-06-01 13:11:54'),
(3, 1, 'order_account', 'a:3:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";s:8:"order_id";i:11;}', '192.168.8.100', '2015-06-01 13:14:34'),
(4, 1, 'order_account', 'a:3:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";s:8:"order_id";i:12;}', '192.168.8.100', '2015-06-01 13:15:48'),
(5, 1, 'order_account', 'a:3:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";s:8:"order_id";i:13;}', '192.168.8.100', '2015-06-01 13:19:36'),
(6, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";}', '192.168.8.100', '2015-06-01 17:50:24'),
(7, 1, 'order_account', 'a:3:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";s:8:"order_id";i:14;}', '192.168.8.100', '2015-06-01 17:50:42'),
(8, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";}', '192.168.8.100', '2015-06-01 17:58:28'),
(9, 1, 'order_account', 'a:3:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";s:8:"order_id";i:16;}', '192.168.8.100', '2015-06-01 18:25:22'),
(10, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";}', '192.168.8.100', '2015-06-04 18:27:07'),
(11, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";}', '192.168.8.100', '2015-06-04 20:42:22'),
(12, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";}', '192.168.8.100', '2015-06-04 23:15:20'),
(13, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";}', '192.168.8.100', '2015-06-04 23:24:36'),
(14, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";}', '192.168.8.100', '2015-06-14 10:48:19'),
(15, 1, 'order_account', 'a:3:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";s:8:"order_id";i:26;}', '192.168.8.100', '2015-06-14 10:49:01'),
(16, 1, 'order_account', 'a:3:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";s:8:"order_id";i:27;}', '192.168.8.100', '2015-06-14 11:28:34'),
(17, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";}', '192.168.1.2', '2015-07-19 16:13:15'),
(18, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";}', '192.168.1.4', '2015-08-02 11:52:06'),
(19, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";}', '192.168.1.4', '2015-12-04 18:42:16'),
(20, 1, 'order_account', 'a:3:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";s:8:"order_id";i:30;}', '192.168.1.4', '2015-12-04 18:42:43'),
(21, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";}', '192.168.1.3', '2015-12-05 17:32:40'),
(22, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";}', '192.168.1.3', '2015-12-05 18:06:46'),
(23, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";}', '122.178.122.129', '2015-12-05 07:48:05'),
(24, 1, 'order_account', 'a:3:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";s:8:"order_id";i:31;}', '122.178.122.129', '2015-12-05 07:48:23'),
(25, 1, 'login', 'a:2:{s:11:"customer_id";s:1:"1";s:4:"name";s:14:"krishna murthy";}', '122.178.175.141', '2015-12-06 01:11:49'),
(26, 2, 'register', 'a:2:{s:11:"customer_id";i:2;s:4:"name";s:11:"Fayas kamar";}', '92.99.226.243', '2015-12-07 01:35:58'),
(27, 2, 'order_account', 'a:3:{s:11:"customer_id";s:1:"2";s:4:"name";s:11:"Fayas kamar";s:8:"order_id";i:32;}', '92.99.226.243', '2015-12-07 01:37:16'),
(28, 2, 'forgotten', 'a:2:{s:11:"customer_id";s:1:"2";s:4:"name";s:11:"Fayas kamar";}', '92.99.226.243', '2015-12-10 13:15:39'),
(29, 2, 'login', 'a:2:{s:11:"customer_id";s:1:"2";s:4:"name";s:11:"Fayas kamar";}', '92.99.226.243', '2015-12-10 13:16:00'),
(30, 2, 'login', 'a:2:{s:11:"customer_id";s:1:"2";s:4:"name";s:11:"Fayas kamar";}', '92.99.226.243', '2015-12-11 01:10:31');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ban_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ban_ip` (
  `customer_ban_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`customer_ban_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_history`
--

CREATE TABLE IF NOT EXISTS `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_ip`
--

CREATE TABLE IF NOT EXISTS `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `oc_customer_ip`
--

INSERT INTO `oc_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '192.168.8.100', '2015-05-26 15:18:10'),
(2, 1, '192.168.1.2', '2015-07-08 18:11:05'),
(3, 1, '192.168.1.4', '2015-08-02 11:52:06'),
(4, 1, '192.168.1.3', '2015-12-05 13:18:16'),
(5, 1, '122.178.122.129', '2015-12-05 07:48:06'),
(6, 1, '122.178.175.141', '2015-12-06 01:11:49'),
(7, 2, '92.99.226.243', '2015-12-07 01:35:59');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_login`
--

CREATE TABLE IF NOT EXISTS `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `oc_customer_login`
--

INSERT INTO `oc_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1, 'krishnamurthy@gmail.com', '192.168.8.100', 1, '2015-06-01 07:41:21', '2015-06-01 07:41:21'),
(3, 'sales@kenzco.com', '92.99.226.243', 3, '2015-12-07 10:11:40', '2015-12-07 10:14:02'),
(4, 'sales@kenzco.com', '223.30.12.166', 2, '2015-12-07 10:44:49', '2015-12-07 10:45:28'),
(5, 'test@gmail.com', '92.99.226.243', 2, '2015-12-08 10:29:02', '2015-12-08 10:29:55'),
(7, 'sales@fortunegiftz.com', '92.99.226.243', 5, '2015-12-10 20:22:37', '2015-12-11 08:11:16'),
(8, 'fayas@kenzco.com', '92.99.226.243', 3, '2015-12-11 07:59:20', '2015-12-11 08:10:02'),
(10, 'fayas@kenzco.com', '31.215.215.58', 2, '2015-12-11 18:57:17', '2015-12-11 18:58:14'),
(11, 'mirza.ekm@gmail.com', '::1', 1, '2015-12-12 03:04:54', '2015-12-12 03:04:54');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_online`
--

CREATE TABLE IF NOT EXISTS `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_customer_online`
--

INSERT INTO `oc_customer_online` (`ip`, `customer_id`, `url`, `referer`, `date_added`) VALUES
('::1', 0, 'http://localhost/clothfarm/index.php?route=product/product&amp;product_id=62', '', '2015-12-13 18:54:32');

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_reward`
--

CREATE TABLE IF NOT EXISTS `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_customer_to_store` (
  `customer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oc_customer_to_store`
--

INSERT INTO `oc_customer_to_store` (`customer_id`, `store_id`) VALUES
(0, 1),
(0, 0),
(0, 2),
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  `merchant_id` int(11) NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download`
--

CREATE TABLE IF NOT EXISTS `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download_description`
--

CREATE TABLE IF NOT EXISTS `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_download_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_download_to_store` (
  `download_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`download_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_event`
--

CREATE TABLE IF NOT EXISTS `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`) VALUES
(1, 'pp_login', 'post.customer.logout', 'module/pp_login/logout'),
(2, 'amazon_login', 'post.customer.logout', 'module/amazon_login/logout'),
(3, 'amazon_pay', 'post.customer.logout', 'module/amazon_pay/logout'),
(4, 'advanced_colors', 'pre.admin.product.add', 'module/advanced_colors/preEditProduct'),
(5, 'advanced_colors', 'post.admin.product.add', 'module/advanced_colors/editProduct'),
(6, 'advanced_colors', 'pre.admin.product.edit', 'module/advanced_colors/preEditProduct'),
(7, 'advanced_colors', 'post.admin.product.edit', 'module/advanced_colors/editProduct');

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

CREATE TABLE IF NOT EXISTS `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=482 ;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(453, 'module', 'latest'),
(390, 'total', 'credit'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(454, 'module', 'special'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(455, 'module', 'random'),
(428, 'module', 'store'),
(431, 'module', 'amazon_button'),
(452, 'module', 'footer_info'),
(433, 'module', 'google_hangouts'),
(450, 'module', 'account'),
(445, 'module', 'information'),
(437, 'module', 'pp_login'),
(438, 'module', 'amazon_login'),
(439, 'module', 'amazon_pay'),
(440, 'module', 'pp_button'),
(451, 'module', 'topslider'),
(442, 'module', 'ebay_listing'),
(443, 'payment', 'authorizenet_aim'),
(444, 'payment', 'cheque'),
(481, 'module', 'news'),
(456, 'module', 'bestseller'),
(457, 'module', 'featured'),
(458, 'module', 'carousel'),
(459, 'module', 'category'),
(460, 'module', 'html'),
(461, 'module', 'filter'),
(462, 'module', 'fcategory'),
(463, 'module', 'customisation'),
(466, 'module', 'simple_blog'),
(467, 'module', 'simple_blog_category'),
(468, 'module', 'popular'),
(469, 'module', 'smartmenu'),
(470, 'module', 'upsells'),
(471, 'module', 'advanced_colors'),
(472, 'payment', 'pp_express'),
(474, 'module', 'banner'),
(480, 'module', 'veplatform');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter`
--

CREATE TABLE IF NOT EXISTS `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `oc_filter`
--

INSERT INTO `oc_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES
(3, 1, 3),
(2, 1, 1),
(1, 1, 2),
(4, 2, 1),
(5, 2, 2),
(6, 2, 3),
(7, 1, 4),
(8, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_filter_description`
--

INSERT INTO `oc_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES
(3, 1, 1, 'green'),
(2, 1, 1, 'blue'),
(1, 1, 1, 'brown'),
(4, 1, 2, '$0 - $100'),
(5, 1, 2, '$101 - $200'),
(6, 1, 2, '$201 - $500'),
(7, 1, 1, 'red'),
(8, 1, 1, 'violet');

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_filter_group`
--

INSERT INTO `oc_filter_group` (`filter_group_id`, `sort_order`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_filter_group_description`
--

INSERT INTO `oc_filter_group_description` (`filter_group_id`, `language_id`, `name`) VALUES
(1, 1, 'Color'),
(2, 1, 'Price');

-- --------------------------------------------------------

--
-- Table structure for table `oc_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information`
--

CREATE TABLE IF NOT EXISTS `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1),
(10, 1, 10, 1),
(21, 0, 0, 1),
(12, 0, 3, 1),
(14, 0, 6, 1),
(15, 0, 7, 1),
(16, 0, 8, 1),
(17, 0, 9, 1),
(18, 0, 11, 1),
(19, 0, 12, 1),
(20, 0, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_description`
--

CREATE TABLE IF NOT EXISTS `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(4, 1, 'About Us', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', '', '', ''),
(5, 1, 'Terms &amp; Conditions', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', '', '', '');
INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(3, 1, 'Privacy Policy', '&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-outline-level:1;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;Introduction&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;1)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; Our privacy policy describes the ways in which we collect,\r\nstore, use and protect your personal information and it is important for you to\r\nreview this privacy policy.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;By &quot;personal\r\ninformation&quot; we mean information that can be associated with a specific\r\nperson and can be used to identify that person.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;2)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; We do not consider anonymized information to constitute\r\npersonal information as it cannot be used to identify a specific person. We\r\ncollect personal information from you when you use clothfarm.com or its related\r\nwebsites and services (&quot;Site&quot;) (including, without limitation, when\r\nyou buy and sell items or participate in auctions or when you telephone or\r\nemail our customer support team). &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;By providing us with your personal\r\ninformation you expressly consent to us processing your personal information in\r\naccordance with the terms of our privacy policy.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;3)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; We may amend our privacy policy at any time by posting a\r\nrevised version on the Site. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;The revised version will be\r\neffective at the time we post it and, following such posting, your continued\r\nuse of the Site will constitute your express consent to us continuing to\r\nprocess your personal information in accordance with the terms of our revised\r\nprivacy policy.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;4)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; We last amended our privacy policy on 4 November 2009 and we\r\nwould encourage you to check the Site regularly for the announcement of any\r\namendments to our privacy policy.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-outline-level:1;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;Our privacy policy covers the\r\nfollowing topics:&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;1. our collection of your personal\r\ninformation&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;2. our use of your personal\r\ninformation&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;3. your use of your and other\r\nusers’ personal information&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;4. accessing, reviewing and\r\namending your personal information&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;5. third party website links&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;6. cookies&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;7. no spam or spoof emails&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;8. protecting your personal\r\ninformation&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;9. how you can contact us about\r\nprivacy questions&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-outline-level:1;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;Our collection of your personal\r\ninformation&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;1)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; As part of your registration on the Site, you will be asked to\r\nprovide us with certain personal information, such as your name, shipping\r\naddress, email address and/or telephone number and other similar information as\r\nwell as some additional information about you such as your date of birth or\r\nother identifying information.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;Additionally, in order for us to\r\nverify your identity, we may need to request from you valid proof of\r\nidentification (e.g. in the form of a copy of your passport, resident’s visa or\r\npermit, national ID card and/or driver’s license).&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;2)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; We will also need to collect selected financial information\r\nfrom you, such as your credit card and/or bank account details.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;3)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; You will need to input this financial information into the\r\n&quot;My Account&quot; section of the Site. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;We use this financial information\r\nfor billing purposes and for the fulfilment of your orders. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;Following your registration on the\r\nSite, you should not post any personal information (including any financial\r\ninformation) anywhere on the Site other than on the My Account section of the\r\nSite. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;Restricting the posting of\r\npersonal information to the My Account section of the Site protects you from\r\nthe possibility of fraud or identity theft. The posting by you of any personal\r\ninformation anywhere on the Site other than on the My Account section of the\r\nSite may lead to the suspension of your use of the Site.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;4)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; We will collect transactional information based on your\r\nactivities using the Site (such as buying and selling items and participating\r\nin auctions), This transactional information is used solely in relation to the\r\ntransactions you undertake on the Site and for no other reasons.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;5)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; Please note that we may use your Internet protocol (or IP)\r\naddress (which is a unique number assigned to your computer server or your\r\nInternet service provider (or ISP)) to analyse user trends and improve the\r\nadministration of the Site.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;6)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; We may also collect information about your computer (for\r\nexample, browser type) and navigation information (for example, the pages you\r\nvisit on the Site) along with the times that you access the Site.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;Finally, we may collect additional\r\ninformation from or about you in other ways not specifically described here. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;For example, we may collect\r\ninformation related to your contact with our customer support team or store\r\nresults when you respond to a survey. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;We may also collect feedback ratings\r\nand other comments relating to your use of the Site. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;Where we aggregate personal\r\ninformation for statistical purposes, such aggregated personal information\r\nshall be anonymized.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-outline-level:1;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;Our use of your personal\r\ninformation&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;1)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; We only use your personal information to provide services and\r\ncustomer support to you; to measure and improve our services to you; to prevent\r\nillegal activities and implement our user agreement with you (&quot;User\r\nAgreement&quot;); troubleshoot problems; collect fees; provide you with\r\npromotional emails and verify information you give us with third parties. For\r\nexample, we may share some of the personal information you give us with banks\r\nor credit card authorisation, processing and verification services or with third\r\nparties for fraud screening purposes.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;2)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; Though we make every effort to preserve your privacy, we may\r\nneed to disclose your personal information to law enforcement agencies,\r\ngovernment agencies or other third parties where we are compelled so to do by court\r\norder or similar legal procedure; where we are required to disclose your\r\npersonal information to comply with law; where we are cooperating with an\r\nongoing law enforcement investigation or where we have a good faith belief that\r\nour disclosure of your personal information is necessary to prevent physical\r\nharm or financial loss, to report suspected illegal activity or to investigate\r\na possible violation of our User Agreement.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;3)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; In the event of a sale of clothfarm.com, any of its affiliates\r\nand subsidiaries or any related business assets, your personal information may\r\nbe disclosed to any potential purchaser for the purposes of the continued\r\nprovision of the Site or otherwise in relation to any such sale.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;We may share your personal\r\ninformation with our other group companies so as to provide joint content and\r\nservices to you, to help detect illegal acts and/or the violations of our\r\npolicies. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;We may also share your personal\r\ninformation with other Site members as part of an auction or &quot;Buy\r\nNow&quot; purchase on the Site. For example, at the end of a successful auction\r\non the Site we will provide the seller and the successful buyer with each\r\nother’s contact information.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;This contact information will be\r\nthe personal information provided by you to us on registration and, as a\r\nresult, should always be kept up-to-date.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;4)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; Additionally, information relating to items you are buying or\r\nselling or auctions you are participating in be displayed on the Site. This\r\ninformation can include details of your user ID, feedback ratings and\r\nassociated comments relating to your use of the Site. Otherwise, we will only\r\ndisclose your personal information to a third party with your express\r\npermission.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;5)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; We do not sell or rent any of your personal information to\r\nthird parties in the normal course of doing business and will only share your\r\npersonal information with third parties in accordance with this privacy policy.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;6)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; By registering on the Site, you give us your express consent to\r\nreceive promotional emails about our services and emails announcing changes to,\r\nand new features on, the Site. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;If, at any time, you decide that\r\nyou do not wish to receive any such emails, you can opt out of receiving such\r\nemails by clicking on the link at the bottom of any of the emails or by going\r\nto the My Account section of the Site.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;7)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; Additionally, we do use comments made by you about the Site for\r\nmarketing purposes and by making such comments you expressly consent to our\r\nusing such comments for marketing purposes.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-outline-level:1;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;Your use of your and other\r\nusers’ personal information&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:\r\nOpenSans;mso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;1)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; Site members may need to share personal information (including\r\nfinancial information) with each other to complete transactions on the Site.\r\nYou should respect, at all times, the privacy of other Site members.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;2)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; We cannot guarantee the privacy of your personal information\r\nwhen you share personal information with other Site members so you should\r\nalways seek information on the privacy and security policies of any other Site\r\nmembers with whom you are transacting prior to sharing any of your personal\r\ninformation with another Site member.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;3)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; This privacy policy does not cover your release of your\r\npersonal information to another Site member.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;4)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; You agree to use any personal information received from another\r\nSite member in relation to a transaction on the Site solely in relation to such\r\ntransaction and shall not use the information received from another Site member\r\nfor any other purposes (except with the express consent of the other Site\r\nmember).&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;5)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; You acknowledge and agree and you shall use personal\r\ninformation received from another Site member in accordance with all applicable\r\nlaws.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-outline-level:1;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;Accessing, reviewing and\r\namending your personal information&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;\r\nfont-family:OpenSans;mso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;1)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; You can access and review your personal information in the My\r\nAccount section of the Site. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;If your personal information\r\nchanges in any way or is incorrectly presented on the Site you should\r\nimmediately update or correct your personal information (as applicable) by\r\naccessing the My Account section on the Site or, alternatively, by contacting\r\nour customer support team. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;The &quot;Customer Support&quot;\r\nlink at the top of each Site webpage contains our customer support email and\r\nphone details.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;2)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; Please note that we shall retain your personal information\r\nduring and following the end of your use of the Site as required to comply with\r\nlaw, for technical troubleshooting requirements, to prevent fraud, to assist in\r\nany legal investigations and to take any other actions otherwise permitted by\r\nlaw.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-outline-level:1;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;Third party website links&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;The Site may contains links to\r\nother websites. Please be aware that we are not responsible for the privacy\r\npractices of such other websites. We encourage you when you leave the Site to\r\nread the privacy statements of each and every website you visit if you intend\r\nto provide personal information to that website. Our privacy policy applies\r\nsolely to your personal information that we collect on the Site.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-outline-level:1;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;Cookies&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;1)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; Like many websites, the Site uses ''cookie'' technology (small\r\ncomputer files placed on your computer’s hard drive). When you go to particular\r\nwebsite pages on the Site, the cookie identifies your browser with a unique,\r\nrandom number.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;2)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; The cookies we use do not reveal any personal information about\r\nyou. Cookies help us improve your experience of the Site and also help us\r\nunderstand which parts of the Site are the most popular. You are always free to\r\ndecline our cookies if your browser permits, although doing so may interfere\r\nwith your use of the Site.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-outline-level:1;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;No spam or spoof emails&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;1)&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;mso-bidi-font-family:OpenSans;\r\ncolor:#1A1A1A&quot;&gt; We do not tolerate spam. To report Site related spam or spoof\r\nemails, please forward the email to spam@clothfarm.com or spoof@clothfarm.com.\r\nYou may not use our communication tools to send spam or otherwise send content\r\nthat would violate our User Agreement. We automatically scan and may manually\r\nfilter messages to check for spam, viruses, phishing attacks and other\r\nmalicious activity or illegal or prohibited content.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-outline-level:1;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;Protecting your personal\r\ninformation&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;We hold your personal information\r\non servers located in the United Kingdom and the United States. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;By providing us with personal\r\ninformation, you consent to the transfer of your personal information to, and\r\nits storage on, our servers located in the United Kingdom and/or the United\r\nStates. We take every precaution to safeguard all your personal information\r\nfrom unauthorised access, use or disclosure. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;All personal information is\r\nencrypted. However, the Internet is not a secure medium and we cannot guarantee\r\nthe privacy of your personal information.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;You must enter your username and\r\npassword each time you want to access your account or make transactions on the\r\nSite.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;Choose your password carefully\r\nusing unique numbers, letters and special characters.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-outline-level:1;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;Never share your username and\r\npassword with anyone.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;If you are concerned that your\r\nusername or password has been compromised, please contact our customer support\r\nteam immediately and ensure you change your password by logging onto the My\r\nAccount section of the Site.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-outline-level:1;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:#1A1A1A&quot;&gt;How you can contact us about\r\nprivacy questions&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:OpenSans;\r\nmso-bidi-font-family:OpenSans;color:#1A1A1A&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;!--[if gte mso 9]&gt;&lt;xml&gt;\r\n &lt;o:OfficeDocumentSettings&gt;\r\n  &lt;o:AllowPNG&gt;&lt;/o:AllowPNG&gt;\r\n  &lt;o:PixelsPerInch&gt;96&lt;/o:PixelsPerInch&gt;\r\n &lt;/o:OfficeDocumentSettings&gt;\r\n&lt;/xml&gt;&lt;![endif]--&gt;\r\n\r\n&lt;!--[if gte mso 9]&gt;&lt;xml&gt;\r\n &lt;w:WordDocument&gt;\r\n  &lt;w:View&gt;Normal&lt;/w:View&gt;\r\n  &lt;w:Zoom&gt;0&lt;/w:Zoom&gt;\r\n  &lt;w:TrackMoves&gt;&lt;/w:TrackMoves&gt;\r\n  &lt;w:TrackFormatting&gt;&lt;/w:TrackFormatting&gt;\r\n  &lt;w:PunctuationKerning&gt;&lt;/w:PunctuationKerning&gt;\r\n  &lt;w:ValidateAgainstSchemas&gt;&lt;/w:ValidateAgainstSchemas&gt;\r\n  &lt;w:SaveIfXMLInvalid&gt;false&lt;/w:SaveIfXMLInvalid&gt;\r\n  &lt;w:IgnoreMixedContent&gt;false&lt;/w:IgnoreMixedContent&gt;\r\n  &lt;w:AlwaysShowPlaceholderText&gt;false&lt;/w:AlwaysShowPlaceholderText&gt;\r\n  &lt;w:DoNotPromoteQF&gt;&lt;/w:DoNotPromoteQF&gt;\r\n  &lt;w:LidThemeOther&gt;EN-US&lt;/w:LidThemeOther&gt;\r\n  &lt;w:LidThemeAsian&gt;JA&lt;/w:LidThemeAsian&gt;\r\n  &lt;w:LidThemeComplexScript&gt;X-NONE&lt;/w:LidThemeComplexScript&gt;\r\n  &lt;w:Compatibility&gt;\r\n   &lt;w:BreakWrappedTables&gt;&lt;/w:BreakWrappedTables&gt;\r\n   &lt;w:SnapToGridInCell&gt;&lt;/w:SnapToGridInCell&gt;\r\n   &lt;w:WrapTextWithPunct&gt;&lt;/w:WrapTextWithPunct&gt;\r\n   &lt;w:UseAsianBreakRules&gt;&lt;/w:UseAsianBreakRules&gt;\r\n   &lt;w:DontGrowAutofit&gt;&lt;/w:DontGrowAutofit&gt;\r\n   &lt;w:SplitPgBreakAndParaMark&gt;&lt;/w:SplitPgBreakAndParaMark&gt;\r\n   &lt;w:EnableOpenTypeKerning&gt;&lt;/w:EnableOpenTypeKerning&gt;\r\n   &lt;w:DontFlipMirrorIndents&gt;&lt;/w:DontFlipMirrorIndents&gt;\r\n   &lt;w:OverrideTableStyleHps&gt;&lt;/w:OverrideTableStyleHps&gt;\r\n   &lt;w:UseFELayout&gt;&lt;/w:UseFELayout&gt;\r\n  &lt;/w:Compatibility&gt;\r\n  &lt;m:mathPr&gt;\r\n   &lt;m:mathFont m:val=&quot;Cambria Math&quot;&gt;&lt;/m:mathFont&gt;\r\n   &lt;m:brkBin m:val=&quot;before&quot;&gt;&lt;/m:brkBin&gt;\r\n   &lt;m:brkBinSub m:val=&quot;&amp;#45;-&quot;&gt;&lt;/m:brkBinSub&gt;\r\n   &lt;m:smallFrac m:val=&quot;off&quot;&gt;&lt;/m:smallFrac&gt;\r\n   &lt;m:dispDef&gt;&lt;/m:dispDef&gt;\r\n   &lt;m:lMargin m:val=&quot;0&quot;&gt;&lt;/m:lMargin&gt;\r\n   &lt;m:rMargin m:val=&quot;0&quot;&gt;&lt;/m:rMargin&gt;\r\n   &lt;m:defJc m:val=&quot;centerGroup&quot;&gt;&lt;/m:defJc&gt;\r\n   &lt;m:wrapIndent m:val=&quot;1440&quot;&gt;&lt;/m:wrapIndent&gt;\r\n   &lt;m:intLim m:val=&quot;subSup&quot;&gt;&lt;/m:intLim&gt;\r\n   &lt;m:naryLim m:val=&quot;undOvr&quot;&gt;&lt;/m:naryLim&gt;\r\n  &lt;/m:mathPr&gt;&lt;/w:WordDocument&gt;\r\n&lt;/xml&gt;&lt;![endif]--&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;\r\n &lt;w:LatentStyles DefLockedState=&quot;false&quot; DefUnhideWhenUsed=&quot;false&quot;\r\n  DefSemiHidden=&quot;false&quot; DefQFormat=&quot;false&quot; DefPriority=&quot;99&quot;\r\n  LatentStyleCount=&quot;380&quot;&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;0&quot; QFormat=&quot;true&quot; Name=&quot;Normal&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;9&quot; QFormat=&quot;true&quot; Name=&quot;heading 1&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;9&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; QFormat=&quot;true&quot; Name=&quot;heading 2&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;9&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; QFormat=&quot;true&quot; Name=&quot;heading 3&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;9&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; QFormat=&quot;true&quot; Name=&quot;heading 4&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;9&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; QFormat=&quot;true&quot; Name=&quot;heading 5&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;9&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; QFormat=&quot;true&quot; Name=&quot;heading 6&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;9&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; QFormat=&quot;true&quot; Name=&quot;heading 7&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;9&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; QFormat=&quot;true&quot; Name=&quot;heading 8&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;9&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; QFormat=&quot;true&quot; Name=&quot;heading 9&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;index 1&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;index 2&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;index 3&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;index 4&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;index 5&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;index 6&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;index 7&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;index 8&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;index 9&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;39&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; Name=&quot;toc 1&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;39&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; Name=&quot;toc 2&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;39&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; Name=&quot;toc 3&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;39&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; Name=&quot;toc 4&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;39&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; Name=&quot;toc 5&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;39&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; Name=&quot;toc 6&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;39&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; Name=&quot;toc 7&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;39&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; Name=&quot;toc 8&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;39&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; Name=&quot;toc 9&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Normal Indent&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;footnote text&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;annotation text&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;header&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;footer&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;index heading&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;35&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; QFormat=&quot;true&quot; Name=&quot;caption&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;table of figures&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;envelope address&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;envelope return&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;footnote reference&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;annotation reference&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;line number&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;page number&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;endnote reference&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;endnote text&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;table of authorities&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;macro&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;toa heading&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List Bullet&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List Number&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List 2&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List 3&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List 4&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List 5&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List Bullet 2&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List Bullet 3&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List Bullet 4&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List Bullet 5&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List Number 2&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List Number 3&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List Number 4&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List Number 5&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;10&quot; QFormat=&quot;true&quot; Name=&quot;Title&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Closing&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Signature&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;1&quot; SemiHidden=&quot;true&quot;\r\n   UnhideWhenUsed=&quot;true&quot; Name=&quot;Default Paragraph Font&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Body Text&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Body Text Indent&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List Continue&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List Continue 2&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List Continue 3&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List Continue 4&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;List Continue 5&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Message Header&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;11&quot; QFormat=&quot;true&quot; Name=&quot;Subtitle&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Salutation&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Date&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Body Text First Indent&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Body Text First Indent 2&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Note Heading&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Body Text 2&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Body Text 3&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Body Text Indent 2&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Body Text Indent 3&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Block Text&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Hyperlink&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;FollowedHyperlink&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;22&quot; QFormat=&quot;true&quot; Name=&quot;Strong&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; Priority=&quot;20&quot; QFormat=&quot;true&quot; Name=&quot;Emphasis&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Document Map&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;Plain Text&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&quot;false&quot; SemiHidden=&quot;true&quot; UnhideWhenUsed=&quot;true&quot;\r\n   Name=&quot;E-mail Signature&quot;&gt;&lt;/w:LsdException&gt;\r\n  &lt;w:LsdException Locked=&qu', 'Privacy Policy', '', '');
INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(6, 1, 'Delivery Information', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', '', '', ''),
(15, 1, 'Our office', '&lt;div&gt;\r\n    &lt;section&gt;\r\n        &lt;img src=&quot;image/catalog/blocks/img-our-office.jpg&quot; alt=&quot;&quot; class=&quot;animate scale full-width text-center&quot;&gt;\r\n    &lt;/section&gt;\r\n    &lt;section class=&quot;container content&quot;&gt;\r\n        &lt;div class=&quot;divider-sm&quot;&gt;&lt;/div&gt;&lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;iframe style=&quot;width:100%; height: 270px; margin: 0; border: 0; overflow:hidden;&quot; src=&quot;https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d28038.165053806308!2d-81.36288248825763!3d28.546613186851783!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xf3846176f3dff5ed!2sLa+Aurora!5e0!3m2!1sen!2sus!4v1416911810902&quot;&gt;&lt;/iframe&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;divider-md visible-xs&quot;&gt;&lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-8 col-md-8 col-lg-8&quot;&gt;\r\n            &lt;h2&gt;ABOUT OUR OFFICE&lt;/h2&gt;\r\n            &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros   tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit   amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor   vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque   penatibus et magnis dis parturient montes, nascetur ridiculus mus.   Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse   fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam   lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;br&gt;\r\n            &lt;/p&gt;\r\n            &lt;p class=&quot;upper&quot;&gt;Donec et mi eu massa ultrices scelerisque. &lt;/p&gt;\r\n            &lt;p class=&quot;upper&quot;&gt;Nullam ac nisi non eros gravida venenatis sollicitudin lobortis &lt;/p&gt;\r\n            &lt;p class=&quot;upper&quot;&gt;Curabitur convallis facilisis lorem. Vivamus euismod nulla vel nunc &lt;/p&gt;\r\n            &lt;p class=&quot;upper&quot;&gt;Fusce tincidunt, justo congue egestas&lt;/p&gt;\r\n            &lt;p&gt;Donec et mi eu massa ultrices scelerisque. Nullam ac nisi   non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis   pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;&lt;div class=&quot;divider-xl&quot;&gt;&lt;/div&gt;\r\n        &lt;div class=&quot;subtitle&quot;&gt;\r\n            &lt;div&gt;&lt;span&gt;OUR TEAM&lt;/span&gt;&lt;/div&gt;\r\n        &lt;/div&gt;\r\n\r\n    &lt;/section&gt;&lt;div class=&quot;images-gallery four-columns&quot;&gt;\r\n    &lt;div class=&quot;images-nospace team-gallery&quot;&gt;\r\n        &lt;div class=&quot;image-thumbnail&quot;&gt;&lt;img src=&quot;image/catalog/blocks/team-member-01.jpg&quot; alt=&quot;&quot;&gt;\r\n            &lt;div class=&quot;hover&quot;&gt;\r\n                &lt;div class=&quot;inside&quot;&gt;\r\n                    &lt;h4&gt;Mike Williams &lt;/h4&gt;\r\n                    &lt;h5&gt;Manager &lt;/h5&gt;\r\n                    &lt;ul class=&quot;socials socials-lg&quot;&gt;\r\n                        &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                        &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                        &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                        &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;/ul&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;image-thumbnail&quot;&gt; &lt;img src=&quot;image/catalog/blocks/team-member-02.jpg&quot; alt=&quot;&quot;&gt;\r\n            &lt;div class=&quot;hover&quot;&gt;&lt;div class=&quot;inside&quot;&gt;\r\n                &lt;h4&gt;Matthew Davies &lt;/h4&gt;\r\n                &lt;h5&gt;Manager &lt;/h5&gt;\r\n                &lt;ul class=&quot;socials socials-lg&quot;&gt;\r\n                    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                &lt;/ul&gt;\r\n            &lt;/div&gt;&lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;image-thumbnail&quot;&gt; &lt;img src=&quot;image/catalog/blocks/team-member-03.jpg&quot; alt=&quot;&quot;&gt;\r\n            &lt;div class=&quot;hover&quot;&gt;&lt;div class=&quot;inside&quot;&gt;\r\n                &lt;h4&gt;Ryan Thomas &lt;/h4&gt;\r\n                &lt;h5&gt;Manager &lt;/h5&gt;\r\n                &lt;ul class=&quot;socials socials-lg&quot;&gt;\r\n                    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                &lt;/ul&gt;\r\n            &lt;/div&gt;&lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;image-thumbnail&quot;&gt;&lt;img src=&quot;image/catalog/blocks/team-member-04.jpg&quot; alt=&quot;&quot;&gt;\r\n            &lt;div class=&quot;hover&quot;&gt;&lt;div class=&quot;inside&quot;&gt;\r\n                &lt;h4&gt;Emma Smith&lt;/h4&gt;\r\n                &lt;h5&gt;Manager &lt;/h5&gt;\r\n                &lt;ul class=&quot;socials socials-lg&quot;&gt;\r\n                    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                &lt;/ul&gt;\r\n            &lt;/div&gt;&lt;/div&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;/div&gt;\r\n', 'Our office', '', ''),
(16, 1, 'Our story', '&lt;div&gt;   \r\n\r\n    &lt;iframe src=&quot;https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d6115.684863819771!2d-82.9719195443651!3d39.96727545833253!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xf3846176f3dff5ed!2sLa+Aurora!5e0!3m2!1sen!2sus!4v1416911994304&quot; class=&quot;google-map&quot;&gt;&lt;/iframe&gt;      &lt;div class=&quot;row&quot;&gt;\r\n    &lt;div class=&quot;divider-lg&quot;&gt;&lt;/div&gt;\r\n\r\n    &lt;div class=&quot;col-sm-6 col-md-6&quot;&gt;\r\n        &lt;div class=&quot;subtitle&quot;&gt;\r\n            &lt;div&gt;&lt;span&gt;aBOUT OUR STORE&lt;/span&gt;&lt;/div&gt;\r\n\r\n        &lt;/div&gt;\r\n\r\n        &lt;p&gt;&lt;strong&gt;Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi. Curabitur molestie euismod erat. Proin eros odio, mattis rutrum, pulvinar et, egestas vitae, magna. Integer semper, velit ut interdum malesuada. &lt;/strong&gt;&lt;/p&gt;\r\n\r\n        &lt;p&gt;Pellentesque adipiscing nisi. Nulla facilisi. Mauris lacinia lectus sit amet felis. Aliquam erat volutpat. Nulla porttitor tortor at nisl. Nam lectus nulla, bibendum pretium, dictum a, mattis nec, dolor. Nullam id justo enim sem ut pede. Aenean quam. Nulla neque purus, ullamcorper nec, eleifend at, fermentum ut, turpis. Mauris et ligula quis erat dignissim imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. &lt;/p&gt;\r\n\r\n        &lt;p&gt;Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes.&lt;/p&gt;\r\n\r\n        &lt;p&gt;&lt;/p&gt;\r\n\r\n    &lt;/div&gt;\r\n\r\n    &lt;div class=&quot;col-sm-6 col-md-6&quot;&gt;\r\n        &lt;div class=&quot;subtitle&quot;&gt;\r\n            &lt;div&gt;&lt;span&gt;SPECIAL INFORMATION&lt;/span&gt;&lt;/div&gt;\r\n\r\n        &lt;/div&gt;\r\n\r\n        &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;/p&gt;\r\n\r\n        &lt;p class=&quot;upper&quot;&gt;Donec et mi eu massa ultrices scelerisque. &lt;/p&gt;\r\n\r\n        &lt;p class=&quot;upper&quot;&gt;Nullam ac nisi non eros gravida venenatis sollicitudin lobortis &lt;/p&gt;\r\n\r\n        &lt;p class=&quot;upper&quot;&gt;Curabitur convallis facilisis lorem. Vivamus euismod nulla vel nunc&lt;/p&gt;\r\n\r\n        &lt;p class=&quot;upper&quot;&gt;Fusce tincidunt, justo congue egestas&lt;/p&gt;\r\n\r\n    &lt;/div&gt;\r\n\r\n&lt;/div&gt;\r\n\r\n    &lt;div class=&quot;divider-xl&quot;&gt;&lt;/div&gt;\r\n\r\n    &lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-sm-3 col-md-3 col-lg-3&quot;&gt; &lt;img class=&quot;img-responsive animate scale&quot; src=&quot;image/catalog/blocks/img-our-store.jpg&quot; alt=&quot;&quot;&gt; &lt;/div&gt;\r\n\r\n        &lt;div class=&quot;divider-md visible-xs&quot;&gt;&lt;/div&gt;\r\n\r\n        &lt;div class=&quot;col-sm-5 col-md-6 col-lg-6&quot;&gt;\r\n            &lt;h3&gt;Lorem ipsum dolor&lt;/h3&gt;\r\n\r\n            &lt;p&gt;Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi. Curabitur molestie euismod erat. Proin eros odio, mattis rutrum, pulvinar et, porttitor tortor at nisl. Nam Nullam id justo sed diam aliquam tincidunt. Duis sollicitudin, dui ac commodo iaculis tincidunt.&lt;br&gt;\r\n                Aenean quam. Nulla neque purus, ullamcorper nec, eleifend at, fermentum ut, turpis. Mauris et magna, dictum et, pulvinar non, ultricies ac, nibh. &lt;br&gt;\r\n            &lt;/p&gt;\r\n\r\n            &lt;p class=&quot;upper&quot;&gt;Donec et mi eu massa ultrices scelerisque. &lt;/p&gt;\r\n\r\n            &lt;p class=&quot;upper&quot;&gt;Nullam ac nisi non eros gravida venenatis sollicitudin lobortis &lt;/p&gt;\r\n\r\n            &lt;p class=&quot;upper&quot;&gt;Curabitur convallis facilisis lorem. Vivamus euismod nulla vel nunc&lt;/p&gt;\r\n\r\n            &lt;p class=&quot;upper&quot;&gt;Fusce tincidunt, justo congue egestas &lt;/p&gt;\r\n\r\n            &lt;p&gt;Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi. Curabitur molestie euismod erat. Proin eros odio, mattis rutrum, pulvinar et, egestas vitae, magna. Integer semper, velit ut interdum malesuada.  Pellentesque adipiscing nisi. Nulla facilisi. Mauris lacinia lectus sit amet felis. Aliquam erat volutpat.&lt;/p&gt;\r\n\r\n            &lt;br&gt;\r\n            &lt;p&gt;&lt;a href=&quot;index.php&quot; class=&quot;btn btn-lg btn-cool&quot;&gt;GET STARTED NOW!&lt;/a&gt; &lt;/p&gt;\r\n\r\n        &lt;/div&gt;\r\n\r\n        &lt;div class=&quot;divider-md visible-xs&quot;&gt;&lt;/div&gt;\r\n\r\n        &lt;div class=&quot;col-sm-4 col-md-3 col-lg-3 text-center&quot;&gt;\r\n            &lt;div class=&quot;rect&quot;&gt;\r\n                &lt;div class=&quot;animate scale icon-outer&quot;&gt;&lt;span class=&quot;icon flaticon-clock61&quot;&gt;&lt;/span&gt;&lt;/div&gt;\r\n\r\n                &lt;h6&gt;&lt;strong&gt;&lt;/strong&gt;OPENING TIME&lt;/h6&gt;\r\n\r\n                &lt;p&gt;Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi. Curabitur molestie euismod erat. Proin eros odio, mattis rutrum, &lt;/p&gt;\r\n\r\n                &lt;div class=&quot;line-divider&quot;&gt;&lt;/div&gt;\r\n\r\n                &lt;div class=&quot;divider-xs&quot;&gt;&lt;/div&gt;\r\n\r\n                &lt;h6&gt;Mon-Sat: 10am-8pm&lt;br&gt;\r\n                    Sun: 11.30am-5pm&lt;/h6&gt;\r\n\r\n            &lt;/div&gt;\r\n\r\n        &lt;/div&gt;\r\n\r\n    &lt;/div&gt;\r\n\r\n&lt;/div&gt;', 'Our story', '', ''),
(10, 1, 'About', '&lt;div&gt;\r\n        &lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;img class=&quot;img-responsive animate scale&quot; src=&quot;image/catalog/blocks/about-us-image.jpg&quot; alt=&quot;&quot;&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;divider-md visible-xs&quot;&gt;&lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-8 col-md-8 col-lg-8&quot;&gt;\r\n            &lt;h2&gt;Who We Are?&lt;/h2&gt;\r\n            &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;/p&gt;\r\n            &lt;p&gt;Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n            &lt;a href=&quot;index.php&quot; class=&quot;btn btn-cool btn-lg&quot;&gt;GET STARTED NOW!&lt;/a&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n        &lt;div class=&quot;divider-xl&quot;&gt;&lt;/div&gt;\r\n        &lt;div class=&quot;row&quot;&gt;\r\n            &lt;div class=&quot;col-sm-6 col-md-3 col-lg-3 text-center&quot;&gt;\r\n                &lt;div class=&quot;rect&quot;&gt;\r\n                    &lt;div class=&quot;animate scale icon-outer&quot;&gt;&lt;span class=&quot;icon flaticon-attachment13&quot;&gt;&lt;/span&gt;&lt;/div&gt;\r\n                    &lt;h6&gt;&lt;strong&gt;Ut sit amet turpis&lt;/strong&gt;&lt;/h6&gt;\r\n                    &lt;p&gt;In est arcu vitae sollicitudin eu, vehicula venenatis est tempor diam&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;col-sm-6 col-md-3 col-lg-3 text-center&quot;&gt;\r\n                &lt;div class=&quot;rect&quot;&gt;\r\n                    &lt;div class=&quot;animate scale icon-outer&quot;&gt;&lt;span class=&quot;icon flaticon-shopping155&quot;&gt;&lt;/span&gt;&lt;/div&gt;\r\n                    &lt;h6&gt;&lt;strong&gt;Ut sit amet turpis&lt;/strong&gt;&lt;/h6&gt;\r\n                    &lt;p&gt;In est arcu vitae sollicitudin eu, vehicula venenatis est tempor diam&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;col-sm-6 col-md-3 col-lg-3 text-center&quot;&gt;\r\n                &lt;div class=&quot;rect&quot;&gt;\r\n                    &lt;div class=&quot;animate scale icon-outer&quot;&gt;&lt;span class=&quot;icon flaticon-settings9&quot;&gt;&lt;/span&gt;&lt;/div&gt;\r\n                    &lt;h6&gt;&lt;strong&gt;Ut sit amet turpis&lt;/strong&gt;&lt;/h6&gt;\r\n                    &lt;p&gt;Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;col-sm-6 col-md-3 col-lg-3 text-center&quot;&gt;\r\n                &lt;div class=&quot;rect&quot;&gt;\r\n                    &lt;div class=&quot;animate scale icon-outer&quot;&gt;&lt;span class=&quot;icon flaticon-global10&quot;&gt;&lt;/span&gt;&lt;/div&gt;\r\n                    &lt;h6&gt;&lt;strong&gt;Ut sit amet turpis&lt;/strong&gt;&lt;/h6&gt;\r\n                    &lt;p&gt;In est arcu vitae sollicitudin eu, vehicula venenatis est tempor diam&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n\r\n        &lt;div class=&quot;divider-xl&quot;&gt;&lt;/div&gt;\r\n        &lt;div class=&quot;subtitle&quot;&gt;\r\n            &lt;div&gt;&lt;span&gt;OUR TEAM&lt;/span&gt;&lt;/div&gt;\r\n        &lt;/div&gt;\r\n    &lt;div class=&quot;images-gallery four-columns&quot;&gt;\r\n        &lt;div class=&quot;images-nospace team-gallery&quot;&gt;\r\n            &lt;div class=&quot;image-thumbnail&quot;&gt;\r\n                &lt;img src=&quot;image/catalog/blocks/team-member-01.jpg&quot; alt=&quot;&quot;&gt;\r\n                &lt;div class=&quot;hover&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                        &lt;h4&gt;Mike Williams&lt;/h4&gt;\r\n                        &lt;h5&gt;Manager &lt;/h5&gt;\r\n                        &lt;ul class=&quot;socials socials-lg&quot;&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                        &lt;/ul&gt;\r\n                    &lt;/div&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;image-thumbnail&quot;&gt;\r\n                &lt;img src=&quot;image/catalog/blocks/team-member-02.jpg&quot; alt=&quot;&quot;&gt;\r\n                &lt;div class=&quot;hover&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                        &lt;h4&gt;Matthew Davies &lt;/h4&gt;\r\n                        &lt;h5&gt;Manager &lt;/h5&gt;\r\n                        &lt;ul class=&quot;socials socials-lg&quot;&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                        &lt;/ul&gt;\r\n                    &lt;/div&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;image-thumbnail&quot;&gt;\r\n                &lt;img src=&quot;image/catalog/blocks/team-member-03.jpg&quot; alt=&quot;&quot;&gt;\r\n                &lt;div class=&quot;hover&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                    &lt;h4&gt;Ryan Thomas &lt;/h4&gt;\r\n                    &lt;h5&gt;Manager &lt;/h5&gt;\r\n                    &lt;ul class=&quot;socials socials-lg&quot;&gt;\r\n                        &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                        &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                        &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                        &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;/ul&gt;\r\n                &lt;/div&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;image-thumbnail&quot;&gt;\r\n                &lt;img src=&quot;image/catalog/blocks/team-member-04.jpg&quot; alt=&quot;&quot;&gt;\r\n                &lt;div class=&quot;hover&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                    &lt;h4&gt;Emma Smith&lt;/h4&gt;\r\n                    &lt;h5&gt;Manager &lt;/h5&gt;\r\n                    &lt;ul class=&quot;socials socials-lg&quot;&gt;\r\n                        &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                        &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                        &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                        &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                    &lt;/ul&gt;\r\n                &lt;/div&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n\r\n&lt;/div&gt;\r\n            &lt;/div&gt;\r\n    &lt;/div&gt;\r\n&lt;/div&gt;', 'Clothfarm About', '', ''),
(14, 1, 'Pricing tables', '&lt;div&gt;    \r\n    &lt;div class=&quot;row noGutter&quot;&gt;\r\n        &lt;div class=&quot;col-sm-6 col-md-3&quot;&gt;\r\n            &lt;div class=&quot;price-table&quot;&gt;\r\n                &lt;div class=&quot;price-table-title&quot;&gt;FREE&lt;/div&gt;\r\n\r\n\r\n                &lt;div class=&quot;price-table-price&quot;&gt;$19 &lt;/div&gt;\r\n\r\n\r\n                &lt;ul class=&quot;price-table-info&quot;&gt;\r\n\r\n\r\n                    &lt;li&gt;512 mb&lt;/li&gt;\r\n\r\n\r\n                    &lt;li&gt;Vestibulum justo. Nulla mauris ipsum convallis\r\n                        ut, vestibulum eu, tincidunt euismod erat&lt;/li&gt;\r\n\r\n\r\n                &lt;/ul&gt;\r\n\r\n &lt;button class=&quot;btn btn-cool btn-md&quot; onclick=&quot;location.href=''index.php'';&quot;&gt;BUY NOW&lt;/button&gt;\r\n            &lt;/div&gt;\r\n\r\n\r\n        &lt;/div&gt;\r\n\r\n\r\n        &lt;div class=&quot;col-sm-6 col-md-3&quot;&gt;\r\n            &lt;div class=&quot;price-table&quot;&gt;\r\n                &lt;div class=&quot;price-table-title&quot;&gt;ECONOM&lt;/div&gt;\r\n\r\n\r\n                &lt;div class=&quot;price-table-price&quot;&gt;$29 &lt;/div&gt;\r\n\r\n\r\n                &lt;ul class=&quot;price-table-info&quot;&gt;\r\n\r\n\r\n                    &lt;li&gt;1 gb&lt;/li&gt;\r\n\r\n\r\n                    &lt;li&gt;Vestibulum justo. Nulla mauris ipsum convallis\r\n                        ut, vestibulum eu, tincidunt euismod erat&lt;/li&gt;\r\n\r\n\r\n                &lt;/ul&gt;\r\n\r\n &lt;button class=&quot;btn btn-cool btn-md&quot; onclick=&quot;location.href=''index.php'';&quot;&gt;BUY NOW&lt;/button&gt;\r\n            &lt;/div&gt;\r\n\r\n\r\n        &lt;/div&gt;\r\n\r\n\r\n        &lt;div class=&quot;col-sm-6 col-md-3&quot;&gt;\r\n            &lt;div class=&quot;price-table active&quot;&gt;\r\n                &lt;div class=&quot;price-table-title&quot;&gt;PREMIUM&lt;/div&gt;\r\n\r\n\r\n                &lt;div class=&quot;price-table-price&quot;&gt;$59 &lt;/div&gt;\r\n\r\n\r\n                &lt;ul class=&quot;price-table-info&quot;&gt;\r\n\r\n\r\n                    &lt;li&gt;2 gb&lt;/li&gt;\r\n\r\n\r\n                    &lt;li&gt;Vestibulum justo. Nulla mauris ipsum convallis\r\n                        ut, vestibulum eu, tincidunt euismod erat&lt;/li&gt;\r\n\r\n\r\n                &lt;/ul&gt;\r\n\r\n &lt;button class=&quot;btn btn-cool btn-md&quot; onclick=&quot;location.href=''index.php'';&quot;&gt;BUY NOW&lt;/button&gt;\r\n            &lt;/div&gt;\r\n\r\n\r\n        &lt;/div&gt;\r\n\r\n\r\n        &lt;div class=&quot;col-sm-6 col-md-3&quot;&gt;\r\n            &lt;div class=&quot;price-table&quot;&gt;\r\n                &lt;div class=&quot;price-table-title&quot;&gt;ADVANCED&lt;/div&gt;\r\n\r\n\r\n                &lt;div class=&quot;price-table-price&quot;&gt;$79 &lt;/div&gt;\r\n\r\n\r\n                &lt;ul class=&quot;price-table-info&quot;&gt;\r\n\r\n\r\n                    &lt;li&gt;4 gb&lt;/li&gt;\r\n\r\n\r\n                    &lt;li&gt;Vestibulum justo. Nulla mauris ipsum convallis\r\n                        ut, vestibulum eu, tincidunt euismod erat&lt;/li&gt;\r\n\r\n\r\n                &lt;/ul&gt;\r\n\r\n &lt;button class=&quot;btn btn-cool btn-md&quot; onclick=&quot;location.href=''index.php'';&quot;&gt;BUY NOW&lt;/button&gt;\r\n            &lt;/div&gt;\r\n\r\n\r\n        &lt;/div&gt;\r\n\r\n\r\n    &lt;/div&gt;\r\n\r\n\r\n    &lt;div class=&quot;subtitle&quot;&gt;\r\n        &lt;div&gt;&lt;span&gt;SEPARATE BLOCKS&lt;/span&gt;&lt;/div&gt;\r\n\r\n\r\n    &lt;/div&gt;\r\n\r\n\r\n    &lt;div class=&quot;divider divider-sm&quot;&gt;&lt;/div&gt;\r\n\r\n\r\n    &lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-sm-6 col-md-3&quot;&gt;\r\n            &lt;div class=&quot;price-table&quot;&gt;\r\n                &lt;div class=&quot;price-table-title&quot;&gt;FREE&lt;/div&gt;\r\n\r\n\r\n                &lt;div class=&quot;price-table-price&quot;&gt;$19 &lt;/div&gt;\r\n\r\n\r\n                &lt;ul class=&quot;price-table-info&quot;&gt;\r\n\r\n\r\n                    &lt;li&gt;512 mb&lt;/li&gt;\r\n\r\n\r\n                    &lt;li&gt;Vestibulum justo. Nulla mauris convallis&lt;br&gt;\r\n                        ut, vestibulum eu, tincidunt euismod&lt;/li&gt;\r\n\r\n\r\n                &lt;/ul&gt;\r\n\r\n &lt;button class=&quot;btn btn-cool btn-md&quot; onclick=&quot;location.href=''index.php'';&quot;&gt;BUY NOW&lt;/button&gt;\r\n            &lt;/div&gt;\r\n\r\n\r\n        &lt;/div&gt;\r\n\r\n\r\n        &lt;div class=&quot;col-sm-6 col-md-3&quot;&gt;\r\n            &lt;div class=&quot;price-table active&quot;&gt;\r\n                &lt;div class=&quot;price-table-title&quot;&gt;ECONOM&lt;/div&gt;\r\n\r\n\r\n                &lt;div class=&quot;price-table-price&quot;&gt;$29 &lt;/div&gt;\r\n\r\n\r\n                &lt;ul class=&quot;price-table-info&quot;&gt;\r\n\r\n\r\n                    &lt;li&gt;1 gb&lt;/li&gt;\r\n\r\n\r\n                    &lt;li&gt;Vestibulum justo. Nulla mauris convallis&lt;br&gt;\r\n                        ut, vestibulum eu, tincidunt euismod&lt;/li&gt;\r\n\r\n\r\n                &lt;/ul&gt;\r\n\r\n &lt;button class=&quot;btn btn-cool btn-md&quot; onclick=&quot;location.href=''index.php'';&quot;&gt;BUY NOW&lt;/button&gt;\r\n            &lt;/div&gt;\r\n\r\n\r\n        &lt;/div&gt;\r\n\r\n\r\n        &lt;div class=&quot;col-sm-6 col-md-3&quot;&gt;\r\n            &lt;div class=&quot;price-table&quot;&gt;\r\n                &lt;div class=&quot;price-table-title&quot;&gt;PREMIUM&lt;/div&gt;\r\n\r\n\r\n                &lt;div class=&quot;price-table-price&quot;&gt;$59 &lt;/div&gt;\r\n\r\n\r\n                &lt;ul class=&quot;price-table-info&quot;&gt;\r\n\r\n\r\n                    &lt;li&gt;2 gb&lt;/li&gt;\r\n\r\n\r\n                    &lt;li&gt;Vestibulum justo. Nulla mauris convallis&lt;br&gt;\r\n                        ut, vestibulum eu, tincidunt euismod&lt;/li&gt;\r\n\r\n\r\n                &lt;/ul&gt;\r\n\r\n &lt;button class=&quot;btn btn-cool btn-md&quot; onclick=&quot;location.href=''index.php'';&quot;&gt;BUY NOW&lt;/button&gt;\r\n            &lt;/div&gt;\r\n\r\n\r\n        &lt;/div&gt;\r\n\r\n\r\n        &lt;div class=&quot;col-sm-6 col-md-3&quot;&gt;\r\n            &lt;div class=&quot;price-table&quot;&gt;\r\n                &lt;div class=&quot;price-table-title&quot;&gt;ADVANCED&lt;/div&gt;\r\n\r\n\r\n                &lt;div class=&quot;price-table-price&quot;&gt;$79 &lt;/div&gt;\r\n\r\n\r\n                &lt;ul class=&quot;price-table-info&quot;&gt;\r\n\r\n\r\n                    &lt;li&gt;4 gb&lt;/li&gt;\r\n\r\n\r\n                    &lt;li&gt;Vestibulum justo. Nulla mauris convallis&lt;br&gt;\r\n                        ut, vestibulum eu, tincidunt euismod&lt;/li&gt;\r\n\r\n\r\n                &lt;/ul&gt;\r\n\r\n &lt;button class=&quot;btn btn-cool btn-md&quot; onclick=&quot;location.href=''index.php'';&quot;&gt;BUY NOW&lt;/button&gt;\r\n            &lt;/div&gt;\r\n\r\n\r\n        &lt;/div&gt;\r\n\r\n\r\n    &lt;/div&gt;\r\n\r\n\r\n&lt;/div&gt;', 'Pricing tables', '', ''),
(17, 1, 'Our team', '&lt;div&gt;\r\n            &lt;div class=&quot;row&quot;&gt;\r\n                &lt;div class=&quot;col-sm-12 col-md-6&quot;&gt;\r\n                    &lt;div class=&quot;row&quot;&gt;\r\n                        &lt;div class=&quot;col-xs-4 col-sm-6 col-md-6 col-lg-7&quot;&gt;&lt;img src=&quot;image/catalog/blocks/team-member-02.jpg&quot; alt=&quot;&quot; class=&quot;img-responsive animate scale&quot;&gt;&lt;/div&gt;\r\n                        &lt;div class=&quot;col-xs-8 col-sm-6 col-md-6 col-lg-5&quot;&gt;\r\n                            &lt;h2&gt;Mike Williams&lt;span class=&quot;sub-header&quot;&gt;Manager&lt;/span&gt;&lt;/h2&gt;\r\n                            &lt;p&gt;Maecenas eu enim in lorem scelerisq\r\n                                ue auctor. Ut non erat. Suspendisse fermentum posuere lectus vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor pellentesque, libero massa dapibus dui, eu.&lt;/p&gt;\r\n                            &lt;p class=&quot;upper&quot;&gt;Donec et mi eu massa ultrices &lt;br&gt;\r\n                                Nullam ac nisi non eros gravida &lt;br&gt;\r\n                                Curabitur convallis facilisis lor&lt;br&gt;\r\n                                Fusce tincidunt to congue &lt;/p&gt;\r\n                            &lt;ul class=&quot;socials socials-lg space&quot;&gt;\r\n                                &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                                &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                                &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                                &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;/ul&gt;\r\n                        &lt;/div&gt;\r\n                    &lt;/div&gt;\r\n                &lt;/div&gt;\r\n                &lt;div class=&quot;divider-sm visible-sm visible-xs&quot;&gt;&lt;/div&gt;\r\n                &lt;div class=&quot;col-sm-12 col-md-6&quot;&gt;\r\n                    &lt;div class=&quot;row&quot;&gt;\r\n                        &lt;div class=&quot;col-xs-4 col-sm-6 col-md-6 col-lg-7&quot;&gt;&lt;img src=&quot;image/catalog/blocks/team-member-04.jpg&quot; alt=&quot;&quot; class=&quot;img-responsive animate scale&quot;&gt;&lt;/div&gt;\r\n                        &lt;div class=&quot;col-xs-8 col-sm-6 col-md-6 col-lg-5&quot;&gt;\r\n                            &lt;h2&gt;Mike Williams&lt;span class=&quot;sub-header&quot;&gt;Manager&lt;/span&gt;&lt;/h2&gt;\r\n                            &lt;p&gt;Maecenas eu enim in lorem scelerisq\r\n                                ue auctor. Ut non erat. Suspendisse fermentum posuere lectus vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor pellentesque, libero massa dapibus dui, eu.&lt;/p&gt;\r\n                            &lt;p class=&quot;upper&quot;&gt;Donec et mi eu massa ultrices &lt;br&gt;\r\n                                Nullam ac nisi non eros gravida &lt;br&gt;\r\n                                Curabitur convallis facilisis lor&lt;br&gt;\r\n                                Fusce tincidunt to congue &lt;/p&gt;\r\n                            &lt;ul class=&quot;socials socials-lg space&quot;&gt;\r\n                                &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                                &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                                &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                                &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;/ul&gt;\r\n                        &lt;/div&gt;\r\n                    &lt;/div&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;div class=&quot;divider-xl&quot;&gt;&lt;/div&gt;\r\n        &lt;div class=&quot;grey-container&quot;&gt;\r\n            &lt;div class=&quot;container&quot;&gt;\r\n                &lt;div class=&quot;col-lg-9&quot;&gt;\r\n                    &lt;p&gt;&lt;strong&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. &lt;/strong&gt;&lt;/p&gt;\r\n                    &lt;p&gt;Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Cras pellentesque. Fusce sed molestie molestie, enim urna vehicula magna, eu venenatis velit nunc eget justo. Aenean dapibus, pede ac blandit tincidunt, ante nisi viverra libero, sit amet iaculis nisi tortor non orci. Ut in nibh.&lt;/p&gt;\r\n                &lt;/div&gt;\r\n                &lt;div class=&quot;col-lg-3&quot;&gt; &lt;a href=&quot;index.php&quot; class=&quot;btn btn-cool btn-lg&quot;&gt;GET STARTED NOW!&lt;/a&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;divider-md&quot;&gt;&lt;/div&gt;\r\n        &lt;div class=&quot;container&quot;&gt;&lt;/div&gt;\r\n    &lt;div class=&quot;images-gallery four-columns&quot;&gt;\r\n        &lt;div class=&quot;images-nospace team-gallery&quot;&gt;\r\n            &lt;div class=&quot;image-thumbnail&quot;&gt;&lt;img src=&quot;image/catalog/blocks/team-member-01.jpg&quot; alt=&quot;&quot;&gt;\r\n                &lt;div class=&quot;hover&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                        &lt;h4&gt;Mike Williams &lt;/h4&gt;\r\n                        &lt;h5&gt;Manager &lt;/h5&gt;\r\n                        &lt;ul class=&quot;socials socials-lg&quot;&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                        &lt;/ul&gt;\r\n                    &lt;/div&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;image-thumbnail&quot;&gt; &lt;img src=&quot;image/catalog/blocks/team-member-02.jpg&quot; alt=&quot;&quot;&gt;\r\n                &lt;div class=&quot;hover&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                        &lt;h4&gt;Matthew Davies &lt;/h4&gt;\r\n                        &lt;h5&gt;Manager &lt;/h5&gt;\r\n                        &lt;ul class=&quot;socials socials-lg&quot;&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                        &lt;/ul&gt;\r\n                    &lt;/div&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;image-thumbnail&quot;&gt; &lt;img src=&quot;image/catalog/blocks/team-member-03.jpg&quot; alt=&quot;&quot;&gt;\r\n                &lt;div class=&quot;hover&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                        &lt;h4&gt;Ryan Thomas &lt;/h4&gt;\r\n                        &lt;h5&gt;Manager &lt;/h5&gt;\r\n                        &lt;ul class=&quot;socials socials-lg&quot;&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                        &lt;/ul&gt;\r\n                    &lt;/div&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;image-thumbnail&quot;&gt;&lt;img src=&quot;image/catalog/blocks/team-member-04.jpg&quot; alt=&quot;&quot;&gt;\r\n                &lt;div class=&quot;hover&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                        &lt;h4&gt;Emma Smith&lt;/h4&gt;\r\n                        &lt;h5&gt;Manager &lt;/h5&gt;\r\n                        &lt;ul class=&quot;socials socials-lg&quot;&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                            &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n                        &lt;/ul&gt;\r\n                    &lt;/div&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n\r\n\r\n&lt;/div&gt;\r\n', 'Our team', '', ''),
(18, 1, 'Delivery', '&lt;div&gt;\r\n    &lt;section class=&quot;container&quot;&gt;        \r\n        &lt;div class=&quot;row&quot;&gt;\r\n            &lt;div class=&quot;col-sm-5 col-md-4 col-lg-4&quot;&gt; &lt;img class=&quot;img-responsive animate scale&quot; src=&quot;image/catalog/blocks/img-delivery.jpg&quot; alt=&quot;&quot;&gt; &lt;/div&gt;\r\n\r\n            &lt;div class=&quot;divider-md visible-xs&quot;&gt;&lt;/div&gt;\r\n\r\n            &lt;div class=&quot;col-sm-7 col-md-8 col-lg-8&quot;&gt;\r\n                &lt;h2&gt;ORder CONFIRMATION&lt;/h2&gt;\r\n\r\n                &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;br&gt;\r\n                &lt;/p&gt;\r\n\r\n                &lt;p class=&quot;upper&quot;&gt;Donec et mi eu massa ultrices scelerisque. &lt;/p&gt;\r\n\r\n                &lt;p class=&quot;upper&quot;&gt;Nullam ac nisi non eros gravida venenatis sollicitudin lobortis &lt;/p&gt;\r\n\r\n                &lt;p class=&quot;upper&quot;&gt;Curabitur convallis facilisis lorem. Vivamus euismod nulla vel nunc &lt;/p&gt;\r\n\r\n                &lt;p&gt;Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n\r\n            &lt;/div&gt;\r\n\r\n        &lt;/div&gt;\r\n\r\n    &lt;/section&gt;\r\n    &lt;section class=&quot;container content&quot;&gt;\r\n        &lt;div class=&quot;row&quot;&gt;\r\n            &lt;div class=&quot;col-sm-6 col-md-6&quot;&gt;        &lt;div class=&quot;subtitle&quot;&gt;\r\n                &lt;div&gt;&lt;span&gt;ORder CONFIRMATION&lt;/span&gt;&lt;/div&gt;\r\n\r\n            &lt;/div&gt;\r\n\r\n                &lt;p&gt;&lt;strong&gt;Free Delivery. &lt;/strong&gt;&lt;br&gt;\r\n                    Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi. Curabitur molestie euismod erat. Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui.\r\n                &lt;/p&gt;\r\n\r\n                &lt;p&gt;&lt;strong&gt;Standard Mainland Delivery. &lt;/strong&gt;&lt;br&gt;\r\n                    Proin eros odio, mattis rutrum, pulvinar et, egestas vitae, magna. Integer semper, velit ut interdum maletudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n\r\n                &lt;p&gt;&lt;strong&gt;Express Delivery. &lt;/strong&gt;&lt;br&gt;\r\n                    Mauris lacinia lectus sit amet felis. Aliquam erat volutpat. Nulla porttitor tortor at nisl. Nam lectus nulla, bibendum pretium, dictum a, mattis nec, dolor.&lt;/p&gt;\r\n\r\n                &lt;p&gt;&lt;a href=&quot;index.php&quot; class=&quot;btn btn-cool&quot;&gt;more info&lt;/a&gt; &lt;/p&gt;\r\n\r\n\r\n\r\n            &lt;/div&gt;\r\n&lt;div class=&quot;col-sm-6 col-md-6&quot;&gt;        &lt;div class=&quot;subtitle&quot;&gt;\r\n            &lt;div&gt;&lt;span&gt;RETURNS AND EXCHANGES&lt;/span&gt;&lt;/div&gt;\r\n\r\n        &lt;/div&gt;\r\n\r\n            &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;/p&gt;\r\n\r\n            &lt;p class=&quot;upper&quot;&gt;Donec et mi eu massa ultrices scelerisque. &lt;/p&gt;\r\n\r\n            &lt;p class=&quot;upper&quot;&gt;Nullam ac nisi non eros gravida venenatis sollicitudin lobortis &lt;/p&gt;\r\n\r\n            &lt;p class=&quot;upper&quot;&gt;Curabitur convallis facilisis lorem. Vivamus euismod nulla vel nunc&lt;/p&gt;\r\n\r\n            &lt;p class=&quot;upper&quot;&gt;Fusce tincidunt, justo congue egestas&lt;/p&gt;\r\n\r\n        &lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n    &lt;/section&gt;\r\n\r\n&lt;/div&gt;', 'Delivery', '', '');
INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(19, 1, 'Services', '&lt;div&gt;\r\n        &lt;div class=&quot;grey-container&quot;&gt;\r\n            &lt;div class=&quot;container&quot;&gt;\r\n                &lt;div class=&quot;col-lg-9&quot;&gt;\r\n                    &lt;p&gt;&lt;strong&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. &lt;/strong&gt;&lt;/p&gt;\r\n                    &lt;p&gt;Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Cras pellentesque. Fusce sed molestie molestie, enim urna vehicula magna, eu venenatis velit nunc eget justo. Aenean dapibus, pede ac blandit tincidunt, ante nisi viverra libero, sit amet iaculis nisi tortor non orci. Ut in nibh.&lt;/p&gt;\r\n                &lt;/div&gt;\r\n                &lt;div class=&quot;col-lg-3&quot;&gt; &lt;a href=&quot;index.php&quot; class=&quot;btn btn-cool btn-lg&quot;&gt;GET STARTED NOW!&lt;/a&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;divider-md&quot;&gt;&lt;/div&gt;\r\n            &lt;div class=&quot;row&quot;&gt;\r\n                &lt;div class=&quot;col-sm-4 col-md-4 col-lg-4 text-center&quot;&gt;\r\n                    &lt;div class=&quot;rect-noborder&quot;&gt;\r\n                        &lt;div class=&quot;animate scale&quot;&gt;\r\n                            &lt;div class=&quot;number icon-outer&quot;&gt;&lt;span class=&quot;icon  icon-xl flaticon-welldone&quot;&gt;&lt;/span&gt;254&lt;/div&gt;\r\n                        &lt;/div&gt;\r\n                        &lt;h6&gt;&lt;strong&gt;Happy Customers&lt;/strong&gt;&lt;/h6&gt;\r\n                        &lt;p&gt;Aliquam lectus. Morbi eget massa dapibus dui, urna et mi. Cras pellentesque. Fusce sed molestie molestie, enim urna vehicula magna, eu venenatis velit nunc eget justo. &lt;/p&gt;\r\n                    &lt;/div&gt;\r\n                &lt;/div&gt;\r\n                &lt;div class=&quot;col-sm-4 col-md-4 col-lg-4 text-center&quot;&gt;\r\n                    &lt;div class=&quot;rect-noborder&quot;&gt;\r\n                        &lt;div class=&quot;animate scale&quot;&gt;\r\n                            &lt;div class=&quot;number icon-outer&quot;&gt;&lt;span class=&quot;icon flaticon-brief&quot;&gt;&lt;/span&gt;&amp;nbsp;42&lt;/div&gt;\r\n                        &lt;/div&gt;\r\n                        &lt;h6&gt;&lt;strong&gt;Amazing Works&lt;/strong&gt;&lt;/h6&gt;\r\n                        &lt;p&gt;Aliquam lectus. Morbi eget massa dapibus dui, urna et mi. Cras pellentesque. Fusce sed molestie molestie, enim urna vehicula magna, eu venenatis velit nunc eget justo. &lt;/p&gt;\r\n                    &lt;/div&gt;\r\n                &lt;/div&gt;\r\n                &lt;div class=&quot;col-sm-4 col-md-4 col-lg-4 text-center&quot;&gt;\r\n                    &lt;div class=&quot;rect-noborder&quot;&gt;\r\n                        &lt;div class=&quot;animate scale&quot;&gt;\r\n                            &lt;div class=&quot;number icon-outer&quot;&gt;&lt;span class=&quot;icon flaticon-group41&quot;&gt;&lt;/span&gt;1842&lt;/div&gt;\r\n                        &lt;/div&gt;\r\n                        &lt;h6&gt;&lt;strong&gt;Followers&lt;/strong&gt;&lt;/h6&gt;\r\n                        &lt;p&gt;Aliquam lectus. Morbi eget massa dapibus dui, urna et mi. Cras pellentesque. Fusce sed molestie molestie, enim urna vehicula magna, eu venenatis velit nunc eget justo. &lt;/p&gt;\r\n                    &lt;/div&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n    &lt;div class=&quot;line-divider&quot;&gt;&lt;/div&gt;\r\n    &lt;div class=&quot;divider-sm&quot;&gt;&lt;/div&gt;\r\n    &lt;section class=&quot;content&quot;&gt;\r\n        &lt;div class=&quot;row&quot;&gt;\r\n            &lt;div class=&quot;col-sm-5 col-md-5 col-lg-5&quot;&gt; &lt;img class=&quot;img-responsive animate scale&quot; src=&quot;image/catalog/blocks/img-services.jpg&quot; alt=&quot;&quot;&gt; &lt;/div&gt;\r\n            &lt;div class=&quot;divider-md visible-xs&quot;&gt;&lt;/div&gt;\r\n            &lt;div class=&quot;col-sm-7 col-md-7 col-lg-7&quot;&gt;\r\n                &lt;h2&gt;lorem ipsum dolor&lt;/h2&gt;\r\n                &lt;p&gt;&lt;strong&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. &lt;/strong&gt;&lt;/p&gt;\r\n                &lt;p&gt;Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Cras pellentesque. Fusce sed molestie molestie, enim urna vehicula magna, eu venenatis velit nunc eget justo. Aenean dapibus, pede ac blandit tincidunt, ante nisi viverra libero, sit amet iaculis nisi tortor non orci. Ut in nibh.&lt;/p&gt;\r\n                &lt;p class=&quot;upper&quot;&gt;Donec et mi eu massa ultrices scelerisque. &lt;/p&gt;\r\n                &lt;p class=&quot;upper&quot;&gt;Nullam ac nisi non eros gravida venenatis sollicitudin lobortis &lt;/p&gt;\r\n                &lt;p class=&quot;upper&quot;&gt;Curabitur convallis facilisis lorem. Vivamus euismod nulla vel nunc &lt;/p&gt;\r\n                &lt;p&gt;&lt;a href=&quot;index.php&quot; class=&quot;btn btn-cool&quot;&gt;more info&lt;/a&gt; &lt;/p&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;divider-xl&quot;&gt;&lt;/div&gt;\r\n        &lt;div class=&quot;row&quot;&gt;\r\n            &lt;div class=&quot;col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n                &lt;div class=&quot;overflow&quot;&gt;\r\n                    &lt;div class=&quot;chart-outer&quot;&gt; &lt;span class=&quot;chart&quot; data-percent=&quot;86&quot;&gt;67%&lt;/span&gt;&lt;/div&gt;\r\n                    &lt;h6&gt;&lt;strong&gt;WEBDESIGN&lt;/strong&gt;&lt;/h6&gt;\r\n                    &lt;p&gt;In est arcu vitae sollicitudin eu, vehicula venenatis est ante ipsum primis in faucibus orci luctus&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n                &lt;div class=&quot;overflow&quot;&gt;\r\n                    &lt;div class=&quot;chart-outer&quot;&gt; &lt;span class=&quot;chart&quot; data-percent=&quot;31&quot;&gt;31%&lt;/span&gt;&lt;/div&gt;\r\n                    &lt;h6&gt;&lt;strong&gt;Illustration&lt;/strong&gt;&lt;/h6&gt;\r\n                    &lt;p&gt;In est arcu vitae sollicitudin eu, vehicula venenatis est ante ipsum primis in faucibus orci luctus&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n                &lt;div class=&quot;overflow&quot;&gt;\r\n                    &lt;div class=&quot;chart-outer&quot;&gt; &lt;span class=&quot;chart&quot; data-percent=&quot;11&quot;&gt;11%&lt;/span&gt;&lt;/div&gt;\r\n                    &lt;h6&gt;&lt;strong&gt;Polygraphy&lt;/strong&gt;&lt;/h6&gt;\r\n                    &lt;p&gt;In est arcu vitae sollicitudin eu, vehicula venenatis est ante ipsum primis in faucibus orci luctus&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;divider-md&quot;&gt;&lt;/div&gt;\r\n        &lt;div class=&quot;row&quot;&gt;\r\n            &lt;div class=&quot;col-sm-6 col-md-3 col-lg-3 text-center&quot;&gt;\r\n                &lt;div class=&quot;rect&quot;&gt;\r\n                    &lt;div class=&quot;animate scale icon-outer&quot;&gt;&lt;span class=&quot;icon flaticon-attachment13&quot;&gt;&lt;/span&gt;&lt;/div&gt;\r\n                    &lt;h6&gt;&lt;strong&gt;Ut sit amet turpis&lt;/strong&gt;&lt;/h6&gt;\r\n                    &lt;p&gt;In est arcu vitae sollicitudin eu, vehicula venenatis est tempor diam&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;col-sm-6 col-md-3 col-lg-3 text-center&quot;&gt;\r\n                &lt;div class=&quot;rect&quot;&gt;\r\n                    &lt;div class=&quot;animate scale icon-outer&quot;&gt;&lt;span class=&quot;icon flaticon-shopping155&quot;&gt;&lt;/span&gt;&lt;/div&gt;\r\n                    &lt;h6&gt;&lt;strong&gt;Ut sit amet turpis&lt;/strong&gt;&lt;/h6&gt;\r\n                    &lt;p&gt;In est arcu vitae sollicitudin eu, vehicula venenatis est tempor diam&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;col-sm-6 col-md-3 col-lg-3 text-center&quot;&gt;\r\n                &lt;div class=&quot;rect&quot;&gt;\r\n                    &lt;div class=&quot;animate scale icon-outer&quot;&gt;&lt;span class=&quot;icon flaticon-settings9&quot;&gt;&lt;/span&gt;&lt;/div&gt;\r\n                    &lt;h6&gt;&lt;strong&gt;Ut sit amet turpis&lt;/strong&gt;&lt;/h6&gt;\r\n                    &lt;p&gt;Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;col-sm-6 col-md-3 col-lg-3 text-center&quot;&gt;\r\n                &lt;div class=&quot;rect&quot;&gt;\r\n                    &lt;div class=&quot;animate scale icon-outer&quot;&gt;&lt;span class=&quot;icon flaticon-global10&quot;&gt;&lt;/span&gt;&lt;/div&gt;\r\n                    &lt;h6&gt;&lt;strong&gt;Ut sit amet turpis&lt;/strong&gt;&lt;/h6&gt;\r\n                    &lt;p&gt;In est arcu vitae sollicitudin eu, vehicula venenatis est tempor diam&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n    &lt;/section&gt;\r\n&lt;/div&gt;\r\n', 'Services', '', ''),
(20, 1, 'Video', '&lt;div&gt;\r\n        &lt;div class=&quot;grey-container&quot;&gt;\r\n            &lt;div class=&quot;container&quot;&gt;\r\n                &lt;div class=&quot;col-lg-9&quot;&gt;\r\n                    &lt;p&gt;&lt;strong&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. &lt;/strong&gt;&lt;/p&gt;\r\n                    &lt;p&gt;Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Cras pellentesque. Fusce sed molestie molestie, enim urna vehicula magna, eu venenatis velit nunc eget justo. Aenean dapibus, pede ac blandit tincidunt, ante nisi viverra libero, sit amet iaculis nisi tortor non orci. Ut in nibh.&lt;/p&gt;\r\n                &lt;/div&gt;\r\n                &lt;div class=&quot;col-lg-3&quot;&gt; &lt;a href=&quot;index.php&quot; class=&quot;btn btn-cool btn-lg&quot;&gt;GET STARTED NOW!&lt;/a&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n\r\n        &lt;div class=&quot;videoWrapperFull&quot;&gt;\r\n            &lt;div class=&quot;video-hover&quot;&gt;&lt;/div&gt;\r\n            &lt;div class=&quot;video-hover-color&quot;&gt;&lt;/div&gt;\r\n            &lt;div class=&quot;video-text&quot;&gt;\r\n                &lt;div class=&quot;title&quot;&gt;SECTIONS WITH VIDEO BACKGROUND &lt;/div&gt;\r\n                Fusce eu dui. Integer vel nibh sit amet turpis vulputate aliquet.\r\n                Phasellus id nisi vitae odio pretium aliquam. Pellentesque a leo. Donec consequat lectus sed felis. &lt;br&gt;\r\n                Quisque vestibulum massa. Nulla ornare. &lt;/div&gt;\r\n            &lt;video controls=&quot;controls&quot; preload=&quot;auto&quot; loop=&quot;1&quot; autoplay=&quot;1&quot; class=&quot;video-autoplay&quot;&gt;\r\n                &lt;source src=&quot;image/catalog/skin_landing/video/video.mp4&quot;&gt;\r\n            &lt;/video&gt;\r\n        &lt;/div&gt;\r\n    &lt;section class=&quot;content&quot;&gt;\r\n        &lt;div class=&quot;row&quot;&gt;\r\n            &lt;div class=&quot;col-sm-6 col-md-3 col-lg-3 text-center&quot;&gt;\r\n                &lt;div class=&quot;rect&quot;&gt;\r\n                    &lt;div class=&quot;animate scale icon-outer&quot;&gt;&lt;span class=&quot;icon flaticon-attachment13&quot;&gt;&lt;/span&gt;&lt;/div&gt;\r\n                    &lt;h6&gt;&lt;strong&gt;Ut sit amet turpis&lt;/strong&gt;&lt;/h6&gt;\r\n                    &lt;p&gt;In est arcu vitae sollicitudin eu, vehicula venenatis est tempor diam&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;col-sm-6 col-md-3 col-lg-3 text-center&quot;&gt;\r\n                &lt;div class=&quot;rect&quot;&gt;\r\n                    &lt;div class=&quot;animate scale icon-outer&quot;&gt;&lt;span class=&quot;icon flaticon-shopping155&quot;&gt;&lt;/span&gt;&lt;/div&gt;\r\n                    &lt;h6&gt;&lt;strong&gt;Ut sit amet turpis&lt;/strong&gt;&lt;/h6&gt;\r\n                    &lt;p&gt;In est arcu vitae sollicitudin eu, vehicula venenatis est tempor diam&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;col-sm-6 col-md-3 col-lg-3 text-center&quot;&gt;\r\n                &lt;div class=&quot;rect&quot;&gt;\r\n                    &lt;div class=&quot;animate scale icon-outer&quot;&gt;&lt;span class=&quot;icon flaticon-settings9&quot;&gt;&lt;/span&gt;&lt;/div&gt;\r\n                    &lt;h6&gt;&lt;strong&gt;Ut sit amet turpis&lt;/strong&gt;&lt;/h6&gt;\r\n                    &lt;p&gt;Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;col-sm-6 col-md-3 col-lg-3 text-center&quot;&gt;\r\n                &lt;div class=&quot;rect&quot;&gt;\r\n                    &lt;div class=&quot;animate scale icon-outer&quot;&gt;&lt;span class=&quot;icon flaticon-global10&quot;&gt;&lt;/span&gt;&lt;/div&gt;\r\n                    &lt;h6&gt;&lt;strong&gt;Ut sit amet turpis&lt;/strong&gt;&lt;/h6&gt;\r\n                    &lt;p&gt;In est arcu vitae sollicitudin eu, vehicula venenatis est tempor diam&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;divider-lg&quot;&gt;&lt;/div&gt;\r\n\r\n        &lt;div class=&quot;row&quot;&gt;\r\n            &lt;div class=&quot;col-sm-6 col-md-6&quot;&gt;\r\n                &lt;div class=&quot;subtitle&quot;&gt;\r\n                &lt;div&gt;&lt;span&gt;ORder CONFIRMATION&lt;/span&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n                &lt;p&gt;&lt;strong&gt;Free Delivery. &lt;/strong&gt;&lt;br&gt;\r\n                    Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi. Curabitur molestie euismod erat. Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui.\r\n                &lt;/p&gt;\r\n                &lt;p&gt;&lt;strong&gt;Standard Mainland Delivery. &lt;/strong&gt;&lt;br&gt;\r\n                    Proin eros odio, mattis rutrum, pulvinar et, egestas vitae, magna. Integer semper, velit ut interdum maletudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n                &lt;p&gt;&lt;strong&gt;Express Delivery. &lt;/strong&gt;&lt;br&gt;\r\n                    Mauris lacinia lectus sit amet felis. Aliquam erat volutpat. Nulla porttitor tortor at nisl. Nam lectus nulla, bibendum pretium, dictum a, mattis nec, dolor.&lt;/p&gt;\r\n                &lt;p&gt;&lt;a href=&quot;index.php&quot; class=&quot;btn btn-cool&quot;&gt;more info&lt;/a&gt; &lt;/p&gt;\r\n\r\n\r\n            &lt;/div&gt;&lt;div class=&quot;col-sm-6 col-md-6&quot;&gt;\r\n            &lt;div class=&quot;subtitle&quot;&gt;\r\n            &lt;div&gt;&lt;span&gt;RETURNS AND EXCHANGES&lt;/span&gt;&lt;/div&gt;\r\n        &lt;/div&gt;\r\n            &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;/p&gt;\r\n            &lt;p class=&quot;upper&quot;&gt;Donec et mi eu massa ultrices scelerisque. &lt;/p&gt;\r\n            &lt;p class=&quot;upper&quot;&gt;Nullam ac nisi non eros gravida venenatis sollicitudin lobortis &lt;/p&gt;\r\n            &lt;p class=&quot;upper&quot;&gt;Curabitur convallis facilisis lorem. Vivamus euismod nulla vel nunc&lt;/p&gt;\r\n            &lt;p class=&quot;upper&quot;&gt;Fusce tincidunt, justo congue egestas&lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;/div&gt;\r\n    &lt;/section&gt;\r\n\r\n&lt;/div&gt;\r\n', 'Video', '', ''),
(12, 1, 'Typography', '&lt;div&gt;\r\n&lt;div class=&quot;container&quot;&gt;\r\n    &lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-sm-6 col-md-6 col-lg-6&quot;&gt;\r\n            &lt;h1&gt;H1 Heading. Lorem ipsum dolor &lt;/h1&gt;\r\n            &lt;h2&gt; H2 Heading. Lorem ipsum dolor &lt;/h2&gt;\r\n            &lt;h3&gt;H3 Heading. Lorem ipsum dolor &lt;/h3&gt;\r\n            &lt;h4&gt;H4 Heading. Lorem ipsum dolor &lt;/h4&gt;\r\n            &lt;h5&gt;H5 Heading. Lorem ipsum dolor &lt;/h5&gt;\r\n            &lt;h6&gt;H6 Heading. Lorem ipsum dolor &lt;/h6&gt;\r\n            &lt;br&gt;\r\n            &lt;br&gt;\r\n            &lt;div class=&quot;subtitle&quot;&gt;\r\n                &lt;div&gt;&lt;span&gt;Paragraphs&lt;/span&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;p&gt;Vestibulum eget consequat viverra ipsum, sed placerat ligula aliquam eu. Nam placerat quis felis. Nunc elementum dolor quis arcuege tistique viverra. Integer amet turpis vulputate aliquet.&lt;/p&gt;\r\n            &lt;p&gt;Morbi nec suscipit lacust. Vestibulum ante ipsum primis in faucibus orci luctus et hendrerit egets porttitor. Aliquam nusl ultricien lamcorper vulputate volutpat ipsum hendrerit sed neque sed sapien rutrum erat eget tempor mauris laoreet justo ultrices. In pellentesque lorem condimentum dui morbi pulvinar dui vulputate diam quis ornare malesuada. Vivamus pulvinar sapien sapien rutrum erat eget tempor mauris laoreet justo.&lt;/p&gt;\r\n            &lt;br&gt;\r\n            &lt;br&gt;\r\n            &lt;div class=&quot;subtitle&quot;&gt;\r\n                &lt;div&gt;&lt;span&gt;Dropcaps&lt;/span&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;p&gt; &lt;span class=&quot;dropcap&quot;&gt;&lt;strong&gt;A&lt;/strong&gt;&lt;/span&gt; Morbi nec suscipit lacust. Vestibulum ante ipsum primis in faucibus orci luctus et hendrerit egets porttitor. Aliquam nusl per erat sed nonumy diam nibh sit vulputate aliquet labore sed. Onec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcullamcorper massa pellentesque sagittis. Morbi sit amet quam. &lt;/p&gt;\r\n            &lt;br&gt;\r\n            &lt;p&gt; &lt;span class=&quot;dropcap color&quot;&gt;&lt;strong&gt;A&lt;/strong&gt;&lt;/span&gt;Morbi nec suscipit lacust. Vestibulum ante ipsum primis in faucibus orci luctus et hendrerit egets porttitor. Aliquam nusl per erat sed nonumy diam nibh sit vulputate aliquet labore sed. Onec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcullamcorper massa pellentesque sagittis. Morbi sit amet quam. &lt;/p&gt;\r\n            &lt;br&gt;\r\n            &lt;br&gt;\r\n            &lt;div class=&quot;subtitle&quot;&gt;\r\n                &lt;div&gt;&lt;span&gt;List&lt;/span&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;row&quot;&gt;\r\n                &lt;div class=&quot;col-md-6 col-lg-6&quot;&gt;\r\n                    &lt;p&gt;&lt;strong&gt;Unordered&lt;/strong&gt;&lt;/p&gt;\r\n                    &lt;ul class=&quot;styled-list&quot;&gt;\r\n                        &lt;li&gt;Lorem ipsum dolor amet&lt;/li&gt;\r\n                        &lt;li&gt;Consectetur adipiscing elit &lt;/li&gt;\r\n                        &lt;li&gt;Integer molestie lorem massa &lt;/li&gt;\r\n                        &lt;li&gt;Facilisis in pretium nisl aliquet\r\n                            &lt;ul class=&quot;circle&quot;&gt;\r\n                                &lt;li&gt;Nulla volutpat aliquam velit &lt;/li&gt;\r\n                                &lt;li&gt;Phasellus iaculis neque &lt;/li&gt;\r\n                                &lt;li&gt;Purus sodales ultricies &lt;/li&gt;\r\n                                &lt;li&gt;Vestibulum laot porttitor sem &lt;/li&gt;\r\n                            &lt;/ul&gt;\r\n                        &lt;/li&gt;\r\n                        &lt;li&gt;Ac tristique libero volutpat at &lt;/li&gt;\r\n                        &lt;li&gt;Faucibus porta lacingilla vel &lt;/li&gt;\r\n                        &lt;li&gt;Eget porttitor lorem &lt;/li&gt;\r\n                        &lt;li&gt;Integer vel nibh sit amet &lt;/li&gt;\r\n                    &lt;/ul&gt;\r\n                &lt;/div&gt;\r\n                &lt;div class=&quot;col-md-6 col-lg-6&quot;&gt;\r\n                    &lt;p&gt;&lt;strong&gt;Ordered&lt;/strong&gt; &lt;/p&gt;\r\n                    &lt;ul class=&quot;styled-list decimal&quot;&gt;\r\n                        &lt;li&gt;Lorem ipsum dolor amet&lt;/li&gt;\r\n                        &lt;li&gt;Consectetur adipiscing elit &lt;/li&gt;\r\n                        &lt;li&gt;Integer molestie lorem massa &lt;/li&gt;\r\n                        &lt;li&gt;Facilisis in pretium nisl aliquet &lt;/li&gt;\r\n                        &lt;li&gt;Nulla volutpat aliquam velit &lt;/li&gt;\r\n                        &lt;li&gt;Phasellus iaculis neque &lt;/li&gt;\r\n                        &lt;li&gt;Purus sodales ultricies &lt;/li&gt;\r\n                        &lt;li&gt;Vestibulum laot porttitor sem &lt;/li&gt;\r\n                        &lt;li&gt;Ac tristique libero volutpat at &lt;/li&gt;\r\n                        &lt;li&gt;Faucibus porta lacingilla vel &lt;/li&gt;\r\n                        &lt;li&gt;Eget porttitor lorem &lt;/li&gt;\r\n                        &lt;li&gt;Integer vel nibh sit amet &lt;/li&gt;\r\n                    &lt;/ul&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-6 col-md-6 col-lg-6&quot;&gt;\r\n            &lt;div class=&quot;subtitle&quot;&gt;\r\n                &lt;div&gt;&lt;span&gt;Heading Helper Classes&lt;/span&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;p&gt;&lt;span class=&quot;color_mark&quot;&gt;&amp;nbsp;Heads up!&amp;nbsp;&lt;/span&gt; &amp;nbsp;Mauris aliquet ultricies ante, non faucibus ante gravida sed. &lt;span class=&quot;mark&quot;&gt;Sed ultrices pellentesque purus&lt;/span&gt;, vulputate volutpat ipsum hendrerit sed &lt;a href=&quot;index.php&quot; class=&quot;color underline&quot;&gt;neque sed sapien&lt;/a&gt; rutrum. Morbi nec suscipit lacust. Vestibulum ante ipsum primis in faucibus orci luctus et hen augue tincidunt rhoncus in &lt;a href=&quot;index.php&quot; class=&quot;underline&quot;&gt;aliquet ornare malesuada&lt;/a&gt;. Vivamus pulvinar sapien labore diam nonumy.&lt;/p&gt;\r\n            &lt;div class=&quot;subtitle&quot;&gt;\r\n                &lt;div&gt;&lt;span&gt;blockquote&lt;/span&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;blockquote&quot;&gt;\r\n                &lt;div class=&quot;inside&quot;&gt;\r\n                    &lt;p&gt;Curabitur convallis facilisis lorem. Vivamus euismod nulla vel nunc. Fusce tincidunt, justo congue egestas molestie, tortor tortor blandit erat, et scelerisque metus metus at ipsum. Maecenas tincidunt adipiscing tellus. Nunc tristique pede. Ut condimentum mattis est. Duis sit amet augue.  Mauris et ligula quis erat dignissim imperdiet. Integer ligula magna, senectus et netus et malesuada fames ac turpis egestas. Sed in velit et lacus ullamcorper imperdiet. Curabitur quis tortor. Proin ac risus.&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;subtitle&quot;&gt;\r\n                &lt;div&gt;&lt;span&gt;testimonials&lt;/span&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;testimonials&quot;&gt;\r\n                &lt;div class=&quot;inside&quot;&gt;\r\n                    &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. Mauris et ligula quis erat dignissim imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Ut in nibh. Pellentesque habitant morbi tristique imperdiet. Curabitur quis tortor. Proin ac risus.&lt;/p&gt;\r\n                    &lt;p&gt; &lt;strong&gt;Matua Mohammed &lt;/strong&gt;&lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;subtitle&quot;&gt;\r\n                &lt;div&gt;&lt;span&gt;INFO BOX&lt;/span&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;infobox&quot;&gt;\r\n                &lt;div class=&quot;inside&quot;&gt;\r\n                    &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. Mauris et ligula quis erat dignissim imperdiet. Integer ligula magna, dictum felis magna nonummy eros, quis ultrices odio lorem quis urna. Mauris sem sapien, mollis vel, cursus et, pulvinar non, ultricies ac, nibh. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Ut in nibh. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed in velit et lacus ullamcorper imperdiet. Curabitur quis tortor. Proin ac risus. &lt;/p&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;br&gt;\r\n            &lt;br&gt;\r\n            &lt;div class=&quot;subtitle&quot;&gt;\r\n                &lt;div&gt;&lt;span&gt;Tables&lt;/span&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;h5&gt;Striped Table&lt;/h5&gt;\r\n            &lt;table class=&quot;table table-striped&quot;&gt;\r\n                &lt;thead&gt;\r\n                &lt;tr&gt;\r\n                    &lt;th scope=&quot;col&quot;&gt;&amp;nbsp; &lt;/th&gt;\r\n                    &lt;th scope=&quot;col&quot;&gt;First Name&lt;/th&gt;\r\n                    &lt;th scope=&quot;col&quot;&gt;Last Name &lt;/th&gt;\r\n                    &lt;th scope=&quot;col&quot;&gt;Username&lt;/th&gt;\r\n                &lt;/tr&gt;\r\n                &lt;/thead&gt;\r\n                &lt;tbody&gt;\r\n                &lt;tr&gt;\r\n                    &lt;td&gt;1&lt;/td&gt;\r\n                    &lt;td&gt;Mark &lt;/td&gt;\r\n                    &lt;td&gt;Otto&lt;/td&gt;\r\n                    &lt;td&gt;@mdo&lt;/td&gt;\r\n                &lt;/tr&gt;\r\n                &lt;tr&gt;\r\n                    &lt;td&gt;2&lt;/td&gt;\r\n                    &lt;td&gt;Jacob &lt;/td&gt;\r\n                    &lt;td&gt;Thornton&lt;/td&gt;\r\n                    &lt;td&gt;@fat&lt;/td&gt;\r\n                &lt;/tr&gt;\r\n                &lt;tr&gt;\r\n                    &lt;td&gt;3&lt;/td&gt;\r\n                    &lt;td&gt;Larry &lt;/td&gt;\r\n                    &lt;td&gt; the Bird&lt;/td&gt;\r\n                    &lt;td&gt;@twitter&lt;/td&gt;\r\n                &lt;/tr&gt;\r\n                &lt;/tbody&gt;\r\n            &lt;/table&gt;\r\n            &lt;br&gt;\r\n            &lt;h5&gt;Bordered Table&lt;/h5&gt;\r\n            &lt;table class=&quot;table table-bordered&quot;&gt;\r\n                &lt;tr&gt;\r\n                    &lt;th scope=&quot;col&quot;&gt;&amp;nbsp; &lt;/th&gt;\r\n                    &lt;th scope=&quot;col&quot;&gt;First Name&lt;/th&gt;\r\n                    &lt;th scope=&quot;col&quot;&gt;Last Name &lt;/th&gt;\r\n                    &lt;th scope=&quot;col&quot;&gt;Username&lt;/th&gt;\r\n                &lt;/tr&gt;\r\n                &lt;tr&gt;\r\n                    &lt;td&gt;1&lt;/td&gt;\r\n                    &lt;td&gt;Mark &lt;/td&gt;\r\n                    &lt;td&gt;Otto&lt;/td&gt;\r\n                    &lt;td&gt;@mdo&lt;/td&gt;\r\n                &lt;/tr&gt;\r\n                &lt;tr&gt;\r\n                    &lt;td&gt;2&lt;/td&gt;\r\n                    &lt;td&gt;Jacob &lt;/td&gt;\r\n                    &lt;td&gt;Thornton&lt;/td&gt;\r\n                    &lt;td&gt;@fat&lt;/td&gt;\r\n                &lt;/tr&gt;\r\n                &lt;tr&gt;\r\n                    &lt;td&gt;3&lt;/td&gt;\r\n                    &lt;td&gt;Larry &lt;/td&gt;\r\n                    &lt;td&gt; the Bird&lt;/td&gt;\r\n                    &lt;td&gt;@twitter&lt;/td&gt;\r\n                &lt;/tr&gt;\r\n            &lt;/table&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;divider-xl&quot;&gt;&lt;/div&gt;\r\n&lt;div class=&quot;container&quot;&gt;\r\n    &lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-lg-12&quot;&gt;\r\n            &lt;div class=&quot;subtitle&quot;&gt;\r\n                &lt;div&gt;&lt;span&gt;GRID&lt;/span&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-lg-12&quot;&gt;\r\n            &lt;h5&gt;1 COLUMN&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultricies ante, non faucibus ante gravida sed. Sed ultrices pellenlaoreet justo ultrices. In pellentesque lorem condimentum dui morbi pulvinar dui non quam pretium ut lacinia tortor. Fusce lacinia tempor malesuada. Fringilla penatibus orci est non mollit, suspendisse pulvinar egestas a donec. Vulputate mi dui suscipit, molestie vulputate libero fusce iaculis suscipit. Sapien pede libero. Maecenas lacus aliquet et nisl nunc, per sed sed maecenas.Lectus tincidunt pellentesque augue urna sit sed, arcu sed ante ac montes pellentesque consectetuer, neque magnis penatibus laoreet vehicula nulla orci, a malesuada justo laoreet ipsum, in ac fusce. At sapien neque sollicitudin lacus, dolor semper in laoreet, magnis convallis posuere adipiscing, dapibus suspendisse nonummy pellentesque consequat interdum odio.&lt;/p&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n    &lt;div class=&quot;divider-md&quot;&gt;&lt;/div&gt;\r\n    &lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-sm-6 col-md-6 col-lg-6&quot;&gt;\r\n            &lt;h5&gt;1/2 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultricies ante, non faucibus ante gravida sed. Sed ultrices pellenlaoreet justo ultrices. In pellentesque lorem condimentum dui morbi pulvinar dui non quam pretium ut lacinia tortor. Fusce lacinia tempor malesuada. Fringilla penatibus orci est non mollit, suspendisse pulvinar egestas a donec. Vulputate mi dui suscipit, molestie vulputate libero fusce iaculis suscipit. Sapien pede libero. Maecenas lacus aliquet et nisl nunc, per sed sed maecenas.Lectus tincidunt pellentesque augue urna sit sed, arcu sed ante ac montes pellentesque consectetuer, neque magnis penatibus laoreet vehicula nulla orci, a malesuada justo laoreet ipsum, in ac fusce. At sapien neque sollicitudin lacus, dolor semper in laoreet, magnis convallis posuere adipiscing, dapibus suspendisse nonummy pellentesque consequat interdum odio.&lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-6 col-md-6 col-lg-6&quot;&gt;\r\n            &lt;h5&gt;1/2 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultricies ante, non faucibus ante gravida sed. Sed ultrices pellenlaoreet justo ultrices. In pellentesque lorem condimentum dui morbi pulvinar dui non quam pretium ut lacinia tortor. Fusce lacinia tempor malesuada. Fringilla penatibus orci est non mollit, suspendisse pulvinar egestas a donec. Vulputate mi dui suscipit, molestie vulputate libero fusce iaculis suscipit. Sapien pede libero. Maecenas lacus aliquet et nisl nunc, per sed sed maecenas.Lectus tincidunt pellentesque augue urna sit sed, arcu sed ante ac montes pellentesque consectetuer, neque magnis penatibus laoreet vehicula nulla orci, a malesuada justo laoreet ipsum, in ac fusce. At sapien neque sollicitudin lacus, dolor semper in laoreet, magnis convallis posuere adipiscing, dapibus suspendisse nonummy pellentesque consequat interdum odio.&lt;/p&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n    &lt;div class=&quot;divider-md&quot;&gt;&lt;/div&gt;\r\n    &lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;h5&gt;1/3 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultricies ante, non faucibus ante gravida sed. Sed ultrices pellenlaoreet justo ultrices. In pellentesque lorem condimentum dui morbi pulvinar dui non quam pretium ut lacinia tortor. Fusce lacinia tempor malesuada. Fringilla penatibus orci est non mollit, suspendisse pulvinar egestas a donec. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;h5&gt;1/3 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultricies ante, non faucibus ante gravida sed. Sed ultrices pellenlaoreet justo ultrices. In pellentesque lorem condimentum dui morbi pulvinar dui non quam pretium ut lacinia tortor. Fusce lacinia tempor malesuada. Fringilla penatibus orci est non mollit, suspendisse pulvinar egestas a donec. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;h5&gt;1/3 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultricies ante, non faucibus ante gravida sed. Sed ultrices pellenlaoreet justo ultrices. In pellentesque lorem condimentum dui morbi pulvinar dui non quam pretium ut lacinia tortor. Fusce lacinia tempor malesuada. Fringilla penatibus orci est non mollit, suspendisse pulvinar egestas a donec. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n    &lt;div class=&quot;divider-md&quot;&gt;&lt;/div&gt;\r\n    &lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-sm-8 col-md-8 col-lg-8&quot;&gt;\r\n            &lt;h5&gt;2/3 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultricies ante, non faucibus ante gravida sed. Sed ultrices pellenlaoreet justo ultrices. In pellentesque lorem condimentum dui morbi pulvinar dui non quam pretium ut lacinia tortor. Fusce lacinia tempor malesuada. Fringilla penatibus orci est non mollit, suspendisse pulvinar egestas a donec. Vulputate mi dui suscipit, molestie vulputate libero fusce iaculis suscipit. Sapien pede libero. Maecenas lacus aliquet et nisl nunc, per sed sed maecenas.Lectus tincidunt pellentesque augue urna sit sed, arcu sed ante ac montes pellentesque consectetuer, neque magnis penatibus laoreet magnis convallis posuere adipiscing, dapibus suspendisse nonummy pellentesque consequat interdum odio.&lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;h5&gt;1/3 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultricies ante, non faucibus ante gravida sed. Sed ultrices pellenlaoreet justo ultrices. In pellentesque lorem condimentum dui morbi pulvinar dui non quam pretium ut lacinia tortor. Fusce lacinia tempor malesuada. Fringilla penatibus orci est non mollit, suspendisse pulvinar egestas a donec. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n    &lt;div class=&quot;divider-md&quot;&gt;&lt;/div&gt;\r\n    &lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-sm-6 col-md-3 col-lg-3&quot;&gt;\r\n            &lt;h5&gt;1/4 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultricies ante, non ante gravida sed. Sed ultrices pel lenlao reet justo ultrices. In pellentesque lorem con dimentum dui morbi pulvinar dui non quam pretium ut lacinia suspe ndisse pulvinar donec labore diam. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-6 col-md-3 col-lg-3&quot;&gt;\r\n            &lt;h5&gt;1/4 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultricies ante, non ante gravida sed. Sed ultrices pel lenlao reet justo ultrices. In pellentesque lorem con dimentum dui morbi pulvinar dui non quam pretium ut lacinia suspe ndisse pulvinar donec labore diam. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-6 col-md-3 col-lg-3&quot;&gt;\r\n            &lt;h5&gt;1/4 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultricies ante, non ante gravida sed. Sed ultrices pel lenlao reet justo ultrices. In pellentesque lorem con dimentum dui morbi pulvinar dui non quam pretium ut lacinia suspe ndisse pulvinar donec labore diam. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-6 col-md-3 col-lg-3&quot;&gt;\r\n            &lt;h5&gt;1/4 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultricies ante, non ante gravida sed. Sed ultrices pel lenlao reet justo ultrices. In pellentesque lorem con dimentum dui morbi pulvinar dui non quam pretium ut lacinia suspe ndisse pulvinar donec labore diam. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n    &lt;div class=&quot;divider-md&quot;&gt;&lt;/div&gt;\r\n    &lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-sm-9 col-md-9 col-lg-9&quot;&gt;\r\n            &lt;h5&gt;3/4 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Nam ac ipsum dui, a sollicitudin massa. Pellentesque semper ligula ut eros dapibus sit amet vehicula nisi tempus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eget urna sit amet sapien vestibulum auctor ac blandit erat. Sed sagittis volutpat urna nec lobortis. Aser velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in anim id est laborum. Asunt in anim uis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in anim id est laborum. Allamco laboris nisi ut aliquip ex ea commodo consequat. Aser velit esse cillum dolore eu fugiat nulla pariatur.&lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-3 col-md-3 col-lg-3&quot;&gt;\r\n            &lt;h5&gt;1/4 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultricies ante, non ante gravida sed. Sed ultrices pel lenlao reet justo ultrices. In pellentesque lorem con dimentum dui morbi pulvinar dui non quam pretium ut lacinia suspe ndisse pulvinar donec labore diam. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n    &lt;div class=&quot;divider-md&quot;&gt;&lt;/div&gt;\r\n    &lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-sm-6 col-md-2 col-lg-2&quot;&gt;\r\n            &lt;h5&gt;1/6 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultrics ant, ultrices pel lenlao rejusto sed ultrices. In pellesque pretium utlore lacini et ndisse pulvinar donec labore diam. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-6 col-md-2 col-lg-2&quot;&gt;\r\n            &lt;h5&gt;1/6 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultrics ant, ultrices pel lenlao rejusto sed ultrices. In pellesque pretium utlore lacini et ndisse pulvinar donec labore diam. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-6 col-md-2 col-lg-2&quot;&gt;\r\n            &lt;h5&gt;1/6 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultrics ant, ultrices pel lenlao rejusto sed ultrices. In pellesque pretium utlore lacini et ndisse pulvinar donec labore diam. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-6 col-md-2 col-lg-2&quot;&gt;\r\n            &lt;h5&gt;1/6 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultrics ant, ultrices pel lenlao rejusto sed ultrices. In pellesque pretium utlore lacini et ndisse pulvinar donec labore diam. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-6 col-md-2 col-lg-2&quot;&gt;\r\n            &lt;h5&gt;1/6 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultrics ant, ultrices pel lenlao rejusto sed ultrices. In pellesque pretium utlore lacini et ndisse pulvinar donec labore diam. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-6 col-md-2 col-lg-2&quot;&gt;\r\n            &lt;h5&gt;1/6 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultrics ant, ultrices pel lenlao rejusto sed ultrices. In pellesque pretium utlore lacini et ndisse pulvinar donec labore diam. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n    &lt;div class=&quot;divider-md&quot;&gt;&lt;/div&gt;\r\n    &lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-sm-8 col-md-10 col-lg-10&quot;&gt;\r\n            &lt;h5&gt;5/6 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis part urient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor ullamcorper massa pellentesque sagittis. Morbi sit amet quam sed felis. Quisque vest ibulum massa. Nulla ornare. Nulla libero. Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. Integer dictum est vitae sem. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-sm-4 col-md-2 col-lg-2&quot;&gt;\r\n            &lt;h5&gt;1/6 COLUMNS&lt;/h5&gt;\r\n            &lt;p&gt;Mauris aliquet ultrics ant, ultrices pel lenlao rejusto sed ultrices. In pellesque pretium utlore lacini et ndisse pulvinar donec labore diam. &lt;/p&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;\r\n', 'Typography', '', '');
INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(21, 1, 'Return Policy', '&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:30.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;Free one-day\r\nreturn&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:30.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;If you are not\r\n100% satisfied with your purchase, you can return it for free and get a full\r\nrefund. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;Just make sure\r\nto &lt;/span&gt;&lt;a href=&quot;http://uae.souq.com/ae-en/contact_us.php&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1;text-decoration:none;text-underline:none&quot;&gt;contact\r\nus&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:\r\nHelvetica;color:black;mso-themecolor:text1&quot;&gt; within 2 days from the day your\r\norder is delivered, and ensure that the item is in its original packaging,\r\nunworn and in the same condition you received it. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;If the item\r\nyou have received is damaged, defective or not as described on the website, you\r\nwill receive a full refund along with any shipping fees incurred.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:30.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;To return the\r\nitem&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-no-proof:\r\nyes&quot;&gt;&lt;!--[if gte vml 1]&gt;&lt;v:shapetype id=&quot;_x0000_t75&quot; coordsize=&quot;21600,21600&quot;\r\n o:spt=&quot;75&quot; o:preferrelative=&quot;t&quot; path=&quot;m@4@5l@4@11@9@11@9@5xe&quot; filled=&quot;f&quot;\r\n stroked=&quot;f&quot;&gt;\r\n &lt;v:stroke joinstyle=&quot;miter&quot;/&gt;\r\n &lt;v:formulas&gt;\r\n  &lt;v:f eqn=&quot;if lineDrawn pixelLineWidth 0&quot;/&gt;\r\n  &lt;v:f eqn=&quot;sum @0 1 0&quot;/&gt;\r\n  &lt;v:f eqn=&quot;sum 0 0 @1&quot;/&gt;\r\n  &lt;v:f eqn=&quot;prod @2 1 2&quot;/&gt;\r\n  &lt;v:f eqn=&quot;prod @3 21600 pixelWidth&quot;/&gt;\r\n  &lt;v:f eqn=&quot;prod @3 21600 pixelHeight&quot;/&gt;\r\n  &lt;v:f eqn=&quot;sum @0 0 1&quot;/&gt;\r\n  &lt;v:f eqn=&quot;prod @6 1 2&quot;/&gt;\r\n  &lt;v:f eqn=&quot;prod @7 21600 pixelWidth&quot;/&gt;\r\n  &lt;v:f eqn=&quot;sum @8 21600 0&quot;/&gt;\r\n  &lt;v:f eqn=&quot;prod @7 21600 pixelHeight&quot;/&gt;\r\n  &lt;v:f eqn=&quot;sum @10 21600 0&quot;/&gt;\r\n &lt;/v:formulas&gt;\r\n &lt;v:path o:extrusionok=&quot;f&quot; gradientshapeok=&quot;t&quot; o:connecttype=&quot;rect&quot;/&gt;\r\n &lt;o:lock v:ext=&quot;edit&quot; aspectratio=&quot;t&quot;/&gt;\r\n&lt;/v:shapetype&gt;&lt;v:shape id=&quot;Picture_x0020_4&quot; o:spid=&quot;_x0000_i1028&quot; type=&quot;#_x0000_t75&quot;\r\n style=''width:64pt;height:64pt;visibility:visible;mso-wrap-style:square''&gt;\r\n &lt;v:imagedata src=&quot;file://localhost/Users/mac/Library/Group%20Containers/UBF8T346G9.Office/msoclip1/01/clip_image001.jpg&quot;\r\n  o:title=&quot;&quot;/&gt;\r\n&lt;/v:shape&gt;&lt;![endif]--&gt;&lt;!--[if !vml]--&gt;&lt;img border=&quot;0&quot; width=&quot;66&quot; height=&quot;66&quot; src=&quot;file://localhost/Users/mac/Library/Group%20Containers/UBF8T346G9.Office/msoclip1/01/clip_image001.jpg&quot; v:shapes=&quot;Picture_x0020_4&quot;&gt;&lt;!--[endif]--&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;\r\nfont-family:Helvetica;mso-bidi-font-family:Helvetica;color:black;mso-themecolor:\r\ntext1&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:black;mso-themecolor:text1&quot;&gt;1&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;Call our\r\ncustomer support number&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;(+971)-50-40\r\n40 919 or &lt;/span&gt;&lt;a href=&quot;http://uae.souq.com/ae-en/contact_us.php&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1;text-decoration:none;text-underline:none&quot;&gt;contact\r\nus&lt;/span&gt;&lt;/a&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:\r\nHelvetica;color:black;mso-themecolor:text1&quot;&gt; within 2 days from the day your\r\norder is delivered. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-no-proof:\r\nyes&quot;&gt;&lt;!--[if gte vml 1]&gt;&lt;v:shape id=&quot;Picture_x0020_3&quot; o:spid=&quot;_x0000_i1027&quot;\r\n type=&quot;#_x0000_t75&quot; style=''width:65pt;height:64pt;visibility:visible;\r\n mso-wrap-style:square''&gt;\r\n &lt;v:imagedata src=&quot;file://localhost/Users/mac/Library/Group%20Containers/UBF8T346G9.Office/msoclip1/01/clip_image002.jpg&quot;\r\n  o:title=&quot;&quot;/&gt;\r\n&lt;/v:shape&gt;&lt;![endif]--&gt;&lt;!--[if !vml]--&gt;&lt;img border=&quot;0&quot; width=&quot;67&quot; height=&quot;66&quot; src=&quot;file://localhost/Users/mac/Library/Group%20Containers/UBF8T346G9.Office/msoclip1/01/clip_image002.jpg&quot; v:shapes=&quot;Picture_x0020_3&quot;&gt;&lt;!--[endif]--&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;\r\nfont-family:Helvetica;mso-bidi-font-family:Helvetica;color:black;mso-themecolor:\r\ntext1&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:black;mso-themecolor:text1&quot;&gt;2&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;An email will\r\nbe sent containing a pre-paid shipping label for you to print and attach to the\r\npackage. A pick-up will be scheduled by one of our courier services.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-no-proof:\r\nyes&quot;&gt;&lt;!--[if gte vml 1]&gt;&lt;v:shape id=&quot;Picture_x0020_2&quot; o:spid=&quot;_x0000_i1026&quot;\r\n type=&quot;#_x0000_t75&quot; style=''width:74pt;height:74pt;visibility:visible;\r\n mso-wrap-style:square''&gt;\r\n &lt;v:imagedata src=&quot;file://localhost/Users/mac/Library/Group%20Containers/UBF8T346G9.Office/msoclip1/01/clip_image003.jpg&quot;\r\n  o:title=&quot;&quot;/&gt;\r\n&lt;/v:shape&gt;&lt;![endif]--&gt;&lt;!--[if !vml]--&gt;&lt;img border=&quot;0&quot; width=&quot;76&quot; height=&quot;76&quot; src=&quot;file://localhost/Users/mac/Library/Group%20Containers/UBF8T346G9.Office/msoclip1/01/clip_image003.jpg&quot; v:shapes=&quot;Picture_x0020_2&quot;&gt;&lt;!--[endif]--&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;\r\nfont-family:Helvetica;mso-bidi-font-family:Helvetica;color:black;mso-themecolor:\r\ntext1&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:black;mso-themecolor:text1&quot;&gt;3&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;Pack the item\r\nin its original state and packaging. Do not remove any bar code or labels on\r\nthe box. Hand over the package to the courier representative.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-no-proof:\r\nyes&quot;&gt;&lt;!--[if gte vml 1]&gt;&lt;v:shape id=&quot;Picture_x0020_1&quot; o:spid=&quot;_x0000_i1025&quot;\r\n type=&quot;#_x0000_t75&quot; style=''width:1in;height:64pt;visibility:visible;\r\n mso-wrap-style:square''&gt;\r\n &lt;v:imagedata src=&quot;file://localhost/Users/mac/Library/Group%20Containers/UBF8T346G9.Office/msoclip1/01/clip_image004.jpg&quot;\r\n  o:title=&quot;&quot;/&gt;\r\n&lt;/v:shape&gt;&lt;![endif]--&gt;&lt;!--[if !vml]--&gt;&lt;img border=&quot;0&quot; width=&quot;74&quot; height=&quot;66&quot; src=&quot;file://localhost/Users/mac/Library/Group%20Containers/UBF8T346G9.Office/msoclip1/01/clip_image004.jpg&quot; v:shapes=&quot;Picture_x0020_1&quot;&gt;&lt;!--[endif]--&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;\r\nfont-family:Helvetica;mso-bidi-font-family:Helvetica;color:black;mso-themecolor:\r\ntext1&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:black;mso-themecolor:text1&quot;&gt;4&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;Once we\r\nreceive your returned item, we will inspect it and process your refund.&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:22.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:30.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:30.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:30.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:30.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;mso-layout-grid-align:none;\r\ntext-autospace:none&quot;&gt;&lt;span style=&quot;font-size:30.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;div style=&quot;mso-element:para-border-div;border-top:solid #5B9BD5 1.0pt;\r\nmso-border-top-themecolor:accent1;border-left:none;border-bottom:solid #5B9BD5 1.0pt;\r\nmso-border-bottom-themecolor:accent1;border-right:none;mso-border-top-alt:solid #5B9BD5 .5pt;\r\nmso-border-top-themecolor:accent1;mso-border-bottom-alt:solid #5B9BD5 .5pt;\r\nmso-border-bottom-themecolor:accent1;padding:10.0pt 0cm 10.0pt 0cm;margin-left:\r\n43.2pt;margin-right:43.2pt&quot;&gt;\r\n\r\n&lt;p class=&quot;MsoIntenseQuote&quot; style=&quot;margin-top:18.0pt;margin-right:0cm;margin-bottom:\r\n18.0pt;margin-left:0cm&quot;&gt;FAQ&lt;o:p&gt;&lt;/o:p&gt;&lt;/p&gt;\r\n\r\n&lt;/div&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;I received a defective/damaged item, can I\r\nget a refund?&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;In case the item you received is damaged or\r\ndefective, you could return an item in the same condition you received and in\r\nthe original box and/or packaging intact. Once we receive the returned item, we\r\nwill inspect it and if the item is found to be defective or damaged, we will\r\nprocess the refund along with any shipping fees incurred.  &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;I received a wrong item, how can I return it?&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;We apologize that you received a wrong item.\r\nIn the unusual circumstance where the item received is wrong, you can return\r\nthe item in the same condition you received and in the original box and/or\r\npackaging intact. Once we receive the returned item, we will process the refund\r\nalong with Free 3 Day Returns &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;If you are not 100% satisfied with your\r\npurchase, you can return it for free and get a full refund. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;Just make sure to contact us within 3 days\r\nfrom the day your order is delivered, and ensure that the item is in its\r\noriginal packaging, unworn and in the same condition you received it. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;If the item you have received is damaged,\r\ndefective or not as described on the website, you will receive a full refund\r\nalong with any shipping fees incurred.  &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;mso-pagination:none;tab-stops:11.0pt 36.0pt;\r\nmso-layout-grid-align:none;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;\r\nfont-family:Helvetica;mso-bidi-font-family:Helvetica;color:black;mso-themecolor:\r\ntext1&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;I have changed my mind; can I return what I\r\nhave bought?&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;Yes you can. We fully understand that\r\nsometimes you might change your mind regarding your purchase. If you change\r\nyour mind before receiving your item, just call us to cancel your order and we\r\nwill process the refund along with any shipping fees incurred. If you wish to\r\nreturn the item after receiving it, you have up to 3 days to return them, so\r\nlong as the item is &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;(a) not listed in the non-returnable list &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;(b) not Clearance Items clearly marked as\r\nsuch and displaying a No-Return Policy &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;(c) in the same condition as received and\r\nwith the original packaging box and/or packaging. In all circumstances, you can\r\ncontact our Customer Service Team ((+971)-50-40 40 919) or through the Contact\r\nUs page for a return of an item or refunds.  &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;What if I bought the item from outside UAE\r\nthrough international shipping service offered by clothfarm.com and I want to\r\nreturn it?&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;In case you have bought the item from one of\r\nthe following countries: Qatar, Jordan, Lebanon, Oman and Bahrain through\r\ninternational shipping you will be able to drop the item to the nearest Aramex\r\nstation and they will handle returning the item back.  &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;Can I return Clothing &amp;amp; Fashion\r\naccessories?&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;You can return any Clothing item or Fashion\r\naccessory within 14 days in the same condition you received and in the original\r\nbox and/or packaging intact, so long as the item is &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;(a) not listed in the non-returnable list &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;(b) not Clearance Items clearly marked as\r\nsuch and displaying a No-Return Policy &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;(c) in the same condition as received and with\r\nthe original packaging box and/or packaging.  &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;What are the items that cannot be returned?&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;The items that cannot be returned are-&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;- Clearance items clearly marked as such and\r\ndisplaying a No-Return Policy&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;&lt;span style=&quot;mso-spacerun:yes&quot;&gt;&amp;nbsp;&lt;/span&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;mso-pagination:none;tab-stops:\r\n11.0pt 36.0pt;mso-layout-grid-align:none;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&amp;nbsp;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;Also, any consumable items that are used or\r\ninstalled cannot be returned. As outlined in consumer Protection Rights and\r\nconcerning section on non-returnable items.  &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;How long does it take the courier to collect\r\nthe returned items?&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;Typically, Courier representative will\r\ncontact you within 3-5 days from the day you requested a return. However, it\r\nmight sometimes take up to two weeks for a courier to collect the item.  &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;Can I schedule time with the courier to\r\nreturn an item?&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;At the moment, you will not be able to\r\ncontact the courier company directly. However, once our courier representative\r\ncontacts you to schedule the time for the pick-up of a return item, you may\r\nprovide your preferred timings to them.  &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;Can I return my item after 3 days?&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;As per our Returns policy, you can return an\r\nitem within 3 days and receive a full refund. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;There may be situations in which you were not\r\nable to return items within the 3 days, in such cases please contact our\r\nCustomer Service Team ((+971)-50-40 40 919) or through the Contact Us page and\r\nfile a complaint. Complaints are handled on case by case basis. However, all\r\nacceptable returns as per Consumer Protection Laws will be honored outlined\r\nduration. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt; &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;How can I receive refund to my credit card?&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;Refunds on your purchase are done seamlessly\r\nafter we receive the return item. If you have paid through electronic means\r\n(Credit or Debit card) then the money would be refunded to your card, but\r\ndepending on individual’s bank requirements, the amount may take up to a month\r\nto reflect in your card statement or Cash U . &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt; &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;I paid through Cash on Delivery, how can I\r\nreceive refund for an item?&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;Refunds on your purchase are done seamlessly\r\nafter we receive the return item. If you have paid through Cash on Delivery\r\n(COD) or then the money would be refunded in the form of Clothfarm credit and\r\nwill be credited to your Clothfarm Account balance. From your Clothfarm Account\r\nbalance, you can either easily make new purchases on Clothfarm.com or simply\r\ntransfer the credit balance to your personal bank account. For security\r\npurposes, the name on the bank account and on your Clothfarm account must be\r\nthe same. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;mso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;\r\ncolor:black;mso-themecolor:text1&quot;&gt;Making a purchase less than or equal to the\r\navailable clothfarm wallet balance:&lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;\r\nfont-family:Helvetica;mso-bidi-font-family:Helvetica;color:black;mso-themecolor:\r\ntext1&quot;&gt; If the total amount of your new purchase including the shipping charges\r\nis less than or equal to your available clothfarm wallet balance, the system\r\nwill advise you that there is enough balance in your clothfarm wallet. You will\r\nthen need to click on &quot;Place Order&quot; and the amount for your new\r\npurchase will be deducted from your available clothfarm wallet balance. &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;\r\nmso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:&amp;quot;Open Sans&amp;quot;;mso-bidi-font-family:&amp;quot;Open Sans&amp;quot;;\r\ncolor:black;mso-themecolor:text1&quot;&gt;Making a purchase more than the available clothfarm\r\nwallet balance: &lt;/span&gt;&lt;/b&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1&quot;&gt;If the total\r\namount of your new purchase including the shipping charges is more than your\r\navailable clothfarm wallet balance, you will need to choose an online payment\r\nmethod (Credit Card / PayPal / Cash U) to pay the difference, to complete your\r\npurchase. The system will then deduct the available amount from your clothfarm\r\nwallet balance and the remaining outstanding amount will be charged to the\r\nchosen online payment method (you are unable to pay any difference in the\r\namount by Cash on delivery). If Your chosen payment method is Cash on Delivery,\r\nthe full amount will need to be paid to the courier, no amount will be taken\r\nfrom your Clothfarm.com wallet credit.  &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;Can I Replace or Exchange an item rather than\r\na refund?&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;At the moment, Clothfarm do not offer\r\nreplacement or exchange of an item; however you can still return an item and\r\nreceive a full refund. Please contact our Customer Service Team ((+971)-50-40\r\n40 919) or through the Contact Us page to get assistance on refund process.  &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;I lost the Original Packing in which I\r\nreceived the item, how can I still return it?&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;We accept return of item only if it is in the\r\noriginal box and/or packaging intact with all labels and barcodes on it,\r\nhowever in this case, please contact our Customer Service Team ((+971)-50-40 40\r\n919).  &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;Can I return an item through my courier\r\ncompany or personally drop it anywhere?&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;At the moment, the item can be returned to us\r\nonly though one of our assigned courier services who would contact you will\r\ncontact you within 3-5 days from the day you requested a return.  &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;Who pays for the shipping charges, when I\r\nreturn an item?&lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;mso-themecolor:text1&quot;&gt;You can return an item for FREE. Clothfarm\r\npays for all the shipping charges and will refund your amount in full.  &lt;o:p&gt;&lt;/o:p&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:36.0pt;text-indent:-36.0pt;mso-pagination:\r\nnone;mso-list:l0 level1 lfo1;tab-stops:11.0pt 36.0pt;mso-layout-grid-align:\r\nnone;text-autospace:none&quot;&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;\r\nmso-bidi-font-family:Helvetica;color:black;mso-themecolor:text1;mso-font-kerning:\r\n.5pt&quot;&gt;&lt;span style=&quot;mso-tab-count:2&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-size:14.0pt;font-family:Helvetica;mso-bidi-font-family:Helvetica;\r\ncolor:black;ms', 'return', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_layout`
--

INSERT INTO `oc_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(10, 20, 0),
(10, 19, 0),
(12, 0, 0),
(14, 0, 0),
(15, 0, 0),
(16, 0, 0),
(17, 0, 0),
(18, 0, 0),
(19, 0, 0),
(20, 0, 0),
(10, 18, 0),
(10, 17, 0),
(10, 16, 0),
(10, 15, 0),
(3, 0, 0),
(3, 9, 0),
(3, 10, 0),
(3, 12, 0),
(3, 13, 0),
(3, 14, 0),
(21, 0, 0),
(21, 9, 0),
(21, 10, 0),
(21, 12, 0),
(21, 13, 0),
(21, 14, 0),
(10, 14, 0),
(10, 13, 0),
(10, 12, 0),
(10, 10, 0),
(10, 9, 0),
(10, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_information_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(10, 0),
(12, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_language`
--

CREATE TABLE IF NOT EXISTS `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'English', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout`
--

CREATE TABLE IF NOT EXISTS `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search'),
(14, 'Mega Filter PRO'),
(15, 'Manufacturer info'),
(30, 'Simple Blog Posts'),
(31, 'Simple Blog Single Post'),
(32, 'Simple Blog Category'),
(33, 'Simple Blog Author');

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_module`
--

CREATE TABLE IF NOT EXISTS `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=172 ;

--
-- Dumping data for table `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(82, 1, 'html.35', 'content_top', 3),
(78, 1, 'special.43', 'product_widget', 2),
(79, 1, 'footer_info.36', 'content_top', 8),
(81, 1, 'html.32', 'top_promo', 1),
(80, 1, 'carousel.31', 'content_top', 7),
(77, 1, 'latest.38', 'content_top', 5),
(76, 1, 'html.42', 'product_widget', 4),
(83, 1, 'featured.37', 'content_top', 4),
(84, 1, 'topslider.34', 'content_top', 2),
(85, 1, 'bestseller.50', 'product_widget', 3),
(86, 1, 'random.47', 'product_widget', 1),
(87, 2, 'html.51', 'column_right', 1),
(88, 2, 'html.32', 'top_promo', 1),
(89, 3, 'upsells', 'content_bottom', 1),
(90, 3, 'bestseller.50', 'column_left', 3),
(91, 3, 'category', 'column_left', 0),
(92, 3, 'filter', 'column_left', 2),
(93, 3, 'html.32', 'top_promo', 1),
(94, 4, 'html.32', 'top_promo', 1),
(95, 5, 'html.32', 'top_promo', 1),
(96, 6, 'account', 'column_left', 1),
(97, 6, 'html.32', 'top_promo', 1),
(98, 7, 'html.32', 'top_promo', 1),
(99, 8, 'html.57', 'content_top', 1),
(100, 8, 'html.58', 'column_right', 1),
(101, 8, 'html.32', 'top_promo', 1),
(102, 9, 'html.32', 'top_promo', 1),
(103, 9, 'html.53', 'column_left', 1),
(104, 10, 'html.32', 'top_promo', 1),
(105, 11, 'html.32', 'top_promo', 1),
(106, 12, 'html.32', 'top_promo', 1),
(107, 13, 'html.32', 'top_promo', 1),
(108, 14, 'html.32', 'top_promo', 1),
(109, 16, 'html.39', 'column_right', 2),
(110, 16, 'simple_blog_category', 'column_right', 1),
(111, 16, 'html.49', 'column_right', 3),
(112, 16, 'html.32', 'top_promo', 1),
(141, 1, 'veplatform.72', 'column_left', 1),
(140, 4, 'veplatform.72', 'column_left', 1),
(139, 8, 'veplatform.72', 'column_left', 1),
(138, 12, 'veplatform.72', 'column_left', 1),
(137, 7, 'veplatform.72', 'column_left', 1),
(136, 3, 'veplatform.72', 'column_left', 1),
(135, 10, 'veplatform.72', 'column_left', 1),
(126, 1, 'simple_blog', 'content_top', 6),
(127, 31, 'html.49', 'column_right', 3),
(128, 31, 'simple_blog_category', 'column_right', 1),
(129, 31, 'html.39', 'column_right', 2),
(130, 31, 'html.32', 'top_promo', 1),
(134, 6, 'veplatform.72', 'column_left', 1),
(133, 30, 'html.32', 'top_promo', 1),
(142, 11, 'veplatform.72', 'column_left', 1),
(143, 5, 'veplatform.72', 'column_left', 1),
(144, 15, 'veplatform.72', 'column_left', 1),
(145, 14, 'veplatform.72', 'column_left', 1),
(146, 2, 'veplatform.72', 'column_left', 1),
(147, 13, 'veplatform.72', 'column_left', 1),
(148, 33, 'veplatform.72', 'column_left', 1),
(149, 32, 'veplatform.72', 'column_left', 1),
(150, 30, 'veplatform.72', 'column_left', 1),
(151, 31, 'veplatform.72', 'column_left', 1),
(152, 9, 'veplatform.72', 'column_left', 1),
(153, 6, 'veplatform.73', 'content_bottom', 1),
(154, 10, 'veplatform.73', 'content_bottom', 1),
(155, 3, 'veplatform.73', 'content_bottom', 1),
(156, 7, 'veplatform.73', 'content_bottom', 1),
(157, 12, 'veplatform.73', 'content_bottom', 1),
(158, 8, 'veplatform.73', 'content_bottom', 1),
(159, 4, 'veplatform.73', 'content_bottom', 1),
(160, 1, 'veplatform.73', 'content_bottom', 1),
(161, 11, 'veplatform.73', 'content_bottom', 1),
(162, 5, 'veplatform.73', 'content_bottom', 1),
(163, 15, 'veplatform.73', 'content_bottom', 1),
(164, 14, 'veplatform.73', 'content_bottom', 1),
(165, 2, 'veplatform.73', 'content_bottom', 1),
(166, 13, 'veplatform.73', 'content_bottom', 1),
(167, 33, 'veplatform.73', 'content_bottom', 1),
(168, 32, 'veplatform.73', 'content_bottom', 1),
(169, 30, 'veplatform.73', 'content_bottom', 1),
(170, 31, 'veplatform.73', 'content_bottom', 1),
(171, 9, 'veplatform.73', 'content_bottom', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_layout_route`
--

CREATE TABLE IF NOT EXISTS `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=427 ;

--
-- Dumping data for table `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(44, 3, 0, 'product/category'),
(42, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search'),
(54, 6, 1, 'account/%'),
(55, 10, 1, 'affiliate/%'),
(56, 3, 1, 'product/category'),
(57, 1, 1, 'common/home'),
(58, 2, 1, 'product/product'),
(59, 11, 1, 'information/information'),
(60, 7, 1, 'checkout/%'),
(61, 8, 1, 'information/contact'),
(62, 9, 1, 'information/sitemap'),
(63, 4, 1, ''),
(64, 5, 1, 'product/manufacturer'),
(65, 12, 1, 'product/compare'),
(66, 13, 1, 'product/search'),
(67, 6, 2, 'account/%'),
(68, 10, 2, 'affiliate/%'),
(69, 3, 2, 'product/category'),
(70, 1, 2, 'common/home'),
(71, 2, 2, 'product/product'),
(72, 11, 2, 'information/information'),
(73, 7, 2, 'checkout/%'),
(74, 8, 2, 'information/contact'),
(75, 9, 2, 'information/sitemap'),
(76, 4, 2, ''),
(77, 5, 2, 'product/manufacturer'),
(78, 12, 2, 'product/compare'),
(79, 13, 2, 'product/search'),
(80, 6, 3, 'account/%'),
(81, 10, 3, 'affiliate/%'),
(82, 3, 3, 'product/category'),
(83, 1, 3, 'common/home'),
(84, 2, 3, 'product/product'),
(85, 11, 3, 'information/information'),
(86, 7, 3, 'checkout/%'),
(87, 8, 3, 'information/contact'),
(88, 9, 3, 'information/sitemap'),
(89, 4, 3, ''),
(90, 5, 3, 'product/manufacturer'),
(91, 12, 3, 'product/compare'),
(92, 13, 3, 'product/search'),
(160, 15, 7, 'product/manufacturer/info'),
(159, 14, 7, 'module/mega_filter/results'),
(158, 13, 7, 'product/search'),
(157, 12, 7, 'product/compare'),
(156, 5, 7, 'product/manufacturer'),
(155, 4, 7, ''),
(154, 9, 7, 'information/sitemap'),
(153, 8, 7, 'information/contact'),
(169, 9, 8, 'information/sitemap'),
(168, 8, 8, 'information/contact'),
(167, 7, 8, 'checkout/%'),
(166, 11, 8, 'information/information'),
(165, 2, 8, 'product/product'),
(164, 1, 8, 'common/home'),
(163, 3, 8, 'product/category'),
(162, 10, 8, 'affiliate/%'),
(161, 6, 8, 'account/%'),
(119, 14, 0, 'module/mega_filter/results'),
(120, 14, 1, 'module/mega_filter/results'),
(121, 14, 2, 'module/mega_filter/results'),
(122, 14, 3, 'module/mega_filter/results'),
(151, 11, 7, 'information/information'),
(152, 7, 7, 'checkout/%'),
(125, 15, 0, 'product/manufacturer/info'),
(126, 15, 1, 'product/manufacturer/info'),
(127, 15, 2, 'product/manufacturer/info'),
(128, 15, 3, 'product/manufacturer/info'),
(146, 6, 7, 'account/%'),
(147, 10, 7, 'affiliate/%'),
(148, 3, 7, 'product/category'),
(149, 1, 7, 'common/home'),
(150, 2, 7, 'product/product'),
(175, 15, 8, 'product/manufacturer/info'),
(174, 14, 8, 'module/mega_filter/results'),
(173, 13, 8, 'product/search'),
(172, 12, 8, 'product/compare'),
(171, 5, 8, 'product/manufacturer'),
(170, 4, 8, ''),
(176, 30, 0, 'simple_blog/article'),
(177, 32, 0, 'simple_blog/category'),
(178, 33, 0, 'simple_blog/author'),
(179, 31, 0, 'simple_blog/article/view'),
(180, 6, 9, 'account/%'),
(181, 10, 9, 'affiliate/%'),
(182, 3, 9, 'product/category'),
(183, 1, 9, 'common/home'),
(184, 2, 9, 'product/product'),
(185, 11, 9, 'information/information'),
(186, 7, 9, 'checkout/%'),
(187, 8, 9, 'information/contact'),
(188, 9, 9, 'information/sitemap'),
(189, 4, 9, ''),
(190, 5, 9, 'product/manufacturer'),
(191, 12, 9, 'product/compare'),
(192, 13, 9, 'product/search'),
(193, 14, 9, 'module/mega_filter/results'),
(194, 15, 9, 'product/manufacturer/info'),
(195, 30, 9, 'simple_blog/article'),
(196, 32, 9, 'simple_blog/category'),
(197, 33, 9, 'simple_blog/author'),
(198, 31, 9, 'simple_blog/article/view'),
(199, 6, 10, 'account/%'),
(200, 10, 10, 'affiliate/%'),
(201, 3, 10, 'product/category'),
(202, 1, 10, 'common/home'),
(203, 2, 10, 'product/product'),
(204, 11, 10, 'information/information'),
(205, 7, 10, 'checkout/%'),
(206, 8, 10, 'information/contact'),
(207, 9, 10, 'information/sitemap'),
(208, 4, 10, ''),
(209, 5, 10, 'product/manufacturer'),
(210, 12, 10, 'product/compare'),
(211, 13, 10, 'product/search'),
(212, 14, 10, 'module/mega_filter/results'),
(213, 15, 10, 'product/manufacturer/info'),
(214, 30, 10, 'simple_blog/article'),
(215, 32, 10, 'simple_blog/category'),
(216, 33, 10, 'simple_blog/author'),
(217, 31, 10, 'simple_blog/article/view'),
(250, 14, 12, 'module/mega_filter/results'),
(249, 13, 12, 'product/search'),
(248, 12, 12, 'product/compare'),
(247, 5, 12, 'product/manufacturer'),
(246, 4, 12, ''),
(245, 9, 12, 'information/sitemap'),
(244, 8, 12, 'information/contact'),
(243, 7, 12, 'checkout/%'),
(242, 11, 12, 'information/information'),
(241, 2, 12, 'product/product'),
(240, 1, 12, 'common/home'),
(239, 3, 12, 'product/category'),
(238, 10, 12, 'affiliate/%'),
(237, 6, 12, 'account/%'),
(251, 15, 12, 'product/manufacturer/info'),
(252, 30, 12, 'simple_blog/article'),
(253, 32, 12, 'simple_blog/category'),
(254, 33, 12, 'simple_blog/author'),
(255, 31, 12, 'simple_blog/article/view'),
(256, 6, 13, 'account/%'),
(257, 10, 13, 'affiliate/%'),
(258, 3, 13, 'product/category'),
(259, 1, 13, 'common/home'),
(260, 2, 13, 'product/product'),
(261, 11, 13, 'information/information'),
(262, 7, 13, 'checkout/%'),
(263, 8, 13, 'information/contact'),
(264, 9, 13, 'information/sitemap'),
(265, 4, 13, ''),
(266, 5, 13, 'product/manufacturer'),
(267, 12, 13, 'product/compare'),
(268, 13, 13, 'product/search'),
(269, 14, 13, 'module/mega_filter/results'),
(270, 15, 13, 'product/manufacturer/info'),
(271, 30, 13, 'simple_blog/article'),
(272, 32, 13, 'simple_blog/category'),
(273, 33, 13, 'simple_blog/author'),
(274, 31, 13, 'simple_blog/article/view'),
(275, 6, 14, 'account/%'),
(276, 10, 14, 'affiliate/%'),
(277, 3, 14, 'product/category'),
(278, 1, 14, 'common/home'),
(279, 2, 14, 'product/product'),
(280, 11, 14, 'information/information'),
(281, 7, 14, 'checkout/%'),
(282, 8, 14, 'information/contact'),
(283, 9, 14, 'information/sitemap'),
(284, 4, 14, ''),
(285, 5, 14, 'product/manufacturer'),
(286, 12, 14, 'product/compare'),
(287, 13, 14, 'product/search'),
(288, 14, 14, 'module/mega_filter/results'),
(289, 15, 14, 'product/manufacturer/info'),
(290, 30, 14, 'simple_blog/article'),
(291, 32, 14, 'simple_blog/category'),
(292, 33, 14, 'simple_blog/author'),
(293, 31, 14, 'simple_blog/article/view'),
(294, 6, 15, 'account/%'),
(295, 10, 15, 'affiliate/%'),
(296, 3, 15, 'product/category'),
(297, 1, 15, 'common/home'),
(298, 2, 15, 'product/product'),
(299, 11, 15, 'information/information'),
(300, 7, 15, 'checkout/%'),
(301, 8, 15, 'information/contact'),
(302, 9, 15, 'information/sitemap'),
(303, 4, 15, ''),
(304, 5, 15, 'product/manufacturer'),
(305, 12, 15, 'product/compare'),
(306, 13, 15, 'product/search'),
(307, 14, 15, 'module/mega_filter/results'),
(308, 15, 15, 'product/manufacturer/info'),
(309, 30, 15, 'simple_blog/article'),
(310, 32, 15, 'simple_blog/category'),
(311, 33, 15, 'simple_blog/author'),
(312, 31, 15, 'simple_blog/article/view'),
(313, 6, 16, 'account/%'),
(314, 10, 16, 'affiliate/%'),
(315, 3, 16, 'product/category'),
(316, 1, 16, 'common/home'),
(317, 2, 16, 'product/product'),
(318, 11, 16, 'information/information'),
(319, 7, 16, 'checkout/%'),
(320, 8, 16, 'information/contact'),
(321, 9, 16, 'information/sitemap'),
(322, 4, 16, ''),
(323, 5, 16, 'product/manufacturer'),
(324, 12, 16, 'product/compare'),
(325, 13, 16, 'product/search'),
(326, 14, 16, 'module/mega_filter/results'),
(327, 15, 16, 'product/manufacturer/info'),
(328, 30, 16, 'simple_blog/article'),
(329, 32, 16, 'simple_blog/category'),
(330, 33, 16, 'simple_blog/author'),
(331, 31, 16, 'simple_blog/article/view'),
(332, 6, 17, 'account/%'),
(333, 10, 17, 'affiliate/%'),
(334, 3, 17, 'product/category'),
(335, 1, 17, 'common/home'),
(336, 2, 17, 'product/product'),
(337, 11, 17, 'information/information'),
(338, 7, 17, 'checkout/%'),
(339, 8, 17, 'information/contact'),
(340, 9, 17, 'information/sitemap'),
(341, 4, 17, ''),
(342, 5, 17, 'product/manufacturer'),
(343, 12, 17, 'product/compare'),
(344, 13, 17, 'product/search'),
(345, 14, 17, 'module/mega_filter/results'),
(346, 15, 17, 'product/manufacturer/info'),
(347, 30, 17, 'simple_blog/article'),
(348, 32, 17, 'simple_blog/category'),
(349, 33, 17, 'simple_blog/author'),
(350, 31, 17, 'simple_blog/article/view'),
(351, 6, 18, 'account/%'),
(352, 10, 18, 'affiliate/%'),
(353, 3, 18, 'product/category'),
(354, 1, 18, 'common/home'),
(355, 2, 18, 'product/product'),
(356, 11, 18, 'information/information'),
(357, 7, 18, 'checkout/%'),
(358, 8, 18, 'information/contact'),
(359, 9, 18, 'information/sitemap'),
(360, 4, 18, ''),
(361, 5, 18, 'product/manufacturer'),
(362, 12, 18, 'product/compare'),
(363, 13, 18, 'product/search'),
(364, 14, 18, 'module/mega_filter/results'),
(365, 15, 18, 'product/manufacturer/info'),
(366, 30, 18, 'simple_blog/article'),
(367, 32, 18, 'simple_blog/category'),
(368, 33, 18, 'simple_blog/author'),
(369, 31, 18, 'simple_blog/article/view'),
(370, 6, 19, 'account/%'),
(371, 10, 19, 'affiliate/%'),
(372, 3, 19, 'product/category'),
(373, 1, 19, 'common/home'),
(374, 2, 19, 'product/product'),
(375, 11, 19, 'information/information'),
(376, 7, 19, 'checkout/%'),
(377, 8, 19, 'information/contact'),
(378, 9, 19, 'information/sitemap'),
(379, 4, 19, ''),
(380, 5, 19, 'product/manufacturer'),
(381, 12, 19, 'product/compare'),
(382, 13, 19, 'product/search'),
(383, 14, 19, 'module/mega_filter/results'),
(384, 15, 19, 'product/manufacturer/info'),
(385, 30, 19, 'simple_blog/article'),
(386, 32, 19, 'simple_blog/category'),
(387, 33, 19, 'simple_blog/author'),
(388, 31, 19, 'simple_blog/article/view'),
(389, 6, 20, 'account/%'),
(390, 10, 20, 'affiliate/%'),
(391, 3, 20, 'product/category'),
(392, 1, 20, 'common/home'),
(393, 2, 20, 'product/product'),
(394, 11, 20, 'information/information'),
(395, 7, 20, 'checkout/%'),
(396, 8, 20, 'information/contact'),
(397, 9, 20, 'information/sitemap'),
(398, 4, 20, ''),
(399, 5, 20, 'product/manufacturer'),
(400, 12, 20, 'product/compare'),
(401, 13, 20, 'product/search'),
(402, 14, 20, 'module/mega_filter/results'),
(403, 15, 20, 'product/manufacturer/info'),
(404, 30, 20, 'simple_blog/article'),
(405, 32, 20, 'simple_blog/category'),
(406, 33, 20, 'simple_blog/author'),
(407, 31, 20, 'simple_blog/article/view'),
(408, 6, 21, 'account/%'),
(409, 10, 21, 'affiliate/%'),
(410, 3, 21, 'product/category'),
(411, 1, 21, 'common/home'),
(412, 2, 21, 'product/product'),
(413, 11, 21, 'information/information'),
(414, 7, 21, 'checkout/%'),
(415, 8, 21, 'information/contact'),
(416, 9, 21, 'information/sitemap'),
(417, 4, 21, ''),
(418, 5, 21, 'product/manufacturer'),
(419, 12, 21, 'product/compare'),
(420, 13, 21, 'product/search'),
(421, 14, 21, 'module/mega_filter/results'),
(422, 15, 21, 'product/manufacturer/info'),
(423, 30, 21, 'simple_blog/article'),
(424, 32, 21, 'simple_blog/category'),
(425, 33, 21, 'simple_blog/author'),
(426, 31, 21, 'simple_blog/article/view');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class`
--

CREATE TABLE IF NOT EXISTS `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '10.00000000'),
(3, '0.39370000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_length_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Table structure for table `oc_location`
--

CREATE TABLE IF NOT EXISTS `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_location`
--

INSERT INTO `oc_location` (`location_id`, `name`, `address`, `telephone`, `fax`, `geocode`, `image`, `open`, `comment`, `vendor_id`) VALUES
(1, 'sdfsdf', 'fdsfd', 'sdfsdfsdf', '', '', '', '', '', 2),
(2, 'gfhgfh', 'gfhgfh', 'gfhgfhgfh', '', '', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0),
(11, 'samsung', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_marketing`
--

CREATE TABLE IF NOT EXISTS `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_marketinsg_news`
--

CREATE TABLE IF NOT EXISTS `oc_marketinsg_news` (
  `marketinsg_news_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketinsg_news_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_marketinsg_news`
--

INSERT INTO `oc_marketinsg_news` (`marketinsg_news_id`, `text`, `date_added`) VALUES
(3, '<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 2.0//EN">\n<html><head>\n<title>301 Moved Permanently</title>\n</head><body>\n<h1>Moved Permanently</h1>\n<p>The document has moved <a href="https://www.marketinsg.com/index.php?route=information/news/system&amp;url=http%3A%2F%2Flocalhost%2Fclothfarm%2F">here</a>.</p>\n<hr>\n<address>Apache/2.4.12 (Unix) OpenSSL/1.0.1e-fips mod_bwlimited/1.4 Server at www.marketinsg.com Port 80</address>\n</body></html>\n', '2015-12-12 08:24:27');

-- --------------------------------------------------------

--
-- Table structure for table `oc_marketinsg_news_log`
--

CREATE TABLE IF NOT EXISTS `oc_marketinsg_news_log` (
  `marketinsg_news_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_checked` datetime NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`marketinsg_news_log_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `oc_marketinsg_news_log`
--

INSERT INTO `oc_marketinsg_news_log` (`marketinsg_news_log_id`, `date_checked`, `status`) VALUES
(1, '2015-12-05 10:40:59', 1),
(2, '2015-12-06 01:13:07', 1),
(3, '2015-12-06 23:51:50', 1),
(4, '2015-12-07 00:41:46', 1),
(5, '2015-12-07 22:01:11', 1),
(6, '2015-12-07 23:31:33', 1),
(7, '2015-12-08 00:03:48', 1),
(8, '2015-12-08 22:25:19', 1),
(9, '2015-12-09 14:14:03', 1),
(10, '2015-12-10 00:31:50', 1),
(11, '2015-12-11 00:53:28', 1),
(12, '2015-12-12 08:24:27', 1),
(13, '2015-12-13 08:42:35', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_merchant`
--

CREATE TABLE IF NOT EXISTS `oc_merchant` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `store_ids` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `parent` int(11) NOT NULL,
  `config_free_signup` varchar(16) NOT NULL,
  `plan_id` int(16) NOT NULL,
  `autopost_time` varchar(16) NOT NULL,
  `plan_id_autopost` int(16) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `oc_merchant`
--

INSERT INTO `oc_merchant` (`user_id`, `user_group_id`, `store_ids`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`, `parent`, `config_free_signup`, `plan_id`, `autopost_time`, `plan_id_autopost`) VALUES
(13, 1, 9, 'merchant', '7441a0a54e4167700735983f31714cbb44add0c8', 'afbe09009', 'merchant', 'merchant', 'merchant@gmail.com', '', '', '122.178.140.174', 1, '2015-12-06 03:33:53', 0, '1452063595', 1, '1450354627', 2),
(14, 1, 10, 'Raja', 'eff215bcad14dc32b0a57d9c5e375181ea806605', '5708ff7d8', 'test', 'test', 'test@gmail.com', '', '', '122.178.95.150', 1, '2015-12-07 00:50:06', 0, '1457250606', 12, '', 0),
(15, 1, 11, 'Raja', '771e798aac63203a0099873966772245ae0cb198', '48dfc5aba', 'test', 'test', 'test@gmail.com', '', '', '', 0, '2015-12-07 00:52:28', 0, '1457250748', 12, '', 0),
(16, 1, 12, 'test1', '6dbf4e60e4cc1b1a0df1a24344b48760e7003950', '562804c34', 'test', 'test', 'test1@gmail.com', '', '', '122.178.95.150', 1, '2015-12-07 01:10:05', 0, '1457251805', 12, '', 0),
(17, 1, 13, 'TEST', '21e41637d8a00e370c6dfb5bac69a9b0fee82b24', '3ed29adf2', 'TEST', 'TEST', 'sales@kenzco.com', '', '', '', 1, '2015-12-07 03:10:33', 0, '', 0, '', 0),
(18, 1, 14, 'test2', 'df41076ca0788eb21639d713771c4505bcbfc394', 'a09c7ee01', 'test2', 'test2', 'test2@gmail.com', '', '', '', 0, '2015-12-07 05:59:49', 0, '1457269189', 12, '', 0),
(19, 1, 15, 'RaJA', 'fbd1fb5b8143bd535b547dfb05c46f9fcbeb6640', '7fb00305f', 'Raja', 'Mani', 'rajamanikandan@exlcart.com', '', '', '', 0, '2015-12-10 02:57:53', 0, '1452333473', 12, '', 0),
(20, 1, 16, 'TEST', '6b5ee09ba1a40f96ce29b891d9a53d103927352b', '90949b533', 'raja', 'Manikandan', 'rajamanikandanr@exlcart.com', '', '', '', 0, '2015-12-10 04:33:37', 0, '1452339217', 12, '', 0),
(21, 1, 17, 'RAJAMANIAN', '61f7e42dabee60b5aae987c159cd0ec24ce748fd', '1baaa3a2c', 'rajamanian', 'RAJAMANIAN', 'RAJAMANIAN@gmail.com', '', '', '', 0, '2015-12-10 05:19:14', 0, '1452341954', 11, '', 0),
(22, 1, 18, 'aasasasas', '627eafbb4f5485dc466b66d76f0e6c8eb0c3a4d8', '1360b88b9', 'rajamanianas', 'RAJAMANIANAS', 'RAJAMANIANAS@gmail.com', '', '', '', 0, '2015-12-10 06:30:51', 0, '1452346251', 13, '', 0),
(23, 1, 19, 'Store 1', '8b73b0a1ca3e4b302fa03621f4ac3e73120c8711', '008b844e7', 'vendot', 'vendor2', 'sales@fortunegiftz.com', '', '', '', 1, '2015-12-10 13:18:12', 0, '1449865092', 10, '', 0),
(24, 1, 20, 'Kenz', '002418f6ba2cc43ed37131e9f78841f5364f6d0b', '11f356889', 'Fayas', 'kamar', 'fayas@kenzco.com', '', '', '', 1, '2015-12-11 00:53:20', 0, '1449906800', 10, '', 0),
(25, 1, 21, 'Mirzastore', 'db3e45b4f459118fc17df25785cbcf30ffe3fa0b', '20f2402c7', 'Mirza', 'V U', 'mirza.ekm@gmail.com', '', '', '::1', 1, '2015-12-12 08:23:31', 0, '1449975211', 10, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_modification`
--

CREATE TABLE IF NOT EXISTS `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_module`
--

CREATE TABLE IF NOT EXISTS `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

--
-- Dumping data for table `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(31, 'default Layout_Home Page_Brands', 'carousel', 'a:5:{s:4:"name";s:31:"default Layout_Home Page_Brands";s:9:"banner_id";s:2:"77";s:5:"width";s:3:"160";s:6:"height";s:2:"65";s:6:"status";s:1:"1";}'),
(32, 'default Layout_all layouts_Block Services', 'html', 'a:3:{s:4:"name";s:41:"default Layout_all layouts_Block Services";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:1545:"&lt;div class=&quot;col-xs-12 col-sm-4 col-lg-4&quot;&gt;\r\n                &lt;a href=&quot;index.php&quot; class=&quot;item anim-icon&quot;&gt;\r\n                    &lt;span class=&quot;icon&quot;&gt;&lt;img src=&quot;image/catalog/blocks/anim-icon-1.gif&quot; data-hover=&quot;image/catalog/blocks/anim-icon-1-hover.gif&quot; alt=&quot;&quot;&gt;&lt;/span&gt;\r\n                    &lt;span class=&quot;title&quot;&gt;Free shipping on orders over AED 300&lt;/span&gt;\r\n                &lt;/a&gt;\r\n            &lt;/div&gt;\r\n\r\n\r\n            &lt;div class=&quot;col-xs-12 col-sm-4 col-lg-4&quot;&gt;\r\n                &lt;a href=&quot;index.php&quot; class=&quot;item anim-icon&quot;&gt;\r\n                    &lt;span class=&quot;icon&quot;&gt;&lt;img src=&quot;image/catalog/blocks/anim-icon-2.gif&quot; data-hover=&quot;image/catalog/blocks/anim-icon-2-hover.gif&quot; alt=&quot;&quot;&gt;&lt;/span&gt;&amp;nbsp;&lt;span class=&quot;title&quot;&gt;10-day returns&lt;/span&gt;\r\n                &lt;/a&gt;\r\n            &lt;/div&gt;\r\n\r\n\r\n            &lt;div class=&quot;col-xs-12 col-sm-4 col-lg-4&quot;&gt;\r\n                &lt;a href=&quot;index.php&quot; class=&quot;item anim-icon&quot;&gt;\r\n                    &lt;span class=&quot;icon&quot;&gt;&lt;img src=&quot;image/catalog/blocks/anim-icon-3.gif&quot; data-hover=&quot;image/catalog/blocks/anim-icon-3-hover.gif&quot; alt=&quot;&quot;&gt;&lt;/span&gt;\r\n                    &lt;span class=&quot;title&quot;&gt;24/7 Support &lt;/span&gt;\r\n                &lt;/a&gt;\r\n            &lt;/div&gt;";}}s:6:"status";s:1:"1";}'),
(34, 'default Layout_Home Page_Revolution Slider', 'topslider', 'a:3:{s:4:"name";s:42:"default Layout_Home Page_Revolution Slider";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:13625:"&lt;ul&gt;                &lt;li id=&quot;slide1&quot; data-transition=&quot;zoomout&quot; data-slotamount=&quot;7&quot; data-masterspeed=&quot;500&quot; data-title=&quot;First Slide&quot; data-link=&quot;index.php&quot;&gt;                    &lt;img src=&quot;image/catalog/dummy.png&quot; alt=&quot;slide1&quot; data-lazyload=&quot;image/catalog/sliders/slide1.png&quot;&gt;                    &lt;div class=&quot;tp-caption fadein fadeout  rs-parallaxlevel-1&quot; data-x=&quot;500&quot; data-y=&quot;0&quot; data-speed=&quot;1000&quot; data-start=&quot;500&quot; data-easing=&quot;Power3.easeInOut&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; style=&quot;z-index: 4;&quot;&gt;&lt;img src=&quot;image/catalog/sliders/slide1-1.png&quot; alt=&quot;&quot;&gt;                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption lfl fadeout  rs-parallaxlevel-2&quot; data-x=&quot;200&quot; data-y=&quot;0&quot; data-speed=&quot;1000&quot; data-start=&quot;1000&quot; data-easing=&quot;Power3.easeInOut&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; style=&quot;z-index: 4;&quot;&gt;                        &lt;img src=&quot;image/catalog/sliders/slide1-2.png&quot; alt=&quot;&quot;&gt;                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption lfr fadeout  rs-parallaxlevel-3&quot; data-x=&quot;700&quot; data-y=&quot;0&quot; data-speed=&quot;1200&quot; data-start=&quot;1600&quot; data-easing=&quot;Power3.easeInOut&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; style=&quot;z-index: 4;&quot;&gt;                        &lt;img src=&quot;image/catalog/sliders/slide1-3.png&quot; alt=&quot;&quot;&gt;                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption text0 fadeout&quot; data-x=&quot;1050&quot; data-y=&quot;140&quot; data-speed=&quot;800&quot; data-start=&quot;2500&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt; “                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption text1 fadeout&quot; data-x=&quot;1080&quot; data-y=&quot;150&quot; data-speed=&quot;800&quot; data-start=&quot;3000&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;Clothes make&lt;br&gt;                        the man.                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption text2 fadeout&quot; data-x=&quot;1080&quot; data-y=&quot;255&quot; data-speed=&quot;500&quot; data-start=&quot;3500&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;Naked people have                        little&lt;br&gt;                        or no influenceon society.                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption text3 fadeout&quot; data-x=&quot;1080&quot; data-y=&quot;305&quot; data-speed=&quot;1000&quot; data-start=&quot;4000&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitin=&quot;none&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 5; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;Mark Twain &lt;/div&gt;                &lt;/li&gt;                &lt;li id=&quot;slide2&quot; data-transition=&quot;zoomout&quot; data-slotamount=&quot;7&quot; data-masterspeed=&quot;500&quot; data-title=&quot;Second Slide&quot; data-link=&quot;index.php&quot;&gt;                    &lt;img src=&quot;image/catalog/dummy.png&quot; alt=&quot;slide2&quot; data-lazyload=&quot;image/catalog/sliders/slide2.jpg&quot;&gt;                    &lt;div class=&quot;tp-caption fadein fadeout  rs-parallaxlevel-1&quot; data-x=&quot;750&quot; data-y=&quot;0&quot; data-speed=&quot;1000&quot; data-start=&quot;500&quot; data-easing=&quot;Power3.easeInOut&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; style=&quot;z-index: 4;&quot;&gt;                        &lt;img src=&quot;image/catalog/sliders/slide2.gif&quot; alt=&quot;&quot;&gt;                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption text0 fadeout&quot; data-x=&quot;380&quot; data-y=&quot;210&quot; data-speed=&quot;800&quot; data-start=&quot;1000&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt; “                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption text1 fadeout&quot; data-x=&quot;410&quot; data-y=&quot;220&quot; data-speed=&quot;800&quot; data-start=&quot;1000&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;The most                        beautiful&lt;br&gt;                        clothes                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption text2 fadeout&quot; data-x=&quot;410&quot; data-y=&quot;325&quot; data-speed=&quot;500&quot; data-start=&quot;1500&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;that can dress a                        woman are&lt;br&gt;                        the arms of the man she loves.                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption text3 fadeout&quot; data-x=&quot;410&quot; data-y=&quot;375&quot; data-speed=&quot;1000&quot; data-start=&quot;2000&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitin=&quot;none&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 5; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;Yves Saint-Laurent                    &lt;/div&gt;                &lt;/li&gt;&lt;li id=&quot;slide3&quot; data-transition=&quot;zoomout&quot; data-slotamount=&quot;7&quot; data-masterspeed=&quot;500&quot; data-title=&quot;First Slide&quot; data-link=&quot;index.php&quot;&gt;                    &lt;img src=&quot;image/catalog/dummy.png&quot; alt=&quot;slide3&quot; data-lazyload=&quot;image/catalog/sliders/slide1.png&quot;&gt;                    &lt;div class=&quot;tp-caption fadein fadeout  rs-parallaxlevel-1&quot; data-x=&quot;500&quot; data-y=&quot;0&quot; data-speed=&quot;1000&quot; data-start=&quot;500&quot; data-easing=&quot;Power3.easeInOut&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; style=&quot;z-index: 4;&quot;&gt;&lt;img src=&quot;image/catalog/sliders/slide1-1.png&quot; alt=&quot;&quot;&gt;                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption lfl fadeout  rs-parallaxlevel-2&quot; data-x=&quot;200&quot; data-y=&quot;0&quot; data-speed=&quot;1000&quot; data-start=&quot;1000&quot; data-easing=&quot;Power3.easeInOut&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; style=&quot;z-index: 4;&quot;&gt;                        &lt;img src=&quot;image/catalog/sliders/slide1-2.png&quot; alt=&quot;&quot;&gt;                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption lfr fadeout  rs-parallaxlevel-3&quot; data-x=&quot;700&quot; data-y=&quot;0&quot; data-speed=&quot;1200&quot; data-start=&quot;1600&quot; data-easing=&quot;Power3.easeInOut&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; style=&quot;z-index: 4;&quot;&gt;                        &lt;img src=&quot;image/catalog/sliders/slide1-3.png&quot; alt=&quot;&quot;&gt;                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption text0 fadeout&quot; data-x=&quot;1050&quot; data-y=&quot;140&quot; data-speed=&quot;800&quot; data-start=&quot;2500&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt; “                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption text1 fadeout&quot; data-x=&quot;1080&quot; data-y=&quot;150&quot; data-speed=&quot;800&quot; data-start=&quot;3000&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;Clothfarm make&lt;br&gt;                        the man.                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption text2 fadeout&quot; data-x=&quot;1080&quot; data-y=&quot;255&quot; data-speed=&quot;500&quot; data-start=&quot;3500&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;Naked people have                        little&lt;br&gt;                        or no influenceon society.                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption text3 fadeout&quot; data-x=&quot;1080&quot; data-y=&quot;305&quot; data-speed=&quot;1000&quot; data-start=&quot;4000&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitin=&quot;none&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 5; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;Mark Twain &lt;/div&gt;                &lt;/li&gt;&lt;li id=&quot;slide4&quot; data-transition=&quot;zoomout&quot; data-slotamount=&quot;7&quot; data-masterspeed=&quot;500&quot; data-title=&quot;Second Slide&quot; data-link=&quot;index.php&quot;&gt;                    &lt;img src=&quot;image/catalog/dummy.png&quot; alt=&quot;slide4&quot; data-lazyload=&quot;image/catalog/sliders/slide2.jpg&quot;&gt;                    &lt;div class=&quot;tp-caption fadein fadeout  rs-parallaxlevel-1&quot; data-x=&quot;750&quot; data-y=&quot;0&quot; data-speed=&quot;1000&quot; data-start=&quot;500&quot; data-easing=&quot;Power3.easeInOut&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; style=&quot;z-index: 4;&quot;&gt;                        &lt;img src=&quot;image/catalog/sliders/slide2.gif&quot; alt=&quot;&quot;&gt;                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption text0 fadeout&quot; data-x=&quot;380&quot; data-y=&quot;210&quot; data-speed=&quot;800&quot; data-start=&quot;1000&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt; “                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption text1 fadeout&quot; data-x=&quot;410&quot; data-y=&quot;220&quot; data-speed=&quot;800&quot; data-start=&quot;1000&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;The mooost                        beautiful&lt;br&gt;                        clothes                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption text2 fadeout&quot; data-x=&quot;410&quot; data-y=&quot;325&quot; data-speed=&quot;500&quot; data-start=&quot;1500&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;that can dress a                        woman are&lt;br&gt;                        the arms of the man she loves.                    &lt;/div&gt;                    &lt;div class=&quot;tp-caption text3 fadeout&quot; data-x=&quot;410&quot; data-y=&quot;375&quot; data-speed=&quot;1000&quot; data-start=&quot;2000&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitin=&quot;none&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 5; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;Yves Saint-Laurent                    &lt;/div&gt;                &lt;/li&gt;            &lt;/ul&gt;";}}s:6:"status";s:1:"1";}'),
(35, 'default Layout_Home Page_Block Circled Banners', 'html', 'a:3:{s:4:"name";s:46:"default Layout_Home Page_Block Circled Banners";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:1729:"&lt;div class=&quot;container content circle_banners slick-style2&quot;&gt;\r\n    &lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-xs-6 col-sm-6 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;div class=&quot;banner-circle animate fadeInDown&quot; onclick=&quot;location.href=''index.php''&quot;&gt;\r\n                &lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image/catalog/blocks/img1.jpg&quot; alt=&quot;&quot; class=&quot;animate-scale&quot;&gt;&lt;/div&gt;\r\n\r\n                &lt;div class=&quot;title&quot;&gt;&lt;span&gt;New Arrivals&lt;/span&gt;&lt;/div&gt;\r\n\r\n            &lt;/div&gt;\r\n\r\n        &lt;/div&gt;\r\n\r\n        &lt;div class=&quot;col-xs-6 col-sm-6 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;div class=&quot;banner-circle animate fadeInDown&quot; onclick=&quot;location.href=''index.php''&quot;&gt;\r\n                &lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image/catalog/blocks/img2.jpg&quot; alt=&quot;&quot; class=&quot;animate-scale&quot;&gt;&lt;/div&gt;\r\n\r\n                &lt;div class=&quot;title&quot;&gt;&lt;span&gt;Winter Sale&lt;/span&gt;&lt;/div&gt;\r\n\r\n            &lt;/div&gt;\r\n\r\n        &lt;/div&gt;\r\n\r\n        &lt;div class=&quot;col-xs-6 col-sm-6 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;div class=&quot;banner-circle animate fadeInDown&quot; onclick=&quot;location.href=''index.php''&quot;&gt;\r\n                &lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image/catalog/blocks/img3.jpg&quot; alt=&quot;&quot; class=&quot;animate-scale&quot;&gt;&lt;/div&gt;\r\n\r\n                &lt;div class=&quot;title&quot;&gt;&lt;span&gt;All Day Clothing&lt;/span&gt;&lt;/div&gt;\r\n\r\n            &lt;/div&gt;\r\n\r\n        &lt;/div&gt;\r\n\r\n    &lt;/div&gt;\r\n\r\n&lt;/div&gt;";}}s:6:"status";s:1:"1";}'),
(36, 'default Layout_Home Page', 'footer_info', 'a:3:{s:4:"name";s:24:"default Layout_Home Page";s:18:"module_description";a:7:{s:16:"account_facebook";s:26:"Clothfarm-1517909271860920";s:15:"account_twitter";s:9:"clothfarm";s:19:"sort_order_facebook";s:1:"1";s:18:"sort_order_twitter";s:1:"2";s:16:"sort_order_about";s:1:"3";s:23:"sort_order_testimonials";s:1:"4";i:1;a:6:{s:16:"heading_facebook";s:8:"Facebook";s:15:"heading_twitter";s:7:"Twitter";s:13:"heading_about";s:8:"About us";s:17:"description_about";s:496:"&lt;p&gt;&lt;img src=&quot;image/catalog/blocks/img-about.jpg&quot; alt=&quot;&quot; class=&quot;img-responsive&quot;&gt;&lt;/p&gt;\r\n\r\n                    &lt;p&gt;CClothfarm.com is one of the largest online fashion retail market store. We have more than 100,000 fashion products in our shelves such as Churidars, Lehanga, Choli, Sarees, Legings, Fromal Shirts, Trousers, Kids wear, Accessories and many more. The main attraction of clothfarm.com is the home business entrepreneurs. \r\n &lt;/p&gt;";s:15:"heading_contact";s:12:"Testimonials";s:19:"description_contact";s:1709:"&lt;div class=&quot;carousel-item&quot;&gt;                                &lt;div class=&quot;text&quot;&gt;When the Fashion takes its path in supersonic, clothfarm provides the craft for it. Hats off to the Team.&lt;div class=&quot;arrow&quot;&gt;&lt;/div&gt;                                &lt;/div&gt;                                &lt;div class=&quot;author&quot;&gt;Ashaan Arhan&lt;/div&gt;                            &lt;/div&gt;                            &lt;div class=&quot;carousel-item&quot;&gt;                                &lt;div class=&quot;text&quot;&gt;Better service, Quick Delivery, Easy Payment Plan. Thanks for the dress.&lt;div class=&quot;arrow&quot;&gt;&lt;/div&gt;                                &lt;/div&gt;                                &lt;div class=&quot;author&quot;&gt;Gayathri Pankaj&lt;/div&gt;                            &lt;/div&gt;                            &lt;div class=&quot;carousel-item&quot;&gt;                                &lt;div class=&quot;text&quot;&gt;Excellent collections with various vendors. 5* Suppliers.                                    &lt;div class=&quot;arrow&quot;&gt;&lt;/div&gt;                                &lt;/div&gt;                                &lt;div class=&quot;author&quot;&gt;Jenny Francis&lt;/div&gt;                            &lt;/div&gt;                           &lt;div class=&quot;carousel-item&quot;&gt;                                &lt;div class=&quot;text&quot;&gt;Congrats to the Team.&lt;div class=&quot;arrow&quot;&gt;&lt;/div&gt;                                &lt;/div&gt;                                &lt;div class=&quot;author&quot;&gt;Shahana Basheer&lt;/div&gt;                            &lt;/div&gt;";}}s:6:"status";s:1:"1";}'),
(71, 'Popular Products', 'popular', 'a:5:{s:4:"name";s:16:"Popular Products";s:5:"limit";s:1:"5";s:5:"width";s:3:"200";s:6:"height";s:3:"200";s:6:"status";s:1:"1";}'),
(37, 'default Layout_Home Page', 'featured', 'a:6:{s:4:"name";s:24:"default Layout_Home Page";s:7:"product";a:12:{i:0;s:2:"42";i:1;s:2:"30";i:2;s:2:"28";i:3;s:2:"41";i:4;s:2:"47";i:5;s:2:"49";i:6;s:2:"33";i:7;s:2:"46";i:8;s:2:"40";i:9;s:2:"48";i:10;s:2:"36";i:11;s:2:"34";}s:5:"limit";s:2:"12";s:5:"width";s:3:"480";s:6:"height";s:3:"450";s:6:"status";s:1:"1";}'),
(38, 'default Layout_Home Page', 'latest', 'a:5:{s:4:"name";s:24:"default Layout_Home Page";s:5:"limit";s:1:"8";s:5:"width";s:3:"290";s:6:"height";s:3:"406";s:6:"status";s:1:"1";}'),
(39, 'default Layout_Simple Blog_Text', 'html', 'a:3:{s:4:"name";s:31:"default Layout_Simple Blog_Text";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:35:"&lt;h3&gt;ABOUT THE BLOG&lt;/h3&gt;";s:11:"description";s:300:"&lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam.&lt;/p&gt;";}}s:6:"status";s:1:"1";}'),
(40, 'default Layout_Simple Blog_Tags', 'html', 'a:3:{s:4:"name";s:31:"default Layout_Simple Blog_Tags";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:4:"Tags";s:11:"description";s:992:"&lt;ul class=&quot;tags&quot;&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;Web Design &lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;Wordpress&lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt; Animation &lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;Collection &lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;Fall &lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt; Retail &lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;Sale &lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;Spring &lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;Summer &lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt; Winter&lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;Discount&lt;/a&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;div class=&quot;clearfix&quot;&gt;&lt;/div&gt;\r\n";}}s:6:"status";s:1:"1";}'),
(42, 'default Layout_Home Page_Block Flickr', 'html', 'a:3:{s:4:"name";s:37:"default Layout_Home Page_Block Flickr";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:150:"&lt;div class=&quot;pull-left vertical_title_outer title-sm flickr&quot;&gt; &lt;div&gt;&lt;span&gt;Flickr photos&lt;/span&gt;&lt;/div&gt;&lt;/div&gt;";s:11:"description";s:565:"&lt;div class=&quot;pull-left padding-left flickr&quot;&gt;\r\n    &lt;div id=&quot;flickr_badge_wrapper&quot;&gt;\r\n    &lt;script type=&quot;text/javascript&quot; src=&quot;http://www.flickr.com/badge_code_v2.gne?count=9&amp;amp;display=latest&amp;amp;size=s&amp;amp;layout=x&amp;amp;source=user&amp;amp;user=52617155@N08&quot;&gt;&lt;/script&gt;\r\n    &lt;/div&gt;\r\n    &lt;div class=&quot;text-center flickr&quot;&gt;&lt;a class=&quot;btn-cool&quot; href=&quot;https://www.flickr.com/photos/we-are-envato&quot;&gt; more photos &lt;/a&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n";}}s:6:"status";s:1:"1";}'),
(43, 'default Layout_Home Page', 'special', 'a:5:{s:4:"name";s:24:"default Layout_Home Page";s:5:"limit";s:1:"5";s:5:"width";s:3:"145";s:6:"height";s:3:"203";s:6:"status";s:1:"1";}'),
(47, 'default Layout_Home Page', 'random', 'a:5:{s:4:"name";s:24:"default Layout_Home Page";s:5:"limit";s:1:"3";s:5:"width";s:3:"145";s:6:"height";s:3:"203";s:6:"status";s:1:"1";}'),
(49, 'default Layout_Simple Blog_Flickr', 'html', 'a:3:{s:4:"name";s:33:"default Layout_Simple Blog_Flickr";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:34:"&lt;h3&gt;Flickr photos&lt;/h3&gt;";s:11:"description";s:701:"&lt;div class=&quot;flickr&quot;&gt;\r\n    &lt;div id=&quot;flickr_badge_wrapper&quot;&gt;\r\n        &lt;script type=&quot;text/javascript&quot; src=&quot;http://www.flickr.com/badge_code_v2.gne?count=9&amp;amp;display=latest&amp;amp;size=s&amp;amp;layout=x&amp;amp;source=user&amp;amp;user=52617155@N08&quot;&gt;&lt;/script&gt;\r\n        &lt;center&gt;&lt;small&gt;Created with &lt;a href=&quot;http://www.flickrbadge.com&quot;&gt;flickr badge&lt;/a&gt;.&lt;/small&gt;&lt;/center&gt;\r\n    &lt;/div&gt;\r\n    &lt;div class=&quot;text-center flickr&quot;&gt;&lt;a class=&quot;btn-cool&quot; href=&quot;https://www.flickr.com/photos/we-are-envato&quot;&gt; more photos &lt;/a&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n";}}s:6:"status";s:1:"1";}'),
(50, 'default Layout_Category Page', 'bestseller', 'a:5:{s:4:"name";s:28:"default Layout_Category Page";s:5:"limit";s:1:"5";s:5:"width";s:3:"200";s:6:"height";s:3:"200";s:6:"status";s:1:"1";}'),
(51, 'default Layout_Product Page_Custom Block', 'html', 'a:3:{s:4:"name";s:40:"default Layout_Product Page_Custom Block";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:38:"&lt;h3&gt;CUSTOM HTML BLOCK&lt;/h3&gt;";s:11:"description";s:1459:"&lt;div&gt;\r\nYou can add your content here, like promotions or some additional info\r\n&lt;div class=&quot;custom-block&quot;&gt;\r\n    &lt;a href=&quot;index.php&quot; class=&quot;item&quot;&gt;\r\n        &lt;span class=&quot;icon flaticon-outlined3&quot;&gt;&lt;/span&gt;\r\n        &lt;span class=&quot;text&quot;&gt;\r\n            &lt;span class=&quot;title&quot;&gt;Special Offer 1+1=3&lt;/span&gt;\r\n            &lt;span class=&quot;description&quot;&gt;Get a gift!&lt;/span&gt;\r\n        &lt;/span&gt;\r\n    &lt;/a&gt;\r\n    &lt;a href=&quot;index.php&quot; class=&quot;item&quot;&gt;\r\n        &lt;span class=&quot;icon flaticon-credit22&quot;&gt;&lt;/span&gt;\r\n        &lt;span class=&quot;text&quot;&gt;&lt;span class=&quot;title&quot;&gt;FREE REWARD CARD&lt;/span&gt; &lt;span class=&quot;description&quot;&gt;Worth 10$, 50$, 100$&lt;/span&gt; &lt;/span&gt;\r\n    &lt;/a&gt;\r\n    &lt;a href=&quot;index.php&quot; class=&quot;item&quot;&gt;\r\n        &lt;span class=&quot;icon flaticon-business137&quot;&gt;&lt;/span&gt;\r\n        &lt;span class=&quot;text&quot;&gt; &lt;span class=&quot;title&quot;&gt;Join Our Club&lt;/span&gt; &lt;/span&gt;\r\n    &lt;/a&gt;\r\n    &lt;a href=&quot;index.php&quot; class=&quot;item&quot;&gt;\r\n        &lt;span class=&quot;icon flaticon-global10&quot;&gt;&lt;/span&gt;\r\n        &lt;span class=&quot;text&quot;&gt;&lt;span class=&quot;title&quot;&gt;Free Shipping&lt;/span&gt;&lt;/span&gt;\r\n    &lt;/a&gt;\r\n&lt;/div&gt;\r\n&lt;/div&gt;";}}s:6:"status";s:1:"1";}'),
(53, 'default Layout_SiteMapImage', 'html', 'a:3:{s:4:"name";s:27:"default Layout_SiteMapImage";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:130:"&lt;img class=&quot;img-responsive animate scale&quot; src=&quot;image/catalog/blocks/sitemap-img.png&quot; alt=&quot;&quot;&gt;\r\n";}}s:6:"status";s:1:"1";}'),
(55, 'boxed Landing Layout_Home Page', 'html', 'a:3:{s:4:"name";s:30:"boxed Landing Layout_Home Page";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:8717:"&lt;div class=&quot;container&quot;&gt;\r\n    &lt;div class=&quot;products-land row&quot;&gt;\r\n        &lt;div class=&quot;products-land-row&quot;&gt;\r\n            &lt;div class=&quot;item col1&quot;&gt;\r\n                &lt;img src=&quot;image/catalog/skin_landing/product-boxed-land1.jpg&quot; alt=&quot;&quot;&gt;\r\n                &lt;div class=&quot;hover&quot;&gt;&lt;/div&gt;\r\n                &lt;div class=&quot;info middle-left text-center&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                        &lt;div class=&quot;fsize18&quot;&gt;party dress&lt;br&gt; trending&lt;/div&gt;\r\n                        &lt;div class=&quot;fsize30&quot;&gt;2015&lt;/div&gt;\r\n                        &lt;div class=&quot;fsize10&quot;&gt;Shop arrivals!&lt;/div&gt;\r\n                        &lt;br&gt;\r\n                        &lt;a href=&quot;index.php&quot; class=&quot;btn-cool btn-transparent btn-small&quot;&gt;Shop now&lt;/a&gt;&lt;/div&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;item col10&quot;&gt;\r\n                &lt;a href=&quot;index.php&quot;&gt;&lt;img src=&quot;image/catalog/skin_landing/image-boxed-land-1.jpg&quot; alt=&quot;&quot;&gt;&lt;/a&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;item col1&quot;&gt;\r\n                &lt;img src=&quot;image/catalog/skin_landing/product-boxed-land2.jpg&quot; alt=&quot;&quot;&gt;\r\n                &lt;div class=&quot;hover&quot;&gt;&lt;/div&gt;\r\n                &lt;div class=&quot;info middle-left text-center&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                        &lt;div&gt;&lt;span class=&quot;fsize50&quot;&gt;40&lt;/span&gt;&lt;span class=&quot;fsize16&quot;&gt;%off&lt;/span&gt;&lt;/div&gt;\r\n                        &lt;div class=&quot;fsize18&quot;&gt; on entire categories&lt;/div&gt;\r\n                        &lt;div class=&quot;line&quot;&gt;&lt;/div&gt;\r\n                        &lt;div class=&quot;fsize10&quot;&gt;start from $10&lt;/div&gt;\r\n                        &lt;br&gt;\r\n                        &lt;a href=&quot;index.php&quot; class=&quot;btn-cool btn-transparent btn-small&quot;&gt;Shop now&lt;/a&gt;&lt;/div&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;products-land-row&quot;&gt;\r\n            &lt;div class=&quot;item col3&quot;&gt;\r\n                &lt;img src=&quot;image/catalog/skin_landing/product-boxed-land3.jpg&quot; alt=&quot;&quot;&gt;\r\n                &lt;div class=&quot;hover&quot;&gt;&lt;/div&gt;\r\n                &lt;div class=&quot;info middle-right text-center&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                        &lt;div class=&quot;fsize24&quot;&gt;SUMMER 2015 &lt;/div&gt;\r\n                        &lt;div class=&quot;fsize50&quot;&gt;FASHION TRENDS&lt;/div&gt;\r\n                        &lt;a href=&quot;index.php&quot; class=&quot;btn-cool btn-transparent btn-small&quot;&gt;Shop now&lt;/a&gt;&lt;/div&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;item col4&quot;&gt;\r\n                &lt;img src=&quot;image/catalog/skin_landing/product-boxed-land4.jpg&quot; alt=&quot;&quot;&gt;\r\n                &lt;div class=&quot;hover&quot;&gt;&lt;/div&gt;\r\n                &lt;div class=&quot;info top-right text-center&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                        &lt;div class=&quot;fsize24&quot;&gt;Must Have&lt;/div&gt;\r\n                        &lt;div class=&quot;fsize18&quot;&gt;Looks&lt;/div&gt;\r\n                        &lt;br&gt;\r\n                        &lt;a href=&quot;index.php&quot; class=&quot;btn-cool btn-transparent btn-small&quot;&gt;Shop now&lt;/a&gt;&lt;/div&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;item col2 pull-top-1 video-item&quot;&gt;\r\n                &lt;div class=&quot;video-poster&quot;&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;img src=&quot;image/catalog/skin_landing/video/video-women1.jpg&quot; alt=&quot;&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n                &lt;div class=&quot;product-video&quot;&gt;\r\n                    &lt;video autoplay=&quot;&quot; preload=&quot;auto&quot; loop=&quot;&quot;&gt;\r\n                        &lt;source src=&quot;image/catalog/skin_landing/video/video-women1.mp4&quot; type=&quot;video/mp4&quot;&gt;\r\n                        &lt;source src=&quot;image/catalog/skin_landing/video/video-women1.ogv&quot; type=&quot;video/ogg&quot;&gt;\r\n                        &lt;a href=&quot;index.php&quot;&gt;&lt;img src=&quot;image/catalog/skin_landing/video/video-women1.jpg&quot; alt=&quot;&quot;&gt;&lt;/a&gt;\r\n                    &lt;/video&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;products-land-row&quot;&gt;\r\n            &lt;div class=&quot;item col6 video-item&quot;&gt;\r\n                &lt;div class=&quot;video-poster&quot;&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;img src=&quot;image/catalog/skin_landing/video/video-women2.jpg&quot; alt=&quot;&quot;&gt;&lt;/a&gt;&lt;/div&gt;\r\n                &lt;div class=&quot;product-video&quot;&gt;\r\n                    &lt;video autoplay=&quot;&quot; preload=&quot;auto&quot; loop=&quot;&quot;&gt;\r\n                    &lt;source src=&quot;image/catalog/skin_landing/video/video-women2.mp4&quot; type=&quot;video/mp4&quot;&gt;\r\n                    &lt;source src=&quot;image/catalog/skin_landing/video/video-women2.ogv&quot; type=&quot;video/ogg&quot;&gt;\r\n                        &lt;a href=&quot;index.php&quot;&gt;&lt;img src=&quot;image/catalog/skin_landing/video/video-women2.jpg&quot; alt=&quot;&quot;&gt;&lt;/a&gt;\r\n                    &lt;/video&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;item col7&quot;&gt;\r\n                &lt;img src=&quot;image/catalog/skin_landing/product-boxed-land5.jpg&quot; alt=&quot;&quot;&gt;\r\n                &lt;div class=&quot;hover&quot;&gt;&lt;/div&gt;\r\n                &lt;div class=&quot;info middle-left text-center&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                        &lt;div class=&quot;fsize28&quot;&gt;Falls&lt;br&gt; Fashion&lt;/div&gt;\r\n                        &lt;div class=&quot;fsize18&quot;&gt;2015&lt;/div&gt;\r\n                        &lt;br&gt;\r\n                        &lt;a href=&quot;index.php&quot; class=&quot;btn-cool btn-transparent btn-small&quot;&gt;Shop now&lt;/a&gt;\r\n                    &lt;/div&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;item col8 pull-top-2&quot;&gt;\r\n                &lt;a href=&quot;index.php&quot;&gt;&lt;img src=&quot;image/catalog/skin_landing/image-boxed-land-2.jpg&quot; alt=&quot;&quot;&gt;&lt;/a&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;pull-left pull-top-3 col col9&quot;&gt;\r\n                &lt;div class=&quot;item&quot;&gt;\r\n                    &lt;img src=&quot;image/catalog/skin_landing/product-boxed-land6.jpg&quot; alt=&quot;&quot;&gt;\r\n                    &lt;div class=&quot;hover&quot;&gt;&lt;/div&gt;\r\n                    &lt;div class=&quot;info bottom-center text-center&quot;&gt;\r\n                        &lt;div class=&quot;inside&quot;&gt;\r\n                            &lt;div class=&quot;fsize18&quot;&gt;hottest, trending, reclaimed  luxury product&lt;/div&gt;&lt;br&gt;\r\n                            &lt;a href=&quot;index.php&quot; class=&quot;btn-cool btn-transparent btn-small&quot;&gt;Shop now&lt;/a&gt;\r\n                        &lt;/div&gt;\r\n                    &lt;/div&gt;\r\n                &lt;/div&gt;\r\n                &lt;div class=&quot;item&quot;&gt;\r\n                    &lt;img src=&quot;image/catalog/skin_landing/product-boxed-land7.jpg&quot; alt=&quot;&quot;&gt;\r\n                    &lt;div class=&quot;hover&quot;&gt;&lt;/div&gt;\r\n                    &lt;div class=&quot;info top-left text-center&quot;&gt;\r\n                        &lt;div class=&quot;inside&quot;&gt;\r\n                            &lt;div class=&quot;fsize21&quot;&gt;MID SEASON&lt;/div&gt;\r\n                            &lt;div class=&quot;fsize40 text-white&quot;&gt;SALE&lt;/div&gt;\r\n                            &lt;div class=&quot;fsize16&quot;&gt;up to 70% off&lt;/div&gt;\r\n                            &lt;a href=&quot;index.php&quot; class=&quot;btn-cool btn-transparent btn-small&quot;&gt;Shop now&lt;/a&gt;\r\n                        &lt;/div&gt;\r\n                    &lt;/div&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n&lt;/div&gt;\r\n";}}s:6:"status";s:1:"1";}'),
(56, 'Landing Banners Layout_Home Page', 'html', 'a:3:{s:4:"name";s:32:"Landing Banners Layout_Home Page";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:6159:"&lt;div&gt;\r\n    &lt;div class=&quot;products-land&quot;&gt;\r\n        &lt;div class=&quot;item&quot;&gt;\r\n            &lt;img src=&quot;image/catalog/skin_landing/image-land-01.jpg&quot; alt=&quot;&quot;&gt;\r\n            &lt;div class=&quot;hover&quot;&gt;&lt;/div&gt;\r\n            &lt;div class=&quot;info top-left text-center&quot;&gt;\r\n                &lt;div class=&quot;inside&quot;&gt;\r\n                    &lt;h6&gt;Shop arrivals!&lt;/h6&gt;\r\n                    &lt;h2 class=&quot;border&quot;&gt;POPULAR BAGS&lt;/h2&gt;\r\n                    &lt;h4&gt;hottest, trending, reclaimed\r\n                        luxury product&lt;/h4&gt;\r\n                    &lt;a href=&quot;index.php&quot; class=&quot;btn-cool btn-light&quot;&gt;Shop now&lt;/a&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;item&quot;&gt;\r\n            &lt;img src=&quot;image/catalog/skin_landing/image-land-02.jpg&quot; alt=&quot;&quot;&gt;\r\n            &lt;div class=&quot;hover&quot;&gt;&lt;/div&gt;\r\n            &lt;div class=&quot;stamp top-right&quot;&gt;\r\n                &lt;div class=&quot;inside&quot;&gt;UP&lt;span&gt;50%&lt;/span&gt;TO&lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;info bottom-center text-center&quot;&gt;\r\n                &lt;div class=&quot;inside&quot;&gt;\r\n                    &lt;h6&gt;anniversary event&lt;/h6&gt;\r\n                    &lt;h2 class=&quot;border&quot;&gt;exclusive jewelry&lt;/h2&gt;\r\n                    &lt;h4&gt;Special Pricing on all\r\n                        jewelry designers&lt;/h4&gt;\r\n                    &lt;a href=&quot;index.php&quot; class=&quot;btn-cool btn-light&quot;&gt;Shop now&lt;/a&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;item&quot;&gt;\r\n            &lt;img src=&quot;image/catalog/skin_landing/image-land-03.jpg&quot; alt=&quot;&quot;&gt;\r\n            &lt;div class=&quot;hover&quot;&gt;&lt;/div&gt;\r\n            &lt;div class=&quot;info invert top-right text-center&quot;&gt;\r\n                &lt;div class=&quot;inside&quot;&gt;\r\n                    &lt;h6&gt;NOW TRENDING&lt;/h6&gt;\r\n                    &lt;h2 class=&quot;border&quot;&gt;LADIES’ WATCHES&lt;/h2&gt;\r\n                    &lt;h4&gt;ESIGNS OF THE YEAR&lt;br&gt;\r\n                        2015&lt;/h4&gt;\r\n                    &lt;a href=&quot;index.php&quot; class=&quot;btn-cool btn-light&quot;&gt;Shop now&lt;/a&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;item&quot;&gt;\r\n            &lt;img src=&quot;image/catalog/skin_landing/image-land-04.jpg&quot; alt=&quot;&quot;&gt;\r\n            &lt;div class=&quot;hover&quot;&gt;&lt;/div&gt;\r\n            &lt;div class=&quot;inside&quot;&gt;\r\n                &lt;div class=&quot;info bottom-center text-right&quot;&gt;\r\n                    &lt;h2 class=&quot;quote&quot;&gt;Elegance&lt;br&gt;\r\n                        is the only beauty&lt;br&gt;\r\n                        that never fades&lt;/h2&gt;\r\n                    &lt;h4&gt;— Audrey Hepburn&lt;/h4&gt;\r\n                    &lt;a href=&quot;index.php&quot; class=&quot;btn-cool btn-dark&quot;&gt;Shop now&lt;/a&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;item double-width&quot;&gt;\r\n            &lt;img src=&quot;image/catalog/skin_landing/image-land-05.jpg&quot; alt=&quot;&quot;&gt;\r\n            &lt;div class=&quot;hover&quot;&gt;&lt;/div&gt;\r\n            &lt;div class=&quot;stamp bottom-left&quot;&gt;\r\n                &lt;div class=&quot;inside&quot;&gt;UP&lt;span&gt;25%&lt;/span&gt;TO&lt;/div&gt;\r\n            &lt;/div&gt;\r\n            &lt;div class=&quot;info top-right text-center&quot;&gt;\r\n                &lt;div class=&quot;inside&quot;&gt;\r\n                    &lt;h6&gt;For Men Only&lt;/h6&gt;\r\n                    &lt;h2 class=&quot;border&quot;&gt;Special weekend discounts&lt;/h2&gt;\r\n                    &lt;h4&gt;Featured Men''s Suits and Fashion&lt;br&gt;\r\n                        Accessories&lt;/h4&gt;\r\n                    &lt;a href=&quot;index.php&quot; class=&quot;btn-cool btn-white&quot;&gt;Shop now&lt;/a&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;item double-width&quot;&gt;\r\n            &lt;img src=&quot;image/catalog/skin_landing/image-land-06.jpg&quot; alt=&quot;&quot;&gt;\r\n            &lt;div class=&quot;hover&quot;&gt;&lt;/div&gt;\r\n            &lt;div class=&quot;info middle-right invert text-center&quot;&gt;\r\n                &lt;div class=&quot;inside&quot;&gt;\r\n                    &lt;h6&gt;crazy deal: only monday &amp; tuesday&lt;/h6&gt;\r\n                    &lt;h2 class=&quot;border&quot;&gt;girls SUMMER COLLECTIONS&lt;/h2&gt;\r\n                    &lt;h4&gt;Save 20-40% at our shop&lt;br&gt;\r\n                        and get free shippng&lt;/h4&gt;\r\n                    &lt;a href=&quot;index.php&quot; class=&quot;btn-cool btn-light&quot;&gt;Shop now&lt;/a&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;item&quot;&gt;\r\n            &lt;img src=&quot;image/catalog/skin_landing/image-land-07.jpg&quot; alt=&quot;&quot;&gt;\r\n            &lt;div class=&quot;hover&quot;&gt;&lt;/div&gt;\r\n            &lt;div class=&quot;info middle-left text-center&quot;&gt;\r\n                &lt;div class=&quot;inside&quot;&gt;\r\n                    &lt;div class=&quot;stamp&quot;&gt;\r\n                        &lt;div class=&quot;inside&quot;&gt;UP&lt;span&gt;50%&lt;/span&gt;TO&lt;/div&gt;\r\n                    &lt;/div&gt;\r\n                    &lt;h2 class=&quot;underline&quot;&gt;FALL FASHION&lt;/h2&gt;\r\n                    &lt;h4&gt;mini style, big brands,&lt;br&gt;\r\n                        always 50% oFF&lt;br&gt;\r\n                        or less&lt;/h4&gt;\r\n                    &lt;a href=&quot;index.php&quot; class=&quot;btn-cool btn-dark&quot;&gt;Shop now&lt;/a&gt;\r\n                &lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n&lt;/div&gt;\r\n";}}s:6:"status";s:1:"1";}'),
(57, 'default Layout_Google Map_Contact Page', 'html', 'a:3:{s:4:"name";s:38:"default Layout_Google Map_Contact Page";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:984:"&lt;div style=&quot;text-decoration:none; overflow:hidden; height:500px; width:1200px; max-width:100%;&quot;&gt;&lt;div id=&quot;gmap-canvas&quot; style=&quot;height:100%; width:100%;max-width:100%;&quot;&gt;&lt;iframe style=&quot;height:100%;width:100%;border:0;&quot; frameborder=&quot;0&quot; src=&quot;https://www.google.com/maps/embed/v1/place?q=Free+Zone+-+Ajman+-+United+Arab+Emirates&amp;key=AIzaSyAN0om9mFmy1QN6Wf54tXAowK4eT0ZUPrU&quot;&gt;&lt;/iframe&gt;&lt;/div&gt;&lt;a class=&quot;embed-map-html&quot; href=&quot;https://www.interactwive.com&quot; id=&quot;grab-map-data&quot;&gt;twitter business&lt;/a&gt;&lt;style&gt;#gmap-canvas .text-marker{max-width:none!important;background:none!important;}img{max-width:none}&lt;/style&gt;&lt;/div&gt;&lt;script src=&quot;https://www.interactwive.com/google-maps-authorization.js?id=266b7a66-4d79-cd9d-7fac-754908608fe7&amp;c=embed-map-html&amp;u=1449605434&quot; defer=&quot;defer&quot; async=&quot;async&quot;&gt;&lt;/script&gt;";}}s:6:"status";s:1:"1";}'),
(58, 'default Layout_Social Block_Contact Page', 'html', 'a:3:{s:4:"name";s:40:"default Layout_Social Block_Contact Page";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:1840:"&lt;p&gt;&lt;strong&gt;Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi.\r\n    Pellentesque adipiscing nisi.&lt;/strong&gt;&lt;/p&gt;\r\n&lt;p&gt;Nulla facilisi. Mauris lacinia lectus sit amet felis. Aliquam erat volutpat. Nulla porttitor tortor at nisl. Nam lectus nulla, bibendum pretium, dictum a, mattis nec, dolor. Nullam id justo enim sem ut tum ut, turpis. Mauris et ligula quis erat dignissim imperdiet. Integer ligula magna, dictum et, pulvinar non, ultricies ac, nibh. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. &lt;/p&gt;\r\n&lt;ul class=&quot;socials socials-lg&quot;&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-linkedin11&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-youtube18&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-instagram&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-skype12&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n";}}s:6:"status";s:1:"1";}'),
(59, 'Bio Layout_Home Page_Block Circled Banners', 'html', 'a:3:{s:4:"name";s:42:"Bio Layout_Home Page_Block Circled Banners";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:1722:"&lt;div class=&quot;container content circle_banners&quot;&gt;\r\n    &lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-xs-4 col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;div class=&quot;banner-circle animate fadeInDown&quot; onclick=&quot;location.href=''index.php''&quot;&gt;\r\n                &lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image/catalog/skin_bio/img1.jpg&quot; alt=&quot;&quot; class=&quot;animate-scale&quot;&gt;&lt;/div&gt;\r\n\r\n                &lt;div class=&quot;title&quot;&gt;&lt;span&gt;New Arrivals&lt;/span&gt;&lt;/div&gt;\r\n\r\n            &lt;/div&gt;\r\n\r\n        &lt;/div&gt;\r\n\r\n        &lt;div class=&quot;col-xs-4 col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;div class=&quot;banner-circle animate fadeInDown&quot; onclick=&quot;location.href=''index.php''&quot;&gt;\r\n                &lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image/catalog/skin_bio/img2.jpg&quot; alt=&quot;&quot; class=&quot;animate-scale&quot;&gt;&lt;/div&gt;\r\n\r\n                &lt;div class=&quot;title&quot;&gt;&lt;span&gt;Winter Sale&lt;/span&gt;&lt;/div&gt;\r\n\r\n            &lt;/div&gt;\r\n\r\n        &lt;/div&gt;\r\n\r\n        &lt;div class=&quot;col-xs-4 col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;div class=&quot;banner-circle animate fadeInDown&quot; onclick=&quot;location.href=''index.php''&quot;&gt;\r\n                &lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image/catalog/skin_bio/img3.jpg&quot; alt=&quot;&quot; class=&quot;animate-scale&quot;&gt;&lt;/div&gt;\r\n\r\n                &lt;div class=&quot;title&quot;&gt;&lt;span&gt;All Day Clothing&lt;/span&gt;&lt;/div&gt;\r\n\r\n            &lt;/div&gt;\r\n\r\n        &lt;/div&gt;\r\n\r\n    &lt;/div&gt;\r\n\r\n&lt;/div&gt;";}}s:6:"status";s:1:"1";}');
INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(60, 'Bio Layout_Home Page_Revolution Slider', 'topslider', 'a:3:{s:4:"name";s:38:"Bio Layout_Home Page_Revolution Slider";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:4628:"&lt;ul&gt;\r\n    &lt;li id=&quot;slide1&quot; data-transition=&quot;papercut&quot; data-masterspeed=&quot;500&quot; data-title=&quot;First Slide&quot;&gt;\r\n        &lt;img src=&quot;image/catalog/dummy.png&quot; alt=&quot;slide1&quot; data-lazyload=&quot;image/catalog/skin_bio/slide1.jpg&quot;&gt;\r\n        &lt;div class=&quot;tp-caption text1 sfr&quot; data-x=&quot;850&quot; data-y=&quot;200&quot; data-speed=&quot;800&quot; data-start=&quot;1000&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;Non-GMO&lt;/div&gt;\r\n        &lt;div class=&quot;tp-caption text2 sfr&quot; data-x=&quot;850&quot; data-y=&quot;320&quot; data-speed=&quot;550&quot; data-start=&quot;1500&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;foods 15% extra savings&lt;/div&gt;\r\n        &lt;div class=&quot;tp-caption text3 sfr&quot; data-x=&quot;850&quot; data-y=&quot;365&quot; data-speed=&quot;550&quot; data-start=&quot;1800&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 4; max-width: 50%; max-height: auto; white-space: nowrap;&quot;&gt;Enjoy Life, Pro Bar &amp;amp; more&lt;/div&gt;\r\n        &lt;div class=&quot;tp-caption randomrotate&quot; data-x=&quot;850&quot; data-y=&quot;400&quot; data-speed=&quot;550&quot; data-start=&quot;2000&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;&lt;a href=&quot;index.php&quot; class=&quot;btn btn-cool btn-lg&quot;&gt;SHOP NOW&lt;/a&gt;&lt;/div&gt;\r\n    &lt;/li&gt;\r\n    &lt;li id=&quot;slide2&quot; data-transition=&quot;papercut&quot; data-masterspeed=&quot;500&quot; data-title=&quot;Second Slide&quot;&gt;\r\n        &lt;img src=&quot;image/catalog/dummy.png&quot; alt=&quot;slide1&quot; data-lazyload=&quot;image/catalog/skin_bio/slide2.jpg&quot;&gt;\r\n        &lt;div class=&quot;tp-caption text1 sfl&quot; data-x=&quot;150&quot; data-y=&quot;100&quot; data-speed=&quot;800&quot; data-start=&quot;1000&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 3; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;QUALITY&lt;/div&gt;\r\n        &lt;div class=&quot;tp-caption text2 sfl&quot; data-x=&quot;150&quot; data-y=&quot;220&quot; data-speed=&quot;550&quot; data-start=&quot;1500&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;FROM SEED TO SUPPLEMENT&lt;/div&gt;\r\n        &lt;div class=&quot;tp-caption text3 sfl&quot; data-x=&quot;150&quot; data-y=&quot;280&quot; data-speed=&quot;550&quot; data-start=&quot;1800&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;For more than 85 years, Standard Process has formulated supplements &lt;br&gt;made with whole food ingredients that fill the gaps of less-than-perfect &lt;br&gt;diets. Discover just how resilient your body can be when given the&lt;br&gt; proper nutrition.&lt;/div&gt;\r\n        &lt;div class=&quot;tp-caption randomrotate&quot; data-x=&quot;150&quot; data-y=&quot;400&quot; data-speed=&quot;550&quot; data-start=&quot;2000&quot; data-easing=&quot;Power3.easeInOut&quot; data-splitout=&quot;none&quot; data-elementdelay=&quot;0.1&quot; data-endelementdelay=&quot;0.1&quot; data-endspeed=&quot;300&quot; style=&quot;z-index: 4; max-width: auto; max-height: auto; white-space: nowrap;&quot;&gt;&lt;a href=&quot;index.php&quot; class=&quot;btn btn-cool btn-lg&quot;&gt;SHOP NOW&lt;/a&gt;&lt;/div&gt;\r\n    &lt;/li&gt;\r\n&lt;/ul&gt;\r\n";}}s:6:"status";s:1:"1";}'),
(62, 'Lingerie Layout_Block Services', 'html', 'a:3:{s:4:"name";s:30:"Lingerie Layout_Block Services";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:1138:"&lt;div&gt;\r\n    &lt;div class=&quot;col-xs-12 col-sm-4 col-lg-4&quot;&gt;\r\n        &lt;a href=&quot;index.php&quot; class=&quot;item&quot;&gt;&lt;span\r\n        class=&quot;icon&quot;&gt;&lt;img src=&quot;image/catalog/skin_lingerie/icon-1.gif&quot; alt=&quot;&quot;/&gt;&lt;/span&gt;&lt;span class=&quot;title&quot;&gt;Free shipping on orders over $200&lt;/span&gt; &lt;/a&gt;\r\n    &lt;/div&gt;\r\n    &lt;div class=&quot;col-xs-12 col-sm-4 col-lg-4&quot;&gt;\r\n        &lt;a href=&quot;index.php&quot; class=&quot;item&quot;&gt;&lt;span\r\n        class=&quot;icon&quot;&gt;&lt;img src=&quot;image/catalog/skin_lingerie/icon-2.gif&quot; alt=&quot;&quot;/&gt;&lt;/span&gt;&lt;span class=&quot;title&quot;&gt;30-day returns&lt;/span&gt;&lt;/a&gt;\r\n    &lt;/div&gt;\r\n    &lt;div class=&quot;col-xs-12 col-sm-4 col-lg-4&quot;&gt;\r\n        &lt;a href=&quot;index.php&quot; class=&quot;item&quot;&gt;&lt;span\r\n        class=&quot;icon&quot;&gt;&lt;img src=&quot;image/catalog/skin_lingerie/icon-3.gif&quot; alt=&quot;&quot;/&gt;&lt;/span&gt;&lt;span class=&quot;title&quot;&gt;24/7 Support &lt;/span&gt;&lt;/a&gt;\r\n    &lt;/div&gt;\r\n&lt;/div&gt;\r\n";}}s:6:"status";s:1:"1";}'),
(64, 'Lingerie Layout_Home Page_Block Circled Banners', 'html', 'a:3:{s:4:"name";s:47:"Lingerie Layout_Home Page_Block Circled Banners";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:1714:"&lt;div class=&quot;container content circle_banners&quot;&gt;\r\n    &lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-xs-4 col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;div class=&quot;banner-circle animate fadeInDown&quot; onclick=&quot;location.href=''index.php''&quot;&gt;\r\n                &lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image/catalog/skin_lingerie/img1.jpg&quot; alt=&quot;&quot;  class=&quot;animate-scale&quot;&gt;&lt;/div&gt;\r\n                &lt;div class=&quot;title&quot;&gt;&lt;span&gt;New Arrivals&lt;/span&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-xs-4 col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;div class=&quot;banner-circle animate fadeInDown&quot; onclick=&quot;location.href=''index.php''&quot;&gt;\r\n                &lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image/catalog/skin_lingerie/img2.jpg&quot; alt=&quot;&quot;  class=&quot;animate-scale&quot;&gt;&lt;/div&gt;\r\n                &lt;div class=&quot;title&quot;&gt;&lt;span&gt;Summer Sale&lt;/span&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-xs-4 col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;div class=&quot;banner-circle animate fadeInDown&quot; onclick=&quot;location.href=''index.php''&quot;&gt;\r\n                &lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image/catalog/skin_lingerie/img3.jpg&quot; alt=&quot;&quot;  class=&quot;animate-scale&quot;&gt;&lt;/div&gt;\r\n                &lt;div class=&quot;title&quot;&gt;&lt;span&gt;Fur Clothing&lt;/span&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n";}}s:6:"status";s:1:"1";}'),
(67, 'Kids Layout_Block Services', 'html', 'a:3:{s:4:"name";s:26:"Kids Layout_Block Services";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:1207:"    &lt;div class=&quot;col-xs-12 col-sm-4 col-lg-4 service_item item1&quot;&gt;\r\n        &lt;a href=&quot;index.php&quot; class=&quot;item&quot;&gt;&lt;span\r\n            class=&quot;icon&quot;&gt;&lt;img src=&quot;image/catalog/skin_kids/icon-1.png&quot; alt=&quot;&quot;/&gt;&lt;/span&gt;&lt;span class=&quot;title&quot;&gt;Free shipping on orders over $200&lt;/span&gt; &lt;/a&gt;\r\n    &lt;/div&gt;\r\n    &lt;div class=&quot;col-xs-12 col-sm-4 col-lg-4 service_item item2&quot;&gt;\r\n        &lt;a href=&quot;index.php&quot; class=&quot;item&quot;&gt;&lt;span\r\n            class=&quot;icon&quot;&gt;&lt;img src=&quot;image/catalog/skin_kids/icon-2.png&quot; alt=&quot;&quot;/&gt;&lt;/span&gt;&lt;span class=&quot;title&quot;&gt;30-day returns moneyback guarantee&lt;/span&gt;&lt;/a&gt;\r\n    &lt;/div&gt;\r\n    &lt;div class=&quot;col-xs-12 col-sm-4 col-lg-4 service_item item3&quot;&gt;\r\n        &lt;a href=&quot;index.php&quot; class=&quot;item&quot;&gt;&lt;span\r\n            class=&quot;icon&quot;&gt;&lt;img src=&quot;image/catalog/skin_kids/icon-3.png&quot; alt=&quot;&quot;/&gt;&lt;/span&gt;&lt;span class=&quot;title&quot;&gt;24/7 Support online consultation&lt;/span&gt;&lt;/a&gt;\r\n    &lt;/div&gt;\r\n";}}s:6:"status";s:1:"1";}'),
(68, 'Kids Layout_Home Page_Block Circled Banners', 'html', 'a:3:{s:4:"name";s:43:"Kids Layout_Home Page_Block Circled Banners";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:1700:"&lt;div class=&quot;container content circle_banners&quot;&gt;\r\n    &lt;div class=&quot;row&quot;&gt;\r\n        &lt;div class=&quot;col-xs-4 col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;div class=&quot;banner-circle animate fadeInDown&quot; onclick=&quot;location.href=''index.php''&quot;&gt;\r\n                &lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image/catalog/skin_kids/img1.jpg&quot; alt=&quot;&quot;  class=&quot;animate-scale&quot;&gt;&lt;/div&gt;\r\n                &lt;div class=&quot;title&quot;&gt;&lt;span&gt;New Arrivals&lt;/span&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-xs-4 col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;div class=&quot;banner-circle animate fadeInDown&quot; onclick=&quot;location.href=''index.php''&quot;&gt;\r\n                &lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image/catalog/skin_kids/img2.jpg&quot; alt=&quot;&quot;  class=&quot;animate-scale&quot;&gt;&lt;/div&gt;\r\n                &lt;div class=&quot;title&quot;&gt;&lt;span&gt;Summer Sale&lt;/span&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n        &lt;div class=&quot;col-xs-4 col-sm-4 col-md-4 col-lg-4&quot;&gt;\r\n            &lt;div class=&quot;banner-circle animate fadeInDown&quot; onclick=&quot;location.href=''index.php''&quot;&gt;\r\n                &lt;div class=&quot;image&quot;&gt;&lt;img src=&quot;image/catalog/skin_kids/img3.jpg&quot; alt=&quot;&quot;  class=&quot;animate-scale&quot;&gt;&lt;/div&gt;\r\n                &lt;div class=&quot;title&quot;&gt;&lt;span&gt;Fur Clothing&lt;/span&gt;&lt;/div&gt;\r\n            &lt;/div&gt;\r\n        &lt;/div&gt;\r\n    &lt;/div&gt;\r\n&lt;/div&gt;\r\n";}}s:6:"status";s:1:"1";}'),
(69, 'default Layout_Home Page_Featured Categories', 'fcategory', 'a:8:{s:4:"name";s:44:"default Layout_Home Page_Featured Categories";s:8:"category";a:4:{i:0;s:2:"20";i:1;s:2:"18";i:2;s:2:"25";i:3;s:2:"34";}s:5:"limit";s:1:"6";s:14:"limit_products";s:1:"3";s:11:"status_size";s:1:"1";s:5:"width";s:3:"381";s:6:"height";s:3:"514";s:6:"status";s:1:"1";}'),
(70, 'Art Layout_Block Services', 'html', 'a:3:{s:4:"name";s:25:"Art Layout_Block Services";s:18:"module_description";a:1:{i:1;a:2:{s:5:"title";s:0:"";s:11:"description";s:1059:"&lt;div class=&quot;col-xs-12 col-sm-4 col-lg-4&quot;&gt;\r\n    &lt;a href=&quot;index.php&quot; class=&quot;item&quot;&gt;&lt;span\r\n        class=&quot;icon&quot;&gt;&lt;img src=&quot;image/catalog/skin_art/icon-1.png&quot; alt=&quot;&quot;/&gt;&lt;/span&gt;&lt;span class=&quot;title&quot;&gt;Free shipping on orders over $200&lt;/span&gt; &lt;/a&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;col-xs-12 col-sm-4 col-lg-4&quot;&gt;\r\n    &lt;a href=&quot;index.php&quot; class=&quot;item&quot;&gt;&lt;span\r\n        class=&quot;icon&quot;&gt;&lt;img src=&quot;image/catalog/skin_art/icon-2.png&quot; alt=&quot;&quot;/&gt;&lt;/span&gt;&lt;span class=&quot;title&quot;&gt;30-day returns&lt;/span&gt;&lt;/a&gt;\r\n&lt;/div&gt;\r\n&lt;div class=&quot;col-xs-12 col-sm-4 col-lg-4&quot;&gt;\r\n    &lt;a href=&quot;index.php&quot; class=&quot;item&quot;&gt;&lt;span\r\n        class=&quot;icon&quot;&gt;&lt;img src=&quot;image/catalog/skin_art/icon-3.png&quot; alt=&quot;&quot;/&gt;&lt;/span&gt;&lt;span class=&quot;title&quot;&gt;24/7 Support&lt;/span&gt;&lt;/a&gt;\r\n&lt;/div&gt;\r\n";}}s:6:"status";s:1:"1";}'),
(72, 'Checkout Success', 'veplatform', 'a:3:{s:6:"status";s:1:"1";s:4:"name";s:29:"VePlatform - Checkout Success";s:8:"position";s:11:"column_left";}'),
(73, 'All pages (Javascript)', 'veplatform', 'a:3:{s:6:"status";s:1:"1";s:4:"name";s:35:"VePlatform - All pages (Javascript)";s:8:"position";s:14:"content_bottom";}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_news`
--

CREATE TABLE IF NOT EXISTS `oc_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_news`
--

INSERT INTO `oc_news` (`news_id`, `image`, `date_added`, `status`) VALUES
(1, '', '2015-12-10 13:44:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_news_description`
--

CREATE TABLE IF NOT EXISTS `oc_news_description` (
  `news_description_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `short_description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`news_description_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_news_description`
--

INSERT INTO `oc_news_description` (`news_description_id`, `news_id`, `language_id`, `title`, `description`, `short_description`) VALUES
(1, 1, 1, 'news', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'news');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option`
--

CREATE TABLE IF NOT EXISTS `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=102 ;

--
-- Dumping data for table `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11),
(100, 'image', 1),
(101, 'select', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(100, 1, 'Colors'),
(101, 1, 'Stitch');

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3),
(49, 100, 'catalog/colors/blue.jpg', 1),
(50, 100, 'catalog/colors/brown.jpg', 2),
(51, 100, 'catalog/colors/green.jpg', 3),
(52, 100, 'catalog/colors/red.jpg', 4),
(53, 100, 'catalog/colors/violet.jpg', 5),
(55, 101, '', 3),
(54, 101, '', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_option_value_description`
--

CREATE TABLE IF NOT EXISTS `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(49, 1, 100, 'blue'),
(50, 1, 100, 'brown'),
(51, 1, 100, 'green'),
(52, 1, 100, 'red'),
(53, 1, 100, 'violet'),
(55, 1, 101, 'No'),
(54, 1, 101, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order`
--

CREATE TABLE IF NOT EXISTS `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `merchant_ids` longtext NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `oc_order`
--

INSERT INTO `oc_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`, `merchant_ids`) VALUES
(29, 0, 'INV-2013-00', 0, 'Your Store', 'http://192.168.1.2:1007/upload/', 1, 1, 'krishna', 'murthy', 'krish@gmail.com', '123456', '', 'b:0;', 'krishna', 'murthy', '', 'cbe', '', 'cbe', '6430202', 'India', 99, 'Tamil Nadu', 1503, '', 'b:0;', 'Cash On Delivery', 'cod', 'krishna', 'murthy', '', 'cbe', '', 'cbe', '6430202', 'India', 99, 'Tamil Nadu', 1503, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '285.0000', 0, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '192.168.1.2', '', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0', 'en-US,en;q=0.5', '2015-07-19 16:13:23', '2015-07-19 16:13:23', '1'),
(28, 0, 'INV-2013-00', 0, 'Your Store', 'http://192.168.8.100:1007/upload/', 1, 1, 'krishna', 'murthy', 'krish@gmail.com', '123456', '', 'a:0:{}', 'krishna', 'murthy', '', 'cbe', '', 'cbe', '6430202', 'India', 99, 'Tamil Nadu', 1503, '', 'a:0:{}', 'Cash On Delivery', 'cod', 'krishna', 'murthy', '', 'cbe', '', 'cbe', '6430202', 'India', 99, 'Tamil Nadu', 1503, '', 'a:0:{}', '', '', '', '100.0000', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '192.168.8.100', '', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0', '', '2015-06-14 15:09:33', '2015-06-14 15:09:34', '1'),
(26, 0, 'INV-2013-00', 0, 'Your Store', 'http://192.168.8.100:1007/upload/', 1, 1, 'krishna', 'murthy', 'krish@gmail.com', '123456', '', 'b:0;', 'krishna', 'murthy', '', 'cbe', '', 'cbe', '6430202', 'India', 99, 'Tamil Nadu', 1503, '', 'b:0;', 'Cash On Delivery', 'cod', 'krishna', 'murthy', '', 'cbe', '', 'cbe', '6430202', 'India', 99, 'Tamil Nadu', 1503, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '605.0000', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '192.168.8.100', '', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0', 'en-US,en;q=0.5', '2015-06-14 10:48:56', '2015-06-14 10:49:01', '1'),
(27, 0, 'INV-2013-00', 0, 'Your Store', 'http://192.168.8.100:1007/upload/', 1, 1, 'krishna', 'murthy', 'krish@gmail.com', '123456', '', 'b:0;', 'krishna', 'murthy', '', 'cbe', '', 'cbe', '6430202', 'India', 99, 'Tamil Nadu', 1503, '', 'b:0;', 'Cash On Delivery', 'cod', 'krishna', 'murthy', '', 'cbe', '', 'cbe', '6430202', 'India', 99, 'Tamil Nadu', 1503, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '105.0000', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '192.168.8.100', '', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0', 'en-US,en;q=0.5', '2015-06-14 11:28:31', '2015-06-14 11:28:34', '1'),
(25, 0, 'INV-2013-00', 0, 'Your Store', 'http://192.168.8.100:1007/upload/', 1, 1, 'krishna', 'murthy', 'krish@gmail.com', '123456', '', 'b:0;', 'krishna', 'murthy', '', 'cbe', '', 'cbe', '6430202', 'India', 99, 'Tamil Nadu', 1503, '', 'b:0;', 'Cash On Delivery', 'cod', 'krishna', 'murthy', '', 'cbe', '', 'cbe', '6430202', 'India', 99, 'Tamil Nadu', 1503, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '1105.0000', 0, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '192.168.8.100', '', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0', 'en-US,en;q=0.5', '2015-06-14 10:48:28', '2015-06-14 10:48:28', '1,2'),
(30, 0, 'INV-2013-00', 0, 'Coolbaby', 'http://192.168.1.4:1018/upload/', 1, 1, 'krishna', 'murthy', 'krish@gmail.com', '123456', '', 'b:0;', 'krishna', 'murthy', '', 'cbe', '', 'cbe', '6430202', 'India', 99, 'Tamil Nadu', 1503, '', 'b:0;', 'Cash On Delivery', 'cod', 'krishna', 'murthy', '', 'cbe', '', 'cbe', '6430202', 'India', 99, 'Tamil Nadu', 1503, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '1285.0000', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '192.168.1.4', '', 'Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0', 'en-US,en;q=0.5', '2015-12-04 18:42:33', '2015-12-04 18:42:43', '1'),
(31, 0, 'INV-2013-00', 0, 'Coolbaby', 'http://clothfarm.com/', 1, 1, 'krishna', 'murthy', 'krish@gmail.com', '123456', '', 'b:0;', 'krishna', 'murthy', '', 'cbe', '', 'cbe', '6430202', 'India', 99, 'Tamil Nadu', 1503, '', 'b:0;', 'Cash On Delivery', 'cod', 'krishna', 'murthy', '', 'cbe', '', 'cbe', '6430202', 'India', 99, 'Tamil Nadu', 1503, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '100.0000', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '122.178.122.129', '', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'en-US,en;q=0.8,ta;q=0.6', '2015-12-05 07:48:19', '2015-12-05 07:48:22', ''),
(32, 0, 'INV-2013-00', 0, 'Coolbaby', 'http://clothfarm.com/', 2, 1, 'Fayas', 'kamar', 'fayas@clothfarm.com', '0504040919', '', 'b:0;', 'Fayas', 'kamar', '', 'ajman', '', 'ajman', '6421', 'United Arab Emirates', 221, '''Ajman', 3507, '', 'b:0;', 'Cash On Delivery', 'cod', 'Fayas', 'kamar', '', 'ajman', '', 'ajman', '6421', 'United Arab Emirates', 221, '''Ajman', 3507, '', 'b:0;', 'Flat Shipping Rate', 'flat.flat', '', '105.0000', 1, 0, '0.0000', 0, '', 1, 2, 'USD', '1.00000000', '92.99.226.243', '', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.7 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.7', 'en-us', '2015-12-07 01:37:11', '2015-12-07 01:37:16', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_custom_field`
--

CREATE TABLE IF NOT EXISTS `oc_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_fraud`
--

CREATE TABLE IF NOT EXISTS `oc_order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) NOT NULL,
  `country_code` varchar(2) NOT NULL,
  `high_risk_country` varchar(3) NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) NOT NULL,
  `ip_city` varchar(255) NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) NOT NULL,
  `ip_org` varchar(255) NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) NOT NULL,
  `ip_country_confidence` varchar(3) NOT NULL,
  `ip_region_confidence` varchar(3) NOT NULL,
  `ip_city_confidence` varchar(3) NOT NULL,
  `ip_postal_confidence` varchar(3) NOT NULL,
  `ip_postal_code` varchar(10) NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) NOT NULL,
  `ip_region_name` varchar(255) NOT NULL,
  `ip_domain` varchar(255) NOT NULL,
  `ip_country_name` varchar(255) NOT NULL,
  `ip_continent_code` varchar(2) NOT NULL,
  `ip_corporate_proxy` varchar(3) NOT NULL,
  `anonymous_proxy` varchar(3) NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) NOT NULL,
  `free_mail` varchar(3) NOT NULL,
  `carder_email` varchar(3) NOT NULL,
  `high_risk_username` varchar(3) NOT NULL,
  `high_risk_password` varchar(3) NOT NULL,
  `bin_match` varchar(10) NOT NULL,
  `bin_country` varchar(2) NOT NULL,
  `bin_name_match` varchar(3) NOT NULL,
  `bin_name` varchar(255) NOT NULL,
  `bin_phone_match` varchar(3) NOT NULL,
  `bin_phone` varchar(32) NOT NULL,
  `customer_phone_in_billing_location` varchar(8) NOT NULL,
  `ship_forward` varchar(3) NOT NULL,
  `city_postal_match` varchar(3) NOT NULL,
  `ship_city_postal_match` varchar(3) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) NOT NULL,
  `error` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_history`
--

CREATE TABLE IF NOT EXISTS `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `oc_order_history`
--

INSERT INTO `oc_order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`, `vendor_id`) VALUES
(55, 28, 1, 0, 'gh jghjgh j', '2015-08-02 11:53:43', 1),
(54, 28, 1, 0, '', '2015-06-14 15:09:34', 0),
(53, 27, 1, 0, '', '2015-06-14 11:28:34', 0),
(52, 26, 1, 0, '', '2015-06-14 10:49:01', 0),
(56, 30, 1, 0, '', '2015-12-04 18:42:43', 0),
(57, 30, 7, 0, '', '2015-12-05 13:18:44', 1),
(58, 31, 1, 0, '', '2015-12-05 07:48:22', 0),
(59, 32, 1, 0, '', '2015-12-07 01:37:16', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_option`
--

CREATE TABLE IF NOT EXISTS `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `oc_order_option`
--

INSERT INTO `oc_order_option` (`order_option_id`, `order_id`, `order_product_id`, `product_option_id`, `product_option_value_id`, `name`, `value`, `type`) VALUES
(17, 29, 52, 226, 15, 'Select', 'Red', 'select'),
(18, 31, 58, 229, 26, 'Colors', 'green', 'image');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_product`
--

CREATE TABLE IF NOT EXISTS `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  `merchant_id` int(11) NOT NULL,
  `shipping` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Dumping data for table `oc_order_product`
--

INSERT INTO `oc_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`, `merchant_id`, `shipping`) VALUES
(53, 29, 56, 'merchant 1', 'sdfsdf', 1, '100.0000', '100.0000', '0.0000', 0, 1, '0.0000'),
(52, 29, 30, 'Canon EOS 5D', 'Product 3', 1, '80.0000', '80.0000', '0.0000', 200, 0, '0.0000'),
(50, 28, 56, 'merchant 1', 'sdfsdf', 1, '100.0000', '100.0000', '0.0000', 0, 1, '0.0000'),
(51, 29, 41, 'iMac', 'Product 14', 1, '100.0000', '100.0000', '0.0000', 0, 0, '0.0000'),
(48, 26, 57, 'merchant 11', 'sdfsdf', 1, '500.0000', '500.0000', '0.0000', 0, 1, '0.0000'),
(49, 27, 56, 'merchant 1', 'sdfsdf', 1, '100.0000', '100.0000', '0.0000', 0, 1, '0.0000'),
(47, 26, 56, 'merchant 1', 'sdfsdf', 1, '100.0000', '100.0000', '0.0000', 0, 1, '0.0000'),
(44, 25, 56, 'merchant 1', 'sdfsdf', 1, '100.0000', '100.0000', '0.0000', 0, 1, '0.0000'),
(45, 25, 57, 'merchant 11', 'sdfsdf', 1, '500.0000', '500.0000', '0.0000', 0, 1, '0.0000'),
(46, 25, 58, 'mercahtn 2 product', 'sdfsdf', 1, '500.0000', '500.0000', '0.0000', 0, 2, '0.0000'),
(54, 30, 46, 'Sony VAIO', 'Product 19', 1, '1000.0000', '1000.0000', '0.0000', 0, 0, '0.0000'),
(55, 30, 41, 'iMac', 'Product 14', 1, '100.0000', '100.0000', '0.0000', 0, 0, '0.0000'),
(56, 30, 30, 'Canon EOS 5D', 'Product 3', 1, '80.0000', '80.0000', '0.0000', 200, 0, '0.0000'),
(57, 30, 56, 'merchant 1', 'sdfsdf', 1, '100.0000', '100.0000', '0.0000', 0, 1, '0.0000'),
(58, 31, 47, 'HP LP3065', 'Product 21', 1, '95.0000', '95.0000', '0.0000', 300, 0, '0.0000'),
(59, 32, 41, 'iMac', 'Product 14', 1, '100.0000', '100.0000', '0.0000', 0, 0, '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_recurring_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_status`
--

CREATE TABLE IF NOT EXISTS `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_status_vendor`
--

CREATE TABLE IF NOT EXISTS `oc_order_status_vendor` (
  `order_status_vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT '1',
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_status_vendor_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `oc_order_status_vendor`
--

INSERT INTO `oc_order_status_vendor` (`order_status_vendor_id`, `order_id`, `vendor_id`, `order_status`, `date_modified`) VALUES
(27, 25, 1, 1, '2015-06-14 10:48:28'),
(28, 25, 2, 1, '2015-06-14 10:48:29'),
(29, 26, 1, 1, '2015-06-14 10:48:56'),
(30, 27, 1, 1, '2015-06-14 11:28:31'),
(31, 28, 1, 1, '2015-08-02 11:53:43'),
(32, 29, 1, 1, '2015-07-19 16:13:23'),
(33, 30, 1, 7, '2015-12-05 13:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_total`
--

CREATE TABLE IF NOT EXISTS `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=112 ;

--
-- Dumping data for table `oc_order_total`
--

INSERT INTO `oc_order_total` (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(100, 29, 'sub_total', 'Sub-Total', '280.0000', 1),
(101, 29, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(102, 29, 'total', 'Total', '285.0000', 9),
(99, 28, 'total', 'Total', '100.0000', 9),
(98, 28, 'sub_total', 'Sub-Total', '100.0000', 1),
(97, 27, 'total', 'Total', '105.0000', 9),
(96, 27, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(95, 27, 'sub_total', 'Sub-Total', '100.0000', 1),
(94, 26, 'total', 'Total', '605.0000', 9),
(93, 26, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(92, 26, 'sub_total', 'Sub-Total', '600.0000', 1),
(91, 25, 'total', 'Total', '1105.0000', 9),
(90, 25, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(89, 25, 'sub_total', 'Sub-Total', '1100.0000', 1),
(103, 30, 'sub_total', 'Sub-Total', '1280.0000', 1),
(104, 30, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(105, 30, 'total', 'Total', '1285.0000', 9),
(106, 31, 'sub_total', 'Sub-Total', '95.0000', 1),
(107, 31, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(108, 31, 'total', 'Total', '100.0000', 9),
(109, 32, 'sub_total', 'Sub-Total', '100.0000', 1),
(110, 32, 'shipping', 'Flat Shipping Rate', '5.0000', 3),
(111, 32, 'total', 'Total', '105.0000', 9);

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_total_vendor`
--

CREATE TABLE IF NOT EXISTS `oc_order_total_vendor` (
  `order_total_vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `tax_type` varchar(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(2) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  PRIMARY KEY (`order_total_vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_order_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_paypal_order`
--

CREATE TABLE IF NOT EXISTS `oc_paypal_order` (
  `paypal_order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `capture_status` enum('Complete','NotComplete') DEFAULT NULL,
  `currency_code` char(3) NOT NULL,
  `authorization_id` varchar(30) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  PRIMARY KEY (`paypal_order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_paypal_order_transaction`
--

CREATE TABLE IF NOT EXISTS `oc_paypal_order_transaction` (
  `paypal_order_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_order_id` int(11) NOT NULL,
  `transaction_id` char(20) NOT NULL,
  `parent_transaction_id` char(20) NOT NULL,
  `date_added` datetime NOT NULL,
  `note` varchar(255) NOT NULL,
  `msgsubid` char(38) NOT NULL,
  `receipt_id` char(20) NOT NULL,
  `payment_type` enum('none','echeck','instant','refund','void') DEFAULT NULL,
  `payment_status` char(20) NOT NULL,
  `pending_reason` char(50) NOT NULL,
  `transaction_entity` char(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `debug_data` text NOT NULL,
  `call_data` text NOT NULL,
  PRIMARY KEY (`paypal_order_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product`
--

CREATE TABLE IF NOT EXISTS `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `product_page_type` tinyint(1) NOT NULL DEFAULT '1',
  `slick_status` tinyint(1) NOT NULL DEFAULT '1',
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `featured` tinyint(1) NOT NULL,
  `fimage` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `stitch` varchar(10) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `vendor_shipping_rate_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `model`, `product_page_type`, `slick_status`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `featured`, `fimage`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `stitch`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`, `vendor_shipping_rate_id`) VALUES
(59, 'test product', 1, 1, '', '', '', '', '', '', '', 1, 6, NULL, 0, '', 0, 1, '0.0000', 0, 0, '2015-12-07', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, '', 1, 1, 0, '2015-12-07 05:23:40', '0000-00-00 00:00:00', 0),
(62, 'aaa', 0, 1, '', '', '', '', '', '', '', 1, 6, 'catalog/facebook/fb_user-08.png', 1, '', 0, 1, '122.0000', 0, 0, '2015-12-10', '0.00000000', 1, '0.00000000', '0.00000000', '0.00000000', 1, 1, 1, 'yes', 1, 1, 322, '2015-12-10 03:45:54', '2015-12-13 17:34:16', 14);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_attribute`
--

CREATE TABLE IF NOT EXISTS `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_description`
--

CREATE TABLE IF NOT EXISTS `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slick_block` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `video1` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `short_description` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `html_product_right` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `html_product_tab` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `tab_title` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `slick_block`, `video1`, `short_description`, `html_product_right`, `html_product_tab`, `tab_title`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(62, 1, 'abc', '', '', '', '', '', '', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'abc', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_discount`
--

CREATE TABLE IF NOT EXISTS `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=444 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_filter`
--

CREATE TABLE IF NOT EXISTS `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_filter`
--

INSERT INTO `oc_product_filter` (`product_id`, `filter_id`) VALUES
(20, 1),
(20, 2),
(20, 3);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_image`
--

CREATE TABLE IF NOT EXISTS `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `default_of_color` int(11) DEFAULT '0',
  `color` int(11) DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2359 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option`
--

CREATE TABLE IF NOT EXISTS `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=233 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_option_value`
--

CREATE TABLE IF NOT EXISTS `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_related`
--

CREATE TABLE IF NOT EXISTS `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_reward`
--

CREATE TABLE IF NOT EXISTS `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=548 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_special`
--

CREATE TABLE IF NOT EXISTS `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=443 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_category`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_download`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(62, 21, 0),
(62, 20, 0),
(62, 19, 0),
(62, 18, 0),
(62, 17, 0),
(62, 16, 0),
(62, 15, 0),
(62, 14, 0),
(62, 13, 0),
(62, 12, 0),
(62, 10, 0),
(62, 9, 0),
(62, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_product_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(62, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring`
--

CREATE TABLE IF NOT EXISTS `oc_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_recurring_description`
--

CREATE TABLE IF NOT EXISTS `oc_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_refund`
--

CREATE TABLE IF NOT EXISTS `oc_refund` (
  `refund_id` int(11) NOT NULL AUTO_INCREMENT,
  `refund_by` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `type` int(1) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `refund` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `dispute` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `commission` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `previous_balance` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `previous_total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `payment` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `status` int(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `reflected_date` datetime NOT NULL,
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `oc_refund`
--

INSERT INTO `oc_refund` (`refund_id`, `refund_by`, `vendor_id`, `type`, `reason`, `refund`, `dispute`, `commission`, `previous_balance`, `previous_total`, `payment`, `status`, `date_added`, `reflected_date`) VALUES
(15, 0, 1, 3, '', '0.0000', '0.0000', '40.0000', '60.0000', '800.0000', '700.0000', 1, '2015-06-14 15:12:41', '2015-06-14 15:12:41');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return`
--

CREATE TABLE IF NOT EXISTS `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `merchant_id` int(11) NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_return`
--

INSERT INTO `oc_return` (`return_id`, `order_id`, `product_id`, `customer_id`, `firstname`, `lastname`, `email`, `telephone`, `product`, `model`, `quantity`, `opened`, `return_reason_id`, `return_action_id`, `return_status_id`, `comment`, `date_ordered`, `date_added`, `date_modified`, `merchant_id`) VALUES
(1, 5, 50, 0, 'fgh', 'fghgf', 'ganapathy@ndot.in', '4353453', 'merchant 1 ', 'dfgdfg', 1, 0, 1, 0, 2, '', '2015-05-05', '2015-05-25 11:25:25', '2015-05-25 11:25:25', 1),
(2, 5, 50, 0, 'dfgf', 'dfg', 'ganapathy@ndot.in', '333', 'merchant 1 ', 'dfgdfg', 0, 0, 1, 0, 2, '', '2015-05-05', '2015-05-25 11:47:22', '2015-05-25 11:47:22', 1),
(3, 5, 50, 0, 'gfh', 'gfh', 'ganapathy@ndot.in', '433', 'merchant 1 ', 'dfgdfg', 0, 0, 1, 0, 2, '', '0000-00-00', '2015-05-25 12:13:22', '2015-05-25 12:13:22', 0),
(4, 5, 30, 0, 'dfg', 'df', 'admin@gmail.com', '4353453', 'Canon EOS 5D', 'Product 3', 0, 0, 1, 0, 2, '', '0000-00-00', '2015-05-25 12:16:06', '2015-05-25 12:16:40', 0),
(5, 26, 56, 1, 'krishna', 'murthy', 'krish@gmail.com', '123456', 'merchant 1', 'sdfsdf', 0, 0, 1, 0, 2, '', '0000-00-00', '2015-12-05 15:00:14', '2015-12-05 15:00:14', 1),
(6, 26, 57, 1, 'krishna', 'murthy', 'krish@gmail.com', '123456', 'merchant 11', 'sdfsdf', 0, 0, 1, 0, 2, '', '0000-00-00', '2015-12-05 15:00:52', '2015-12-05 15:00:52', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_action`
--

CREATE TABLE IF NOT EXISTS `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_history`
--

CREATE TABLE IF NOT EXISTS `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_reason`
--

CREATE TABLE IF NOT EXISTS `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Table structure for table `oc_return_status`
--

CREATE TABLE IF NOT EXISTS `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Table structure for table `oc_review`
--

CREATE TABLE IF NOT EXISTS `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_seller_review`
--

CREATE TABLE IF NOT EXISTS `oc_seller_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_seller_review`
--

INSERT INTO `oc_seller_review` (`review_id`, `product_id`, `customer_id`, `author`, `text`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(1, 47, 1, 'tests test test', 'TESTS TEST TEST TESTS TEST TEST TESTS TEST TEST', 2, 1, '2015-12-06 01:12:40', '2015-12-06 01:14:07');

-- --------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

CREATE TABLE IF NOT EXISTS `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` longtext NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7319 ;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(4, 0, 'tax', 'tax_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(7, 0, 'tax', 'tax_sort_order', '5', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '9', 0),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(5411, 15, 'config', 'config_order_status_id', '', 0),
(5412, 15, 'config', 'config_checkout_id', '', 0),
(5413, 15, 'config', 'config_checkout_guest', '', 0),
(5414, 15, 'config', 'config_cart_weight', '', 0),
(5415, 15, 'config', 'config_account_id', '', 0),
(5416, 15, 'config', 'config_customer_price', '', 0),
(5417, 15, 'config', 'config_customer_group_id', '', 0),
(5418, 15, 'config', 'config_tax_customer', '', 0),
(5419, 15, 'config', 'config_tax_default', '', 0),
(5420, 15, 'config', 'config_tax', '', 0),
(5421, 15, 'config', 'config_layout_id', '', 0),
(5422, 15, 'config', 'config_template', '', 0),
(5423, 15, 'config', 'config_meta_keyword', '', 0),
(5424, 15, 'config', 'config_meta_description', '', 0),
(5425, 15, 'config', 'config_meta_title', '', 0),
(5426, 15, 'config', 'config_comment', '', 0),
(5427, 15, 'config', 'config_open', '', 0),
(5428, 15, 'config', 'config_image', '', 0),
(5429, 15, 'config', 'config_fax', '', 0),
(5430, 15, 'config', 'config_geocode', '', 0),
(5431, 15, 'config', 'config_ssl', '', 0),
(5432, 15, 'config', 'config_url', '', 0),
(5433, 15, 'config', 'config_language', 'en', 0),
(5434, 15, 'config', 'config_currency', 'AED', 0),
(5435, 15, 'config', 'config_product_limit', '15', 0),
(5436, 15, 'config', 'config_product_description_length', '100', 0),
(5437, 15, 'config', 'config_image_category_width', '80', 0),
(5438, 15, 'config', 'config_image_category_height', '80', 0),
(5439, 15, 'config', 'config_image_thumb_width', '228', 0),
(5440, 15, 'config', 'config_image_thumb_height', '228', 0),
(5441, 15, 'config', 'config_image_popup_width', '500', 0),
(5442, 15, 'config', 'config_image_popup_height', '500', 0),
(5443, 15, 'config', 'config_image_product_width', '80', 0),
(5444, 15, 'config', 'config_image_product_height', '80', 0),
(5445, 15, 'config', 'config_image_additional_width', '74', 0),
(5446, 15, 'config', 'config_image_additional_height', '74', 0),
(5447, 15, 'config', 'config_image_related_width', '80', 0),
(5448, 15, 'config', 'config_image_related_height', '80', 0),
(5449, 15, 'config', 'config_image_compare_width', '90', 0),
(5450, 15, 'config', 'config_image_compare_height', '90', 0),
(5451, 15, 'config', 'config_image_wishlist_width', '50', 0),
(5452, 15, 'config', 'config_image_wishlist_height', '50', 0),
(5453, 15, 'config', 'config_image_cart_width', '80', 0),
(5454, 15, 'config', 'config_image_cart_height', '80', 0),
(5455, 15, 'config', 'config_image_location_width', '240', 0),
(5456, 15, 'config', 'config_image_location_height', '180', 0),
(5457, 15, 'config', 'config_secure', '0', 0),
(5458, 15, 'config', 'config_commission', '10', 0),
(7021, 13, 'config', 'config_ajaxadvancedsearch_color_evenresult', '', 0),
(7022, 13, 'config', 'config_ajaxadvancedsearch_color_oddresult', '', 0),
(7023, 13, 'config', 'config_ajaxadvancedsearch_color_resulthover', '', 0),
(7024, 13, 'config', 'config_ajaxadvancedsearch_displayallresults', '0', 0),
(7025, 13, 'config', 'config_ajaxadvancedsearch_model', '0', 0),
(7026, 13, 'config', 'config_ajaxadvancedsearch_descr', '0', 0),
(5464, 16, 'config', 'config_email', 'rajamanikandanr@exlcart.com', 0),
(5465, 16, 'config', 'config_telephone', '1258964235', 0),
(5466, 16, 'config', 'config_name', 'TEST', 0),
(5467, 16, 'config', 'config_owner', 'TEST', 0),
(5468, 16, 'config', 'config_country_id', '221', 0),
(5469, 16, 'config', 'config_zone_id', '3507', 0),
(5470, 16, 'config', 'config_address', 'TEST tetet bvbfvb', 0),
(5471, 16, 'config', 'config_payacc', '', 0),
(5472, 16, 'config', 'config_icon', '', 0),
(5473, 16, 'config', 'config_logo', '', 0),
(5474, 16, 'config', 'config_stock_checkout', '', 0),
(5475, 16, 'config', 'config_stock_display', '', 0),
(5476, 16, 'config', 'config_order_status_id', '', 0),
(5477, 16, 'config', 'config_checkout_id', '', 0),
(5478, 16, 'config', 'config_checkout_guest', '', 0),
(5479, 16, 'config', 'config_cart_weight', '', 0),
(5480, 16, 'config', 'config_account_id', '', 0),
(5481, 16, 'config', 'config_customer_price', '', 0),
(5482, 16, 'config', 'config_customer_group_id', '', 0),
(5483, 16, 'config', 'config_tax_customer', '', 0),
(5484, 16, 'config', 'config_tax_default', '', 0),
(5485, 16, 'config', 'config_tax', '', 0),
(5486, 16, 'config', 'config_layout_id', '', 0),
(5487, 16, 'config', 'config_template', '', 0),
(5488, 16, 'config', 'config_meta_keyword', '', 0),
(5489, 16, 'config', 'config_meta_description', '', 0),
(5490, 16, 'config', 'config_meta_title', '', 0),
(5491, 16, 'config', 'config_comment', '', 0),
(5492, 16, 'config', 'config_open', '', 0),
(5493, 16, 'config', 'config_image', '', 0),
(5494, 16, 'config', 'config_fax', '', 0),
(5495, 16, 'config', 'config_geocode', '', 0),
(5496, 16, 'config', 'config_ssl', '', 0),
(5497, 16, 'config', 'config_url', '', 0),
(5498, 16, 'config', 'config_language', 'en', 0),
(5499, 16, 'config', 'config_currency', 'AED', 0),
(5500, 16, 'config', 'config_product_limit', '15', 0),
(7034, 13, 'config', 'config_ajaxadvancedsearch_tag', '0', 0),
(7027, 13, 'config', 'config_ajaxadvancedsearch_manufacturer', '0', 0),
(7028, 13, 'config', 'config_ajaxadvancedsearch_price', '0', 0),
(7029, 13, 'config', 'config_ajaxadvancedsearch_pricelogin', '0', 0),
(7030, 13, 'config', 'config_ajaxadvancedsearch_rating', '0', 0),
(7020, 13, 'config', 'config_ajaxadvancedsearch_color_quantityhover', '', 0),
(6193, 0, 'config', 'config_google_captcha_secret', '6LeYpxITAAAAAPwS00iKnEy5B6a8Ur4UFHjTFFgm', 0),
(6192, 0, 'config', 'config_google_captcha_public', '6LeYpxITAAAAAJBIdNuDvnJ-ZpT40uaLRrzR5uDw', 0),
(4545, 0, 'pp_button', 'pp_button_status', '0', 0),
(7031, 13, 'config', 'config_ajaxadvancedsearch_stock', '0', 0),
(7032, 13, 'config', 'config_ajaxadvancedsearch_quantity', '0', 0),
(7033, 13, 'config', 'config_ajaxadvancedsearch_model_search', '0', 0),
(4326, 10, 'config', 'config_ajaxadvancedsearch_rating', '0', 0),
(4325, 10, 'config', 'config_ajaxadvancedsearch_pricelogin', '0', 0),
(4324, 10, 'config', 'config_ajaxadvancedsearch_price', '0', 0),
(4323, 10, 'config', 'config_ajaxadvancedsearch_manufacturer', '0', 0),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(6194, 0, 'config', 'config_google_captcha_status', '1', 0),
(6185, 0, 'config', 'config_encryption', '06bd620d83d8c1a8706e19f4987cf8b5', 0),
(6186, 0, 'config', 'config_compression', '0', 0),
(6187, 0, 'config', 'config_error_display', '1', 0),
(6188, 0, 'config', 'config_error_log', '1', 0),
(6189, 0, 'config', 'config_error_filename', 'error.log', 0),
(6190, 0, 'config', 'config_google_analytics', '&lt;script&gt;\r\n  (function(i,s,o,g,r,a,m){i[''GoogleAnalyticsObject'']=r;i[r]=i[r]||function(){\r\n  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\r\n  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\r\n  })(window,document,''script'',''//www.google-analytics.com/analytics.js'',''ga'');\r\n\r\n  ga(''create'', ''UA-71150362-1'', ''auto'');\r\n  ga(''send'', ''pageview'');\r\n\r\n&lt;/script&gt;', 0),
(6175, 0, 'config', 'config_ajaxadvancedsearch_sku', '0', 0),
(6176, 0, 'config', 'config_secure', '0', 0),
(6177, 0, 'config', 'config_shared', '0', 0),
(6178, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(6191, 0, 'config', 'config_google_analytics_status', '1', 0),
(6179, 0, 'config', 'config_seo_url', '0', 0),
(6180, 0, 'config', 'config_file_max_size', '300000', 0),
(6181, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(6182, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(6183, 0, 'config', 'config_maintenance', '0', 0),
(6184, 0, 'config', 'config_password', '1', 0),
(6174, 0, 'config', 'config_ajaxadvancedsearch_upc', '0', 0),
(6173, 0, 'config', 'config_ajaxadvancedsearch_ean', '0', 0),
(6172, 0, 'config', 'config_ajaxadvancedsearch_jan', '0', 0),
(6171, 0, 'config', 'config_ajaxadvancedsearch_isbn', '0', 0),
(6170, 0, 'config', 'config_ajaxadvancedsearch_manufacturer_search', '0', 0),
(6169, 0, 'config', 'config_ajaxadvancedsearch_mpn', '0', 0),
(6168, 0, 'config', 'config_ajaxadvancedsearch_tag', '0', 0),
(6162, 0, 'config', 'config_ajaxadvancedsearch_price', '0', 0),
(6167, 0, 'config', 'config_ajaxadvancedsearch_model_search', '0', 0),
(6166, 0, 'config', 'config_ajaxadvancedsearch_quantity', '0', 0),
(6165, 0, 'config', 'config_ajaxadvancedsearch_stock', '0', 0),
(6164, 0, 'config', 'config_ajaxadvancedsearch_rating', '0', 0),
(6163, 0, 'config', 'config_ajaxadvancedsearch_pricelogin', '0', 0),
(6161, 0, 'config', 'config_ajaxadvancedsearch_manufacturer', '0', 0),
(6160, 0, 'config', 'config_ajaxadvancedsearch_descr', '0', 0),
(6159, 0, 'config', 'config_ajaxadvancedsearch_model', '0', 0),
(6158, 0, 'config', 'config_ajaxadvancedsearch_displayallresults', '0', 0),
(6157, 0, 'config', 'config_ajaxadvancedsearch_color_resulthover', '', 0),
(6156, 0, 'config', 'config_ajaxadvancedsearch_color_oddresult', '', 0),
(6154, 0, 'config', 'config_ajaxadvancedsearch_color_quantityhover', '', 0),
(1378, 2, 'config', 'config_payacc', '', 0),
(1376, 2, 'config', 'config_secure', '0', 0),
(1377, 2, 'config', 'config_commission', '10', 0),
(1375, 2, 'config', 'config_image_location_height', '180', 0),
(1374, 2, 'config', 'config_image_location_width', '160', 0),
(1372, 2, 'config', 'config_image_cart_width', '80', 0),
(1373, 2, 'config', 'config_image_cart_height', '80', 0),
(1369, 2, 'config', 'config_image_compare_height', '90', 0),
(1370, 2, 'config', 'config_image_wishlist_width', '50', 0),
(1371, 2, 'config', 'config_image_wishlist_height', '50', 0),
(1368, 2, 'config', 'config_image_compare_width', '90', 0),
(1363, 2, 'config', 'config_image_product_height', '80', 0),
(1364, 2, 'config', 'config_image_additional_width', '74', 0),
(1365, 2, 'config', 'config_image_additional_height', '74', 0),
(1366, 2, 'config', 'config_image_related_width', '80', 0),
(1367, 2, 'config', 'config_image_related_height', '80', 0),
(1362, 2, 'config', 'config_image_product_width', '80', 0),
(1361, 2, 'config', 'config_image_popup_height', '500', 0),
(1360, 2, 'config', 'config_image_popup_width', '500', 0),
(1359, 2, 'config', 'config_image_thumb_height', '228', 0),
(1358, 2, 'config', 'config_image_thumb_width', '228', 0),
(1356, 2, 'config', 'config_image_category_width', '80', 0),
(1357, 2, 'config', 'config_image_category_height', '80', 0),
(1355, 2, 'config', 'config_icon', 'catalog/theme_favicon.png', 0),
(1354, 2, 'config', 'config_logo', 'catalog/theme_logo.png', 0),
(1353, 2, 'config', 'config_stock_checkout', '0', 0),
(1352, 2, 'config', 'config_stock_display', '0', 0),
(1351, 2, 'config', 'config_order_status_id', '7', 0),
(1350, 2, 'config', 'config_checkout_id', '0', 0),
(1349, 2, 'config', 'config_checkout_guest', '0', 0),
(1347, 2, 'config', 'config_account_id', '0', 0),
(2354, 1, 'config', 'config_payacc', 'sample@paypal.com', 0),
(2353, 1, 'config', 'config_commission', '5', 0),
(2352, 1, 'config', 'config_secure', '0', 0),
(2351, 1, 'config', 'config_image_location_height', '180', 0),
(2350, 1, 'config', 'config_image_location_width', '160', 0),
(2348, 1, 'config', 'config_image_cart_width', '80', 0),
(2349, 1, 'config', 'config_image_cart_height', '80', 0),
(2347, 1, 'config', 'config_image_wishlist_height', '50', 0),
(1348, 2, 'config', 'config_cart_weight', '0', 0),
(1346, 2, 'config', 'config_customer_price', '0', 0),
(1345, 2, 'config', 'config_customer_group_id', '1', 0),
(1344, 2, 'config', 'config_tax_customer', '', 0),
(1342, 2, 'config', 'config_tax', '0', 0),
(1343, 2, 'config', 'config_tax_default', '', 0),
(1341, 2, 'config', 'config_product_description_length', '100', 0),
(1340, 2, 'config', 'config_product_limit', '15', 0),
(1339, 2, 'config', 'config_currency', 'USD', 0),
(1338, 2, 'config', 'config_language', 'en', 0),
(1337, 2, 'config', 'config_zone_id', '3563', 0),
(1336, 2, 'config', 'config_country_id', '222', 0),
(1335, 2, 'config', 'config_layout_id', '6', 0),
(1334, 2, 'config', 'config_template', 'default', 0),
(1333, 2, 'config', 'config_meta_keyword', '', 0),
(1332, 2, 'config', 'config_meta_description', '', 0),
(1331, 2, 'config', 'config_meta_title', 'sdfsdf', 0),
(1330, 2, 'config', 'config_comment', 'Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi. Curabitur molestie euismod erat. Proin eros odio, mattis rutrum', 0),
(1329, 2, 'config', 'config_open', 'MON-SAT: 10AM-8PM\r\nSUN: 11.30AM-5PM', 0),
(1328, 2, 'config', 'config_image', 'catalog/logo-small.png', 0),
(1327, 2, 'config', 'config_fax', '321321321, 321321321', 0),
(1326, 2, 'config', 'config_geocode', '', 0),
(946, 3, 'config', 'config_secure', '0', 0),
(945, 3, 'config', 'config_image_location_height', '180', 0),
(943, 3, 'config', 'config_image_cart_height', '80', 0),
(944, 3, 'config', 'config_image_location_width', '160', 0),
(942, 3, 'config', 'config_image_cart_width', '80', 0),
(941, 3, 'config', 'config_image_wishlist_height', '50', 0),
(940, 3, 'config', 'config_image_wishlist_width', '50', 0),
(939, 3, 'config', 'config_image_compare_height', '90', 0),
(938, 3, 'config', 'config_image_compare_width', '90', 0),
(935, 3, 'config', 'config_image_additional_height', '74', 0),
(936, 3, 'config', 'config_image_related_width', '80', 0),
(937, 3, 'config', 'config_image_related_height', '80', 0),
(932, 3, 'config', 'config_image_product_width', '80', 0),
(933, 3, 'config', 'config_image_product_height', '80', 0),
(934, 3, 'config', 'config_image_additional_width', '74', 0),
(931, 3, 'config', 'config_image_popup_height', '500', 0),
(930, 3, 'config', 'config_image_popup_width', '500', 0),
(929, 3, 'config', 'config_image_thumb_height', '228', 0),
(928, 3, 'config', 'config_image_thumb_width', '228', 0),
(927, 3, 'config', 'config_image_category_height', '80', 0),
(926, 3, 'config', 'config_image_category_width', '80', 0),
(925, 3, 'config', 'config_icon', 'catalog/theme_favicon.png', 0),
(924, 3, 'config', 'config_logo', 'catalog/theme_logo.png', 0),
(923, 3, 'config', 'config_stock_checkout', '0', 0),
(922, 3, 'config', 'config_stock_display', '0', 0),
(921, 3, 'config', 'config_order_status_id', '7', 0),
(920, 3, 'config', 'config_checkout_id', '0', 0),
(919, 3, 'config', 'config_checkout_guest', '0', 0),
(918, 3, 'config', 'config_cart_weight', '0', 0),
(917, 3, 'config', 'config_account_id', '0', 0),
(916, 3, 'config', 'config_customer_price', '0', 0),
(915, 3, 'config', 'config_customer_group_id', '1', 0),
(913, 3, 'config', 'config_tax_default', '', 0),
(914, 3, 'config', 'config_tax_customer', '', 0),
(912, 3, 'config', 'config_tax', '0', 0),
(909, 3, 'config', 'config_currency', 'USD', 0),
(910, 3, 'config', 'config_product_limit', '15', 0),
(911, 3, 'config', 'config_product_description_length', '100', 0),
(908, 3, 'config', 'config_language', 'en', 0),
(907, 3, 'config', 'config_zone_id', '3563', 0),
(906, 3, 'config', 'config_country_id', '222', 0),
(905, 3, 'config', 'config_layout_id', '6', 0),
(904, 3, 'config', 'config_template', 'default', 0),
(903, 3, 'config', 'config_meta_keyword', '', 0),
(902, 3, 'config', 'config_meta_description', '', 0),
(901, 3, 'config', 'config_meta_title', 'ddd', 0),
(900, 3, 'config', 'config_comment', 'Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi. Curabitur molestie euismod erat. Proin eros odio, mattis rutrum', 0),
(899, 3, 'config', 'config_open', 'MON-SAT: 10AM-8PM\r\nSUN: 11.30AM-5PM', 0),
(898, 3, 'config', 'config_image', 'catalog/logo-small.png', 0),
(897, 3, 'config', 'config_fax', '321321321, 321321321', 0),
(896, 3, 'config', 'config_geocode', '', 0),
(895, 3, 'config', 'config_address', '7563 ST. VINCENT PLACE, GLASGOW', 0),
(1325, 2, 'config', 'config_address', '7563 ST. VINCENT PLACE, GLASGOW', 0),
(1323, 2, 'config', 'config_url', 'sdfsdf', 0),
(1324, 2, 'config', 'config_ssl', '', 0),
(1322, 2, 'config', 'config_telephone', '321321321, 321321321', 0),
(1321, 2, 'config', 'config_email', 'INFO@MYDOMAIN.COM', 0),
(894, 3, 'config', 'config_ssl', '', 0),
(892, 3, 'config', 'config_telephone', '321321321, 321321321', 0),
(891, 3, 'config', 'config_email', 'INFO@MYDOMAIN.COM', 0),
(890, 3, 'config', 'config_owner', 'test', 0),
(6155, 0, 'config', 'config_ajaxadvancedsearch_color_evenresult', '', 0),
(6153, 0, 'config', 'config_ajaxadvancedsearch_color_quantity', '', 0),
(6152, 0, 'config', 'config_ajaxadvancedsearch_color_stockstatushover', '', 0),
(6151, 0, 'config', 'config_ajaxadvancedsearch_color_stockstatus', '', 0),
(6150, 0, 'config', 'config_ajaxadvancedsearch_color_pricehover', '', 0),
(6149, 0, 'config', 'config_ajaxadvancedsearch_color_price', '', 0),
(893, 3, 'config', 'config_url', 'ddd', 0),
(889, 3, 'config', 'config_name', 'Coolbaby', 0),
(2346, 1, 'config', 'config_image_wishlist_width', '50', 0),
(2344, 1, 'config', 'config_image_compare_width', '90', 0),
(2345, 1, 'config', 'config_image_compare_height', '90', 0),
(2343, 1, 'config', 'config_image_related_height', '80', 0),
(2341, 1, 'config', 'config_image_additional_height', '74', 0),
(2342, 1, 'config', 'config_image_related_width', '80', 0),
(2340, 1, 'config', 'config_image_additional_width', '74', 0),
(2339, 1, 'config', 'config_image_product_height', '80', 0),
(2338, 1, 'config', 'config_image_product_width', '80', 0),
(2337, 1, 'config', 'config_image_popup_height', '500', 0),
(2336, 1, 'config', 'config_image_popup_width', '500', 0),
(2335, 1, 'config', 'config_image_thumb_height', '228', 0),
(2333, 1, 'config', 'config_image_category_height', '80', 0),
(2334, 1, 'config', 'config_image_thumb_width', '228', 0),
(2332, 1, 'config', 'config_image_category_width', '80', 0),
(2331, 1, 'config', 'config_icon', 'catalog/theme_favicon.png', 0),
(2330, 1, 'config', 'config_logo', 'catalog/theme_logo.png', 0),
(2328, 1, 'config', 'config_stock_display', '0', 0),
(2329, 1, 'config', 'config_stock_checkout', '0', 0),
(2327, 1, 'config', 'config_order_status_id', '7', 0),
(2326, 1, 'config', 'config_checkout_id', '0', 0),
(2325, 1, 'config', 'config_checkout_guest', '0', 0),
(2324, 1, 'config', 'config_cart_weight', '0', 0),
(2323, 1, 'config', 'config_account_id', '0', 0),
(2322, 1, 'config', 'config_customer_price', '0', 0),
(1320, 2, 'config', 'config_owner', 'snap', 0),
(1319, 2, 'config', 'config_name', 'Coolbaby', 0),
(2263, 8, 'config', 'config_image', 'catalog/logo-small.png', 0),
(2262, 8, 'config', 'config_open', 'MON-SAT: 10AM-8PM\r\nSUN: 11.30AM-5PM', 0),
(2261, 8, 'config', 'config_comment', 'Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi. Curabitur molestie euismod erat. Proin eros odio, mattis rutrum', 0),
(2260, 8, 'config', 'config_meta_title', '', 0),
(2259, 8, 'config', 'config_meta_description', '', 0),
(2258, 8, 'config', 'config_meta_keyword', '', 0),
(2257, 8, 'config', 'config_template', '', 0),
(2256, 8, 'config', 'config_layout_id', '', 0),
(2255, 8, 'config', 'config_tax', '', 0),
(2254, 8, 'config', 'config_tax_default', '', 0),
(2253, 8, 'config', 'config_tax_customer', '', 0),
(2252, 8, 'config', 'config_customer_group_id', '', 0),
(2251, 8, 'config', 'config_customer_price', '', 0),
(2250, 8, 'config', 'config_account_id', '', 0),
(2249, 8, 'config', 'config_cart_weight', '', 0),
(2248, 8, 'config', 'config_checkout_guest', '', 0),
(2247, 8, 'config', 'config_checkout_id', '', 0),
(2246, 8, 'config', 'config_order_status_id', '', 0),
(2245, 8, 'config', 'config_stock_display', '', 0),
(2244, 8, 'config', 'config_stock_checkout', '', 0),
(2243, 8, 'config', 'config_logo', 'catalog/theme_logo.png', 0),
(2242, 8, 'config', 'config_icon', 'catalog/theme_favicon.png', 0),
(2241, 8, 'config', 'config_payacc', '', 0),
(2240, 8, 'config', 'config_zone_id', '3563', 0),
(2239, 8, 'config', 'config_country_id', '222', 0),
(2238, 8, 'config', 'config_address', '7563 ST. VINCENT PLACE, GLASGOW', 0),
(2237, 8, 'config', 'config_owner', 'mmmmmmm', 0),
(2236, 8, 'config', 'config_name', 'Coolbaby', 0),
(2235, 8, 'config', 'config_telephone', '321321321, 321321321', 0),
(2234, 8, 'config', 'config_email', 'INFO@MYDOMAIN.COM', 0),
(2233, 7, 'config', 'config_payacc', '', 0),
(2231, 7, 'config', 'config_secure', '0', 0),
(2232, 7, 'config', 'config_commission', '10', 0),
(2230, 7, 'config', 'config_image_location_height', '180', 0),
(2229, 7, 'config', 'config_image_location_width', '160', 0),
(2228, 7, 'config', 'config_image_cart_height', '80', 0),
(2227, 7, 'config', 'config_image_cart_width', '80', 0),
(2226, 7, 'config', 'config_image_wishlist_height', '50', 0),
(2224, 7, 'config', 'config_image_compare_height', '90', 0),
(2225, 7, 'config', 'config_image_wishlist_width', '50', 0),
(2223, 7, 'config', 'config_image_compare_width', '90', 0),
(2222, 7, 'config', 'config_image_related_height', '80', 0),
(2221, 7, 'config', 'config_image_related_width', '80', 0),
(2220, 7, 'config', 'config_image_additional_height', '74', 0),
(2219, 7, 'config', 'config_image_additional_width', '74', 0),
(2218, 7, 'config', 'config_image_product_height', '80', 0),
(2217, 7, 'config', 'config_image_product_width', '80', 0),
(2216, 7, 'config', 'config_image_popup_height', '500', 0),
(2215, 7, 'config', 'config_image_popup_width', '500', 0),
(2214, 7, 'config', 'config_image_thumb_height', '228', 0),
(2213, 7, 'config', 'config_image_thumb_width', '228', 0),
(2212, 7, 'config', 'config_image_category_height', '80', 0),
(2211, 7, 'config', 'config_image_category_width', '80', 0),
(2210, 7, 'config', 'config_icon', 'catalog/theme_favicon.png', 0),
(2209, 7, 'config', 'config_logo', 'catalog/theme_logo.png', 0),
(2208, 7, 'config', 'config_stock_checkout', '0', 0),
(2207, 7, 'config', 'config_stock_display', '0', 0),
(2206, 7, 'config', 'config_order_status_id', '7', 0),
(2205, 7, 'config', 'config_checkout_id', '0', 0),
(2204, 7, 'config', 'config_checkout_guest', '0', 0),
(2203, 7, 'config', 'config_cart_weight', '0', 0),
(2202, 7, 'config', 'config_account_id', '0', 0),
(2201, 7, 'config', 'config_customer_price', '0', 0),
(2200, 7, 'config', 'config_customer_group_id', '1', 0),
(2199, 7, 'config', 'config_tax_customer', '', 0),
(2198, 7, 'config', 'config_tax_default', '', 0),
(2197, 7, 'config', 'config_tax', '0', 0),
(2196, 7, 'config', 'config_product_description_length', '100', 0),
(2195, 7, 'config', 'config_product_limit', '15', 0),
(2194, 7, 'config', 'config_currency', 'USD', 0),
(2193, 7, 'config', 'config_language', 'en', 0),
(2192, 7, 'config', 'config_zone_id', '3563', 0),
(2191, 7, 'config', 'config_country_id', '222', 0),
(2190, 7, 'config', 'config_layout_id', '6', 0),
(2189, 7, 'config', 'config_template', 'default', 0),
(2188, 7, 'config', 'config_meta_keyword', '', 0),
(2187, 7, 'config', 'config_meta_description', '', 0),
(2186, 7, 'config', 'config_meta_title', 'dfgdfg', 0),
(2185, 7, 'config', 'config_comment', 'Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi. Curabitur molestie euismod erat. Proin eros odio, mattis rutrum', 0),
(2184, 7, 'config', 'config_open', 'MON-SAT: 10AM-8PM\r\nSUN: 11.30AM-5PM', 0),
(2183, 7, 'config', 'config_image', 'catalog/logo-small.png', 0),
(2182, 7, 'config', 'config_fax', '321321321, 321321321', 0),
(2181, 7, 'config', 'config_geocode', '', 0),
(2180, 7, 'config', 'config_address', '7563 ST. VINCENT PLACE, GLASGOW', 0),
(2179, 7, 'config', 'config_ssl', '', 0),
(2178, 7, 'config', 'config_url', 'dfgddfg', 0),
(2176, 7, 'config', 'config_email', 'INFO@MYDOMAIN.COM', 0),
(2177, 7, 'config', 'config_telephone', '321321321, 321321321', 0),
(2174, 7, 'config', 'config_name', 'Coolbaby', 0),
(2175, 7, 'config', 'config_owner', 'krish', 0),
(6148, 0, 'config', 'config_ajaxadvancedsearch_color_manufacturerhover', '', 0),
(6147, 0, 'config', 'config_ajaxadvancedsearch_color_manufacturer', '', 0),
(6146, 0, 'config', 'config_ajaxadvancedsearch_color_modelhover', '', 0),
(6145, 0, 'config', 'config_ajaxadvancedsearch_color_model', '', 0),
(2321, 1, 'config', 'config_customer_group_id', '1', 0),
(2320, 1, 'config', 'config_tax_customer', '', 0),
(2319, 1, 'config', 'config_tax_default', '', 0),
(2318, 1, 'config', 'config_tax', '0', 0),
(2310, 1, 'config', 'config_template', 'default', 0),
(2311, 1, 'config', 'config_layout_id', '6', 0),
(2312, 1, 'config', 'config_country_id', '222', 0),
(2313, 1, 'config', 'config_zone_id', '3563', 0),
(2314, 1, 'config', 'config_language', 'en', 0),
(2315, 1, 'config', 'config_currency', 'USD', 0),
(2316, 1, 'config', 'config_product_limit', '15', 0),
(2317, 1, 'config', 'config_product_description_length', '100', 0),
(2293, 8, 'config', 'config_commission', '10', 0),
(2292, 8, 'config', 'config_secure', '0', 0),
(2291, 8, 'config', 'config_image_location_height', '180', 0),
(2290, 8, 'config', 'config_image_location_width', '160', 0),
(2289, 8, 'config', 'config_image_cart_height', '80', 0),
(2288, 8, 'config', 'config_image_cart_width', '80', 0),
(2287, 8, 'config', 'config_image_wishlist_height', '50', 0),
(2286, 8, 'config', 'config_image_wishlist_width', '50', 0),
(2285, 8, 'config', 'config_image_compare_height', '90', 0),
(2284, 8, 'config', 'config_image_compare_width', '90', 0),
(2283, 8, 'config', 'config_image_related_height', '80', 0),
(2282, 8, 'config', 'config_image_related_width', '80', 0),
(2281, 8, 'config', 'config_image_additional_height', '74', 0),
(2280, 8, 'config', 'config_image_additional_width', '74', 0),
(2279, 8, 'config', 'config_image_product_height', '80', 0),
(2278, 8, 'config', 'config_image_product_width', '80', 0),
(2277, 8, 'config', 'config_image_popup_height', '500', 0),
(2276, 8, 'config', 'config_image_popup_width', '500', 0),
(2275, 8, 'config', 'config_image_thumb_height', '228', 0),
(2274, 8, 'config', 'config_image_thumb_width', '228', 0),
(2273, 8, 'config', 'config_image_category_height', '80', 0),
(2272, 8, 'config', 'config_image_category_width', '80', 0),
(2271, 8, 'config', 'config_product_description_length', '100', 0),
(2270, 8, 'config', 'config_product_limit', '15', 0),
(2269, 8, 'config', 'config_currency', 'USD', 0),
(2268, 8, 'config', 'config_language', 'en', 0),
(2267, 8, 'config', 'config_url', '', 0),
(2266, 8, 'config', 'config_ssl', '', 0),
(2264, 8, 'config', 'config_fax', '321321321, 321321321', 0),
(2265, 8, 'config', 'config_geocode', '', 0),
(2309, 1, 'config', 'config_meta_keyword', '', 0),
(2305, 1, 'config', 'config_comment', 'Vestibulum justo. Nulla mauris ipsum, convallis ut, vestibulum eu, tincidunt vel, nisi. Curabitur molestie euismod erat. Proin eros odio, mattis rutrum', 0),
(2306, 1, 'config', 'config_location', 'a:2:{i:0;s:1:"2";i:1;s:1:"1";}', 1),
(2307, 1, 'config', 'config_meta_title', 'ssss', 0),
(2308, 1, 'config', 'config_meta_description', '', 0),
(2304, 1, 'config', 'config_open', 'MON-SAT: 10AM-8PM\r\nSUN: 11.30AM-5PM', 0),
(2303, 1, 'config', 'config_image', 'catalog/logo-small.png', 0),
(2302, 1, 'config', 'config_fax', '321321321, 321321321', 0),
(2301, 1, 'config', 'config_geocode', '', 0),
(2300, 1, 'config', 'config_address', '7563 ST. VINCENT PLACE, GLASGOW', 0),
(2299, 1, 'config', 'config_ssl', '', 0),
(2298, 1, 'config', 'config_url', 'http://192.168.1.3:1107/upload/', 0),
(2297, 1, 'config', 'config_telephone', '321321321, 321321321', 0),
(2296, 1, 'config', 'config_email', 'INFO@MYDOMAIN.COM', 0),
(2294, 1, 'config', 'config_name', 'Coolbaby', 0),
(2295, 1, 'config', 'config_owner', 'flipkart', 0),
(2561, 0, 'simple_blog_category', 'simple_blog_category_status', '1', 0),
(2562, 0, 'simple_blog_category', 'simple_blog_category_search_article', '0', 0),
(2556, 0, 'simple_blog', 'simple_blog_display_category', '1', 0),
(2557, 0, 'simple_blog', 'simple_blog_comment_auto_approval', '1', 0),
(2558, 0, 'simple_blog', 'simple_blog_author_information', '0', 0),
(2559, 0, 'simple_blog', 'simple_blog_related_articles', '0', 0),
(2560, 0, 'simple_blog', 'simple_blog_share_social_site', '0', 0),
(2555, 0, 'simple_blog', 'simple_blog_comment_related_heading', 'Comments', 0),
(2554, 0, 'simple_blog', 'simple_blog_product_related_heading', 'Product related', 0),
(2550, 0, 'simple_blog', 'simple_blog_status', '1', 0),
(2551, 0, 'simple_blog', 'simple_blog_seo_keyword', 'blog', 0),
(2552, 0, 'simple_blog', 'simple_blog_footer_heading', 'Blog', 0),
(2553, 0, 'simple_blog', 'simple_blog_heading', 'Blog posts', 0),
(6144, 0, 'config', 'config_ajaxadvancedsearch_color_headinghover', '', 0),
(6143, 0, 'config', 'config_ajaxadvancedsearch_color_heading', '', 0),
(6142, 0, 'config', 'config_ajaxadvancedsearch_color_defaulthover', '', 0),
(6141, 0, 'config', 'config_ajaxadvancedsearch_color_default', '', 0),
(6140, 0, 'config', 'config_ajaxadvancedsearch_colordefaultall', '0', 0),
(6139, 0, 'config', 'config_ajaxadvancedsearch_colorenabletall', '0', 0),
(6138, 0, 'config', 'config_ajaxadvancedsearch_highlight', '0', 0),
(6137, 0, 'config', 'config_ajaxadvancedsearch_color_highlighthover', '', 0),
(6136, 0, 'config', 'config_ajaxadvancedsearch_color_highlight', '', 0),
(6135, 0, 'config', 'config_ajaxadvancedsearch_result_view', 'default-view', 0),
(6134, 0, 'config', 'config_ajaxadvancedsearch_image_height', '50', 0),
(6133, 0, 'config', 'config_ajaxadvancedsearch_image_width', '50', 0),
(6132, 0, 'config', 'config_ajaxadvancedsearch_image', '1', 0),
(6131, 0, 'config', 'config_ajaxadvancedsearch_charlimit', '', 0),
(6130, 0, 'config', 'config_ajaxadvancedsearch_limit', '', 0),
(6129, 0, 'config', 'config_ajaxadvancedsearch', '1', 0),
(6128, 0, 'config', 'config_fraud_status_id', '7', 0),
(6127, 0, 'config', 'config_fraud_score', '&lt;b&gt;Notice&lt;/b&gt;: Undefined variable: config_fraud_score in &lt;b&gt;/home/inalap/workspace/fayas/upload/vqmod/vqcache/vq2-admin_view_template_setting_setting.tpl&lt;/b&gt; on line &lt;b&gt;1368&lt;/b&gt;', 0),
(6125, 0, 'config', 'config_fraud_detection', '0', 0),
(6126, 0, 'config', 'config_fraud_key', '&lt;b&gt;Notice&lt;/b&gt;: Undefined variable: config_fraud_key in &lt;b&gt;/home/inalap/workspace/fayas/upload/vqmod/vqcache/vq2-admin_view_template_setting_setting.tpl&lt;/b&gt; on line &lt;b&gt;1362&lt;/b&gt;', 0),
(6124, 0, 'config', 'config_mail_alert', '', 0),
(6123, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(6122, 0, 'config', 'config_mail_smtp_port', '25', 0),
(6121, 0, 'config', 'config_mail_smtp_password', '', 0),
(6120, 0, 'config', 'config_mail_smtp_username', '', 0),
(6119, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(6118, 0, 'config', 'config_mail_parameter', '', 0),
(6117, 0, 'config', 'config_mail_protocol', 'mail', 0),
(6116, 0, 'config', 'config_ftp_status', '0', 0),
(6115, 0, 'config', 'config_ftp_root', '', 0),
(6114, 0, 'config', 'config_ftp_password', '', 0),
(6113, 0, 'config', 'config_ftp_username', '', 0),
(6112, 0, 'config', 'config_ftp_port', '21', 0),
(6111, 0, 'config', 'config_ftp_hostname', '192.168.8.100:1007', 0),
(6110, 0, 'config', 'config_image_location_height', '50', 0),
(6109, 0, 'config', 'config_image_location_width', '160', 0),
(6108, 0, 'config', 'config_image_cart_height', '47', 0),
(6107, 0, 'config', 'config_image_cart_width', '47', 0),
(6106, 0, 'config', 'config_image_wishlist_height', '47', 0),
(6105, 0, 'config', 'config_image_wishlist_width', '47', 0),
(6104, 0, 'config', 'config_image_compare_height', '90', 0),
(6103, 0, 'config', 'config_image_compare_width', '90', 0),
(6102, 0, 'config', 'config_image_related_height', '80', 0),
(6101, 0, 'config', 'config_image_related_width', '80', 0),
(6100, 0, 'config', 'config_image_additional_height', '74', 0),
(6099, 0, 'config', 'config_image_additional_width', '74', 0),
(6098, 0, 'config', 'config_image_product_height', '228', 0),
(6097, 0, 'config', 'config_image_product_width', '228', 0),
(6096, 0, 'config', 'config_image_popup_height', '500', 0),
(6095, 0, 'config', 'config_image_popup_width', '500', 0),
(6094, 0, 'config', 'config_image_thumb_height', '228', 0),
(6093, 0, 'config', 'config_image_thumb_width', '228', 0),
(6092, 0, 'config', 'config_image_category_height', '80', 0),
(6091, 0, 'config', 'config_image_category_width', '80', 0),
(6090, 0, 'config', 'config_icon', 'catalog/favicon/favicon.png', 0),
(6088, 0, 'config', 'config_return_status_id', '2', 0),
(6089, 0, 'config', 'config_logo', 'catalog/theme_logo.png', 0),
(6087, 0, 'config', 'config_return_id', '0', 0),
(6086, 0, 'config', 'config_affiliate_mail', '0', 0),
(6085, 0, 'config', 'config_affiliate_id', '4', 0),
(6084, 0, 'config', 'config_affiliate_commission', '5', 0),
(6083, 0, 'config', 'config_affiliate_auto', '0', 0),
(6082, 0, 'config', 'config_affiliate_approval', '0', 0),
(6081, 0, 'config', 'config_stock_checkout', '0', 0),
(6080, 0, 'config', 'config_stock_warning', '0', 0),
(6079, 0, 'config', 'config_stock_display', '0', 0),
(6077, 0, 'config', 'config_complete_status', 'a:1:{i:0;s:1:"5";}', 1),
(6078, 0, 'config', 'config_order_mail', '1', 0),
(6076, 0, 'config', 'config_processing_status', 'a:1:{i:0;s:1:"2";}', 1),
(6074, 0, 'config', 'config_checkout_id', '5', 0),
(6075, 0, 'config', 'config_order_status_id', '1', 0),
(6026, 0, 'news', 'news_status', '1', 0),
(2528, 0, 'category', 'category_status', '1', 0),
(2529, 0, 'filter', 'filter_status', '1', 0),
(2530, 0, 'account', 'account_status', '1', 0),
(2531, 0, 'upsells', 'upsells_status', '1', 0),
(3477, 9, 'config', 'config_ajaxadvancedsearch_color_pricehover', '', 0),
(3476, 9, 'config', 'config_ajaxadvancedsearch_color_price', '', 0),
(3475, 9, 'config', 'config_ajaxadvancedsearch_color_manufacturerhover', '', 0),
(3474, 9, 'config', 'config_ajaxadvancedsearch_color_manufacturer', '', 0),
(3473, 9, 'config', 'config_ajaxadvancedsearch_color_modelhover', '', 0),
(3472, 9, 'config', 'config_ajaxadvancedsearch_color_model', '', 0),
(3471, 9, 'config', 'config_ajaxadvancedsearch_color_headinghover', '', 0),
(3470, 9, 'config', 'config_ajaxadvancedsearch_color_heading', '', 0),
(3469, 9, 'config', 'config_ajaxadvancedsearch_color_defaulthover', '', 0),
(3468, 9, 'config', 'config_ajaxadvancedsearch_color_default', '', 0),
(3467, 9, 'config', 'config_ajaxadvancedsearch_colordefaultall', '0', 0),
(3466, 9, 'config', 'config_ajaxadvancedsearch_colorenabletall', '0', 0),
(3465, 9, 'config', 'config_ajaxadvancedsearch_highlight', '0', 0),
(3464, 9, 'config', 'config_ajaxadvancedsearch_color_highlighthover', '', 0),
(3463, 9, 'config', 'config_ajaxadvancedsearch_color_highlight', '', 0),
(3462, 9, 'config', 'config_ajaxadvancedsearch_result_view', 'default-view', 0),
(3461, 9, 'config', 'config_ajaxadvancedsearch_image_height', '50', 0),
(3460, 9, 'config', 'config_ajaxadvancedsearch_image_width', '50', 0),
(3459, 9, 'config', 'config_ajaxadvancedsearch_image', '0', 0),
(3458, 9, 'config', 'config_ajaxadvancedsearch_charlimit', '', 0),
(3457, 9, 'config', 'config_ajaxadvancedsearch_limit', '', 0),
(3456, 9, 'config', 'config_ajaxadvancedsearch', '0', 0),
(3455, 9, 'config', 'config_image_location_height', '180', 0),
(3454, 9, 'config', 'config_image_location_width', '240', 0),
(3453, 9, 'config', 'config_image_cart_height', '80', 0),
(3452, 9, 'config', 'config_image_cart_width', '80', 0),
(3451, 9, 'config', 'config_image_wishlist_height', '50', 0),
(3450, 9, 'config', 'config_image_wishlist_width', '50', 0),
(3449, 9, 'config', 'config_image_compare_height', '90', 0),
(3448, 9, 'config', 'config_image_compare_width', '90', 0),
(3447, 9, 'config', 'config_image_related_height', '80', 0),
(3446, 9, 'config', 'config_image_related_width', '80', 0),
(3445, 9, 'config', 'config_image_additional_height', '74', 0),
(3444, 9, 'config', 'config_image_additional_width', '74', 0),
(3443, 9, 'config', 'config_image_product_height', '80', 0),
(3442, 9, 'config', 'config_image_product_width', '80', 0),
(3441, 9, 'config', 'config_image_popup_height', '500', 0),
(3440, 9, 'config', 'config_image_popup_width', '500', 0),
(3439, 9, 'config', 'config_image_thumb_height', '228', 0),
(3438, 9, 'config', 'config_image_thumb_width', '228', 0),
(3437, 9, 'config', 'config_image_category_height', '80', 0),
(3436, 9, 'config', 'config_image_category_width', '80', 0),
(3435, 9, 'config', 'config_icon', '', 0),
(3434, 9, 'config', 'config_logo', '', 0),
(3433, 9, 'config', 'config_stock_checkout', '0', 0),
(3432, 9, 'config', 'config_stock_display', '0', 0),
(3431, 9, 'config', 'config_order_status_id', '7', 0),
(3430, 9, 'config', 'config_checkout_id', '0', 0),
(3429, 9, 'config', 'config_checkout_guest', '0', 0),
(3428, 9, 'config', 'config_cart_weight', '0', 0),
(3427, 9, 'config', 'config_account_id', '0', 0),
(3426, 9, 'config', 'config_customer_price', '0', 0),
(3425, 9, 'config', 'config_customer_group_id', '1', 0),
(3424, 9, 'config', 'config_tax_customer', '', 0),
(3423, 9, 'config', 'config_tax_default', '', 0),
(3422, 9, 'config', 'config_tax', '0', 0),
(3421, 9, 'config', 'config_product_description_length', '100', 0),
(3420, 9, 'config', 'config_product_limit', '15', 0),
(3419, 9, 'config', 'config_currency', 'USD', 0),
(3418, 9, 'config', 'config_language', 'en', 0),
(3417, 9, 'config', 'config_zone_id', '3563', 0),
(3416, 9, 'config', 'config_country_id', '222', 0),
(3415, 9, 'config', 'config_layout_id', '6', 0),
(3414, 9, 'config', 'config_template', 'coolbaby', 0),
(3413, 9, 'config', 'config_meta_keyword', '', 0),
(3412, 9, 'config', 'config_meta_description', '', 0),
(3411, 9, 'config', 'config_meta_title', 'merchant merchant', 0),
(3410, 9, 'config', 'config_comment', '', 0),
(3409, 9, 'config', 'config_open', '', 0),
(3408, 9, 'config', 'config_image', '', 0),
(3407, 9, 'config', 'config_fax', '', 0),
(3406, 9, 'config', 'config_geocode', '', 0),
(3405, 9, 'config', 'config_address', 'merchant merchant', 0),
(3404, 9, 'config', 'config_ssl', '', 0),
(3403, 9, 'config', 'config_url', 'http://two/', 0),
(3402, 9, 'config', 'config_telephone', '9994275649', 0),
(3401, 9, 'config', 'config_email', 'merchant@gmail.com', 0),
(3400, 9, 'config', 'config_owner', 'merchant', 0),
(3399, 9, 'config', 'config_name', 'merchant', 0),
(4322, 10, 'config', 'config_ajaxadvancedsearch_descr', '0', 0),
(4321, 10, 'config', 'config_ajaxadvancedsearch_model', '0', 0),
(4320, 10, 'config', 'config_ajaxadvancedsearch_displayallresults', '0', 0),
(4319, 10, 'config', 'config_ajaxadvancedsearch_color_resulthover', '', 0),
(4318, 10, 'config', 'config_ajaxadvancedsearch_color_oddresult', '', 0),
(4317, 10, 'config', 'config_ajaxadvancedsearch_color_evenresult', '', 0),
(4316, 10, 'config', 'config_ajaxadvancedsearch_color_quantityhover', '', 0),
(4315, 10, 'config', 'config_ajaxadvancedsearch_color_quantity', '', 0),
(4314, 10, 'config', 'config_ajaxadvancedsearch_color_stockstatushover', '', 0),
(4313, 10, 'config', 'config_ajaxadvancedsearch_color_stockstatus', '', 0),
(4312, 10, 'config', 'config_ajaxadvancedsearch_color_pricehover', '', 0),
(4311, 10, 'config', 'config_ajaxadvancedsearch_color_price', '', 0),
(4310, 10, 'config', 'config_ajaxadvancedsearch_color_manufacturerhover', '', 0),
(4309, 10, 'config', 'config_ajaxadvancedsearch_color_manufacturer', '', 0),
(4308, 10, 'config', 'config_ajaxadvancedsearch_color_modelhover', '', 0),
(4307, 10, 'config', 'config_ajaxadvancedsearch_color_model', '', 0),
(4306, 10, 'config', 'config_ajaxadvancedsearch_color_headinghover', '', 0),
(4305, 10, 'config', 'config_ajaxadvancedsearch_color_heading', '', 0),
(4304, 10, 'config', 'config_ajaxadvancedsearch_color_defaulthover', '', 0),
(4303, 10, 'config', 'config_ajaxadvancedsearch_color_default', '', 0),
(4302, 10, 'config', 'config_ajaxadvancedsearch_colordefaultall', '0', 0),
(3717, 12, 'config', 'config_secure', '0', 0),
(3718, 12, 'config', 'config_commission', '10', 0),
(3716, 12, 'config', 'config_ajaxadvancedsearch_sku', '0', 0),
(3715, 12, 'config', 'config_ajaxadvancedsearch_upc', '0', 0),
(3714, 12, 'config', 'config_ajaxadvancedsearch_ean', '0', 0),
(3713, 12, 'config', 'config_ajaxadvancedsearch_jan', '0', 0),
(3709, 12, 'config', 'config_ajaxadvancedsearch_tag', '0', 0),
(3710, 12, 'config', 'config_ajaxadvancedsearch_mpn', '0', 0),
(3711, 12, 'config', 'config_ajaxadvancedsearch_manufacturer_search', '0', 0),
(3712, 12, 'config', 'config_ajaxadvancedsearch_isbn', '0', 0),
(3705, 12, 'config', 'config_ajaxadvancedsearch_rating', '0', 0),
(3706, 12, 'config', 'config_ajaxadvancedsearch_stock', '0', 0),
(3707, 12, 'config', 'config_ajaxadvancedsearch_quantity', '0', 0),
(3708, 12, 'config', 'config_ajaxadvancedsearch_model_search', '0', 0),
(3704, 12, 'config', 'config_ajaxadvancedsearch_pricelogin', '0', 0),
(3703, 12, 'config', 'config_ajaxadvancedsearch_price', '0', 0),
(3702, 12, 'config', 'config_ajaxadvancedsearch_manufacturer', '0', 0),
(3701, 12, 'config', 'config_ajaxadvancedsearch_descr', '0', 0),
(4301, 10, 'config', 'config_ajaxadvancedsearch_colorenabletall', '0', 0),
(4300, 10, 'config', 'config_ajaxadvancedsearch_highlight', '0', 0),
(4299, 10, 'config', 'config_ajaxadvancedsearch_color_highlighthover', '', 0),
(4298, 10, 'config', 'config_ajaxadvancedsearch_color_highlight', '', 0),
(4297, 10, 'config', 'config_ajaxadvancedsearch_result_view', 'default-view', 0),
(4296, 10, 'config', 'config_ajaxadvancedsearch_image_height', '50', 0),
(4295, 10, 'config', 'config_ajaxadvancedsearch_image_width', '50', 0),
(4294, 10, 'config', 'config_ajaxadvancedsearch_image', '0', 0),
(4293, 10, 'config', 'config_ajaxadvancedsearch_charlimit', '', 0),
(4292, 10, 'config', 'config_ajaxadvancedsearch_limit', '', 0),
(4291, 10, 'config', 'config_ajaxadvancedsearch', '0', 0),
(4290, 10, 'config', 'config_image_location_height', '180', 0),
(4289, 10, 'config', 'config_image_location_width', '240', 0),
(4288, 10, 'config', 'config_image_cart_height', '80', 0),
(4287, 10, 'config', 'config_image_cart_width', '80', 0),
(4286, 10, 'config', 'config_image_wishlist_height', '50', 0),
(4285, 10, 'config', 'config_image_wishlist_width', '50', 0),
(4284, 10, 'config', 'config_image_compare_height', '90', 0),
(4283, 10, 'config', 'config_image_compare_width', '90', 0),
(4282, 10, 'config', 'config_image_related_height', '80', 0),
(4281, 10, 'config', 'config_image_related_width', '80', 0),
(4280, 10, 'config', 'config_image_additional_height', '74', 0),
(4279, 10, 'config', 'config_image_additional_width', '74', 0),
(4278, 10, 'config', 'config_image_product_height', '80', 0),
(4277, 10, 'config', 'config_image_product_width', '80', 0),
(4276, 10, 'config', 'config_image_popup_height', '500', 0),
(4275, 10, 'config', 'config_image_popup_width', '500', 0),
(4274, 10, 'config', 'config_image_thumb_height', '228', 0),
(4273, 10, 'config', 'config_image_thumb_width', '228', 0),
(4272, 10, 'config', 'config_image_category_height', '80', 0),
(4271, 10, 'config', 'config_image_category_width', '80', 0),
(4270, 10, 'config', 'config_icon', '', 0),
(4269, 10, 'config', 'config_logo', '', 0),
(4268, 10, 'config', 'config_stock_checkout', '0', 0),
(4267, 10, 'config', 'config_stock_display', '0', 0),
(4266, 10, 'config', 'config_order_status_id', '7', 0),
(4265, 10, 'config', 'config_checkout_id', '0', 0),
(4264, 10, 'config', 'config_checkout_guest', '0', 0),
(4263, 10, 'config', 'config_cart_weight', '0', 0),
(4262, 10, 'config', 'config_account_id', '0', 0),
(4261, 10, 'config', 'config_customer_price', '0', 0),
(4260, 10, 'config', 'config_customer_group_id', '1', 0),
(4259, 10, 'config', 'config_tax_customer', '', 0),
(4258, 10, 'config', 'config_tax_default', '', 0),
(4257, 10, 'config', 'config_tax', '0', 0),
(4256, 10, 'config', 'config_product_description_length', '100', 0),
(4255, 10, 'config', 'config_product_limit', '15', 0),
(4254, 10, 'config', 'config_currency', 'USD', 0),
(4253, 10, 'config', 'config_language', 'en', 0),
(4252, 10, 'config', 'config_zone_id', '3563', 0),
(4251, 10, 'config', 'config_country_id', '222', 0),
(4250, 10, 'config', 'config_layout_id', '6', 0),
(4249, 10, 'config', 'config_template', 'coolbaby', 0),
(4248, 10, 'config', 'config_meta_keyword', '', 0),
(4247, 10, 'config', 'config_meta_description', '', 0),
(4246, 10, 'config', 'config_meta_title', 'test123 test123 test123', 0),
(4245, 10, 'config', 'config_comment', '', 0),
(4244, 10, 'config', 'config_open', '', 0),
(4243, 10, 'config', 'config_image', '', 0),
(4242, 10, 'config', 'config_fax', '', 0),
(4241, 10, 'config', 'config_geocode', '', 0),
(4240, 10, 'config', 'config_address', 'test123 test123 test123', 0),
(4239, 10, 'config', 'config_ssl', '', 0),
(4238, 10, 'config', 'config_url', 'http://stores1.100myspacelayouts.com/', 0),
(4237, 10, 'config', 'config_telephone', '123456789', 0),
(4236, 10, 'config', 'config_email', 'test@gmail.com', 0),
(4235, 10, 'config', 'config_owner', 'mani', 0),
(4234, 10, 'config', 'config_name', 'Raja', 0),
(3700, 12, 'config', 'config_ajaxadvancedsearch_model', '0', 0);
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(3699, 12, 'config', 'config_ajaxadvancedsearch_displayallresults', '0', 0),
(3698, 12, 'config', 'config_ajaxadvancedsearch_color_resulthover', '', 0),
(3697, 12, 'config', 'config_ajaxadvancedsearch_color_oddresult', '', 0),
(3696, 12, 'config', 'config_ajaxadvancedsearch_color_evenresult', '', 0),
(3695, 12, 'config', 'config_ajaxadvancedsearch_color_quantityhover', '', 0),
(3694, 12, 'config', 'config_ajaxadvancedsearch_color_quantity', '', 0),
(3692, 12, 'config', 'config_ajaxadvancedsearch_color_stockstatus', '', 0),
(3693, 12, 'config', 'config_ajaxadvancedsearch_color_stockstatushover', '', 0),
(3691, 12, 'config', 'config_ajaxadvancedsearch_color_pricehover', '', 0),
(3689, 12, 'config', 'config_ajaxadvancedsearch_color_manufacturerhover', '', 0),
(3690, 12, 'config', 'config_ajaxadvancedsearch_color_price', '', 0),
(3688, 12, 'config', 'config_ajaxadvancedsearch_color_manufacturer', '', 0),
(3686, 12, 'config', 'config_ajaxadvancedsearch_color_model', '', 0),
(3687, 12, 'config', 'config_ajaxadvancedsearch_color_modelhover', '', 0),
(3684, 12, 'config', 'config_ajaxadvancedsearch_color_heading', '', 0),
(3685, 12, 'config', 'config_ajaxadvancedsearch_color_headinghover', '', 0),
(3682, 12, 'config', 'config_ajaxadvancedsearch_color_default', '', 0),
(3683, 12, 'config', 'config_ajaxadvancedsearch_color_defaulthover', '', 0),
(3681, 12, 'config', 'config_ajaxadvancedsearch_colordefaultall', '0', 0),
(3680, 12, 'config', 'config_ajaxadvancedsearch_colorenabletall', '0', 0),
(3679, 12, 'config', 'config_ajaxadvancedsearch_highlight', '0', 0),
(3677, 12, 'config', 'config_ajaxadvancedsearch_color_highlight', '', 0),
(3678, 12, 'config', 'config_ajaxadvancedsearch_color_highlighthover', '', 0),
(3676, 12, 'config', 'config_ajaxadvancedsearch_result_view', 'default-view', 0),
(3675, 12, 'config', 'config_ajaxadvancedsearch_image_height', '50', 0),
(3673, 12, 'config', 'config_ajaxadvancedsearch_image', '0', 0),
(3674, 12, 'config', 'config_ajaxadvancedsearch_image_width', '50', 0),
(3672, 12, 'config', 'config_ajaxadvancedsearch_charlimit', '', 0),
(3671, 12, 'config', 'config_ajaxadvancedsearch_limit', '', 0),
(3670, 12, 'config', 'config_ajaxadvancedsearch', '0', 0),
(3669, 12, 'config', 'config_image_location_height', '180', 0),
(3668, 12, 'config', 'config_image_location_width', '240', 0),
(3667, 12, 'config', 'config_image_cart_height', '80', 0),
(3666, 12, 'config', 'config_image_cart_width', '80', 0),
(3665, 12, 'config', 'config_image_wishlist_height', '50', 0),
(3664, 12, 'config', 'config_image_wishlist_width', '50', 0),
(3663, 12, 'config', 'config_image_compare_height', '90', 0),
(3662, 12, 'config', 'config_image_compare_width', '90', 0),
(3661, 12, 'config', 'config_image_related_height', '80', 0),
(3660, 12, 'config', 'config_image_related_width', '80', 0),
(3659, 12, 'config', 'config_image_additional_height', '74', 0),
(3658, 12, 'config', 'config_image_additional_width', '74', 0),
(3657, 12, 'config', 'config_image_product_height', '80', 0),
(3656, 12, 'config', 'config_image_product_width', '80', 0),
(3655, 12, 'config', 'config_image_popup_height', '500', 0),
(3654, 12, 'config', 'config_image_popup_width', '500', 0),
(3653, 12, 'config', 'config_image_thumb_height', '228', 0),
(3652, 12, 'config', 'config_image_thumb_width', '228', 0),
(3651, 12, 'config', 'config_image_category_height', '80', 0),
(3650, 12, 'config', 'config_image_category_width', '80', 0),
(3649, 12, 'config', 'config_icon', '', 0),
(3648, 12, 'config', 'config_logo', '', 0),
(3647, 12, 'config', 'config_stock_checkout', '0', 0),
(3646, 12, 'config', 'config_stock_display', '0', 0),
(3645, 12, 'config', 'config_order_status_id', '7', 0),
(3644, 12, 'config', 'config_checkout_id', '0', 0),
(3643, 12, 'config', 'config_checkout_guest', '0', 0),
(3642, 12, 'config', 'config_cart_weight', '0', 0),
(3641, 12, 'config', 'config_account_id', '0', 0),
(3640, 12, 'config', 'config_customer_price', '0', 0),
(3639, 12, 'config', 'config_customer_group_id', '1', 0),
(3638, 12, 'config', 'config_tax_customer', '', 0),
(3636, 12, 'config', 'config_tax', '0', 0),
(3637, 12, 'config', 'config_tax_default', '', 0),
(3635, 12, 'config', 'config_product_description_length', '100', 0),
(3634, 12, 'config', 'config_product_limit', '15', 0),
(3633, 12, 'config', 'config_currency', 'USD', 0),
(3632, 12, 'config', 'config_language', 'en', 0),
(3631, 12, 'config', 'config_zone_id', '3563', 0),
(3629, 12, 'config', 'config_layout_id', '6', 0),
(3630, 12, 'config', 'config_country_id', '222', 0),
(3628, 12, 'config', 'config_template', 'coolbaby', 0),
(3627, 12, 'config', 'config_meta_keyword', '', 0),
(3626, 12, 'config', 'config_meta_description', '', 0),
(3625, 12, 'config', 'config_meta_title', 'test store1', 0),
(3624, 12, 'config', 'config_comment', '', 0),
(3623, 12, 'config', 'config_open', '', 0),
(3622, 12, 'config', 'config_image', '', 0),
(3621, 12, 'config', 'config_fax', '', 0),
(3620, 12, 'config', 'config_geocode', '', 0),
(3619, 12, 'config', 'config_address', 'test123 test123 test123', 0),
(3618, 12, 'config', 'config_ssl', '', 0),
(3617, 12, 'config', 'config_url', 'http://stores1.100myspacelayouts.com/', 0),
(3616, 12, 'config', 'config_telephone', '123456789', 0),
(3615, 12, 'config', 'config_email', 'test1@gmail.com', 0),
(3478, 9, 'config', 'config_ajaxadvancedsearch_color_stockstatus', '', 0),
(3479, 9, 'config', 'config_ajaxadvancedsearch_color_stockstatushover', '', 0),
(3480, 9, 'config', 'config_ajaxadvancedsearch_color_quantity', '', 0),
(3481, 9, 'config', 'config_ajaxadvancedsearch_color_quantityhover', '', 0),
(3482, 9, 'config', 'config_ajaxadvancedsearch_color_evenresult', '', 0),
(3483, 9, 'config', 'config_ajaxadvancedsearch_color_oddresult', '', 0),
(3484, 9, 'config', 'config_ajaxadvancedsearch_color_resulthover', '', 0),
(3485, 9, 'config', 'config_ajaxadvancedsearch_displayallresults', '0', 0),
(3486, 9, 'config', 'config_ajaxadvancedsearch_model', '0', 0),
(3487, 9, 'config', 'config_ajaxadvancedsearch_descr', '0', 0),
(3488, 9, 'config', 'config_ajaxadvancedsearch_manufacturer', '0', 0),
(3489, 9, 'config', 'config_ajaxadvancedsearch_price', '0', 0),
(3490, 9, 'config', 'config_ajaxadvancedsearch_pricelogin', '0', 0),
(3491, 9, 'config', 'config_ajaxadvancedsearch_rating', '0', 0),
(3492, 9, 'config', 'config_ajaxadvancedsearch_stock', '0', 0),
(3493, 9, 'config', 'config_ajaxadvancedsearch_quantity', '0', 0),
(3494, 9, 'config', 'config_ajaxadvancedsearch_model_search', '0', 0),
(3495, 9, 'config', 'config_ajaxadvancedsearch_tag', '0', 0),
(3496, 9, 'config', 'config_ajaxadvancedsearch_mpn', '0', 0),
(3497, 9, 'config', 'config_ajaxadvancedsearch_manufacturer_search', '0', 0),
(3498, 9, 'config', 'config_ajaxadvancedsearch_isbn', '0', 0),
(3499, 9, 'config', 'config_ajaxadvancedsearch_jan', '0', 0),
(3500, 9, 'config', 'config_ajaxadvancedsearch_ean', '0', 0),
(3501, 9, 'config', 'config_ajaxadvancedsearch_upc', '0', 0),
(3502, 9, 'config', 'config_ajaxadvancedsearch_sku', '0', 0),
(3503, 9, 'config', 'config_secure', '0', 0),
(3504, 9, 'config', 'config_commission', '10', 0),
(3505, 9, 'config', 'config_payacc', '', 0),
(3614, 12, 'config', 'config_owner', 'test', 0),
(3613, 12, 'config', 'config_name', 'test1', 0),
(3719, 12, 'config', 'config_payacc', '', 0),
(7017, 13, 'config', 'config_ajaxadvancedsearch_color_stockstatus', '', 0),
(7016, 13, 'config', 'config_ajaxadvancedsearch_color_pricehover', '', 0),
(7015, 13, 'config', 'config_ajaxadvancedsearch_color_price', '', 0),
(7014, 13, 'config', 'config_ajaxadvancedsearch_color_manufacturerhover', '', 0),
(7013, 13, 'config', 'config_ajaxadvancedsearch_color_manufacturer', '', 0),
(7012, 13, 'config', 'config_ajaxadvancedsearch_color_modelhover', '', 0),
(7011, 13, 'config', 'config_ajaxadvancedsearch_color_model', '', 0),
(7010, 13, 'config', 'config_ajaxadvancedsearch_color_headinghover', '', 0),
(7009, 13, 'config', 'config_ajaxadvancedsearch_color_heading', '', 0),
(7008, 13, 'config', 'config_ajaxadvancedsearch_color_defaulthover', '', 0),
(7007, 13, 'config', 'config_ajaxadvancedsearch_color_default', '', 0),
(7006, 13, 'config', 'config_ajaxadvancedsearch_colordefaultall', '0', 0),
(7005, 13, 'config', 'config_ajaxadvancedsearch_colorenabletall', '0', 0),
(7004, 13, 'config', 'config_ajaxadvancedsearch_highlight', '0', 0),
(7003, 13, 'config', 'config_ajaxadvancedsearch_color_highlighthover', '', 0),
(7002, 13, 'config', 'config_ajaxadvancedsearch_color_highlight', '', 0),
(7001, 13, 'config', 'config_ajaxadvancedsearch_result_view', 'default-view', 0),
(7000, 13, 'config', 'config_ajaxadvancedsearch_image_height', '50', 0),
(6999, 13, 'config', 'config_ajaxadvancedsearch_image_width', '50', 0),
(6998, 13, 'config', 'config_ajaxadvancedsearch_image', '1', 0),
(6997, 13, 'config', 'config_ajaxadvancedsearch_charlimit', '', 0),
(6996, 13, 'config', 'config_ajaxadvancedsearch_limit', '', 0),
(6995, 13, 'config', 'config_ajaxadvancedsearch', '1', 0),
(6994, 13, 'config', 'config_image_location_height', '180', 0),
(6993, 13, 'config', 'config_image_location_width', '240', 0),
(6992, 13, 'config', 'config_image_cart_height', '80', 0),
(6991, 13, 'config', 'config_image_cart_width', '80', 0),
(6990, 13, 'config', 'config_image_wishlist_height', '50', 0),
(6989, 13, 'config', 'config_image_wishlist_width', '50', 0),
(6988, 13, 'config', 'config_image_compare_height', '90', 0),
(6987, 13, 'config', 'config_image_compare_width', '90', 0),
(6986, 13, 'config', 'config_image_related_height', '80', 0),
(6985, 13, 'config', 'config_image_related_width', '80', 0),
(6984, 13, 'config', 'config_image_additional_height', '74', 0),
(6983, 13, 'config', 'config_image_additional_width', '74', 0),
(6982, 13, 'config', 'config_image_product_height', '80', 0),
(6981, 13, 'config', 'config_image_product_width', '80', 0),
(6980, 13, 'config', 'config_image_popup_height', '500', 0),
(6979, 13, 'config', 'config_image_popup_width', '500', 0),
(6978, 13, 'config', 'config_image_thumb_height', '228', 0),
(6977, 13, 'config', 'config_image_thumb_width', '228', 0),
(6976, 13, 'config', 'config_image_category_height', '80', 0),
(6975, 13, 'config', 'config_image_category_width', '80', 0),
(6974, 13, 'config', 'config_icon', '', 0),
(6973, 13, 'config', 'config_logo', '', 0),
(6972, 13, 'config', 'config_stock_checkout', '0', 0),
(6971, 13, 'config', 'config_stock_display', '0', 0),
(6970, 13, 'config', 'config_order_status_id', '7', 0),
(6969, 13, 'config', 'config_checkout_id', '0', 0),
(6968, 13, 'config', 'config_checkout_guest', '0', 0),
(6967, 13, 'config', 'config_cart_weight', '0', 0),
(6966, 13, 'config', 'config_account_id', '0', 0),
(6965, 13, 'config', 'config_customer_price', '0', 0),
(6964, 13, 'config', 'config_customer_group_id', '1', 0),
(6963, 13, 'config', 'config_tax_customer', '', 0),
(6962, 13, 'config', 'config_tax_default', '', 0),
(6961, 13, 'config', 'config_tax', '0', 0),
(6960, 13, 'config', 'config_product_description_length', '100', 0),
(6959, 13, 'config', 'config_product_limit', '15', 0),
(6958, 13, 'config', 'config_currency', 'USD', 0),
(6957, 13, 'config', 'config_language', 'en', 0),
(6956, 13, 'config', 'config_zone_id', '3563', 0),
(6955, 13, 'config', 'config_country_id', '222', 0),
(6954, 13, 'config', 'config_layout_id', '6', 0),
(6953, 13, 'config', 'config_template', 'coolbaby', 0),
(6952, 13, 'config', 'config_meta_keyword', '', 0),
(6951, 13, 'config', 'config_meta_description', '', 0),
(6950, 13, 'config', 'config_meta_title', 'clothfarm', 0),
(6949, 13, 'config', 'config_comment', '', 0),
(6948, 13, 'config', 'config_open', '', 0),
(6947, 13, 'config', 'config_image', '', 0),
(6946, 13, 'config', 'config_fax', '', 0),
(6945, 13, 'config', 'config_geocode', '', 0),
(6944, 13, 'config', 'config_address', 'Ajman', 0),
(6943, 13, 'config', 'config_ssl', '', 0),
(6942, 13, 'config', 'config_url', 'www.clothfarm.com', 0),
(6941, 13, 'config', 'config_telephone', '05012345678', 0),
(6940, 13, 'config', 'config_email', 'sales@kenzco.com', 0),
(6939, 13, 'config', 'config_owner', 'TEST', 0),
(6938, 13, 'config', 'config_name', 'TEST', 0),
(3934, 14, 'config', 'config_email', 'test2@gmail.com', 0),
(3935, 14, 'config', 'config_telephone', '123456789', 0),
(3936, 14, 'config', 'config_name', 'test2', 0),
(3937, 14, 'config', 'config_owner', 'test2', 0),
(3938, 14, 'config', 'config_country_id', '222', 0),
(3939, 14, 'config', 'config_zone_id', '3563', 0),
(3940, 14, 'config', 'config_address', 'test123 test123 test123', 0),
(3941, 14, 'config', 'config_payacc', '', 0),
(3942, 14, 'config', 'config_icon', '', 0),
(3943, 14, 'config', 'config_logo', '', 0),
(3944, 14, 'config', 'config_stock_checkout', '', 0),
(3945, 14, 'config', 'config_stock_display', '', 0),
(3946, 14, 'config', 'config_order_status_id', '', 0),
(3947, 14, 'config', 'config_checkout_id', '', 0),
(3948, 14, 'config', 'config_checkout_guest', '', 0),
(3949, 14, 'config', 'config_cart_weight', '', 0),
(3950, 14, 'config', 'config_account_id', '', 0),
(3951, 14, 'config', 'config_customer_price', '', 0),
(3952, 14, 'config', 'config_customer_group_id', '', 0),
(3953, 14, 'config', 'config_tax_customer', '', 0),
(3954, 14, 'config', 'config_tax_default', '', 0),
(3955, 14, 'config', 'config_tax', '', 0),
(3956, 14, 'config', 'config_layout_id', '', 0),
(3957, 14, 'config', 'config_template', '', 0),
(3958, 14, 'config', 'config_meta_keyword', '', 0),
(3959, 14, 'config', 'config_meta_description', '', 0),
(3960, 14, 'config', 'config_meta_title', '', 0),
(3961, 14, 'config', 'config_comment', '', 0),
(3962, 14, 'config', 'config_open', '', 0),
(3963, 14, 'config', 'config_image', '', 0),
(3964, 14, 'config', 'config_fax', '', 0),
(3965, 14, 'config', 'config_geocode', '', 0),
(3966, 14, 'config', 'config_ssl', '', 0),
(3967, 14, 'config', 'config_url', '', 0),
(3968, 14, 'config', 'config_language', 'en', 0),
(3969, 14, 'config', 'config_currency', 'USD', 0),
(3970, 14, 'config', 'config_product_limit', '15', 0),
(3971, 14, 'config', 'config_product_description_length', '100', 0),
(3972, 14, 'config', 'config_image_category_width', '80', 0),
(3973, 14, 'config', 'config_image_category_height', '80', 0),
(3974, 14, 'config', 'config_image_thumb_width', '228', 0),
(3975, 14, 'config', 'config_image_thumb_height', '228', 0),
(3976, 14, 'config', 'config_image_popup_width', '500', 0),
(3977, 14, 'config', 'config_image_popup_height', '500', 0),
(3978, 14, 'config', 'config_image_product_width', '80', 0),
(3979, 14, 'config', 'config_image_product_height', '80', 0),
(3980, 14, 'config', 'config_image_additional_width', '74', 0),
(3981, 14, 'config', 'config_image_additional_height', '74', 0),
(3982, 14, 'config', 'config_image_related_width', '80', 0),
(3983, 14, 'config', 'config_image_related_height', '80', 0),
(3984, 14, 'config', 'config_image_compare_width', '90', 0),
(3985, 14, 'config', 'config_image_compare_height', '90', 0),
(3986, 14, 'config', 'config_image_wishlist_width', '50', 0),
(3987, 14, 'config', 'config_image_wishlist_height', '50', 0),
(3988, 14, 'config', 'config_image_cart_width', '80', 0),
(3989, 14, 'config', 'config_image_cart_height', '80', 0),
(3990, 14, 'config', 'config_image_location_width', '240', 0),
(3991, 14, 'config', 'config_image_location_height', '180', 0),
(3992, 14, 'config', 'config_secure', '0', 0),
(3993, 14, 'config', 'config_commission', '10', 0),
(6073, 0, 'config', 'config_checkout_guest', '1', 0),
(6072, 0, 'config', 'config_cart_weight', '1', 0),
(6071, 0, 'config', 'config_api_id', '1', 0),
(6069, 0, 'config', 'config_account_mail', '1', 0),
(6070, 0, 'config', 'config_invoice_prefix', 'INV-2013-00', 0),
(6068, 0, 'config', 'config_account_id', '3', 0),
(6067, 0, 'config', 'config_login_attempts', '5', 0),
(6066, 0, 'config', 'config_customer_price', '1', 0),
(6065, 0, 'config', 'config_customer_group_display', 'a:1:{i:0;s:1:"1";}', 1),
(6064, 0, 'config', 'config_customer_group_id', '1', 0),
(6063, 0, 'config', 'config_customer_online', '1', 0),
(6062, 0, 'config', 'config_tax_customer', '', 0),
(6061, 0, 'config', 'config_tax_default', '', 0),
(6060, 0, 'config', 'config_tax', '0', 0),
(6059, 0, 'config', 'config_voucher_max', '1000', 0),
(6058, 0, 'config', 'config_voucher_min', '1', 0),
(6057, 0, 'config', 'config_review_mail', '0', 0),
(6056, 0, 'config', 'config_review_guest', '1', 0),
(6052, 0, 'config', 'config_product_limit', '15', 0),
(6053, 0, 'config', 'config_product_description_length', '100', 0),
(6054, 0, 'config', 'config_limit_admin', '20', 0),
(6055, 0, 'config', 'config_review_status', '1', 0),
(6051, 0, 'config', 'config_product_count', '1', 0),
(6050, 0, 'config', 'config_weight_class_id', '1', 0),
(6049, 0, 'config', 'config_length_class_id', '1', 0),
(6047, 0, 'config', 'config_currency', 'AED', 0),
(6048, 0, 'config', 'config_currency_auto', '1', 0),
(6044, 0, 'config', 'config_zone_id', '3507', 0),
(6045, 0, 'config', 'config_language', 'en', 0),
(6046, 0, 'config', 'config_admin_language', 'en', 0),
(6043, 0, 'config', 'config_country_id', '221', 0),
(6042, 0, 'config', 'config_layout_id', '4', 0),
(4327, 10, 'config', 'config_ajaxadvancedsearch_stock', '0', 0),
(4328, 10, 'config', 'config_ajaxadvancedsearch_quantity', '0', 0),
(4329, 10, 'config', 'config_ajaxadvancedsearch_model_search', '0', 0),
(4330, 10, 'config', 'config_ajaxadvancedsearch_tag', '0', 0),
(4331, 10, 'config', 'config_ajaxadvancedsearch_mpn', '0', 0),
(4332, 10, 'config', 'config_ajaxadvancedsearch_manufacturer_search', '0', 0),
(4333, 10, 'config', 'config_ajaxadvancedsearch_isbn', '0', 0),
(4334, 10, 'config', 'config_ajaxadvancedsearch_jan', '0', 0),
(4335, 10, 'config', 'config_ajaxadvancedsearch_ean', '0', 0),
(4336, 10, 'config', 'config_ajaxadvancedsearch_upc', '0', 0),
(4337, 10, 'config', 'config_ajaxadvancedsearch_sku', '0', 0),
(4338, 10, 'config', 'config_secure', '0', 0),
(4339, 10, 'config', 'config_commission', '10', 0),
(4340, 10, 'config', 'config_payacc', '', 0),
(5226, 0, 'veplatform', 'veplatform_status', '1', 0),
(5228, 0, 'veplatform_config', 'veplatform_config', 'a:4:{s:6:"ve_tag";s:76:"//config1.veinteractive.com/tags/DE6E597D/F7A0/428D/BB35/038288198CCB/tag.js";s:8:"ve_pixel";s:104:"//drs2.veinteractive.com/DataReceiverService.asmx/Pixel?journeycode=DE6E597D-F7A0-428D-BB35-038288198CCB";s:8:"ve_token";s:24:"h8B+qvCN3V0T1LED20Vu/Q==";s:11:"ve_products";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:5;}}', 1),
(5399, 15, 'config', 'config_email', 'rajamanikandan@exlcart.com', 0),
(5400, 15, 'config', 'config_telephone', '123456789', 0),
(5401, 15, 'config', 'config_name', 'RaJA', 0),
(5402, 15, 'config', 'config_owner', 'test', 0),
(5403, 15, 'config', 'config_country_id', '221', 0),
(5404, 15, 'config', 'config_zone_id', '3507', 0),
(5405, 15, 'config', 'config_address', 'test test test test', 0),
(5406, 15, 'config', 'config_payacc', '', 0),
(5407, 15, 'config', 'config_icon', '', 0),
(5408, 15, 'config', 'config_logo', '', 0),
(5409, 15, 'config', 'config_stock_checkout', '', 0),
(5410, 15, 'config', 'config_stock_display', '', 0),
(6830, 0, 'customisation', 'customisation_products_store', 'a:18:{s:20:"product_catalog_mode";a:6:{i:0;s:1:"0";i:9;s:1:"0";i:10;s:1:"0";i:12;s:1:"0";i:13;s:1:"0";i:14;s:1:"0";}s:20:"product_listing_type";a:6:{i:0;s:17:"small_with_column";i:9;s:17:"small_with_column";i:10;s:17:"small_with_column";i:12;s:17:"small_with_column";i:13;s:17:"small_with_column";i:14;s:17:"small_with_column";}s:18:"quick_sliders_type";a:6:{i:0;s:1:"1";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";}s:24:"quick_sliders_slick_type";a:6:{i:0;s:1:"1";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";}s:18:"quick_listing_type";a:6:{i:0;s:1:"1";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";}s:11:"sale_status";a:6:{i:0;s:1:"1";i:9;s:1:"0";i:10;s:1:"0";i:12;s:1:"0";i:13;s:1:"0";i:14;s:1:"0";}s:13:"sale_label_bg";a:6:{i:0;s:0:"";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";}s:10:"new_status";a:6:{i:0;s:1:"1";i:9;s:1:"0";i:10;s:1:"0";i:12;s:1:"0";i:13;s:1:"0";i:14;s:1:"0";}s:4:"days";a:6:{i:0;s:4:"1000";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";}s:12:"new_label_bg";a:6:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1974&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1974&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1974&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1974&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1974&lt;/b&gt;";}s:17:"discount_label_bg";a:6:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1985&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1985&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1985&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1985&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1985&lt;/b&gt;";}s:12:"quick_status";a:6:{i:0;s:1:"1";i:9;s:1:"0";i:10;s:1:"0";i:12;s:1:"0";i:13;s:1:"0";i:14;s:1:"0";}s:15:"discount_status";a:6:{i:0;s:1:"1";i:9;s:1:"0";i:10;s:1:"0";i:12;s:1:"0";i:13;s:1:"0";i:14;s:1:"0";}s:16:"countdown_status";a:6:{i:0;s:1:"1";i:9;s:1:"0";i:10;s:1:"0";i:12;s:1:"0";i:13;s:1:"0";i:14;s:1:"0";}s:18:"popup_small_status";a:6:{i:0;s:1:"1";i:9;s:1:"0";i:10;s:1:"0";i:12;s:1:"0";i:13;s:1:"0";i:14;s:1:"0";}s:7:"related";a:6:{i:0;s:6:"enable";i:9;s:6:"enable";i:10;s:6:"enable";i:12;s:6:"enable";i:13;s:6:"enable";i:14;s:167:"Notice: Undefined offset: 14 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 2121 value=&quot;enable&quot;&gt;Enable Related block";}s:11:"video_image";a:6:{i:0;s:17:"product-video.jpg";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";}s:19:"product_page_button";a:6:{i:0;s:770:"&lt;span class=&quot;pull-left&quot;&gt;Share:&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;\r\n&lt;ul class=&quot;socials&quot;&gt;\r\n    &lt;li&gt;&lt;a href=&quot;https://www.facebook.com/&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;https://twitter.com/&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;https://www.google.com&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n    &lt;li&gt;&lt;a href=&quot;https://www.pinterest.com/&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;/ul&gt;\r\n";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";}}', 1),
(6826, 0, 'customisation', 'customisation_general_store', 'a:42:{s:9:"preloader";a:1:{i:0;s:1:"1";}s:13:"homepage_mode";a:7:{i:0;s:4:"full";i:9;s:4:"full";i:10;s:4:"full";i:12;s:4:"full";i:13;s:4:"full";i:14;s:4:"full";i:15;s:4:"full";}s:14:"back_top_arrow";a:7:{i:0;s:21:"icon-scroll-arrow.png";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:14:"back_top_mouse";a:7:{i:0;s:21:"icon-scroll-mouse.png";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:15:"back_top_status";a:1:{i:0;s:1:"1";}s:12:"search_block";a:1:{i:0;s:1:"1";}s:11:"cart_button";a:1:{i:0;s:1:"1";}s:22:"header_service_buttons";a:1:{i:0;s:1:"1";}s:11:"footerpopup";a:1:{i:0;s:1:"1";}s:8:"css_file";a:1:{i:0;s:1:"0";}s:12:"phone_number";a:1:{i:0;s:1:"1";}i:1;a:17:{s:15:"welcome_message";a:7:{i:0;s:20:"Farm Your Fashion...";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:22:"customitem_item_title1";a:7:{i:0;s:11:"Be A vendor";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:15:"blog_link_title";a:7:{i:0;s:4:"blog";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:16:"pages_link_title";a:7:{i:0;s:7:"Farm Us";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:17:"contact_map_title";a:7:{i:0;s:10:"contact us";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:20:"footer_socials_title";a:7:{i:0;s:7:"FIND US";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:17:"custom_html_title";a:7:{i:0;s:11:"We are here";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:16:"customblock_html";a:7:{i:0;s:889:"&lt;ul class=&quot;menu menu-icon&quot;&gt;\r\n    &lt;li&gt;&lt;span class=&quot;icon flaticon-home113&quot;&gt;&lt;/span&gt;Ajman Freezone&lt;/li&gt;\r\n    &lt;li&gt;&lt;span class=&quot;icon flaticon-phone163&quot;&gt;&lt;/span&gt;050 40 40 919 / 06 740 77 96&lt;/li&gt;\r\n    &lt;li&gt;sales@clothfarm.com&lt;/li&gt;\r\n    &lt;li&gt;clothfarm.com&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;!--Start of Zopim Live Chat Script--&gt;&lt;script type=&quot;text/javascript&quot;&gt;window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set._.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute(''charset'',''utf-8'');$.src=''//v2.zopim.com/?3WiB2HeXWfLvW0vRZz2H7gytRGtXYXIf'';z.t=+new Date;$.type=''text/javascript'';e.parentNode.insertBefore($,e)})(document,''script'');&lt;/script&gt;&lt;!--End of Zopim Live Chat Script--&gt;";i:9;s:29:"&lt;p&gt;&lt;br&gt;&lt;/p&gt;";i:10;s:29:"&lt;p&gt;&lt;br&gt;&lt;/p&gt;";i:12;s:29:"&lt;p&gt;&lt;br&gt;&lt;/p&gt;";i:13;s:29:"&lt;p&gt;&lt;br&gt;&lt;/p&gt;";i:14;s:29:"&lt;p&gt;&lt;br&gt;&lt;/p&gt;";i:15;s:29:"&lt;p&gt;&lt;br&gt;&lt;/p&gt;";}s:16:"newsletter_title";a:7:{i:0;s:17:"NEWSLETTER SIGNUP";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:16:"newsletter_promo";a:7:{i:0;s:86:"Enter your email and we''ll keep you updated with latest products and discount coupons.";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:22:"newsletter_placeholder";a:7:{i:0;s:14:"YOUR E-MAIL...";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:17:"newsletter_button";a:7:{i:0;s:9:"SUBSCRIBE";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:16:"newsletter_close";a:7:{i:0;s:29:"Don''t want to see this again.";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:14:"preloader_html";a:7:{i:0;s:29:"&lt;p&gt;&lt;br&gt;&lt;/p&gt;";i:9;s:29:"&lt;p&gt;&lt;br&gt;&lt;/p&gt;";i:10;s:29:"&lt;p&gt;&lt;br&gt;&lt;/p&gt;";i:12;s:29:"&lt;p&gt;&lt;br&gt;&lt;/p&gt;";i:13;s:29:"&lt;p&gt;&lt;br&gt;&lt;/p&gt;";i:14;s:29:"&lt;p&gt;&lt;br&gt;&lt;/p&gt;";i:15;s:29:"&lt;p&gt;&lt;br&gt;&lt;/p&gt;";}s:9:"sale_text";a:6:{i:0;s:4:"SALE";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";}s:8:"new_text";a:6:{i:0;s:3:"NEW";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";}s:15:"quick_view_text";a:6:{i:0;s:10:"quick view";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";}}s:11:"header_type";a:7:{i:0;s:1:"1";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:1:"1";}s:20:"service_buttons_type";a:7:{i:0;s:1:"1";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:1:"1";}s:13:"top_menu_type";a:7:{i:0;s:1:"1";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:1:"1";}s:16:"category_divider";a:1:{i:0;s:1:"1";}s:20:"customitem_item_url1";a:7:{i:0;s:51:"http://clothfarm.com/index.php?route=account/seller";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:16:"blog_link_status";a:1:{i:0;s:1:"0";}s:13:"blog_link_url";a:7:{i:0;s:35:"index.php?route=simple_blog/article";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:14:"pages_link_url";a:7:{i:0;s:0:"";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:12:"pages_status";a:1:{i:0;s:1:"1";}s:18:"contact_map_status";a:1:{i:0;s:1:"1";}s:18:"additional_page_id";a:14:{i:10;s:2:"10";i:4;s:1:"4";i:18;s:2:"18";i:6;s:1:"6";i:15;s:2:"15";i:16;s:2:"16";i:17;s:2:"17";i:14;s:2:"14";i:3;s:1:"3";i:21;s:2:"21";i:19;s:2:"19";i:5;s:1:"5";i:12;s:2:"12";i:20;s:2:"20";}s:22:"additional_page_status";a:14:{i:10;a:7:{i:0;s:1:"1";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:147:"Notice: Undefined offset: 15 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 551 value=&quot;1&quot;&gt;Enable";}i:4;a:7:{i:0;s:1:"0";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:147:"Notice: Undefined offset: 15 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 551 value=&quot;1&quot;&gt;Enable";}i:18;a:7:{i:0;s:1:"1";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:147:"Notice: Undefined offset: 15 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 551 value=&quot;1&quot;&gt;Enable";}i:6;a:7:{i:0;s:1:"0";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:147:"Notice: Undefined offset: 15 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 551 value=&quot;1&quot;&gt;Enable";}i:15;a:7:{i:0;s:1:"0";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:147:"Notice: Undefined offset: 15 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 551 value=&quot;1&quot;&gt;Enable";}i:16;a:7:{i:0;s:1:"0";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:147:"Notice: Undefined offset: 15 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 551 value=&quot;1&quot;&gt;Enable";}i:17;a:7:{i:0;s:1:"1";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:147:"Notice: Undefined offset: 15 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 551 value=&quot;1&quot;&gt;Enable";}i:14;a:7:{i:0;s:1:"0";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:147:"Notice: Undefined offset: 15 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 551 value=&quot;1&quot;&gt;Enable";}i:3;a:7:{i:0;s:1:"0";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:147:"Notice: Undefined offset: 15 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 551 value=&quot;1&quot;&gt;Enable";}i:21;a:7:{i:0;s:1:"1";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:147:"Notice: Undefined offset: 15 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 551 value=&quot;1&quot;&gt;Enable";}i:19;a:7:{i:0;s:1:"1";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:147:"Notice: Undefined offset: 15 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 551 value=&quot;1&quot;&gt;Enable";}i:5;a:7:{i:0;s:1:"0";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:147:"Notice: Undefined offset: 15 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 551 value=&quot;1&quot;&gt;Enable";}i:12;a:7:{i:0;s:1:"0";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:147:"Notice: Undefined offset: 15 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 551 value=&quot;1&quot;&gt;Enable";}i:20;a:7:{i:0;s:1:"1";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:147:"Notice: Undefined offset: 15 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 551 value=&quot;1&quot;&gt;Enable";}}s:31:"additional_page_checkout_status";a:7:{i:0;s:1:"0";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:147:"Notice: Undefined offset: 15 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 562 value=&quot;1&quot;&gt;Enable";}s:30:"additional_page_account_status";a:7:{i:0;s:1:"1";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:147:"Notice: Undefined offset: 15 in /home/clothfarm/public_html/admin/view/template/module/options_stores.php on line 572 value=&quot;1&quot;&gt;Enable";}s:11:"footer_type";a:7:{i:0;s:1:"2";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:1:"1";}s:15:"footercopyright";a:7:{i:0;s:121:"&amp;copy; 2015 &lt;a href=&quot;index.php&quot;&gt;clothfarm&lt;/a&gt;. All Rights Reserved. A Kenz Concepts Enterprise.";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:7:"socials";a:7:{i:0;s:1088:"&lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-facebook12&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-twitter20&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-google10&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-pinterest9&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-linkedin11&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-youtube18&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-instagram&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;a href=&quot;index.php&quot;&gt;&lt;span class=&quot;icon flaticon-skype12&quot;&gt;&lt;/span&gt;&lt;/a&gt;&lt;/li&gt;\r\n";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:14:"socials_status";a:1:{i:0;s:1:"1";}s:13:"footerpayment";a:7:{i:0;s:755:"&lt;li&gt;&lt;img src=&quot;image/catalog/blocks/icon-payment-01.png&quot; width=&quot;36&quot; height=&quot;22&quot; alt=&quot;&quot;&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;img src=&quot;image/catalog/blocks/icon-payment-02.png&quot; width=&quot;36&quot; height=&quot;22&quot; alt=&quot;&quot;&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;img src=&quot;image/catalog/blocks/icon-payment-03.png&quot; width=&quot;36&quot; height=&quot;22&quot; alt=&quot;&quot;&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;img src=&quot;image/catalog/blocks/icon-payment-04.png&quot; width=&quot;36&quot; height=&quot;22&quot; alt=&quot;&quot;&gt;&lt;/li&gt;\r\n&lt;li&gt;&lt;img src=&quot;image/catalog/blocks/icon-payment-05.png&quot; width=&quot;36&quot; height=&quot;22&quot; alt=&quot;&quot;&gt;&lt;/li&gt;\r\n";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:20:"footerpayment_status";a:1:{i:0;s:1:"1";}s:18:"customblock_status";a:1:{i:0;s:1:"1";}s:6:"apikey";a:7:{i:0;s:37:"f523a3b09e75d24ce6adc13992cf5ff5-us12";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:14:"list_unique_id";a:7:{i:0;s:10:"b6ee0dbcdb";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:17:"newsletter_status";a:1:{i:0;s:1:"1";}s:12:"share_block1";a:7:{i:0;s:24:"https://www.facebook.com";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:12:"share_block2";a:7:{i:0;s:19:"https://twitter.com";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:12:"share_block3";a:7:{i:0;s:23:"https://www.google.com/";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:12:"share_block4";a:7:{i:0;s:26:"https://www.pinterest.com/";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:9:"slick_row";a:7:{i:0;s:0:"";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:16:"preloader_status";a:7:{i:0;s:1:"1";i:9;s:1:"1";i:10;s:1:"1";i:12;s:1:"1";i:13;s:1:"1";i:14;s:1:"1";i:15;s:1:"1";}}', 1),
(6827, 0, 'customisation', 'customisation_slider_store', 'a:6:{s:13:"featured_type";a:7:{i:0;s:5:"slick";i:9;s:10:"horizontal";i:10;s:10:"horizontal";i:12;s:10:"horizontal";i:13;s:10:"horizontal";i:14;s:10:"horizontal";i:15;s:10:"horizontal";}s:11:"latest_type";a:7:{i:0;s:10:"horizontal";i:9;s:10:"horizontal";i:10;s:10:"horizontal";i:12;s:10:"horizontal";i:13;s:10:"horizontal";i:14;s:10:"horizontal";i:15;s:10:"horizontal";}s:15:"bestseller_type";a:7:{i:0;s:8:"vertical";i:9;s:10:"horizontal";i:10;s:10:"horizontal";i:12;s:10:"horizontal";i:13;s:10:"horizontal";i:14;s:10:"horizontal";i:15;s:10:"horizontal";}s:12:"popular_type";a:7:{i:0;s:8:"vertical";i:9;s:10:"horizontal";i:10;s:10:"horizontal";i:12;s:10:"horizontal";i:13;s:10:"horizontal";i:14;s:10:"horizontal";i:15;s:10:"horizontal";}s:12:"special_type";a:7:{i:0;s:8:"vertical";i:9;s:10:"horizontal";i:10;s:10:"horizontal";i:12;s:10:"horizontal";i:13;s:10:"horizontal";i:14;s:10:"horizontal";i:15;s:10:"horizontal";}s:11:"random_type";a:7:{i:0;s:8:"vertical";i:9;s:10:"horizontal";i:10;s:10:"horizontal";i:12;s:10:"horizontal";i:13;s:10:"horizontal";i:14;s:10:"horizontal";i:15;s:10:"horizontal";}}', 1),
(6828, 0, 'customisation', 'customisation_translation_store', 'a:1:{i:1;a:10:{s:8:"dd_title";a:7:{i:0;s:0:"";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:12:"view_details";a:7:{i:0;s:12:"view details";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:11:"share_title";a:7:{i:0;s:0:"";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:14:"tags_tab_title";a:7:{i:0;s:4:"tags";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:12:"brands_title";a:7:{i:0;s:6:"BRANDS";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:15:"countdown_title";a:7:{i:0;s:20:"special price valid:";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:19:"countdown_title_day";a:7:{i:0;s:1:"d";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:20:"countdown_title_hour";a:7:{i:0;s:3:"hrs";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:22:"countdown_title_minute";a:7:{i:0;s:3:"min";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:22:"countdown_title_second";a:7:{i:0;s:3:"sec";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}}}', 1);
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(6829, 0, 'customisation', 'customisation_colors_store', 'a:44:{s:11:"layout_skin";a:7:{i:0;s:7:"default";i:9;s:7:"default";i:10;s:7:"default";i:12;s:7:"default";i:13;s:7:"default";i:14;s:7:"default";i:15;s:7:"default";}s:15:"general_bgcolor";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1275&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1275&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1275&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1275&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1275&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1275&lt;/b&gt;";}s:9:"contentbg";a:7:{i:0;s:0:"";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:15:"content_bg_mode";a:7:{i:0;s:6:"repeat";i:9;s:6:"repeat";i:10;s:6:"repeat";i:12;s:6:"repeat";i:13;s:6:"repeat";i:14;s:6:"repeat";i:15;s:6:"repeat";}s:18:"general_themecolor";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1316&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1316&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1316&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1316&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1316&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1316&lt;/b&gt;";}s:12:"general_text";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1327&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1327&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1327&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1327&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1327&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1327&lt;/b&gt;";}s:12:"general_link";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1337&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1337&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1337&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1337&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1337&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1337&lt;/b&gt;";}s:13:"captions_font";a:5:{i:0;s:1:"-";i:9;s:1:"-";i:10;s:1:"-";i:12;s:1:"-";i:13;s:1:"-";}s:13:"captions_text";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1432&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1432&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1432&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1432&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1432&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1432&lt;/b&gt;";}s:15:"topline_bgcolor";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1443&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1443&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1443&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1443&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1443&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1443&lt;/b&gt;";}s:13:"topline_texts";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1449&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1449&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1449&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1449&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1449&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1449&lt;/b&gt;";}s:18:"header_icons_color";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1455&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1455&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1455&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1455&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1455&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1455&lt;/b&gt;";}s:15:"toolline_border";a:7:{i:0;s:0:"";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:12:"toolline_ink";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1473&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1473&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1473&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1473&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1473&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1473&lt;/b&gt;";}s:14:"toolline_icons";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1479&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1479&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1479&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1479&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1479&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1479&lt;/b&gt;";}s:16:"toolline_bgcolor";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1485&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1485&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1485&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1485&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1485&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1485&lt;/b&gt;";}s:16:"top_menu_bgcolor";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1497&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1497&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1497&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1497&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1497&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1497&lt;/b&gt;";}s:13:"topmenu_items";a:7:{i:0;s:0:"";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:18:"toopmenu_highlight";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1509&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1509&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1509&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1509&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1509&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1509&lt;/b&gt;";}s:11:"topmenu_hot";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1515&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1515&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1515&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1515&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1515&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1515&lt;/b&gt;";}s:11:"topmenu_new";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1522&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1522&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1522&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1522&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1522&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1522&lt;/b&gt;";}s:8:"promo_bg";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1533&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1533&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1533&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1533&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1533&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1533&lt;/b&gt;";}s:11:"promo_texts";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1539&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1539&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1539&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1539&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1539&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1539&lt;/b&gt;";}s:12:"circle_texts";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1545&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1545&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1545&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1545&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1545&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1545&lt;/b&gt;";}s:17:"container_bgcolor";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1557&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1557&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1557&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1557&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1557&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1557&lt;/b&gt;";}s:7:"blog_bg";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1563&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1563&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1563&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1563&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1563&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1563&lt;/b&gt;";}s:13:"blog_bg_image";a:7:{i:0;s:0:"";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";i:15;s:0:"";}s:12:"blog_bg_mode";a:7:{i:0;s:6:"repeat";i:9;s:6:"repeat";i:10;s:6:"repeat";i:12;s:6:"repeat";i:13;s:6:"repeat";i:14;s:6:"repeat";i:15;s:6:"repeat";}s:21:"newsletter_wrapper_bg";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1586&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1586&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1586&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1586&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1586&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1586&lt;/b&gt;";}s:13:"newsletter_bg";a:7:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1593&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1593&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1593&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1593&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1593&lt;/b&gt;";i:15;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 15 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1593&lt;/b&gt;";}s:14:"listing_border";a:6:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1605&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1605&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1605&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1605&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1605&lt;/b&gt;";}s:21:"listing_regular_price";a:6:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1612&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1612&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1612&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1612&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1612&lt;/b&gt;";}s:17:"listing_old_price";a:6:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1618&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1618&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1618&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1618&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1618&lt;/b&gt;";}s:21:"listing_special_price";a:6:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1626&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1626&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1626&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1626&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1626&lt;/b&gt;";}s:10:"price_font";a:5:{i:0;s:1:"-";i:9;s:1:"-";i:10;s:1:"-";i:12;s:1:"-";i:13;s:1:"-";}s:20:"footerpopup_captions";a:6:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1718&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1718&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1718&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1718&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1718&lt;/b&gt;";}s:16:"footerpopup_link";a:6:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1725&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1725&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1725&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1725&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1725&lt;/b&gt;";}s:19:"footerpopup_bgcolor";a:6:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1732&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1732&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1732&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1732&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1732&lt;/b&gt;";}s:17:"footerpopup_image";a:6:{i:0;s:0:"";i:9;s:0:"";i:10;s:0:"";i:12;s:0:"";i:13;s:0:"";i:14;s:0:"";}s:19:"footerpopup_bg_mode";a:6:{i:0;s:6:"repeat";i:9;s:6:"repeat";i:10;s:6:"repeat";i:12;s:6:"repeat";i:13;s:6:"repeat";i:14;s:6:"repeat";}s:21:"footerbottom_captions";a:6:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1764&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1764&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1764&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1764&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1764&lt;/b&gt;";}s:18:"footerbottom_texts";a:6:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1770&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1770&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1770&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1770&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1770&lt;/b&gt;";}s:15:"footerbottom_bg";a:6:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1776&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1776&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1776&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1776&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1776&lt;/b&gt;";}s:18:"footerbottom_icons";a:6:{i:0;s:0:"";i:9;s:174:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 9 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1782&lt;/b&gt;";i:10;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 10 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1782&lt;/b&gt;";i:12;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 12 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1782&lt;/b&gt;";i:13;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 13 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1782&lt;/b&gt;";i:14;s:175:"&lt;b&gt;Notice&lt;/b&gt;: Undefined offset: 14 in &lt;b&gt;/home/clothfarm/public_html/admin/view/template/module/options_stores.php&lt;/b&gt; on line &lt;b&gt;1782&lt;/b&gt;";}}', 1),
(6815, 0, 'smartmenu', 'smartmenu_status', '1', 0),
(6041, 0, 'config', 'config_template', 'coolbaby', 0),
(6040, 0, 'config', 'config_meta_keyword', '', 0),
(6039, 0, 'config', 'config_meta_description', 'An Online Fashion Retail Store', 0),
(6038, 0, 'config', 'config_paypal_merchant', 'rajamanikandan-facilitator@exlcart.com', 0),
(6037, 0, 'config', 'config_meta_title', 'Clothfarm.com', 0),
(6036, 0, 'config', 'config_comment', '', 0),
(6035, 0, 'config', 'config_open', 'MON-SAT: 10AM-8PM\r\nSUN: 11.30AM-5PM', 0),
(6034, 0, 'config', 'config_image', 'catalog/theme_logo.png', 0),
(6033, 0, 'config', 'config_fax', '', 0),
(6032, 0, 'config', 'config_telephone', '050 40 40 919', 0),
(6031, 0, 'config', 'config_email', 'site@clothfarm.com', 0),
(6030, 0, 'config', 'config_geocode', '', 0),
(6027, 0, 'config', 'config_name', 'Cloth Farm', 0),
(6028, 0, 'config', 'config_owner', 'Fayas', 0),
(6029, 0, 'config', 'config_address', 'Opp. Port &amp; Customs\r\nAjman Freezone\r\nAjman\r\n', 0),
(5501, 16, 'config', 'config_product_description_length', '100', 0),
(5502, 16, 'config', 'config_image_category_width', '80', 0),
(5503, 16, 'config', 'config_image_category_height', '80', 0),
(5504, 16, 'config', 'config_image_thumb_width', '228', 0),
(5505, 16, 'config', 'config_image_thumb_height', '228', 0),
(5506, 16, 'config', 'config_image_popup_width', '500', 0),
(5507, 16, 'config', 'config_image_popup_height', '500', 0),
(5508, 16, 'config', 'config_image_product_width', '80', 0),
(5509, 16, 'config', 'config_image_product_height', '80', 0),
(5510, 16, 'config', 'config_image_additional_width', '74', 0),
(5511, 16, 'config', 'config_image_additional_height', '74', 0),
(5512, 16, 'config', 'config_image_related_width', '80', 0),
(5513, 16, 'config', 'config_image_related_height', '80', 0),
(5514, 16, 'config', 'config_image_compare_width', '90', 0),
(5515, 16, 'config', 'config_image_compare_height', '90', 0),
(5516, 16, 'config', 'config_image_wishlist_width', '50', 0),
(5517, 16, 'config', 'config_image_wishlist_height', '50', 0),
(5518, 16, 'config', 'config_image_cart_width', '80', 0),
(5519, 16, 'config', 'config_image_cart_height', '80', 0),
(5520, 16, 'config', 'config_image_location_width', '240', 0),
(5521, 16, 'config', 'config_image_location_height', '180', 0),
(5522, 16, 'config', 'config_secure', '0', 0),
(5523, 16, 'config', 'config_commission', '10', 0),
(5524, 17, 'config', 'config_email', 'RAJAMANIAN@gmail.com', 0),
(5525, 17, 'config', 'config_telephone', '123456789', 0),
(5526, 17, 'config', 'config_name', 'RAJAMANIAN', 0),
(5527, 17, 'config', 'config_owner', 'RAJAMANIAN', 0),
(5528, 17, 'config', 'config_country_id', '221', 0),
(5529, 17, 'config', 'config_zone_id', '3507', 0),
(5530, 17, 'config', 'config_address', 'RAJAMANIAN RAJAMANIAN', 0),
(5531, 17, 'config', 'config_payacc', '', 0),
(5532, 17, 'config', 'config_icon', '', 0),
(5533, 17, 'config', 'config_logo', '', 0),
(5534, 17, 'config', 'config_stock_checkout', '', 0),
(5535, 17, 'config', 'config_stock_display', '', 0),
(5536, 17, 'config', 'config_order_status_id', '', 0),
(5537, 17, 'config', 'config_checkout_id', '', 0),
(5538, 17, 'config', 'config_checkout_guest', '', 0),
(5539, 17, 'config', 'config_cart_weight', '', 0),
(5540, 17, 'config', 'config_account_id', '', 0),
(5541, 17, 'config', 'config_customer_price', '', 0),
(5542, 17, 'config', 'config_customer_group_id', '', 0),
(5543, 17, 'config', 'config_tax_customer', '', 0),
(5544, 17, 'config', 'config_tax_default', '', 0),
(5545, 17, 'config', 'config_tax', '', 0),
(5546, 17, 'config', 'config_layout_id', '', 0),
(5547, 17, 'config', 'config_template', '', 0),
(5548, 17, 'config', 'config_meta_keyword', '', 0),
(5549, 17, 'config', 'config_meta_description', '', 0),
(5550, 17, 'config', 'config_meta_title', '', 0),
(5551, 17, 'config', 'config_comment', '', 0),
(5552, 17, 'config', 'config_open', '', 0),
(5553, 17, 'config', 'config_image', '', 0),
(5554, 17, 'config', 'config_fax', '', 0),
(5555, 17, 'config', 'config_geocode', '', 0),
(5556, 17, 'config', 'config_ssl', '', 0),
(5557, 17, 'config', 'config_url', '', 0),
(5558, 17, 'config', 'config_language', 'en', 0),
(5559, 17, 'config', 'config_currency', 'AED', 0),
(5560, 17, 'config', 'config_product_limit', '15', 0),
(5561, 17, 'config', 'config_product_description_length', '100', 0),
(5562, 17, 'config', 'config_image_category_width', '80', 0),
(5563, 17, 'config', 'config_image_category_height', '80', 0),
(5564, 17, 'config', 'config_image_thumb_width', '228', 0),
(5565, 17, 'config', 'config_image_thumb_height', '228', 0),
(5566, 17, 'config', 'config_image_popup_width', '500', 0),
(5567, 17, 'config', 'config_image_popup_height', '500', 0),
(5568, 17, 'config', 'config_image_product_width', '80', 0),
(5569, 17, 'config', 'config_image_product_height', '80', 0),
(5570, 17, 'config', 'config_image_additional_width', '74', 0),
(5571, 17, 'config', 'config_image_additional_height', '74', 0),
(5572, 17, 'config', 'config_image_related_width', '80', 0),
(5573, 17, 'config', 'config_image_related_height', '80', 0),
(5574, 17, 'config', 'config_image_compare_width', '90', 0),
(5575, 17, 'config', 'config_image_compare_height', '90', 0),
(5576, 17, 'config', 'config_image_wishlist_width', '50', 0),
(5577, 17, 'config', 'config_image_wishlist_height', '50', 0),
(5578, 17, 'config', 'config_image_cart_width', '80', 0),
(5579, 17, 'config', 'config_image_cart_height', '80', 0),
(5580, 17, 'config', 'config_image_location_width', '240', 0),
(5581, 17, 'config', 'config_image_location_height', '180', 0),
(5582, 17, 'config', 'config_secure', '0', 0),
(5583, 17, 'config', 'config_commission', '10', 0),
(5584, 18, 'config', 'config_email', 'RAJAMANIANAS@gmail.com', 0),
(5585, 18, 'config', 'config_telephone', '123456789', 0),
(5586, 18, 'config', 'config_name', 'aasasasas', 0),
(5587, 18, 'config', 'config_owner', 'sasasas', 0),
(5588, 18, 'config', 'config_country_id', '221', 0),
(5589, 18, 'config', 'config_zone_id', '3507', 0),
(5590, 18, 'config', 'config_address', 'asasasasasasas', 0),
(5591, 18, 'config', 'config_payacc', '', 0),
(5592, 18, 'config', 'config_icon', '', 0),
(5593, 18, 'config', 'config_logo', '', 0),
(5594, 18, 'config', 'config_stock_checkout', '', 0),
(5595, 18, 'config', 'config_stock_display', '', 0),
(5596, 18, 'config', 'config_order_status_id', '', 0),
(5597, 18, 'config', 'config_checkout_id', '', 0),
(5598, 18, 'config', 'config_checkout_guest', '', 0),
(5599, 18, 'config', 'config_cart_weight', '', 0),
(5600, 18, 'config', 'config_account_id', '', 0),
(5601, 18, 'config', 'config_customer_price', '', 0),
(5602, 18, 'config', 'config_customer_group_id', '', 0),
(5603, 18, 'config', 'config_tax_customer', '', 0),
(5604, 18, 'config', 'config_tax_default', '', 0),
(5605, 18, 'config', 'config_tax', '', 0),
(5606, 18, 'config', 'config_layout_id', '', 0),
(5607, 18, 'config', 'config_template', '', 0),
(5608, 18, 'config', 'config_meta_keyword', '', 0),
(5609, 18, 'config', 'config_meta_description', '', 0),
(5610, 18, 'config', 'config_meta_title', '', 0),
(5611, 18, 'config', 'config_comment', '', 0),
(5612, 18, 'config', 'config_open', '', 0),
(5613, 18, 'config', 'config_image', '', 0),
(5614, 18, 'config', 'config_fax', '', 0),
(5615, 18, 'config', 'config_geocode', '', 0),
(5616, 18, 'config', 'config_ssl', '', 0),
(5617, 18, 'config', 'config_url', '', 0),
(5618, 18, 'config', 'config_language', 'en', 0),
(5619, 18, 'config', 'config_currency', 'AED', 0),
(5620, 18, 'config', 'config_product_limit', '15', 0),
(5621, 18, 'config', 'config_product_description_length', '100', 0),
(5622, 18, 'config', 'config_image_category_width', '80', 0),
(5623, 18, 'config', 'config_image_category_height', '80', 0),
(5624, 18, 'config', 'config_image_thumb_width', '228', 0),
(5625, 18, 'config', 'config_image_thumb_height', '228', 0),
(5626, 18, 'config', 'config_image_popup_width', '500', 0),
(5627, 18, 'config', 'config_image_popup_height', '500', 0),
(5628, 18, 'config', 'config_image_product_width', '80', 0),
(5629, 18, 'config', 'config_image_product_height', '80', 0),
(5630, 18, 'config', 'config_image_additional_width', '74', 0),
(5631, 18, 'config', 'config_image_additional_height', '74', 0),
(5632, 18, 'config', 'config_image_related_width', '80', 0),
(5633, 18, 'config', 'config_image_related_height', '80', 0),
(5634, 18, 'config', 'config_image_compare_width', '90', 0),
(5635, 18, 'config', 'config_image_compare_height', '90', 0),
(5636, 18, 'config', 'config_image_wishlist_width', '50', 0),
(5637, 18, 'config', 'config_image_wishlist_height', '50', 0),
(5638, 18, 'config', 'config_image_cart_width', '80', 0),
(5639, 18, 'config', 'config_image_cart_height', '80', 0),
(5640, 18, 'config', 'config_image_location_width', '240', 0),
(5641, 18, 'config', 'config_image_location_height', '180', 0),
(5642, 18, 'config', 'config_secure', '0', 0),
(5643, 18, 'config', 'config_commission', '10', 0),
(6789, 19, 'config', 'config_payacc', '', 0),
(6787, 19, 'config', 'config_secure', '0', 0),
(6788, 19, 'config', 'config_commission', '10', 0),
(6786, 19, 'config', 'config_ajaxadvancedsearch_sku', '0', 0),
(6785, 19, 'config', 'config_ajaxadvancedsearch_upc', '0', 0),
(6784, 19, 'config', 'config_ajaxadvancedsearch_ean', '0', 0),
(6781, 19, 'config', 'config_ajaxadvancedsearch_manufacturer_search', '0', 0),
(6783, 19, 'config', 'config_ajaxadvancedsearch_jan', '0', 0),
(6782, 19, 'config', 'config_ajaxadvancedsearch_isbn', '0', 0),
(6780, 19, 'config', 'config_ajaxadvancedsearch_mpn', '0', 0),
(6779, 19, 'config', 'config_ajaxadvancedsearch_tag', '0', 0),
(6778, 19, 'config', 'config_ajaxadvancedsearch_model_search', '0', 0),
(6777, 19, 'config', 'config_ajaxadvancedsearch_quantity', '0', 0),
(6776, 19, 'config', 'config_ajaxadvancedsearch_stock', '0', 0),
(6775, 19, 'config', 'config_ajaxadvancedsearch_rating', '0', 0),
(6774, 19, 'config', 'config_ajaxadvancedsearch_pricelogin', '0', 0),
(6773, 19, 'config', 'config_ajaxadvancedsearch_price', '0', 0),
(6770, 19, 'config', 'config_ajaxadvancedsearch_model', '0', 0),
(6771, 19, 'config', 'config_ajaxadvancedsearch_descr', '0', 0),
(6772, 19, 'config', 'config_ajaxadvancedsearch_manufacturer', '0', 0),
(6769, 19, 'config', 'config_ajaxadvancedsearch_displayallresults', '0', 0),
(6768, 19, 'config', 'config_ajaxadvancedsearch_color_resulthover', '', 0),
(6766, 19, 'config', 'config_ajaxadvancedsearch_color_evenresult', '', 0),
(6767, 19, 'config', 'config_ajaxadvancedsearch_color_oddresult', '', 0),
(6764, 19, 'config', 'config_ajaxadvancedsearch_color_quantity', '', 0),
(6765, 19, 'config', 'config_ajaxadvancedsearch_color_quantityhover', '', 0),
(6762, 19, 'config', 'config_ajaxadvancedsearch_color_stockstatus', '', 0),
(6763, 19, 'config', 'config_ajaxadvancedsearch_color_stockstatushover', '', 0),
(6761, 19, 'config', 'config_ajaxadvancedsearch_color_pricehover', '', 0),
(6758, 19, 'config', 'config_ajaxadvancedsearch_color_manufacturer', '', 0),
(6759, 19, 'config', 'config_ajaxadvancedsearch_color_manufacturerhover', '', 0),
(6760, 19, 'config', 'config_ajaxadvancedsearch_color_price', '', 0),
(6757, 19, 'config', 'config_ajaxadvancedsearch_color_modelhover', '', 0),
(6755, 19, 'config', 'config_ajaxadvancedsearch_color_headinghover', '', 0),
(6756, 19, 'config', 'config_ajaxadvancedsearch_color_model', '', 0),
(6754, 19, 'config', 'config_ajaxadvancedsearch_color_heading', '', 0),
(6753, 19, 'config', 'config_ajaxadvancedsearch_color_defaulthover', '', 0),
(6751, 19, 'config', 'config_ajaxadvancedsearch_colordefaultall', '0', 0),
(6752, 19, 'config', 'config_ajaxadvancedsearch_color_default', '', 0),
(6749, 19, 'config', 'config_ajaxadvancedsearch_highlight', '0', 0),
(6750, 19, 'config', 'config_ajaxadvancedsearch_colorenabletall', '0', 0),
(6747, 19, 'config', 'config_ajaxadvancedsearch_color_highlight', '', 0),
(6748, 19, 'config', 'config_ajaxadvancedsearch_color_highlighthover', '', 0),
(6746, 19, 'config', 'config_ajaxadvancedsearch_result_view', 'default-view', 0),
(6745, 19, 'config', 'config_ajaxadvancedsearch_image_height', '50', 0),
(6744, 19, 'config', 'config_ajaxadvancedsearch_image_width', '50', 0),
(6743, 19, 'config', 'config_ajaxadvancedsearch_image', '1', 0),
(6742, 19, 'config', 'config_ajaxadvancedsearch_charlimit', '', 0);
INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(6741, 19, 'config', 'config_ajaxadvancedsearch_limit', '', 0),
(6740, 19, 'config', 'config_ajaxadvancedsearch', '1', 0),
(6739, 19, 'config', 'config_image_location_height', '180', 0),
(6738, 19, 'config', 'config_image_location_width', '240', 0),
(6737, 19, 'config', 'config_image_cart_height', '80', 0),
(6736, 19, 'config', 'config_image_cart_width', '80', 0),
(6735, 19, 'config', 'config_image_wishlist_height', '50', 0),
(6734, 19, 'config', 'config_image_wishlist_width', '50', 0),
(6733, 19, 'config', 'config_image_compare_height', '90', 0),
(6732, 19, 'config', 'config_image_compare_width', '90', 0),
(6731, 19, 'config', 'config_image_related_height', '80', 0),
(6730, 19, 'config', 'config_image_related_width', '80', 0),
(6729, 19, 'config', 'config_image_additional_height', '74', 0),
(6728, 19, 'config', 'config_image_additional_width', '74', 0),
(6727, 19, 'config', 'config_image_product_height', '80', 0),
(6726, 19, 'config', 'config_image_product_width', '80', 0),
(6725, 19, 'config', 'config_image_popup_height', '500', 0),
(6724, 19, 'config', 'config_image_popup_width', '500', 0),
(6723, 19, 'config', 'config_image_thumb_height', '228', 0),
(6722, 19, 'config', 'config_image_thumb_width', '228', 0),
(6721, 19, 'config', 'config_image_category_height', '80', 0),
(6720, 19, 'config', 'config_image_category_width', '80', 0),
(6719, 19, 'config', 'config_icon', '', 0),
(6718, 19, 'config', 'config_logo', '', 0),
(6717, 19, 'config', 'config_stock_checkout', '0', 0),
(6716, 19, 'config', 'config_stock_display', '0', 0),
(6715, 19, 'config', 'config_order_status_id', '7', 0),
(6714, 19, 'config', 'config_checkout_id', '0', 0),
(6713, 19, 'config', 'config_checkout_guest', '0', 0),
(6712, 19, 'config', 'config_cart_weight', '0', 0),
(6711, 19, 'config', 'config_account_id', '0', 0),
(6709, 19, 'config', 'config_customer_group_id', '1', 0),
(6710, 19, 'config', 'config_customer_price', '0', 0),
(6708, 19, 'config', 'config_tax_customer', '', 0),
(6707, 19, 'config', 'config_tax_default', '', 0),
(6706, 19, 'config', 'config_tax', '0', 0),
(6703, 19, 'config', 'config_currency', 'AED', 0),
(6704, 19, 'config', 'config_product_limit', '15', 0),
(6705, 19, 'config', 'config_product_description_length', '100', 0),
(6702, 19, 'config', 'config_language', 'en', 0),
(6701, 19, 'config', 'config_zone_id', '3507', 0),
(6700, 19, 'config', 'config_country_id', '221', 0),
(6699, 19, 'config', 'config_layout_id', '6', 0),
(6698, 19, 'config', 'config_template', 'coolbaby', 0),
(6697, 19, 'config', 'config_meta_keyword', '', 0),
(6696, 19, 'config', 'config_meta_description', '', 0),
(6695, 19, 'config', 'config_meta_title', 'new store', 0),
(6694, 19, 'config', 'config_comment', '', 0),
(6693, 19, 'config', 'config_open', '', 0),
(6692, 19, 'config', 'config_image', '', 0),
(6691, 19, 'config', 'config_fax', '', 0),
(6690, 19, 'config', 'config_geocode', '', 0),
(6688, 19, 'config', 'config_ssl', '', 0),
(6689, 19, 'config', 'config_address', 'ajman', 0),
(6687, 19, 'config', 'config_url', '/new', 0),
(6686, 19, 'config', 'config_telephone', '0504040919', 0),
(6685, 19, 'config', 'config_email', 'sales@fortunegiftz.com', 0),
(6684, 19, 'config', 'config_owner', 'store man', 0),
(6683, 19, 'config', 'config_name', 'Store 1', 0),
(7019, 13, 'config', 'config_ajaxadvancedsearch_color_quantity', '', 0),
(6937, 20, 'config', 'config_payacc', '', 0),
(7018, 13, 'config', 'config_ajaxadvancedsearch_color_stockstatushover', '', 0),
(6936, 20, 'config', 'config_commission', '10', 0),
(6935, 20, 'config', 'config_secure', '0', 0),
(6934, 20, 'config', 'config_ajaxadvancedsearch_sku', '0', 0),
(6933, 20, 'config', 'config_ajaxadvancedsearch_upc', '0', 0),
(6932, 20, 'config', 'config_ajaxadvancedsearch_ean', '0', 0),
(6931, 20, 'config', 'config_ajaxadvancedsearch_jan', '0', 0),
(6927, 20, 'config', 'config_ajaxadvancedsearch_tag', '0', 0),
(6928, 20, 'config', 'config_ajaxadvancedsearch_mpn', '0', 0),
(6929, 20, 'config', 'config_ajaxadvancedsearch_manufacturer_search', '0', 0),
(6930, 20, 'config', 'config_ajaxadvancedsearch_isbn', '0', 0),
(6926, 20, 'config', 'config_ajaxadvancedsearch_model_search', '0', 0),
(6925, 20, 'config', 'config_ajaxadvancedsearch_quantity', '0', 0),
(6924, 20, 'config', 'config_ajaxadvancedsearch_stock', '0', 0),
(6922, 20, 'config', 'config_ajaxadvancedsearch_pricelogin', '0', 0),
(6923, 20, 'config', 'config_ajaxadvancedsearch_rating', '0', 0),
(6920, 20, 'config', 'config_ajaxadvancedsearch_manufacturer', '0', 0),
(6921, 20, 'config', 'config_ajaxadvancedsearch_price', '0', 0),
(6919, 20, 'config', 'config_ajaxadvancedsearch_descr', '0', 0),
(6918, 20, 'config', 'config_ajaxadvancedsearch_model', '0', 0),
(6914, 20, 'config', 'config_ajaxadvancedsearch_color_evenresult', '', 0),
(6915, 20, 'config', 'config_ajaxadvancedsearch_color_oddresult', '', 0),
(6916, 20, 'config', 'config_ajaxadvancedsearch_color_resulthover', '', 0),
(6917, 20, 'config', 'config_ajaxadvancedsearch_displayallresults', '0', 0),
(6912, 20, 'config', 'config_ajaxadvancedsearch_color_quantity', '', 0),
(6913, 20, 'config', 'config_ajaxadvancedsearch_color_quantityhover', '', 0),
(6911, 20, 'config', 'config_ajaxadvancedsearch_color_stockstatushover', '', 0),
(6910, 20, 'config', 'config_ajaxadvancedsearch_color_stockstatus', '', 0),
(6909, 20, 'config', 'config_ajaxadvancedsearch_color_pricehover', '', 0),
(6908, 20, 'config', 'config_ajaxadvancedsearch_color_price', '', 0),
(6906, 20, 'config', 'config_ajaxadvancedsearch_color_manufacturer', '', 0),
(6907, 20, 'config', 'config_ajaxadvancedsearch_color_manufacturerhover', '', 0),
(6903, 20, 'config', 'config_ajaxadvancedsearch_color_headinghover', '', 0),
(6904, 20, 'config', 'config_ajaxadvancedsearch_color_model', '', 0),
(6905, 20, 'config', 'config_ajaxadvancedsearch_color_modelhover', '', 0),
(6902, 20, 'config', 'config_ajaxadvancedsearch_color_heading', '', 0),
(6900, 20, 'config', 'config_ajaxadvancedsearch_color_default', '', 0),
(6901, 20, 'config', 'config_ajaxadvancedsearch_color_defaulthover', '', 0),
(6898, 20, 'config', 'config_ajaxadvancedsearch_colorenabletall', '0', 0),
(6899, 20, 'config', 'config_ajaxadvancedsearch_colordefaultall', '0', 0),
(6897, 20, 'config', 'config_ajaxadvancedsearch_highlight', '0', 0),
(6894, 20, 'config', 'config_ajaxadvancedsearch_result_view', 'default-view', 0),
(6895, 20, 'config', 'config_ajaxadvancedsearch_color_highlight', '', 0),
(6896, 20, 'config', 'config_ajaxadvancedsearch_color_highlighthover', '', 0),
(6893, 20, 'config', 'config_ajaxadvancedsearch_image_height', '50', 0),
(6892, 20, 'config', 'config_ajaxadvancedsearch_image_width', '50', 0),
(6891, 20, 'config', 'config_ajaxadvancedsearch_image', '1', 0),
(6890, 20, 'config', 'config_ajaxadvancedsearch_charlimit', '', 0),
(6889, 20, 'config', 'config_ajaxadvancedsearch_limit', '', 0),
(6888, 20, 'config', 'config_ajaxadvancedsearch', '1', 0),
(6887, 20, 'config', 'config_image_location_height', '180', 0),
(6886, 20, 'config', 'config_image_location_width', '240', 0),
(6885, 20, 'config', 'config_image_cart_height', '80', 0),
(6884, 20, 'config', 'config_image_cart_width', '80', 0),
(6883, 20, 'config', 'config_image_wishlist_height', '50', 0),
(6882, 20, 'config', 'config_image_wishlist_width', '50', 0),
(6881, 20, 'config', 'config_image_compare_height', '90', 0),
(6880, 20, 'config', 'config_image_compare_width', '90', 0),
(6879, 20, 'config', 'config_image_related_height', '80', 0),
(6878, 20, 'config', 'config_image_related_width', '80', 0),
(6877, 20, 'config', 'config_image_additional_height', '74', 0),
(6876, 20, 'config', 'config_image_additional_width', '74', 0),
(6875, 20, 'config', 'config_image_product_height', '80', 0),
(6874, 20, 'config', 'config_image_product_width', '80', 0),
(6873, 20, 'config', 'config_image_popup_height', '500', 0),
(6872, 20, 'config', 'config_image_popup_width', '500', 0),
(6871, 20, 'config', 'config_image_thumb_height', '228', 0),
(6870, 20, 'config', 'config_image_thumb_width', '228', 0),
(6869, 20, 'config', 'config_image_category_height', '80', 0),
(6868, 20, 'config', 'config_image_category_width', '80', 0),
(6867, 20, 'config', 'config_icon', '', 0),
(6866, 20, 'config', 'config_logo', '', 0),
(6865, 20, 'config', 'config_stock_checkout', '0', 0),
(6864, 20, 'config', 'config_stock_display', '0', 0),
(6863, 20, 'config', 'config_order_status_id', '7', 0),
(6862, 20, 'config', 'config_checkout_id', '0', 0),
(6861, 20, 'config', 'config_checkout_guest', '0', 0),
(6860, 20, 'config', 'config_cart_weight', '0', 0),
(6859, 20, 'config', 'config_account_id', '0', 0),
(6858, 20, 'config', 'config_customer_price', '0', 0),
(6857, 20, 'config', 'config_customer_group_id', '1', 0),
(6856, 20, 'config', 'config_tax_customer', '', 0),
(6855, 20, 'config', 'config_tax_default', '', 0),
(6854, 20, 'config', 'config_tax', '0', 0),
(6851, 20, 'config', 'config_currency', 'AED', 0),
(6852, 20, 'config', 'config_product_limit', '15', 0),
(6853, 20, 'config', 'config_product_description_length', '100', 0),
(6850, 20, 'config', 'config_language', 'en', 0),
(6849, 20, 'config', 'config_zone_id', '3507', 0),
(6848, 20, 'config', 'config_country_id', '221', 0),
(6847, 20, 'config', 'config_layout_id', '6', 0),
(6846, 20, 'config', 'config_template', 'coolbaby', 0),
(6845, 20, 'config', 'config_meta_keyword', '', 0),
(6844, 20, 'config', 'config_meta_description', '', 0),
(6843, 20, 'config', 'config_meta_title', 'kenz', 0),
(6842, 20, 'config', 'config_comment', '', 0),
(6841, 20, 'config', 'config_open', '', 0),
(6840, 20, 'config', 'config_image', '', 0),
(6839, 20, 'config', 'config_fax', '', 0),
(6838, 20, 'config', 'config_geocode', '', 0),
(6837, 20, 'config', 'config_address', 'ajman', 0),
(6836, 20, 'config', 'config_ssl', '', 0),
(6835, 20, 'config', 'config_url', 'www.clothfarm.com', 0),
(6834, 20, 'config', 'config_telephone', '0504040919', 0),
(6832, 20, 'config', 'config_owner', 'fayas', 0),
(6833, 20, 'config', 'config_email', 'fayas@kenzco.com', 0),
(6831, 20, 'config', 'config_name', 'Kenz', 0),
(7035, 13, 'config', 'config_ajaxadvancedsearch_mpn', '0', 0),
(7036, 13, 'config', 'config_ajaxadvancedsearch_manufacturer_search', '0', 0),
(7037, 13, 'config', 'config_ajaxadvancedsearch_isbn', '0', 0),
(7038, 13, 'config', 'config_ajaxadvancedsearch_jan', '0', 0),
(7039, 13, 'config', 'config_ajaxadvancedsearch_ean', '0', 0),
(7040, 13, 'config', 'config_ajaxadvancedsearch_upc', '0', 0),
(7041, 13, 'config', 'config_ajaxadvancedsearch_sku', '0', 0),
(7042, 13, 'config', 'config_secure', '0', 0),
(7043, 13, 'config', 'config_commission', '10', 0),
(7044, 13, 'config', 'config_payacc', '', 0),
(7300, 21, 'config', 'config_ajaxadvancedsearch_descr', '0', 0),
(7299, 21, 'config', 'config_ajaxadvancedsearch_model', '0', 0),
(7298, 21, 'config', 'config_ajaxadvancedsearch_displayallresults', '0', 0),
(7297, 21, 'config', 'config_ajaxadvancedsearch_color_resulthover', '', 0),
(7296, 21, 'config', 'config_ajaxadvancedsearch_color_oddresult', '', 0),
(7295, 21, 'config', 'config_ajaxadvancedsearch_color_evenresult', '', 0),
(7294, 21, 'config', 'config_ajaxadvancedsearch_color_quantityhover', '', 0),
(7293, 21, 'config', 'config_ajaxadvancedsearch_color_quantity', '', 0),
(7292, 21, 'config', 'config_ajaxadvancedsearch_color_stockstatushover', '', 0),
(7291, 21, 'config', 'config_ajaxadvancedsearch_color_stockstatus', '', 0),
(7290, 21, 'config', 'config_ajaxadvancedsearch_color_pricehover', '', 0),
(7289, 21, 'config', 'config_ajaxadvancedsearch_color_price', '', 0),
(7288, 21, 'config', 'config_ajaxadvancedsearch_color_manufacturerhover', '', 0),
(7287, 21, 'config', 'config_ajaxadvancedsearch_color_manufacturer', '', 0),
(7286, 21, 'config', 'config_ajaxadvancedsearch_color_modelhover', '', 0),
(7285, 21, 'config', 'config_ajaxadvancedsearch_color_model', '', 0),
(7284, 21, 'config', 'config_ajaxadvancedsearch_color_headinghover', '', 0),
(7283, 21, 'config', 'config_ajaxadvancedsearch_color_heading', '', 0),
(7282, 21, 'config', 'config_ajaxadvancedsearch_color_defaulthover', '', 0),
(7281, 21, 'config', 'config_ajaxadvancedsearch_color_default', '', 0),
(7280, 21, 'config', 'config_ajaxadvancedsearch_colordefaultall', '0', 0),
(7279, 21, 'config', 'config_ajaxadvancedsearch_colorenabletall', '0', 0),
(7278, 21, 'config', 'config_ajaxadvancedsearch_highlight', '0', 0),
(7277, 21, 'config', 'config_ajaxadvancedsearch_color_highlighthover', '', 0),
(7276, 21, 'config', 'config_ajaxadvancedsearch_color_highlight', '', 0),
(7275, 21, 'config', 'config_ajaxadvancedsearch_result_view', 'default-view', 0),
(7274, 21, 'config', 'config_ajaxadvancedsearch_image_height', '50', 0),
(7273, 21, 'config', 'config_ajaxadvancedsearch_image_width', '50', 0),
(7272, 21, 'config', 'config_ajaxadvancedsearch_image', '1', 0),
(7271, 21, 'config', 'config_ajaxadvancedsearch_charlimit', '', 0),
(7270, 21, 'config', 'config_ajaxadvancedsearch_limit', '', 0),
(7269, 21, 'config', 'config_ajaxadvancedsearch', '1', 0),
(7268, 21, 'config', 'config_image_location_height', '180', 0),
(7267, 21, 'config', 'config_image_location_width', '240', 0),
(7266, 21, 'config', 'config_image_cart_height', '80', 0),
(7265, 21, 'config', 'config_image_cart_width', '80', 0),
(7264, 21, 'config', 'config_image_wishlist_height', '50', 0),
(7263, 21, 'config', 'config_image_wishlist_width', '50', 0),
(7262, 21, 'config', 'config_image_compare_height', '90', 0),
(7261, 21, 'config', 'config_image_compare_width', '90', 0),
(7260, 21, 'config', 'config_image_related_height', '80', 0),
(7259, 21, 'config', 'config_image_related_width', '80', 0),
(7258, 21, 'config', 'config_image_additional_height', '74', 0),
(7257, 21, 'config', 'config_image_additional_width', '74', 0),
(7256, 21, 'config', 'config_image_product_height', '80', 0),
(7255, 21, 'config', 'config_image_product_width', '80', 0),
(7254, 21, 'config', 'config_image_popup_height', '500', 0),
(7253, 21, 'config', 'config_image_popup_width', '500', 0),
(7252, 21, 'config', 'config_image_thumb_height', '228', 0),
(7251, 21, 'config', 'config_image_thumb_width', '228', 0),
(7250, 21, 'config', 'config_image_category_height', '80', 0),
(7249, 21, 'config', 'config_image_category_width', '80', 0),
(7248, 21, 'config', 'config_icon', '', 0),
(7247, 21, 'config', 'config_logo', '', 0),
(7246, 21, 'config', 'config_stock_checkout', '0', 0),
(7245, 21, 'config', 'config_stock_display', '0', 0),
(7244, 21, 'config', 'config_order_status_id', '7', 0),
(7243, 21, 'config', 'config_checkout_id', '0', 0),
(7242, 21, 'config', 'config_checkout_guest', '0', 0),
(7241, 21, 'config', 'config_cart_weight', '0', 0),
(7240, 21, 'config', 'config_account_id', '0', 0),
(7239, 21, 'config', 'config_customer_price', '0', 0),
(7238, 21, 'config', 'config_customer_group_id', '1', 0),
(7237, 21, 'config', 'config_tax_customer', '', 0),
(7236, 21, 'config', 'config_tax_default', '', 0),
(7235, 21, 'config', 'config_tax', '0', 0),
(7234, 21, 'config', 'config_product_description_length', '100', 0),
(7233, 21, 'config', 'config_product_limit', '15', 0),
(7232, 21, 'config', 'config_currency', 'AED', 0),
(7231, 21, 'config', 'config_language', 'en', 0),
(7230, 21, 'config', 'config_zone_id', '3507', 0),
(7229, 21, 'config', 'config_country_id', '221', 0),
(7228, 21, 'config', 'config_layout_id', '6', 0),
(7227, 21, 'config', 'config_template', 'coolbaby', 0),
(7226, 21, 'config', 'config_meta_keyword', '', 0),
(7225, 21, 'config', 'config_meta_description', '', 0),
(7224, 21, 'config', 'config_meta_title', 'Sample store', 0),
(7223, 21, 'config', 'config_comment', '', 0),
(7222, 21, 'config', 'config_open', '', 0),
(7221, 21, 'config', 'config_image', '', 0),
(7220, 21, 'config', 'config_fax', '', 0),
(7219, 21, 'config', 'config_geocode', '', 0),
(7218, 21, 'config', 'config_address', 'Mother Theresa road,', 0),
(7217, 21, 'config', 'config_ssl', '', 0),
(7216, 21, 'config', 'config_url', 'mirza', 0),
(7215, 21, 'config', 'config_telephone', '09809979144', 0),
(7214, 21, 'config', 'config_email', 'mirza.ekm@gmail.com', 0),
(7213, 21, 'config', 'config_owner', 'Mirza', 0),
(7212, 21, 'config', 'config_name', 'Mirzastore', 0),
(7301, 21, 'config', 'config_ajaxadvancedsearch_manufacturer', '0', 0),
(7302, 21, 'config', 'config_ajaxadvancedsearch_price', '0', 0),
(7303, 21, 'config', 'config_ajaxadvancedsearch_pricelogin', '0', 0),
(7304, 21, 'config', 'config_ajaxadvancedsearch_rating', '0', 0),
(7305, 21, 'config', 'config_ajaxadvancedsearch_stock', '0', 0),
(7306, 21, 'config', 'config_ajaxadvancedsearch_quantity', '0', 0),
(7307, 21, 'config', 'config_ajaxadvancedsearch_model_search', '0', 0),
(7308, 21, 'config', 'config_ajaxadvancedsearch_tag', '0', 0),
(7309, 21, 'config', 'config_ajaxadvancedsearch_mpn', '0', 0),
(7310, 21, 'config', 'config_ajaxadvancedsearch_manufacturer_search', '0', 0),
(7311, 21, 'config', 'config_ajaxadvancedsearch_isbn', '0', 0),
(7312, 21, 'config', 'config_ajaxadvancedsearch_jan', '0', 0),
(7313, 21, 'config', 'config_ajaxadvancedsearch_ean', '0', 0),
(7314, 21, 'config', 'config_ajaxadvancedsearch_upc', '0', 0),
(7315, 21, 'config', 'config_ajaxadvancedsearch_sku', '0', 0),
(7316, 21, 'config', 'config_secure', '0', 0),
(7317, 21, 'config', 'config_commission', '10', 0),
(7318, 21, 'config', 'config_payacc', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_simple_blog_article`
--

CREATE TABLE IF NOT EXISTS `oc_simple_blog_article` (
  `simple_blog_article_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_author_id` int(16) NOT NULL,
  `allow_comment` tinyint(1) NOT NULL,
  `image` text NOT NULL,
  `featured_image` text NOT NULL,
  `article_related_method` varchar(64) NOT NULL,
  `article_related_option` text NOT NULL,
  `sort_order` int(8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_article_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_simple_blog_article`
--

INSERT INTO `oc_simple_blog_article` (`simple_blog_article_id`, `simple_blog_author_id`, `allow_comment`, `image`, `featured_image`, `article_related_method`, `article_related_option`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, 1, 1, 'catalog/blog/blog-img-01.jpg', 'catalog/blog/blog-img.jpg', 'product_wise', '', 1, 1, '2015-03-05 18:22:18', '2015-12-04 18:56:57'),
(2, 1, 1, 'catalog/blog/blog-img-02.jpg', 'catalog/blog/blog-img.jpg', 'product_wise', '', 2, 1, '2015-03-05 18:37:30', '2015-03-05 18:37:30'),
(3, 1, 1, 'catalog/blog/blog-img-03.jpg', 'catalog/blog/blog-img.jpg', 'product_wise', '', 3, 1, '2015-03-05 18:54:06', '2015-03-05 18:54:06'),
(4, 1, 1, 'catalog/blog/blog-img-04.jpg', 'catalog/blog/blog-img.jpg', 'product_wise', '', 4, 1, '2015-03-05 18:54:56', '2015-03-05 18:54:56'),
(5, 1, 1, 'catalog/blog/blog-img-05.jpg', 'catalog/blog/blog-img.jpg', 'product_wise', '', 5, 1, '2015-03-05 18:55:31', '2015-03-05 18:55:31'),
(6, 1, 1, 'catalog/blog/blog-post-06.jpg', 'catalog/blog/blog-img.jpg', 'product_wise', '', 6, 1, '2015-03-05 18:56:24', '2015-03-05 18:56:24');

-- --------------------------------------------------------

--
-- Table structure for table `oc_simple_blog_article_description`
--

CREATE TABLE IF NOT EXISTS `oc_simple_blog_article_description` (
  `simple_blog_article_description_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_article_id` int(16) NOT NULL,
  `language_id` int(16) NOT NULL,
  `article_title` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(256) NOT NULL,
  `meta_keyword` varchar(256) NOT NULL,
  PRIMARY KEY (`simple_blog_article_description_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `oc_simple_blog_article_description`
--

INSERT INTO `oc_simple_blog_article_description` (`simple_blog_article_description_id`, `simple_blog_article_id`, `language_id`, `article_title`, `description`, `meta_description`, `meta_keyword`) VALUES
(7, 1, 1, 'Blog post number 1', '                  &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;/p&gt;\r\n                  &lt;p&gt;Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n                  &lt;div class=&quot;blockquote&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                      &lt;p&gt;Curabitur convallis facilisis lorem. Vivamus euismod nulla vel nunc. Fusce tincidunt, justo congue egestas molestie, tortor tortor blandit erat, et scelerisque metus metus at ipsum. Maecenas tincidunt adipiscing tellus. Nunc tristique pede. Ut condimentum mattis est. Duis sit amet augue. &lt;/p&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n', '', ''),
(2, 2, 1, 'Blog post number 2', '                  &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;/p&gt;\r\n                  &lt;p&gt;Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n                  &lt;div class=&quot;blockquote&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                      &lt;p&gt;Curabitur convallis facilisis lorem. Vivamus euismod nulla vel nunc. Fusce tincidunt, justo congue egestas molestie, tortor tortor blandit erat, et scelerisque metus metus at ipsum. Maecenas tincidunt adipiscing tellus. Nunc tristique pede. Ut condimentum mattis est. Duis sit amet augue. &lt;/p&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n', '', ''),
(3, 3, 1, 'Blog post number 3', '                  &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;/p&gt;\r\n                  &lt;p&gt;Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n                  &lt;div class=&quot;blockquote&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                      &lt;p&gt;Curabitur convallis facilisis lorem. Vivamus euismod nulla vel nunc. Fusce tincidunt, justo congue egestas molestie, tortor tortor blandit erat, et scelerisque metus metus at ipsum. Maecenas tincidunt adipiscing tellus. Nunc tristique pede. Ut condimentum mattis est. Duis sit amet augue. &lt;/p&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n', '', ''),
(4, 4, 1, 'Blog post number 4', '                  &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;/p&gt;\r\n                  &lt;p&gt;Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n                  &lt;div class=&quot;blockquote&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                      &lt;p&gt;Curabitur convallis facilisis lorem. Vivamus euismod nulla vel nunc. Fusce tincidunt, justo congue egestas molestie, tortor tortor blandit erat, et scelerisque metus metus at ipsum. Maecenas tincidunt adipiscing tellus. Nunc tristique pede. Ut condimentum mattis est. Duis sit amet augue. &lt;/p&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n', '', ''),
(5, 5, 1, 'Blog post number 5', '                  &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;/p&gt;\r\n                  &lt;p&gt;Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n                  &lt;div class=&quot;blockquote&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                      &lt;p&gt;Curabitur convallis facilisis lorem. Vivamus euismod nulla vel nunc. Fusce tincidunt, justo congue egestas molestie, tortor tortor blandit erat, et scelerisque metus metus at ipsum. Maecenas tincidunt adipiscing tellus. Nunc tristique pede. Ut condimentum mattis est. Duis sit amet augue. &lt;/p&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n', '', ''),
(6, 6, 1, 'Blog post number 6', '                  &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;/p&gt;\r\n                  &lt;p&gt;Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n                  &lt;div class=&quot;blockquote&quot;&gt;\r\n                    &lt;div class=&quot;inside&quot;&gt;\r\n                      &lt;p&gt;Curabitur convallis facilisis lorem. Vivamus euismod nulla vel nunc. Fusce tincidunt, justo congue egestas molestie, tortor tortor blandit erat, et scelerisque metus metus at ipsum. Maecenas tincidunt adipiscing tellus. Nunc tristique pede. Ut condimentum mattis est. Duis sit amet augue. &lt;/p&gt;\r\n                    &lt;/div&gt;\r\n                  &lt;/div&gt;\r\n', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_simple_blog_article_description_additional`
--

CREATE TABLE IF NOT EXISTS `oc_simple_blog_article_description_additional` (
  `simple_blog_article_id` int(16) NOT NULL,
  `language_id` int(16) NOT NULL,
  `additional_description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_simple_blog_article_description_additional`
--

INSERT INTO `oc_simple_blog_article_description_additional` (`simple_blog_article_id`, `language_id`, `additional_description`) VALUES
(1, 1, '&lt;div class=&quot;text&quot;&gt;\r\n    &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;/p&gt;\r\n    &lt;p&gt;Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n    &lt;div class=&quot;divider divider-sm&quot;&gt;&lt;/div&gt;\r\n    &lt;ul class=&quot;tags&quot;&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Web Design&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Wordpress&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Animation&lt;/a&gt;&lt;/li&gt;\r\n    &lt;/ul&gt;\r\n    &lt;div class=&quot;clearfix&quot;&gt;&lt;/div&gt;\r\n    &lt;div class=&quot;divider divider-lg&quot;&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n'),
(2, 1, '&lt;div class=&quot;text&quot;&gt;\r\n    &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;/p&gt;\r\n    &lt;p&gt;Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n    &lt;div class=&quot;divider divider-sm&quot;&gt;&lt;/div&gt;\r\n    &lt;ul class=&quot;tags&quot;&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Web Design&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Wordpress&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Animation&lt;/a&gt;&lt;/li&gt;\r\n    &lt;/ul&gt;\r\n    &lt;div class=&quot;clearfix&quot;&gt;&lt;/div&gt;\r\n    &lt;div class=&quot;divider divider-lg&quot;&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n'),
(3, 1, '&lt;div class=&quot;text&quot;&gt;\r\n    &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;/p&gt;\r\n    &lt;p&gt;Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n    &lt;div class=&quot;divider divider-sm&quot;&gt;&lt;/div&gt;\r\n    &lt;ul class=&quot;tags&quot;&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Web Design&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Wordpress&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Animation&lt;/a&gt;&lt;/li&gt;\r\n    &lt;/ul&gt;\r\n    &lt;div class=&quot;clearfix&quot;&gt;&lt;/div&gt;\r\n    &lt;div class=&quot;divider divider-lg&quot;&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n'),
(4, 1, '&lt;div class=&quot;text&quot;&gt;\r\n    &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;/p&gt;\r\n    &lt;p&gt;Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n    &lt;div class=&quot;divider divider-sm&quot;&gt;&lt;/div&gt;\r\n    &lt;ul class=&quot;tags&quot;&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Web Design&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Wordpress&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Animation&lt;/a&gt;&lt;/li&gt;\r\n    &lt;/ul&gt;\r\n    &lt;div class=&quot;clearfix&quot;&gt;&lt;/div&gt;\r\n    &lt;div class=&quot;divider divider-lg&quot;&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n'),
(5, 1, '&lt;div class=&quot;text&quot;&gt;\r\n    &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;/p&gt;\r\n    &lt;p&gt;Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n    &lt;div class=&quot;divider divider-sm&quot;&gt;&lt;/div&gt;\r\n    &lt;ul class=&quot;tags&quot;&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Web Design&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Wordpress&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Animation&lt;/a&gt;&lt;/li&gt;\r\n    &lt;/ul&gt;\r\n    &lt;div class=&quot;clearfix&quot;&gt;&lt;/div&gt;\r\n    &lt;div class=&quot;divider divider-lg&quot;&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n'),
(6, 1, '&lt;div class=&quot;text&quot;&gt;\r\n    &lt;p&gt;Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, est. Praesent vitae dui. Morbi id tellus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas eu enim in lorem scelerisque auctor. Ut non erat. Suspendisse fermentum posuere lectus. Fusce vulputate nibh egestas orci. Aliquam lectus. Morbi eget dolor sagittis. Morbi sit amet quam. Nulla libero. &lt;/p&gt;\r\n    &lt;p&gt;Donec et mi eu massa ultrices scelerisque. Nullam ac nisi non eros gravida venenatis. Ut euismod, turpis sollicitudin lobortis pellentesque, libero massa dapibus dui, eu dictum justo urna et mi. &lt;/p&gt;\r\n    &lt;div class=&quot;divider divider-sm&quot;&gt;&lt;/div&gt;\r\n    &lt;ul class=&quot;tags&quot;&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Web Design&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Wordpress&lt;/a&gt;&lt;/li&gt;\r\n        &lt;li&gt;&lt;a href=&quot;#&quot;&gt;Animation&lt;/a&gt;&lt;/li&gt;\r\n    &lt;/ul&gt;\r\n    &lt;div class=&quot;clearfix&quot;&gt;&lt;/div&gt;\r\n    &lt;div class=&quot;divider divider-lg&quot;&gt;&lt;/div&gt;\r\n&lt;/div&gt;\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `oc_simple_blog_article_product_related`
--

CREATE TABLE IF NOT EXISTS `oc_simple_blog_article_product_related` (
  `simple_blog_article_id` int(16) NOT NULL,
  `product_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_simple_blog_article_to_category`
--

CREATE TABLE IF NOT EXISTS `oc_simple_blog_article_to_category` (
  `simple_blog_article_id` int(16) NOT NULL,
  `simple_blog_category_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_simple_blog_article_to_category`
--

INSERT INTO `oc_simple_blog_article_to_category` (`simple_blog_article_id`, `simple_blog_category_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_simple_blog_article_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_simple_blog_article_to_layout` (
  `simple_blog_article_id` int(16) NOT NULL,
  `store_id` int(16) NOT NULL,
  `layout_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_simple_blog_article_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_simple_blog_article_to_store` (
  `simple_blog_article_id` int(16) NOT NULL,
  `store_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_simple_blog_article_to_store`
--

INSERT INTO `oc_simple_blog_article_to_store` (`simple_blog_article_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_simple_blog_author`
--

CREATE TABLE IF NOT EXISTS `oc_simple_blog_author` (
  `simple_blog_author_id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `image` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_author_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_simple_blog_author`
--

INSERT INTO `oc_simple_blog_author` (`simple_blog_author_id`, `name`, `image`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Admin', '', 1, '2015-03-05 14:36:08', '2015-03-05 14:36:08');

-- --------------------------------------------------------

--
-- Table structure for table `oc_simple_blog_author_description`
--

CREATE TABLE IF NOT EXISTS `oc_simple_blog_author_description` (
  `simple_blog_author_description_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_author_id` int(16) NOT NULL,
  `language_id` int(16) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(256) NOT NULL,
  `meta_keyword` varchar(256) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_author_description_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_simple_blog_author_description`
--

INSERT INTO `oc_simple_blog_author_description` (`simple_blog_author_description_id`, `simple_blog_author_id`, `language_id`, `description`, `meta_description`, `meta_keyword`, `date_added`) VALUES
(1, 1, 1, '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', '', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `oc_simple_blog_category`
--

CREATE TABLE IF NOT EXISTS `oc_simple_blog_category` (
  `simple_blog_category_id` int(16) NOT NULL AUTO_INCREMENT,
  `image` text NOT NULL,
  `parent_id` int(16) NOT NULL,
  `top` tinyint(1) NOT NULL,
  `blog_category_column` int(16) NOT NULL,
  `column` int(8) NOT NULL,
  `sort_order` int(8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_simple_blog_category`
--

INSERT INTO `oc_simple_blog_category` (`simple_blog_category_id`, `image`, `parent_id`, `top`, `blog_category_column`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(1, '', 0, 0, 0, 10, 0, 1, '2015-12-04 18:56:34', '2015-12-04 18:56:34');

-- --------------------------------------------------------

--
-- Table structure for table `oc_simple_blog_category_description`
--

CREATE TABLE IF NOT EXISTS `oc_simple_blog_category_description` (
  `simple_blog_category_description_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_category_id` int(16) NOT NULL,
  `language_id` int(16) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `meta_description` varchar(256) NOT NULL,
  `meta_keyword` varchar(256) NOT NULL,
  PRIMARY KEY (`simple_blog_category_description_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_simple_blog_category_description`
--

INSERT INTO `oc_simple_blog_category_description` (`simple_blog_category_description_id`, `simple_blog_category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES
(1, 1, 1, 'blog ', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'blog', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_simple_blog_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `oc_simple_blog_category_to_layout` (
  `simple_blog_category_id` int(16) NOT NULL,
  `store_id` int(16) NOT NULL,
  `layout_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_simple_blog_category_to_store`
--

CREATE TABLE IF NOT EXISTS `oc_simple_blog_category_to_store` (
  `simple_blog_category_id` int(16) NOT NULL,
  `store_id` int(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_simple_blog_category_to_store`
--

INSERT INTO `oc_simple_blog_category_to_store` (`simple_blog_category_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_simple_blog_comment`
--

CREATE TABLE IF NOT EXISTS `oc_simple_blog_comment` (
  `simple_blog_comment_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_article_id` int(16) NOT NULL,
  `simple_blog_article_reply_id` int(16) NOT NULL,
  `author` varchar(64) NOT NULL,
  `comment` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_comment_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oc_simple_blog_comment`
--

INSERT INTO `oc_simple_blog_comment` (`simple_blog_comment_id`, `simple_blog_article_id`, `simple_blog_article_reply_id`, `author`, `comment`, `status`, `date_added`, `date_modified`) VALUES
(1, 1, 0, 'John Doe', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec eros tellus, scelerisque nec, rhoncus eget, laoreet sit amet, nunc. Ut sit amet turpis. In est arcu, sollicitudin eu, vehicula venenatis, tempor vitae, es', 1, '2015-03-12 13:46:22', '2015-03-12 13:46:22'),
(2, 1, 1, 'Elizabeth', 'Curabitur convallis facilisis lorem. Vivamus euismod nulla vel nunc. Fusce tincidunt, justo congue egestas molestie,', 1, '2015-03-12 13:51:45', '2015-03-12 13:51:45');

-- --------------------------------------------------------

--
-- Table structure for table `oc_simple_blog_related_article`
--

CREATE TABLE IF NOT EXISTS `oc_simple_blog_related_article` (
  `simple_blog_related_article_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_article_id` int(16) NOT NULL,
  `simple_blog_article_related_id` int(16) NOT NULL,
  `sort_order` int(8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_related_article_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_simple_blog_view`
--

CREATE TABLE IF NOT EXISTS `oc_simple_blog_view` (
  `simple_blog_view_id` int(16) NOT NULL AUTO_INCREMENT,
  `simple_blog_article_id` int(16) NOT NULL,
  `view` int(16) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`simple_blog_view_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_simple_blog_view`
--

INSERT INTO `oc_simple_blog_view` (`simple_blog_view_id`, `simple_blog_article_id`, `view`, `date_added`, `date_modified`) VALUES
(1, 1, 122, '2015-03-05 18:23:19', '2015-12-11 16:21:52'),
(2, 5, 18, '2015-03-05 18:56:45', '2015-12-10 15:16:03'),
(3, 4, 37, '2015-03-10 15:39:11', '2015-12-10 11:12:44'),
(4, 6, 41, '2015-03-10 19:49:11', '2015-12-10 11:12:11'),
(5, 2, 4, '2015-03-13 11:32:39', '2015-12-10 11:26:10'),
(6, 3, 5, '2015-12-05 21:25:29', '2015-12-10 11:12:04');

-- --------------------------------------------------------

--
-- Table structure for table `oc_soclall_id`
--

CREATE TABLE IF NOT EXISTS `oc_soclall_id` (
  `network_code` char(10) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `socl_id` char(255) NOT NULL,
  PRIMARY KEY (`network_code`,`customer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_soclall_network`
--

CREATE TABLE IF NOT EXISTS `oc_soclall_network` (
  `network_code` char(10) NOT NULL,
  `network_name` char(50) NOT NULL,
  `logo` varchar(255) NOT NULL,
  PRIMARY KEY (`network_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_soclall_network`
--

INSERT INTO `oc_soclall_network` (`network_code`, `network_name`, `logo`) VALUES
('facebook', 'Facebook', 'facebook.png'),
('twitter', 'Twitter', 'twitter.png'),
('google', 'Google Plus', 'google-plus.png'),
('linkedin', 'LinkedIn', 'linkedin.png'),
('live', 'Live', 'window-live.png'),
('plurk', 'Plurk', 'plurk.png'),
('tumblr', 'Tumblr', 'tumblr.png'),
('mailru', 'Mail.ru', 'mail-ru.png'),
('reddit', 'Reddit', 'reddit.png'),
('lastfm', 'Last.fm', 'lastfm.png'),
('vkontakte', 'Vkontakte', 'vk.png'),
('disqus', 'Disqus', 'disqus.png'),
('wordpress', 'Wordpress', 'wordpress.png'),
('foursquare', 'Foursquare', 'foursquare.png'),
('github', 'Github', 'github.png');

-- --------------------------------------------------------

--
-- Table structure for table `oc_stock_status`
--

CREATE TABLE IF NOT EXISTS `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2-3 Days');

-- --------------------------------------------------------

--
-- Table structure for table `oc_store`
--

CREATE TABLE IF NOT EXISTS `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  `commission` int(11) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `oc_store`
--

INSERT INTO `oc_store` (`store_id`, `name`, `url`, `ssl`, `commission`, `status`, `date_added`) VALUES
(9, 'merchant', 'http://two/', '', 10, 1, '2015-12-06 03:33:53'),
(10, 'Raja', 'http://stores1.100myspacelayouts.com/', '', 10, 1, '2015-12-07 00:50:06'),
(12, 'test1', 'http://stores1.100myspacelayouts.com/', '', 10, 1, '2015-12-07 01:10:05'),
(13, 'TEST', 'www.clothfarm.com', '', 10, 1, '2015-12-07 03:10:33'),
(14, 'test2', '', '', 10, 0, '2015-12-07 05:59:49'),
(15, 'RaJA', '', '', 10, 0, '2015-12-10 02:57:53'),
(16, 'TEST', '', '', 10, 0, '2015-12-10 04:33:37'),
(17, 'RAJAMANIAN', '', '', 10, 0, '2015-12-10 05:19:14'),
(18, 'aasasasas', '', '', 10, 0, '2015-12-10 06:30:51'),
(19, 'Store 1', '/new', '', 10, 1, '2015-12-10 13:18:12'),
(20, 'Kenz', 'www.clothfarm.com', '', 10, 1, '2015-12-11 00:53:20'),
(21, 'Mirzastore', 'mirza', '', 10, 1, '2015-12-12 08:23:30');

-- --------------------------------------------------------

--
-- Table structure for table `oc_subscribe_plan`
--

CREATE TABLE IF NOT EXISTS `oc_subscribe_plan` (
  `plan_id` int(16) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(256) NOT NULL,
  `plan_amount` varchar(16) NOT NULL,
  `plan_days` varchar(16) NOT NULL,
  `highlight` int(1) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `plan_status` int(1) NOT NULL COMMENT '1 - Disable, 0 - Enable',
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `oc_subscribe_plan`
--

INSERT INTO `oc_subscribe_plan` (`plan_id`, `plan_name`, `plan_amount`, `plan_days`, `highlight`, `description`, `plan_status`) VALUES
(10, 'Free', '0', '1', 1, '10% Commission\r\nRandom Promotional\r\n\r\n', 0),
(11, 'Basic', '100', '30', 0, 'Test Description here for the subscription plan', 0),
(12, 'Advanced', '200', '30', 0, 'Test Description here for the subscription plan', 0),
(13, 'Premium', '300', '30', 0, 'Test Description here for the subscription plan', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_subscribe_plan_paypal`
--

CREATE TABLE IF NOT EXISTS `oc_subscribe_plan_paypal` (
  `paypal_id` int(16) NOT NULL AUTO_INCREMENT,
  `plan_id` int(16) NOT NULL,
  `merchant_id` int(16) NOT NULL,
  `transaction_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `item_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `currency_code` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `amount` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `activate_date` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `serialize_data` text COLLATE utf8_unicode_ci NOT NULL,
  `payment_date` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`paypal_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=32 ;

--
-- Dumping data for table `oc_subscribe_plan_paypal`
--

INSERT INTO `oc_subscribe_plan_paypal` (`paypal_id`, `plan_id`, `merchant_id`, `transaction_id`, `item_name`, `currency_code`, `amount`, `payment_status`, `activate_date`, `serialize_data`, `payment_date`) VALUES
(28, 12, 19, '7BU77852T1911972N', 'Advanced', 'USD', '54.44', 'Completed', '01:57:48 Dec 10, 2015 PST', 'a:41:{s:8:"mc_gross";s:5:"54.44";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:9:"confirmed";s:8:"payer_id";s:13:"PQMS6G3NZFK3E";s:3:"tax";s:4:"0.00";s:14:"address_street";s:9:"1 Main St";s:12:"payment_date";s:25:"01:57:48 Dec 10, 2015 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"95131";s:10:"first_name";s:4:"test";s:6:"mc_fee";s:4:"1.88";s:20:"address_country_code";s:2:"US";s:12:"address_name";s:10:"test buyer";s:14:"notify_version";s:3:"3.8";s:6:"custom";s:110:"Raja$$Mani$$rajamanikandan@exlcart.com$$123456$$123456789$$RaJA$$test$$$$12$$221$$3506$$1$$test test test test";s:12:"payer_status";s:8:"verified";s:8:"business";s:38:"rajamanikandan-facilitator@exlcart.com";s:15:"address_country";s:13:"United States";s:12:"address_city";s:8:"San Jose";s:8:"quantity";s:1:"1";s:11:"verify_sign";s:56:"AWlpMEKr1B-fiuanqDTdbMsRWouOAqUhG89eOmtTiPiE0SoPETsjsec5";s:11:"payer_email";s:32:"rajamanikandan-buyer@exlcart.com";s:6:"txn_id";s:17:"7BU77852T1911972N";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"buyer";s:13:"address_state";s:2:"CA";s:14:"receiver_email";s:38:"rajamanikandan-facilitator@exlcart.com";s:11:"payment_fee";s:4:"1.88";s:11:"receiver_id";s:13:"B7JQDJJ3M57XC";s:8:"txn_type";s:10:"web_accept";s:9:"item_name";s:8:"Advanced";s:11:"mc_currency";s:3:"USD";s:11:"item_number";s:0:"";s:17:"residence_country";s:2:"US";s:8:"test_ipn";s:1:"1";s:15:"handling_amount";s:4:"0.00";s:19:"transaction_subject";s:110:"Raja$$Mani$$rajamanikandan@exlcart.com$$123456$$123456789$$RaJA$$test$$$$12$$221$$3506$$1$$test test test test";s:13:"payment_gross";s:5:"54.44";s:8:"shipping";s:4:"0.00";s:12:"ipn_track_id";s:13:"a6ae1800b9ab8";}', '1449741473'),
(31, 13, 22, '4HA51990X88086322', 'Premium', 'USD', '81.66', 'Completed', '05:30:48 Dec 10, 2015 PST', 'a:41:{s:8:"mc_gross";s:5:"81.66";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:9:"confirmed";s:8:"payer_id";s:13:"PQMS6G3NZFK3E";s:3:"tax";s:4:"0.00";s:14:"address_street";s:9:"1 Main St";s:12:"payment_date";s:25:"05:30:48 Dec 10, 2015 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"95131";s:10:"first_name";s:4:"test";s:6:"mc_fee";s:4:"2.67";s:20:"address_country_code";s:2:"US";s:12:"address_name";s:10:"test buyer";s:14:"notify_version";s:3:"3.8";s:6:"custom";s:125:"rajamanianas$$RAJAMANIANAS$$RAJAMANIANAS@gmail.com$$123456$$123456789$$aasasasas$$sasasas$$$$13$$221$$3509$$1$$asasasasasasas";s:12:"payer_status";s:8:"verified";s:8:"business";s:38:"rajamanikandan-facilitator@exlcart.com";s:15:"address_country";s:13:"United States";s:12:"address_city";s:8:"San Jose";s:8:"quantity";s:1:"1";s:11:"verify_sign";s:56:"AB63pz3qIrLOaZiQqVB04NGoucJcA99Ee6hYcUbYPioqWjEtx8N7s-kV";s:11:"payer_email";s:32:"rajamanikandan-buyer@exlcart.com";s:6:"txn_id";s:17:"4HA51990X88086322";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"buyer";s:13:"address_state";s:2:"CA";s:14:"receiver_email";s:38:"rajamanikandan-facilitator@exlcart.com";s:11:"payment_fee";s:4:"2.67";s:11:"receiver_id";s:13:"B7JQDJJ3M57XC";s:8:"txn_type";s:10:"web_accept";s:9:"item_name";s:7:"Premium";s:11:"mc_currency";s:3:"USD";s:11:"item_number";s:0:"";s:17:"residence_country";s:2:"US";s:8:"test_ipn";s:1:"1";s:15:"handling_amount";s:4:"0.00";s:19:"transaction_subject";s:125:"rajamanianas$$RAJAMANIANAS$$RAJAMANIANAS@gmail.com$$123456$$123456789$$aasasasas$$sasasas$$$$13$$221$$3509$$1$$asasasasasasas";s:13:"payment_gross";s:5:"81.66";s:8:"shipping";s:4:"0.00";s:12:"ipn_track_id";s:13:"8343d63b1cff5";}', '1449754251'),
(29, 12, 20, '3GM77656SR854054K', 'Advanced', 'USD', '54.44', 'Completed', '03:33:29 Dec 10, 2015 PST', 'a:41:{s:8:"mc_gross";s:5:"54.44";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:9:"confirmed";s:8:"payer_id";s:13:"PQMS6G3NZFK3E";s:3:"tax";s:4:"0.00";s:14:"address_street";s:9:"1 Main St";s:12:"payment_date";s:25:"03:33:29 Dec 10, 2015 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"95131";s:10:"first_name";s:4:"test";s:6:"mc_fee";s:4:"1.88";s:20:"address_country_code";s:2:"US";s:12:"address_name";s:10:"test buyer";s:14:"notify_version";s:3:"3.8";s:6:"custom";s:116:"raja$$Manikandan$$rajamanikandanr@exlcart.com$$123456$$1258964235$$TEST$$TEST$$$$12$$221$$3509$$1$$TEST tetet bvbfvb";s:12:"payer_status";s:8:"verified";s:8:"business";s:38:"rajamanikandan-facilitator@exlcart.com";s:15:"address_country";s:13:"United States";s:12:"address_city";s:8:"San Jose";s:8:"quantity";s:1:"1";s:11:"verify_sign";s:56:"AIkKNboJiyuxWLOHUlzTd3lpqCSxAFXR0DkOSqQ96W0Wr.yfC0pcN63U";s:11:"payer_email";s:32:"rajamanikandan-buyer@exlcart.com";s:6:"txn_id";s:17:"3GM77656SR854054K";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"buyer";s:13:"address_state";s:2:"CA";s:14:"receiver_email";s:38:"rajamanikandan-facilitator@exlcart.com";s:11:"payment_fee";s:4:"1.88";s:11:"receiver_id";s:13:"B7JQDJJ3M57XC";s:8:"txn_type";s:10:"web_accept";s:9:"item_name";s:8:"Advanced";s:11:"mc_currency";s:3:"USD";s:11:"item_number";s:0:"";s:17:"residence_country";s:2:"US";s:8:"test_ipn";s:1:"1";s:15:"handling_amount";s:4:"0.00";s:19:"transaction_subject";s:116:"raja$$Manikandan$$rajamanikandanr@exlcart.com$$123456$$1258964235$$TEST$$TEST$$$$12$$221$$3509$$1$$TEST tetet bvbfvb";s:13:"payment_gross";s:5:"54.44";s:8:"shipping";s:4:"0.00";s:12:"ipn_track_id";s:13:"50247e215d3ce";}', '1449747217'),
(30, 11, 21, '8E982163D2346073A', 'Basic', 'USD', '27.22', 'Completed', '04:19:08 Dec 10, 2015 PST', 'a:41:{s:8:"mc_gross";s:5:"27.22";s:22:"protection_eligibility";s:8:"Eligible";s:14:"address_status";s:9:"confirmed";s:8:"payer_id";s:13:"PQMS6G3NZFK3E";s:3:"tax";s:4:"0.00";s:14:"address_street";s:9:"1 Main St";s:12:"payment_date";s:25:"04:19:08 Dec 10, 2015 PST";s:14:"payment_status";s:9:"Completed";s:7:"charset";s:12:"windows-1252";s:11:"address_zip";s:5:"95131";s:10:"first_name";s:4:"test";s:6:"mc_fee";s:4:"1.09";s:20:"address_country_code";s:2:"US";s:12:"address_name";s:10:"test buyer";s:14:"notify_version";s:3:"3.8";s:6:"custom";s:130:"rajamanian$$RAJAMANIAN$$RAJAMANIAN@gmail.com$$123456$$123456789$$RAJAMANIAN$$RAJAMANIAN$$$$11$$221$$3508$$1$$RAJAMANIAN RAJAMANIAN";s:12:"payer_status";s:8:"verified";s:8:"business";s:38:"rajamanikandan-facilitator@exlcart.com";s:15:"address_country";s:13:"United States";s:12:"address_city";s:8:"San Jose";s:8:"quantity";s:1:"1";s:11:"verify_sign";s:56:"AKiJVI-zRf1GGbfcTE2iPRb31l2ZASCuOizLZL43gwtBFnwxJCczD.zZ";s:11:"payer_email";s:32:"rajamanikandan-buyer@exlcart.com";s:6:"txn_id";s:17:"8E982163D2346073A";s:12:"payment_type";s:7:"instant";s:9:"last_name";s:5:"buyer";s:13:"address_state";s:2:"CA";s:14:"receiver_email";s:38:"rajamanikandan-facilitator@exlcart.com";s:11:"payment_fee";s:4:"1.09";s:11:"receiver_id";s:13:"B7JQDJJ3M57XC";s:8:"txn_type";s:10:"web_accept";s:9:"item_name";s:5:"Basic";s:11:"mc_currency";s:3:"USD";s:11:"item_number";s:0:"";s:17:"residence_country";s:2:"US";s:8:"test_ipn";s:1:"1";s:15:"handling_amount";s:4:"0.00";s:19:"transaction_subject";s:130:"rajamanian$$RAJAMANIAN$$RAJAMANIAN@gmail.com$$123456$$123456789$$RAJAMANIAN$$RAJAMANIAN$$$$11$$221$$3508$$1$$RAJAMANIAN RAJAMANIAN";s:13:"payment_gross";s:5:"27.22";s:8:"shipping";s:4:"0.00";s:12:"ipn_track_id";s:13:"4a03ad7c8754b";}', '1449749954');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_class`
--

CREATE TABLE IF NOT EXISTS `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed goods', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (20%)', '20.0000', 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', '2.0000', 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_tax_rule`
--

CREATE TABLE IF NOT EXISTS `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- Dumping data for table `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oc_ticket`
--

CREATE TABLE IF NOT EXISTS `oc_ticket` (
  `ticket_id` int(16) NOT NULL AUTO_INCREMENT,
  `parent_id` int(16) NOT NULL,
  `user` varchar(64) NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `ticket_time` int(16) NOT NULL,
  `merchant_id` int(16) NOT NULL,
  `sender_email` varchar(32) NOT NULL,
  `recipient` varchar(32) NOT NULL,
  `status` varchar(32) NOT NULL COMMENT '1- open,2-closed,3-On hold,4-Pending customer,5-pending vendor',
  PRIMARY KEY (`ticket_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_upload`
--

CREATE TABLE IF NOT EXISTS `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_url_alias`
--

CREATE TABLE IF NOT EXISTS `oc_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=908 ;

--
-- Dumping data for table `oc_url_alias`
--

INSERT INTO `oc_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(904, 'category_id=87', ''),
(905, 'category_id=88', ''),
(730, 'manufacturer_id=8', 'apple'),
(772, 'information_id=4', 'about_us'),
(906, 'category_id=89', ''),
(902, 'category_id=85', ''),
(900, 'category_id=83', ''),
(899, 'category_id=82', ''),
(898, 'category_id=81', ''),
(896, 'category_id=79', ''),
(895, 'category_id=78', ''),
(888, 'information_id=21', ''),
(892, 'category_id=75', ''),
(893, 'category_id=76', ''),
(894, 'category_id=77', ''),
(828, 'manufacturer_id=9', 'canon'),
(829, 'manufacturer_id=5', 'htc'),
(830, 'manufacturer_id=7', 'hewlett-packard'),
(831, 'manufacturer_id=6', 'palm'),
(832, 'manufacturer_id=10', 'sony'),
(841, 'information_id=6', 'delivery'),
(887, 'information_id=3', 'privacy'),
(843, 'information_id=5', 'terms'),
(849, 'manufacturer_id=11', ''),
(862, 'simple_blog_category_id=1', 'blog'),
(863, 'simple_blog_article_id=1', 'neeeeee');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user`
--

CREATE TABLE IF NOT EXISTS `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', 'd853139be101ff0711f76dc11c759eb05dc4347e', 'dedf799dc', 'Fayas', 'Kamar', 'fayas@clothfarm.com', '', '', '::1', 1, '2015-05-18 12:50:56');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

CREATE TABLE IF NOT EXISTS `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', 'a:2:{s:6:"access";a:220:{i:0;s:13:"autopost/plan";i:1;s:17:"catalog/attribute";i:2;s:23:"catalog/attribute_group";i:3;s:20:"catalog/bank_details";i:4;s:16:"catalog/category";i:5;s:16:"catalog/download";i:6;s:14:"catalog/filter";i:7;s:19:"catalog/information";i:8;s:20:"catalog/manufacturer";i:9;s:17:"catalog/mcategory";i:10;s:16:"catalog/mproduct";i:11;s:14:"catalog/option";i:12;s:15:"catalog/product";i:13;s:17:"catalog/recurring";i:14;s:14:"catalog/review";i:15;s:21:"catalog/seller_review";i:16;s:15:"common/6_12menu";i:17;s:18:"common/column_left";i:18;s:18:"common/filemanager";i:19;s:11:"common/menu";i:20;s:14:"common/profile";i:21;s:12:"common/stats";i:22;s:21:"dashboard/best_seller";i:23;s:15:"dashboard/brand";i:24;s:20:"dashboard/commission";i:25;s:16:"dashboard/coupon";i:26;s:15:"dashboard/debit";i:27;s:24:"dashboard/most_purchased";i:28;s:21:"dashboard/most_viewed";i:29;s:25:"dashboard/order_by_status";i:30;s:17:"dashboard/product";i:31;s:14:"dashboard/rate";i:32;s:16:"dashboard/return";i:33;s:18:"dashboard/shipping";i:34;s:20:"dashboard/statistics";i:35;s:17:"dashboard/tickets";i:36;s:21:"dashboard/transaction";i:37;s:14:"dashboard/user";i:38;s:16:"dashboard/vendor";i:39;s:13:"design/banner";i:40;s:13:"design/layout";i:41;s:14:"extension/feed";i:42;s:19:"extension/installer";i:43;s:22:"extension/modification";i:44;s:16:"extension/module";i:45;s:14:"extension/news";i:46;s:17:"extension/openbay";i:47;s:17:"extension/payment";i:48;s:18:"extension/shipping";i:49;s:15:"extension/total";i:50;s:16:"feed/google_base";i:51;s:19:"feed/google_sitemap";i:52;s:15:"feed/openbaypro";i:53;s:22:"funds/sales_commission";i:54;s:20:"funds/vendor_payment";i:55;s:20:"localisation/country";i:56;s:21:"localisation/currency";i:57;s:21:"localisation/geo_zone";i:58;s:21:"localisation/language";i:59;s:25:"localisation/length_class";i:60;s:21:"localisation/location";i:61;s:25:"localisation/order_status";i:62;s:26:"localisation/return_action";i:63;s:26:"localisation/return_reason";i:64;s:26:"localisation/return_status";i:65;s:25:"localisation/stock_status";i:66;s:22:"localisation/tax_class";i:67;s:21:"localisation/tax_rate";i:68;s:33:"localisation/vendor_shipping_rate";i:69;s:25:"localisation/weight_class";i:70;s:17:"localisation/zone";i:71;s:19:"marketing/affiliate";i:72;s:17:"marketing/contact";i:73;s:16:"marketing/coupon";i:74;s:19:"marketing/marketing";i:75;s:20:"merchant/filemanager";i:76;s:14:"module/account";i:77;s:22:"module/advanced_colors";i:78;s:16:"module/affiliate";i:79;s:20:"module/amazon_button";i:80;s:19:"module/amazon_login";i:81;s:17:"module/amazon_pay";i:82;s:13:"module/banner";i:83;s:17:"module/bestseller";i:84;s:15:"module/carousel";i:85;s:15:"module/category";i:86;s:20:"module/customisation";i:87;s:19:"module/ebay_listing";i:88;s:16:"module/fcategory";i:89;s:15:"module/featured";i:90;s:13:"module/filter";i:91;s:18:"module/footer_info";i:92;s:22:"module/google_hangouts";i:93;s:11:"module/html";i:94;s:18:"module/information";i:95;s:13:"module/latest";i:96;s:11:"module/news";i:97;s:14:"module/popular";i:98;s:16:"module/pp_button";i:99;s:15:"module/pp_login";i:100;s:13:"module/random";i:101;s:18:"module/simple_blog";i:102;s:27:"module/simple_blog_category";i:103;s:16:"module/slideshow";i:104;s:16:"module/smartmenu";i:105;s:14:"module/special";i:106;s:12:"module/store";i:107;s:16:"module/topslider";i:108;s:14:"module/upsells";i:109;s:17:"module/veplatform";i:110;s:14:"openbay/amazon";i:111;s:22:"openbay/amazon_listing";i:112;s:22:"openbay/amazon_product";i:113;s:16:"openbay/amazonus";i:114;s:24:"openbay/amazonus_listing";i:115;s:24:"openbay/amazonus_product";i:116;s:12:"openbay/ebay";i:117;s:20:"openbay/ebay_profile";i:118;s:21:"openbay/ebay_template";i:119;s:12:"openbay/etsy";i:120;s:20:"openbay/etsy_product";i:121;s:21:"openbay/etsy_shipping";i:122;s:17:"openbay/etsy_shop";i:123;s:23:"payment/amazon_checkout";i:124;s:24:"payment/amazon_login_pay";i:125;s:24:"payment/authorizenet_aim";i:126;s:24:"payment/authorizenet_sim";i:127;s:21:"payment/bank_transfer";i:128;s:22:"payment/bluepay_hosted";i:129;s:24:"payment/bluepay_redirect";i:130;s:14:"payment/cheque";i:131;s:11:"payment/cod";i:132;s:17:"payment/firstdata";i:133;s:24:"payment/firstdata_remote";i:134;s:21:"payment/free_checkout";i:135;s:17:"payment/globalpay";i:136;s:24:"payment/globalpay_remote";i:137;s:22:"payment/klarna_account";i:138;s:22:"payment/klarna_invoice";i:139;s:14:"payment/liqpay";i:140;s:14:"payment/nochex";i:141;s:15:"payment/paymate";i:142;s:16:"payment/paypoint";i:143;s:13:"payment/payza";i:144;s:26:"payment/perpetual_payments";i:145;s:18:"payment/pp_express";i:146;s:18:"payment/pp_payflow";i:147;s:25:"payment/pp_payflow_iframe";i:148;s:14:"payment/pp_pro";i:149;s:21:"payment/pp_pro_iframe";i:150;s:19:"payment/pp_standard";i:151;s:14:"payment/realex";i:152;s:21:"payment/realex_remote";i:153;s:22:"payment/sagepay_direct";i:154;s:22:"payment/sagepay_server";i:155;s:18:"payment/sagepay_us";i:156;s:24:"payment/securetrading_pp";i:157;s:24:"payment/securetrading_ws";i:158;s:14:"payment/skrill";i:159;s:19:"payment/twocheckout";i:160;s:28:"payment/web_payment_software";i:161;s:16:"payment/worldpay";i:162;s:16:"report/affiliate";i:163;s:25:"report/affiliate_activity";i:164;s:22:"report/affiliate_login";i:165;s:24:"report/customer_activity";i:166;s:22:"report/customer_credit";i:167;s:21:"report/customer_login";i:168;s:22:"report/customer_online";i:169;s:21:"report/customer_order";i:170;s:22:"report/customer_reward";i:171;s:16:"report/marketing";i:172;s:24:"report/product_purchased";i:173;s:21:"report/product_viewed";i:174;s:18:"report/sale_coupon";i:175;s:17:"report/sale_order";i:176;s:18:"report/sale_return";i:177;s:20:"report/sale_shipping";i:178;s:15:"report/sale_tax";i:179;s:23:"report/vendorwise_order";i:180;s:25:"report/vendorwise_product";i:181;s:17:"sale/custom_field";i:182;s:13:"sale/customer";i:183;s:20:"sale/customer_ban_ip";i:184;s:19:"sale/customer_group";i:185;s:10:"sale/order";i:186;s:14:"sale/recurring";i:187;s:11:"sale/return";i:188;s:12:"sale/voucher";i:189;s:18:"sale/voucher_theme";i:190;s:15:"setting/setting";i:191;s:13:"setting/store";i:192;s:15:"shipping/vendor";i:193;s:19:"simple_blog/article";i:194;s:18:"simple_blog/author";i:195;s:20:"simple_blog/category";i:196;s:19:"simple_blog/comment";i:197;s:19:"simple_blog/install";i:198;s:18:"simple_blog/report";i:199;s:18:"subscribe/5_10plan";i:200;s:14:"subscribe/plan";i:201;s:15:"tickets/tickets";i:202;s:11:"tool/backup";i:203;s:14:"tool/error_log";i:204;s:18:"tool/export_import";i:205;s:11:"tool/upload";i:206;s:12:"total/coupon";i:207;s:12:"total/credit";i:208;s:14:"total/handling";i:209;s:16:"total/klarna_fee";i:210;s:19:"total/low_order_fee";i:211;s:12:"total/reward";i:212;s:14:"total/shipping";i:213;s:15:"total/sub_total";i:214;s:9:"total/tax";i:215;s:11:"total/total";i:216;s:13:"total/voucher";i:217;s:8:"user/api";i:218;s:9:"user/user";i:219;s:20:"user/user_permission";}s:6:"modify";a:220:{i:0;s:13:"autopost/plan";i:1;s:17:"catalog/attribute";i:2;s:23:"catalog/attribute_group";i:3;s:20:"catalog/bank_details";i:4;s:16:"catalog/category";i:5;s:16:"catalog/download";i:6;s:14:"catalog/filter";i:7;s:19:"catalog/information";i:8;s:20:"catalog/manufacturer";i:9;s:17:"catalog/mcategory";i:10;s:16:"catalog/mproduct";i:11;s:14:"catalog/option";i:12;s:15:"catalog/product";i:13;s:17:"catalog/recurring";i:14;s:14:"catalog/review";i:15;s:21:"catalog/seller_review";i:16;s:15:"common/6_12menu";i:17;s:18:"common/column_left";i:18;s:18:"common/filemanager";i:19;s:11:"common/menu";i:20;s:14:"common/profile";i:21;s:12:"common/stats";i:22;s:21:"dashboard/best_seller";i:23;s:15:"dashboard/brand";i:24;s:20:"dashboard/commission";i:25;s:16:"dashboard/coupon";i:26;s:15:"dashboard/debit";i:27;s:24:"dashboard/most_purchased";i:28;s:21:"dashboard/most_viewed";i:29;s:25:"dashboard/order_by_status";i:30;s:17:"dashboard/product";i:31;s:14:"dashboard/rate";i:32;s:16:"dashboard/return";i:33;s:18:"dashboard/shipping";i:34;s:20:"dashboard/statistics";i:35;s:17:"dashboard/tickets";i:36;s:21:"dashboard/transaction";i:37;s:14:"dashboard/user";i:38;s:16:"dashboard/vendor";i:39;s:13:"design/banner";i:40;s:13:"design/layout";i:41;s:14:"extension/feed";i:42;s:19:"extension/installer";i:43;s:22:"extension/modification";i:44;s:16:"extension/module";i:45;s:14:"extension/news";i:46;s:17:"extension/openbay";i:47;s:17:"extension/payment";i:48;s:18:"extension/shipping";i:49;s:15:"extension/total";i:50;s:16:"feed/google_base";i:51;s:19:"feed/google_sitemap";i:52;s:15:"feed/openbaypro";i:53;s:22:"funds/sales_commission";i:54;s:20:"funds/vendor_payment";i:55;s:20:"localisation/country";i:56;s:21:"localisation/currency";i:57;s:21:"localisation/geo_zone";i:58;s:21:"localisation/language";i:59;s:25:"localisation/length_class";i:60;s:21:"localisation/location";i:61;s:25:"localisation/order_status";i:62;s:26:"localisation/return_action";i:63;s:26:"localisation/return_reason";i:64;s:26:"localisation/return_status";i:65;s:25:"localisation/stock_status";i:66;s:22:"localisation/tax_class";i:67;s:21:"localisation/tax_rate";i:68;s:33:"localisation/vendor_shipping_rate";i:69;s:25:"localisation/weight_class";i:70;s:17:"localisation/zone";i:71;s:19:"marketing/affiliate";i:72;s:17:"marketing/contact";i:73;s:16:"marketing/coupon";i:74;s:19:"marketing/marketing";i:75;s:20:"merchant/filemanager";i:76;s:14:"module/account";i:77;s:22:"module/advanced_colors";i:78;s:16:"module/affiliate";i:79;s:20:"module/amazon_button";i:80;s:19:"module/amazon_login";i:81;s:17:"module/amazon_pay";i:82;s:13:"module/banner";i:83;s:17:"module/bestseller";i:84;s:15:"module/carousel";i:85;s:15:"module/category";i:86;s:20:"module/customisation";i:87;s:19:"module/ebay_listing";i:88;s:16:"module/fcategory";i:89;s:15:"module/featured";i:90;s:13:"module/filter";i:91;s:18:"module/footer_info";i:92;s:22:"module/google_hangouts";i:93;s:11:"module/html";i:94;s:18:"module/information";i:95;s:13:"module/latest";i:96;s:11:"module/news";i:97;s:14:"module/popular";i:98;s:16:"module/pp_button";i:99;s:15:"module/pp_login";i:100;s:13:"module/random";i:101;s:18:"module/simple_blog";i:102;s:27:"module/simple_blog_category";i:103;s:16:"module/slideshow";i:104;s:16:"module/smartmenu";i:105;s:14:"module/special";i:106;s:12:"module/store";i:107;s:16:"module/topslider";i:108;s:14:"module/upsells";i:109;s:17:"module/veplatform";i:110;s:14:"openbay/amazon";i:111;s:22:"openbay/amazon_listing";i:112;s:22:"openbay/amazon_product";i:113;s:16:"openbay/amazonus";i:114;s:24:"openbay/amazonus_listing";i:115;s:24:"openbay/amazonus_product";i:116;s:12:"openbay/ebay";i:117;s:20:"openbay/ebay_profile";i:118;s:21:"openbay/ebay_template";i:119;s:12:"openbay/etsy";i:120;s:20:"openbay/etsy_product";i:121;s:21:"openbay/etsy_shipping";i:122;s:17:"openbay/etsy_shop";i:123;s:23:"payment/amazon_checkout";i:124;s:24:"payment/amazon_login_pay";i:125;s:24:"payment/authorizenet_aim";i:126;s:24:"payment/authorizenet_sim";i:127;s:21:"payment/bank_transfer";i:128;s:22:"payment/bluepay_hosted";i:129;s:24:"payment/bluepay_redirect";i:130;s:14:"payment/cheque";i:131;s:11:"payment/cod";i:132;s:17:"payment/firstdata";i:133;s:24:"payment/firstdata_remote";i:134;s:21:"payment/free_checkout";i:135;s:17:"payment/globalpay";i:136;s:24:"payment/globalpay_remote";i:137;s:22:"payment/klarna_account";i:138;s:22:"payment/klarna_invoice";i:139;s:14:"payment/liqpay";i:140;s:14:"payment/nochex";i:141;s:15:"payment/paymate";i:142;s:16:"payment/paypoint";i:143;s:13:"payment/payza";i:144;s:26:"payment/perpetual_payments";i:145;s:18:"payment/pp_express";i:146;s:18:"payment/pp_payflow";i:147;s:25:"payment/pp_payflow_iframe";i:148;s:14:"payment/pp_pro";i:149;s:21:"payment/pp_pro_iframe";i:150;s:19:"payment/pp_standard";i:151;s:14:"payment/realex";i:152;s:21:"payment/realex_remote";i:153;s:22:"payment/sagepay_direct";i:154;s:22:"payment/sagepay_server";i:155;s:18:"payment/sagepay_us";i:156;s:24:"payment/securetrading_pp";i:157;s:24:"payment/securetrading_ws";i:158;s:14:"payment/skrill";i:159;s:19:"payment/twocheckout";i:160;s:28:"payment/web_payment_software";i:161;s:16:"payment/worldpay";i:162;s:16:"report/affiliate";i:163;s:25:"report/affiliate_activity";i:164;s:22:"report/affiliate_login";i:165;s:24:"report/customer_activity";i:166;s:22:"report/customer_credit";i:167;s:21:"report/customer_login";i:168;s:22:"report/customer_online";i:169;s:21:"report/customer_order";i:170;s:22:"report/customer_reward";i:171;s:16:"report/marketing";i:172;s:24:"report/product_purchased";i:173;s:21:"report/product_viewed";i:174;s:18:"report/sale_coupon";i:175;s:17:"report/sale_order";i:176;s:18:"report/sale_return";i:177;s:20:"report/sale_shipping";i:178;s:15:"report/sale_tax";i:179;s:23:"report/vendorwise_order";i:180;s:25:"report/vendorwise_product";i:181;s:17:"sale/custom_field";i:182;s:13:"sale/customer";i:183;s:20:"sale/customer_ban_ip";i:184;s:19:"sale/customer_group";i:185;s:10:"sale/order";i:186;s:14:"sale/recurring";i:187;s:11:"sale/return";i:188;s:12:"sale/voucher";i:189;s:18:"sale/voucher_theme";i:190;s:15:"setting/setting";i:191;s:13:"setting/store";i:192;s:15:"shipping/vendor";i:193;s:19:"simple_blog/article";i:194;s:18:"simple_blog/author";i:195;s:20:"simple_blog/category";i:196;s:19:"simple_blog/comment";i:197;s:19:"simple_blog/install";i:198;s:18:"simple_blog/report";i:199;s:18:"subscribe/5_10plan";i:200;s:14:"subscribe/plan";i:201;s:15:"tickets/tickets";i:202;s:11:"tool/backup";i:203;s:14:"tool/error_log";i:204;s:18:"tool/export_import";i:205;s:11:"tool/upload";i:206;s:12:"total/coupon";i:207;s:12:"total/credit";i:208;s:14:"total/handling";i:209;s:16:"total/klarna_fee";i:210;s:19:"total/low_order_fee";i:211;s:12:"total/reward";i:212;s:14:"total/shipping";i:213;s:15:"total/sub_total";i:214;s:9:"total/tax";i:215;s:11:"total/total";i:216;s:13:"total/voucher";i:217;s:8:"user/api";i:218;s:9:"user/user";i:219;s:20:"user/user_permission";}}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_vendor_shipping_class`
--

CREATE TABLE IF NOT EXISTS `oc_vendor_shipping_class` (
  `vendor_shipping_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `vendor_shipping_rate_id` int(11) NOT NULL,
  PRIMARY KEY (`vendor_shipping_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `oc_vendor_shipping_class`
--

INSERT INTO `oc_vendor_shipping_class` (`vendor_shipping_class_id`, `title`, `description`, `date_added`, `date_modified`, `vendor_shipping_rate_id`) VALUES
(13, 'Free Shipping', 'Free Shipping', '2015-12-07 16:24:28', '0000-00-00 00:00:00', 14),
(14, 'international Shipping', 'international Shipping', '2015-12-07 16:24:45', '0000-00-00 00:00:00', 15),
(12, 'local shipping', 'local shipping', '2015-12-07 16:24:20', '0000-00-00 00:00:00', 13);

-- --------------------------------------------------------

--
-- Table structure for table `oc_vendor_shipping_rate`
--

CREATE TABLE IF NOT EXISTS `oc_vendor_shipping_rate` (
  `vendor_shipping_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`vendor_shipping_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `oc_vendor_shipping_rate`
--

INSERT INTO `oc_vendor_shipping_rate` (`vendor_shipping_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(15, 0, 'international Shipping', '100.0000', 'F', '2015-12-07 16:24:45', '2015-12-07 18:32:28'),
(14, 4, 'Free Shipping', '0.0000', 'F', '2015-12-07 16:24:28', '2015-12-07 16:24:28'),
(13, 4, 'local shipping', '50.0000', 'F', '2015-12-07 16:24:20', '2015-12-07 16:24:20');

-- --------------------------------------------------------

--
-- Table structure for table `oc_vendor_shipping_rule`
--

CREATE TABLE IF NOT EXISTS `oc_vendor_shipping_rule` (
  `vendor_shipping_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_shipping_class_id` int(11) NOT NULL,
  `vendor_shipping_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`vendor_shipping_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `oc_vendor_shipping_rule`
--

INSERT INTO `oc_vendor_shipping_rule` (`vendor_shipping_rule_id`, `vendor_shipping_class_id`, `vendor_shipping_rate_id`, `based`, `priority`) VALUES
(6, 13, 14, 'payment', 1),
(5, 12, 13, 'payment', 1),
(7, 14, 15, 'payment', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher`
--

CREATE TABLE IF NOT EXISTS `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_history`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `oc_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, '1.00000000'),
(2, '1000.00000000'),
(5, '2.20460000'),
(6, '35.27400000');

-- --------------------------------------------------------

--
-- Table structure for table `oc_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4225 ;

--
-- Dumping data for table `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M''Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu''a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark''unik''', 'GEG', 1),
(184, 11, 'Kotayk''', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik''', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots'' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore''s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel''skaya (Homyel'')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George''s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith''s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M''Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O''Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '''Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma''iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa''id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina''', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina''', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d''Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand''Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Pondicherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta''mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be''er Sheva', 'BS', 1),
(1613, 104, 'Bika''at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '''Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al ''Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa''', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa''', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma''an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P''yongan-bukto', 'PYB', 1),
(1769, 112, 'P''yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P''yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 1),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al ''Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra''', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale''s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha''s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al ''Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati''', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke''s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa''id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2737, 176, 'Gomo-Altaysk', 'GO', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul''yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust''-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A''ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa''asaleleaga', 'FA', 1),
(2856, 181, 'Gaga''emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa''itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '''Asir', 'AS', 1),
(2882, 184, 'Ha''il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A''ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1);
INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t''ou', 'NT', 1),
(3145, 206, 'P''eng-hu', 'PH', 1),
(3146, 206, 'P''ing-tung', 'PT', 1),
(3147, 206, 'T''ai-chung', 'TG', 1),
(3148, 206, 'T''ai-nan', 'TA', 1),
(3149, 206, 'T''ai-pei county', 'TP', 1),
(3150, 206, 'T''ai-tung', 'TT', 1),
(3151, 206, 'T''ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T''ai-chung', 'TH', 1),
(3157, 206, 'T''ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T''ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha''apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava''u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkas''ka Oblast''', '71', 1),
(3481, 220, 'Chernihivs''ka Oblast''', '74', 1),
(3482, 220, 'Chernivets''ka Oblast''', '77', 1),
(3483, 220, 'Crimea', '43', 1),
(3484, 220, 'Dnipropetrovs''ka Oblast''', '12', 1),
(3485, 220, 'Donets''ka Oblast''', '14', 1),
(3486, 220, 'Ivano-Frankivs''ka Oblast''', '26', 1),
(3487, 220, 'Khersons''ka Oblast''', '65', 1),
(3488, 220, 'Khmel''nyts''ka Oblast''', '68', 1),
(3489, 220, 'Kirovohrads''ka Oblast''', '35', 1),
(3490, 220, 'Kyiv', '30', 1),
(3491, 220, 'Kyivs''ka Oblast''', '32', 1),
(3492, 220, 'Luhans''ka Oblast''', '09', 1),
(3493, 220, 'L''vivs''ka Oblast''', '46', 1),
(3494, 220, 'Mykolayivs''ka Oblast''', '48', 1),
(3495, 220, 'Odes''ka Oblast''', '51', 1),
(3496, 220, 'Poltavs''ka Oblast''', '53', 1),
(3497, 220, 'Rivnens''ka Oblast''', '56', 1),
(3498, 220, 'Sevastopol''', '40', 1),
(3499, 220, 'Sums''ka Oblast''', '59', 1),
(3500, 220, 'Ternopil''s''ka Oblast''', '61', 1),
(3501, 220, 'Vinnyts''ka Oblast''', '05', 1),
(3502, 220, 'Volyns''ka Oblast''', '07', 1),
(3503, 220, 'Zakarpats''ka Oblast''', '21', 1),
(3504, 220, 'Zaporiz''ka Oblast''', '23', 1),
(3505, 220, 'Zhytomyrs''ka oblast''', '18', 1),
(3506, 221, 'Abu Zaby', 'AZ', 1),
(3507, 221, '''Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubayy', 'DU', 1),
(3511, 221, 'R''as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg''ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma''rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa''dah', 'SD', 1),
(3805, 235, 'San''a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta''izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Kharkivs''ka Oblast''', '63', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 222, 3513, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 222, 3514, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 222, 3515, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 222, 3516, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 222, 3517, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 222, 3518, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 222, 3519, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 222, 3520, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 222, 3521, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 222, 3522, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 222, 3523, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 222, 3524, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 222, 3525, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 222, 3526, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 222, 3527, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 222, 3528, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 222, 3529, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 222, 3530, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 222, 3531, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 222, 3532, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 222, 3533, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 222, 3534, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 222, 3535, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 222, 3536, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 222, 3537, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 222, 3538, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 222, 3539, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 222, 3540, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 222, 3541, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 222, 3542, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 222, 3543, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 222, 3544, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 222, 3545, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 222, 3546, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 222, 3547, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 222, 3548, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 222, 3549, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 222, 3550, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 222, 3551, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 222, 3552, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 222, 3553, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 222, 3554, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 222, 3555, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 222, 3556, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 222, 3557, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 222, 3558, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 222, 3559, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 222, 3560, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 222, 3561, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 222, 3562, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 222, 3563, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 222, 3564, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 222, 3565, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 222, 3566, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 222, 3567, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 222, 3568, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 222, 3569, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 222, 3570, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 222, 3571, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 222, 3572, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 222, 3573, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 222, 3574, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 222, 3575, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 222, 3576, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 222, 3577, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 222, 3578, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 222, 3579, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 222, 3580, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 222, 3581, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 222, 3582, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 222, 3583, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 222, 3584, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 222, 3585, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 222, 3586, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 222, 3587, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 222, 3588, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 222, 3589, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 222, 3590, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 222, 3591, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 222, 3592, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 222, 3593, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 222, 3594, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 222, 3595, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 222, 3596, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 222, 3597, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 222, 3598, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 222, 3599, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 222, 3600, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 222, 3601, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 222, 3602, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 222, 3603, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 222, 3604, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 222, 3605, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 222, 3606, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 222, 3607, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(97, 222, 3608, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 222, 3609, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 222, 3610, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 222, 3611, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 222, 3612, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 222, 3949, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 222, 3950, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 222, 3951, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 222, 3952, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 222, 3953, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 222, 3954, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 222, 3955, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 222, 3972, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
