<?php
class ModelTicketsTickets extends Model {
	public function addStore($data) {
		
		$this->event->trigger('pre.admin.store.add', $data);
		$merchant_detail = $this->db->query("SELECT * FROM ". DB_PREFIX . "merchant WHERE user_id = ".$this->session->data['storeID']);
	
		$this->db->query("INSERT INTO " . DB_PREFIX . "ticket SET `subject` = '" . $this->db->escape($data['subject']) . "', `message` = '" . $this->db->escape($data['message']) . "', `merchant_id` = '" . $this->session->data['storeID'] . "', `sender_email` = '" . $merchant_detail->rows[0]['email'] . "', `ticket_time` = '" . time() . "'");

		$ticket_id = $this->db->getLastId();

		// Layout Route
		
		$this->cache->delete('ticket');

		$this->event->trigger('post.admin.store.add', $ticket_id);

		return $ticket_id;
	}
	public function addticketChild($ticket_id,$data) {
		
		$this->event->trigger('pre.admin.store.add', $data);
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "ticket WHERE ticket_id = ".$ticket_id);
		
			$store_data = $query->rows;
		

		$this->db->query("INSERT INTO " . DB_PREFIX . "ticket SET `message` = '" . $this->db->escape($data['message']) . "', `ticket_time` = '" . time() . "', `sender_email` = '" . $store_data[0]['sender_email'] . "', `merchant_id` = '" . $this->session->data['storeID'] . "', `recipient` = '" . $store_data[0]['recipient'] . "', `parent_id` = '" . $ticket_id . "'");

		$ticket_id = $this->db->getLastId();

		// Layout Route
		
		$this->cache->delete('ticket');

		$this->event->trigger('post.admin.store.add', $ticket_id);

		return $ticket_id;
	}

	public function getTickets($data = array()) {
		$store_data = '';
		

		if (!$store_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "ticket  WHERE merchant_id = ".$this->session->data['storeID']." and parent_id =  0 ORDER BY ticket_id DESC");
		
			$store_data = $query->rows;

			$this->cache->set('ticket', $store_data);
		}

		return $store_data;
	}

	public function getTotalTickets() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "ticket WHERE parent_id = 0 and merchant_id = ".$this->session->data['storeID']);
		return $query->row['total'];
	}
	
	public function editStore($ticket_id, $data) {
		
		$this->event->trigger('pre.admin.store.edit', $data);
		$this->db->query("UPDATE " . DB_PREFIX . "ticket SET user = '" . $this->db->escape($data['user']) . "', `subject` = '" . $this->db->escape($data['subject']) . "', `message` = '" . $this->db->escape($data['message']) . "', `sender_email` = '" . $this->db->escape($data['vendor']) . "', `ticket_time` = '" . time() . "', `recipient` = '" . $this->db->escape($data['recipient']) . "', `status` = '" . $this->db->escape($data['status']) . "' WHERE ticket_id = '" . (int)$ticket_id . "'");
		$this->cache->delete('store');
		$this->event->trigger('post.admin.store.edit', $ticket_id);
	}
	
	public function getSetting($store_id = 0) {
		$setting_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "ticket WHERE ticket_id = '" . (int)$store_id . "'");
	
		return $query;
	}
	
	public function editSetting($code, $data, $store_id = 0) {

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
	}
	
	public function getCurrentTicket($ticket_id = 0)
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "ticket WHERE ticket_id =".$ticket_id);
		return $query->rows;
	}
	
	public function get_reply_ticket($ticket_id = 0)
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "ticket WHERE parent_id =".$ticket_id." ORDER BY ticket_id DESC");
		return $query->rows;
	}
	
	public function deleteTicket($store_id) {
		$this->event->trigger('pre.admin.store.delete', $store_id);
		$this->db->query("DELETE FROM " . DB_PREFIX . "ticket WHERE ticket_id = '" . (int)$store_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "ticket WHERE parent_id = '" . (int)$store_id . "'");
		$this->cache->delete('store');
		$this->event->trigger('post.admin.store.delete', $store_id);
	}
	
	public function getVendorList()
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "merchant WHERE parent = 0 ORDER BY user_id ASC");
		return $query->rows;
	}
	
}