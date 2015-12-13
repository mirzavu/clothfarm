<?php
class ControllerDashboardOrderByStatus extends Controller {
	public function index() {
		$this->load->language('dashboard/order_by_status');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_day'] = $this->language->get('text_day');
		$data['text_week'] = $this->language->get('text_week');
		$data['text_month'] = $this->language->get('text_month');
		$data['text_year'] = $this->language->get('text_year');
		$data['text_view'] = $this->language->get('text_view');
		$data['text_sub_title'] = $this->language->get('text_sub_title_year');
		$data['text_y_axis'] = $this->language->get('text_y_axis');

		$data['token'] = $this->session->data['token'];

		return $this->load->view('dashboard/order_by_status.tpl', $data);
	}

	public function getSalesOrderByStatus() {
		$this->load->language('dashboard/order_by_status');
		
		$json = array();
		
		$this->load->model('sale/order');

		$json['OrderByStatus'] = array();							

		if (isset($this->request->get['range'])) {
			$range = $this->request->get['range'];
		} else {
			$range = 'year';
		}

		switch ($range) {
			default:
			case 'day':

				$results = $this->model_sale_order->getTotalOrdersByStatus(1);
				if(count($results) > 0){			
				foreach ($results as $result) {					
					$push[$result['name']] = $result['total'];
						
				}
				foreach($push as $key => $value) 		
				{
					$json['OrderByStatus'][]=	array($key,$value);
				}
				}					
				break;
			case 'week':

				$results = $this->model_sale_order->getTotalOrdersByStatus(2);
				if(count($results) > 0){			
				foreach ($results as $result) {					
					$push[$result['name']] = $result['total'];
						
				}
				foreach($push as $key => $value) 		
				{
					$json['OrderByStatus'][]=	array($key,$value);
				}
				}		
				break;
			case 'month':

				$results = $this->model_sale_order->getTotalOrdersByStatus(3);
				if(count($results) > 0){			
				foreach ($results as $result) {					
					$push[$result['name']] = $result['total'];
						
				}
				foreach($push as $key => $value) 		
				{
					$json['OrderByStatus'][]=	array($key,$value);
				}
				}											
				break;
			case 'year':
				
				$results = $this->model_sale_order->getTotalOrdersByStatus(4);
				if(count($results) > 0){			
				foreach ($results as $result) {					
					$push[$result['name']] = $result['total'];
						
				}
				foreach($push as $key => $value) 		
				{
					$json['OrderByStatus'][]=	array($key,$value);
				}
				}
				break;
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json,JSON_NUMERIC_CHECK));
	}
}
