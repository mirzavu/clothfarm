<?php
class ModelSubscribePlan extends Model {
	public function addPlan($data) {
	
		//$this->event->trigger('pre.admin.plan.add', $data);
		
	
		$this->db->query("INSERT INTO " . DB_PREFIX . "subscribe_plan SET `plan_name` = '" . $this->db->escape($data['plan_name']) . "', `plan_amount` = '" . $this->db->escape($data['plan_amount']) . "', `plan_days` = '" . $this->db->escape($data['plan_days']) . "', `plan_status` = '" . $this->db->escape($data['status']) . "'");

		$plan_id = $this->db->getLastId();
		
		// Layout Route
		
		//$this->cache->delete('plan');

		//$this->event->trigger('post.admin.plan.add', $plan_id);

		return $plan_id;
	}
	

	public function getPlans($data = array()) {
		$store_data = '';
		

		if (!$store_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "subscribe_plan ORDER BY plan_id DESC");
		
			$store_data = $query->rows;

			$this->cache->set('plans', $store_data);
		}

		return $store_data;
	}

	public function getTotalplans() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "subscribe_plan");
		return $query->row['total'];
	}
	
	public function editPlan($plan_id, $data) {
		
		//$this->event->trigger('pre.admin.store.edit', $data);
	//	$this->db->query("DELETE FROM " . DB_PREFIX . "subscribe_plan WHERE plan_id = '" . (int)$plan_id . "'");
		$this->db->query("UPDATE " . DB_PREFIX . "subscribe_plan SET plan_name = '" . $this->db->escape($data['plan_name']) . "', `plan_amount` = '" . $this->db->escape($data['plan_amount']) . "', `plan_days` = '" . $this->db->escape($data['plan_days']) . "', `plan_status` = '" . $this->db->escape($data['status']) . "' WHERE plan_id = '" . (int)$plan_id . "'");
		
		//$this->cache->delete('store');
		//$this->event->trigger('post.admin.store.edit', $ticket_id);
	}
	
	public function getSetting($plan_id = 0) {
		$setting_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "subscribe_plan WHERE plan_id = '" . (int)$plan_id . "'");
	
		return $query;
	}
	
	

	
	public function deletePlan($plan_id) {
	
		$this->db->query("DELETE FROM " . DB_PREFIX . "subscribe_plan WHERE plan_id = '" . (int)$plan_id . "'");
	
	}
	
	
	
}