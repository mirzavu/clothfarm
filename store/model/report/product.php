<?php
class ModelReportProduct extends Model {
	public function getProductsViewed($data = array()) {
		$sql = "SELECT pd.name, p.model, p.viewed FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store pts ON (p.product_id = pts.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.viewed > 0 AND pts.store_id ='". $this->session->data['storeID'] ."' ORDER BY p.viewed DESC";

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

	public function getTotalProductViews() {

	$query = $this->db->query("SELECT SUM(p.viewed) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store pts ON (p.product_id = pts.product_id) WHERE pts.store_id ='". $this->session->data['storeID'] ."'");

	return $query->row['total'];
	}


	public function getTotalProductsViewed() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store pts ON (p.product_id = pts.product_id) WHERE p.viewed > 0 AND pts.store_id ='". $this->session->data['storeID'] ."'");

		return $query->row['total'];
	}

	public function reset() {
		$this->db->query("UPDATE " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_to_store pts ON (p.product_id = pts.product_id) SET p.viewed = '0' WHERE pts.store_id ='". $this->session->data['storeID'] ."'");
	}

	public function getPurchased($data = array()) {
		$sql = "SELECT op.name, op.model, SUM(op.quantity) AS quantity, SUM((op.total + op.tax) * op.quantity) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) LEFT JOIN `" . DB_PREFIX . "order_status_vendor` osv on o.order_id=osv.order_id";

		$sql .= " WHERE o.order_status_id > '0'";
		if (!empty($data['filter_order_status_id'])) {
			$sql .= " AND osv.order_status = '" . (int)$data['filter_order_status_id'] . "'";
		} 

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}
		$sql .= " AND op.merchant_id='". $this->session->data['storeID'] ."'";
		$sql .= " AND osv.vendor_id='". $this->session->data['storeID'] ."'";
		$sql .= "AND FIND_IN_SET('".$this->session->data['storeID']."', o.merchant_ids)>0 "; 		
		$sql .= " GROUP BY op.product_id ORDER BY total DESC";

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

	public function getTotalPurchased($data) {
		$sql = "SELECT COUNT(DISTINCT op.product_id) AS total FROM `" . DB_PREFIX . "order_product` op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) LEFT JOIN `" . DB_PREFIX . "order_status_vendor` osv on o.order_id=osv.order_id";

		$sql .= " WHERE o.order_status_id > '0'";
		if (!empty($data['filter_order_status_id'])) {
			$sql .= " AND osv.order_status = '" . (int)$data['filter_order_status_id'] . "'";
		}

		if (!empty($data['filter_date_start'])) {
			$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}
		$sql .= " AND op.merchant_id='". $this->session->data['storeID'] ."'";
		$sql .= " AND osv.vendor_id='". $this->session->data['storeID'] ."'";
		$sql .= "AND FIND_IN_SET('".$this->session->data['storeID']."', o.merchant_ids)>0 "; 	
		$query = $this->db->query($sql);

		return $query->row['total'];
	}
}
