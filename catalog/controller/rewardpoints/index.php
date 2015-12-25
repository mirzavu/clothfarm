<?php

	/**
	 * Created by PhpStorm.
	 * User: Applehouse
	 * Date: 10/5/14
	 * Time: 8:08 PM
	 */
	class ControllerRewardPointsIndex extends Controller
	{
		CONST DISABLED = "0";
		CONST ENABLED  = "1";
		public function loadBlockRewardPoints()
		{
			if($this->config->get('rwp_enabled_module') == self::DISABLED)
			{
				return false;
			}
			$this->language->load('rewardpoints/index');
			$this->load->model('rewardpoints/spendingrule');
			$this->load->model('rewardpoints/shoppingcartrule');
			$this->load->model('rewardpoints/catalogrule');
			$this->model_rewardpoints_spendingrule->getSpendingPoints();
			$this->model_rewardpoints_shoppingcartrule->getShoppingCartPoints();
            $data['language'] = $this->language;
            $data['url']      = $this->url;
            $data['customer'] = $this->customer;
            $data['config']   = $this->config;

			$customer_reward_points = $this->customer->getRewardPoints();

			$data['max_redeem_point'] = 0;
			if ($customer_reward_points > 0) {
				$data['max_redeem_point'] = $this->session->data['max_redeem_point'];
			}

			$exchange_rate = explode("/", $this->config->get('currency_exchange_rate'));

			$html_awarded        = "";
			$total_reward_points = 0;

			foreach ($this->cart->getProducts() as $product) {
				$original_reward_point = $this->model_rewardpoints_catalogrule->getPoints($product['product_id']);
				if($original_reward_point > 0)
				{
					$reward_point          = $product['quantity'] * $original_reward_point;
					$total_reward_points += (int)$reward_point;
					$html_awarded .= "<li>" . $product['quantity'] . " x ".number_format($original_reward_point)." " . $this->config->get('text_points_'.$this->language->get('code')) . " ".$this->language->get('entry_for_product').": <b>" . $product['name'] . "</b></li>";
				}
			}
			if(isset($this->session->data['shopping_cart_point']) && count($this->session->data['shopping_cart_point']) > 0)
			{
				foreach($this->session->data['shopping_cart_point'] as $rule_id => $cart_point)
				{
					$rule = $this->model_rewardpoints_shoppingcartrule->getRule($rule_id);
					$total_reward_points += (int)$cart_point;
					$html_awarded .= "<li>".number_format($cart_point)." " . $this->config->get('text_points') . " (<b>" . $rule['name'] . "</b>)</li>";
				}
			}

			$data['html_awarded']           = $html_awarded;
			$data['total_reward_points']    = $total_reward_points;
			$data['customer_reward_points'] = number_format($customer_reward_points);

			$this->session->data['html_awarded']        = $html_awarded;
			$this->session->data['total_reward_points'] = $total_reward_points;
			$data['exchange_rate']          = array(
				'point' => $exchange_rate[0],
				'rate'  => $this->currency->format($exchange_rate[1], $this->currency->getCode()),
			);

			$data_rule_slider = array();
			if ($data['max_redeem_point'] > 10) {
				$step_rule = round($data['max_redeem_point'] / 10);
				for ($i = $step_rule; $i <= $data['max_redeem_point']; $i += $step_rule) {
					$data_rule_slider[] = $i;
				}
			}

			$points_to_checkout = (isset($this->session->data['points_to_checkout'])) ? $this->session->data['points_to_checkout'] : 0;
			if($points_to_checkout > $data['max_redeem_point'])
			{
				$points_to_checkout = 0;
				$this->session->data['points_to_checkout'] = 0;
			}

			$data_slider = array(
				'start'       => (int)$points_to_checkout,
				'step'        => 1,
				'min'         => 0,
				'max'         => (int)$data['max_redeem_point'],
				'rule_slider' => $data_rule_slider
			);

			$html_block = $this->load->view('default/template/rewardpoints/checkout/block_rewardpoints.tpl', $data);

			$this->load->model('rewardpoints/helper');

			$data['totals']   =   array();
            $total_data   =   $this->model_rewardpoints_helper->collectTotal();

            foreach ($total_data as $total) {
                if($total['code'] == 'earn_point' || $total['code'] == 'redeem_point'){
                    $data['totals'][] = array(
                        'title' => $total['title'],
                        'text'  => $total['text']
                    );
                }else{
                    $data['totals'][] = array(
                        'title' => $total['title'],
                        'text'  => $this->currency->format($total['value'])
                    );
                }
            }
			$html_cart_total = $this->load->view('default/template/rewardpoints/checkout/cart_total.tpl', $data);

			echo json_encode(array(
				'html_block'      => $html_block,
				'html_cart_total' => $html_cart_total,
				'data_slider'     => $data_slider
			));
		}

		public function updateRedeemPoint()
		{
			if($this->config->get('rwp_enabled_module') == self::DISABLED)
			{
				return false;
			}
			$this->load->model('rewardpoints/helper');

			$this->model_rewardpoints_helper->setPointsToCheckout($this->request->post['reward_point']);

            $data['totals']   =   array();
            $total_data   =   $this->model_rewardpoints_helper->collectTotal();

            foreach ($total_data as $total) {
                if($total['code'] == 'earn_point' || $total['code'] == 'redeem_point'){
                    $data['totals'][] = array(
                        'title' => $total['title'],
                        'text'  => $total['text']
                    );
                }else{
                    $data['totals'][] = array(
                        'title' => $total['title'],
                        'text'  => $this->currency->format($total['value'])
                    );
                }
            }

			echo json_encode(array(
				'html'        => $this->load->view('default/template/rewardpoints/checkout/cart_total.tpl', $data)
			));
		}

		public function getBlockRewardPointsDiscount()
		{
			if($this->config->get('rwp_enabled_module') == self::DISABLED)
			{
				return false;
			}

            $data['language'] = $this->language;
            $data['url']      = $this->url;
            $data['customer'] = $this->customer;
            $data['config']   = $this->config;
            $data['session']  = $this->session;

			$this->language->load('rewardpoints/index');
			$this->load->model('rewardpoints/spendingrule');
			$this->model_rewardpoints_spendingrule->getSpendingPoints();
			$data['max_redeem_point'] = $this->session->data['max_redeem_point'];

			$data_rule_slider = array();
			if ($data['max_redeem_point'] > 10) {
				$step_rule = round($data['max_redeem_point'] / 10);
				for ($i = $step_rule; $i <= $data['max_redeem_point']; $i += $step_rule) {
					$data_rule_slider[] = $i;
				}
			}

			$points_to_checkout = (isset($this->session->data['points_to_checkout'])) ? $this->session->data['points_to_checkout'] : 0;

			$data_slider = array(
				'start'       => $points_to_checkout,
				'step'        => 1,
				'min'         => 0,
				'max'         => (int)$data['max_redeem_point'],
				'rule_slider' => $data_rule_slider
			);

			$html_block = $this->load->view('default/template/rewardpoints/checkout/order/block_rewardpoints.tpl', $data);

			echo json_encode(array(
				'html'        => $html_block,
				'data_slider' => $data_slider
			));
		}

		public function quickUpdatePaymentMethod()
		{
			if (!isset($this->request->post['payment_method'])) {
				return;
			} elseif (!isset($this->session->data['payment_methods'][$this->request->post['payment_method']])) {
				return;
			}

			$this->session->data['payment_method'] = $this->session->data['payment_methods'][$this->request->post['payment_method']];
		}
	}