<?php
class ControllerDashboardDebit extends Controller {
	public function index() {
		$this->load->language('dashboard/debit');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['token'];

		$this->load->model('funds/vendor_payment');		

		$debit_total = $this->model_funds_vendor_payment->getTotalDebits(array('return' => 1));

		if ($debit_total > 1000000000000) {
			$data['total'] = round($debit_total / 1000000000000, 1) . 'T';
		} elseif ($debit_total > 1000000000) {
			$data['total'] = round($debit_total / 1000000000, 1) . 'B';
		} elseif ($debit_total > 1000000) {
			$data['total'] = round($debit_total / 1000000, 1) . 'M';
		} elseif ($debit_total > 1000) {
			$data['total'] = round($debit_total / 1000, 1) . 'K';
		} else {
			$data['total'] = round($debit_total);
		}

		$data['debit'] = $this->url->link('funds/vendor_payment/debits', 'token=' . $this->session->data['token'], 'SSL');

		return $this->load->view('dashboard/debit.tpl', $data);
	}
}
