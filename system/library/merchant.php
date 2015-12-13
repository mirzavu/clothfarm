<?php
class Merchant {
	private $user_id;
	private $merchant_id;
	private $username;
	private $permission = array();

	public function __construct($registry) {
		$this->db = $registry->get('db');
		$this->request = $registry->get('request');
		$this->session = $registry->get('session');

		if (isset($this->session->data['merchant_id'])) {
			$user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant WHERE user_id = '" . (int)$this->session->data['merchant_id'] . "' AND status = '1'");

			if ($user_query->num_rows) {
				$this->merchant_id = $user_query->row['user_id'];
				$this->username = $user_query->row['username'];

				$this->db->query("UPDATE " . DB_PREFIX . "merchant SET ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "' WHERE user_id = '" . (int)$this->session->data['merchant_id'] . "'");

				$user_group_query = $this->db->query("SELECT permission FROM " . DB_PREFIX . "user_group WHERE user_group_id = '" . (int)$user_query->row['user_group_id'] . "'");

				$permissions = unserialize($user_group_query->row['permission']);

				if (is_array($permissions)) {
					foreach ($permissions as $key => $value) {
						$this->permission[$key] = $value;
					}
				}
			} else {
				$this->logout();
			}
		}
	}



	public function login($username, $password) {
		$user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($username)) . "' AND (password = SHA1(CONCAT(salt, SHA1(CONCAT(salt, SHA1('" . $this->db->escape($password) . "'))))) OR password = '" . $this->db->escape(md5($password)) . "') AND status = '1'");


		if ($user_query->num_rows) {			
			$store_details = $this->db->query("SELECT * FROM " . DB_PREFIX . "store WHERE store_id = '" . $user_query->row['store_ids'] . "' limit 1"); 				
			if(!$store_details->num_rows){				
				return false;
			}								
				$this->session->data['merchant_id'] = $user_query->row['user_id'];
				$this->session->data['storeID'] = $user_query->row['store_ids'];
				$this->merchant_id = $user_query->row['user_id'];
				$this->username = $user_query->row['username'];
				$this->session->data['storeName'] = $store_details->row['name'];
			

				$user_group_query = $this->db->query("SELECT permission FROM " . DB_PREFIX . "user_group WHERE user_group_id = '" . (int)$user_query->row['user_group_id'] . "'"); 

				$permissions = unserialize($user_group_query->row['permission']); 

				if (is_array($permissions)) {
					foreach ($permissions as $key => $value) {
						$this->permission[$key] = $value;
					}
				}

				return true;
		} else {
			return false;
		}
	}
	
	 public function expired_plan($username, $password) {
                $time = time();
		$user_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($username)) . "' AND (password = SHA1(CONCAT(salt, SHA1(CONCAT(salt, SHA1('" . $this->db->escape($password) . "'))))) OR password = '" . $this->db->escape(md5($password)) . "') AND status = '1'");
               
		if ($user_query->row['config_free_signup'] < $time) {			
								
				$this->session->data['merchant_id_expired'] = $user_query->row['user_id'];
				
			

				$user_group_query = $this->db->query("SELECT permission FROM " . DB_PREFIX . "user_group WHERE user_group_id = '" . (int)$user_query->row['user_group_id'] . "'"); 

				$permissions = unserialize($user_group_query->row['permission']); 

				if (is_array($permissions)) {
					foreach ($permissions as $key => $value) {
						$this->permission[$key] = $value;
					}
				}

				return false;
		} else {
			return true;
		}
	}


	public function logout() {
		unset($this->session->data['merchant_id']);

		$this->merchant_id = '';
		$this->username = '';
	}

	public function hasPermission($key, $value) {
		if (isset($this->permission[$key])) {
			return in_array($value, $this->permission[$key]);
		} else {
			return false;
		}
	}

	public function isLogged() {
		return $this->merchant_id;
	}

	public function getId() {
		return $this->merchant_id;
	}

	public function getUserName() {
		return $this->username;
	}

	public function getVendorByEmail($email) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "' AND status = 0");

		return $query->row;
	}

}
