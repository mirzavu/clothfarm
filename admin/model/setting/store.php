<?php
class ModelSettingStore extends Model {
	public function addStore($data) {
		$this->event->trigger('pre.admin.store.add', $data);

		$this->db->query("INSERT INTO " . DB_PREFIX . "store SET name = '" . $this->db->escape($data['config_name']) . "', `url` = '" . $this->db->escape($data['config_url']) . "', `ssl` = '" . $this->db->escape($data['config_ssl']) . "', `commission` = '" . $this->db->escape($data['config_commission']) . "', status = '" . (int)$data['status'] . "', date_added = NOW()");

		$store_id = $this->db->getLastId();

		if( $store_id && $this->db->escape($data['config_email']) ){
			$this->db->query("INSERT INTO " . DB_PREFIX . "merchant SET user_group_id = '1', store_ids = '" . (int)$store_id . "', username = '". $this->db->escape($data['config_name']) ."',  `firstname` = '" . $this->db->escape($data['firstname']) . "', `lastname` = '" . $this->db->escape($data['lastname']) . "', email = '". $this->db->escape($data['config_email']) ."', salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', status = '" . (int)$data['status'] . "', date_added = NOW()");

		}

		// Layout Route
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "layout_route WHERE store_id = '0'");

		foreach ($query->rows as $layout_route) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "layout_route SET layout_id = '" . (int)$layout_route['layout_id'] . "', route = '" . $this->db->escape($layout_route['route']) . "', store_id = '" . (int)$store_id . "'");
		}

		$this->cache->delete('store');

		$this->event->trigger('post.admin.store.add', $store_id);

		return $store_id;
	}

	public function editStore($store_id, $data) {
		$this->event->trigger('pre.admin.store.edit', $data);

		$this->db->query("UPDATE " . DB_PREFIX . "store SET name = '" . $this->db->escape($data['config_name']) . "', `url` = '" . $this->db->escape($data['config_url']) . "', `ssl` = '" . $this->db->escape($data['config_ssl']) . "', `commission` = '" . $this->db->escape($data['config_commission']) . "', status = '" . (int)$data['status'] . "' WHERE store_id = '" . (int)$store_id . "'");

		$this->db->query("UPDATE " . DB_PREFIX . "merchant SET username = '" . $this->db->escape($data['config_name']) . "', `firstname` = '" . $this->db->escape($data['firstname']) . "', `lastname` = '" . $this->db->escape($data['lastname']) . "', status = '" . (int)$data['status'] . "' WHERE store_ids = '" . (int)$store_id . "' AND user_id = '" . (int)$data['user_id'] . "' AND parent = 0 ");

		if ($data['password']) {
			$this->db->query("UPDATE `" . DB_PREFIX . "merchant` SET salt = '" . $this->db->escape($salt = substr(md5(uniqid(rand(), true)), 0, 9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "' WHERE store_ids = '" . (int)$store_id . "' AND user_id = '" . (int)$data['user_id'] . "' AND parent = 0 ");
		}

		$this->cache->delete('store');

		$this->event->trigger('post.admin.store.edit', $store_id);
	}

	public function deleteStore($store_id) {
		$this->event->trigger('pre.admin.store.delete', $store_id);

		$this->db->query("DELETE FROM " . DB_PREFIX . "store WHERE store_id = '" . (int)$store_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "layout_route WHERE store_id = '" . (int)$store_id . "'");

		$this->cache->delete('store');

		$this->event->trigger('post.admin.store.delete', $store_id);
	}

	public function getStore($store_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "store WHERE store_id = '" . (int)$store_id . "'");

		return $query->row;
	}

	public function getStores($data = array()) { 
		$store_data = $this->cache->get('store');

		if (!$store_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "store order by date_added");

			$store_data = $query->rows;

			$this->cache->set('store', $store_data);
		}

		return $store_data;
	}

	public function getStoresListing($data = array()) { 
	
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "store order by date_added");

		$store_data = $query->rows;
			
		return $store_data;
	}

	public function getTotalStores() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "store");

		return $query->row['total'];
	}

	public function getTotalStoresByLayoutId($layout_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_layout_id' AND `value` = '" . (int)$layout_id . "' AND store_id != '0'");

		return $query->row['total'];
	}

	public function getTotalStoresByLanguage($language) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_language' AND `value` = '" . $this->db->escape($language) . "' AND store_id != '0'");

		return $query->row['total'];
	}

	public function getTotalStoresByCurrency($currency) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_currency' AND `value` = '" . $this->db->escape($currency) . "' AND store_id != '0'");

		return $query->row['total'];
	}

	public function getTotalStoresByCountryId($country_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_country_id' AND `value` = '" . (int)$country_id . "' AND store_id != '0'");

		return $query->row['total'];
	}

	public function getTotalStoresByZoneId($zone_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_zone_id' AND `value` = '" . (int)$zone_id . "' AND store_id != '0'");

		return $query->row['total'];
	}

	public function getTotalStoresByCustomerGroupId($customer_group_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_customer_group_id' AND `value` = '" . (int)$customer_group_id . "' AND store_id != '0'");

		return $query->row['total'];
	}

	public function getTotalStoresByInformationId($information_id) {
		$account_query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_account_id' AND `value` = '" . (int)$information_id . "' AND store_id != '0'");

		$checkout_query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_checkout_id' AND `value` = '" . (int)$information_id . "' AND store_id != '0'");

		return ($account_query->row['total'] + $checkout_query->row['total']);
	}

	public function getTotalStoresByOrderStatusId($order_status_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "setting WHERE `key` = 'config_order_status_id' AND `value` = '" . (int)$order_status_id . "' AND store_id != '0'");

		return $query->row['total'];
	}

	public function getTotalVendorsByEmail($email) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "merchant WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row['total'];
	}

	public function getTotalVendorsByDay() {						
				
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "merchant` WHERE parent = 0  AND date_added > DATE_SUB(NOW(), INTERVAL 1 DAY) ORDER BY date_added DESC");		

		return $query->row['total'];
	}

	public function getTotalVendorsByWeek() {		
				
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "merchant` WHERE parent = 0  AND date_added > DATE_SUB(NOW(), INTERVAL 1 WEEK) ORDER BY date_added DESC");
		
		return $query->row['total'];
	}

	public function getTotalVendorsByMonth() {		
				
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "merchant` WHERE parent = 0  AND date_added > DATE_SUB(NOW(), INTERVAL 1 MONTH) ORDER BY date_added DESC");
		
		return $query->row['total'];
	}

	public function getTotalVendorsByYear() {		
								
		//$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "merchant` WHERE parent = 0  AND date_added > DATE_SUB(NOW(), INTERVAL 1 YEAR) ORDER BY date_added DESC");
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "merchant` WHERE parent = 0 ORDER BY date_added DESC");
		
		return $query->row['total'];
	}

	public function getVendors($data = array()) { 
		$sql = "SELECT *, CONCAT(m.firstname, ' ', m.lastname) AS vendor FROM " . DB_PREFIX . "merchant m LEFT JOIN " . DB_PREFIX . "store st ON (m.store_ids = st.store_id) WHERE m.parent = 0";

		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(m.firstname, ' ', m.lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "m.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}


		if (isset($data['filter_store']) && !is_null($data['filter_store'])) {
			$implode[] = "st.name LIKE '" . $this->db->escape($data['filter_store']) . "%'";
		}

		if (isset($data['filter_ip']) && !is_null($data['filter_ip'])) {
			$implode[] = "m.ip = '" . (int)$data['filter_ip'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(m.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'm.name',
			'm.email',						
			'm.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY st.name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalVendors($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "merchant m LEFT JOIN " . DB_PREFIX . "store st ON (m.store_ids = st.store_id)";

		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(m.firstname, ' ', m.lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "m.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}


		if (isset($data['filter_store']) && !is_null($data['filter_store'])) {
			$implode[] = "st.name = '" . (int)$data['filter_store'] . "'";
		}

		if (isset($data['filter_ip']) && !is_null($data['filter_ip'])) {
			$implode[] = "m.ip = '" . (int)$data['filter_ip'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(m.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

}
