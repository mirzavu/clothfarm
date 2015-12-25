<?php
class ModelAccountSeller extends Model {
	

	public function getTotalSellersByEmail($email) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "merchant WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row['total'];
	}


	public function addStore($data) { 
		
$data['config_url'] = $data['config_ssl'] = $data['config_geocode'] = $data['config_fax'] = $data['config_image'] = $data['config_open'] = $data['config_comment'] = $data['config_meta_title'] = $data['config_meta_description'] = $data['config_meta_keyword'] = $data['config_template'] = $data['config_layout_id'] = $data['config_tax'] = $data['config_tax_default'] = $data['config_tax_customer'] = $data['config_customer_group_id'] = $data['config_customer_price'] = $data['config_account_id'] = $data['config_cart_weight'] = $data['config_checkout_guest'] = $data['config_checkout_id'] = $data['config_order_status_id'] = $data['config_stock_display'] = $data['config_stock_checkout'] = $data['config_logo'] = $data['config_icon'] = $data['config_payacc'] = '';
$data['status'] = 0;
$data['config_country_id'] = $this->config->get('config_country_id');
$data['config_zone_id'] = $this->config->get('config_zone_id');
$data['config_language'] = $this->config->get('config_language');
$data['config_currency'] = $this->config->get('config_currency');
$data['config_product_limit'] = 15;
$data['config_product_description_length'] = 100;
$data['config_image_category_width'] = 80;
$data['config_image_category_height'] = 80;
$data['config_image_thumb_width'] = 228;
$data['config_image_thumb_height'] = 228;
$data['config_image_popup_width'] = 500;
$data['config_image_popup_height'] = 500;
$data['config_image_product_width'] = 80;
$data['config_image_product_height'] = 80;
$data['config_image_additional_width'] = 74;
$data['config_image_additional_height'] = 74;
$data['config_image_related_width'] = 80;
$data['config_image_related_height'] = 80;
$data['config_image_compare_width'] = 90;
$data['config_image_compare_height'] = 90;
$data['config_image_wishlist_width'] = 50;
$data['config_image_wishlist_height'] = 50;
$data['config_image_cart_width'] = 80;
$data['config_image_cart_height'] = 80;
$data['config_image_location_width'] = 240;
$data['config_image_location_height'] = 180;
$data['config_secure'] = 0;
$data['config_commission'] = (int)$this->config->get('config_commission_default');

		$this->db->query("INSERT INTO " . DB_PREFIX . "store SET name = '" . $this->db->escape($data['config_name']) . "', `url` = '" . $this->db->escape($data['config_url']) . "', `ssl` = '" . $this->db->escape($data['config_ssl']) . "', `commission` = '" . $this->db->escape($data['config_commission']) . "', status = '" . (int)$data['status'] . "', date_added = NOW() ");

		$store_id = $this->db->getLastId();
		$plan = $this->db->query("SELECT * FROM " . DB_PREFIX . "subscribe_plan WHERE plan_id = '".$data['plan_id']."'");
	
		$plan_days = $plan->rows[0]['plan_days'];
		$config_free_signup = time()+ ($plan_days*(24*3600));

		if( $store_id && $this->db->escape($data['config_email']) ){
			$this->db->query("INSERT INTO " . DB_PREFIX . "merchant SET user_group_id = '1', store_ids = '" . (int)$store_id . "', username = '". $this->db->escape($data['config_name']) ."',  `firstname` = '" . $this->db->escape($data['firstname']) . "', `lastname` = '" . $this->db->escape($data['lastname']) . "', email = '". $this->db->escape($data['config_email']) ."', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', status = '" . (int)$data['status'] . "', config_free_signup = '" . $config_free_signup . "', plan_id = '" . $data['plan_id'] . "', date_added = NOW()");

		}

		// Layout Route
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout_route WHERE store_id = '0'");

		foreach ($query->rows as $layout_route) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "layout_route SET layout_id = '" . (int)$layout_route['layout_id'] . "', route = '" . $this->db->escape($layout_route['route']) . "', store_id = '" . (int)$store_id . "'");
		}	
		$code = 'config';
		$this->db->query("DELETE FROM `" . DB_PREFIX . "setting` WHERE store_id = '" . (int)$store_id . "' AND `code` = '" . $this->db->escape($code) . "'");

		foreach ($data as $key => $value) {
			if (substr($key, 0, strlen($code)) == $code) {
				if (!is_array($value)) {
					$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `code` = '" . $this->db->escape($code) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "'");
				} else {
					$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET store_id = '" . (int)$store_id . "', `code` = '" . $this->db->escape($code) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(serialize($value)) . "', serialized = '1'");
				}
			}
		}
                $this->load->language('mail/vendor');
                $path = HTTP_SERVER."store/index.php?route=merchant/login";
		$subject = sprintf($this->language->get('text_subject'), $this->config->get('config_name'));

		$message = sprintf($this->language->get('text_welcome'), $this->config->get('config_name')) . "\n\n";
        $message .= $this->language->get('text_approval') . "\n";
		
		//$message .= $this->url->link('account/login', '', 'SSL') . "\n\n";
                $message .= $path . "\n\n";
		$message .= $this->language->get('text_services') . "\n\n";
		$message .= $this->language->get('text_thanks') . "\n";
		$message .= $this->config->get('config_name');

		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_host');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			
		$mail->setTo($data['config_email']);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender($this->config->get('config_name'));
		$mail->setSubject($subject);
		$mail->setText($message);
		$mail->send();

		// Send to main admin email if new account email is enabled
		if ($this->config->get('config_account_mail')) {
			$message  = $this->language->get('text_signup') . "\n\n";
			$message .= $this->language->get('text_website') . ' ' . $this->config->get('config_name') . "\n";
			$message .= $this->language->get('text_firstname') . ' ' . $data['firstname'] . "\n";
			$message .= $this->language->get('text_lastname') . ' ' . $data['lastname'] . "\n";
		//	$message .= $this->language->get('text_customer_group') . ' ' . $customer_group_info['name'] . "\n";
			$message .= $this->language->get('text_email') . ' '  .  $data['config_email'] . "\n";
			$message .= $this->language->get('text_telephone') . ' ' . $data['config_telephone'] . "\n";

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			
			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($data['config_email']);
			$mail->setSender($data['firstname']);
			$mail->setSubject($this->language->get('text_new_customer'));
			$mail->setText($message);
			$mail->send();

			// Send to additional alert emails if new account email is enabled
			$emails = explode(',', $this->config->get('config_mail_alert'));

			foreach ($emails as $email) {
				if (utf8_strlen($email) > 0 && preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $email)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
		}

		return $store_id;
	}
	
	public function getplandetails()
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "subscribe_plan WHERE plan_status = '0'");
		return $query->rows;
	}
	
	public function getcurrentplan($plan_id)
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "subscribe_plan WHERE plan_id = '".$plan_id."'");
		return $query->rows;
	}
        public function getmerchantid($store_id)
        {
                $query = $this->db->query("SELECT user_id FROM " . DB_PREFIX . "merchant WHERE store_ids = '".$store_id."'");
		return $query->rows[0]['user_id'];
        }


}
