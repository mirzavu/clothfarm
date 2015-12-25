<?php
class ControllerModuleSmsbump extends Controller {
	private $data = array();

    public function index() { 
		
        $this->load->language('module/smsbump');
		
        $this->load->model('module/smsbump');
        $this->load->model('setting/store');
        $this->load->model('localisation/language');
        $this->load->model('design/layout');
		$this->load->model('tool/image');
		$this->load->model('setting/setting');
		
        $catalogURL = $this->getCatalogURL();
		$this->data['catalogURL'] = $catalogURL;
		
        $this->document->addStyle('view/stylesheet/smsbump/smsbump.css');
		$this->document->addScript('view/javascript/smsbump/smsbump.js');
		$this->document->addStyle('view/javascript/smsbump/jquery/css/ui-lightness/jquery-ui.min.css');
		$this->document->addScript('view/javascript/smsbump/jquery/js/jquery-ui.min.js');
		$this->document->addScript('view/javascript/smsbump/charactercounter.js');

	    $this->document->setTitle($this->language->get('heading_title'));

        if(!isset($this->request->get['store_id'])) {
           $this->request->get['store_id'] = 0; 
        }
	
        $store = $this->getCurrentStore($this->request->get['store_id']);
		
        if (($this->request->server['REQUEST_METHOD'] == 'POST')) { 	
            if (!$this->user->hasPermission('modify', 'module/smsbump')) {
				$this->error['warning'] = $this->language->get('error_permission');
            }

            if (!empty($_POST['OaXRyb1BhY2sgLSBDb21'])) {
                $this->request->post['SMSBump']['LicensedOn'] = $_POST['OaXRyb1BhY2sgLSBDb21'];
            }

            if (!empty($_POST['cHRpbWl6YXRpb24ef4fe'])) {
                $this->request->post['SMSBump']['License'] = json_decode(base64_decode($_POST['cHRpbWl6YXRpb24ef4fe']), true);
            }

            if (!$this->user->hasPermission('modify', 'module/smsbump')) {
				$this->session->data['error'] = 'You do not have permissions to edit this module!';	
			} else {
				$this->model_setting_setting->editSetting('SMSBump', $this->request->post, $this->request->post['store_id']);
				$this->session->data['success'] = $this->language->get('text_success');	
			}
            $this->response->redirect(HTTP_SERVER.'index.php?route=module/smsbump&store_id='.$this->request->post['store_id'] . '&token=' . $this->session->data['token']);
        }
		
		$this->data['image'] = 'no_image.jpg';
		$this->data['thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);

 		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		$this->load->model('localisation/order_status');
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

        $this->data['breadcrumbs']   = array();
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
        );
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
        );
        $this->data['breadcrumbs'][] = array(
            'text' => $this->language->get('heading_title'),
            'href' => $this->url->link('module/smsbump', 'token=' . $this->session->data['token'], 'SSL'),
        );
		
        $languageVariables = array(
            'entry_code',
            'heading_title',
            'error_input_form',
            'entry_yes',
            'entry_no',
            'text_default',
            'text_enabled',
            'text_disabled',
            'text_text',
            'save_changes',
            'button_cancel',
            'text_settings',
            'button_add',
            'button_edit',            
            'button_remove',
            'text_special_duration'
          );
       
        foreach ($languageVariables as $languageVariable) {
            $this->data[$languageVariable] = $this->language->get($languageVariable);
        }
		
