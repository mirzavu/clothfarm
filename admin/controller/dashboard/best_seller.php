<?php
class ControllerDashboardBestSeller extends Controller {
	public function index() {
		$this->load->language('dashboard/best_seller');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['column_seller'] = $this->language->get('column_seller');
		$data['column_amount'] = $this->language->get('column_amount');
		$data['column_sold_products'] = $this->language->get('column_sold_products');

		$data['token'] = $this->session->data['token'];

		$data['best_sellers'] = array();

		$this->load->model('report/best_seller');

		$results = $this->model_report_best_seller->getBestSellers();
		
		foreach($results as $best_seller){
			$data['best_sellers'][] = array(
				
							"seller" => ucfirst($best_seller['store']),
							"amount" => $this->currency->format($best_seller['total'], $this->config->get('config_currency')), 				
							"sold" => $best_seller['sold']		
						);
		}
		

		return $this->load->view('dashboard/best_seller.tpl', $data);
	}
}
