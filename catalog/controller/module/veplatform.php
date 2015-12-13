<?php
class ControllerModuleVePlatform extends Controller {
	public function index($setting) {

	    $position = array_key_exists('position', $setting)? $setting['position'] : null;
	    if ($position === null) {
	        return false;
	    }
	    $success = (array_key_exists('route', $this->request->get) && $this->request->get['route'] == 'checkout/success');
	    if (($success === true && $position == 'content_bottom') || ($success === false && $position == 'column_left')) {
	        return false;
	    }

	    $this->load->model('veplatform/veplatformcatalog');
	    $template = ($success === true)? 'veplatform_pixel' : 'veplatform_tag';

	    $data = array();
	    $data['ve_tag'] = $this->model_veplatform_veplatformcatalog->api->getConfigOption('tag');
	    $data['ve_pixel'] = $this->model_veplatform_veplatformcatalog->api->getConfigOption('pixel');

		$template = 'default/template/module/' . $template . '.tpl';
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/' . $template . '.tpl')) {
			$template = $this->config->get('config_template') . '/template/module/' . $template . '.tpl';
		}

		return $this->load->view($template, $data);
	}
}