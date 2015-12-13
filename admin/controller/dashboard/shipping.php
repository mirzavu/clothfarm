<?php
class ControllerDashboardShipping extends Controller {
	public function index() {
		$this->load->language('dashboard/shipping');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['token'];

		// Total Shipping
		
		$this->load->model('extension/extension');

		$extensions = $this->model_extension_extension->getInstalled('shipping'); 

		foreach ($extensions as $key => $value) {
			if (!file_exists(DIR_APPLICATION . 'controller/shipping/' . $value . '.php')) {
				$this->model_extension_extension->uninstall('shipping', $value);

				unset($extensions[$key]);
			}
		}

		$data['extensions'] = array();

		$files = glob(DIR_APPLICATION . 'controller/shipping/*.php');

		if ($files) {
			foreach ($files as $file) {
				$extension = basename($file, '.php');

				$this->load->language('shipping/' . $extension);

				$data['extensions'][] = array(
					'name'       => $this->language->get('heading_title')
				);
			}
		}
		
		$data['total'] = count($data['extensions']);		

		$data['shipping'] = $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL');

		return $this->load->view('dashboard/shipping.tpl', $data);
	}
}
