<?php
class ControllerDashboardReturn extends Controller {
	public function index() {
		$this->load->language('dashboard/return');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['token'];

		// Total Returns
		$this->load->model('sale/return');

		$today = $this->model_sale_return->getTotalReturns(array('filter_date_added' => date('Y-m-d', strtotime('-1 day'))));

		$yesterday = $this->model_sale_return->getTotalReturns(array('filter_date_added' => date('Y-m-d', strtotime('-2 day'))));

		$difference = $today - $yesterday;

		if ($difference && $today) {
			$data['percentage'] = round(($difference / $today) * 100);
		} else {
			$data['percentage'] = 0;
		}

		$return_total = $this->model_sale_return->getTotalReturns();

		if ($return_total > 1000000000000) {
			$data['total'] = round($return_total / 1000000000000, 1) . 'T';
		} elseif ($return_total > 1000000000) {
			$data['total'] = round($return_total / 1000000000, 1) . 'B';
		} elseif ($return_total > 1000000) {
			$data['total'] = round($return_total / 1000000, 1) . 'M';
		} elseif ($return_total > 1000) {
			$data['total'] = round($return_total / 1000, 1) . 'K';
		} else {
			$data['total'] = $return_total;
		}

		$data['return'] = $this->url->link('sale/return', 'token=' . $this->session->data['token'], 'SSL');

		return $this->load->view('dashboard/return.tpl', $data);
	}
}
