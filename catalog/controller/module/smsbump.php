<?php
class ControllerModuleSmsbump extends Controller {

	public function onCheckout($order_id) {
		$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($order_id);	

		$this->load->model('setting/setting');
		$this->load->model('module/smsbump');
		$SMSBump = $this->model_setting_setting->getSetting('SMSBump', $order_info['store_id']);		

		if(strcmp(VERSION,"2.1.0.1") < 0) {
			$this->load->library('smsbump');
		}
		
		//Send SMS to the customer
		if(isset($SMSBump) && ($SMSBump['SMSBump']['Enabled'] == 'yes') && (!empty($SMSBump['SMSBump']['APIKey'])) && ($SMSBump['SMSBump']['CustomerPlaceOrder']['Enabled'] == 'yes')) {
			if (!$order_info['order_status_id']) {

				if (!$order_info['order_status_id']) {
					if (!empty($order_info['telephone'])) {
						$phone = $order_info['telephone'];
					} else {
						$phone = '';
					}

					$language 		= $this->config->get('config_language_id');
					$original		= array("{OrderID}","{SiteName}","{CartTotal}");
					$replace		= array($order_id, $this->config->get('config_name'),$order_info['total']);

					$message = str_replace($original, $replace, $SMSBump['SMSBump']['CustomerPlaceOrderText'][$language]);

					$sendCheck = $this->model_module_smsbump->sendCheck($phone);

					if(isset($this->session->data['smsbump_lastorder'])) { 
						$datetime1 = strtotime($this->session->data["smsbump_lastorder"]['time']);
						$now = date('m/d/Y h:i:s a', time());
						$datetime2 = strtotime($now);
						$interval  = abs($datetime2 - $datetime1);			
					}


					if(empty($this->session->data['smsbump_lastorder'])) {
						$smsbumpLastOrderCheck = true;
					}
					else {
						if(($interval > 60) || ($order_info['total'] !== $this->session->data["smsbump_lastorder"]['price'])) {
							$smsbumpLastOrderCheck = true;
						} else {
							$smsbumpLastOrderCheck = false;			
						}
					}		

					if ($smsbumpLastOrderCheck && !empty($phone) && $sendCheck) {
						unset($this->session->data['smsbump_lastorder']);
						SmsBump::sendMessage(array(
							'APIKey' => $SMSBump['SMSBump']['APIKey'],
							'to' => $this->model_module_smsbump->formatNumber($phone),
							'from' => $SMSBump['SMSBump']['From'],
							'message' => $message,
							'callback' => array('ModelModuleSmsbump', 'SmsBumpCallback')
						));

						$this->session->data["smsbump_lastorder"]['price'] = $order_info['total'];
						$this->session->data["smsbump_lastorder"]['time'] = date('m/d/Y h:i:s a', time());
					}

				}
			}
		}

		//Send SMS to the admin
		if(isset($SMSBump) && ($SMSBump['SMSBump']['Enabled'] == 'yes') && (!empty($SMSBump['SMSBump']['APIKey'])) && ($SMSBump['SMSBump']['AdminPlaceOrder']['Enabled'] == 'yes')) {
			if (!$order_info['order_status_id']) {

				if (!$order_info['order_status_id']) {
					if (!empty($order_info['telephone'])) {
						$phone = $order_info['telephone'];
					} else {
						$phone = '';
					}

					$language 		= $this->config->get('config_language_id');
					$original		= array("{OrderID}","{SiteName}","{CartTotal}");
					$replace		= array($order_id, $this->config->get('config_name'),$order_info['total']);

					$message = str_replace($original, $replace, $SMSBump['SMSBump']['AdminPlaceOrderText']);

					
    				
					$adminNumbers = array_map('trim', explode(',', $SMSBump['SMSBump']['StoreOwnerPhoneNumber']));
					//file_put_contents('test.txt', var_dump($adminNumbers));exit
					foreach($adminNumbers as $phone) {
						$sendCheck = $this->model_module_smsbump->sendCheck($phone);
						if (!empty($phone) && $sendCheck) {
							SmsBump::sendMessage(array(
								'APIKey' => $SMSBump['SMSBump']['APIKey'],
								'to' => $this->model_module_smsbump->formatNumber($phone),
								'from' => $SMSBump['SMSBump']['From'],
								'message' => $message,
								'callback' => array('ModelModuleSmsbump', 'SmsBumpCallback')
							));
						}
					}

					

				}
			}
		}
		
    }

