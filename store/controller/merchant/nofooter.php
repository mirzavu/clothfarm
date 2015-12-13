<?php
class ControllerMerchantNofooter extends Controller {
	public function index() {
		$this->load->language('merchant/footer');

		$data['text_footer'] = $this->language->get('text_footer');

		if ($this->merchant->isLogged() && isset($this->request->get['token']) && ($this->request->get['token'] == $this->session->data['mtoken'])) {
			$data['text_version'] = sprintf($this->language->get('text_version'), VERSION);
		} else {
			$data['text_version'] = '';
		}

		return $this->load->view('merchant/no_footer.tpl', $data);
	}
}
