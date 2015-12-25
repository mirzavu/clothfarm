<?php require_once("smsAdapter.php"); require_once("variables.php"); define("SMS_NAME_MOD", "Cart SMS for OpenCart by TOPefekt s.r.o."); class ModelSmsMain extends Model { public function Execute($ife90ec3ee83cd90f9098beed08a011650ddba7e7) { return $this->db->query($ife90ec3ee83cd90f9098beed08a011650ddba7e7); } public function lastInsertId() { return $this->db->getLastId(); } public function escape($ibd0578718e12a692b299a588249092e07aac601e) { return $this->db->escape($ibd0578718e12a692b299a588249092e07aac601e); } public function getDb() { return $this->db; } public function createTable() { $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "sp_settings ( `ID` int(5) NOT NULL AUTO_INCREMENT, `name` varchar(100) CHARACTER SET utf8 NOT NULL, `value` text NOT NULL, PRIMARY KEY (`ID`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;"); $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "sp_optout_prices ( `ID` int(7) NOT NULL AUTO_INCREMENT, `shop_id` int(5) NOT NULL, `price` double(10,4) NOT NULL, `currency` varchar(20) NOT NULL, `active` tinyint(3) NOT NULL, PRIMARY KEY (`ID`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;"); $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "sp_optout_texts ( `ID` int(7) NOT NULL AUTO_INCREMENT, `shop_id` int(5) NOT NULL, `text` text NOT NULL, `lang` varchar(20) NOT NULL, PRIMARY KEY (`ID`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;"); $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "sp_optout_deleted ( `ID` int(10) NOT NULL AUTO_INCREMENT, `order_id` int(10) NOT NULL, PRIMARY KEY (`ID`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;"); $i83d1339527a9dc91b02fa99420eb13b0cd47adfe = $this->db->query("SELECT count(*) as count FROM " . DB_PREFIX . "sp_settings where name like 'AppID'"); if($i83d1339527a9dc91b02fa99420eb13b0cd47adfe->num_rows) { $i35d0bf7a77a6df945bffd9eb93f1166d26c8231f = $i83d1339527a9dc91b02fa99420eb13b0cd47adfe->row["count"]; } if(!($i35d0bf7a77a6df945bffd9eb93f1166d26c8231f > 0)) { $this->db->query("INSERT INTO " . DB_PREFIX . "sp_settings VALUES (NULL , 'AppID', '" . rand(1000000, 90000000) . "' )"); } $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "sp_smsuser ( `ID` tinyint(1) NOT NULL AUTO_INCREMENT, `user` varchar(55) CHARACTER SET utf8 NOT NULL, `passwd` varchar(55) CHARACTER SET utf8 NOT NULL, `email` varchar(100) CHARACTER SET utf8 NOT NULL, `companyname` varchar(100) CHARACTER SET utf8 NOT NULL, `addressstreet` varchar(100) CHARACTER SET utf8 NOT NULL, `addresscity` varchar(100) CHARACTER SET utf8 NOT NULL, `addresszip` varchar(100) CHARACTER SET utf8 NOT NULL, `country0` varchar(100) CHARACTER SET utf8 NOT NULL, `companyid` varchar(100) CHARACTER SET utf8 NOT NULL, `companyvat` varchar(100) CHARACTER SET utf8 NOT NULL, `simulatesms` tinyint(3) NOT NULL, `deletedb` tinyint(3) NOT NULL, `pocetkredit` int(6) NOT NULL, `deliveryemail` varchar(100) NOT NULL, `URLreports` tinyint(3) NOT NULL, `kosoba` varchar(100) CHARACTER SET utf8 NOT NULL, `kprijmeni` varchar(100) CHARACTER SET utf8 NOT NULL, PRIMARY KEY (`ID`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;"); $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "sp_admins ( `ID` int(5) NOT NULL AUTO_INCREMENT, `name` varchar(100) CHARACTER SET utf8 NOT NULL, `number` varchar(20) CHARACTER SET utf8 NOT NULL, PRIMARY KEY (`ID`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;"); $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "sp_hooks_admins_multi` ( `name` varchar(100) NOT NULL, `status` varchar(40) NOT NULL, `smstext` text NOT NULL, `adminIDs` varchar(250) NOT NULL, `storeID` bigint(25) NOT NULL ) ENGINE=MyISAM DEFAULT CHARSET=utf8;"); $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "sp_hooks_customers ( `name` varchar(100) CHARACTER SET utf8 NOT NULL, `status` varchar(40) NOT NULL, `smstext` text CHARACTER SET utf8 NOT NULL, `active` tinyint(3) NOT NULL, `mutation` varchar(100) NOT NULL, `storeID` bigint(25) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;"); $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "sp_variables ( `name` varchar(200) CHARACTER SET utf8 NOT NULL, `template` text CHARACTER SET utf8 NOT NULL, UNIQUE KEY `name` (`name`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;"); $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "sp_hooks_templates ( `area` varchar(10) CHARACTER SET utf8 NOT NULL, `area_text` varchar(50) CHARACTER SET utf8 NOT NULL, UNIQUE KEY `area` (`area`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;"); $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "sp_hooks_unicode ( `area` varchar(10) NOT NULL, `unicode` tinyint(3) NOT NULL, `type` varchar(10) NOT NULL ) ENGINE=MyISAM DEFAULT CHARSET=utf8;"); $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "sp_ownnumbersenderIDs ( `ownnumbersenderID` varchar(30) CHARACTER SET utf8 NOT NULL, UNIQUE KEY `textsenderID` (`ownnumbersenderID`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;"); $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "sp_routes ( `area` int(5) NOT NULL, `type` varchar(20) CHARACTER SET utf8 NOT NULL, `isms` int(5) NOT NULL, `sendertype` tinyint(3) NOT NULL, `senderID` varchar(30) CHARACTER SET utf8 NOT NULL, `info` text CHARACTER SET utf8 NOT NULL, `area_text` varchar(50) CHARACTER SET utf8 NOT NULL ) ENGINE=MyISAM DEFAULT CHARSET=utf8;"); $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "sp_sms_history ( `ID` int(8) NOT NULL AUTO_INCREMENT, `number` varchar(30) NOT NULL, `date` datetime NOT NULL, `text` text NOT NULL, `status` tinyint(3) NOT NULL, `price` double(5,3) NOT NULL, `credit` double(15,3) NOT NULL, `sender` varchar(30) NOT NULL, `unicode` tinyint(3) NOT NULL, `type` tinyint(3) NOT NULL, `smsID` varchar(220) NOT NULL, `note` varchar(100) NOT NULL, `total` tinyint(3) NOT NULL, `admin_ID` int(8) NOT NULL, `customer_ID` int(8) NOT NULL, `recipient` varchar(100) NOT NULL, `subject` varchar(100) NOT NULL, `change` tinyint(1) NOT NULL DEFAULT '1', `campaign` int(11) DEFAULT NULL, PRIMARY KEY (`ID`), KEY `vyber1` (`date`), KEY `vyber2` (`date`,`type`), KEY `vyber3` (`date`,`type`,`status`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;"); $i83d1339527a9dc91b02fa99420eb13b0cd47adfe = $this->db->query("DESCRIBE " . DB_PREFIX . "sp_sms_history"); if($i83d1339527a9dc91b02fa99420eb13b0cd47adfe->num_rows) { foreach($i83d1339527a9dc91b02fa99420eb13b0cd47adfe->rows as $i2e93e61d67c274d891066238c74ba6322d527b6d) { $iec8a76698ea13aa593dd79d83364faf95a7d7f73[] = $i2e93e61d67c274d891066238c74ba6322d527b6d["Field"]; } if(count($iec8a76698ea13aa593dd79d83364faf95a7d7f73) && !in_array("change", $iec8a76698ea13aa593dd79d83364faf95a7d7f73)) { $this->db->query("ALTER TABLE `" . DB_PREFIX . "sp_sms_history` ADD COLUMN `change` tinyint(1) NOT NULL DEFAULT 1;"); } if(count($iec8a76698ea13aa593dd79d83364faf95a7d7f73) && !in_array("campaign", $iec8a76698ea13aa593dd79d83364faf95a7d7f73)) { $this->db->query("ALTER TABLE `" . DB_PREFIX . "sp_sms_history` ADD COLUMN `campaign` int(11) DEFAULT NULL;"); } } $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "sp_textsenderIDs ( `textsenderID` varchar(11) CHARACTER SET utf8 NOT NULL, UNIQUE KEY `textsenderID` (`textsenderID`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8;"); $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "sp_answers ( `ID` int(5) NOT NULL AUTO_INCREMENT, `text` text NOT NULL, `from` varchar(50) NOT NULL DEFAULT '', `prohlednuto` tinyint(3) NOT NULL DEFAULT '0', `smsc` varchar(100) NOT NULL DEFAULT '', `cas` datetime NOT NULL DEFAULT '0000-00-00 00:00:00', PRIMARY KEY (`ID`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;"); $this->db->query("CREATE TABLE IF NOT EXISTS " . DB_PREFIX . "sp_outofstock ( `ID` int(8) NOT NULL AUTO_INCREMENT, `datum` date NOT NULL, `product_ID` int(8) NOT NULL, PRIMARY KEY (`ID`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8 ;"); $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "sp_marketing_filter` ( `id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(200) NOT NULL, `filter` text, `disabled` text, `disabled_counter` int(11) NOT NULL DEFAULT '0', `date` datetime NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;"); $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "sp_template` ( `id` int(11) NOT NULL AUTO_INCREMENT, `name` varchar(200) NOT NULL, `template` text, `unicode` tinyint(1) NOT NULL DEFAULT '0', `unique` tinyint(1) NOT NULL DEFAULT '0', `date` datetime NOT NULL, `type` int(11) NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;"); $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "sp_exceptions` ( `id` int(11) NOT NULL AUTO_INCREMENT, `prefix` int(11) NOT NULL, `firstPrefix` int(11) NOT NULL, `length` int(11) NOT NULL, `trim` int(11) NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;"); $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "sp_config` ( `shop_id` int(11) NOT NULL, `config_name` varchar(200) NOT NULL, `config_value` text NOT NULL, PRIMARY KEY (`shop_id`,`config_name`) ) ENGINE=InnoDB DEFAULT CHARSET=utf8;"); $this->db->query("DELETE FROM `" . DB_PREFIX . "modification` WHERE (`name`='" . SMS_NAME_MOD . "')"); if(VERSION == "2.0.0.0") { $this->db->query("INSERT INTO `" . DB_PREFIX . "modification` (`name`, `author`, `version`, `link`, `code`, `status`, `date_added`) VALUES ('" . SMS_NAME_MOD . "', 'TOPefekt (Lukáš Piják)', '" . number_format(SMS_VERSION, 2) . "', 'http://" . SMS_WEB_URL . "', '" . addslashes(file_get_contents(DIR_APPLICATION . "model/sms/cartsms.ocmod.xml")) . "', 1, NOW())"); } else { $this->db->query("INSERT INTO `" . DB_PREFIX . "modification` (`name`, `author`, `version`, `link`, `xml`, `status`, `date_added`, `code`) VALUES ('" . SMS_NAME_MOD . "', 'TOPefekt (Lukáš Piják)', '" . number_format(SMS_VERSION, 2) . "', 'http://" . SMS_WEB_URL . "', '" . addslashes(file_get_contents(DIR_APPLICATION . "model/sms/cartsms.ocmod.xml")) . "', 1, NOW(), 'cartsms')"); } } public function deleteTable() { $i83d1339527a9dc91b02fa99420eb13b0cd47adfe = $this->db->query("SELECT deletedb FROM " . DB_PREFIX . "sp_smsuser WHERE ID=1"); if($i83d1339527a9dc91b02fa99420eb13b0cd47adfe->num_rows && $i83d1339527a9dc91b02fa99420eb13b0cd47adfe->row["deletedb"] == 1) { $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_settings"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_smsuser"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_admins"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_hooks_admins_multi"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_hooks_customers"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_variables"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_hooks_templates"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_hooks_unicode"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_ownnumbersenderIDs"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_routes"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_sms_history"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_textsenderIDs"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_answers"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_outofstock"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_optout_deleted"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_optout_prices"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_optout_texts"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_marketing_filter"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_template"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_exceptions"); $this->db->query("DROP TABLE IF EXISTS " . DB_PREFIX . "sp_config"); } $this->db->query("DELETE FROM `" . DB_PREFIX . "modification` WHERE (`name`='" . SMS_NAME_MOD . "')"); } } 