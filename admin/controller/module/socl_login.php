<?php

class ControllerModuleSoclLogin extends Controller
{
    private $error = array();
    
    public function install()
    {       
        // Create table socl network
        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "soclall_network` ( 
                            `network_code` char(10) NOT NULL,
                            `network_name` char(50) NOT NULL,
                            `logo` varchar(255) NOT NULL, 
                            PRIMARY KEY (`network_code`) 
                            )ENGINE=MyISAM DEFAULT CHARSET=utf8;");

        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "soclall_network` LIMIT 0,1");
        if ($query->num_rows) {
            $this->db->query("DELETE FROM `" . DB_PREFIX . "soclall_network`");
        }
        
        $this->db->query("INSERT INTO `" . DB_PREFIX . "soclall_network` VALUES 
                        ('facebook','Facebook','facebook.png'),
                        ('twitter','Twitter','twitter.png'),
                        ('google','Google Plus','google-plus.png'),
                        ('linkedin','LinkedIn','linkedin.png'),
                        ('live','Live','window-live.png'),
                        ('plurk','Plurk','plurk.png'),
                        ('tumblr','Tumblr','tumblr.png'),
                        ('mailru','Mail.ru','mail-ru.png'),
                        ('reddit','Reddit','regedit.png'),
                        ('lastfm','Last.fm','lastfm.png'),
                        ('vkontakte','Vkontakte','vk.png'),
                        ('disqus','Disqus','disqus.png'),
                        ('wordpress','Wordpress','wordpress.png'),
                        ('foursquare','Foursquare','foursquare.png'),
                        ('github','Github','github.png');");
                        
        // Create table soclall id
        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "soclall_id` ( 
                            `network_code` char(10) NOT NULL,
                            `customer_id` int(11) NOT NULL,
                            `socl_id` char(255) NOT NULL, 
                            PRIMARY KEY (`network_code`, `customer_id`) 
                            )ENGINE=MyISAM DEFAULT CHARSET=utf8;");
    }
    
    public function index() {
        $this->load->language('module/socl_login');
        
        $this->document->setTitle($this->language->get('heading_title'));
        
        $this->load->model('setting/setting');
        
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()){
            $this->model_setting_setting->editSetting('soclall', $this->request->post);
            
            $this->session->data['success'] = $this->language->get('text_success');
            
            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }
        
        $data['heading_title'] = $this->language->get('heading_title');
        $data['text_edit'] = $this->language->get('text_edit');
        
        $data['tab_common_settings'] = $this->language->get('tab_common_settings');
        $data['tab_api_settings'] = $this->language->get('tab_api_settings');
        $data['tab_manage_network'] = $this->language->get('tab_manage_network');
        
        $data['entry_app_id'] = $this->language->get('entry_app_id');
        $data['entry_secret_key'] = $this->language->get('entry_secret_key');
        $data['entry_user_required'] = $this->language->get('entry_user_required');
        $data['entry_customer_group'] = $this->language->get('entry_customer_group');
        
        $data['help_user_required'] = $this->language->get('help_user_required');
        $data['help_customer_group'] = $this->language->get('help_customer_group');
        $data['help_tab_manage_network'] = $this->language->get('help_tab_manage_network');
        
        $data['button_save_all'] = $this->language->get('button_save_all');
		$data['button_cancel'] = $this->language->get('button_cancel');
        
        if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
        
        $data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),      		
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/socl_login', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
        
        $data['action'] = $this->url->link('module/socl_login', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
        
        if (isset($this->request->post['soclall_appid'])) {
            $data['soclall_appid'] = $this->request->post['soclall_appid'];
        } elseif ($this->config->get('soclall_appid')) {
            $data['soclall_appid'] = $this->config->get('soclall_appid');
        } else {
            $data['soclall_appid'] = '';
        }
        
        if($data['soclall_appid'])
            $data['text_view_your_dashboard'] = sprintf($this->language->get('text_view_your_dashboard'), $data['soclall_appid']);
        else $data['text_view_your_dashboard'] = $this->language->get('text_no_app_id');
        
        if (isset($this->request->post['soclall_secretkey'])) {
            $data['soclall_secretkey'] = $this->request->post['soclall_secretkey'];
        } elseif ($this->config->get('soclall_secretkey')) {
            $data['soclall_secretkey'] = $this->config->get('soclall_secretkey');
        } else {
            $data['soclall_secretkey'] = '';
        }
        
        if (isset($this->request->post['soclall_customer_group_id'])) {
			$data['soclall_customer_group_id'] = $this->request->post['soclall_customer_group_id'];
		} elseif($this->config->get('soclall_customer_group_id')) {
			$data['soclall_customer_group_id'] = $this->config->get('soclall_customer_group_id');
		} else {
            $data['soclall_customer_group_id'] = $this->config->get('config_customer_group_id');
		}
        
        if (isset($this->request->post['soclall_required_details'])) {
			$data['soclall_required_details'] = $this->request->post['soclall_required_details'];
		} else {
			$data['soclall_required_details'] = $this->config->get('soclall_required_details');
		}
        
        if (isset($this->request->post['soclall_enabled_network'])) {
			$data['soclall_enabled_network'] = $this->request->post['soclall_enabled_network'];
		} else {
			$data['soclall_enabled_network'] = $this->config->get('soclall_enabled_network');
		}
        
        // Networks
        $this->load->model('tool/image');
        
        $data['networks'] = array();
        
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "soclall_network`");
        
        if($query->num_rows){
            foreach($query->rows as $network){                
                $data['networks'][] = array(
                    'name' => $network['network_name'],
                    'icon' => $this->model_tool_image->resize("data/social_all/" . $network['logo'], 32, 32),
                    'code' => $network['network_code']
                    );
            }
        }
        
        // New User Required
        $data['new_user_details'] = array(
            array('value' => 'firstname', 'text' => $this->language->get('entry_firstname')),
            array('value' => 'lastname', 'text' => $this->language->get('entry_lastname')),
            array('value' => 'telephone', 'text' => $this->language->get('entry_telephone')),
            array('value' => 'fax', 'text' => $this->language->get('entry_fax')),
            array('value' => 'company', 'text' => $this->language->get('entry_company')),
            array('value' => 'add', 'text' => $this->language->get('entry_address')),
            array('value' => 'city', 'text' => $this->language->get('entry_city')),
            array('value' => 'postcode', 'text' => $this->language->get('entry_post_code')),
            array('value' => 'country', 'text' => $this->language->get('entry_country')),
            array('value' => 'region', 'text' => $this->language->get('entry_region')));
            
        // Customer Group
        $this->load->model('sale/customer_group');
        
        $data['customer_groups'] = array();
        
        $customer_groups = $this->model_sale_customer_group->getCustomerGroups();
        foreach($customer_groups as $gr) {
            if(is_array($this->config->get('config_customer_group_display')) && in_array($gr['customer_group_id'], $this->config->get('config_customer_group_display'))){
                $data['customer_groups'][] = array(
                    'customer_group_id' => $gr['customer_group_id'],
                    'name' => $gr['name']);
            }
        }
        
		$data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');
		
        $this->response->setOutput($this->load->view('module/socl_login.tpl', $data));
    }
    
    private function validate(){
        if (!$this->user->hasPermission('modify', 'module/socl_login')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
        
        if (!$this->error) return true;
		else return false;
    }
}

?>