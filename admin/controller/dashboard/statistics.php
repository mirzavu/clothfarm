<?php
class ControllerDashboardStatistics extends Controller {
	public function index() {
		$this->load->language('dashboard/transaction');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_day'] = $this->language->get('text_day');
		$data['text_week'] = $this->language->get('text_week');
		$data['text_month'] = $this->language->get('text_month');
		$data['text_year'] = $this->language->get('text_year');
		$data['text_view'] = $this->language->get('text_view');
		$data['text_sub_title'] = $this->language->get('text_sub_title_year');
		$data['text_y_axis'] = $this->language->get('text_y_axis');

		$data['token'] = $this->session->data['token'];

		return $this->load->view('dashboard/statistics.tpl', $data);
	}

	public function getSales() {
		$this->load->language('dashboard/transaction');
		
		$json = array();

		$this->load->model('report/sale');		

		$json['order'] = array();		
		$json['xaxis'] = array();

		$json['order']['name'] = $this->language->get('text_order');		
		$json['order']['data'] = array();		

		if (isset($this->request->get['range'])) {
			$range = $this->request->get['range'];
		} else {
			$range = 'year';
		}
		$subtitle = 'text_sub_title_'.$range; 
		$data['text_sub_title'] = $this->language->get($subtitle);

		switch ($range) {
			default:
			case 'day':
				$results = $this->model_report_sale->getTotalSalesByDay();

				foreach ($results as $key => $value) {
					$json['order']['data'][] = $value['total'];
				}				

				for ($i = 0; $i < 24; $i++) {
					$json['xaxis'][] = $i;
				}
				break;
			case 'week':
				$results = $this->model_report_sale->getTotalSalesByWeek();

				foreach ($results as $key => $value) {
					$json['order']['data'][] = $value['total'];
				}		

				$date_start = strtotime('-' . date('w') . ' days');

				for ($i = 0; $i < 7; $i++) {
					$date = date('Y-m-d', $date_start + ($i * 86400));

					$json['xaxis'][] = date('D', strtotime($date));
				}
				break;
			case 'month':
				$results = $this->model_report_sale->getTotalSalesByMonth();

				foreach ($results as $key => $value) {
					$json['order']['data'][] = $value['total'];
				}

				for ($i = 1; $i <= date('t'); $i++) {
					$date = date('Y') . '-' . date('m') . '-' . $i;

					$json['xaxis'][] = date('d', strtotime($date));
				}
				break;
			case 'year':
				$results = $this->model_report_sale->getTotalSalesByYear();

				foreach ($results as $key => $value) {
					$json['order']['data'][] = $value['total'];
				}				

				for ($i = 1; $i <= 12; $i++) {
					$json['xaxis'][] = date('M', mktime(0, 0, 0, $i));
				}
				break;
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json,JSON_NUMERIC_CHECK));
	}
}
