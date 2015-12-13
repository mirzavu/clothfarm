<?php
class ControllerSubscribePlan extends Controller {

	private $error = array();

	public function index() {
	
		$this->load->language('subscribe/plan');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('subscribe/plan');

		$this->getList();
		
	}
	
	

	protected function getList() {
		$this->load->model('subscribe/plan');
		$data['plans'] = array();
		$results = $this->model_subscribe_plan->getplan();
		
		$results_plan = $this->model_subscribe_plan->getsMerchantCurrentPlan($_SESSION['merchant_id']);
		$plan_id  = $results_plan[0]['plan_id']; 
		$data['current_plan_id'] = $plan_id;
		$data['current_expiry_date'] = date('d/m/y m:i:s',$results_plan[0]['config_free_signup']);
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
				'plan_amount'     => $this->currency->format($result['plan_amount'], '', ''),
				'subscribe'     => $this->url->link('subscribe/plan/payment', 'token=' . $this->session->data['mtoken'] . '&plan_id=' . $result['plan_id'], 'SSL')
			);
		}
                $data['text_no_results'] = $this->language->get('text_no_results');
		$data['header'] = $this->load->controller('merchant/header');
		$data['column_left'] = $this->load->controller('merchant/column_left');
		$data['footer'] = $this->load->controller('merchant/footer');

		$this->response->setOutput($this->load->view('subscribe/plan_list.tpl', $data));
	}
	
	
	public function payment()
	{
		
		
		$this->load->language('subscribe/payment');
		$plan_id = $this->request->get['plan_id']; 
		$merchant_id = $_SESSION['merchant_id'];
		
		$this->load->model('subscribe/plan');
		$plans = $this->model_subscribe_plan->getplanAmount($plan_id);
		$data['plan_merchant_id'] = $plan_id.'__'.$merchant_id.'__'.$plans[0]['plan_days'];
		$data['plans'] = $plans;
		foreach($plans as $plan)
		{
			$data['plan_name'] = $plan['plan_name'];
			$data['plan_amount'] = $plan['plan_amount'];
		}
	
		
	
		
		$data['save_methods']    = $this->url->link('subscribe/plan/save', 'token=' . $this->session->data['mtoken'] , 'SSL');
		$data['return_method']    = $this->url->link('subscribe/plan/return_method', 'token=' . $this->session->data['mtoken'] , 'SSL');
		$data['cancel_return']    = $this->url->link('subscribe/plan/cancel_return', 'token=' . $this->session->data['mtoken'] , 'SSL');
		$data['header'] = $this->load->controller('merchant/header');
		$data['column_left'] = $this->load->controller('merchant/column_left');
		$data['footer'] = $this->load->controller('merchant/footer');
		$this->response->setOutput($this->load->view('subscribe/payment_method.tpl', $data));
	}
	
	public function return_method() {

		$data['header'] = $this->load->controller('merchant/header');
		$data['column_left'] = $this->load->controller('merchant/column_left');
		$data['footer'] = $this->load->controller('merchant/footer');
		$this->response->setOutput($this->load->view('subscribe/success_payment.tpl', $data));

	}
	
	
	
	public function cancel_return() {

		print_r($_POST); exit;
	}
	
	public function prev_subscribe() {
		$this->load->model('subscribe/plan');
		$this->load->language('subscribe/plan');
		$results = $this->model_subscribe_plan->getPlansMerchant($_SESSION['merchant_id']);
		
		foreach ($results as $result) {
			$results_plan_days =  $this->model_subscribe_plan->getPlansDate($result['plan_id']);
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
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['user'] = $this->language->get('user');
		$data['subject'] = $this->language->get('subject');
		$data['message'] = $this->language->get('message');
		$data['text_list'] = $this->language->get('text_list');

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
		$this->response->setOutput($this->load->view('subscribe/previous_subscribe.tpl', $data));
	}
	
	

	

	protected function validateForm() {
		if (!$this->merchant->hasPermission('modify', 'subscribe/plan')) {
			$this->error['warning'] = $this->language->get('subscribe/plan');
		}

			return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->merchant->hasPermission('modify', 'subscribe/plan')) {
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
}