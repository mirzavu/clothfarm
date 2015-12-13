<?php
class ControllerAutopostPlan extends Controller {

	private $error = array();

	public function index() {
	
		$this->load->language('autopost/plan');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('autopost/plan');

		$this->getList();
	}
	
	public function add() {
	
		$this->load->language('autopost/plan');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('autopost/plan');
	
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
		
			$store_id = $this->model_autopost_plan->addPlan($this->request->post);

			$this->load->model('autopost/plan');

			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('autopost/plan', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getForm();
	}
	
	
	public function edit() {
	
		$this->load->language('autopost/plan');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('autopost/plan');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			
			$this->model_autopost_plan->editPlan($this->request->get['plan_id'], $this->request->post);

			$this->load->model('autopost/plan');

			//$this->model_tickets_tickets->editSetting('config', $this->request->post, $this->request->get['ticket_id']);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('autopost/plan', 'token=' . $this->session->data['token'] . '&plan_id=' . $this->request->get['plan_id'], 'SSL'));
		}
		
		$this->getForm();
	}
	
	public function delete() {
		$this->load->language('autopost/plan');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('autopost/plan');

		
	
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $plan_id) {
				$this->model_autopost_plan->deletePlan($plan_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('autopost/plan', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		$url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('autopost/plan', 'token=' . $this->session->data['token'], 'SSL')
		);

		
		$data['add'] = $this->url->link('autopost/plan/add', 'token=' . $this->session->data['token'], 'SSL');
		$data['delete'] = $this->url->link('autopost/plan/delete', 'token=' . $this->session->data['token'], 'SSL');

		$store_total = $this->model_autopost_plan->getTotalplans();
	
	
		$results = $this->model_autopost_plan->getPlans();
	
		
	
		foreach ($results as $result) {
			$data['plans'][] = array(
				'plan_id' => $result['plan_id'],
				'plan_name' => $result['plan_name'],
				'plan_amount'     => $this->currency->format($result['plan_amount'], $this->config->get('config_currency')),
				'plan_days'      => $result['plan_days'],
				'edit'     => $this->url->link('autopost/plan/edit', 'token=' . $this->session->data['token'] . '&plan_id=' . $result['plan_id'], 'SSL')
			);
		}
		
	
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['column_action'] = $this->language->get('column_action');
		$data['vendor_label'] = $this->language->get('vendor_label');
		$data['status_label'] = $this->language->get('status_label');
		$data['date_label'] = $this->language->get('date_label');
		$data['open'] = $this->language->get('open');
		$data['closed'] = $this->language->get('closed');
		$data['onhold'] = $this->language->get('onhold');
		$data['pending_customer'] = $this->language->get('pending_customer');
		$data['pending_vendor'] = $this->language->get('pending_vendor');

		$data['user'] = $this->language->get('user');
		$data['subject'] = $this->language->get('subject');
		$data['message'] = $this->language->get('message');
		

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		
		
		$data['plan_name'] = $this->language->get('plan_name');
		$data['plan_amount'] = $this->language->get('plan_amount');
		$data['plan_days'] = $this->language->get('plan_days');
		$data['action'] = $this->language->get('action');
		

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

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('autopost/plan_list.tpl', $data));
	}
	

	public function getForm() {
	
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('autopost/plan', 'token=' . $this->session->data['token'], 'SSL')
		);
		
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_form'] = $this->language->get('text_form');
		$data['plan_name_label'] = $this->language->get('plan_name_label');
		$data['enter_plan_name'] = $this->language->get('enter_plan_name');
		$data['plan_amount_label'] = $this->language->get('plan_amount_label');
		$data['enter_plan_amount'] = $this->language->get('enter_plan_amount');
		$data['plan_days_label'] = $this->language->get('plan_days_label');
		$data['enter_plan_days'] = $this->language->get('enter_plan_days');
		$data['enable'] = $this->language->get('enable');
		$data['disable'] = $this->language->get('disable');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		
		if (isset($this->error['plan_name'])) {
			$data['error_plan_name'] = $this->error['plan_name'];
		} else {
			$data['error_plan_name'] = '';
		}
		if (isset($this->error['plan_amount'])) {
			$data['error_plan_amount'] = $this->error['plan_amount'];
		} else {
			$data['error_plan_amount'] = '';
		}
		if (isset($this->error['plan_days'])) {
			$data['error_plan_days'] = $this->error['plan_days'];
		} else {
			$data['error_plan_days'] = '';
		}
		
		


