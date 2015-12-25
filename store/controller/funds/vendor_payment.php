<?php
class ControllerFundsVendorPayment extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('funds/vendor_payment');

		$this->document->setTitle($this->language->get('heading_title'));

		if (isset($this->request->get['filter_store'])) {
			$filter_store = $this->request->get['filter_store'];
		} else {
			$filter_store = '';
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
			'href' => $this->url->link('merchant/dashboard', 'token=' . $this->session->data['mtoken'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('funds/vendor_payment', 'token=' . $this->session->data['mtoken'] . $url, 'SSL')
		);

		$this->load->model('funds/vendor_payment');

		$data['site_payments'] = array();

		$filter_data = array(
			'filter_store'	     => $filter_store,	
			'filter_date_start'  => $filter_date_start,
			'filter_date_end'    => $filter_date_end,							
			'start'              => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'              => $this->config->get('config_limit_admin')
		);

		$sales_total = $this->model_funds_vendor_payment->getTotalSalesCommission($filter_data);

		$results = $this->model_funds_vendor_payment->getSalesCommission($filter_data);
		if(count($sales_total)>0){	
		foreach ($results as $result) {			
			$data['site_payments'][] = array(				
				'store'       => ucfirst($result['store']),				
				'email'       => $result['email'],				
				'refund'       => $this->currency->format($result['refund'], $this->config->get('config_currency')),
				'dispute' => $this->currency->format($result['dispute'], $this->config->get('config_currency')),
				'commission' => $this->currency->format($result['commission'], $this->config->get('config_currency')),
				'previous_balance' => $this->currency->format($result['previous_balance'], $this->config->get('config_currency')),

				'previous_total' => $this->currency->format($result['previous_total'], $this->config->get('config_currency')),

				'payment' => $this->currency->format($result['payment'], $this->config->get('config_currency')),
				'date_added' => $result['date_added'],
				'reason' => $result['reason']
				
			);
		}
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_no_list'] = $this->language->get('text_no_list');	
		$data['text_show'] = $this->language->get('text_show');	
		

		$data['column_store'] = $this->language->get('column_store');
		$data['column_vendor'] = $this->language->get('column_vendor');
		$data['column_email'] = $this->language->get('column_email');		
		$data['column_commission'] = $this->language->get('column_commission');
		$data['column_previous_balance'] = $this->language->get('column_previous_balance');
		$data['column_balance'] = $this->language->get('column_balance');
		$data['column_previous_total'] = $this->language->get('column_previous_total');
		$data['column_dispute'] = $this->language->get('column_dispute');
		$data['column_refund'] = $this->language->get('column_refund');
		$data['column_payment'] = $this->language->get('column_payment');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_notes'] = $this->language->get('column_notes');
				
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');


		$data['button_filter'] = $this->language->get('button_filter');

		$data['token'] = $this->session->data['mtoken'];
		
		$url = '';

		if (isset($this->request->get['filter_store'])) {
			$url .= '&filter_store=' . $this->request->get['filter_store'];
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
		$pagination->url = $this->url->link('funds/vendor_payment', 'token=' . $this->session->data['mtoken'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($sales_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($sales_total - $this->config->get('config_limit_admin'))) ? $sales_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $sales_total, ceil($sales_total / $this->config->get('config_limit_admin')));
		
		$data['filter_date_start'] = $filter_date_start;
		$data['filter_date_end'] = $filter_date_end;
		$data['filter_store'] = $filter_store;	

		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		$data['header'] = $this->load->controller('merchant/header');
		$data['column_left'] = $this->load->controller('merchant/column_left');
		$data['footer'] = $this->load->controller('merchant/footer');

		$this->response->setOutput($this->load->view('funds/vendor_payment.tpl', $data));
	}

	public function debits() {
		$this->load->language('funds/vendor_payment');

		$this->document->setTitle($this->language->get('heading_title_1'));

		if (isset($this->request->get['filter_store'])) {
			$filter_store = $this->request->get['filter_store'];
		} else {
			$filter_store = null;
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

		$this->load->model('funds/vendor_payment');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('merchant/dashboard', 'token=' . $this->session->data['mtoken'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title_1'),
			'href' => $this->url->link('funds/vendor_payment/debits', 'token=' . $this->session->data['mtoken'] . $url, 'SSL')
		);

		$data['add'] = $this->url->link('funds/vendor_payment/add', 'token=' . $this->session->data['mtoken'] . $url, 'SSL');
		$data['delete'] = $this->url->link('funds/vendor_payment/delete', 'token=' . $this->session->data['mtoken'] . $url, 'SSL');		
		$data['debits'] = array();

		$filter_data = array(
			'filter_store'	     => $filter_store,
			'filter_email'	     => $filter_email,
			'filter_date_start'  => $filter_date_start,
			'filter_date_end'    => $filter_date_end,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$debit_total = $this->model_funds_vendor_payment->getTotalDebits($filter_data); 

		$results = $this->model_funds_vendor_payment->getDebits($filter_data);

		foreach ($results as $result) {
			$result['type'] == 1 ? $type = sprintf($this->language->get('debit_reflected_yes'), $result['reflected_date']) : $type = $this->language->get('debit_reflected_no');  
			$data['debits'][] = array(
				'refund_id' => $result['refund_id'],
				'store'       => ucfirst($result['name']),
				'vendor'       => ucfirst($result['vendor']),
				'email'       => $result['email'],	
				'type'        => $type,	
				'reason'      => $result['reason'],
				'debit'      => $result['refund'],
				'dispute'      => $result['dispute'],	
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),			
				'delete'      => $this->url->link('funds/vendor_payment/delete', 'token=' . $this->session->data['mtoken'] . '&debit_id=' . $result['refund_id'] . $url, 'SSL')
			);
		}

		$data['heading_title'] = $this->language->get('heading_title_1');

		$data['text_list'] = $this->language->get('text_list_1');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_store');
		$data['column_vendor'] = $this->language->get('column_vendor');
		$data['column_email'] = $this->language->get('column_email');
		$data['column_debit'] = $this->language->get('column_debit');
		$data['column_dispute'] = $this->language->get('column_dispute');
		$data['column_reason'] = $this->language->get('column_reason');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_reflects'] = $this->language->get('column_reflects');

		$data['button_add'] = $this->language->get('button_add');		
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		
		$data['entry_date_start'] = $this->language->get('entry_date_start');
		$data['entry_date_end'] = $this->language->get('entry_date_end');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_email'] = $this->language->get('entry_email');

		$data['token'] = $this->session->data['mtoken'];

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

		$url = '';

		

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}				

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
		$pagination->total = $debit_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('funds/vendor_payment/debits', 'token=' . $this->session->data['mtoken'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($debit_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($debit_total - $this->config->get('config_limit_admin'))) ? $debit_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $debit_total, ceil($debit_total / $this->config->get('config_limit_admin')));

		$data['filter_date_start'] = $filter_date_start;
		$data['filter_date_end'] = $filter_date_end;
		$data['filter_store'] = $filter_store;
		$data['filter_email'] = $filter_email;		
		
		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		$data['header'] = $this->load->controller('merchant/header');
		$data['column_left'] = $this->load->controller('merchant/column_left');
		$data['footer'] = $this->load->controller('merchant/footer');

		$this->response->setOutput($this->load->view('funds/vendor_debits.tpl', $data));
	}

	public function add() {
		$this->load->language('funds/vendor_payment');

		$this->document->setTitle($this->language->get('heading_title_2'));

		$this->load->model('funds/vendor_payment');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_funds_vendor_payment->addDebit($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';			

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}			

			if (isset($this->request->get['filter_store'])) {
				$url .= '&filter_store=' . $this->request->get['filter_store'];
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

			$this->response->redirect($this->url->link('funds/vendor_payment/debits', 'token=' . $this->session->data['mtoken'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title_2');

		$data['text_form'] = !isset($this->request->get['refund_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_vendor'] = $this->language->get('entry_vendor');
		$data['entry_debit'] = $this->language->get('entry_debit');
		$data['entry_dispute'] = $this->language->get('entry_dispute');
		$data['entry_reason'] = $this->language->get('entry_reason');			

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['store'])) {
			$data['error_store'] = $this->error['store'];
		} else {
			$data['error_store'] = '';
		}

		$url = '';

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}			

			if (isset($this->request->get['filter_store'])) {
				$url .= '&filter_store=' . $this->request->get['filter_store'];
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
			'href' => $this->url->link('merchant/dashboard', 'token=' . $this->session->data['mtoken'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title_2'),
			'href' => $this->url->link('funds/vendor_payment/add', 'token=' . $this->session->data['mtoken'] . $url, 'SSL')
		);

		if (!isset($this->request->get['refund_id'])) {
			$data['action'] = $this->url->link('funds/vendor_payment/add', 'token=' . $this->session->data['mtoken'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('funds/vendor_payment/edit', 'token=' . $this->session->data['mtoken'] . '&review_id=' . $this->request->get['refund_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('funds/vendor_payment/debits', 'token=' . $this->session->data['mtoken'] . $url, 'SSL');

		if (isset($this->request->get['refund_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$refund_info = '';
		}

		$data['token'] = $this->session->data['mtoken'];
		

		if (isset($this->request->post['debit'])) {
			$data['debit'] = $this->request->post['debit'];
		} elseif (!empty($refund_info)) {
			$data['debit'] = $review_info['debit'];
		} else {
			$data['debit'] = '';
		}

		if (isset($this->request->post['dispute'])) {
			$data['dispute'] = $this->request->post['dispute'];
		} elseif (!empty($refund_info)) {
			$data['dispute'] = $refund_info['dispute'];
		} else {
			$data['dispute'] = '';
		}

		if (isset($this->request->post['reason'])) {
			$data['reason'] = $this->request->post['reason'];
		} elseif (!empty($refund_info)) {
			$data['reason'] = $refund_info['reason'];
		} else {
			$data['reason'] = '';
		}		

		if (isset($this->request->post['store'])) {
			$data['store'] = $this->request->post['store'];
		} elseif (!empty($refund_info)) {
			$data['store'] = $refund_info['store'];
		} else {
			$data['store'] = '';
		}

		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		$data['header'] = $this->load->controller('merchant/header');
		$data['column_left'] = $this->load->controller('merchant/column_left');
		$data['footer'] = $this->load->controller('merchant/footer');

		$this->response->setOutput($this->load->view('funds/refund_form.tpl', $data));
	}


	public function delete() {
		$this->load->language('funds/vendor_payment');

		$this->document->setTitle($this->language->get('heading_title_1'));

		$this->load->model('funds/vendor_payment');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $refund_id) {
				$this->model_funds_vendor_payment->deleteRefund($refund_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['filter_email'])) {
				$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
			}			

			if (isset($this->request->get['filter_store'])) {
				$url .= '&filter_store=' . $this->request->get['filter_store'];
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

			$this->response->redirect($this->url->link('funds/vendor_payment/debits', 'token=' . $this->session->data['mtoken'] . $url, 'SSL'));
		}

		$this->getList();
	}


	protected function validateForm() { 
		if (!$this->merchant->hasPermission('modify', 'funds/vendor_payment')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		
		if ($this->request->post['debit'] || $this->request->post['dispute']) {
			if (!is_numeric( $this->request->post['debit'] ) || !is_numeric( $this->request->post['dispute'] ) || $this->request->post['debit'] == 0 && $this->request->post['dispute'] == 0) {
				$this->error['warning'] = $this->language->get('error_debit');
			}
		}else{
			$this->error['warning'] = $this->language->get('error_debit');
		}		

		if (!$this->request->post['store']) { 
			$this->error['store'] = $this->language->get('error_store');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->merchant->hasPermission('modify', 'funds/vendor_payment')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}
