<?php
class ControllerMerchantLogin extends Controller {
	private $error = array();

	public function index() { 
		$this->load->language('merchant/login');

		$this->document->setTitle($this->language->get('heading_title'));
		
		if ($this->merchant->isLogged() && isset($this->request->get['token']) && ($this->request->get['token'] == $this->session->data['mtoken'])) { 
			$this->response->redirect($this->url->link('merchant/dashboard', 'token=' . $this->session->data['mtoken'], 'SSL'));
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
		     unset($this->session->data['merchant_id_expired']); 
			$this->session->data['mtoken'] = md5(mt_rand()); 
			if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], HTTP_SERVER) === 0 || strpos($this->request->post['redirect'], HTTPS_SERVER) === 0 )) {
				$this->response->redirect($this->request->post['redirect'] . '&token=' . $this->session->data['mtoken']);
			} else {
				$this->response->redirect($this->url->link('merchant/dashboard', 'token=' . $this->session->data['mtoken'], 'SSL'));
			}
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_login'] = $this->language->get('text_login');
		$data['text_forgotten'] = $this->language->get('text_forgotten');

		$data['entry_username'] = $this->language->get('entry_username');
		$data['entry_password'] = $this->language->get('entry_password');

		$data['button_login'] = $this->language->get('button_login');

		if ((isset($this->session->data['mtoken']) && !isset($this->request->get['token'])) || ((isset($this->request->get['token']) && (isset($this->session->data['mtoken']) && ($this->request->get['token'] != $this->session->data['mtoken']))))) {
				$this->error['warning'] = $this->language->get('error_token');
			
		}

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$data['action'] = $this->url->link('merchant/login', '', 'SSL');

		if (isset($this->request->post['username'])) {
			$data['username'] = $this->request->post['username'];
		} else {
			$data['username'] = '';
		}

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		if (isset($this->request->get['route'])) {
			$route = $this->request->get['route'];

			unset($this->request->get['route']);
			unset($this->request->get['token']);

			$url = '';

			if ($this->request->get) {
				$url .= http_build_query($this->request->get);
			}

			$data['redirect'] = $this->url->link($route, $url, 'SSL');
		} else {
			$data['redirect'] = '';
		}

		if ($this->config->get('config_password')) {
			$data['forgotten'] = $this->url->link('merchant/forgotten', '', 'SSL');
		} else {
			$data['forgotten'] = '';
		}

		$data['header'] = $this->load->controller('merchant/header');
		$data['footer'] = $this->load->controller('merchant/footer'); 

		$this->response->setOutput($this->load->view('merchant/login.tpl', $data));
	}

	protected function validate() {
		if (!isset($this->request->post['username']) || !isset($this->request->post['password']) || !$this->merchant->login($this->request->post['username'], $this->request->post['password'])  || !$this->merchant->expired_plan($this->request->post['username'], $this->request->post['password'])) { 

			$vendor_info = $this->merchant->getVendorByEmail($this->request->post['username']);

			if(isset($this->session->data['merchant_id_expired']))
			{
				 $seller_plan= $this->url->link('merchant/login/subscribe_plan', '', 'SSL');
	         	$this->error['warning'] = 'your plan expired <a href="'.$seller_plan.'"> Renew It Click Here</a>';
			}
			else if ($vendor_info && !$vendor_info['status']) {
				$this->error['warning'] = $this->language->get('error_approved');
			}else{
				$this->error['warning'] = $this->language->get('error_login');
			}
		}				

		return !$this->error;
	}








	public function check() {
		$route = '';

		if (isset($this->request->get['route'])) {
			$part = explode('/', $this->request->get['route']);

			if (isset($part[0])) {
				$route .= $part[0];
			}

			if (isset($part[1])) {
				$route .= '/' . $part[1];
			}
		}

		$ignore = array(
			'merchant/login',
			'merchant/forgotten',
			'merchant/reset'
		);
			
		if (!$this->merchant->isLogged() && !in_array($route, $ignore)) { 
			return new Action('merchant/login');
		}

		if (isset($this->request->get['route'])) {
			$ignore = array(
				'merchant/login',
				'merchant/logout',
				'merchant/forgotten',
				'merchant/reset',
				'error/not_found',
				'error/permission'
			);

			$config_ignore = array();

			if ($this->config->get('config_token_ignore')) {
				$config_ignore = unserialize($this->config->get('config_token_ignore'));
			}

			$ignore = array_merge($ignore, $config_ignore);

			if (!in_array($route, $ignore) && (!isset($this->request->get['token']) || !isset($this->session->data['mtoken']) || ($this->request->get['token'] != $this->session->data['mtoken']))) {
				return new Action('merchant/login');
			}
		} else {
			if (!isset($this->request->get['token']) || !isset($this->session->data['mtoken']) || ($this->request->get['token'] != $this->session->data['mtoken'])) {
				return new Action('merchant/login');
			}
		}
	}
	 public function subscribe_plan()
	{
	          //$subscribe_plan = $this->session->data['merchant_id_expired']; 
                  $this->load->model('subscribe/plan');
		 $data['plans'] = array();
		 $results = $this->model_subscribe_plan->getplan();
		
		$results_plan = $this->model_subscribe_plan->getsMerchantCurrentPlan($this->session->data['merchant_id_expired']);
		
		 $plan_id  = $results_plan[0]['plan_id']; 
		 $config_free_signup = trim($results_plan[0]['config_free_signup']);
		 $time = time();
		
		 $data['current_plan_id'] = $plan_id;
		 if(($config_free_signup != "") && ($config_free_signup > time()))
		 {
		    $data['current_expiry_date'] = date('d/m/y m:i:s',$config_free_signup);
		 }
		 else
		 {
		    $data['current_expiry_date'] = 'Expired';
		 }
		
		 $plans_current_name = $this->model_subscribe_plan->getcurrentPlanName($plan_id);
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
				'plan_amount'     => $result['plan_amount'],
				'subscribe'     => $this->url->link('merchant/login/payment',  '&plan_id=' . $result['plan_id'], 'SSL')
			);
		 }
		 $data['text_no_results'] = $this->language->get('text_no_results');
		if($config_free_signup > $time)
		 {
 			$data['header'] = $this->load->controller('merchant/header');
			 $data['column_left'] = $this->load->controller('merchant/column_left');
			$data['footer'] = $this->load->controller('merchant/footer');
 		}
		else
		{
				 $data['header'] = $this->load->controller('merchant/noheader');
			$data['column_left'] = '';
 			$data['footer'] = $this->load->controller('merchant/nofooter');
		 }

		$this->response->setOutput($this->load->view('subscribe/plan_list.tpl', $data));
	}
        public function payment()
	{
		
		
		  $this->load->language('subscribe/payment');
		 $plan_id = $this->request->get['plan_id']; 
		  $merchant_id = $this->session->data['merchant_id_expired'];
		$this->load->model('subscribe/plan');
		$results_plan = $this->model_subscribe_plan->getsMerchantCurrentPlan($this->session->data['merchant_id_expired']);
		
		
		  $config_free_signup = $results_plan[0]['config_free_signup'];
		 $time = time();
		
		
		 $plans = $this->model_subscribe_plan->getplanAmount($plan_id);
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
		$data['save_methods']    = $this->url->link('merchant/login/save', '' , 'SSL');
		$data['return_method']    = $this->url->link('merchant/login/return_method', '' , 'SSL');
		$data['cancel_return']    = $this->url->link('merchant/login/cancel_return', '' , 'SSL');
		 $data['return_ipn']    = $this->url->link('merchant/login/ipn', '' , 'SSL');
 		if($config_free_signup > $time)
		 {
			 $data['header'] = $this->load->controller('merchant/header');
			 $data['column_left'] = $this->load->controller('merchant/column_left');
			$data['footer'] = $this->load->controller('merchant/footer');
		}
		else
		{
			$data['header'] = $this->load->controller('merchant/noheader');
			$data['column_left'] = '';
			$data['footer'] = $this->load->controller('merchant/nofooter');
		}
		$this->response->setOutput($this->load->view('subscribe/payment_method.tpl', $data));
	}
        public function return_method() {
               
                unset($this->session->data['merchant_id_expired']);

		$data['header'] = $this->load->controller('merchant/header');
		$data['column_left'] = $this->load->controller('merchant/column_left');
		$data['footer'] = $this->load->controller('merchant/footer');
		$this->response->setOutput($this->load->view('subscribe/success_payment.tpl', $data));

	}
        public function ipn()
        {
               $this->load->model('subscribe/plan');
               $custom = explode('__',$_POST['custom']);
               $plan_id = $custom[0];
               $merchant_id  =  $custom[1];
               $plan_days  =  time()+($custom[2]*24*3600);
               $transaction_id = $_POST['txn_id'];
               $item_name = $_POST['item_name'];
               $currency_code = $_POST['mc_currency'];
               $amount = $_POST['mc_gross'];
               $payment_status = $_POST['payment_status'];
               $activate_date = $_POST['payment_date']; 
               $serialize_data=serialize($_POST);
               $payment_date = time();
               
            
               $login_info = $this->model_subscribe_plan->get_paypal_details($plan_id,$merchant_id,$transaction_id,$item_name,$currency_code,$amount,$payment_status,$activate_date, $serialize_data,$payment_date);
               $plan_update = $this->model_subscribe_plan->plan_update_merchant($plan_id,$merchant_id,$plan_days);
        }

        public function ipn_autopost()
        {
               $this->load->model('autopost/plan');
               $serialize_data=serialize($_POST);
                //$test_serialize = $this->model_autopost_plan->insert_test_details($serialize_data);
               $custom = explode('__',$_POST['custom']);
               $plan_id = $custom[0];
               $merchant_id  =  $custom[1];
               $plan_days  =  time()+($custom[2]*24*3600);
               $transaction_id = $_POST['txn_id'];
               $item_name = $_POST['item_name'];
               $currency_code = $_POST['mc_currency'];
               $amount = $_POST['mc_gross'];
               $payment_status = $_POST['payment_status'];
               $activate_date = $_POST['payment_date']; 
               
               $payment_date = time();
              
               $login_info = $this->model_autopost_plan->get_paypal_details($plan_id,$merchant_id,$transaction_id,$item_name,$currency_code,$amount,$payment_status,$activate_date, $serialize_data,$payment_date);
               $plan_update = $this->model_autopost_plan->plan_update_merchant($plan_id,$merchant_id,$plan_days);
        }
}
