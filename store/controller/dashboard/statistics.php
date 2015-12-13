<?php
class ControllerDashboardStatistics extends Controller {
	public function index() {
		$this->load->language('dashboard/statistics');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_day'] = $this->language->get('text_day');
		$data['text_week'] = $this->language->get('text_week');
		$data['text_month'] = $this->language->get('text_month');
		$data['text_year'] = $this->language->get('text_year');
		$data['text_view'] = $this->language->get('text_view');
		$data['text_sub_title'] = $this->language->get('text_sub_title_year');
		$data['text_y_axis'] = $this->language->get('text_y_axis');

		$data['token'] = $this->session->data['mtoken'];

		return $this->load->view('dashboard/statistics.tpl', $data);
	}

	public function getSales() {
		$this->load->language('dashboard/statistics');
		
		$json = array();
		
		$this->load->model('funds/sales_commission');

		$json['statistics'] = array();							

		if (isset($this->request->get['range'])) {
			$range = $this->request->get['range'];
		} else {
			$range = 'year';
		}

		switch ($range) {
			default:
			case 'day':
									
				break;
			case 'week':
						
				break;
			case 'month':
											
				break;
			case 'year':
				
				$results = $this->model_funds_sales_commission->getSalesCommission();				
				foreach ($results as $result) {
					$overall_total = ($result['total'] - $result['refund'] - $result['dispute']);
					$site_earnings =  $overall_total * $result['commission'] / 100; 
					$vendor_earnings = $overall_total - $site_earnings;
					$balance = $vendor_earnings - $result['paid'];
					$push = array(				
						$this->language->get('text_orders')         => $result['orders'],
						$this->language->get('text_total')          => $result['total'],
						$this->language->get('text_refund')         => $result['refund'],
						$this->language->get('text_dispute')        => $result['dispute'], 
						$this->language->get('text_vendor_earnings')=> $vendor_earnings,
						$this->language->get('text_paid')           => $result['paid'],
						$this->language->get('text_balance')        => $balance	
						);									
				}
				foreach($push as $key => $value) 		
				{
					$json['statistics'][]=	array($key,$value);
				}
				break;
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json,JSON_NUMERIC_CHECK));
	}
}
