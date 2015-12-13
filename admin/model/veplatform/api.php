<?php
class ModelVePlatformAPI extends ModelVePlatformVePlatformAPI
{
	protected $requestEcommerce = 'OpenCart/';
    protected $model = null;

    public function __construct($model)
    {
        $this->model = $model;
        $this->model->load->model('setting/setting');
        parent::__construct();
    }

    protected function loadConfig()
    {
        $config = $this->getConfig();
        $this->config['tag'] = array_key_exists('ve_tag', $config)? $config['ve_tag'] : $this->config['tag'];
        $this->config['pixel'] = array_key_exists('ve_pixel', $config)? $config['ve_pixel'] : $this->config['pixel'];
        $this->config['token'] = array_key_exists('ve_token', $config)? $config['ve_token'] : $this->config['token'];
        $this->config['products'] = array_key_exists('ve_products', $config)? $config['ve_products'] : $this->config['products'];
    }

    protected function saveJourney($journey)
    {
        $config = array(
            've_tag' => $journey->URLTag,
            've_pixel' => $journey->URLPixel,
            've_token' => $journey->Token
        );
        $this->saveConfig($config);
        return true;
    }

    protected function saveProducts($products)
    {
        $config = $this->getConfig();
        $config['ve_products'] = $products;
        $this->saveConfig($config);
        return true;
    }

    protected function getConfig()
    {
        $config = $this->model->model_setting_setting->getSetting('veplatform_config');
        if (is_array($config) && array_key_exists('veplatform_config', $config)) {
            return $config['veplatform_config'];
        }
        return array();
    }

    protected function saveConfig($config)
    {
        $this->model->model_setting_setting->editSetting('veplatform_config', array('veplatform_config' => $config));
    }

    protected function deleteConfig()
    {
        $this->model->model_setting_setting->deleteSetting('veplatform_config');
    }

    protected function setParams()
    {
        $this->model->load->model('localisation/country');
        $country = $this->model->model_localisation_country->getCountry($this->model->config->get('config_country_id'));
        $domain = preg_replace('#^https?://#', '', defined('HTTP_CATALOG')? HTTP_CATALOG : '');
        $this->requestParams = array(
            'domain' => $domain,
            'language' => $this->model->config->get('config_admin_language'),
            'email' => $this->model->config->get('config_email'),
            'phone' => $this->model->config->get('config_telephone'),
            'merchant' => $this->model->config->get('config_name'),
            'country' => array_key_exists('iso_code_2', $country)? $country['iso_code_2'] : null,
            'currency' => $this->model->config->get('config_currency')
        );
    }
}