        $this->data['stores'] = array_merge(array(0 => array('store_id' => '0', 'name' => $this->config->get('config_name') . ' ' . $this->data['text_default'], 'url' => HTTP_SERVER, 'ssl' => HTTPS_SERVER)), $this->model_setting_store->getStores());
        $this->data['error_warning']          = '';  
        $this->data['languages']              = $this->model_localisation_language->getLanguages();
        $this->data['store']                  = $store;
        $this->data['token']                  = $this->session->data['token'];
        $this->data['action']                 = $this->url->link('module/smsbump', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['saveApiKey']                  = $this->url->link('module/smsbump/saveApiKey', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['cancel']                 = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['data']                   = $this->model_setting_setting->getSetting('SMSBump', $store['store_id']);
        $this->data['catalog_url']            = $catalogURL;
	    

		
        if ( !isset($this->data['data']['SMSBump']['APIKey']) || (empty($this->data['data']['SMSBump']['APIKey'])) ) { 
            $this->data['error_warning'] = 'In order to use SMSBump you need to log into your profile!';
        }
        
		// SMS Bulk Start
		if(strcmp(VERSION,"2.1.0.1") < 0) {
			$this->load->model('sale/customer_group');
			$this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups(0);
			$this->data['customer_autocomplete_url'] = $this->url->link('sale/customer/autocomplete','','SSL');
		} else {
			$this->load->model('customer/customer_group');
			$this->data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups(0);
			$this->data['customer_autocomplete_url'] = $this->url->link('customer/customer/autocomplete','','SSL');
		}
		// SMS Bulk End

		if(!empty($_SERVER['HTTP_REFERER'])) {
			$referer = $_SERVER['HTTP_REFERER'];
			$url = parse_url($referer);
			
			if(!empty($url['host']) && strpos($url['host'],'paypal.com') !== false) {
				$this->data['success'] = 'The payment has been sent! You may need to wait several minutes for your account balance to be updated.';
			}
		}
		

        $this->data['header']  					 = $this->load->controller('common/header');
		$this->data['column_left']				= $this->load->controller('common/column_left');
		$this->data['footer']					 = $this->load->controller('common/footer');
        $this->response->setOutput($this->load->view('module/smsbump.tpl', $this->data));
    }


    public function saveApiKey() {
    	header("Content-Type: application/json", true);
    	if(isset($this->request->get['store_id']) && !empty($this->request->get['api_key'])) {
	    	$data = array(
	    		'store_id' => $this->request->get['store_id'],
	    		'SMSBump' => array (
	    			'APIKey' => $this->request->get['api_key']
	    		)
	    	);

	    	$this->load->model('setting/setting');
	    	$this->model_setting_setting->editSetting('SMSBump', $data, $data['store_id']);
	    	$result = array(
	    		'status' => 'success',
	    		'redirect_url' => HTTP_SERVER.'index.php?route=module/smsbump&store_id='.$data['store_id'] . '&token=' . $this->session->data['token']
	    	);

			$this->response->setOutput(json_encode($result));
    	} else {
    		$result = array(
	    		'status' => 'error'
	    	);
	    	$this->response->setOutput(json_encode($result));
    	} 
		
    }

    private function getCatalogURL() {
        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
            $storeURL = HTTPS_CATALOG;
        } else {
            $storeURL = HTTP_CATALOG;
        } 
        return $storeURL;
    }

    private function getServerURL() {
        if (isset($_SERVER['HTTPS']) && (($_SERVER['HTTPS'] == 'on') || ($_SERVER['HTTPS'] == '1'))) {
            $storeURL = HTTPS_SERVER;
        } else {
            $storeURL = HTTP_SERVER;
        } 
        return $storeURL;
    }

    private function getCurrentStore($store_id) {    
        if($store_id && $store_id != 0) {
            $store = $this->model_setting_store->getStore($store_id);
        } else {
            $store['store_id'] = 0;
            $store['name'] = $this->config->get('config_name');
            $store['url'] = $this->getCatalogURL(); 
        }
        return $store;
    }
    
    public function install() {
	    $this->load->model('module/smsbump');
	    $this->model_module_smsbump->install();
	    $this->load->model('extension/event');
    	$this->model_extension_event->addEvent('smsbump', 'post.order.add', 'module/smsbump/onCheckout');
    	$this->model_extension_event->addEvent('smsbump', 'post.order.history.add', 'module/smsbump/onHistoryChange');
    	$this->model_extension_event->addEvent('smsbump', 'post.customer.add', 'module/smsbump/onRegister');
    }

    
    public function uninstall() {
    	$this->load->model('setting/setting');
		
		$this->load->model('setting/store');
		$this->model_setting_setting->deleteSetting('smsbump_module',0);
		$stores=$this->model_setting_store->getStores();
		foreach ($stores as $store) {
			$this->model_setting_setting->deleteSetting('smsbump_module', $store['store_id']);
		}
        $this->load->model('module/smsbump');
        $this->model_module_smsbump->uninstall();
        $this->load->model('extension/event');
    	$this->model_extension_event->deleteEvent('smsbump');
    }
	
