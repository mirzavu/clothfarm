<?php
class ControllerDashboardVendor extends Controller {
	public function index() {
		$this->load->language('dashboard/vendor');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['token'];

		// Total Vendors
		$this->load->model('setting/store');

		$today = $this->model_setting_store->getTotalStores(array('filter_date_added' => date('Y-m-d', strtotime('-1 day'))));

		$yesterday = $this->model_setting_store->getTotalStores(array('filter_date_added' => date('Y-m-d', strtotime('-2 day'))));

		$difference = $today - $yesterday;

		if ($difference && $today) {
			$data['percentage'] = round(($difference / $today) * 100);
		} else {
			$data['percentage'] = 0;
		}

		$vendor_total = $this->model_setting_store->getTotalStores();

		if ($vendor_total > 1000000000000) {
			$data['total'] = round($vendor_total / 1000000000000, 1) . 'T';
		} elseif ($vendor_total > 1000000000) {
			$data['total'] = round($vendor_total / 1000000000, 1) . 'B';
		} elseif ($vendor_total > 1000000) {
			$data['total'] = round($vendor_total / 1000000, 1) . 'M';
		} elseif ($vendor_total > 1000) {
			$data['total'] = round($vendor_total / 1000, 1) . 'K';
		} else {
			$data['total'] = $vendor_total;
		}

		$data['vendor'] = $this->url->link('setting/store', 'token=' . $this->session->data['token'], 'SSL');

		return $this->load->view('dashboard/vendor.tpl', $data);
	}
}
