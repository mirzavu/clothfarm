<?php
class ControllerMerchantColumnLeft extends Controller {
	public function index() {
		if (isset($this->request->get['token']) && isset($this->session->data['mtoken']) && ($this->request->get['token'] == $this->session->data['mtoken'])) {
			$data['profile'] = $this->load->controller('merchant/profile');
			$data['menu'] = $this->load->controller('merchant/menu');
			$data['stats'] = $this->load->controller('merchant/stats');

			return $this->load->view('merchant/column_left.tpl', $data);
		}
	}
}
