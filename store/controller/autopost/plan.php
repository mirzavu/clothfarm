<?php
class ControllerAutopostPlan extends Controller {

	private $error = array();

	public function index() {
	
		$this->load->language('autopost/plan');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('autopost/plan');

		$this->getList();
		
	}
	
	

	protected function getList() {
		$this->load->model('autopost/plan');
		$data['plans'] = array();
		$results = $this->model_autopost_plan->getplan();
		
		$results_plan = $this->model_autopost_plan->getsMerchantCurrentPlan($_SESSION['merchant_id']);
		
		$plan_id  = $results_plan[0]['plan_id_autopost']; 
		$config_free_signup = trim($results_plan[0]['autopost_time']);
		$time = time();
		
		$data['current_plan_id'] = $plan_id;
		if($config_free_signup != "")
		{
		     $data['current_expiry_date'] = date('d/m/y m:i:s',$config_free_signup);
	    }
		else 
		{
			$data['current_expiry_date'] = " Expired";
		}
		$plans_current_name = $this->model_autopost_plan->getcurrentPlanName($plan_id);
		if($plans_current_name != '0')
		{
			$data['current_plan_name'] =  $plans_current_name;
		}
		else
		{
			$data['current_plan_name'] = 'Free';
		}
		foreach ($results as $result) {
			$data['plans'][] = array(
				'plan_id' => $result['plan_id'],
				'plan_name' => $result['plan_name'],
				'plan_days' => $result['plan_days'],
				'plan_amount'     => $this->currency->convert($result['plan_amount'], 'IQD', 'USD'),
				'subscribe'     => $this->url->link('autopost/plan/payment', 'token=' . $this->session->data['mtoken'] . '&plan_id=' . $result['plan_id'], 'SSL')
			);
		}
		$data['text_no_results'] = $this->language->get('text_no_results');
		/* if($config_free_signup > $time)
		{ */
			$data['header'] = $this->load->controller('merchant/header');
			$data['column_left'] = $this->load->controller('merchant/column_left');
			$data['footer'] = $this->load->controller('merchant/footer');
		/* }
		else
		{
				$data['header'] = $this->load->controller('merchant/noheader');
			$data['column_left'] = '';
			$data['footer'] = $this->load->controller('merchant/nofooter');
		} */

		$this->response->setOutput($this->load->view('autopost/plan_list.tpl', $data));
	}
	
	
	public function payment()
	{
		
		
		$this->load->language('autopost/payment');
		$plan_id = $this->request->get['plan_id']; 
		$merchant_id = $_SESSION['merchant_id'];
		$this->load->model('autopost/plan');
		$results_plan = $this->model_autopost_plan->getsMerchantCurrentPlan($_SESSION['merchant_id']);
		
		
		$config_free_signup = $results_plan[0]['autopost_time'];
		$time = time();
		
		
		$plans = $this->model_autopost_plan->getplanAmount($plan_id);
		$data['plan_merchant_id'] = $plan_id.'__'.$merchant_id.'__'.$plans[0]['plan_days'];
		$data['plans'] = $plans;
		foreach($plans as $plan)
		{
                        $data['plan_days'] = $plan['plan_days'];
			$data['plan_name'] = $plan['plan_name'];
			$data['plan_amount'] = $this->currency->convert($plan['plan_amount'], 'IQD', 'USD');
		}
	
		$data['emailto'] = $this->config->get('config_email');
	
		$data['payment_email']    = $this->config->get('config_paypal_merchant');
		$data['save_methods']    = $this->url->link('autopost/plan/save', 'token=' . $this->session->data['mtoken'] , 'SSL');
		$data['return_method']    = $this->url->link('autopost/plan/return_method', 'token=' . $this->session->data['mtoken'] , 'SSL');
		$data['cancel_return']    = $this->url->link('autopost/plan/cancel_return', 'token=' . $this->session->data['mtoken'] , 'SSL');
		$data['return_ipn']    = $this->url->link('merchant/login/ipn_autopost', '' , 'SSL');
              
		
			$data['header'] = $this->load->controller('merchant/header');
			$data['column_left'] = $this->load->controller('merchant/column_left');
			$data['footer'] = $this->load->controller('merchant/footer');
		
		$this->response->setOutput($this->load->view('autopost/payment_method.tpl', $data));
	}
	
	 public function return_method() {

		 $data['header'] = $this->load->controller('merchant/header');
		 $data['column_left'] = $this->load->controller('merchant/column_left');
		$data['footer'] = $this->load->controller('merchant/footer');
		$this->response->setOutput($this->load->view('autopost/success_payment.tpl', $data));

	 }
	
	
	
	public function cancel_return() {

		$data['header'] = $this->load->controller('merchant/header');
		$data['column_left'] = $this->load->controller('merchant/column_left');
		$data['footer'] = $this->load->controller('merchant/footer');
		$this->response->setOutput($this->load->view('autopost/success_payment.tpl', $data));
	}
	
	
	
