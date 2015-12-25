<?php
/**
 * Created by PhpStorm.
 * User: Applehouse
 * Date: 10/8/14
 * Time: 8:14 PM
 */

class ModelPromotionsRewardPointsTransactions extends Model
{
	CONST BEHAVIOR_SIGN_UP          = '1::Signing Up';
	CONST BEHAVIOR_POSTING_REVIEW   = '2::Posting Product Review';
	CONST BEHAVIOR_REFERRAL_VISITOR = '3::Referral Visitor (Friend click on referral link)';
	CONST BEHAVIOR_REFERRAL_SIGN_UP = '4::Referral Sign-Up';
	CONST BEHAVIOR_NEWSLETTER       = '5::Signing Up Newsletter';
	CONST BEHAVIOR_FACEBOOK_LIKE    = '6::Facebook Like';
	CONST BEHAVIOR_FACEBOOK_SHARE   = '7::Facebook Share';
	CONST BEHAVIOR_BIRTHDAY         = '8::Customer Birthday';
	CONST BEHAVIOR_DAILY_LOGIN      = '9::Daily Login Reward';

	CONST TRANSACTION_USE_POINTS_ON_ORDER = 11;
	CONST TRANSACTION_REWARD_ON_ORDER     = 12;
    public function beforeUpdateOrder($order_id, $data)
    {
        $redeemed_order_query   = $this->db->query("SELECT * FROM ".DB_PREFIX."customer_reward WHERE order_id = $order_id AND transaction_type = ".self::TRANSACTION_USE_POINTS_ON_ORDER);
        $rewarded_order_query   = $this->db->query("SELECT * FROM ".DB_PREFIX."customer_reward WHERE order_id = $order_id AND transaction_type = ".self::TRANSACTION_REWARD_ON_ORDER);

        $this->load->model('sale/customer');
        $this->load->model('sale/order');
        $order_info = $this->model_sale_order->getOrder($order_id);
        $customer_info = $this->model_sale_customer->getCustomerByEmail($order_info['email']);

        if($data['order_status_id'] == $this->config->get('update_based_order_status'))
        {
            $customer_reward_data = $this->db->query("SELECT * FROM ".DB_PREFIX."customer_reward WHERE order_id = $order_id");

            if(!$customer_reward_data->num_rows){
                $order_total_data = $this->db->query("SELECT * FROM ".DB_PREFIX."order_total WHERE order_id = $order_id");
                $reward_point = $redeem_point = 0;
                foreach($order_total_data->rows as $odt){
                    if($odt['code'] == 'earn_point'){
                        $reward_point = $odt['value'];
                    }
                    if($odt['code'] == 'redeem_point'){
                        $redeem_point = $odt['value'];
                    }
                }
                if($redeem_point > 0){
                    $log_message = "Order ID: <b>$order_id</b>, Redeemed -$redeem_point ".$this->config->get('text_points_'.$this->language->get('code'));
                    $this->db->query("INSERT INTO " . DB_PREFIX . "customer_reward SET
							  order_id = $order_id,
							  customer_id = '" . (int)$data['customer_id'] . "',
							  description = '" . $this->db->escape($log_message) ."',
							  points = '" . (float)-$redeem_point . "',
							  transaction_type = '" . (int)self::TRANSACTION_USE_POINTS_ON_ORDER . "',
							  status = 1,
							  date_added = NOW()");
                }
                if($reward_point > 0){
                    $log_message = "Reward for checkout order #$order_id";

                    $this->db->query("INSERT INTO " . DB_PREFIX . "customer_reward SET
						  order_id = $order_id,
						  order_status_id = ".(int)$this->config->get('config_order_status_id').",
						  customer_id = '" . (int)$data['customer_id'] . "',
						  description = '" . $this->db->escape($log_message) ."',
						  points = '" . (float)$reward_point . "',
						  transaction_type = '" . (int)self::TRANSACTION_REWARD_ON_ORDER . "',
						  date_added = NOW()");
                }
            }

            $this->db->query("UPDATE ".DB_PREFIX."customer_reward SET status = 1, customer_id = {$customer_info['customer_id']} WHERE order_id = $order_id");
        }else{
            if(isset($redeemed_order_query->row['customer_reward_id']))
            {
                /** Return points to customer when customer used to checkout on order */
            }

            $this->db->query("UPDATE ".DB_PREFIX."customer_reward SET status = 0, customer_id = {$customer_info['customer_id']} WHERE order_id = $order_id");
        }
    }
	public function updateStatusReward($data){
		$this->db->query("UPDATE ".DB_PREFIX."customer_reward SET status = {$data['status']} WHERE customer_reward_id = {$data['customer_reward_id']}");
	}
	public function behaviorToText($id)
	{
		$const = new ReflectionClass ('ModelPromotionsRewardPointsTransactions');

		foreach($const->getConstants() as $text => $cons)
		{
			$explodeConst = explode("::", $cons);
			$behavior_id = (int)$explodeConst[0];

			$_text = explode("BEHAVIOR_", $text);
			$_text = ucwords(str_replace("_", " ", $_text[1]));
			if(!empty($id) && $id == $behavior_id)
			{
				return $_text;
			}
		}
	}
}