		if (!isset($this->request->get['plan_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_settings'),
				'href' => $this->url->link('autopost/plan/add', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_settings'),
				'href' => $this->url->link('autopost/plan/edit', 'token=' . $this->session->data['token'] . '&plan_id=' . $this->request->get['plan_id'], 'SSL')
			);
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (!isset($this->request->get['plan_id'])) {
			$data['action'] = $this->url->link('autopost/plan/add', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('autopost/plan/edit', 'token=' . $this->session->data['token'] . '&plan_id=' . $this->request->get['plan_id'], 'SSL');
		}
			
		$data['cancel'] = $this->url->link('autopost/plan', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->get['plan_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
		
			$this->load->model('autopost/plan');
			
			$store_info = $this->model_autopost_plan->getSetting($this->request->get['plan_id']);
			
		}
		

		$data['token'] = $this->session->data['token'];
	
		if (isset($this->request->post['plan_name'])) {
			$data['plan_name'] = $this->request->post['plan_name'];
		} elseif (isset($store_info->row['plan_name'])) {
			$data['plan_name'] = $store_info->row['plan_name'];
		} else {
			$data['plan_name'] = '';
		}
		
		if (isset($this->request->post['plan_amount'])) {
			$data['plan_amount'] = $this->request->post['plan_amount'];
		} elseif (isset($store_info->row['plan_amount'])) {
			$data['plan_amount'] = $store_info->row['plan_amount'];
		} else {
			$data['plan_amount'] = '';
		}
		
		if (isset($this->request->post['plan_days'])) {
			$data['plan_days'] = $this->request->post['plan_days'];
		} elseif (isset($store_info->row['plan_days'])) {
			$data['plan_days'] = $store_info->row['plan_days'];
		} else {
			$data['plan_days'] = '';
		}
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (isset($store_info->row['status'])) {
			$data['status'] = $store_info->row['status'];
		} else {
			$data['status'] = '';
		}
		

		

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('autopost/plan_form.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'setting/store')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		
			if (!$this->request->post['plan_name']) {
			$this->error['plan_name'] = $this->language->get('error_plan_name');
		}
		/*	if (!$this->request->post['plan_amount']) {
			$this->error['plan_amount'] = $this->language->get('error_plan_amount');
		} */
		
		



		

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'setting/store')) {
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
	
	public function vendor_list()
	{
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		$this->load->language('autopost/plan');

		$this->document->setTitle($this->language->get('heading_title'));
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		
		$data['plan_name'] = $this->language->get('plan_name');
		$data['plan_amount'] = $this->language->get('plan_amount');
		$data['merchant_email'] = $this->language->get('merchant_email');
		$data['payment_date'] = $this->language->get('payment_date');
		$data['payment_status'] = $this->language->get('payment_status');
		$this->load->model('autopost/plan');
		
		$results = $this->model_autopost_plan->getSubscriberplanlist();
		
	
		foreach ($results as $result) {
		
			$merchant_email = $this->model_autopost_plan->getcurrentemail($result['merchant_id']);
			$data['plans'][] = array(
				
				'plan_name' => $result['item_name'],
				'plan_amount'     => $this->currency->format($result['amount'], $this->config->get('config_currency')),
				'plan_days'      => $merchant_email,
				'payment_date'   => date('d-m-y m:i:s',$result['payment_date']),
				'payment_status'   => $result['payment_status']
			);
		}
		
		
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('autopost/plan_vendor_list.tpl', $data));
	}
}
