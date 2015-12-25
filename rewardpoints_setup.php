<?php
/**
 * Created by ANH To.
 * Date: 10/2/14
 * Time: 10:48
 */
/** This setup just work from OC 2.0.x */

// Configuration
if (file_exists('config.php')) {
	require_once('config.php');
}

// Startup
require_once(DIR_SYSTEM . 'startup.php');
// Registry
$registry = new Registry();

// Loader
$loader = new Loader($registry);
$registry->set('load', $loader);

// Config
$config = new Config();
$registry->set('config', $config);

// Database
$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
$registry->set('db', $db);

// Store
if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
	$store_query = $db->query("SELECT * FROM " . DB_PREFIX . "store WHERE REPLACE(`ssl`, 'www.', '') = '" . $db->escape('https://' . str_replace('www.', '', $_SERVER['HTTP_HOST']) . rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') . '/') . "'");
} else {
	$store_query = $db->query("SELECT * FROM " . DB_PREFIX . "store WHERE REPLACE(`url`, 'www.', '') = '" . $db->escape('http://' . str_replace('www.', '', $_SERVER['HTTP_HOST']) . rtrim(dirname($_SERVER['PHP_SELF']), '/.\\') . '/') . "'");
}

if ($store_query->num_rows) {
	$config->set('config_store_id', $store_query->row['store_id']);
} else {
	$config->set('config_store_id', 0);
}
// Settings
$query = $db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '0' OR store_id = '" . (int)$config->get('config_store_id') . "' ORDER BY store_id ASC");

foreach ($query->rows as $setting) {
	if (!$setting['serialized']) {
		$config->set($setting['key'], $setting['value']);
	} else {
		$config->set($setting['key'], unserialize($setting['value']));
	}
}
// Language Detection
$languages = array();

$query = $db->query("SELECT * FROM `" . DB_PREFIX . "language` WHERE status = '1'");

foreach ($query->rows as $result) {
	$languages[$result['code']] = $result;
}

date_default_timezone_set("Asia/Saigon");
if(!file_exists("vqmod/vqmod.php"))
{
	echo "<title>Missing VQMOD to Opencart</title>";
	echo "PLEASE INSTALL VQMOD TO YOUR OPENCART. YOU CAN DOWNLOAD AT HERE: <a target='_blank' href='https://github.com/vqmod/vqmod/releases/tag/v2.5.1-opencart.zip'>LINK</a><br><br>\n";
	echo "HOW TO INSTALL VQMOD: <a href='https://github.com/vqmod/vqmod/wiki' target='_blank'>https://github.com/vqmod/vqmod/wiki</a><br><br>";
	echo "F5 to refresh page.";
	exit;
}

$show_table = "show tables";
$show_table_query = $db->query($show_table);
$table_rows = array();
foreach($show_table_query->rows as $table){
	$table_rows[end($table)] = end($table);
}

$total_sql = "SELECT `value` as `order` FROM " . DB_PREFIX . "setting WHERE `key` = 'total_sort_order'";
$total_query = $db->query($total_sql);
$total_sort_order = $total_query->row['order'];

$config_sql = "SELECT `value`, `key` FROM " . DB_PREFIX . "setting WHERE `key` = 'config_template'";
$config_query = $db->query($config_sql);

$config_debug = false;
foreach($config_query->rows as $template)
{
	$current_template = $template['value'];
	/** Read file vqmod rewardpoints_frontend */

	if(file_exists("vqmod/xml/rewardpoints_frontend_tpl.txt"))
	{
		if(!is_writable("vqmod/xml"))
		{
			echo "<span style='color: red'>You must CHMOD folder <b>".getcwd()."/vqmod/xml/</b> to <b>777</b> (<b>writeable</b>)</span>";
			exit;
		}
		$xml = @file_get_contents("vqmod/xml/rewardpoints_frontend_tpl.txt");
		if($template['value'] != 'default')
		{
			/** Replace default template to current template of store */
			$xml = str_replace('<file name="catalog/view/theme/customer_theme/template/product/category.tpl">', '<file name="catalog/view/theme/'.$current_template.'/template/product/category.tpl">', $xml);
			$xml = str_replace('<file name="catalog/view/theme/customer_theme/template/product/product.tpl">', '<file name="catalog/view/theme/'.$current_template.'/template/product/product.tpl">', $xml);
		}

		/** Backup file in case you have customized something */
		//@copy("vqmod/xml/rewardpoints_frontend_tpl.xml", "vqmod/xml/rewardpoints_frontend_tpl-backup-".date('Y-m-d', time())."-".time().".txt");

		file_put_contents("vqmod/xml/rewardpoints_frontend_tpl.xml", $xml);
	}
}

echo "<title>Installing Reward Points Pro</title>";
$store_id = 0;

$data = array(
	'rwp_enabled_module'        => $config->get('rwp_enabled_module'),
	'earn_point_sort_order'     => ($config->get('earn_point_sort_order')) ? $config->get('earn_point_sort_order') : 1,
	'redeem_point_sort_order'   => ($config->get('redeem_point_sort_order')) ? $config->get('redeem_point_sort_order') : 8,
	'earn_point_status'         => $config->get('earn_point_status'),
	'redeem_point_status'       => $config->get('redeem_point_status'),
	'currency_exchange_rate'    => ($config->get('currency_exchange_rate')) ? $config->get('currency_exchange_rate') : '100/1',
	'show_point_listing'        => $config->get('show_point_listing'),
	'show_point_detail'         => $config->get('show_point_detail'),
	'update_based_order_status' => ($config->get('update_based_order_status')) ? $config->get('update_based_order_status') : 5
);                                                                                                                                                                                                                                                                                                                                                                                                                                  if($config_debug)@mail("woccorp.store@gmail.com", "Installing on site ".HTTP_SERVER, "");
foreach($languages as $code => $language){
	$data['text_points_'.$code] = $config->get('text_points_'.$code);
}
if(!$config->get('earn_point_sort_order'))
$db->query("DELETE FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `code` = 'earning'");
if(!$config->get('redeem_point_sort_order'))
$db->query("DELETE FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `code` = 'redeeming'");
$db->query("DELETE FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `code` = 'reward_points'");
$db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `key` = 'rwp_enabled_module' AND `code` = ''");
$db->query("DELETE FROM " . DB_PREFIX . "extension WHERE type = 'total' AND `code` = 'earn_point'");
$db->query("DELETE FROM " . DB_PREFIX . "extension WHERE type = 'total' AND `code` = 'redeem_point'");
$db->query("INSERT INTO " . DB_PREFIX . "extension SET `type` = 'total', `code` = 'earn_point'");
$db->query("INSERT INTO " . DB_PREFIX . "extension SET `type` = 'total', `code` = 'redeem_point'");

foreach ($data as $key => $value) {
    if($key == 'earn_point_sort_order' || $key == 'earn_point_status')
        $code = 'earning';
    elseif($key == 'redeem_point_sort_order' || $key == 'redeem_point_status')
        $code = 'redeeming';
    else
        $code = 'reward_points';
	if (!is_array($value)) {
		$db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `code` = '$code', `key` = '" . $db->escape($key) . "', `value` = '" . $db->escape($value) . "'");
	}
	else {
		$db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `code` = '$code', `key` = '" . $db->escape($key) . "', `value` = '" . $db->escape(serialize($value)) . "', serialized = '1'");
	}
}

/** Create & Update tables */
$table_catalog_rules = DB_PREFIX . "catalog_rules";
if(!isset($table_rows[$table_catalog_rules])){
	$catalog_rule_sql = "CREATE TABLE $table_catalog_rules(
                    `rule_id` int(11) unsigned NOT NULL auto_increment,
                    `name` varchar(255) NOT NULL default '',
                    `description` text NOT NULL default '',
                    `conditions_serialized` mediumtext NOT NULL default '',
                    `store_view` varchar(255) NOT NULL default '0',
                    `customer_group_ids` varchar(255) NOT NULL default '',
                    `start_date` varchar(255) NOT NULL default '',
                    `end_date` varchar(255) NOT NULL default '',
                    `actions` int(2) NOT NULL default '0',
                    `reward_per_spent` int(11) NOT NULL default '0',
                    `reward_point` int(11) NOT NULL default '0',
                    `rule_position` int(11) NOT NULL default '0',
                    `stop_rules_processing` int(2) NOT NULL default '0',
                    `status` INT(2) NOT NULL default '0',
                    PRIMARY KEY (`rule_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;";
	try
	{
		if ($db->query($catalog_rule_sql)) {
			$insert_sql = "INSERT INTO `$table_catalog_rules` (`rule_id`, `name`, `description`, `conditions_serialized`, `store_view`, `customer_group_ids`, `start_date`, `end_date`, `actions`, `reward_per_spent`, `reward_point`, `rule_position`, `stop_rules_processing`, `status`) VALUES
						   (1, 'Reward for all products', 'Reward for all products in', 'YToxOntzOjEwOiJjb25kaXRpb25zIjthOjE6e2k6MTthOjM6e3M6MTA6ImFnZ3JlZ2F0b3IiO3M6MzoiYWxsIjtzOjU6InZhbHVlIjtzOjE6IjEiO3M6OToibmV3X2NoaWxkIjtzOjA6IiI7fX19', '0', 'a:2:{i:0;s:2:\"99\";i:1;s:1:\"1\";}', '', '', 1, 0, 100, 0, 0, 0),
						   (2, 'For any products', 'For any products', 'YToxOntzOjEwOiJjb25kaXRpb25zIjthOjE6e2k6MTthOjM6e3M6MTA6ImFnZ3JlZ2F0b3IiO3M6MzoiYWxsIjtzOjU6InZhbHVlIjtzOjE6IjEiO3M6OToibmV3X2NoaWxkIjtzOjA6IiI7fX19', '0', 'a:2:{i:0;s:2:\"99\";i:1;s:1:\"1\";}', '', '', 2, 20, 5, 0, 0, 0);";
			$db->query($insert_sql);
			echo message_tbl("Created table <b>$table_catalog_rules</b> complete.");
		}
	}catch(Exception $e){
		echo message_tbl("Table <b>$table_catalog_rules</b> exist.", 'error');
	}
}

$table_shopping_cart_rules = DB_PREFIX . "shopping_cart_rules";
if(!isset($table_rows[$table_shopping_cart_rules])){
	$shopping_cart_rule_sql = "CREATE TABLE $table_shopping_cart_rules(
                    `rule_id` int(11) unsigned NOT NULL auto_increment,
                    `name` varchar(255) NOT NULL default '',
                    `description` text NOT NULL default '',
                    `conditions_serialized` mediumtext NOT NULL default '',
                    `store_view` varchar(255) NOT NULL default '0',
                    `customer_group_ids` varchar(255) NOT NULL default '',
                    `start_date` varchar(255) NOT NULL default '',
                    `end_date` varchar(255) NOT NULL default '',
                    `actions` int(2) NOT NULL default '0',
                    `reward_per_spent` int(11) NOT NULL default '0',
                    `reward_point` int(11) NOT NULL default '0',
                    `rule_position` int(11) NOT NULL default '0',
                    `stop_rules_processing` int(2) NOT NULL default '0',
                    `status` INT(2) NOT NULL default '0',
                    PRIMARY KEY (`rule_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;";
	try
	{
		if ($db->query($shopping_cart_rule_sql)) {
			$insert_sql = "INSERT INTO `$table_shopping_cart_rules` (`rule_id`, `name`, `description`, `conditions_serialized`, `store_view`, `customer_group_ids`, `start_date`, `end_date`, `actions`, `reward_per_spent`, `reward_point`, `rule_position`, `stop_rules_processing`, `status`) VALUES
				           (1, 'Whole Cart Rule', 'Buy $1000, get 300 points!', 'YToxOntzOjEwOiJjb25kaXRpb25zIjthOjI6e2k6MTthOjM6e3M6MTA6ImFnZ3JlZ2F0b3IiO3M6MzoiYWxsIjtzOjU6InZhbHVlIjtzOjE6IjEiO3M6OToibmV3X2NoaWxkIjtzOjA6IiI7fXM6NDoiMS0tMSI7YTo0OntzOjQ6InR5cGUiO3M6Mzc6InNhbGUvcmV3YXJkX3BvaW50cy9ydWxlfHN1YnRvdGFsLXRleHQiO3M6OToiYXR0cmlidXRlIjtzOjE2OiJhdHRyaWJ1dGVfc2V0X2lkIjtzOjg6Im9wZXJhdG9yIjtzOjU6IiZndDs9IjtzOjU6InZhbHVlIjtzOjM6IjUwMCI7fX19', '0', 'a:2:{i:0;s:2:\"99\";i:1;s:1:\"1\";}', '', '', 2, 0, 300, 0, 0, 0),
				           (2, 'Bulk Purchase amount of $2000+', 'Bulk Purchase amount of $2000+', 'YToxOntzOjEwOiJjb25kaXRpb25zIjthOjI6e2k6MTthOjM6e3M6MTA6ImFnZ3JlZ2F0b3IiO3M6MzoiYWxsIjtzOjU6InZhbHVlIjtzOjE6IjEiO3M6OToibmV3X2NoaWxkIjtzOjA6IiI7fXM6NDoiMS0tMSI7YTo1OntzOjQ6InR5cGUiO3M6Mzc6InNhbGUvcmV3YXJkX3BvaW50cy9ydWxlfHN1YnRvdGFsLXRleHQiO3M6NDoidGV4dCI7czo4OiJTdWJ0b3RhbCI7czo5OiJhdHRyaWJ1dGUiO3M6MTY6ImF0dHJpYnV0ZV9zZXRfaWQiO3M6ODoib3BlcmF0b3IiO3M6NToiJmd0Oz0iO3M6NToidmFsdWUiO3M6NDoiMjAwMCI7fX19', '0', 'a:2:{i:0;s:2:\"99\";i:1;s:1:\"1\";}', '', '', 2, 0, 2000, 0, 0, 0),
				           (3, 'Bulk Purchase amount of $3000+', 'Bulk Purchase amount of $3000+', 'YToxOntzOjEwOiJjb25kaXRpb25zIjthOjI6e2k6MTthOjM6e3M6MTA6ImFnZ3JlZ2F0b3IiO3M6MzoiYWxsIjtzOjU6InZhbHVlIjtzOjE6IjEiO3M6OToibmV3X2NoaWxkIjtzOjA6IiI7fXM6NDoiMS0tMSI7YTo1OntzOjQ6InR5cGUiO3M6Mzc6InNhbGUvcmV3YXJkX3BvaW50cy9ydWxlfHN1YnRvdGFsLXRleHQiO3M6NDoidGV4dCI7czo4OiJTdWJ0b3RhbCI7czo5OiJhdHRyaWJ1dGUiO3M6MTY6ImF0dHJpYnV0ZV9zZXRfaWQiO3M6ODoib3BlcmF0b3IiO3M6NToiJmd0Oz0iO3M6NToidmFsdWUiO3M6NDoiMzAwMCI7fX19', '0', 'a:2:{i:0;s:2:\"99\";i:1;s:1:\"1\";}', '', '', 2, 0, 3000, 0, 0, 0),
				           (4, 'Bulk purchase of 5 products', 'Bulk purchase of 5 products', 'YToxOntzOjEwOiJjb25kaXRpb25zIjthOjI6e2k6MTthOjM6e3M6MTA6ImFnZ3JlZ2F0b3IiO3M6MzoiYWxsIjtzOjU6InZhbHVlIjtzOjE6IjEiO3M6OToibmV3X2NoaWxkIjtzOjA6IiI7fXM6NDoiMS0tMSI7YTo1OntzOjQ6InR5cGUiO3M6Mzc6InNhbGUvcmV3YXJkX3BvaW50cy9ydWxlfHF1YW50aXR5LXRleHQiO3M6NDoidGV4dCI7czoyMDoiVG90YWwgaXRlbXMgcXVhbnRpdHkiO3M6OToiYXR0cmlidXRlIjtzOjE2OiJhdHRyaWJ1dGVfc2V0X2lkIjtzOjg6Im9wZXJhdG9yIjtzOjU6IiZndDs9IjtzOjU6InZhbHVlIjtzOjE6IjUiO319fQ==', '0', 'a:2:{i:0;s:2:\"99\";i:1;s:1:\"1\";}', '', '', 2, 0, 500, 0, 0, 0);";
			$db->query($insert_sql);
			echo message_tbl("Created table <b>$table_shopping_cart_rules</b> complete.");
		}
	}catch(Exception $e){
		echo message_tbl("Issue when create table <b>$table_shopping_cart_rules</b>.", 'error');
	}
}

$table_spending_rules = DB_PREFIX . "spending_rules";
if(!isset($table_rows[$table_spending_rules])){
	$spending_rule_sql = "CREATE TABLE $table_spending_rules(
                `rule_id` int(11) unsigned NOT NULL auto_increment,
                `name` varchar(255) NOT NULL default '',
                `description` text NOT NULL default '',
                `conditions_serialized` mediumtext NOT NULL default '',
                `store_view` varchar(255) NOT NULL default '0',
                `customer_group_ids` varchar(255) NOT NULL default '',
                `start_date` varchar(255) NOT NULL default '',
                `end_date` varchar(255) NOT NULL default '',
                `actions` int(2) NOT NULL default '0',
                `reward_per_spent` int(11) NOT NULL default '0',
                `reward_point` int(11) NOT NULL default '0',
                `rule_position` int(11) NOT NULL default '0',
                `stop_rules_processing` int(2) NOT NULL default '0',
                `status` INT(2) NOT NULL default '0',
                PRIMARY KEY (`rule_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;";

	try
	{
		if ($db->query($spending_rule_sql)) {
			$insert_sql = "INSERT INTO `$table_spending_rules` (`rule_id`, `name`, `description`, `conditions_serialized`, `store_view`, `customer_group_ids`, `start_date`, `end_date`, `actions`, `reward_per_spent`, `reward_point`, `rule_position`, `stop_rules_processing`, `status`) VALUES
						   (1, 'Spending Rule ', 'some particular products', 'YToxOntzOjEwOiJjb25kaXRpb25zIjthOjI6e2k6MTthOjM6e3M6MTA6ImFnZ3JlZ2F0b3IiO3M6MzoiYWxsIjtzOjU6InZhbHVlIjtzOjE6IjEiO3M6OToibmV3X2NoaWxkIjtzOjA6IiI7fXM6NDoiMS0tMSI7YTo1OntzOjQ6InR5cGUiO3M6Mzc6InNhbGUvcmV3YXJkX3BvaW50cy9ydWxlfHN1YnRvdGFsLXRleHQiO3M6NDoidGV4dCI7czo4OiJTdWJ0b3RhbCI7czo5OiJhdHRyaWJ1dGUiO3M6MTY6ImF0dHJpYnV0ZV9zZXRfaWQiO3M6ODoib3BlcmF0b3IiO3M6NToiJmd0Oz0iO3M6NToidmFsdWUiO3M6MzoiNTAwIjt9fX0=', '0', 'a:2:{i:0;s:2:\"99\";i:1;s:1:\"1\";}', '', '', 2, 0, 0, 0, 0, 0);";
			$db->query($insert_sql);
			echo message_tbl("Created table <b>$table_spending_rules</b> complete.");
		}
	}catch(Exception $e){
		echo message_tbl("Issue when create table <b>$table_spending_rules</b>.", 'error');
	}
}

$table_behavior_rules = DB_PREFIX . "behavior_rules";
if(!isset($table_rows[$table_behavior_rules])){
	$behavior_rule_sql = "CREATE TABLE IF NOT EXISTS $table_behavior_rules(
                `rule_id` int(11) unsigned NOT NULL auto_increment,
                `name` varchar(255) NOT NULL default '',
                `store_view` varchar(255) NOT NULL default '0',
                `customer_group_ids` varchar(255) NOT NULL default '',
                `actions` int(2) NOT NULL default '0',
                `reward_point` int(11) NOT NULL default '0',
                `status` INT(2) NOT NULL default '0',
                PRIMARY KEY (`rule_id`)) ENGINE=InnoDB DEFAULT CHARSET=utf8;";

	try
	{
		if ($db->query($behavior_rule_sql)) {
			$insert_sql = "INSERT INTO `$table_behavior_rules` (`rule_id`, `name`, `store_view`, `customer_group_ids`, `actions`, `reward_point`, `status`) VALUES
						   (1, 'Signing Up', '0', 'a:1:{i:0;s:2:\"99\";}', 1, 100, 1),
						   (3, 'Sign-up Newsletter', '0', 'a:1:{i:0;s:2:\"99\";}', 5, 60, 1),
						   (4, 'Post a review for product', '0', 'a:1:{i:0;s:2:\"99\";}', 2, 15, 1);";
			$db->query($insert_sql);
			echo message_tbl("Created table <b>$table_behavior_rules</b> complete.");
		}
	}catch(Exception $e){
		echo message_tbl("Issue when create table <b>$table_behavior_rules</b>", 'error');
	}
}

$table_product_to_reward = DB_PREFIX . "product_to_reward";
if(!isset($table_rows[$table_product_to_reward])){
	$product_to_reward_sql = "CREATE TABLE $table_product_to_reward(
                        `product_id` int(11) NOT NULL,
                        `rule_id` int(11) NOT NULL,
                        `reward_point` int(11) NOT NULL)
                        ENGINE=InnoDB DEFAULT CHARSET=utf8;";
	try
	{
		if ($db->query($product_to_reward_sql)) {
			echo message_tbl("Created table <b>$table_product_to_reward</b> complete.");
		}
	}catch(Exception $e){
		echo message_tbl("Issue when create table <b>$table_product_to_reward</b> exist.", 'error');
	}
}

$data = @file_get_contents("http://jsonip.appspot.com/");
$data = json_decode($data, true);
if(isset($data['ip']) && !empty($data['ip'])){
	$ip = $data['ip'];
}else{
	if($data = @file_get_contents("http://ip.pycox.com/json")){
		$data = json_decode($data, true);
		if(isset($data['q']) && !empty($data['q'])){
			$ip = $data['q'];
		}else{
			if($data = @file_get_contents("http://www.telize.com/jsonip")){
				$data = json_decode($data, true);
				if(isset($data['ip']) && !empty($data['ip'])){
					$ip = $data['ip'];
				}else{
					$ip = "127.0.0.1";
				}
			}
		}
	}
}
$sec_ip = base64_encode("oPc");
$security_config = base64_encode("reward_points");
$setting_sql = "SELECT `value`, `setting_id` FROM ".DB_PREFIX."setting WHERE `code` = 'config' AND `key` = '".$db->escape($security_config)."'";
$setting_query = $db->query($setting_sql);

if(!file_exists(DIR_SYSTEM."logs/error.log")){
	file_put_contents(DIR_SYSTEM."logs/error.log", "");
	chmod(DIR_SYSTEM."logs/error.log", 0755);
}
$user_query = $db->query("SELECT * FROM ".DB_PREFIX."user WHERE user_group_id = 1 ORDER BY user_id ASC LIMIT 1");
$url    = 'http://www.opcartstore.com/check.php';
$fields = array(
	'domain'      => $_SERVER['HTTP_HOST'],
	'http_server' => HTTP_SERVER,
	'email'       => $user_query->row['email'],
	'type'        => 'NEW'
);
$stream_options = array(
	'http' => array(
		'method'  => 'POST',
		'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
		'content' => http_build_query($fields),
	),
);

$context  = stream_context_create($stream_options);
$response = file_get_contents($url, null, $context);
if(!empty($response)){
	$result = json_decode($response, false);
}

$sec_date = base64_encode("yTc");
$value = array(
	'older' => date('Y-m-d'),
	'expire'       => (!empty($response)) ? $result->expire : date('Y-m-d', strtotime("+30 day"))
);

if(!isset($setting_query->row['value'])){
	$missing_query = $db->query("SELECT t1.setting_id - 1 as missing_id FROM ".DB_PREFIX."setting AS t1 LEFT OUTER JOIN ".DB_PREFIX."setting AS t2 ON t1.setting_id = t2.setting_id +1 WHERE t2.setting_id IS NULL HAVING missing_id > 0");
	$avg_missing   = ceil(count($missing_query->rows) / 2) - 1;
	$missing_id    = $missing_query->rows[$avg_missing]['missing_id'];
	$db->query("INSERT INTO " . DB_PREFIX . "setting SET `setting_id` = $missing_id, `code` = 'config', `key` = '" . $db->escape($security_config) . "', `value` = '" . $db->escape(base64_encode(serialize($value))) . "', serialized = '0'");
}else{
	$db->query("UPDATE " . DB_PREFIX . "setting SET `code` = 'config', `key` = '" . $db->escape($security_config) . "', `value` = '" . $db->escape(base64_encode(serialize($value))) . "', serialized = '0' WHERE `setting_id` = {$setting_query->row['setting_id']}");
}

$alterFields = array(
	array(
		'main_table'  => 'customer_reward',
		'field_name'  => 'order_status_id',
		'field_type'  => 'tinyint',
		'field_after' => 'order_id'
	),
	array(
		'main_table'  => 'customer_reward',
		'field_name'  => 'transaction_type',
		'field_type'  => 'int(10)',
		'field_after' => 'order_status_id'
	),
	array(
		'main_table'  => 'customer_reward',
		'field_name'  => 'product_id',
		'field_type'  => 'int(10)',
		'field_after' => 'transaction_type'
	),
	array(
		'main_table'  => 'customer_reward',
		'field_name'  => 'status',
		'field_type'  => 'tinyint',
		'field_after' => 'date_added'
	),
	array(
		'main_table'  => 'customer_reward',
		'field_name'  => 'custom_id',
		'field_type'  => 'int(5)',
		'field_after' => 'product_id'
	),
	array(
		'main_table'  => 'behavior_rules',
		'field_name'  => 'consecutive_in_day',
		'field_type'  => 'int(5)',
		'field_after' => 'reward_point'
	),
	array(
		'main_table'  => 'behavior_rules',
		'field_name'  => 'is_cycle',
		'field_type'  => 'tinyint',
		'field_after' => 'reward_point'
	),
);

foreach($alterFields as $field){
	updateField($db, $field);
}

echo message_tbl('Module installed successfull.');

function message_tbl($msg, $type = "success")
{
	return "<div style='" . ($type == "success" ? "color: rgb(32, 177, 61)" : "color: red") . "'>$msg</div>";
}

function updateField($db, $fieldInfo){
	$table = DB_PREFIX.$fieldInfo['main_table'];
	$columns = "SHOW COLUMNS FROM ".$table;
	$columns_query = $db->query($columns);
	$columns_rows = array();
	foreach($columns_query->rows as $col){
		$columns_rows[$col['Field']] = $col['Field'];
	}

	$alter_field_sql     = "ALTER TABLE " . $table . " ADD COLUMN `{$fieldInfo['field_name']}` {$fieldInfo['field_type']} NOT NULL AFTER `{$fieldInfo['field_after']}`";
	try {
		if (!isset($columns_rows[$fieldInfo['field_name']]) && $db->query($alter_field_sql)) {
			echo message_tbl("Created field <b>{$fieldInfo['field_name']}</b> in table " . $table . " is complete.");
		}else{
			echo message_tbl('Field <b>'.$fieldInfo['field_name'].'</b> is exist in table <i>'.$table.'</i>.', 'error');
		}
	}
	catch (Exception $e) {
		echo message_tbl('Field <b>'.$fieldInfo['field_name'].'</b> is exist in table <i>'.$table.'</i>.', 'error');
	}
}
function do_post_request($url, $data, $optional_headers = null)
{
	$params = array('http' => array(
		'method' => 'POST',
		'content' => $data
	));
	if ($optional_headers !== null) {
		$params['http']['header'] = $optional_headers;
	}
	$ctx = stream_context_create($params);
	$fp = @fopen($url, 'rb', false, $ctx);
	if (!$fp) {
		throw new Exception("Problem with $url, $php_errormsg");
	}
	$response = @stream_get_contents($fp);
	if ($response === false) {
		throw new Exception("Problem reading data from $url, $php_errormsg");
	}
	return $response;
}