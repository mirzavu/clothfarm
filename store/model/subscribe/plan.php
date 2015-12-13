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

			$address_data =  $address_query->row['config_free_signup'];
				
		

			return $address_data;
		
		
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
	
	 public function plan_update_merchant($plan_id,$merchant_id,$plan_days) {

                $this->db->query("UPDATE " . DB_PREFIX . "merchant SET config_free_signup = '" .$plan_days. "', plan_id= '" . $plan_id . "' WHERE user_id = '" . (int)$merchant_id . "'");
        }

       public function vendor_expiry_email() {
		$time = time();
		$time_expiry_date = $time + ($this->config->get('config_expiry_email')*24*3600);	
               
		$query = $this->db->query("SELECT email,plan_id,config_free_signup,firstname FROM `" . DB_PREFIX . "merchant` where config_free_signup between ".$time." AND ".$time_expiry_date);
		return $query->rows;			

	}
        public function get_paypal_details($plan_id,$merchant_id,$transaction_id,$item_name,$currency_code,$amount,$payment_status,$activate_date, $serialize_data,$payment_date) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "subscribe_plan_paypal SET plan_id = '" .$plan_id. "',merchant_id = '" .$merchant_id. "',transaction_id = '" .$transaction_id. "',item_name = '" .$item_name. "',currency_code = '" .$currency_code. "',amount = '" .$amount. "',payment_status = '" .$payment_status. "',activate_date = '" .$activate_date. "',serialize_data = '" .$serialize_data. "',payment_date = '" .$payment_date. "'");
	}




	
}