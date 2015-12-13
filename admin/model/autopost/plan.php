<?php
class ModelAutopostPlan extends Model {
	public function addPlan($data) {
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "autopost_plan SET `plan_name` = '" . $this->db->escape($data['plan_name']) . "', `plan_amount` = '" . $this->db->escape($data['plan_amount']) . "', `plan_days` = '" . $this->db->escape($data['plan_days']) . "', `plan_status` = '" . $this->db->escape($data['status']) . "'");

		$plan_id = $this->db->getLastId();
		return $plan_id;
	}
	

	public function getPlans($data = array()) {
		$store_data = '';
		

		if (!$store_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "autopost_plan ORDER BY plan_id DESC");
		
			$store_data = $query->rows;

			$this->cache->set('plans', $store_data);
		}

		return $store_data;
	}

	public function getTotalplans() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "autopost_plan");
		return $query->row['total'];
	}
	
	public function editPlan($plan_id, $data) {
		

		$this->db->query("UPDATE " . DB_PREFIX . "autopost_plan SET plan_name = '" . $this->db->escape($data['plan_name']) . "', `plan_amount` = '" . $this->db->escape($data['plan_amount']) . "', `plan_days` = '" . $this->db->escape($data['plan_days']) . "', `plan_status` = '" . $this->db->escape($data['status']) . "' WHERE plan_id = '" . (int)$plan_id . "'");
		
	
	}
	
	public function getSetting($plan_id = 0) {
		$setting_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "autopost_plan WHERE plan_id = '" . (int)$plan_id . "'");
	
		return $query;
	}
	
	

	
	public function deletePlan($plan_id) {
	
		$this->db->query("DELETE FROM " . DB_PREFIX . "autopost_plan WHERE plan_id = '" . (int)$plan_id . "'");
	
	}
	
	public function getSubscriberplanlist()
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "autopost_plan_paypal");
		return $query->rows;
	}
	
	public function getcurrentemail($merchant_id)
	{
		$query = $this->db->query("SELECT email FROM " . DB_PREFIX . "merchant WHERE user_id= '". (int)$merchant_id ."'");
		return $query->rows[0]['email'];
	}
	
	
	
}