	public function prev_subscribe() {
		$this->load->model('autopost/plan');
		$this->load->language('autopost/plan');
		$results = $this->model_autopost_plan->getPlansMerchant($_SESSION['merchant_id']);
		
		foreach ($results as $result) {
			$results_plan_days =  $this->model_autopost_plan->getPlansDate($result['plan_id']);
			$expiry_date = $result['payment_date'] + ($results_plan_days*(24*3600)); 
			$data['plans'][] = array(
				'plan_id' => $result['plan_id'],
				'plan_name' => $result['item_name'],
				'plan_amount'     => $this->currency->format($result['amount'], $this->config->get('config_currency')),
				'plan_days'      => date('d/m/y m:i:s',$result['payment_date']),
				'expiry_date'      => date('d/m/y m:i:s',$expiry_date),
				
			);
		}	
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['user'] = $this->language->get('user');
		$data['subject'] = $this->language->get('subject');
		$data['message'] = $this->language->get('message');
		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		
		
		$data['plan_name'] = $this->language->get('plan_name');
		$data['plan_amount'] = $this->language->get('plan_amount');
		$data['plan_days'] = $this->language->get('plan_days');
		$data['action'] = $this->language->get('action');
		$data['expiry_date'] = $this->language->get('expiry_date');
		$data['start_date'] = $this->language->get('start_date');

		$data['header'] = $this->load->controller('merchant/header');
		$data['column_left'] = $this->load->controller('merchant/column_left');
		$data['footer'] = $this->load->controller('merchant/footer');
		$this->response->setOutput($this->load->view('autopost/previous_subscribe.tpl', $data));
	}
	
	

	

	protected function validateForm() {
		if (!$this->merchant->hasPermission('modify', 'autopost/plan')) {
			$this->error['warning'] = $this->language->get('autopost/plan');
		}

			return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->merchant->hasPermission('modify', 'autopost/plan')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		$this->load->model('sale/order');

		foreach ($this->request->post['selected'] as $store_id) {
			if (!$store_id) {
				$this->error['warning'] = $this->language->get('error_default');
			}

			$store_total = $this->model_sale_order->getTotalOrdersByStoreId($store_id);

			if ($store_total) {
				$this->error['warning'] = sprintf($this->language->get('error_store'), $store_total);
			}
		}

		return !$this->error;
	}

	public function template() {
		if ($this->request->server['HTTPS']) {
			$server = HTTPS_CATALOG;
		} else {
			$server = HTTP_CATALOG;
		}

		if (is_file(DIR_IMAGE . 'templates/' . basename($this->request->get['template']) . '.png')) {
			$this->response->setOutput($server . 'image/templates/' . basename($this->request->get['template']) . '.png');
		} else {
			$this->response->setOutput($server . 'image/no_image.jpg');
		}
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
	 public function ipn_autopost()
        {
               $this->load->model('autopost/plan');
               $serialize_data=serialize($_POST);
                $test_serialize = $this->model_autopost_plan->insert_test_details($serialize_data);
               $custom = explode('__',$_POST['custom']);
               $plan_id = $custom[0];
               $merchant_id  =  $custom[1];
               $plan_days  =  time()+($custom[2]*24*3600);
               $transaction_id = $_POST['txn_id'];
               $item_name = $_POST['item_name'];
               $currency_code = $_POST['mc_currency'];
               $amount = $_POST['payment_fee'];
               $payment_status = $_POST['payment_status'];
               $activate_date = $_POST['payment_date']; 
               
               $payment_date = time();
              
               $login_info = $this->model_autopost_plan->get_paypal_details($plan_id,$merchant_id,$transaction_id,$item_name,$currency_code,$amount,$payment_status,$activate_date, $serialize_data,$payment_date);
               $plan_update = $this->model_autopost_plan->plan_update_merchant($plan_id,$merchant_id,$plan_days);
        }

        public function cron_job()
	{

		$this->load->model('autopost/plan');
                $data['logo_path'] = HTTP_SERVER.'catalog/view/theme/megashop/image/logo.png';		
                $data['site_name'] = $this->config->get('config_name');
                $data['home_path'] = $this->url->link('common/home');
                $data['login_store'] = HTTP_SERVER.'store/';
		$status = $this->model_autopost_plan->vendor_expiry_email();
                foreach($status as $expiry) {
                         $data['first_name'] = $expiry['firstname'];
                         $data['expiry_date'] = date('Y-m-d',$expiry['config_free_signup']);
                         $subject = $data['site_name'].' Expiry Alert';
			//$message = "Your subscriber plan is Expiry Soon.";
                        $message = $this->load->view('megashop/template/common/mail_template.tpl', $data);
			$mail = new Mail();
                      
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			
			
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender($this->config->get('config_name'));
			$mail->setSubject($subject);
			$mail->setHtml($message);
                     
                            $email = $expiry['email']; 
                              
                            if (utf8_strlen($email) > 0 && preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $email)) {
                                  $mail->setTo($email);
			           $mail->send();
                            }
                }
	
	}
}