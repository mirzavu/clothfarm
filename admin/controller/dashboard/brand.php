<?php
class ControllerDashboardBrand extends Controller {
	public function index() {
		$this->load->language('dashboard/brand');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['token'];

		// Total Vendors
		$this->load->model('catalog/manufacturer');

		$today = $this->model_catalog_manufacturer->getTotalManufacturers(array('filter_date_added' => date('Y-m-d', strtotime('-1 day'))));

		$yesterday = $this->model_catalog_manufacturer->getTotalManufacturers(array('filter_date_added' => date('Y-m-d', strtotime('-2 day'))));

		$difference = $today - $yesterday;

		if ($difference && $today) {
			$data['percentage'] = round(($difference / $today) * 100);
		} else {
			$data['percentage'] = 0;
		}

		$brand_total = $this->model_catalog_manufacturer->getTotalManufacturers();

		if ($brand_total > 1000000000000) {
			$data['total'] = round($brand_total / 1000000000000, 1) . 'T';
		} elseif ($brand_total > 1000000000) {
			$data['total'] = round($brand_total / 1000000000, 1) . 'B';
		} elseif ($brand_total > 1000000) {
			$data['total'] = round($brand_total / 1000000, 1) . 'M';
		} elseif ($brand_total > 1000) {
			$data['total'] = round($brand_total / 1000, 1) . 'K';
		} else {
			$data['total'] = $brand_total;
		}

		$data['brand'] = $this->url->link('catalog/manufacturer', 'token=' . $this->session->data['token'], 'SSL');

		return $this->load->view('dashboard/brand.tpl', $data);
	}
}
