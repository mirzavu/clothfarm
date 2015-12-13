<?php
class ControllerReportVendorwiseOrder extends Controller {
	public function index() {
		$this->load->language('report/vendorwise_order');

		$this->document->setTitle($this->language->get('heading_title')); 

		if (isset($this->request->get['filter_date_start'])) {
			$filter_date_start = $this->request->get['filter_date_start'];
		} else {
			$filter_date_start = '';
		}

		if (isset($this->request->get['filter_date_end'])) {
			$filter_date_end = $this->request->get['filter_date_end'];
		} else {
			$filter_date_end = '';
		}		 

		if (isset($this->request->get['filter_store'])) {
			$filter_store = $this->request->get['filter_store'];
		} else {
			$filter_store = null;
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$filter_order_status_id = $this->request->get['filter_order_status_id'];
		} else {
			$filter_order_status_id = 0;
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['filter_store'])) {
			$url .= '&filter_store=' . $this->request->get['filter_store'];
		}

		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('report/vendorwise_order', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$this->load->model('report/vendorwise_order');  

		$data['orders'] = array();

		$filter_data = array(
			'filter_store'          	=> $filter_store,
			'filter_date_start'		=> $filter_date_start,
			'filter_date_end'		=> $filter_date_end,	
			'filter_order_status_id'        => $filter_order_status_id,		
			'start'                  	=> ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                 	=> $this->config->get('config_limit_admin')
		);

		$order_total = $this->model_report_vendorwise_order->getTotalVendorOrders($filter_data);

		$results = $this->model_report_vendorwise_order->getVendorOrders($filter_data); 
		if(isset($results)){
			foreach ($results as $result) {
				$data['orders'][] = array(
					'order_id'      => $result['order_id'],
					'customer'      => $result['customer'],
					'products'      => $result['products'],					
					'payment_method'=> $result['payment_method'],
					'status'        => $result['status'],
					'date_added'    => $result['date_added'],
					'total'         => $this->currency->format($result['total'], $this->config->get('config_currency'))
				);
			}
		}
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_no_list'] = $this->language->get('text_no_list');	
		$data['text_show'] = $this->language->get('text_show');	
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_all_status'] = $this->language->get('text_all_status');

		$data['column_order_id'] = $this->language->get('column_order_id');
		$data['column_customer'] = $this->language->get('column_customer');
		$data['column_products'] = $this->language->get('column_products');
		$data['column_total']    = $this->language->get('column_total');
		$data['column_payment_method'] = $this->language->get('column_payment_method');
		$data['column_vendor_status']  = $this->language->get('column_vendor_status');
		$data['column_date_added'] = $this->language->get('column_date_added');		

		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_vendor'] = $this->language->get('entry_vendor');		

		$data['button_filter'] = $this->language->get('button_filter');

		$data['token'] = $this->session->data['token'];
		
		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		$url = '';

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}
		
		if (isset($this->request->get['filter_store'])) {
			$url .= '&filter_store=' . $this->request->get['filter_store'];
		}
		
		if (isset($this->request->get['filter_order_status_id'])) {
			$url .= '&filter_order_status_id=' . $this->request->get['filter_order_status_id'];
		}

		$pagination = new Pagination();
		$pagination->total = $order_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('report/vendorwise_order', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($order_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($order_total - $this->config->get('config_limit_admin'))) ? $order_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $order_total, ceil($order_total / $this->config->get('config_limit_admin')));

		$data['filter_date_start'] = $filter_date_start;
		$data['filter_date_end'] = $filter_date_end;
		$data['filter_store'] = $filter_store;
		$data['filter_order_status_id'] = $filter_order_status_id;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('report/vendorwise_order.tpl', $data));
	}
}
