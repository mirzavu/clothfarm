<?php
class ControllerDashboardMostViewed extends Controller {
	public function index() {
		$this->load->language('dashboard/most_viewed');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['column_product'] = $this->language->get('column_product');
		$data['column_model'] = $this->language->get('column_model');
		$data['column_views'] = $this->language->get('column_views');

		$data['token'] = $this->session->data['token'];

		$data['most_viewed'] = array();

		$this->load->model('report/product');
		
		$limit = array("start" => 0, "limit" => 5);

		$results = $this->model_report_product->getProductsViewed($limit);
		
		foreach($results as $most_viewed){
			$data['most_viewed'][] = array(
				
							"product" => ucfirst($most_viewed['name']),
							"model" => $most_viewed['model'], 				
							"views" => $most_viewed['viewed']		
						);
		}
		

		return $this->load->view('dashboard/most_viewed.tpl', $data);
	}
}
