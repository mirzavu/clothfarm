<?php
class ModelSubscribePlan extends Model {
	

	public function getplan($data = array()) {
		$store_data = '';
		

		if (!$store_data) {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "subscribe_plan");
		
			$store_data = $query->rows;

			$this->cache->set('plan', $store_data);
		}

		return $store_data;
	}
	
	public function getAddress($user_id) {
		$address_query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "merchant WHERE user_id = '" . (int)$user_id . "'");

		if ($address_query->num_rows) {
			$country_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$address_query->row['country_id'] . "'");

			if ($country_query->num_rows) {
				$country = $country_query->row['name'];
				$iso_code_2 = $country_query->row['iso_code_2'];
				$iso_code_3 = $country_query->row['iso_code_3'];
				$address_format = $country_query->row['address_format'];
			} else {
				$country = '';
				$iso_code_2 = '';
				$iso_code_3 = '';
				$address_format = '';
			}

			$zone_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$address_query->row['zone_id'] . "'");

			if ($zone_query->num_rows) {
				$zone = $zone_query->row['name'];
				$zone_code = $zone_query->row['code'];
			} else {
				$zone = '';
				$zone_code = '';
			}

			$address_data = array(
				'address_id'     => $address_query->row['address_id'],
				'firstname'      => $address_query->row['firstname'],
				'lastname'       => $address_query->row['lastname'],
				'company'        => $address_query->row['company'],
				'address_1'      => $address_query->row['address_1'],
				'address_2'      => $address_query->row['address_2'],
				'postcode'       => $address_query->row['postcode'],
				'city'           => $address_query->row['city'],
				'zone_id'        => $address_query->row['zone_id'],
				'zone'           => $zone,
				'zone_code'      => $zone_code,
				'country_id'     => $address_query->row['country_id'],
				'country'        => $country,
				'iso_code_2'     => $iso_code_2,
				'iso_code_3'     => $iso_code_3,
				'address_format' => $address_format,
				'custom_field'   => unserialize($address_query->row['custom_field'])
			);

			return $address_data;
		} else {
			return false;
		}
	}
	
	public function getplanAmount($plan_id) {
		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "subscribe_plan where plan_id=".$plan_id);
		
			$plan_amount = $query->rows;
			return $plan_amount;
	}
	
	public function getPlansMerchant($merchant_id)
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "subscribe_plan_paypal where merchant_id=".$merchant_id." order by paypal_id DESC");
		
			
			return $query->rows;
	}
	public function getsMerchantCurrentPlan($merchant_id)
	{
		$query = $this->db->query("SELECT config_free_signup,plan_id FROM " . DB_PREFIX . "merchant where user_id=".$merchant_id);
		return $query->rows;
	}
	public function getcurrentPlanName($plan_id)
	{
		if($plan_id != 0)
		{
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "subscribe_plan where plan_id=".$plan_id);
			return $query->rows[0]['plan_name'];
		}
		else
		{
			return 0;
		}
	}
	
	
	public function getPlansDate($plan_id) {
		
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "subscribe_plan where plan_id=".$plan_id);
			
			return $query->rows[0]['plan_days'];
	}


	
}