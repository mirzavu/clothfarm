<?php
class ControllerMerchantDashboard extends Controller {
	public function index() { 
		$this->load->language('merchant/dashboard');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_sale'] = $this->language->get('text_sale');
		$data['text_map'] = $this->language->get('text_map');
		$data['text_activity'] = $this->language->get('text_activity');
		$data['text_recent'] = $this->language->get('text_recent');

		
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('merchant/dashboard', 'token=' . $this->session->data['mtoken'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('merchant/dashboard', 'token=' . $this->session->data['mtoken'], 'SSL')
		);  
		
		// Check install directory exists
		if (is_dir(dirname(DIR_APPLICATION) . '/install')) {
			$data['error_install'] = $this->language->get('error_install');
		} else {
			$data['error_install'] = '';
		}

		$data['token'] = $this->session->data['mtoken']; 

		$data['header'] = $this->load->controller('merchant/header'); 
		$data['column_left'] = $this->load->controller('merchant/column_left'); 
		$data['order'] = $this->load->controller('dashboard/order');
		$data['sale'] = $this->load->controller('dashboard/sale');
		$data['customer'] = $this->load->controller('dashboard/customer');
		$data['online'] = $this->load->controller('dashboard/online');
		$data['transaction'] = $this->load->controller('dashboard/transaction');
		$data['map'] = $this->load->controller('dashboard/map');
		$data['chart'] = $this->load->controller('dashboard/chart');		 
		$data['recent'] = $this->load->controller('dashboard/recent'); 
		$data['product'] = $this->load->controller('dashboard/product');
		$data['coupon'] = $this->load->controller('dashboard/coupon');
		$data['return'] = $this->load->controller('dashboard/return');	
		$data['statistics'] = $this->load->controller('dashboard/statistics');
		$data['order_by_status'] = $this->load->controller('dashboard/order_by_status');
						
		$data['footer'] = $this->load->controller('merchant/footer');

		$this->response->setOutput($this->load->view('merchant/dashboard.tpl', $data));
	}
}
