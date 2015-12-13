<?php
class ControllerMerchantLogin extends Controller {
	private $error = array();

	public function index() { 
		$this->load->language('merchant/login');

		$this->document->setTitle($this->language->get('heading_title'));
		
		if ($this->merchant->isLogged() && isset($this->request->get['token']) && ($this->request->get['token'] == $this->session->data['mtoken'])) { 
			$this->response->redirect($this->url->link('merchant/dashboard', 'token=' . $this->session->data['mtoken'], 'SSL'));
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->session->data['mtoken'] = md5(mt_rand()); 
			if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], HTTP_SERVER) === 0 || strpos($this->request->post['redirect'], HTTPS_SERVER) === 0 )) {
				$this->response->redirect($this->request->post['redirect'] . '&token=' . $this->session->data['mtoken']);
			} else {
				$this->response->redirect($this->url->link('merchant/dashboard', 'token=' . $this->session->data['mtoken'], 'SSL'));
			}
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_login'] = $this->language->get('text_login');
		$data['text_forgotten'] = $this->language->get('text_forgotten');

		$data['entry_username'] = $this->language->get('entry_username');
		$data['entry_password'] = $this->language->get('entry_password');

		$data['button_login'] = $this->language->get('button_login');

		if ((isset($this->session->data['mtoken']) && !isset($this->request->get['token'])) || ((isset($this->request->get['token']) && (isset($this->session->data['mtoken']) && ($this->request->get['token'] != $this->session->data['mtoken']))))) {
				$this->error['warning'] = $this->language->get('error_token');
			
		}

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

		$data['action'] = $this->url->link('merchant/login', '', 'SSL');

		if (isset($this->request->post['username'])) {
			$data['username'] = $this->request->post['username'];
		} else {
			$data['username'] = '';
		}

		if (isset($this->request->post['password'])) {
			$data['password'] = $this->request->post['password'];
		} else {
			$data['password'] = '';
		}

		if (isset($this->request->get['route'])) {
			$route = $this->request->get['route'];

			unset($this->request->get['route']);
			unset($this->request->get['token']);

			$url = '';

			if ($this->request->get) {
				$url .= http_build_query($this->request->get);
			}

			$data['redirect'] = $this->url->link($route, $url, 'SSL');
		} else {
			$data['redirect'] = '';
		}

		if ($this->config->get('config_password')) {
			$data['forgotten'] = $this->url->link('merchant/forgotten', '', 'SSL');
		} else {
			$data['forgotten'] = '';
		}

		$data['header'] = $this->load->controller('merchant/header');
		$data['footer'] = $this->load->controller('merchant/footer'); 

		$this->response->setOutput($this->load->view('merchant/login.tpl', $data));
	}

	protected function validate() {
		if (!isset($this->request->post['username']) || !isset($this->request->post['password']) || !$this->merchant->login($this->request->post['username'], $this->request->post['password'])) { 

			$vendor_info = $this->merchant->getVendorByEmail($this->request->post['username']);

			if ($vendor_info && !$vendor_info['status']) {
				$this->error['warning'] = $this->language->get('error_approved');
			}else{
				$this->error['warning'] = $this->language->get('error_login');
			}
		}				

		return !$this->error;
	}








	public function check() {
		$route = '';

		if (isset($this->request->get['route'])) {
			$part = explode('/', $this->request->get['route']);

			if (isset($part[0])) {
				$route .= $part[0];
			}

			if (isset($part[1])) {
				$route .= '/' . $part[1];
			}
		}

		$ignore = array(
			'merchant/login',
			'merchant/forgotten',
			'merchant/reset'
		);
			
		if (!$this->merchant->isLogged() && !in_array($route, $ignore)) { 
			return new Action('merchant/login');
		}

		if (isset($this->request->get['route'])) {
			$ignore = array(
				'merchant/login',
				'merchant/logout',
				'merchant/forgotten',
				'merchant/reset',
				'error/not_found',
				'error/permission'
			);

			$config_ignore = array();

			if ($this->config->get('config_token_ignore')) {
				$config_ignore = unserialize($this->config->get('config_token_ignore'));
			}

			$ignore = array_merge($ignore, $config_ignore);

			if (!in_array($route, $ignore) && (!isset($this->request->get['token']) || !isset($this->session->data['mtoken']) || ($this->request->get['token'] != $this->session->data['mtoken']))) {
				return new Action('merchant/login');
			}
		} else {
			if (!isset($this->request->get['token']) || !isset($this->session->data['mtoken']) || ($this->request->get['token'] != $this->session->data['mtoken'])) {
				return new Action('merchant/login');
			}
		}
	}
}
