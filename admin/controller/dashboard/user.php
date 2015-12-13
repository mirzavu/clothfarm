<?php
class ControllerDashboardUser extends Controller {
	public function index() {
		$this->load->language('dashboard/user');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_day'] = $this->language->get('text_day');
		$data['text_week'] = $this->language->get('text_week');
		$data['text_month'] = $this->language->get('text_month');
		$data['text_year'] = $this->language->get('text_year');
		$data['text_view'] = $this->language->get('text_view');
		$data['text_chart_title'] = $this->language->get('text_chart_title');
		$data['text_chart_sub_title'] = $this->language->get('text_chart_sub_title');
		$data['text_chart_sub_name'] = $this->language->get('text_chart_sub_name');

		$data['token'] = $this->session->data['token'];

		return $this->load->view('dashboard/user.tpl', $data);
	}

	public function getUsers() {
		$this->load->language('dashboard/user');		

		$json = array();

		$this->load->model('setting/store');
		$this->load->model('sale/customer');

		$json['users'] = array();							

		if (isset($this->request->get['range'])) {
			$range = $this->request->get['range'];
		} else {
			$range = 'year';
		}

		switch ($range) {
			default:
			case 'day':
				$results = $this->model_setting_store->getTotalVendorsByDay();
				$json['users'][]  = array("label" => $this->language->get('text_vendor'), "data" => $results);						
				break;
			case 'week':
				$results = $this->model_setting_store->getTotalVendorsByWeek();
				$json['users'][]  = array("label" => $this->language->get('text_vendor'), "data" => $results);			
				break;
			case 'month':
				$results = $this->model_setting_store->getTotalVendorsByMonth();
				$json['users'][]  = array("label" => $this->language->get('text_vendor'), "data" => $results);								
				break;
			case 'year':
				$vendors = $this->model_setting_store->getTotalVendorsByYear();
				$customers = $this->model_sale_customer->getTotalCustomers();				
				$json['users'][]  = array($this->language->get('text_vendor'), $vendors);	
				$json['users'][]  = array($this->language->get('text_customer'), $customers);
				break;
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json,JSON_NUMERIC_CHECK));
	}
}
