<?php
class ModelLocalisationVendorShippingRate extends Model {
	public function addVendorShippingRate($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "vendor_shipping_rate SET name = '" . $this->db->escape($data['name']) . "', rate = '" . (float)$data['rate'] . "', `type` = '" . $this->db->escape($data['type']) . "', geo_zone_id = '" . (int)$data['geo_zone_id'] . "', date_added = NOW(), date_modified = NOW()");			

		$vendor_shipping_rate_id = $this->db->getLastId();

			if($vendor_shipping_rate_id){

				$this->db->query("INSERT INTO " . DB_PREFIX . "vendor_shipping_class SET title = '" . $this->db->escape($data['name']) . "', description = '" . $this->db->escape($data['name']) . "', date_added = NOW(), vendor_shipping_rate_id = '" . (int)$vendor_shipping_rate_id . "'");

				$vendor_shipping_class_id = $this->db->getLastId();

				if($vendor_shipping_class_id){ 			
					$this->db->query("INSERT INTO " . DB_PREFIX . "vendor_shipping_rule SET vendor_shipping_class_id = '" . (int)$vendor_shipping_class_id . "', vendor_shipping_rate_id = '" . (int)$vendor_shipping_rate_id . "', based = 'payment' ");
				}
			}

	}

	public function editVendorShippingRate($vendor_shipping_rate_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "vendor_shipping_rate SET name = '" . $this->db->escape($data['name']) . "', rate = '" . (float)$data['rate'] . "', `type` = '" . $this->db->escape($data['type']) . "', geo_zone_id = '" . (int)$data['geo_zone_id'] . "', date_modified = NOW() WHERE vendor_shipping_rate_id = '" . (int)$vendor_shipping_rate_id . "'");

			if($vendor_shipping_rate_id){

				$this->db->query("UPDATE " . DB_PREFIX . "vendor_shipping_class SET title = '" . $this->db->escape($data['name']) . "', description = '" . $this->db->escape($data['name']) . "' WHERE vendor_shipping_rate_id = '" . (int)$vendor_shipping_rate_id . "'");
				
			}
	
	}

	public function deleteVendorShippingRate($vendor_shipping_rate_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "vendor_shipping_rate WHERE vendor_shipping_rate_id = '" . (int)$vendor_shipping_rate_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "vendor_shipping_class WHERE vendor_shipping_rate_id = '" . (int)$vendor_shipping_rate_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "vendor_shipping_rule WHERE vendor_shipping_rate_id = '" . (int)$vendor_shipping_rate_id . "'");
		
	}

	public function getVendorShippingRate($vendor_shipping_rate_id) {
		$query = $this->db->query("SELECT tr.vendor_shipping_rate_id, tr.name AS name, tr.rate, tr.type, tr.geo_zone_id, gz.name AS geo_zone, tr.date_added, tr.date_modified FROM " . DB_PREFIX . "vendor_shipping_rate tr LEFT JOIN " . DB_PREFIX . "geo_zone gz ON (tr.geo_zone_id = gz.geo_zone_id) WHERE tr.vendor_shipping_rate_id = '" . (int)$vendor_shipping_rate_id . "'");

		return $query->row;
	}

	public function getVendorShippingRates($data = array()) {
		$sql = "SELECT tr.vendor_shipping_rate_id, tr.name AS name, tr.rate, tr.type, gz.name AS geo_zone, tr.date_added, tr.date_modified FROM " . DB_PREFIX . "vendor_shipping_rate tr LEFT JOIN " . DB_PREFIX . "geo_zone gz ON (tr.geo_zone_id = gz.geo_zone_id)";

		$sort_data = array(
			'tr.name',
			'tr.rate',
			'tr.type',
			'gz.name',
			'tr.date_added',
			'tr.date_modified'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY tr.name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
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
	

	public function getTotalVendorShippingRates() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "vendor_shipping_rate");

		return $query->row['total'];
	}

	public function getTotalVendorShippingRatesByGeoZoneId($geo_zone_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "vendor_shipping_rate WHERE geo_zone_id = '" . (int)$geo_zone_id . "'");

		return $query->row['total'];
	}	
	
}
