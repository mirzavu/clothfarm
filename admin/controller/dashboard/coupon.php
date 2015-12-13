<?php
class ControllerDashboardCoupon extends Controller {
	public function index() {
		$this->load->language('dashboard/coupon');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['token'];

		// Total Coupons
		$this->load->model('marketing/coupon');

		$today = $this->model_marketing_coupon->getTotalCoupons(array('filter_date_added' => date('Y-m-d', strtotime('-1 day'))));

		$yesterday = $this->model_marketing_coupon->getTotalCoupons(array('filter_date_added' => date('Y-m-d', strtotime('-2 day'))));

		$difference = $today - $yesterday;

		if ($difference && $today) {
			$data['percentage'] = round(($difference / $today) * 100);
		} else {
			$data['percentage'] = 0;
		}

		$coupon_total = $this->model_marketing_coupon->getTotalCoupons();

		if ($coupon_total > 1000000000000) {
			$data['total'] = round($coupon_total / 1000000000000, 1) . 'T';
		} elseif ($coupon_total > 1000000000) {
			$data['total'] = round($coupon_total / 1000000000, 1) . 'B';
		} elseif ($coupon_total > 1000000) {
			$data['total'] = round($coupon_total / 1000000, 1) . 'M';
		} elseif ($coupon_total > 1000) {
			$data['total'] = round($coupon_total / 1000, 1) . 'K';
		} else {
			$data['total'] = $coupon_total;
		}

		$data['coupon'] = $this->url->link('marketing/coupon', 'token=' . $this->session->data['token'], 'SSL');

		return $this->load->view('dashboard/coupon.tpl', $data);
	}
}
