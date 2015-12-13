<?php
class ControllerFundsSalesCommission extends Controller {
	public function index() {
		$this->load->language('funds/sales_commission');

		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->request->get['filter_store'])) {
			$filter_store = $this->request->get['filter_store'];
		} else {
			$filter_store = '';
		}

		if (isset($this->request->get['filter_email'])) {
			$filter_email = $this->request->get['filter_email'];
		} else {
			$filter_email = '';
		}

		if (isset($this->request->get['filter_date_start'])) {
			$filter_date_start = $this->request->get['filter_date_start'];
		} else {
			$filter_date_start = date('Y-m-d', strtotime(date('Y') . '-' . date('m') . '-01'));
		}

		if (isset($this->request->get['filter_date_end'])) {
			$filter_date_end = $this->request->get['filter_date_end'];
		} else {
			$filter_date_end = date('Y-m-d');
		}		

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_store'])) {
			$url .= '&filter_store=' . $this->request->get['filter_store'];
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}		

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
			'href' => $this->url->link('funds/sales_commission', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$this->load->model('funds/sales_commission');

		$data['site_commissions'] = array();

		$filter_data = array(
			'filter_store'	     => $filter_store,
			'filter_email'	     => $filter_email,
			'filter_date_start'  => $filter_date_start,
			'filter_date_end'    => $filter_date_end,			
			'start'              => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'              => $this->config->get('config_limit_admin')
		);

		$sales_total = $this->model_funds_sales_commission->getTotalSalesCommission($filter_data);

		$results = $this->model_funds_sales_commission->getSalesCommission($filter_data);

		foreach ($results as $result) {
			$overall_total = ($result['total'] - $result['refund'] - $result['dispute']);
			$site_earnings =  $overall_total * $result['commission'] / 100; 
			$vendor_earnings = $overall_total - $site_earnings;
			$balance = $vendor_earnings - $result['paid'];
			$data['site_commissions'][] = array(				
				'store'       => ucfirst($result['store']),
				'vendor'       => ucfirst($result['vendor']), 
				'email'       => $result['email'],
				'commission'  => $result['commission'],
				'status'      => ($result['status']) ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),				
				'orders'      => $result['orders'],				
				'total'       => $this->currency->format($result['total'], $this->config->get('config_currency')),
				'refund'       => $this->currency->format($result['refund'], $this->config->get('config_currency')),
				'dispute' => $this->currency->format($result['dispute'], $this->config->get('config_currency')),
				'site_earnings' => $this->currency->format($site_earnings, $this->config->get('config_currency')),
				'vendor_earnings' => $this->currency->format($vendor_earnings, $this->config->get('config_currency')),
				'paid' => $this->currency->format($result['paid'], $this->config->get('config_currency')),
				'balance' => $this->currency->format($balance, $this->config->get('config_currency')),
				'is_balance' => $balance <= 0 ? 0 : 1, 
				'color' => $this->getProperColor($balance),
				'href' => $this->url->link('funds/sales_commission/pay_seller', 'transact_id='.$result['store_id'].'&token=' . $this->session->data['token']. $url, 'SSL')

			);
		} 

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_all_status'] = $this->language->get('text_all_status');

		$data['column_store'] = $this->language->get('column_store');
		$data['column_vendor'] = $this->language->get('column_vendor');
		$data['column_email'] = $this->language->get('column_email');
		$data['column_commission'] = $this->language->get('column_commission');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_orders'] = $this->language->get('column_orders');
		$data['column_total'] = $this->language->get('column_total');
		$data['column_site_earnings'] = $this->language->get('column_site_earnings');
		$data['column_vendor_earnings'] = $this->language->get('column_vendor_earnings');
		$data['column_dispute'] = $this->language->get('column_dispute');
		$data['column_refund'] = $this->language->get('column_refund');
		$data['column_paid'] = $this->language->get('column_paid');
		$data['column_balance'] = $this->language->get('column_balance');
		$data['column_action'] = $this->language->get('column_action');

		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_email'] = $this->language->get('entry_email');

		$data['button_filter'] = $this->language->get('button_filter');

		$data['token'] = $this->session->data['token'];

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
		
		$url = '';

		if (isset($this->request->get['filter_store'])) {
			$url .= '&filter_store=' . $this->request->get['filter_store'];
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}		

		$pagination = new Pagination();
		$pagination->total = $sales_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('report/sales_commission', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($sales_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($sales_total - $this->config->get('config_limit_admin'))) ? $sales_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $sales_total, ceil($sales_total / $this->config->get('config_limit_admin')));

		$data['filter_date_start'] = $filter_date_start;
		$data['filter_date_end'] = $filter_date_end;
		$data['filter_store'] = $filter_store;
		$data['filter_email'] = $filter_email;		

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('funds/sales_commission.tpl', $data));
	}

	public function pay_seller() {

		$this->load->language('funds/sales_commission'); 
		$this->load->language('funds/pay_seller');  

		$this->document->setTitle($this->language->get('heading_title'));
							
		$this->load->model('funds/sales_commission');		

		$data['display_total_due'] = $url = '';

		if (isset($this->request->get['filter_store'])) {
			$url .= '&filter_store=' . $this->request->get['filter_store'];
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . $this->request->get['filter_email'];
		}

		if (isset($this->request->get['filter_date_start'])) {
			$url .= '&filter_date_start=' . $this->request->get['filter_date_start'];
		}

		if (isset($this->request->get['filter_date_end'])) {
			$url .= '&filter_date_end=' . $this->request->get['filter_date_end'];
		}		

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if( $this->request->get['transact_id'] ){  
			$filter_data = array(
				'filter_store_id' => $this->request->get['transact_id']			
			);

			$results = $this->model_funds_sales_commission->getSalesCommission($filter_data); 
			foreach ($results as $result) {
				$overall_total = ($result['total'] - $result['refund'] - $result['dispute']);
				$site_earnings =  $overall_total * $result['commission'] / 100; 
				$vendor_earnings = $overall_total - $site_earnings;
				$data['balance'] = $vendor_earnings - $result['paid'];	
				$data['display_total_due'] = $this->currency->format($data['balance'], $this->config->get('config_currency'));		
			} 

			if($data['balance'] <= 0 || count($results) == 0 ){
				$this->response->redirect($this->url->link('funds/sales_commission', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			}
			
		}else{
			$this->response->redirect($this->url->link('funds/sales_commission', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		} 
		
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = $this->document->setTitle($this->language->get('heading_title'));

		
		$data['entry_balance'] = $this->language->get('entry_balance');
				
		$data['entry_payment'] = $this->language->get('entry_payment');
		$data['entry_notes'] = $this->language->get('entry_notes');
		$data['entry_no_payment'] = $this->language->get('entry_no_payment');			

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');		

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
			'href' => $this->url->link('funds/sales_commission', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);
		
		$data['cancel'] = $this->url->link('funds/sales_commission', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['transact_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$transact_info = '';
		}

		$data['token'] = $this->session->data['token'];
		
		if (isset($this->request->post['payment'])) {
			$data['payment'] = $this->request->post['payment'];
			
		} else {
			$data['payment'] = '0.0000';
			
		}				

		
		if (isset($this->request->post['notes'])) {
			$data['notes'] = $this->request->post['notes'];
		} elseif (!empty($transact_info)) {
			$data['notes'] = $transact_info['notes'];
		} else {
			$data['notes'] = '';
		}				
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) { 
			
			if ($this->request->post['payment']) { 
				if ( $this->request->post['payment'] <= 0 ) { 
					$data['error_warning'] = $this->language->get('error_payment'); 
				}
				if($this->request->post['payment'] > $data['balance'] ){
					$data['error_warning'] = $this->language->get('error_payment_high'); 
				}
			
			}else{  
				$data['error_warning'] = $this->language->get('error_payment');
			}			 		
										
			if(!$data['error_warning']){  
				$results = $this->model_funds_sales_commission->getSalesCommission($filter_data); 
				foreach ($results as $result) {
					$overall_total = ($result['total'] - $result['refund'] - $result['dispute']);
					$site_earnings =  $overall_total * $result['commission'] / 100; 
					$vendor_earnings = $overall_total - $site_earnings;
					$data['balance'] = $vendor_earnings - $result['paid'];	
				} 
				$due = $data['balance'] - $this->request->post['payment']; 
				$this->model_funds_sales_commission->paySeller( $this->request->post, $this->request->get['transact_id'], $data['balance'], $due );
				$this->session->data['success'] = $this->language->get('text_success');
				
				$this->response->redirect($this->url->link('funds/sales_commission', 'token=' . $this->session->data['token'] . $url, 'SSL'));
			}
		}

		if($data['balance'] > 0){

		$data['action'] = $this->url->link('funds/sales_commission/pay_seller', 'token=' . $this->session->data['token'] . '&transact_id=' . $this->request->get['transact_id'] . $url, 'SSL');	

		}
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('funds/pay_seller_form.tpl', $data));	
		
	}

	public function getProperColor($number)
	{		
		if ($number >= 10000){
			return '#FF8000';
		}else if ($number < 0){		
			 return '#FF0000';
		}else{

		}	
	}

	protected function validateForm() { 
		if (!$this->user->hasPermission('modify', 'funds/sales_commission')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}

}