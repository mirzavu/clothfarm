<?php
class ControllerDashboardRate extends Controller {
	public function index() {
		$this->load->language('dashboard/rate');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_day'] = $this->language->get('text_day');
		$data['text_week'] = $this->language->get('text_week');
		$data['text_month'] = $this->language->get('text_month');
		$data['text_year'] = $this->language->get('text_year');
		$data['text_view'] = $this->language->get('text_view');
		$data['text_sub_title'] = $this->language->get('text_sub_title_year');
		$data['text_y_axis'] = $this->language->get('text_y_axis');

		$data['token'] = $this->session->data['token'];

		return $this->load->view('dashboard/rate.tpl', $data);
	}

	public function getSalesCommission() {
		$this->load->language('dashboard/rate');
		
		$json = array();

		$this->load->model('report/sale');		
		$this->load->model('funds/vendor_payment');
		$this->load->model('funds/sales_commission');

		$json['sales'] = array();
		$json['debits'] = array();
		$json['commission'] = array();
		$json['rate'] = array();		
			

		if (isset($this->request->get['range'])) {
			$range = $this->request->get['range'];
		} else {
			$range = 'year';
		}
		$subtitle = 'text_sub_title_'.$range; 
		$data['text_sub_title'] = $this->language->get($subtitle);

		switch ($range) {
			default:
			
			case 'year':
				$sale_total = $this->model_report_sale->getTotalSales();
				$debit_total = $this->model_funds_vendor_payment->getTotalDebits(array('return' => 1));
				$site_commissions = 0;	

				$commission = $this->model_funds_sales_commission->getSalesCommission();
				foreach($commission as $result) {
					$overall_total = ($result['total'] - $result['refund'] - $result['dispute']);
					$site_earnings =  $overall_total * $result['commission'] / 100; 			
					$site_commissions += $site_earnings;						
				} 
				$commission_total = $site_commissions;
				$rate = round($commission_total / $sale_total * 100);
				$json['sales'] = array($this->language->get('text_sales'),$sale_total);
				$json['debits'] = array($this->language->get('text_commission'),$debit_total);
				$json['commission'] = array($this->language->get('text_refund'),$commission_total);
				$json['rate'] = array("Rate %" ,$rate);
				break;
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json,JSON_NUMERIC_CHECK));
	}
}
