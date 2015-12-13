<?php
class ControllerDashboardProduct extends Controller {
	public function index() {
		$this->load->language('dashboard/product');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['mtoken'];

		// Total Orders
		$this->load->model('catalog/product');

		$today = $this->model_catalog_product->getTotalProducts(array('filter_date_added' => date('Y-m-d', strtotime('-1 day'))));

		$yesterday = $this->model_catalog_product->getTotalProducts(array('filter_date_added' => date('Y-m-d', strtotime('-2 day'))));

		$difference = $today - $yesterday;

		if ($difference && $today) {
			$data['percentage'] = round(($difference / $today) * 100);
		} else {
			$data['percentage'] = 0;
		}

		$product_total = $this->model_catalog_product->getTotalProducts();

		if ($product_total > 1000000000000) {
			$data['total'] = round($product_total / 1000000000000, 1) . 'T';
		} elseif ($product_total > 1000000000) {
			$data['total'] = round($product_total / 1000000000, 1) . 'B';
		} elseif ($product_total > 1000000) {
			$data['total'] = round($product_total / 1000000, 1) . 'M';
		} elseif ($product_total > 1000) {
			$data['total'] = round($product_total / 1000, 1) . 'K';
		} else {
			$data['total'] = $product_total;
		}

		$data['product'] = $this->url->link('catalog/product', 'token=' . $this->session->data['mtoken'], 'SSL');

		return $this->load->view('dashboard/product.tpl', $data);
	}
}
