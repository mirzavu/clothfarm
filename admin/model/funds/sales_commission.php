<?php
class ModelFundsSalesCommission extends Model {

	public function getSalesCommission($data = array()) {

		$condition = '';
		$condition_refund = '';	
		if (!empty($data['filter_date_start'])) {
			$condition .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
			$condition_refund .= " AND DATE(rf.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$condition .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
			$condition_refund .= " AND DATE(rf.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}


		$sql = "SELECT st.name AS store, st.store_id AS store_id, st.commission, st.status, CONCAT(m.firstname,' ',m.lastname) AS vendor, m.email, ( SELECT count(o.order_id) FROM `" . DB_PREFIX . "order` o WHERE FIND_IN_SET(st.store_id, o.merchant_ids)>0 AND o.order_status_id > '0' $condition ) AS orders, ( SELECT SUM((op.price + op.tax) * op.quantity) + SUM(op.shipping) AS total FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_product op on o.order_id = op.order_id WHERE FIND_IN_SET(st.store_id, o.merchant_ids)>0 AND o.order_status_id > '0' AND op.merchant_id = st.store_id $condition) AS total, ( SELECT SUM(rf.refund) FROM `" . DB_PREFIX . "refund` rf WHERE st.store_id = rf.vendor_id AND rf.type != 3 AND rf.status > '0' $condition_refund) AS refund, ( SELECT SUM(rf.dispute) FROM `" . DB_PREFIX . "refund` rf WHERE st.store_id = rf.vendor_id AND rf.type != 3 AND rf.status > '0' $condition_refund) AS dispute, ( SELECT SUM(rf.payment) FROM `" . DB_PREFIX . "refund` rf WHERE st.store_id = rf.vendor_id AND rf.type = 3 AND rf.status > '0') AS paid FROM " . DB_PREFIX . "store st LEFT JOIN " . DB_PREFIX . "merchant m on st.store_id = m.store_ids WHERE m.parent = 0 ";		 				
		
		if (!empty($data['filter_store'])) {
			$sql .= "AND st.name LIKE '%" . $this->db->escape($data['filter_store']) . "%'";
		}

		if (!empty($data['filter_store_id'])) {
			$sql .= "AND st.store_id = " . $this->db->escape($data['filter_store_id']);
		}

		if (!empty($data['filter_email'])) {
			$sql .= " AND m.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}
		$sql .= " ORDER BY st.name ASC";
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

	public function getTotalSalesCommission($data = array()) {

		$condition = '';
		$condition_refund = '';	
		if (!empty($data['filter_date_start'])) {
			$condition .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
			$condition_refund .= " AND DATE(rf.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$condition .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
			$condition_refund .= " AND DATE(rf.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		$sql = "SELECT COUNT(st.store_id) AS total, ( SELECT count(o.order_id) FROM `" . DB_PREFIX . "order` o WHERE FIND_IN_SET(st.store_id, o.merchant_ids)>0 AND o.order_status_id > '0' $condition ) AS orders, ( SELECT SUM(op.shipping)+SUM((op.price + op.tax) * op.quantity) FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_product op on o.order_id = op.order_id WHERE FIND_IN_SET(st.store_id, o.merchant_ids)>0 AND o.order_status_id > '0' AND op.merchant_id = st.store_id $condition) AS totals, ( SELECT SUM(rf.refund) FROM `" . DB_PREFIX . "refund` rf WHERE st.store_id = rf.vendor_id AND rf.type != 3 AND rf.status > '0' $condition_refund) AS refund, ( SELECT SUM(rf.dispute) FROM `" . DB_PREFIX . "refund` rf WHERE st.store_id = rf.vendor_id AND rf.type != 3 AND rf.status > '0' $condition_refund) AS dispute, ( SELECT SUM(rf.payment) FROM `" . DB_PREFIX . "refund` rf WHERE st.store_id = rf.vendor_id AND rf.type = 3 AND rf.status > '0') AS paid FROM " . DB_PREFIX . "store st LEFT JOIN " . DB_PREFIX . "merchant m on st.store_id = m.store_ids WHERE m.parent = 0 ";

		if (!empty($data['filter_store'])) {
			$sql .= " AND st.name LIKE '%" . $this->db->escape($data['filter_store']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$sql .= " AND m.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}


	public function paySeller($data, $store_id = "", $previous_total = '', $balance = '') {  
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "refund SET vendor_id = '" . $this->db->escape($store_id) . "', type = 3, reason = '" . $this->db->escape(strip_tags($data['notes'])) . "', previous_total = '" . $this->db->escape($previous_total) . "', previous_balance = '" . $this->db->escape($balance) . "', payment = '" . $this->db->escape($data['payment']) . "', status = 1, date_added = NOW(), reflected_date = NOW() ");

		$insert_id = $this->db->getLastId();	

		$results = $this->db->query("SELECT refund_id FROM `" . DB_PREFIX . "refund` WHERE type = 2 AND status > '0' AND vendor_id = '". $store_id ."' ");

		if($results->num_rows){
			foreach($results as $result){ 
				$this->db->query("UPDATE `" . DB_PREFIX . "refund` SET type = 1, reflected_date = NOW() WHERE vendor_id = '" . (int)$store_id . "' AND refund_id = '".$result['refund_id']."'");
			}
		}
						
		return $insert_id;
	}

	
}