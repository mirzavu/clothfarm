<?php
class ControllerMerchantLogout extends Controller {
	public function index() {
		$this->merchant->logout();

		unset($this->session->data['mtoken']);

		$this->response->redirect($this->url->link('merchant/login', '', 'SSL'));
	}
}
