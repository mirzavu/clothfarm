<?php
class ControllerMerchantForgotten extends Controller {
	private $error = array();

	public function index() {
		if ($this->merchant->isLogged() && isset($this->request->get['token']) && ($this->request->get['token'] == $this->session->data['mtoken'])) {
			$this->response->redirect($this->url->link('merchant/dashboard', '', 'SSL'));
		}

		if (!$this->config->get('config_password')) {
			$this->response->redirect($this->url->link('merchant/login', '', 'SSL'));
		}

		$this->load->language('merchant/forgotten');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('user/user');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->load->language('mail/forgotten');

			$code = sha1(uniqid(mt_rand(), true));

			$this->model_user_user->editCode($this->request->post['email'], $code);

			$subject = sprintf($this->language->get('text_subject'), $this->config->get('config_name'));

			$message  = sprintf($this->language->get('text_greeting'), $this->config->get('config_name')) . "\n\n";
			$message .= $this->language->get('text_change') . "\n\n";
			$message .= $this->url->link('merchant/reset', 'code=' . $code, 'SSL') . "\n\n";
			$message .= sprintf($this->language->get('text_ip'), $this->request->server['REMOTE_ADDR']) . "\n\n";

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_host');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');
			$mail->setTo($this->request->post['email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender($this->config->get('config_name'));
			$mail->setSubject($subject);
			$mail->setText($message);		
			$mail->send();

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('merchant/login', '', 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_your_email'] = $this->language->get('text_your_email');
		$data['text_email'] = $this->language->get('text_email');

		$data['entry_email'] = $this->language->get('entry_email');

		$data['button_reset'] = $this->language->get('button_reset');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('merchant/dashboard', '', 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('merchant/forgotten', 'token=' . '', 'SSL')
		);
		
		$data['action'] = $this->url->link('merchant/forgotten', '', 'SSL');

		$data['cancel'] = $this->url->link('merchant/login', '', 'SSL');

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = '';
		}

		$data['header'] = $this->load->controller('merchant/header');
		$data['footer'] = $this->load->controller('merchant/footer');

		$this->response->setOutput($this->load->view('merchant/forgotten.tpl', $data));
	}

	protected function validate() {
		if (!isset($this->request->post['email'])) {
			$this->error['warning'] = $this->language->get('error_email');
		} elseif (!$this->model_user_user->getTotalUsersByEmail($this->request->post['email'])) {
			$this->error['warning'] = $this->language->get('error_email');
		}

		return !$this->error;
	}
}
