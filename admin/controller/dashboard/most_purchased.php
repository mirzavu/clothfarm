<?php
class ControllerDashboardMostPurchased extends Controller {
	public function index() {
		$this->load->language('dashboard/most_purchased');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['column_product'] = $this->language->get('column_product');
		$data['column_model'] = $this->language->get('column_model');
		$data['column_quantity'] = $this->language->get('column_quantity');
		$data['column_total'] = $this->language->get('column_total');

		$data['token'] = $this->session->data['token'];

		$data['most_purchased'] = array();

		$this->load->model('report/most_purchased');
		
		$limit = array("start" => 0, "limit" => 5);

		$results = $this->model_report_most_purchased->getPurchased($limit);
		
		foreach($results as $most_purchased){
			$data['most_purchased'][] = array(
				
							"product" => ucfirst($most_purchased['name']),
							"model" => $most_purchased['model'], 				
							"quantity" => $most_purchased['quantity'],
							"total" =>  $this->currency->format($most_purchased['total'], $this->config->get('config_currency'))		
						);
		}
		

		return $this->load->view('dashboard/most_purchased.tpl', $data);
	}
}
