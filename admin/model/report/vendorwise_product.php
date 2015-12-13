<?php
class ModelReportVendorwiseProduct extends Model {
	
	public function getVendorProducts($data = array()) {
		
		if (!empty($data['filter_store'])) {
			
			if($data['filter_purchase_condition'] == 1){

			$sql = "SELECT op.name, op.model, p.quantity as stock, p.price, p.viewed, SUM(op.quantity) AS quantity, SUM((op.price + op.tax) * op.quantity) AS total FROM " . DB_PREFIX . "order_product op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) LEFT JOIN `" . DB_PREFIX . "product` p ON (op.product_id = p.product_id)";
			$sql .= " WHERE o.order_status_id > '0' AND op.merchant_id = '".$data['filter_store']."'";
			}else{

			$sql = "SELECT pd.name, p.model, p.quantity as stock, p.price, p.viewed, (SELECT SUM(op.quantity) FROM " . DB_PREFIX ."order_product op LEFT JOIN " . DB_PREFIX ."order o ON (op.order_id = o.order_id) WHERE o.order_status_id > '0' AND p.product_id = op.product_id ) AS quantity, (SELECT SUM((op.price + op.tax) * op.quantity) FROM " . DB_PREFIX ."order_product op LEFT JOIN " . DB_PREFIX ."order o ON (op.order_id = o.order_id) WHERE o.order_status_id > '0' AND p.product_id = op.product_id ) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store pts ON (p.product_id = pts.product_id) ";
			$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pts.store_id = '".$data['filter_store']."'";
			}
					

			if (!empty($data['filter_date_start'])) {

				if($data['filter_purchase_condition'] == 1){
					$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
				}else{
					$sql .= " AND DATE(p.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
				}
			}

			if (!empty($data['filter_date_end'])) {

				if($data['filter_purchase_condition'] == 1){
					$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
				}else{
					$sql .= " AND DATE(p.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
				}
			}

			if($data['filter_purchase_condition'] == 1){
				$sql .= " GROUP BY op.product_id ORDER BY o.date_added DESC";
			}else{
				$sql .= " ORDER BY p.date_added DESC";
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
	}

	public function getTotalVendorProducts($data) {

		if (!empty($data['filter_store'])) {

			if($data['filter_purchase_condition'] == 1){
			
			$sql = "SELECT COUNT(DISTINCT op.product_id) AS total FROM `" . DB_PREFIX . "order_product` op LEFT JOIN `" . DB_PREFIX . "order` o ON (op.order_id = o.order_id) LEFT JOIN `" . DB_PREFIX . "product` p ON (op.product_id = p.product_id)";
		
			$sql .= " WHERE o.order_status_id > '0' AND op.merchant_id = '".$data['filter_store']."'";

			}else{
				$sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store pts ON (p.product_id = pts.product_id) ";
			$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND pts.store_id = '".$data['filter_store']."'";

			}

			if (!empty($data['filter_date_start'])) {
				if($data['filter_purchase_condition'] == 1){
					$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
				}else{
					$sql .= " AND DATE(p.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
				}
			}

			if (!empty($data['filter_date_end'])) {
				if($data['filter_purchase_condition'] == 1){
					$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
				}else{
					$sql .= " AND DATE(p.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
				}
			}

			$query = $this->db->query($sql);

			return $query->row['total'];
		}
	}
}
