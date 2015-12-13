<?php
class ModelFundsPaySeller extends Model {
	
	public function getSeller($data = array()) { 

		$condition = '';
		if (!empty($data['seller_name'])) {
			$condition .= " AND CONCAT(m.firstname, ' ', m.lastname) LIKE '" . $this->db->escape($data['seller_name']) . "%'";
		}
		$sql = "SELECT store_id, st.name AS store, st.commission FROM " . DB_PREFIX . "store st LEFT JOIN " . DB_PREFIX . "merchant m on st.store_id = m.store_ids WHERE m.parent = 0 AND st.store_id = '". $data['store'] ."' AND m.email = '". $data['seller_email'] ."' $condition LIMIT 1 ";		

		$query = $this->db->query($sql);
		if($query->num_rows)
		{
			return array("store_id" => $query->row['store_id'], "store_name" => $query->row['store'], "commission" => $query->row['commission']);
		}else{
			return 0;
		}
	}

	public function getDebit($store_id = "") { 

		$sql = "SELECT SUM(rf.refund) AS refund, SUM(rf.dispute) AS dispute FROM `" . DB_PREFIX . "refund` rf LEFT JOIN " . DB_PREFIX . "store st on rf.vendor_id = st.store_id LEFT JOIN " . DB_PREFIX . "merchant m on st.store_id = m.store_ids WHERE m.parent = 0 AND rf.type = 2 AND rf.status > '0' AND st.store_id = '". $store_id ."' ";

		$query = $this->db->query($sql);
			return array("debit" => $query->row['refund'], "dispute" => $query->row['dispute']);
	}

	public function getPreviousDebit($store_id = "") { 

		$sql = "SELECT SUM(rf.refund) AS refund, SUM(rf.dispute) AS dispute FROM `" . DB_PREFIX . "refund` rf LEFT JOIN " . DB_PREFIX . "store st on rf.vendor_id = st.store_id LEFT JOIN " . DB_PREFIX . "merchant m on st.store_id = m.store_ids WHERE m.parent = 0 AND rf.type = 1 AND rf.status > '0' AND st.store_id = '". $store_id ."' ";

		$query = $this->db->query($sql);

		return array("previous_debit" => $query->row['refund'], "previous_dispute" => $query->row['dispute']);
	}

	public function getPreviousBalance($store_id = "") { 

		$sql = "SELECT rf.previous_balance, rf.previous_total FROM `" . DB_PREFIX . "refund` rf LEFT JOIN " . DB_PREFIX . "store st on rf.vendor_id = st.store_id LEFT JOIN " . DB_PREFIX . "merchant m on st.store_id = m.store_ids WHERE m.parent = 0 AND rf.type = 3 AND rf.status > '0' AND st.store_id = '". $store_id ."' ORDER BY rf.date_added DESC LIMIT 1";

		$query = $this->db->query($sql);

		return $query->row;
	}

	public function getPrevioustotal($store_id = "") { 

		$sql = "SELECT SUM(rf.previous_total) AS total FROM `" . DB_PREFIX . "refund` rf LEFT JOIN " . DB_PREFIX . "store st on rf.vendor_id = st.store_id LEFT JOIN " . DB_PREFIX . "merchant m on st.store_id = m.store_ids WHERE m.parent = 0 AND rf.type = 3 AND rf.status > '0' AND st.store_id = '". $store_id ."' ";

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalAmount($store_id = "") { 

		$sql = "SELECT st.name AS store, ( SELECT SUM(op.shipping)+SUM((op.price + op.tax) * op.quantity) AS total FROM `" . DB_PREFIX . "order` o LEFT JOIN " . DB_PREFIX . "order_product op on o.order_id = op.order_id WHERE FIND_IN_SET(st.store_id, o.merchant_ids)>0 AND o.order_status_id > '0' AND op.merchant_id = st.store_id) AS total FROM " . DB_PREFIX . "store st LEFT JOIN " . DB_PREFIX . "merchant m on st.store_id = m.store_ids WHERE m.parent = 0 AND st.store_id = '". $store_id ."' ";		

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function paySeller($data, $debit = "", $dispute = "", $commission = "", $store_id = "", $next_balance = "", $total_due = '') {
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "refund SET vendor_id = '" . $this->db->escape($store_id) . "', type = 3, reason = '" . $this->db->escape(strip_tags($data['notes'])) . "', refund = '" . $debit . "', dispute = '" . $dispute . "', commission = '" . $commission . "', previous_balance = '" . $this->db->escape($next_balance) . "', previous_total = '" . $this->db->escape($total_due) . "', payment = '" . $this->db->escape($data['payment']) . "', status = 1, date_added = NOW(), reflected_date = NOW() ");

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