    public function onHistoryChange($order_id) {
    	//Send SMS when the status order is changed
    	$this->load->model('checkout/order');
		$order_info = $this->model_checkout_order->getOrder($order_id);	
		$this->load->model('setting/setting');
		$this->load->model('module/smsbump');
		$SMSBump = $this->model_setting_setting->getSetting('SMSBump', $order_info['store_id']);
		
		if(strcmp(VERSION,"2.1.0.1") < 0) {
			$this->load->library('smsbump');
		}

    	if(isset($SMSBump) && ($SMSBump['SMSBump']['Enabled'] == 'yes') && (!empty($SMSBump['SMSBump']['APIKey'])) && ($SMSBump['SMSBump']['OrderStatusChange']['Enabled'] == 'yes')) {

    		$result = $this->db->query("SELECT count(*) as counter FROM " . DB_PREFIX ."order_history WHERE order_id = ". $order_id);
			if ($order_info['order_status_id'] && $result->row['counter'] > 1 && (!empty($SMSBump['SMSBump']['OrderStatusChange']['OrderStatus']) && (in_array($order_info['order_status_id'], $SMSBump['SMSBump']['OrderStatusChange']['OrderStatus'])))) {
				if(isset($order_info['order_status']))
					$Status = $order_info['order_status'];
				else
					$Status = "";
					
				$language 		= $order_info['language_id'];
				$original		= array("{SiteName}","{OrderID}","{Status}");
				$replace		= array($this->config->get('config_name'), $order_id, $Status);

				$message = str_replace($original, $replace, $SMSBump['SMSBump']['OrderStatusChangeText'][$language]);
				$phone = $order_info['telephone'];
				
				$sendCheck = $this->model_module_smsbump->sendCheck($phone);

				if (!empty($phone) && $sendCheck) {
					SmsBump::sendMessage(array(
						'APIKey' => $SMSBump['SMSBump']['APIKey'],
						'to' => $this->model_module_smsbump->formatNumber($phone),
						'from' => $SMSBump['SMSBump']['From'],
						'message' => $message,
						'callback' => array('ModelModuleSmsbump', 'SmsBumpCallback')
					));
				}


			}

		}
    }

    public function onRegister($customer_id) {

		$this->load->model('setting/setting');
		$this->load->model('module/smsbump');
		$SMSBump = $this->model_setting_setting->getSetting('SMSBump', $this->config->get('store_id'));
		
		if(strcmp(VERSION,"2.1.0.1") < 0) {
			$this->load->library('smsbump');
		}
		//Send SMS to the admin when new user is registered
    	if(isset($SMSBump) && ($SMSBump['SMSBump']['Enabled'] == 'yes') && (!empty($SMSBump['SMSBump']['APIKey'])) && ($SMSBump['SMSBump']['AdminRegister']['Enabled'] == 'yes')) {
				$customer = $this->db->query("SELECT firstname,lastname,telephone FROM `" . DB_PREFIX ."customer` WHERE customer_id = ".(int)$customer_id);

				if ($customer->row) {
					$nameCustomer = $customer->row['firstname']." ".$customer->row['lastname'];
				} else {
					$nameCustomer = '';
				}
					
				$original		= array("{SiteName}","{CustomerName}");
				$replace		= array($this->config->get('config_name'), $nameCustomer);

				$message = str_replace($original, $replace, $SMSBump['SMSBump']['AdminRegisterText']);


				$phone = $SMSBump['SMSBump']['StoreOwnerPhoneNumber'];
				
				$sendCheck = $this->model_module_smsbump->sendCheck($phone);

				if (!empty($phone) && $sendCheck) {
					SmsBump::sendMessage(array(
						'APIKey' => $SMSBump['SMSBump']['APIKey'],
						'to' => $this->model_module_smsbump->formatNumber($phone),
						'from' => $SMSBump['SMSBump']['From'],
						'message' => $message,
						'callback' => array('ModelModuleSmsbump', 'SmsBumpCallback')
					));
				}
		}

		//Send SMS to the user when the registration is successful
		if(isset($SMSBump) && ($SMSBump['SMSBump']['Enabled'] == 'yes') && (!empty($SMSBump['SMSBump']['APIKey'])) && ($SMSBump['SMSBump']['CustomerRegister']['Enabled'] == 'yes')) {
			$customer = $this->db->query("SELECT firstname,lastname,telephone FROM `" . DB_PREFIX ."customer` WHERE customer_id = ".(int)$customer_id);

			if ($customer->row) {
				$phone = $customer->row['telephone'];
				$nameCustomer = $customer->row['firstname']." ".$customer->row['lastname'];
			} else {
				$phone = '';
				$nameCustomer = '';
			}					
			
			$language 		= $this->config->get('config_language_id');
			$original		= array("{StoreName}","{CustomerName}");
			$replace		= array($this->config->get('config_name'), $nameCustomer);
			
			$message = str_replace($original, $replace, $SMSBump['SMSBump']['CustomerRegisterText'][$language]);
			
			$sendCheck = $this->model_module_smsbump->sendCheck($phone);
			
			if (!empty($phone) && $sendCheck) {
				SmsBump::sendMessage(array(
					'APIKey' => $SMSBump['SMSBump']['APIKey'],
					'to' => $this->model_module_smsbump->formatNumber($phone),
					'from' => $SMSBump['SMSBump']['From'],
					'message' => $message,
					'callback' => array('ModelModuleSmsbump', 'SmsBumpCallback')
				));
			}
		}	


    }
}