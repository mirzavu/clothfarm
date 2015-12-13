<?php
class ControllerModuleVePlatform extends Controller {
	private $error = array();
	private $data = array();

	public function index() {

	    //Load veplatform language and set title of the document
	    $this->loadLanguageVariables();
		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->addStyle('../admin/view/stylesheet/veplatform.css');
		$this->document->addScript('../admin/view/javascript/veplatform.js');

		$showError = false;
		//Load setting and veplatform
		$this->load->model('setting/setting');
		$this->load->model('veplatform/veplatform');
		//If is not installed api, try again
		if ($this->model_veplatform_veplatform->api->isInstalled() === false) {
		    $showError = $this->install();
		}

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->session->data['success'] = $this->language->get('text_success');
			$activateProduct = $_POST['products'];
			$response = $this->model_veplatform_veplatform->api->activateProducts($activateProduct);
			if ($response === true) {
			    $this->session->data['thankyou'] = true;
                $this->response->redirect($this->url->link('module/veplatform', 'token=' . $this->session->data['token'], 'SSL'));
			}
			$showError = true;
		}

		$this->data['error_warning'] = '';
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		}

		//Create breadcrumb
		$this->data['breadcrumbs'] = array();
		$this->data['breadcrumbs'][] = array(
		    'text' => $this->language->get('text_home'),
		    'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);
		$this->data['breadcrumbs'][] = array(
		    'text' => $this->language->get('text_module'),
		    'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);
		$this->data['breadcrumbs'][] = array(
		    'text' => $this->language->get('heading_title'),
		    'href' => $this->url->link('module/veplatform', 'token=' . $this->session->data['token'], 'SSL')
		);

		$this->data['action'] = $this->url->link('module/veplatform', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['token'] = $this->session->data['token'];

		//Load layout
		$this->load->model('design/layout');
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		//Load language
		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		$this->data['veapi'] = $this->model_veplatform_veplatform->api;

		if ($showError) {
            $this->template = 'module/veplatformerror.tpl';
		} elseif (array_key_exists('thankyou', $this->session->data) && $this->session->data['thankyou'] === true) {
			$this->template = 'module/veplatformthankyou.tpl';
			$this->session->data['thankyou'] = false;
		} else {
			$this->template = 'module/veplatform.tpl';
		}

		$this->data['header'] = $this->load->controller('common/header');
		$this->data['column_left'] = $this->load->controller('common/column_left');
		$this->data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view($this->template, $this->data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/veplatform')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		return !$this->error;
	}

	public function install() {
		/** Create veplatform table in DB and insert some data **/
		$this->load->model('veplatform/veplatform');
		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('veplatform', array('veplatform_status' => '1'));
		$this->model_veplatform_veplatform->setModuleLayouts();
		return !$this->model_veplatform_veplatform->api->installModule();
	}

	public function uninstall() {
		/** Delete veplatform table in DB **/
		$this->load->model('veplatform/veplatform');
		$this->load->model('setting/setting');
		$this->model_veplatform_veplatform->api->uninstallModule();
		$this->model_setting_setting->deleteSetting('veplatform');
	}

	private function loadLanguageVariables()
	{
		$this->load->language('module/veplatform');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_go_to_products'] = $this->language->get('button_go_to_products');
		$this->data['VE_THANK_YOU_FOR_INSTALLING'] = $this->language->get('VE_THANK_YOU_FOR_INSTALLING');
		$this->data['VE_NOW_CHOOSE_APPLICATIONS'] = $this->language->get('VE_NOW_CHOOSE_APPLICATIONS');
		$this->data['VE_VEINTERACTIVE'] = $this->language->get('VE_VEINTERACTIVE');
		$this->data['VE_VEPLATFORM'] = $this->language->get('VE_VEPLATFORM');
		$this->data['VE_BY_INTEGRATING_VEPLATFORM'] = $this->language->get('VE_BY_INTEGRATING_VEPLATFORM');
		$this->data['VE_REDUCE_BOUNCE_RATE'] = $this->language->get('VE_REDUCE_BOUNCE_RATE');
		$this->data['VE_RECOVER_LOST_SALES'] = $this->language->get('VE_RECOVER_LOST_SALES');
		$this->data['VE_INCREASE_CONVERSION'] = $this->language->get('VE_INCREASE_CONVERSION');
		$this->data['VE_REACH_PROSPECTS'] = $this->language->get('VE_REACH_PROSPECTS');
		$this->data['VE_ACTIVATING_VE_APPS'] = $this->language->get('VE_ACTIVATING_VE_APPS');
		$this->data['VE_THANK_YOU_FOR_SELECTING_APP'] = $this->language->get('VE_THANK_YOU_FOR_SELECTING_APP');
		$this->data['VE_ACCOUNT_MANAGER_CONTACT'] = $this->language->get('VE_ACCOUNT_MANAGER_CONTACT');
		$this->data['VE_CREATIVE_EXAMPLES_APP'] = $this->language->get('VE_CREATIVE_EXAMPLES_APP');
		$this->data['VE_THANKS_LETTER'] = $this->language->get('VE_THANKS_LETTER');
		$this->data['VE_THANKS_PHONE_US'] = $this->language->get('VE_THANKS_PHONE_US');
		$this->data['VE_THANKS_PHONE_UK'] = $this->language->get('VE_THANKS_PHONE_UK');
		$this->data['VE_BEST_REGARDS'] = $this->language->get('VE_BEST_REGARDS');
		$this->data['VE_PLEASE_SELECT_APPS'] = $this->language->get('VE_PLEASE_SELECT_APPS');
		$this->data['VE_DYNAMIC_DISPLAY_ADVERTISING'] = $this->language->get('VE_DYNAMIC_DISPLAY_ADVERTISING');
		$this->data['VE_FIND_OUT_MORE'] = $this->language->get('VE_FIND_OUT_MORE');
		$this->data['VE_SEARCH_OPTIMIZATION'] = $this->language->get('VE_SEARCH_OPTIMIZATION');
		$this->data['VE_INCREASE_WEBSITE_CONVERSION'] = $this->language->get('VE_INCREASE_WEBSITE_CONVERSION');
		$this->data['VE_RECOVER_LOST_SHOPPING_CARTS'] = $this->language->get('VE_RECOVER_LOST_SHOPPING_CARTS');
		$this->data['VE_CLOSE_APP_DETAILS'] = $this->language->get('VE_CLOSE_APP_DETAILS');
		$this->data['VE_DESCRIPTION_VECHAT'] = $this->language->get('VE_DESCRIPTION_VECHAT');
		$this->data['VE_DESCRIPTION_VECONTACT'] = $this->language->get('VE_DESCRIPTION_VECONTACT');
		$this->data['VE_DESCRIPTION_VEASSIST'] = $this->language->get('VE_DESCRIPTION_VEASSIST');
		$this->data['VE_DESCRIPTION_VEADS'] = $this->language->get('VE_DESCRIPTION_VEADS');
		$this->data['VE_INFO_LEGAL_TEXT'] = $this->language->get('VE_INFO_LEGAL_TEXT');
		$this->data['VE_ALREADY_CLIENT'] = $this->language->get('VE_ALREADY_CLIENT');
		$this->data['VE_LOGIN'] = $this->language->get('VE_LOGIN');
		$this->data['VE_CONFIRM_SELECTION'] = $this->language->get('VE_CONFIRM_SELECTION');
		$this->data['VE_THANK_YOU_FOR_SELECTING'] = $this->language->get('VE_THANK_YOU_FOR_SELECTING');
		$this->data['VE_NEXT_STEPS'] = $this->language->get('VE_NEXT_STEPS');
		$this->data['VE_LINK'] = $this->language->get('VE_LINK');
		$this->data['VE_CONNECTION_ERROR_WITH_VEINTERACTIVE'] = $this->language->get('VE_CONNECTION_ERROR_WITH_VEINTERACTIVE');
		$this->data['VE_CONNECTION_ERROR_WITH_VEINTERACTIVE_1'] = $this->language->get('VE_CONNECTION_ERROR_WITH_VEINTERACTIVE_1');
		$this->data['VE_CONNECTION_ERROR_WITH_VEINTERACTIVE_2'] = $this->language->get('VE_CONNECTION_ERROR_WITH_VEINTERACTIVE_2');
		$this->data['VE_CONNECTION_ERROR_WITH_VEINTERACTIVE_DOUBT'] = $this->language->get('VE_CONNECTION_ERROR_WITH_VEINTERACTIVE_DOUBT');
		$this->data['VE_ERROR_INSTALLING_1'] = $this->language->get('VE_ERROR_INSTALLING_1');
		$this->data['VE_ERROR_INSTALLING_2'] = $this->language->get('VE_ERROR_INSTALLING_2');
		$this->data['VE_FOOTER_VEINTERACTIVE'] = $this->language->get('VE_FOOTER_VEINTERACTIVE');
		$this->data['VE_FOOTER_CONTACT'] = $this->language->get('VE_FOOTER_CONTACT');
		$this->data['VE_FOOTER_VEAPPS'] = $this->language->get('VE_FOOTER_VEAPPS');
		$this->data['VE_FOOTER_CREATIVES'] = $this->language->get('VE_FOOTER_CREATIVES');
		$this->data['VE_SETTING_REQUIRED'] = $this->language->get('VE_SETTING_REQUIRED');
		$this->data['VE_FOOTER_ALL_RIGHTS'] = $this->language->get('VE_FOOTER_ALL_RIGHTS');
		$this->data['VE_FOOTER_RESERVED'] = $this->language->get('VE_FOOTER_RESERVED');
	}
}