	public function send() {
		$json = array();
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if (!$this->user->hasPermission('modify', 'module/smsbump')) {
				$json['error']['warning'] = 'You do not have permission to perform this action!';
			}
			if (!$this->request->post['message']) {
				$json['error']['message'] = 'The message field should not be empty!';
			}
			if (!$json) {
				
				$this->load->model('setting/store');
				$store_info = $this->model_setting_store->getStore($this->request->post['store_id']);			
				if ($store_info) {
					$store_name = $store_info['name'];
				} else {
					$store_name = $this->config->get('config_name');
				}
				
				$this->load->model('module/smsbump');
				
				if (isset($this->request->get['page'])) {
					$page = $this->request->get['page'];
				} else {
					$page = 1;
				}
				
				$telephones_total = 0;
				$json['telephones'] = array();
				
				switch ($this->request->post['to']) {
					case 'telephones':
						$phones = isset($this->request->post['phones']) ? $this->request->post['phones'] : array();
						foreach ($phones as $result) {
							$sendCheck = $this->model_module_smsbump->sendCheck($result);
							if (is_numeric($result) && ($sendCheck))
								$json['telephones'][] = $this->model_module_smsbump->formatNumber($result);
						}
							break;
					case 'newsletter':
						$customer_data = array(
							'filter_newsletter' => 1,
							'start'             => ($page - 1) * 10
						);
						$telephones_total = $this->model_module_smsbump->getTotalCustomers($customer_data);
						$results = $this->model_module_smsbump->getCustomers($customer_data);
						foreach ($results as $result) {
							$sendCheck = $this->model_module_smsbump->sendCheck($result['telephone']);
							if ($sendCheck)
								$json['telephones'][] = $this->model_module_smsbump->formatNumber($result['telephone']);
						}
						break;
					case 'customer_all':
						$customer_data = array(
							'start'  => ($page - 1) * 10
						);
						$telephones_total = $this->model_module_smsbump->getTotalCustomers($customer_data);
						$results = $this->model_module_smsbump->getCustomers($customer_data);
						foreach ($results as $result) {
							$sendCheck = $this->model_module_smsbump->sendCheck($result['telephone']);
							if ($sendCheck)
								$json['telephones'][] = $this->model_module_smsbump->formatNumber($result['telephone']);
						}						
						break;
					case 'customer_group':
						$customer_data = array(
							'filter_customer_group_id' => $this->request->post['customer_group_id'],
							'start'                    => ($page - 1) * 10
						);
						$telephones_total = $this->model_module_smsbump->getTotalCustomers($customer_data);
						$results = $this->model_module_smsbump->getCustomers($customer_data);
						foreach ($results as $result) {
							$sendCheck = $this->model_module_smsbump->sendCheck($result['telephone']);
							if ($sendCheck)
								$json['telephones'][] = $this->model_module_smsbump->formatNumber($result['telephone']);
						}						
						break;
					case 'customer':
						if (!empty($this->request->post['customer'])) {					
							foreach ($this->request->post['customer'] as $customer_id) {
								$customer_info = $this->model_module_smsbump->getCustomer($customer_id);
								if ($customer_info) {
									$sendCheck = $this->model_module_smsbump->sendCheck($customer_info['telephone']);
									if ($sendCheck)
										$json['telephones'][] = $this->model_module_smsbump->formatNumber($customer_info['telephone']);
								}
							}
						}
						break;	
					case 'affiliate_all':
						$affiliate_data = array(
							'start'  => ($page - 1) * 10
						);
						$telephones_total = $this->model_module_smsbump->getTotalAffiliates($affiliate_data);		
						$results = $this->model_module_smsbump->getAffiliates($affiliate_data);
						foreach ($results as $result) {
							$sendCheck = $this->model_module_smsbump->sendCheck($result['telephone']);
							if ($sendCheck)
								$json['telephones'][] = $this->model_module_smsbump->formatNumber($result['telephone']);
						}						
						break;	
					case 'affiliate':
						if (!empty($this->request->post['affiliate'])) {					
							foreach ($this->request->post['affiliate'] as $affiliate_id) {
								$affiliate_info = $this->model_module_smsbump->getAffiliate($affiliate_id);
								if ($affiliate_info) {
									$sendCheck = $this->model_module_smsbump->sendCheck($result['telephone']);
									if ($sendCheck)
										$json['telephones'][] = $this->model_module_smsbump->formatNumber($affiliate_info['telephone']);
								}
							}
						}
						break;											
					case 'product':
						if (isset($this->request->post['product'])) {
							$telephones_total = $this->model_module_smsbump->getTotalTelephonesByProductsOrdered($this->request->post['product']);	
							$results = $this->model_module_smsbump->getTelephonesByProductsOrdered($this->request->post['product'], ($page - 1) * 10, 10);
							foreach ($results as $result) {
								$sendCheck = $this->model_module_smsbump->sendCheck($result['telephone']);
								if ($sendCheck)
									$json['telephones'][] = $this->model_module_smsbump->formatNumber($result['telephone']);
							}
						}
						break;												
				}
				
				$json['telephonesTotal'] = $telephones_total;
				
				if ($json['telephones']) {
						$json['success'] = $this->language->get('text_success');
				}
			}
		}
		$this->response->setOutput(json_encode($json));	
	}
}
?>