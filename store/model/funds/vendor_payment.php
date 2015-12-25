<?php
class ModelFundsVendorPayment extends Model {

	public function getSalesCommission($data = array()) {				
	
	$sql = "SELECT st.name AS store, m.email AS email, rf.refund, rf.dispute, rf.commission, rf.previous_balance, rf.previous_total, rf.payment, rf.date_added, rf.reason FROM `" . DB_PREFIX . "refund` rf LEFT JOIN " . DB_PREFIX . "store st on rf.vendor_id = st.store_id  LEFT JOIN " . DB_PREFIX . "merchant m on st.store_id = m.store_ids  WHERE m.parent = 0 AND rf.type = 3 AND rf.status > '0'"; 		 				
		
		$sql .= "AND st.store_id ='" . $this->session->data['storeID'] . "'";

		if (!empty($data['filter_date_start'])) {				
			$sql .= " AND DATE(rf.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";				
			}

		if (!empty($data['filter_date_end'])) {				
			$sql .= " AND DATE(rf.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";				
		}
		
		$sql .= " ORDER BY rf.refund_id DESC";

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

		
		$sql = "SELECT COUNT(rf.refund_id) AS total FROM `" . DB_PREFIX . "refund` rf LEFT JOIN " . DB_PREFIX . "store st on rf.vendor_id = st.store_id  LEFT JOIN " . DB_PREFIX . "merchant m on st.store_id = m.store_ids  WHERE m.parent = 0 AND rf.type = 3 AND rf.status > '0'";

		$sql .= "AND st.store_id ='" . $this->session->data['storeID'] . "'";

		if (!empty($data['filter_date_start'])) {				
			$sql .= " AND DATE(rf.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";				
			}

		if (!empty($data['filter_date_end'])) {				
			$sql .= " AND DATE(rf.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";				
		}
		
		$query = $this->db->query($sql);

		return $query->row['total'];
		
	}

	public function getDebits($data = array()) {		

		$sql = "SELECT *, CONCAT(m.firstname,' ',m.lastname) AS vendor, m.email FROM `" . DB_PREFIX . "refund` rf LEFT JOIN " . DB_PREFIX . "store st on rf.vendor_id = st.store_id LEFT JOIN " . DB_PREFIX . "merchant m on st.store_id = m.store_ids WHERE m.parent = 0 AND rf.type != 3 AND rf.status > '0' AND st.status > '0' ";
		
		

		$sql .= "AND rf.vendor_id ='" . $this->session->data['storeID'] . "'";
		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(rf.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";			
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(rf.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";			
		}
		$sql .= " ORDER BY rf.refund_id DESC";
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

	public function getTotalDebits($data = array()) { 

		$sql = "SELECT COUNT(refund_id) AS total, (SUM(refund) + SUM(dispute)) AS debit FROM `" . DB_PREFIX . "refund` rf LEFT JOIN " . DB_PREFIX . "store st on rf.vendor_id = st.store_id LEFT JOIN " . DB_PREFIX . "merchant m on st.store_id = m.store_ids WHERE m.parent = 0 AND rf.type != 3 AND rf.status > '0' AND st.status > '0' ";

		$sql .= "AND rf.vendor_id ='" . $this->session->data['storeID'] . "'";

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(rf.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";			
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(rf.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";			
		}

		$query = $this->db->query($sql);

		$query = $this->db->query($sql);
		if (!empty($data['return'])) {
			return $query->row['debit'];
		}else{
			return $query->row['total'];
		}
	}

	public function addDebit($data) {
		$this->event->trigger('pre.admin.refund.add', $data);

		$this->db->query("INSERT INTO " . DB_PREFIX . "refund SET vendor_id = '" . $this->db->escape($data['store']) . "', type = 2, reason = '" . $this->db->escape(strip_tags($data['reason'])) . "', refund = '" . $data['debit'] . "', dispute = '" . $data['dispute'] . "', status = 1, date_added = NOW()");
		
		$refund_id = $this->db->getLastId();
		
		$this->event->trigger('post.admin.refund.add', $refund_id);

		return $refund_id;
	}

	public function deleteRefund($refund_id) {
		$this->event->trigger('pre.admin.refund.delete', $refund_id);

		$this->db->query("DELETE FROM " . DB_PREFIX . "refund WHERE refund_id = '" . (int)$refund_id . "'");

		$this->event->trigger('post.admin.refund.delete', $refund_id);
	}

}
