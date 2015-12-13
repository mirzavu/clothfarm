<?php
class ModelReportCoupon extends Model {
	public function getCoupons($data = array()) {

		$sql = "SELECT cpv.coupon_id, c.name, c.code, COUNT(DISTINCT cpv.order_id) AS `orders`, SUM(cpv.value) AS total FROM " . DB_PREFIX . "coupon_product_vendor cpv LEFT JOIN " . DB_PREFIX . "order o on cpv.order_id = o.order_id LEFT JOIN " . DB_PREFIX . "coupon c on cpv.coupon_id = c.coupon_id LEFT JOIN " . DB_PREFIX . "product_to_store pts on cpv.product_id = pts.product_id where o.order_status_id > 0 AND pts.store_id != 0 AND pts.store_id ='". $this->session->data['storeID'] ."'";

		$implode = array();

		if (!empty($data['filter_date_start'])) {
			$implode[] = "DATE(cpv.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$implode[] = "DATE(cpv.date_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}

		$sql .= " GROUP BY cpv.coupon_id ORDER BY total DESC";

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

	public function getTotalCoupons($data = array()) {
		$sql = "SELECT COUNT(DISTINCT cpv.coupon_id) AS total FROM " . DB_PREFIX . "coupon_product_vendor cpv LEFT JOIN " . DB_PREFIX . "order o on cpv.order_id = o.order_id LEFT JOIN " . DB_PREFIX . "coupon c on cpv.coupon_id = c.coupon_id LEFT JOIN " . DB_PREFIX . "product_to_store pts on cpv.product_id = pts.product_id where o.order_status_id > 0 AND pts.store_id != 0 AND pts.store_id ='". $this->session->data['storeID'] ."'";

		$implode = array();

		if (!empty($data['filter_date_start'])) {
			$implode[] = "DATE(cpv.date_added) >= '" . $this->db->escape($data['filter_date_start']) . "'";
		}

		if (!empty($data['filter_date_end'])) {
			$implode[] = "DATE(cpvdate_added) <= '" . $this->db->escape($data['filter_date_end']) . "'";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
}
