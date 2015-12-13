<?php
class ControllerAccountSeller extends Controller {
	private $error = array();

	public function index() {
		if ($this->customer->isLogged()) {
			$this->response->redirect($this->url->link('account/logout', '', 'SSL'));
		}


		/* if (!isset($this->request->get['plan_id'])) {
			$this->response->redirect($this->url->link('account/seller/pricing', '', 'SSL'));			
		} */
                 if(isset($this->request->get['plan_id'])) {
			$data['plan_id'] = $this->request->get['plan_id'];
		}

		$this->load->language('account/seller');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

		$this->load->model('account/seller');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) { 
                        unset($this->session->data['subscribe_plan_id']); 
			$plan = $this->model_account_seller->getcurrentplan($_POST['plan_id']);
			$plan_amount = $plan[0]['plan_amount'];
			if($plan_amount == 0)
			{
				$store_id = $this->model_account_seller->addStore($this->request->post);
				$this->response->redirect($this->url->link('account/seller_success'));
			}
			else
			{
				$post = $this->request->post;
					$this->session->data['seller_register_details'] = $post;
					
					
						$this->response->redirect($this->url->link('account/seller/subscribe'));
				//$this->load->controller('account/seller/subscribe',$this->request->post);
			}
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/seller', '', 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_register'),
			'href' => $this->url->link('account/seller', '', 'SSL')
		);

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_your_details'] = $this->language->get('text_your_details');
		$data['text_your_address'] = $this->language->get('text_your_address');
		$data['text_store_information'] = $this->language->get('text_store_information');		
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_loading'] = $this->language->get('text_loading');
		$data['text_agree'] = $this->language->get('text_agree');

		
		$data['entry_firstname'] = $this->language->get('entry_firstname');
		$data['entry_lastname'] = $this->language->get('entry_lastname');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');		
		$data['entry_address'] = $this->language->get('entry_address');		
		$data['entry_postcode'] = $this->language->get('entry_postcode');
		$data['entry_city'] = $this->language->get('entry_city');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_zone'] = $this->language->get('entry_zone');		
		$data['entry_password'] = $this->language->get('entry_password');
		$data['entry_confirm'] = $this->language->get('entry_confirm');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_owner'] = $this->language->get('entry_owner');

		$data['button_continue'] = $this->language->get('button_continue');
		$data['button_upload'] = $this->language->get('button_upload');
		 $data['text_plan_information'] = $this->language->get('text_plan_information');		
		 $data['entry_plan'] = $this->language->get('entry_plan');
		 $data['text_select_plan'] = $this->language->get('text_select_plan');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['firstname'])) {
			$data['error_firstname'] = $this->error['firstname'];
		} else {
			$data['error_firstname'] = '';
		}

		if (isset($this->error['lastname'])) {
			$data['error_lastname'] = $this->error['lastname'];
		} else {
			$data['error_lastname'] = '';
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

		if (isset($this->error['address'])) {
			$data['error_address'] = $this->error['address'];
		} else {
			$data['error_address'] = '';
		}		

		if (isset($this->error['postcode'])) {
			$data['error_postcode'] = $this->error['postcode'];
		} else {
			$data['error_postcode'] = '';
		}

		if (isset($this->error['country'])) {
			$data['error_country'] = $this->error['country'];
		} else {
			$data['error_country'] = '';
		}
		
		if (isset($this->error['plan'])) {
			$data['error_plan'] = $this->error['plan'];
		} else {
			$data['error_plan'] = '';
		}

		if (isset($this->error['zone'])) {
			$data['error_zone'] = $this->error['zone'];
		} else {
			$data['error_zone'] = '';
		}

		

		if (isset($this->error['password'])) {
			$data['error_password'] = $this->error['password'];
		} else {
			$data['error_password'] = '';
		}

		if (isset($this->error['confirm'])) {
			$data['error_confirm'] = $this->error['confirm'];
		} else {
			$data['error_confirm'] = '';
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
                if (isset($this->request->get['plan_id'])) {
			$data['plan_id'] = $this->request->get['plan_id'];
		}
                $data['plans'] = array();
		$plans = $this->model_account_seller->getplandetails();

		foreach($plans as $plan){
			$data['plans'][] = array(
					'plan_id'     => $plan['plan_id'],
					'plan_name'   => $plan['plan_name'],
					'plan_amount'   => $plan['plan_amount'],
					'plan_days'   => $plan['plan_days'],
					'description' => $plan['description']
				);
		}
		

		$data['action'] = $this->url->link('account/seller', '', 'SSL');
		

		if (isset($this->request->get['plan_id'])) {
			$data['plan_id'] = $this->request->get['plan_id'];
                        $this->session->data['subscribe_plan_id'] = $data['plan_id'];
		} else {
			 if(isset($this->session->data['subscribe_plan_id']))
		         {
		              $data['plan_id'] = $this->session->data['subscribe_plan_id'];
			 }
			 else
			 {
			      $this->response->redirect($this->url->link('account/seller/pricing', '', 'SSL'));
			 }
		}

		if (isset($this->request->post['firstname'])) {
			$data['firstname'] = $this->request->post['firstname'];
		} else {
			$data['firstname'] = '';
		}

		if (isset($this->request->post['lastname'])) {
			$data['lastname'] = $this->request->post['lastname'];
		} else {
			$data['lastname'] = '';
		}

		if (isset($this->request->post['config_email'])) {
			$data['config_email'] = $this->request->post['config_email'];
		} else {
			$data['config_email'] = '';
		}

		if (isset($this->request->post['config_telephone'])) {
			$data['config_telephone'] = $this->request->post['config_telephone'];
		} else {
			$data['config_telephone'] = '';
		}		
		
		if (isset($this->request->post['config_address'])) {
			$data['config_address'] = $this->request->post['config_address'];
		} else {
			$data['config_address'] = '';
		}		

		if (isset($this->request->post['postcode'])) {
			$data['postcode'] = $this->request->post['postcode'];
		}else {
			$data['postcode'] = '';
		}		

		if (isset($this->request->post['config_country_id'])) {
			$data['config_country_id'] = $this->request->post['config_country_id'];
		} else {
			$data['config_country_id'] = $this->config->get('config_country_id');
		}

		if (isset($this->request->post['config_zone_id'])) {
			$data['config_zone_id'] = $this->request->post['config_zone_id'];
		} else {
			$data['config_zone_id'] = '';
		}

		$this->load->model('localisation/country');

		$data['countries'] = $this->model_localisation_country->getCountries();
		

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		if (isset($this->request->post['confirm'])) {
			$data['confirm'] = $this->request->post['confirm'];
		} else {
			$data['confirm'] = '';
		}

		if (isset($this->request->post['config_name'])) {
			$data['config_name'] = $this->request->post['config_name'];
		}else {
			$data['config_name'] = '';
		}

		if (isset($this->request->post['config_owner'])) {
			$data['config_owner'] = $this->request->post['config_owner'];
		}else {
			$data['config_owner'] = '';
		}
	

		if (isset($this->request->post['agree'])) {
			$data['agree'] = $this->request->post['agree'];
		} else {
			$data['agree'] = false;
		}
		
				
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = '';
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/seller.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/seller.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/seller.tpl', $data));
		}
	}



	public function pricing() {
		if ($this->customer->isLogged()) {
			$this->response->redirect($this->url->link('account/logout', '', 'SSL'));
		}

		$this->load->language('account/seller');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('account/seller');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {  
			$plan = $this->model_account_seller->getcurrentplan($_POST['plan_id']);
			$plan_amount = $plan[0]['plan_amount'];
			if($plan_amount == 0)
			{
				$store_id = $this->model_account_seller->addStore($this->request->post);
				$this->response->redirect($this->url->link('account/seller_success'));
			}
			else
			{
				$post = $this->request->post;
					$this->session->data['seller_register_details'] = $post;
					
					
						$this->response->redirect($this->url->link('account/seller/subscribe'));
				//$this->load->controller('account/seller/subscribe',$this->request->post);
			}
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/seller', '', 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_register'),
			'href' => $this->url->link('account/seller', '', 'SSL')
		);

		$data['heading_title'] = $this->language->get('heading_title');
		
		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}		

		//$data['action'] = $this->url->link('account/seller', '', 'SSL');
        $data['action'] = $this->url->link('account/seller', '', 'SSL');
		//$this->load->model('localisation/country');

		//$data['countries'] = $this->model_localisation_country->getCountries();
		$data['plans'] = array();
		$plans = $this->model_account_seller->getplandetails();
		foreach($plans as $plan){
			$data['plans'][] = array(
					'plan_id'     => $plan['plan_id'],
					'plan_name'   => $plan['plan_name'],
					'plan_amount'   => $plan['plan_amount'],
					'plan_days'   => $plan['plan_days'],
					'highlight' => $plan['highlight'],
					'description' => $plan['description']
				);
		}
	
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = '';
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/seller_pricing.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/seller_pricing.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/seller_pricing.tpl', $data));
		}
	}


	public function validate() {

		if (!$this->request->post['config_name']) {
			$this->error['name'] = $this->language->get('error_name');
		}
		if ((utf8_strlen($this->request->post['config_owner']) < 3) || (utf8_strlen($this->request->post['config_owner']) > 64)) {
			$this->error['owner'] = $this->language->get('error_owner');
		}
		
		if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}

		if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
			$this->error['lastname'] = $this->language->get('error_lastname');
		}

		if ((utf8_strlen($this->request->post['config_email']) > 96) || !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['config_email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ($this->model_account_seller->getTotalSellersByEmail($this->request->post['config_email'])) {
			$this->error['warning'] = $this->language->get('error_exists');
		}

		if ((utf8_strlen($this->request->post['config_telephone']) < 3) || (utf8_strlen($this->request->post['config_telephone']) > 32)) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}

		if ((utf8_strlen(trim($this->request->post['config_address'])) < 3) || (utf8_strlen(trim($this->request->post['config_address'])) > 126)) {
			$this->error['address'] = $this->language->get('error_address');
		}		

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->post['config_country_id']);

		if ($country_info && $country_info['postcode_required'] && (utf8_strlen(trim($this->request->post['postcode'])) < 2 || utf8_strlen(trim($this->request->post['postcode'])) > 10)) {
			$this->error['postcode'] = $this->language->get('error_postcode');
		}

		if ($this->request->post['config_country_id'] == '') {
			$this->error['country'] = $this->language->get('error_country');
		}
		if ($this->request->post['plan_id'] == '') {
			$this->error['plan'] = $this->language->get('error_plan');
		}
		

		if (!isset($this->request->post['config_zone_id']) || $this->request->post['config_zone_id'] == '') {
			$this->error['zone'] = $this->language->get('error_zone');
		}		

		

		if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
			$this->error['password'] = $this->language->get('error_password');
		}

		if ($this->request->post['confirm'] != $this->request->post['password']) {
			$this->error['confirm'] = $this->language->get('error_confirm');
		}

		// Agree to terms
		

		if (!isset($this->request->post['agree'])) {
			$this->error['warning'] = $this->language->get('error_agree');
		}
		

		return !$this->error;
	}
	
	public function subscribe()
	{
		$this->load->model('account/seller');
  		$value = $this->session->data['seller_register_details'];
		$data['custom'] =  substr($value['firstname']."$$".$value['lastname']."$$".$value['config_email']."$$".$value['password']."$$".$value['config_telephone']."$$".$value['config_name']."$$".$value['config_owner']."$$".$value['postcode']."$$".$value['plan_id']."$$".$value['config_country_id']."$$".$value['config_zone_id']."$$".$value['agree']."$$".$value['config_address'],0,255);
                $current_plan = $this->model_account_seller->getcurrentplan($value['plan_id']);
		$data['plan_name'] = $current_plan[0]['plan_name'];
		$data['plan_amount'] = round($this->currency->convert($current_plan[0]['plan_amount'], 'AED', 'USD'),2);
		$data['plan_days'] = $current_plan[0]['plan_days'];
		$data['merchant_paypal'] = $this->config->get('config_paypal_merchant');
		$data['notify_url'] = $this->url->link('account/login/ipn', '', 'SSL');
		$data['return_url'] = $this->url->link('account/seller_success');
		
		
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = '';
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header'); 
		$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/seller_subscribe.tpl',$data));
		
	}

	
}
