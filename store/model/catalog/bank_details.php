<?php
class ModelCatalogBankDetails extends Model {
	public function addBank_details($data) {
	      //print_r($_SESSION['merchant_id']); exit;
		$this->event->trigger('pre.admin.bank_details.add', $data);

		$this->db->query("INSERT INTO " . DB_PREFIX . "bank_details SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int)$data['sort_order'] . "', bank_name = '" . $this->db->escape($data['bank_name']) . "',account_no = '" . $this->db->escape($data['account_no']) . "',branch_name = '" . $this->db->escape($data['branch_name']) . "',ifsc_code = '" . $this->db->escape($data['ifsc_code']) . "',merchant_id = '" . $this->db->escape($_SESSION['merchant_id']) . "'");

		$bank_details_id = $this->db->getLastId();


		if (isset($data['bank_details_store'])) {
			foreach ($data['bank_details_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "bank_details_to_store SET bank_details_id = '" . (int)$bank_details_id . "', store_id = '" . (int)$store_id . "'");
			}
		}


		$this->cache->delete('bank_details');

		$this->event->trigger('post.admin.bank_details.add', $bank_details_id);

		return $bank_details_id;
	}

	public function editBank_details($bank_details_id, $data) {
		$this->event->trigger('pre.admin.bank_details.edit', $data);

		$this->db->query("UPDATE " . DB_PREFIX . "bank_details SET name = '" . $this->db->escape($data['name']) . "', sort_order = '" . (int)$data['sort_order'] . "', bank_name = '" . $this->db->escape($data['bank_name']) . "',account_no = '" . $this->db->escape($data['account_no']) . "',branch_name = '" . $this->db->escape($data['branch_name']) . "',ifsc_code = '" . $this->db->escape($data['ifsc_code']) . "',merchant_id = '" . $this->db->escape($_SESSION['merchant_id']) . "' WHERE bank_details_id = '" . (int)$bank_details_id . "'");

		
                 $this->db->query("DELETE FROM " . DB_PREFIX . "bank_details_to_store WHERE bank_details_id = '" . (int)$bank_details_id . "'");
		if (isset($data['bank_details_store'])) {
			foreach ($data['bank_details_store'] as $store_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "bank_details_to_store SET bank_details_id = '" . (int)$bank_details_id . "', store_id = '" . (int)$store_id . "'");
			}
		}


		$this->cache->delete('bank_details');

		$this->event->trigger('post.admin.bank_details.edit', $bank_details_id);
	}

	public function deleteBank_details($bank_details_id) {
		$this->event->trigger('pre.admin.bank_details.delete', $bank_details_id);

		$this->db->query("DELETE FROM " . DB_PREFIX . "bank_details WHERE bank_details_id = '" . (int)$bank_details_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "bank_details WHERE bank_details_id = '" . (int)$bank_details_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'bank_details_id=" . (int)$bank_details_id . "'");

		$this->cache->delete('bank_details');

		$this->event->trigger('post.admin.bank_details.delete', $bank_details_id);
	}

	public function getBank_details($bank_details_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "bank_details WHERE bank_details_id = '" . (int)$bank_details_id . "'");

		return $query->row;
	}

	public function getBank_detailss($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "bank_details where merchant_id='".$_SESSION['merchant_id']."'";

		/* if (!empty($data['filter_name'])) {
			$sql .= " WHERE name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}  */

		$sort_data = array(
			'name',
			'sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
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

	public function getBank_detailsStores($bank_details_id) {
		$bank_details_store_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "bank_details_to_store WHERE bank_details_id = '" . (int)$bank_details_id . "'");

		foreach ($query->rows as $result) {
			$bank_details_store_data[] = $result['store_id'];
		}

		return $bank_details_store_data;
	}

	public function getTotalBank_detailss() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "bank_details where merchant_id ='".$_SESSION['merchant_id']."'");

		return $query->row['total'];
	}
}
