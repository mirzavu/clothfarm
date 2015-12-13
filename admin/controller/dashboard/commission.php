<?php
class ControllerDashboardCommission extends Controller {
	public function index() {
		$this->load->language('dashboard/commission');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['token'];

		$this->load->model('funds/sales_commission');	
		$site_commissions = 0;	

		$commission = $this->model_funds_sales_commission->getSalesCommission();
		foreach ($commission as $result) {
			$overall_total = ($result['total'] - $result['refund'] - $result['dispute']);
			$site_earnings =  $overall_total * $result['commission'] / 100; 			
			$site_commissions += $site_earnings;						
		} 

		$commission_total = $site_commissions;
		if ($commission_total > 1000000000000) {
			$data['total'] = round($commission_total / 1000000000000, 1) . 'T';
		} elseif ($commission_total > 1000000000) {
			$data['total'] = round($commission_total / 1000000000, 1) . 'B';
		} elseif ($commission_total > 1000000) {
			$data['total'] = round($commission_total / 1000000, 1) . 'M';
		} elseif ($commission_total > 1000) {
			$data['total'] = round($commission_total / 1000, 1) . 'K';
		} else {
			$data['total'] = round($commission_total);
		}

		$data['commission'] = $this->url->link('funds/sales_commission', 'token=' . $this->session->data['token'], 'SSL');

		return $this->load->view('dashboard/commission.tpl', $data);
	}
}
