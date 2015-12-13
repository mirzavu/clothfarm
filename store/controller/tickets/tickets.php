<?php
class ControllerTicketsTickets extends Controller {

	private $error = array();

	public function index() {
	
		$this->load->language('tickets/tickets');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('tickets/tickets');

		$this->getList();
		
	}
	
	public function add() {
	
		$this->load->language('tickets/tickets');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('tickets/tickets');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
		
			$store_id = $this->model_tickets_tickets->addStore($this->request->post);

			$this->load->model('tickets/tickets');

			$this->model_tickets_tickets->editSetting('config', $this->request->post, $store_id);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('tickets/tickets', 'token=' . $this->session->data['mtoken'], 'SSL'));
		}

		$this->getForm();
	}
	public function add_list()
	{
			$this->load->language('tickets/tickets');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('tickets/tickets');
			if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
				if (!$this->request->post['message']) {
					$this->error['message'] = $this->language->get('error_message');
				}
				if (isset($this->error['message'])) {
					$data['error_message'] = $this->error['message'];
				} else {
					$data['error_message'] = '';
				}
				
			$store_id = $this->model_tickets_tickets->addticketChild($this->request->get['ticket_id'],$this->request->post);

			$this->load->model('tickets/tickets');

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('tickets/tickets/list_child', '&token=' . $this->session->data['mtoken'] . '&ticket_id=' . $this->request->get['ticket_id'], 'SSL'));
		}
			

	}
	
	public function edit() {
	
		$this->load->language('tickets/tickets');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('tickets/tickets');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			
			$this->model_tickets_tickets->editStore($this->request->get['ticket_id'], $this->request->post);

			$this->load->model('tickets/tickets');

			$this->model_tickets_tickets->editSetting('config', $this->request->post, $this->request->get['ticket_id']);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('tickets/tickets', 'token=' . $this->session->data['mtoken'] . '&ticket_id=' . $this->request->get['ticket_id'], 'SSL'));
		}
		
		$this->getForm();
	}
	
	public function delete() {
		$this->load->language('tickets/tickets');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('tickets/tickets');

		
	
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $store_id) {
				$this->model_tickets_tickets->deleteTicket($store_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('tickets/tickets', 'token=' . $this->session->data['mtoken'], 'SSL'));
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
			'href' => $this->url->link('merchant/dashboard', 'token=' . $this->session->data['mtoken'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('tickets/tickets', 'token=' . $this->session->data['mtoken'], 'SSL')
		);

		
		$data['add'] = $this->url->link('tickets/tickets/add', 'token=' . $this->session->data['mtoken'], 'SSL');
		$data['delete'] = $this->url->link('tickets/tickets/delete', 'token=' . $this->session->data['mtoken'], 'SSL');

		$store_total = $this->model_tickets_tickets->getTotalTickets();
	
		$results = $this->model_tickets_tickets->getTickets();
		
	
		foreach ($results as $result) {
			$data['tickets'][] = array(
				'ticket_id' => $result['ticket_id'],
				'user_lab' => $result['user'],
				'subject'     => $result['subject'],
				'message'      => $result['message'],
				'vendor'      => $result['sender_email'],
				'ticket_time'      => $result['ticket_time'],
				'status'      => $result['status'],
				'list_child'     => $this->url->link('tickets/tickets/list_child', 'token=' . $this->session->data['mtoken'] . '&ticket_id=' . $result['ticket_id'], 'SSL'),
				'edit'     => $this->url->link('tickets/tickets/edit', 'token=' . $this->session->data['mtoken'] . '&ticket_id=' . $result['ticket_id'], 'SSL')
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

		$data['header'] = $this->load->controller('merchant/header');
		$data['column_left'] = $this->load->controller('merchant/column_left');
		$data['footer'] = $this->load->controller('merchant/footer');

		$this->response->setOutput($this->load->view('tickets/tickets_list.tpl', $data));
	}
	public function list_child()
	{
		$this->load->language('tickets/tickets');
		$this->load->model('tickets/tickets');
		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('merchant/dashboard', 'token=' . $this->session->data['mtoken'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('tickets/tickets', 'token=' . $this->session->data['mtoken'], 'SSL')
		);

		if (!isset($this->request->get['ticket_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_form'),
				'href' => $this->url->link('tickets/tickets', 'token=' . $this->session->data['mtoken'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_form'),
				'href' => $this->url->link('tickets/tickets', 'token=' . $this->session->data['mtoken'] . '&ticket_id=' . $this->request->get['ticket_id'], 'SSL')
			);
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (!isset($this->request->get['ticket_id'])) {
			$data['action'] = $this->url->link('tickets/tickets', 'token=' . $this->session->data['mtoken'], 'SSL');
		} else {
			$data['action'] = $this->url->link('tickets/tickets/add_list', 'token=' . $this->session->data['mtoken'] . '&ticket_id=' . $this->request->get['ticket_id'], 'SSL');
		}
		
		$data['heading_title'] = $this->language->get('heading_title');
		$data['text_form'] = $this->language->get('text_form');
			$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$ticket_id = $this->request->get['ticket_id'];
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
		$data['sender'] = $this->language->get('sender');
		$data['recipient'] = $this->language->get('recipient');

		$results = $this->model_tickets_tickets->getCurrentTicket($this->request->get['ticket_id']);
		foreach ($results as $result) {
			$data['current_ticket'][] = array(
				'current_ticket_id' => $result['ticket_id'],
				'current_ticket_user' => $result['user'],
				'current_ticket_subject'     => $result['subject'],
				'current_ticket_message'      => $result['message'],
				'current_ticket_vendor'      => $result['sender_email'],
				'current_ticket_time'      => $result['ticket_time'],
				'current_status'      => $result['status'],
				'list_child'     => $this->url->link('tickets/tickets/list_child', 'token=' . $this->session->data['mtoken'] . '&ticket_id=' . $result['ticket_id'], 'SSL'),
				
			);
		}
		$result_reply = $this->model_tickets_tickets->get_reply_ticket($this->request->get['ticket_id']);
		foreach ($result_reply as $result) {
			$data['reply_ticket'][] = array(
				'reply_ticket_id' => $result['ticket_id'],
				'reply_ticket_user' => $result['user'],
				'reply_ticket_subject'     => $result['subject'],
				'reply_ticket_message'      => $result['message'],
				'reply_ticket_vendor'      => $result['sender_email'],
				'reply_ticket_time'      => $result['ticket_time'],
				'reply_status'      => $result['status'],
				'sender_email'      => $result['sender_email'],
				'recipient'         => $result['recipient'],
				
				
			);
		}
		$data['message_label'] = $this->language->get('message_label');
		$data['enter_message'] = $this->language->get('enter_message');
		$data['cancel'] = $this->url->link('tickets/tickets', 'token=' . $this->session->data['mtoken'], 'SSL');
		$data['header'] = $this->load->controller('merchant/header');
		$data['column_left'] = $this->load->controller('merchant/column_left');
		$data['footer'] = $this->load->controller('merchant/footer');
	
		$this->response->setOutput($this->load->view('tickets/tickets_list_child_form.tpl', $data));
	}

	public function getForm() {
	
		$data['heading_title'] = $this->language->get('heading_title');
		$results = $this->model_tickets_tickets->getVendorList();
		
		foreach ($results as $result) {
			$data['vendor_list'][] = array(
				'vendor_id' => $result['user_id'],
				'vendor_email' => $result['email'],			
			);
		}

		$data['text_form'] = !isset($this->request->get['ticket_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_items'] = $this->language->get('text_items');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_stock'] = $this->language->get('text_stock');
		$data['text_shipping'] = $this->language->get('text_shipping');
		$data['text_payment'] = $this->language->get('text_payment');

		$data['entry_url'] = $this->language->get('entry_url');
		$data['entry_ssl'] = $this->language->get('entry_ssl');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_owner'] = $this->language->get('entry_owner');
		$data['entry_address'] = $this->language->get('entry_address');
		$data['entry_geocode'] = $this->language->get('entry_geocode');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_fax'] = $this->language->get('entry_fax');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_open'] = $this->language->get('entry_open');
		$data['entry_comment'] = $this->language->get('entry_comment');
		$data['entry_location'] = $this->language->get('entry_location');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_template'] = $this->language->get('entry_template');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_zone'] = $this->language->get('entry_zone');
		$data['entry_language'] = $this->language->get('entry_language');
		$data['entry_currency'] = $this->language->get('entry_currency');
		$data['entry_product_limit'] = $this->language->get('entry_product_limit');
		$data['entry_product_description_length'] = $this->language->get('entry_product_description_length');
		$data['entry_tax'] = $this->language->get('entry_tax');
		$data['entry_tax_default'] = $this->language->get('entry_tax_default');
		$data['entry_tax_customer'] = $this->language->get('entry_tax_customer');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_customer_group_display'] = $this->language->get('entry_customer_group_display');
		$data['entry_customer_price'] = $this->language->get('entry_customer_price');
		$data['entry_account'] = $this->language->get('entry_account');
		$data['entry_cart_weight'] = $this->language->get('entry_cart_weight');
		$data['entry_checkout_guest'] = $this->language->get('entry_checkout_guest');
		$data['entry_checkout'] = $this->language->get('entry_checkout');
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_stock_display'] = $this->language->get('entry_stock_display');
		$data['entry_stock_checkout'] = $this->language->get('entry_stock_checkout');
		$data['entry_ajax_cart'] = $this->language->get('entry_ajax_cart');
		$data['entry_logo'] = $this->language->get('entry_logo');
		$data['entry_icon'] = $this->language->get('entry_icon');
		$data['entry_image_category'] = $this->language->get('entry_image_category');
		$data['entry_image_thumb'] = $this->language->get('entry_image_thumb');
		$data['entry_image_popup'] = $this->language->get('entry_image_popup');
		$data['entry_image_product'] = $this->language->get('entry_image_product');
		$data['entry_image_additional'] = $this->language->get('entry_image_additional');
		$data['entry_image_related'] = $this->language->get('entry_image_related');
		$data['entry_image_compare'] = $this->language->get('entry_image_compare');
		$data['entry_image_wishlist'] = $this->language->get('entry_image_wishlist');
		$data['entry_image_cart'] = $this->language->get('entry_image_cart');
		$data['entry_image_location'] = $this->language->get('entry_image_location');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_secure'] = $this->language->get('entry_secure');

		$data['help_url'] = $this->language->get('help_url');
		$data['help_ssl'] = $this->language->get('help_ssl');
		$data['help_geocode'] = $this->language->get('help_geocode');
		$data['help_open'] = $this->language->get('help_open');
		$data['help_comment'] = $this->language->get('help_comment');
		$data['help_location'] = $this->language->get('help_location');
		$data['help_currency'] = $this->language->get('help_currency');
		$data['help_product_limit'] = $this->language->get('help_product_limit');
		$data['help_product_description_length'] = $this->language->get('help_product_description_length');
		$data['help_tax_default'] = $this->language->get('help_tax_default');
		$data['help_tax_customer'] = $this->language->get('help_tax_customer');
		$data['help_customer_group'] = $this->language->get('help_customer_group');
		$data['help_customer_group_display'] = $this->language->get('help_customer_group_display');
		$data['help_customer_price'] = $this->language->get('help_customer_price');
		$data['help_account'] = $this->language->get('help_account');
		$data['help_checkout_guest'] = $this->language->get('help_checkout_guest');
		$data['help_checkout'] = $this->language->get('help_checkout');
		$data['help_order_status'] = $this->language->get('help_order_status');
		$data['help_stock_display'] = $this->language->get('help_stock_display');
		$data['help_stock_checkout'] = $this->language->get('help_stock_checkout');
		$data['help_icon'] = $this->language->get('help_icon');
		$data['help_secure'] = $this->language->get('help_secure');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_save_list'] = $this->language->get('button_save_list');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_store'] = $this->language->get('tab_store');
		$data['tab_local'] = $this->language->get('tab_local');
		$data['tab_option'] = $this->language->get('tab_option');
		$data['tab_image'] = $this->language->get('tab_image');
		$data['tab_server'] = $this->language->get('tab_server');
		
		$data['enter_subject'] = $this->language->get('enter_subject');
		$data['enter_user'] = $this->language->get('enter_user');
		$data['subject_label'] = $this->language->get('subject_label');
		$data['user_label'] = $this->language->get('user_label');
		$data['message_label'] = $this->language->get('message_label');
		$data['enter_message'] = $this->language->get('enter_message');
		$data['vendor_label'] = $this->language->get('vendor_label');
		$data['enter_vendor'] = $this->language->get('enter_vendor');
		$data['recipient_label'] = $this->language->get('recipient_label');
		$data['enter_recipient'] = $this->language->get('enter_recipient');
		$data['open'] = $this->language->get('open');
		$data['closed'] = $this->language->get('closed');
		$data['onhold'] = $this->language->get('onhold');
		$data['pending_customer'] = $this->language->get('pending_customer');
		$data['pending_vendor'] = $this->language->get('pending_vendor');
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
	
		if (isset($this->error['subject'])) {
			$data['error_subject'] = $this->error['subject'];
		} else {
			$data['error_subject'] = '';
		}
		if (isset($this->error['message'])) {
			$data['error_message'] = $this->error['message'];
		} else {
			$data['error_message'] = '';
		}
		
		
		if (isset($this->error['url'])) {
			$data['error_url'] = $this->error['url'];
		} else {
			$data['error_url'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['owner'])) {
			$data['error_owner'] = $this->error['owner'];
		} else {
			$data['error_owner'] = '';
		}

		if (isset($this->error['address'])) {
			$data['error_address'] = $this->error['address'];
		} else {
			$data['error_address'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['telephone'])) {
			$data['error_telephone'] = $this->error['telephone'];
		} else {
			$data['error_telephone'] = '';
		}

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = '';
		}

		if (isset($this->error['customer_group_display'])) {
			$data['error_customer_group_display'] = $this->error['customer_group_display'];
		} else {
			$data['error_customer_group_display'] = '';
		}

		if (isset($this->error['image_category'])) {
			$data['error_image_category'] = $this->error['image_category'];
		} else {
			$data['error_image_category'] = '';
		}

		if (isset($this->error['image_thumb'])) {
			$data['error_image_thumb'] = $this->error['image_thumb'];
		} else {
			$data['error_image_thumb'] = '';
		}

		if (isset($this->error['image_popup'])) {
			$data['error_image_popup'] = $this->error['image_popup'];
		} else {
			$data['error_image_popup'] = '';
		}

		if (isset($this->error['image_product'])) {
			$data['error_image_product'] = $this->error['image_product'];
		} else {
			$data['error_image_product'] = '';
		}

		if (isset($this->error['image_additional'])) {
			$data['error_image_additional'] = $this->error['image_additional'];
		} else {
			$data['error_image_additional'] = '';
		}

		if (isset($this->error['image_related'])) {
			$data['error_image_related'] = $this->error['image_related'];
		} else {
			$data['error_image_related'] = '';
		}

		if (isset($this->error['image_compare'])) {
			$data['error_image_compare'] = $this->error['image_compare'];
		} else {
			$data['error_image_compare'] = '';
		}

		if (isset($this->error['image_wishlist'])) {
			$data['error_image_wishlist'] = $this->error['image_wishlist'];
		} else {
			$data['error_image_wishlist'] = '';
		}

		if (isset($this->error['image_cart'])) {
			$data['error_image_cart'] = $this->error['image_cart'];
		} else {
			$data['error_image_cart'] = '';
		}

		if (isset($this->error['image_location'])) {
			$data['error_image_location'] = $this->error['image_location'];
		} else {
			$data['error_image_location'] = '';
		}

		if (isset($this->error['product_limit'])) {
			$data['error_product_limit'] = $this->error['product_limit'];
		} else {
			$data['error_product_limit'] = '';
		}

		if (isset($this->error['product_description_length'])) {
			$data['error_product_description_length'] = $this->error['product_description_length'];
		} else {
			$data['error_product_description_length'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('merchant/dashboard', 'token=' . $this->session->data['mtoken'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('tickets/tickets', 'token=' . $this->session->data['mtoken'], 'SSL')
		);

		if (!isset($this->request->get['ticket_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_settings'),
				'href' => $this->url->link('tickets/tickets/add', 'token=' . $this->session->data['mtoken'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_settings'),
				'href' => $this->url->link('tickets/tickets/edit', 'token=' . $this->session->data['mtoken'] . '&ticket_id=' . $this->request->get['ticket_id'], 'SSL')
			);
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (!isset($this->request->get['ticket_id'])) {
			$data['action'] = $this->url->link('tickets/tickets/add', 'token=' . $this->session->data['mtoken'], 'SSL');
		} else {
			$data['action'] = $this->url->link('tickets/tickets/edit', 'token=' . $this->session->data['mtoken'] . '&ticket_id=' . $this->request->get['ticket_id'], 'SSL');
		}
			
		$data['cancel'] = $this->url->link('tickets/tickets', 'token=' . $this->session->data['mtoken'], 'SSL');
		
		if (isset($this->request->get['ticket_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
		
			$this->load->model('tickets/tickets');
			
			$store_info = $this->model_tickets_tickets->getSetting($this->request->get['ticket_id']);
			
		}
		

		$data['token'] = $this->session->data['mtoken'];
	
		if (isset($this->request->post['subject'])) {
			$data['subject'] = $this->request->post['subject'];
		} elseif (isset($store_info->row['subject'])) {
			$data['subject'] = $store_info->row['subject'];
		} else {
			$data['subject'] = '';
		}
		if (isset($this->request->post['message'])) {
			$data['message'] = $this->request->post['message'];
		} elseif (isset($store_info->row['message'])) {
			$data['message'] = $store_info->row['message'];
		} else {
			$data['message'] = '';
		}
		if (isset($this->request->post['message'])) {
			$data['vendor'] = $this->request->post['message'];
		} elseif (isset($store_info->row['sender_email'])) {
			$data['vendor'] = $store_info->row['sender_email'];
		} else {
			$data['vendor'] = '';
		}
		
		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (isset($store_info->row['status'])) {
			$data['status'] = $store_info->row['status'];
		} else {
			$data['status'] = '';
		}
		

		

		$data['header'] = $this->load->controller('merchant/header');
		$data['column_left'] = $this->load->controller('merchant/column_left');
		$data['footer'] = $this->load->controller('merchant/footer');

		$this->response->setOutput($this->load->view('tickets/tickets_form.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->merchant->hasPermission('modify', 'tickets/tickets')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		
			if (!$this->request->post['subject']) {
			$this->error['subject'] = $this->language->get('error_subject');
		}
			if (!$this->request->post['message']) {
			$this->error['message'] = $this->language->get('error_message');
		}
		
		



		

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->merchant->hasPermission('modify', 'tickets/tickets')) {
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