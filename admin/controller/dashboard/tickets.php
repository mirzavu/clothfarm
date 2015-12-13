<?php
class ControllerDashboardTickets extends Controller {
	public function index() {
		$this->load->language('dashboard/tickets');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_view'] = $this->language->get('text_view');

		$data['token'] = $this->session->data['token'];

		// Total tickets

		$this->load->model('tickets/tickets');

		$today = $this->model_tickets_tickets->getTotalTickets(array('filter_date_added' => date('Y-m-d', strtotime('-1 day'))));

		$yesterday = $this->model_tickets_tickets->getTotalTickets(array('filter_date_added' => date('Y-m-d', strtotime('-2 day'))));

		$difference = $today - $yesterday;

		if ($difference && $today) {
			$data['percentage'] = round(($difference / $today) * 100);
		} else {
			$data['percentage'] = 0;
		}

		$tickets_total = $this->model_tickets_tickets->getTotalTickets();

		if ($tickets_total > 1000000000000) {
			$data['total'] = round($tickets_total / 1000000000000, 1) . 'T';
		} elseif ($tickets_total > 1000000000) {
			$data['total'] = round($tickets_total / 1000000000, 1) . 'B';
		} elseif ($tickets_total > 1000000) {
			$data['total'] = round($tickets_total / 1000000, 1) . 'M';
		} elseif ($tickets_total > 1000) {
			$data['total'] = round($tickets_total / 1000, 1) . 'K';
		} else {
			$data['total'] = $tickets_total;
		}

		$data['tickets'] = $this->url->link('tickets/tickets', 'token=' . $this->session->data['token'], 'SSL');

		return $this->load->view('dashboard/tickets.tpl', $data);
	}
}
