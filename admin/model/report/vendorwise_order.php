<?php
class ModelReportVendorwiseOrder extends Model {
	
	public function getVendorOrders($data = array()) {
		
		if (!empty($data['filter_store'])) {
						
			$sql = "SELECT o.order_id, CONCAT(o.firstname, ' ', o.lastname) AS customer, count(op.product_id) AS products, SUM((op.price + op.tax) * op.quantity) AS total, o.payment_method, o.date_added, os.name as status FROM `" . DB_PREFIX . "order` o LEFT JOIN `" . DB_PREFIX . "order_product` op on o.order_id=op.order_id LEFT JOIN `" . DB_PREFIX . "order_status_vendor` osv on o.order_id=osv.order_id LEFT JOIN `" . DB_PREFIX . "order_status` os on osv.order_status=os.order_status_id WHERE FIND_IN_SET('".$data['filter_store']."', o.merchant_ids)>0 ";
			$sql .= " AND o.order_status_id > '0' AND op.merchant_id = '".$data['filter_store']."' AND osv.vendor_id = '". $data['filter_store'] ."'";


			if (!empty($data['filter_date_start'])) {				
					$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";				
			}

			if (!empty($data['filter_date_end'])) {				
					$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";				
			}
			
			if (!empty($data['filter_order_status_id'])) {				
					$sql .= " AND osv.order_status = '" . (int)$data['filter_order_status_id'] . "'";				
			}

			$sql .= " GROUP BY op.order_id ORDER BY o.date_added DESC";
			
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

	public function getTotalVendorOrders($data) {

		if (!empty($data['filter_store'])) {			
			
			$sql = "SELECT COUNT(DISTINCT o.order_id) AS total FROM `" . DB_PREFIX . "order` o LEFT JOIN `" . DB_PREFIX . "order_product` op on o.order_id=op.order_id LEFT JOIN `" . DB_PREFIX . "order_status_vendor` osv on o.order_id=osv.order_id LEFT JOIN `" . DB_PREFIX . "order_status` os on osv.order_status=os.order_status_id WHERE FIND_IN_SET('".$data['filter_store']."', o.merchant_ids)>0 ";
			
			$sql .= " AND o.order_status_id > '0' AND op.merchant_id = '".$data['filter_store']."' AND osv.vendor_id = '". $data['filter_store'] ."' AND os.language_id = '" . (int)$this->config->get('config_language_id') . "'";

			if (!empty($data['filter_date_start'])) {				
					$sql .= " AND DATE(o.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";				
			}

			if (!empty($data['filter_date_end'])) {				
					$sql .= " AND DATE(o.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";				
			}
			
			if (!empty($data['filter_order_status_id'])) {				
					$sql .= " AND osv.order_status = '" . (int)$data['filter_order_status_id'] . "'";				
			}

			$query = $this->db->query($sql);

			return $query->row['total'];
		}
	}
}
