<?php
class ControllerReportVendorwiseProduct extends Controller {
	public function index() {
		$this->load->language('report/vendorwise_product');

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

		if (isset($this->request->get['filter_purchase_condition'])) {
			$filter_purchase_condition = $this->request->get['filter_purchase_condition'];
		} else {
			$filter_purchase_condition = 0;
		} 

		if (isset($this->request->get['filter_store'])) {
			$filter_store = $this->request->get['filter_store'];
		} else {
			$filter_store = null;
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

		if (isset($this->request->get['filter_purchase_condition'])) {
			$url .= '&filter_purchase_condition=' . $this->request->get['filter_purchase_condition'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['filter_store'])) {
			$url .= '&filter_store=' . $this->request->get['filter_store'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('report/vendorwise_product', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$this->load->model('report/vendorwise_product');  

		$data['products'] = array();

		$filter_data = array(
			'filter_store'          	=> $filter_store,
			'filter_date_start'		=> $filter_date_start,
			'filter_date_end'		=> $filter_date_end,
			'filter_purchase_condition'	=> $filter_purchase_condition,
			'start'                  	=> ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                 	=> $this->config->get('config_limit_admin')
		);

		$product_total = $this->model_report_vendorwise_product->getTotalVendorProducts($filter_data);

		$results = $this->model_report_vendorwise_product->getVendorProducts($filter_data); 
		if(isset($results)){
			foreach ($results as $result) {
				$data['products'][] = array(
					'name'       => $result['name'],
					'model'      => $result['model'],
					'stock'      => $result['stock'],					
					'viewed'      => $result['viewed'],
					'price'      => $result['price'],
					'quantity'   => $result['quantity'],
					'total'      => $this->currency->format($result['total'], $this->config->get('config_currency'))
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

		$data['column_name'] = $this->language->get('column_name');
		$data['column_model'] = $this->language->get('column_model');
		$data['column_quantity'] = $this->language->get('column_quantity');
		$data['column_total'] = $this->language->get('column_total');
		$data['column_available'] = $this->language->get('column_available');
		$data['column_views'] = $this->language->get('column_views');
		$data['column_price'] = $this->language->get('column_price');

		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_vendor'] = $this->language->get('entry_vendor');
		$data['entry_condition'] = $this->language->get('entry_condition');
		$data['entry_purchased_date'] = $this->language->get('entry_purchased_date');
		$data['entry_created_date'] = $this->language->get('entry_created_date');

		$data['button_filter'] = $this->language->get('button_filter');

		$data['token'] = $this->session->data['token'];
		
		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		$url = '';

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}

		if (isset($this->request->get['filter_purchase_condition'])) {
			$url .= '&filter_purchase_condition=' . $this->request->get['filter_purchase_condition'];
		}
		
		if (isset($this->request->get['filter_store'])) {
			$url .= '&filter_store=' . $this->request->get['filter_store'];
		}

		$pagination = new Pagination();
		$pagination->total = $product_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('report/vendorwise_product', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_total - $this->config->get('config_limit_admin'))) ? $product_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_total, ceil($product_total / $this->config->get('config_limit_admin')));

		$data['filter_date_start'] = $filter_date_start;
		$data['filter_date_end'] = $filter_date_end;
		$data['filter_purchase_condition'] = $filter_purchase_condition;
		$data['filter_store'] = $filter_store;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('report/vendorwise_product.tpl', $data));
	}
}
