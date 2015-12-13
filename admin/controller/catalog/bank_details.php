<?php
class ControllerCatalogBankDetails extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('catalog/bank_details');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/bank_details');

		$this->getList();
	}

	public function add() {
		$this->load->language('catalog/bank_details');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/bank_details');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_bank_details->addBank_details($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/bank_details', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('catalog/bank_details');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/bank_details');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_bank_details->editBank_details($this->request->get['bank_details_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/bank_details', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('catalog/bank_details');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/bank_details');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $bank_details_id) {
				$this->model_catalog_bank_details->deleteBank_details($bank_details_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/bank_details', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
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
			'href' => $this->url->link('catalog/bank_details', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['add'] = $this->url->link('catalog/bank_details/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = $this->url->link('catalog/bank_details/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['bank_detailss'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$bank_details_total = $this->model_catalog_bank_details->getTotalBank_detailss();

		$results = $this->model_catalog_bank_details->getBank_detailss($filter_data);
		
		$this->load->model('setting/store');

		foreach ($results as $result) {
			$data['bank_detailss'][] = array(
				'bank_details_id' => $result['bank_details_id'],
				'name'            => $result['name'],
				'bank_name'            => $result['bank_name'],
				'account_no'            => $result['account_no'],
				'branch_name'            => $result['branch_name'],
				'ifsc_code'            => $result['ifsc_code'],
				'sort_order'      => $result['sort_order'],
				'vendor'      => $result['vendor'],
				'email'      => $result['email'],
				//'edit'            => $this->url->link('catalog/bank_details/edit', 'token=' . $this->session->data['token'] . '&bank_details_id=' . $result['bank_details_id'] . $url, 'SSL')
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_bank_name'] = $this->language->get('column_bank_name');
		$data['column_account_no'] = $this->language->get('column_account_no');
		$data['column_branch_name'] = $this->language->get('column_branch_name');
		$data['column_ifsc_code'] = $this->language->get('column_ifsc_code');
		$data['column_vendor'] = $this->language->get('column_vendor');
		$data['column_email'] = $this->language->get('column_email');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

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

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('catalog/bank_details', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$data['sort_bank_name'] = $this->url->link('catalog/bank_details', 'token=' . $this->session->data['token'] . '&sort=bank_name' . $url, 'SSL');
		$data['sort_account_no'] = $this->url->link('catalog/bank_details', 'token=' . $this->session->data['token'] . '&sort=account_no' . $url, 'SSL');
		$data['sort_branch_name'] = $this->url->link('catalog/bank_details', 'token=' . $this->session->data['token'] . '&sort=branch_name' . $url, 'SSL');
		$data['sort_ifsc_code'] = $this->url->link('catalog/bank_details', 'token=' . $this->session->data['token'] . '&sort=ifsc_code' . $url, 'SSL');
		$data['sort_vendor'] = $this->url->link('catalog/bank_details', 'token=' . $this->session->data['token'] . '&sort=vendor' . $url, 'SSL');
		$data['sort_email'] = $this->url->link('catalog/bank_details', 'token=' . $this->session->data['token'] . '&sort=email' . $url, 'SSL');
		$data['sort_sort_order'] = $this->url->link('catalog/bank_details', 'token=' . $this->session->data['token'] . '&sort=sort_order' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $bank_details_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/bank_details', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($bank_details_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($bank_details_total - $this->config->get('config_limit_admin'))) ? $bank_details_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $bank_details_total, ceil($bank_details_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/bank_details_list.tpl', $data));
	}

	protected function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_form'] = !isset($this->request->get['bank_details_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_percent'] = $this->language->get('text_percent');
		$data['text_amount'] = $this->language->get('text_amount');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_bank_name'] = $this->language->get('entry_bank_name');
		$data['entry_account_no'] = $this->language->get('entry_account_no');
		$data['entry_branch_name'] = $this->language->get('entry_branch_name');
		$data['entry_ifsc_code'] = $this->language->get('entry_ifsc_code');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');



		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}
			if (isset($this->error['bank_name'])) {
			$data['error_bank_name'] = $this->error['bank_name'];
		} else {
			$data['error_bank_name'] = '';
		}
		
		if (isset($this->error['account_no'])) {
			$data['error_account_no'] = $this->error['account_no'];
		} else {
			$data['error_account_no'] = '';
		}

		if (isset($this->error['branch_name'])) {
			$data['error_branch_name'] = $this->error['branch_name'];
		} else {
			$data['error_branch_name'] = '';
		}

		if (isset($this->error['ifsc_code'])) {
			$data['error_ifsc_code'] = $this->error['ifsc_code'];
		} else {
			$data['error_ifsc_code'] = '';
		}



		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
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
			'href' => $this->url->link('catalog/bank_details', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		if (!isset($this->request->get['bank_details_id'])) {
			$data['action'] = $this->url->link('catalog/bank_details/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$data['action'] = $this->url->link('catalog/bank_details/edit', 'token=' . $this->session->data['token'] . '&bank_details_id=' . $this->request->get['bank_details_id'] . $url, 'SSL');
		}

		$data['cancel'] = $this->url->link('catalog/bank_details', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['bank_details_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$bank_details_info = $this->model_catalog_bank_details->getBank_details($this->request->get['bank_details_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($bank_details_info)) {
			$data['name'] = $bank_details_info['name'];
		} else {
			$data['name'] = '';
		}
		
		if (isset($this->request->post['bank_name'])) {
			$data['bank_name'] = $this->request->post['bank_name'];
		} elseif (!empty($bank_details_info)) {
			$data['bank_name'] = $bank_details_info['bank_name'];
		} else {
			$data['bank_name'] = '';
		}
		
		if (isset($this->request->post['account_no'])) {
			$data['account_no'] = $this->request->post['account_no'];
		} elseif (!empty($bank_details_info)) {
			$data['account_no'] = $bank_details_info['account_no'];
		} else {
			$data['account_no'] = '';
		}
		
		if (isset($this->request->post['branch_name'])) {
			$data['branch_name'] = $this->request->post['branch_name'];
		} elseif (!empty($bank_details_info)) {
			$data['branch_name'] = $bank_details_info['branch_name'];
		} else {
			$data['branch_name'] = '';
		}
		
		if (isset($this->request->post['ifsc_code'])) {
			$data['ifsc_code'] = $this->request->post['ifsc_code'];
		} elseif (!empty($bank_details_info)) {
			$data['ifsc_code'] = $bank_details_info['ifsc_code'];
		} else {
			$data['ifsc_code'] = '';
		}
		
		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		if (isset($this->request->post['bank_details_store'])) {
			$data['bank_details_store'] = $this->request->post['bank_details_store'];
		} elseif (isset($this->request->get['bank_details_id'])) {
			$data['bank_details_store'] = $this->model_catalog_bank_details->getBank_detailsStores($this->request->get['bank_details_id']);
		} else {
			$data['bank_details_store'] = array(0);
		}


		if (isset($this->request->post['sort_order'])) {
			$data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($bank_details_info)) {
			$data['sort_order'] = $bank_details_info['sort_order'];
		} else {
			$data['sort_order'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/bank_details_form.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/bank_details')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 2) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}
		
		if ((utf8_strlen($this->request->post['bank_name']) < 2) || (utf8_strlen($this->request->post['bank_name']) > 64)) {
			$this->error['bank_name'] = $this->language->get('error_bank_name');
		}
		
		if ((utf8_strlen($this->request->post['account_no']) < 2) || (utf8_strlen($this->request->post['account_no']) > 120)) {
			$this->error['account_no'] = $this->language->get('error_account_no');
		}
		
		if ((utf8_strlen($this->request->post['branch_name']) < 2) || (utf8_strlen($this->request->post['branch_name']) > 64)) {
			$this->error['branch_name'] = $this->language->get('error_branch_name');
		}
		
		if ((utf8_strlen($this->request->post['ifsc_code']) < 2) || (utf8_strlen($this->request->post['ifsc_code']) > 64)) {
			$this->error['ifsc_code'] = $this->language->get('error_ifsc_code');
		}


		return !$this->error;
	}

		protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/bank_details')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/bank_details');

			$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
			);

			$results = $this->model_catalog_bank_details->getBank_detailss($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'bank_details_id' => $result['bank_details_id'],
					'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}