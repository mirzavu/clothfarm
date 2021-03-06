<?php
class ControllerSettingStore extends Controller {
	private $error = array();

    /**
     *Ajax advanced search starts
     */
    /**26-01-2014 starts*/
    public function ajaxadvancedsearchtemplate() {
        if ($this->request->server['HTTPS']) {
            $server = HTTPS_CATALOG;
        } else {
            $server = HTTP_CATALOG;
        }

        if (is_file(DIR_IMAGE . 'ajaxadvanced/' . basename($this->request->get['template']) . '.png')) {
            $this->response->setOutput($server . 'image/ajaxadvanced/' . basename($this->request->get['template']) . '.png');
        } else {
            $this->response->setOutput($server . 'image/no_image.png');
        }
    }
    /**26-01-2014 ends*/
    /**
     *Ajax advanced search ends
     */


    public function index() {

        $this->load->language('setting/store');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/store');

		$this->getList();
	}

	public function add() {
		$this->load->language('setting/store');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/store');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$store_id = $this->model_setting_store->addStore($this->request->post);
			if ($store_id) {
				$directory = DIR_IMAGE . 'catalog/';
				mkdir($directory . '/' . $store_id, 0777);			
			}
			$this->load->model('setting/setting');

			$this->model_setting_setting->editSetting('config', $this->request->post, $store_id);

            /* loo functions begin */
            function loo_parse_queries($file) {
                $sql_file = $file;

                $contents = file_get_contents($sql_file);


                $comment_patterns = array('/\/\*.*(\n)*.*(\*\/)?/', // comments
                    '/\s*--.*\n/', //inline comments start with --
                    '/\s*#.*\n/', //inline comments start with #
                );
                $contents = preg_replace($comment_patterns, "\n", $contents);

                $contents = preg_replace('/(?<=t);(?=\n)/', "{{semicolon_in_text}}", $contents);

                $statements = explode(";\n", $contents);
//    $statements = preg_replace("/\s/", ' ', $statements);

                $queries = array();
                foreach ($statements as $query) {
                    if (trim($query) != '') {

                        $query = str_replace("{{semicolon_in_text}}", ";", $query);

                        //apply db prefix parametr
                        preg_match("/\?:\w*/i", $query, $matches);
                        $table_name = str_replace('?:', DB_PREFIX, $matches[0]);
                        if ( !empty($table_name) ) {
                            $query = str_replace(array($matches[0], 'key = '), array($table_name, '`key` = '), $query);
                        }

                        $queries[] = $query;
                    }
                }

                return $queries;
            }
            /* loo functions end */


            // LOO
			if(file_exists(DIR_CATALOG . 'view/theme/' . $this->request->post['config_template'] . '/install.sql')) {
				$tmpl_dir = dirname(DIR_CATALOG . 'view/theme/' . $this->request->post['config_template'] . '/install.sql');
				
				if((bool)stristr($tmpl_dir, $this->config->get('config_template')) == false) {
					// Parse and Run sql
					$sql = loo_parse_queries(DIR_CATALOG . 'view/theme/' . $this->request->post['config_template'] . '/install.sql');
					foreach ($sql as $query) {
						$this->db->query($query);
					}
				}
			}
            // LOO (end)

            $this->session->data['success'] = $this->language->get('text_success');
			
			$this->response->redirect($this->url->link('setting/store', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getForm();
	}

	public function edit() {
		$this->load->language('setting/store');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/store');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_setting_store->editStore($this->request->get['store_id'], $this->request->post);
			$directory = DIR_IMAGE . 'catalog/';
			if (is_dir($directory . '/' . $this->request->get['store_id'])) {				
			}else{				
				mkdir($directory . '/' . $this->request->get['store_id'], 0777);
			}
			$this->load->model('setting/setting');

			$this->model_setting_setting->editSetting('config', $this->request->post, $this->request->get['store_id']);
			
			// LOO 
			if(is_file(DIR_CATALOG . 'view/theme/' . $this->request->post['config_template'] . '/install.sql')) {
				$tmpl_dir = dirname(DIR_CATALOG . 'view/theme/' . $this->request->post['config_template'] . '/install.sql');
				
				if((bool)stristr($tmpl_dir, $this->config->get('config_template')) == false) {
					// Parse and Run sql
					$sql = loo_parse_queries(DIR_CATALOG . 'view/theme/' . $this->request->post['config_template'] . '/install.sql');
					foreach ($sql as $query) {
						$this->db->query($query);
					}
				}
			}
			// LOO (end)
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('setting/store', 'token=' . $this->session->data['token'] . '&store_id=' . $this->request->get['store_id'], 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->load->language('setting/store');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/store');

		$this->load->model('setting/setting');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $store_id) {
				$this->model_setting_store->deleteStore($store_id);

				$this->model_setting_setting->deleteSetting('config', $store_id);

				$this->delete_directory($store_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('setting/store', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getList();
	}

	public function delete_directory($store_id) {		
			
	$directory = 'catalog/'.$store_id;		
	$paths = array($directory); 		
	foreach ($paths as $path) {		
	$path = rtrim(DIR_IMAGE . str_replace(array('../', '..\\', '..'), '', $path), '/');		
			
	// If path is just a file delete it		
	if (is_file($path)) {		
	unlink($path);		
			
	// If path is a directory beging deleting each file and sub folder		
	} elseif (is_dir($path)) {		
	$files = array();		
			
	// Make path into an array		
	$path = array($path . '*');		
			
	// While the path array is still populated keep looping through		
	while (count($path) != 0) {		
	$next = array_shift($path);		
			
	foreach (glob($next) as $file) {		
	// If directory add to path array		
	if (is_dir($file)) {		
	$path[] = $file . '/*';		
	}		
			
	// Add the file to the files to be deleted array		
	$files[] = $file;		
	}		
	}		
			
	// Reverse sort the file array		
	rsort($files);		
			
	foreach ($files as $file) {		
	// If file just delete		
	if (is_file($file)) {		
	unlink($file);		
			
	// If directory use the remove directory function		
	} elseif (is_dir($file)) {		
	rmdir($file);		
	}		
	}		
	}		
	} 		
	}

	protected function getList() {
		$url = '';

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('setting/store', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['add'] = $this->url->link('setting/store/add', 'token=' . $this->session->data['token'], 'SSL');
		$data['delete'] = $this->url->link('setting/store/delete', 'token=' . $this->session->data['token'], 'SSL');

		$data['stores'] = array();

		/*$data['stores'][] = array(
			'store_id' => 0,
			'name'     => $this->config->get('config_name') . $this->language->get('text_default'),
			'url'      => HTTP_CATALOG,
			'edit'     => $this->url->link('setting/setting', 'token=' . $this->session->data['token'], 'SSL')
		);*/

		$store_total = $this->model_setting_store->getTotalStores();

		$results = $this->model_setting_store->getStoresListing();

		foreach ($results as $result) {
			$data['stores'][] = array(
				'store_id' => $result['store_id'],
				'name'     => ucfirst($result['name']),
				'url'      => $result['url'],
				'edit'     => $this->url->link('setting/store/edit', 'token=' . $this->session->data['token'] . '&store_id=' . $result['store_id'], 'SSL')
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_url'] = $this->language->get('column_url');
		$data['column_action'] = $this->language->get('column_action');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('setting/store_list.tpl', $data));
	}

	public function getForm() {
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_form'] = !isset($this->request->get['store_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
		$data['text_select'] = $this->language->get('text_select');
		$data['text_none'] = $this->language->get('text_none');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_items'] = $this->language->get('text_items');
		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_stock'] = $this->language->get('text_stock');
		$data['text_shipping'] = $this->language->get('text_shipping');
		$data['text_payment'] = $this->language->get('text_payment');

		$data['text_enabled'] = $this->language->get('text_enabled');		
	$data['text_disabled'] = $this->language->get('text_disabled');		
			
	$data['entry_firstname'] = $this->language->get('entry_firstname');		
	$data['entry_lastname'] = $this->language->get('entry_lastname');		
	$data['entry_password'] = $this->language->get('entry_password');		
	$data['entry_confirm'] = $this->language->get('entry_confirm');		
	$data['entry_status'] = $this->language->get('entry_status');		
	$data['entry_commission'] = $this->language->get('entry_commission');		
	$data['entry_payacc'] = $this->language->get('entry_payacc');

		$data['entry_url'] = $this->language->get('entry_url');
		$data['entry_ssl'] = $this->language->get('entry_ssl');
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_owner'] = $this->language->get('entry_owner');
		$data['entry_address'] = $this->language->get('entry_address');
		$data['entry_geocode'] = $this->language->get('entry_geocode');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_telephone'] = $this->language->get('entry_telephone');
		$data['entry_fax'] = $this->language->get('entry_fax');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_open'] = $this->language->get('entry_open');
		$data['entry_comment'] = $this->language->get('entry_comment');
		$data['entry_location'] = $this->language->get('entry_location');
		$data['entry_meta_title'] = $this->language->get('entry_meta_title');
		$data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$data['entry_layout'] = $this->language->get('entry_layout');
		$data['entry_template'] = $this->language->get('entry_template');
		$data['entry_country'] = $this->language->get('entry_country');
		$data['entry_zone'] = $this->language->get('entry_zone');
		$data['entry_language'] = $this->language->get('entry_language');
		$data['entry_currency'] = $this->language->get('entry_currency');
		$data['entry_product_limit'] = $this->language->get('entry_product_limit');
		$data['entry_product_description_length'] = $this->language->get('entry_product_description_length');
		$data['entry_tax'] = $this->language->get('entry_tax');
		$data['entry_tax_default'] = $this->language->get('entry_tax_default');
		$data['entry_tax_customer'] = $this->language->get('entry_tax_customer');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_customer_group_display'] = $this->language->get('entry_customer_group_display');
		$data['entry_customer_price'] = $this->language->get('entry_customer_price');
		$data['entry_account'] = $this->language->get('entry_account');
		$data['entry_cart_weight'] = $this->language->get('entry_cart_weight');
		$data['entry_checkout_guest'] = $this->language->get('entry_checkout_guest');
		$data['entry_checkout'] = $this->language->get('entry_checkout');
		$data['entry_order_status'] = $this->language->get('entry_order_status');
		$data['entry_stock_display'] = $this->language->get('entry_stock_display');
		$data['entry_stock_checkout'] = $this->language->get('entry_stock_checkout');
		$data['entry_ajax_cart'] = $this->language->get('entry_ajax_cart');
		$data['entry_logo'] = $this->language->get('entry_logo');
		$data['entry_icon'] = $this->language->get('entry_icon');
		$data['entry_image_category'] = $this->language->get('entry_image_category');
		$data['entry_image_thumb'] = $this->language->get('entry_image_thumb');
		$data['entry_image_popup'] = $this->language->get('entry_image_popup');
		$data['entry_image_product'] = $this->language->get('entry_image_product');
		$data['entry_image_additional'] = $this->language->get('entry_image_additional');
		$data['entry_image_related'] = $this->language->get('entry_image_related');
		$data['entry_image_compare'] = $this->language->get('entry_image_compare');
		$data['entry_image_wishlist'] = $this->language->get('entry_image_wishlist');
		$data['entry_image_cart'] = $this->language->get('entry_image_cart');
		$data['entry_image_location'] = $this->language->get('entry_image_location');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_secure'] = $this->language->get('entry_secure');

		$data['help_url'] = $this->language->get('help_url');
		$data['help_ssl'] = $this->language->get('help_ssl');
		$data['help_geocode'] = $this->language->get('help_geocode');
		$data['help_open'] = $this->language->get('help_open');
		$data['help_comment'] = $this->language->get('help_comment');
		$data['help_location'] = $this->language->get('help_location');
		$data['help_currency'] = $this->language->get('help_currency');
		$data['help_product_limit'] = $this->language->get('help_product_limit');
		$data['help_product_description_length'] = $this->language->get('help_product_description_length');
		$data['help_tax_default'] = $this->language->get('help_tax_default');
		$data['help_tax_customer'] = $this->language->get('help_tax_customer');
		$data['help_customer_group'] = $this->language->get('help_customer_group');
		$data['help_customer_group_display'] = $this->language->get('help_customer_group_display');
		$data['help_customer_price'] = $this->language->get('help_customer_price');
		$data['help_account'] = $this->language->get('help_account');
		$data['help_checkout_guest'] = $this->language->get('help_checkout_guest');
		$data['help_checkout'] = $this->language->get('help_checkout');
		$data['help_order_status'] = $this->language->get('help_order_status');
		$data['help_stock_display'] = $this->language->get('help_stock_display');
		$data['help_stock_checkout'] = $this->language->get('help_stock_checkout');
		$data['help_icon'] = $this->language->get('help_icon');
		$data['help_secure'] = $this->language->get('help_secure');

		$data['help_commission'] = $this->language->get('help_commission');		
	$data['help_payacc'] = $this->language->get('help_payacc');
	$data['tab_commission'] = $this->language->get('tab_commission');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');
		$data['tab_store'] = $this->language->get('tab_store');
		$data['tab_local'] = $this->language->get('tab_local');
		$data['tab_option'] = $this->language->get('tab_option');
		$data['tab_image'] = $this->language->get('tab_image');
		$data['tab_server'] = $this->language->get('tab_server');

        /**
         *Ajax advanced search starts
         */
        $data['tab_ajaxadvancedsearch'] = $this->language->get('tab_ajaxadvancedsearch');
        $data['text_ajaxadvancedsearch'] = $this->language->get('text_ajaxadvancedsearch');
        $data['text_display_image'] = $this->language->get('text_display_image');
        $data['text_ajaxadvancedsearch_limit'] = $this->language->get('text_ajaxadvancedsearch_limit');
        $data['help_ajaxadvancedsearch_limit'] = $this->language->get('help_ajaxadvancedsearch_limit');
        $data['help_ajaxadvancedsearch_charlimit'] = $this->language->get('help_ajaxadvancedsearch_charlimit');
        $data['text_display_model'] = $this->language->get('text_display_model');
        $data['text_display_manufacturer'] = $this->language->get('text_display_manufacturer');
        $data['text_display_price'] = $this->language->get('text_display_price');
        /**Customer group price show starts*/
        $data['text_display_price_customergroups'] = $this->language->get('text_display_price_customergroups');
        $data['help_display_price_customergroups'] = $this->language->get('help_display_price_customergroups');
        $data['text_login_display_price'] = $this->language->get('text_login_display_price');
        $data['help_login_display_price'] = $this->language->get('help_login_display_price');
        /**Customer group price show ends*/
        $data['text_display_rating'] = $this->language->get('text_display_rating');
        $data['text_display_stock'] = $this->language->get('text_display_stock');
        $data['text_search_model'] = $this->language->get('text_search_model');
        $data['text_search_tag'] = $this->language->get('text_search_tag');
        $data['text_search_mpn'] = $this->language->get('text_search_mpn');
        $data['text_search_manufacturer'] = $this->language->get('text_search_manufacturer');
        $data['text_search_isbn'] = $this->language->get('text_search_isbn');
        $data['text_search_jan'] = $this->language->get('text_search_jan');
        $data['text_search_ean'] = $this->language->get('text_search_ean');
        $data['text_search_upc'] = $this->language->get('text_search_upc');
        $data['text_search_sku'] = $this->language->get('text_search_sku');
        $data['text_highlight'] = $this->language->get('text_highlight');
        $data['text_highlight_sepeate'] = $this->language->get('text_highlight_sepeate');
        $data['text_highlight_combine'] = $this->language->get('text_highlight_combine');
        $data['text_highlight_no'] = $this->language->get('text_highlight_no');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_imagesize'] = $this->language->get('text_imagesize');
        $data['help_imagesize'] = $this->language->get('help_imagesize');
        /** 26-01-2014 starts */
        $data['help_colorpicker'] = $this->language->get('help_colorpicker');
        $data['text_colorheading'] = $this->language->get('text_colorheading');
        $data['text_colorheadinghover'] = $this->language->get('text_colorheadinghover');
        $data['text_colormodel'] = $this->language->get('text_colormodel');
        $data['text_colormodelhover'] = $this->language->get('text_colormodelhover');
        $data['text_colormanufacturer'] = $this->language->get('text_colormanufacturer');
        $data['text_colormanufacturerhover'] = $this->language->get('text_colormanufacturerhover');
        $data['text_colorprice'] = $this->language->get('text_colorprice');
        $data['text_colorpricehover'] = $this->language->get('text_colorpricehover');
        $data['text_colorstockstatus'] = $this->language->get('text_colorstockstatus');
        $data['text_colorstockstatushover'] = $this->language->get('text_colorstockstatushover');
        $data['text_colorquantity'] = $this->language->get('text_colorquantity');
        $data['text_colorquantityhover'] = $this->language->get('text_colorquantityhover');
        $data['text_colorresult'] = $this->language->get('text_colorresult');
        $data['text_colorresulthover'] = $this->language->get('text_colorresulthover');
        $data['text_colorresultodd'] = $this->language->get('text_colorresultodd');
        $data['text_colorresulteven'] = $this->language->get('text_colorresulteven');
        $data['text_colordefaultall'] = $this->language->get('text_colordefaultall');
        $data['help_colordefaultall'] = $this->language->get('help_colordefaultall');
        $data['text_colorenabletall'] = $this->language->get('text_colorenabletall');
        $data['help_colorenableall'] = $this->language->get('help_colorenableall');
        $data['text_colordefault'] = $this->language->get('text_colordefault');
        $data['text_colordefaulthover'] = $this->language->get('text_colordefaulthover');
        $data['text_display_quantity'] = $this->language->get('text_display_quantity');
        $data['text_ajaxadvancedsearch_charlimit'] = $this->language->get('text_ajaxadvancedsearch_charlimit');
        $data['text_display_query'] = $this->language->get('text_display_query');
        $data['help_display_query'] = $this->language->get('help_display_query');
        $data['text_result_view'] = $this->language->get('text_result_view');
        $data['text_result_viewborder'] = $this->language->get('text_result_viewborder');
        $data['text_result_viewbottom'] = $this->language->get('text_result_viewbottom');
        $data['text_colorhighlight'] = $this->language->get('text_colorhighlight');
        $data['text_colorhighlighthover'] = $this->language->get('text_colorhighlighthover');
        $data['tab_ajaxadvancedsearchgeneral'] = $this->language->get('tab_ajaxadvancedsearchgeneral');
        $data['tab_ajaxadvancedsearchsearch'] = $this->language->get('tab_ajaxadvancedsearchsearch');
        $data['tab_ajaxadvancedsearchshow'] = $this->language->get('tab_ajaxadvancedsearchshow');
        $data['tab_ajaxadvancedsearchcolors'] = $this->language->get('tab_ajaxadvancedsearchcolors');
        /** 26-01-2014 ends */
        $data['text_imagewidth'] = $this->language->get('text_imagewidth');
        $data['text_imageheight'] = $this->language->get('text_imageheight');
        if (isset($this->error['config_ajaxadvancedsearch_image'])) {
            $data['error_config_ajaxadvancedsearch_image'] = $this->error['config_ajaxadvancedsearch_image'];
        } else {
            $data['error_config_ajaxadvancedsearch_image'] = '';
        }
        /** customer group price show starts */
        $data['ajaxadvance_customergroup']=array();
        $this->load->model('sale/customer_group');
        $data['ajaxadvance_customergroups'] = $this->model_sale_customer_group->getCustomerGroups();
        /** customer group price show ends */
        /**
         *Ajax advanced search ends
         */


        if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['url'])) {
			$data['error_url'] = $this->error['url'];
		} else {
			$data['error_url'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['owner'])) {
			$data['error_owner'] = $this->error['owner'];
		} else {
			$data['error_owner'] = '';
		}

		if (isset($this->error['address'])) {
			$data['error_address'] = $this->error['address'];
		} else {
			$data['error_address'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['password'])) {		
	$data['error_password'] = $this->error['password'];		
	} else {		
	$data['error_password'] = '';		
	}		
			
	if (isset($this->error['confirm'])) {		
	$data['error_confirm'] = $this->error['confirm'];		
	} else {		
	$data['error_confirm'] = '';		
	}		
			
	if (isset($this->error['firstname'])) {		
	$data['error_firstname'] = $this->error['firstname'];		
	} else {		
	$data['error_firstname'] = '';		
	}		
			
	if (isset($this->error['lastname'])) {		
	$data['error_lastname'] = $this->error['lastname'];		
	} else {		
	$data['error_lastname'] = '';		
	}

		if (isset($this->error['telephone'])) {
			$data['error_telephone'] = $this->error['telephone'];
		} else {
			$data['error_telephone'] = '';
		}

		if (isset($this->error['meta_title'])) {
			$data['error_meta_title'] = $this->error['meta_title'];
		} else {
			$data['error_meta_title'] = '';
		}

		if (isset($this->error['customer_group_display'])) {
			$data['error_customer_group_display'] = $this->error['customer_group_display'];
		} else {
			$data['error_customer_group_display'] = '';
		}

		if (isset($this->error['image_category'])) {
			$data['error_image_category'] = $this->error['image_category'];
		} else {
			$data['error_image_category'] = '';
		}

		if (isset($this->error['image_thumb'])) {
			$data['error_image_thumb'] = $this->error['image_thumb'];
		} else {
			$data['error_image_thumb'] = '';
		}

		if (isset($this->error['image_popup'])) {
			$data['error_image_popup'] = $this->error['image_popup'];
		} else {
			$data['error_image_popup'] = '';
		}

		if (isset($this->error['image_product'])) {
			$data['error_image_product'] = $this->error['image_product'];
		} else {
			$data['error_image_product'] = '';
		}

		if (isset($this->error['image_additional'])) {
			$data['error_image_additional'] = $this->error['image_additional'];
		} else {
			$data['error_image_additional'] = '';
		}

		if (isset($this->error['image_related'])) {
			$data['error_image_related'] = $this->error['image_related'];
		} else {
			$data['error_image_related'] = '';
		}

		if (isset($this->error['image_compare'])) {
			$data['error_image_compare'] = $this->error['image_compare'];
		} else {
			$data['error_image_compare'] = '';
		}

		if (isset($this->error['image_wishlist'])) {
			$data['error_image_wishlist'] = $this->error['image_wishlist'];
		} else {
			$data['error_image_wishlist'] = '';
		}

		if (isset($this->error['image_cart'])) {
			$data['error_image_cart'] = $this->error['image_cart'];
		} else {
			$data['error_image_cart'] = '';
		}

		if (isset($this->error['image_location'])) {
			$data['error_image_location'] = $this->error['image_location'];
		} else {
			$data['error_image_location'] = '';
		}

		if (isset($this->error['product_limit'])) {
			$data['error_product_limit'] = $this->error['product_limit'];
		} else {
			$data['error_product_limit'] = '';
		}

		if (isset($this->error['product_description_length'])) {
			$data['error_product_description_length'] = $this->error['product_description_length'];
		} else {
			$data['error_product_description_length'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('setting/store', 'token=' . $this->session->data['token'], 'SSL')
		);
		
		if (!isset($this->request->get['store_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_settings'),
				'href' => $this->url->link('setting/store/add', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_settings'),
				'href' => $this->url->link('setting/store/edit', 'token=' . $this->session->data['token'] . '&store_id=' . $this->request->get['store_id'], 'SSL')
			);			
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (!isset($this->request->get['store_id'])) {
			$data['action'] = $this->url->link('setting/store/add', 'token=' . $this->session->data['token'], 'SSL');
			$data['can_edit'] = '';
		} else {
			$data['action'] = $this->url->link('setting/store/edit', 'token=' . $this->session->data['token'] . '&store_id=' . $this->request->get['store_id'], 'SSL');
			$data['can_edit'] = 1;
		}

		$data['cancel'] = $this->url->link('setting/store', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['store_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$this->load->model('setting/setting');

			$store_info = $this->model_setting_setting->getSetting('config', $this->request->get['store_id']);
			$vendor_info = $this->model_setting_setting->getVendorSetting($this->request->get['store_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['config_url'])) {
			$data['config_url'] = $this->request->post['config_url'];
		} elseif (isset($store_info['config_url'])) {
			$data['config_url'] = $store_info['config_url'];
		} else {
			$data['config_url'] = '';
		}

		if (isset($this->request->post['config_ssl'])) {
			$data['config_ssl'] = $this->request->post['config_ssl'];
		} elseif (isset($store_info['config_ssl'])) {
			$data['config_ssl'] = $store_info['config_ssl'];
		} else {
			$data['config_ssl'] = '';
		}

		if (isset($this->request->post['config_name'])) {
			$data['config_name'] = $this->request->post['config_name'];
		} elseif (isset($store_info['config_name'])) {
			$data['config_name'] = $store_info['config_name'];
		} else {
			$data['config_name'] = '';
		}
        /**
         *Ajax advanced search starts
         */
        if (isset($this->request->post['config_ajaxadvancedsearch'])) {
            $data['config_ajaxadvancedsearch'] = $this->request->post['config_ajaxadvancedsearch'];
        } else {
            $data['config_ajaxadvancedsearch'] = $this->config->get('config_ajaxadvancedsearch');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_limit'])) {
            $data['config_ajaxadvancedsearch_limit'] = $this->request->post['config_ajaxadvancedsearch_limit'];
        } else {
            $data['config_ajaxadvancedsearch_limit'] = $this->config->get('config_ajaxadvancedsearch_limit');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_image'])) {
            $data['config_ajaxadvancedsearch_image'] = $this->request->post['config_ajaxadvancedsearch_image'];
        } else {
            $data['config_ajaxadvancedsearch_image'] = $this->config->get('config_ajaxadvancedsearch_image');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_image_width'])) {
            $data['config_ajaxadvancedsearch_image_width'] = $this->request->post['config_ajaxadvancedsearch_image_width'];
        } else {
            $data['config_ajaxadvancedsearch_image_width'] = $this->config->get('config_ajaxadvancedsearch_image_width');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_image_height'])) {
            $data['config_ajaxadvancedsearch_image_height'] = $this->request->post['config_ajaxadvancedsearch_image_height'];
        } else {
            $data['config_ajaxadvancedsearch_image_height'] = $this->config->get('config_ajaxadvancedsearch_image_height');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_model'])) {
            $data['config_ajaxadvancedsearch_model'] = $this->request->post['config_ajaxadvancedsearch_model'];
        } else {
            $data['config_ajaxadvancedsearch_model'] = $this->config->get('config_ajaxadvancedsearch_model');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_manufacturer'])) {
            $data['config_ajaxadvancedsearch_manufacturer'] = $this->request->post['config_ajaxadvancedsearch_manufacturer'];
        } else {
            $data['config_ajaxadvancedsearch_manufacturer'] = $this->config->get('config_ajaxadvancedsearch_manufacturer');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_price'])) {
            $data['config_ajaxadvancedsearch_price'] = $this->request->post['config_ajaxadvancedsearch_price'];
        } else {
            $data['config_ajaxadvancedsearch_price'] = $this->config->get('config_ajaxadvancedsearch_price');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_rating'])) {
            $data['config_ajaxadvancedsearch_rating'] = $this->request->post['config_ajaxadvancedsearch_rating'];
        } else {
            $data['config_ajaxadvancedsearch_rating'] = $this->config->get('config_ajaxadvancedsearch_rating');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_stock'])) {
            $data['config_ajaxadvancedsearch_stock'] = $this->request->post['config_ajaxadvancedsearch_stock'];
        } else {
            $data['config_ajaxadvancedsearch_stock'] = $this->config->get('config_ajaxadvancedsearch_stock');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_model_search'])) {
            $data['config_ajaxadvancedsearch_model_search'] = $this->request->post['config_ajaxadvancedsearch_model_search'];
        } else {
            $data['config_ajaxadvancedsearch_model_search'] = $this->config->get('config_ajaxadvancedsearch_model_search');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_tag'])) {
            $data['config_ajaxadvancedsearch_tag'] = $this->request->post['config_ajaxadvancedsearch_tag'];
        } else {
            $data['config_ajaxadvancedsearch_tag'] = $this->config->get('config_ajaxadvancedsearch_tag');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_mpn'])) {
            $data['config_ajaxadvancedsearch_mpn'] = $this->request->post['config_ajaxadvancedsearch_mpn'];
        } else {
            $data['config_ajaxadvancedsearch_mpn'] = $this->config->get('config_ajaxadvancedsearch_mpn');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_manufacturer_search'])) {
            $data['config_ajaxadvancedsearch_manufacturer_search'] = $this->request->post['config_ajaxadvancedsearch_manufacturer_search'];
        } else {
            $data['config_ajaxadvancedsearch_manufacturer_search'] = $this->config->get('config_ajaxadvancedsearch_manufacturer_search');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_isbn'])) {
            $data['config_ajaxadvancedsearch_isbn'] = $this->request->post['config_ajaxadvancedsearch_isbn'];
        } else {
            $data['config_ajaxadvancedsearch_isbn'] = $this->config->get('config_ajaxadvancedsearch_isbn');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_jan'])) {
            $data['config_ajaxadvancedsearch_jan'] = $this->request->post['config_ajaxadvancedsearch_jan'];
        } else {
            $data['config_ajaxadvancedsearch_jan'] = $this->config->get('config_ajaxadvancedsearch_jan');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_ean'])) {
            $data['config_ajaxadvancedsearch_ean'] = $this->request->post['config_ajaxadvancedsearch_ean'];
        } else {
            $data['config_ajaxadvancedsearch_ean'] = $this->config->get('config_ajaxadvancedsearch_ean');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_upc'])) {
            $data['config_ajaxadvancedsearch_upc'] = $this->request->post['config_ajaxadvancedsearch_upc'];
        } else {
            $data['config_ajaxadvancedsearch_upc'] = $this->config->get('config_ajaxadvancedsearch_upc');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_sku'])) {
            $data['config_ajaxadvancedsearch_sku'] = $this->request->post['config_ajaxadvancedsearch_sku'];
        } else {
            $data['config_ajaxadvancedsearch_sku'] = $this->config->get('config_ajaxadvancedsearch_sku');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_highlight'])) {
            $data['config_ajaxadvancedsearch_highlight'] = $this->request->post['config_ajaxadvancedsearch_highlight'];
        } else {
            $data['config_ajaxadvancedsearch_highlight'] = $this->config->get('config_ajaxadvancedsearch_highlight');
        }

        /**
         *Ajax advanced search ends
         */

        if (isset($this->request->post['config_owner'])) {
			$data['config_owner'] = $this->request->post['config_owner'];
		} elseif (isset($store_info['config_owner'])) {
			$data['config_owner'] = $store_info['config_owner'];
		} else {
			$data['config_owner'] = '';
		}

		if (isset($this->request->post['config_address'])) {
			$data['config_address'] = $this->request->post['config_address'];
		} elseif (isset($store_info['config_address'])) {
			$data['config_address'] = $store_info['config_address'];
		} else {
			$data['config_address'] = '';
		}

		if (isset($this->request->post['config_geocode'])) {
			$data['config_geocode'] = $this->request->post['config_geocode'];
		} elseif (isset($store_info['config_geocode'])) {
			$data['config_geocode'] = $store_info['config_geocode'];
		} else {
			$data['config_geocode'] = '';
		}

		if (isset($this->request->post['config_email'])) {
			$data['config_email'] = $this->request->post['config_email'];
		} elseif (isset($store_info['config_email'])) {
			$data['config_email'] = $store_info['config_email'];
		} else {
			$data['config_email'] = '';
		}

		if (isset($this->request->post['password'])) {		
	$data['password'] = $this->request->post['password'];		
	} else {		
	$data['password'] = '';		
	}		
			
	if (isset($this->request->post['confirm'])) {		
	$data['confirm'] = $this->request->post['confirm'];		
	} else {		
	$data['confirm'] = '';		
	}		
			
	if (isset($this->request->post['firstname'])) {		
	$data['firstname'] = $this->request->post['firstname'];		
	} elseif (!empty($vendor_info)) {		
	$data['firstname'] = $vendor_info['firstname'];		
	} else {		
	$data['firstname'] = '';		
	}		
			
	if (!empty($vendor_info)) {		
	$data['user_id'] = $vendor_info['user_id'];		
	} else {		
	$data['user_id'] = '';		
	}		
	if (isset($this->request->post['lastname'])) {		
	$data['lastname'] = $this->request->post['lastname'];		
	} elseif (!empty($vendor_info)) {		
	$data['lastname'] = $vendor_info['lastname'];		
	} else {		
	$data['lastname'] = '';		
	}		
			
	if (isset($this->request->post['status'])) {		
	$data['status'] = $this->request->post['status'];		
	} elseif (!empty($vendor_info)) {		
	$data['status'] = $vendor_info['status'];		
	} else {		
	$data['status'] = 0;		
	}

		if (isset($this->request->post['config_telephone'])) {
			$data['config_telephone'] = $this->request->post['config_telephone'];
		} elseif (isset($store_info['config_telephone'])) {
			$data['config_telephone'] = $store_info['config_telephone'];
		} else {
			$data['config_telephone'] = '';
		}

		if (isset($this->request->post['config_fax'])) {
			$data['config_fax'] = $this->request->post['config_fax'];
		} elseif (isset($store_info['config_fax'])) {
			$data['config_fax'] = $store_info['config_fax'];
		} else {
			$data['config_fax'] = '';
		}

		if (isset($this->request->post['config_image'])) {
			$data['config_image'] = $this->request->post['config_image'];
		} elseif (isset($store_info['config_image'])) {
			$data['config_image'] = $store_info['config_image'];
		} else {
			$data['config_image'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['config_image']) && is_file(DIR_IMAGE . $this->request->post['config_image'])) {
			$data['thumb'] = $this->model_tool_image->resize($this->request->post['config_image'], 100, 100);
		} elseif (isset($store_info['config_image']) && is_file(DIR_IMAGE . $store_info['config_image'])) {
			$data['thumb'] = $this->model_tool_image->resize($store_info['config_image'], 100, 100);
		} else {
			$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->request->post['config_open'])) {
			$data['config_open'] = $this->request->post['config_open'];
		} elseif (isset($store_info['config_open'])) {
			$data['config_open'] = $store_info['config_open'];
		} else {
			$data['config_open'] = '';
		}

		if (isset($this->request->post['config_comment'])) {
			$data['config_comment'] = $this->request->post['config_comment'];
		} elseif (isset($store_info['config_comment'])) {
			$data['config_comment'] = $store_info['config_comment'];
		} else {
			$data['config_comment'] = '';
		}

		$this->load->model('localisation/location');

		$data['locations'] = $this->model_localisation_location->getLocations();

		if (isset($this->request->post['config_location'])) {
			$data['config_location'] = $this->request->post['config_location'];
		} elseif ($this->config->get('config_location')) {
			$data['config_location'] = $this->config->get('config_location');
		} else {
			$data['config_location'] = array();
		}

		if (isset($this->request->post['config_meta_title'])) {
			$data['config_meta_title'] = $this->request->post['config_meta_title'];
		} elseif (isset($store_info['config_meta_title'])) {
			$data['config_meta_title'] = $store_info['config_meta_title'];
		} else {
			$data['config_meta_title'] = '';
		}

		if (isset($this->request->post['config_meta_description'])) {
			$data['config_meta_description'] = $this->request->post['config_meta_description'];
		} elseif (isset($store_info['config_meta_description'])) {
			$data['config_meta_description'] = $store_info['config_meta_description'];
		} else {
			$data['config_meta_description'] = '';
		}

		if (isset($this->request->post['config_meta_keyword'])) {
			$data['config_meta_keyword'] = $this->request->post['config_meta_keyword'];
		} elseif (isset($store_info['config_meta_keyword'])) {
			$data['config_meta_keyword'] = $store_info['config_meta_keyword'];
		} else {
			$data['config_meta_keyword'] = '';
		}

		if (isset($this->request->post['config_layout_id'])) {
			$data['config_layout_id'] = $this->request->post['config_layout_id'];
		} elseif (isset($store_info['config_layout_id'])) {
			$data['config_layout_id'] = $store_info['config_layout_id'];
		} else {
			$data['config_layout_id'] = '';
		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		if (isset($this->request->post['config_template'])) {
			$data['config_template'] = $this->request->post['config_template'];
		} elseif (isset($store_info['config_template'])) {
			$data['config_template'] = $store_info['config_template'];
		} else {
			$data['config_template'] = '';
		}

		$data['templates'] = array();

		$directories = glob(DIR_CATALOG . 'view/theme/*', GLOB_ONLYDIR);

		foreach ($directories as $directory) {
			$data['templates'][] = basename($directory);
		}

		if (isset($this->request->post['config_country_id'])) {
			$data['config_country_id'] = $this->request->post['config_country_id'];
		} elseif (isset($store_info['config_country_id'])) {
			$data['config_country_id'] = $store_info['config_country_id'];
		} else {
			$data['config_country_id'] = $this->config->get('config_country_id');
		}

		$this->load->model('localisation/country');

		$data['countries'] = $this->model_localisation_country->getCountries();

		if (isset($this->request->post['config_zone_id'])) {
			$data['config_zone_id'] = $this->request->post['config_zone_id'];
		} elseif (isset($store_info['config_zone_id'])) {
			$data['config_zone_id'] = $store_info['config_zone_id'];
		} else {
			$data['config_zone_id'] = $this->config->get('config_zone_id');
		}

		if (isset($this->request->post['config_language'])) {
			$data['config_language'] = $this->request->post['config_language'];
		} elseif (isset($store_info['config_language'])) {
			$data['config_language'] = $store_info['config_language'];
		} else {
			$data['config_language'] = $this->config->get('config_language');
		}

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (isset($this->request->post['config_currency'])) {
			$data['config_currency'] = $this->request->post['config_currency'];
		} elseif (isset($store_info['config_currency'])) {
			$data['config_currency'] = $store_info['config_currency'];
		} else {
			$data['config_currency'] = $this->config->get('config_currency');
		}

		$this->load->model('localisation/currency');

		$data['currencies'] = $this->model_localisation_currency->getCurrencies();

		if (isset($this->request->post['config_product_limit'])) {
			$data['config_product_limit'] = $this->request->post['config_product_limit'];
		} elseif (isset($store_info['config_product_limit'])) {
			$data['config_product_limit'] = $store_info['config_product_limit'];
		} else {
			$data['config_product_limit'] = '15';
		}

		if (isset($this->request->post['config_product_description_length'])) {
			$data['config_product_description_length'] = $this->request->post['config_product_description_length'];
		} elseif (isset($store_info['config_product_description_length'])) {
			$data['config_product_description_length'] = $store_info['config_product_description_length'];
		} else {
			$data['config_product_description_length'] = '100';
		}

		if (isset($this->request->post['config_tax'])) {
			$data['config_tax'] = $this->request->post['config_tax'];
		} elseif (isset($store_info['config_tax'])) {
			$data['config_tax'] = $store_info['config_tax'];
		} else {
			$data['config_tax'] = '';
		}

		if (isset($this->request->post['config_tax_default'])) {
			$data['config_tax_default'] = $this->request->post['config_tax_default'];
		} elseif (isset($store_info['config_tax_default'])) {
			$data['config_tax_default'] = $store_info['config_tax_default'];
		} else {
			$data['config_tax_default'] = '';
		}

		if (isset($this->request->post['config_tax_customer'])) {
			$data['config_tax_customer'] = $this->request->post['config_tax_customer'];
		} elseif (isset($store_info['config_tax_customer'])) {
			$data['config_tax_customer'] = $store_info['config_tax_customer'];
		} else {
			$data['config_tax_customer'] = '';
		}

		if (isset($this->request->post['config_customer_group_id'])) {
			$data['config_customer_group_id'] = $this->request->post['config_customer_group_id'];
		} elseif (isset($store_info['config_customer_group_id'])) {
			$data['config_customer_group_id'] = $store_info['config_customer_group_id'];
		} else {
			$data['config_customer_group_id'] = '';
		}

		$this->load->model('sale/customer_group');

		$data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();

		if (isset($this->request->post['config_customer_group_display'])) {
			$data['config_customer_group_display'] = $this->request->post['config_customer_group_display'];
		} elseif (isset($store_info['config_customer_group_display'])) {
			$data['config_customer_group_display'] = $store_info['config_customer_group_display'];
		} else {
			$data['config_customer_group_display'] = array();
		}

		if (isset($this->request->post['config_customer_price'])) {
			$data['config_customer_price'] = $this->request->post['config_customer_price'];
		} elseif (isset($store_info['config_customer_price'])) {
			$data['config_customer_price'] = $store_info['config_customer_price'];
		} else {
			$data['config_customer_price'] = '';
		}

		if (isset($this->request->post['config_account_id'])) {
			$data['config_account_id'] = $this->request->post['config_account_id'];
		} elseif (isset($store_info['config_account_id'])) {
			$data['config_account_id'] = $store_info['config_account_id'];
		} else {
			$data['config_account_id'] = '';
		}

		$this->load->model('catalog/information');

		$data['informations'] = $this->model_catalog_information->getInformations();

		if (isset($this->request->post['config_cart_weight'])) {
			$data['config_cart_weight'] = $this->request->post['config_cart_weight'];
		} elseif (isset($store_info['config_cart_weight'])) {
			$data['config_cart_weight'] = $store_info['config_cart_weight'];
		} else {
			$data['config_cart_weight'] = '';
		}

		if (isset($this->request->post['config_checkout_guest'])) {
			$data['config_checkout_guest'] = $this->request->post['config_checkout_guest'];
		} elseif (isset($store_info['config_checkout_guest'])) {
			$data['config_checkout_guest'] = $store_info['config_checkout_guest'];
		} else {
			$data['config_checkout_guest'] = '';
		}

		if (isset($this->request->post['config_checkout_id'])) {
			$data['config_checkout_id'] = $this->request->post['config_checkout_id'];
		} elseif (isset($store_info['config_checkout_id'])) {
			$data['config_checkout_id'] = $store_info['config_checkout_id'];
		} else {
			$data['config_checkout_id'] = '';
		}

		if (isset($this->request->post['config_order_status_id'])) {
			$data['config_order_status_id'] = $this->request->post['config_order_status_id'];
		} elseif (isset($store_info['config_order_status_id'])) {
			$data['config_order_status_id'] = $store_info['config_order_status_id'];
		} else {
			$data['config_order_status_id'] = '';
		}

		$this->load->model('localisation/order_status');

		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['config_stock_display'])) {
			$data['config_stock_display'] = $this->request->post['config_stock_display'];
		} elseif (isset($store_info['config_stock_display'])) {
			$data['config_stock_display'] = $store_info['config_stock_display'];
		} else {
			$data['config_stock_display'] = '';
		}

		if (isset($this->request->post['config_stock_checkout'])) {
			$data['config_stock_checkout'] = $this->request->post['config_stock_checkout'];
		} elseif (isset($store_info['config_stock_checkout'])) {
			$data['config_stock_checkout'] = $store_info['config_stock_checkout'];
		} else {
			$data['config_stock_checkout'] = '';
		}

		if (isset($this->request->post['config_logo'])) {
			$data['config_logo'] = $this->request->post['config_logo'];
		} elseif (isset($store_info['config_logo'])) {
			$data['config_logo'] = $store_info['config_logo'];
		} else {
			$data['config_logo'] = '';
		}

		if (isset($this->request->post['config_logo']) && is_file(DIR_IMAGE . $this->request->post['config_logo'])) {
			$data['logo'] = $this->model_tool_image->resize($this->request->post['config_logo'], 100, 100);
		} elseif (isset($store_info['config_logo']) && is_file(DIR_IMAGE . $store_info['config_logo'])) {
			$data['logo'] = $this->model_tool_image->resize($store_info['config_logo'], 100, 100);
		} else {
			$data['logo'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);

		if (isset($this->request->post['config_icon'])) {
			$data['config_icon'] = $this->request->post['config_icon'];
		} elseif (isset($store_info['config_icon'])) {
			$data['config_icon'] = $store_info['config_icon'];
		} else {
			$data['config_icon'] = '';
		}

		if (isset($this->request->post['config_icon']) && is_file(DIR_IMAGE . $this->request->post['config_icon'])) {
			$data['icon'] = $this->model_tool_image->resize($this->request->post['config_icon'], 100, 100);
		} elseif (isset($store_info['config_icon']) && is_file(DIR_IMAGE . $store_info['config_icon'])) {
			$data['icon'] = $this->model_tool_image->resize($store_info['config_icon'], 100, 100);
		} else {
			$data['icon'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		if (isset($this->request->post['config_image_category_height'])) {
			$data['config_image_category_height'] = $this->request->post['config_image_category_height'];
		} elseif (isset($store_info['config_image_category_height'])) {
			$data['config_image_category_height'] = $store_info['config_image_category_height'];
		} else {
			$data['config_image_category_height'] = 80;
		}

		if (isset($this->request->post['config_image_thumb_width'])) {
			$data['config_image_thumb_width'] = $this->request->post['config_image_thumb_width'];
		} elseif (isset($store_info['config_image_thumb_width'])) {
			$data['config_image_thumb_width'] = $store_info['config_image_thumb_width'];
		} else {
			$data['config_image_thumb_width'] = 228;
		}

		if (isset($this->request->post['config_image_thumb_height'])) {
			$data['config_image_thumb_height'] = $this->request->post['config_image_thumb_height'];
		} elseif (isset($store_info['config_image_thumb_height'])) {
			$data['config_image_thumb_height'] = $store_info['config_image_thumb_height'];
		} else {
			$data['config_image_thumb_height'] = 228;
		}

		if (isset($this->request->post['config_image_popup_width'])) {
			$data['config_image_popup_width'] = $this->request->post['config_image_popup_width'];
		} elseif (isset($store_info['config_image_popup_width'])) {
			$data['config_image_popup_width'] = $store_info['config_image_popup_width'];
		} else {
			$data['config_image_popup_width'] = 500;
		}

		if (isset($this->request->post['config_image_popup_height'])) {
			$data['config_image_popup_height'] = $this->request->post['config_image_popup_height'];
		} elseif (isset($store_info['config_image_popup_height'])) {
			$data['config_image_popup_height'] = $store_info['config_image_popup_height'];
		} else {
			$data['config_image_popup_height'] = 500;
		}

		if (isset($this->request->post['config_image_product_width'])) {
			$data['config_image_product_width'] = $this->request->post['config_image_product_width'];
		} elseif (isset($store_info['config_image_product_width'])) {
			$data['config_image_product_width'] = $store_info['config_image_product_width'];
		} else {
			$data['config_image_product_width'] = 80;
		}

		if (isset($this->request->post['config_image_product_height'])) {
			$data['config_image_product_height'] = $this->request->post['config_image_product_height'];
		} elseif (isset($store_info['config_image_product_height'])) {
			$data['config_image_product_height'] = $store_info['config_image_product_height'];
		} else {
			$data['config_image_product_height'] = 80;
		}

		if (isset($this->request->post['config_image_category_width'])) {
			$data['config_image_category_width'] = $this->request->post['config_image_category_width'];
		} elseif (isset($store_info['config_image_category_width'])) {
			$data['config_image_category_width'] = $store_info['config_image_category_width'];
		} else {
			$data['config_image_category_width'] = 80;
		}

		if (isset($this->request->post['config_image_additional_width'])) {
			$data['config_image_additional_width'] = $this->request->post['config_image_additional_width'];
		} elseif (isset($store_info['config_image_additional_width'])) {
			$data['config_image_additional_width'] = $store_info['config_image_additional_width'];
		} else {
			$data['config_image_additional_width'] = 74;
		}

		if (isset($this->request->post['config_image_additional_height'])) {
			$data['config_image_additional_height'] = $this->request->post['config_image_additional_height'];
		} elseif (isset($store_info['config_image_additional_height'])) {
			$data['config_image_additional_height'] = $store_info['config_image_additional_height'];
		} else {
			$data['config_image_additional_height'] = 74;
		}

		if (isset($this->request->post['config_image_related_width'])) {
			$data['config_image_related_width'] = $this->request->post['config_image_related_width'];
		} elseif (isset($store_info['config_image_related_width'])) {
			$data['config_image_related_width'] = $store_info['config_image_related_width'];
		} else {
			$data['config_image_related_width'] = 80;
		}

		if (isset($this->request->post['config_image_related_height'])) {
			$data['config_image_related_height'] = $this->request->post['config_image_related_height'];
		} elseif (isset($store_info['config_image_related_height'])) {
			$data['config_image_related_height'] = $store_info['config_image_related_height'];
		} else {
			$data['config_image_related_height'] = 80;
		}

		if (isset($this->request->post['config_image_compare_width'])) {
			$data['config_image_compare_width'] = $this->request->post['config_image_compare_width'];
		} elseif (isset($store_info['config_image_compare_width'])) {
			$data['config_image_compare_width'] = $store_info['config_image_compare_width'];
		} else {
			$data['config_image_compare_width'] = 90;
		}

		if (isset($this->request->post['config_image_compare_height'])) {
			$data['config_image_compare_height'] = $this->request->post['config_image_compare_height'];
		} elseif (isset($store_info['config_image_compare_height'])) {
			$data['config_image_compare_height'] = $store_info['config_image_compare_height'];
		} else {
			$data['config_image_compare_height'] = 90;
		}

		if (isset($this->request->post['config_image_wishlist_width'])) {
			$data['config_image_wishlist_width'] = $this->request->post['config_image_wishlist_width'];
		} elseif (isset($store_info['config_image_wishlist_width'])) {
			$data['config_image_wishlist_width'] = $store_info['config_image_wishlist_width'];
		} else {
			$data['config_image_wishlist_width'] = 50;
		}

		if (isset($this->request->post['config_image_wishlist_height'])) {
			$data['config_image_wishlist_height'] = $this->request->post['config_image_wishlist_height'];
		} elseif (isset($store_info['config_image_wishlist_height'])) {
			$data['config_image_wishlist_height'] = $store_info['config_image_wishlist_height'];
		} else {
			$data['config_image_wishlist_height'] = 50;
		}

		if (isset($this->request->post['config_image_cart_width'])) {
			$data['config_image_cart_width'] = $this->request->post['config_image_cart_width'];
		} elseif (isset($store_info['config_image_cart_width'])) {
			$data['config_image_cart_width'] = $store_info['config_image_cart_width'];
		} else {
			$data['config_image_cart_width'] = 80;
		}

		if (isset($this->request->post['config_image_cart_height'])) {
			$data['config_image_cart_height'] = $this->request->post['config_image_cart_height'];
		} elseif (isset($store_info['config_image_cart_height'])) {
			$data['config_image_cart_height'] = $store_info['config_image_cart_height'];
		} else {
			$data['config_image_cart_height'] = 80;
		}

		if (isset($this->request->post['config_image_location_width'])) {
			$data['config_image_location_width'] = $this->request->post['config_image_location_width'];
		} elseif (isset($store_info['config_image_location_width'])) {
			$data['config_image_location_width'] = $store_info['config_image_location_width'];
		} else {
			$data['config_image_location_width'] = 240;
		}

		if (isset($this->request->post['config_image_location_height'])) {
			$data['config_image_location_height'] = $this->request->post['config_image_location_height'];
		} elseif (isset($store_info['config_image_location_height'])) {
			$data['config_image_location_height'] = $store_info['config_image_location_height'];
		} else {
			$data['config_image_location_height'] = 180;
		}

		if (isset($this->request->post['config_secure'])) {
			$data['config_secure'] = $this->request->post['config_secure'];
		} elseif (isset($store_info['config_secure'])) {
			$data['config_secure'] = $store_info['config_secure'];
		} else {
			$data['config_secure'] = '';
		}

		if (isset($this->request->post['config_commission'])) {
			$data['config_commission'] = $this->request->post['config_commission'];
		} elseif (isset($store_info['config_commission'])) {
			$data['config_commission'] = $store_info['config_commission'];
		} else {
			$data['config_commission'] = (int)$this->config->get('config_commission_default');
		}
		
		if (isset($this->request->post['config_payacc'])) {
			$data['config_payacc'] = $this->request->post['config_payacc'];
		} elseif (isset($store_info['config_payacc'])) {
			$data['config_payacc'] = $store_info['config_payacc'];
		} else {
			$data['config_payacc'] = '';
		}

        /**
         *Ajax advanced search starts
         */
        $this->document->addStyle('view/javascript/colorpicker/css/colorpicker.css');
        $this->document->addScript('view/javascript/colorpicker/js/colorpicker.js');
        /**
         *Ajax advanced search ends
         */

        /**
         *Ajax advanced search starts
         */
        if (isset($this->request->post['config_ajaxadvancedsearch'])) {
            $data['config_ajaxadvancedsearch'] = $this->request->post['config_ajaxadvancedsearch'];
        } else {
            $data['config_ajaxadvancedsearch'] = $this->config->get('config_ajaxadvancedsearch');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_limit'])) {
            $data['config_ajaxadvancedsearch_limit'] = $this->request->post['config_ajaxadvancedsearch_limit'];
        } else {
            $data['config_ajaxadvancedsearch_limit'] = $this->config->get('config_ajaxadvancedsearch_limit');
        }

        if (isset($this->request->post['config_ajaxadvancedsearch_image'])) {
            $data['config_ajaxadvancedsearch_image'] = $this->request->post['config_ajaxadvancedsearch_image'];
        } else {
            $data['config_ajaxadvancedsearch_image'] = $this->config->get('config_ajaxadvancedsearch_image');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_image_width'])) {
            $data['config_ajaxadvancedsearch_image_width'] = $this->request->post['config_ajaxadvancedsearch_image_width'];
        } else {
            $data['config_ajaxadvancedsearch_image_width'] = $this->config->get('config_ajaxadvancedsearch_image_width');
        }
        /**26-01-2015 starts*/
        if (isset($this->request->post['config_ajaxadvancedsearch_result_view'])) {
            $data['config_ajaxadvancedsearch_result_view'] = $this->request->post['config_ajaxadvancedsearch_result_view'];
        } else {
            $data['config_ajaxadvancedsearch_result_view'] = $this->config->get('config_ajaxadvancedsearch_result_view');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_displayallresults'])) {
            $data['config_ajaxadvancedsearch_displayallresults'] = $this->request->post['config_ajaxadvancedsearch_displayallresults'];
        } else {
            $data['config_ajaxadvancedsearch_displayallresults'] = $this->config->get('config_ajaxadvancedsearch_displayallresults');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_colorenabletall'])) {
            $data['config_ajaxadvancedsearch_colorenabletall'] = $this->request->post['config_ajaxadvancedsearch_colorenabletall'];
        } else {
            $data['config_ajaxadvancedsearch_colorenabletall'] = $this->config->get('config_ajaxadvancedsearch_colorenabletall');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_colordefaultall'])) {
            $data['config_ajaxadvancedsearch_colordefaultall'] = $this->request->post['config_ajaxadvancedsearch_colordefaultall'];
        } else {
            $data['config_ajaxadvancedsearch_colordefaultall'] = $this->config->get('config_ajaxadvancedsearch_colordefaultall');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_default'])) {
            $data['config_ajaxadvancedsearch_color_default'] = $this->request->post['config_ajaxadvancedsearch_color_default'];
        } else {
            $data['config_ajaxadvancedsearch_color_default'] = $this->config->get('config_ajaxadvancedsearch_color_default');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_defaulthover'])) {
            $data['config_ajaxadvancedsearch_color_defaulthover'] = $this->request->post['config_ajaxadvancedsearch_color_defaulthover'];
        } else {
            $data['config_ajaxadvancedsearch_color_defaulthover'] = $this->config->get('config_ajaxadvancedsearch_color_defaulthover');
        }

        if (isset($this->request->post['config_ajaxadvancedsearch_color_heading'])) {
            $data['config_ajaxadvancedsearch_color_heading'] = $this->request->post['config_ajaxadvancedsearch_color_heading'];
        } else {
            $data['config_ajaxadvancedsearch_color_heading'] = $this->config->get('config_ajaxadvancedsearch_color_heading');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_headinghover'])) {
            $data['config_ajaxadvancedsearch_color_headinghover'] = $this->request->post['config_ajaxadvancedsearch_color_headinghover'];
        } else {
            $data['config_ajaxadvancedsearch_color_headinghover'] = $this->config->get('config_ajaxadvancedsearch_color_headinghover');
        }

        if (isset($this->request->post['config_ajaxadvancedsearch_color_model'])) {
            $data['config_ajaxadvancedsearch_color_model'] = $this->request->post['config_ajaxadvancedsearch_color_model'];
        } else {
            $data['config_ajaxadvancedsearch_color_model'] = $this->config->get('config_ajaxadvancedsearch_color_model');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_modelhover'])) {
            $data['config_ajaxadvancedsearch_color_modelhover'] = $this->request->post['config_ajaxadvancedsearch_color_modelhover'];
        } else {
            $data['config_ajaxadvancedsearch_color_modelhover'] = $this->config->get('config_ajaxadvancedsearch_color_modelhover');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_manufacturer'])) {
            $data['config_ajaxadvancedsearch_color_manufacturer'] = $this->request->post['config_ajaxadvancedsearch_color_manufacturer'];
        } else {
            $data['config_ajaxadvancedsearch_color_manufacturer'] = $this->config->get('config_ajaxadvancedsearch_color_manufacturer');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_manufacturerhover'])) {
            $data['config_ajaxadvancedsearch_color_manufacturerhover'] = $this->request->post['config_ajaxadvancedsearch_color_manufacturerhover'];
        } else {
            $data['config_ajaxadvancedsearch_color_manufacturerhover'] = $this->config->get('config_ajaxadvancedsearch_color_manufacturerhover');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_price'])) {
            $data['config_ajaxadvancedsearch_color_price'] = $this->request->post['config_ajaxadvancedsearch_color_price'];
        } else {
            $data['config_ajaxadvancedsearch_color_price'] = $this->config->get('config_ajaxadvancedsearch_color_price');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_pricehover'])) {
            $data['config_ajaxadvancedsearch_color_pricehover'] = $this->request->post['config_ajaxadvancedsearch_color_pricehover'];
        } else {
            $data['config_ajaxadvancedsearch_color_pricehover'] = $this->config->get('config_ajaxadvancedsearch_color_pricehover');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_stockstatus'])) {
            $data['config_ajaxadvancedsearch_color_stockstatus'] = $this->request->post['config_ajaxadvancedsearch_color_stockstatus'];
        } else {
            $data['config_ajaxadvancedsearch_color_stockstatus'] = $this->config->get('config_ajaxadvancedsearch_color_stockstatus');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_stockstatushover'])) {
            $data['config_ajaxadvancedsearch_color_stockstatushover'] = $this->request->post['config_ajaxadvancedsearch_color_stockstatushover'];
        } else {
            $data['config_ajaxadvancedsearch_color_stockstatushover'] = $this->config->get('config_ajaxadvancedsearch_color_stockstatushover');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_quantity'])) {
            $data['config_ajaxadvancedsearch_color_quantity'] = $this->request->post['config_ajaxadvancedsearch_color_quantity'];
        } else {
            $data['config_ajaxadvancedsearch_color_quantity'] = $this->config->get('config_ajaxadvancedsearch_color_quantity');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_quantityhover'])) {
            $data['config_ajaxadvancedsearch_color_quantityhover'] = $this->request->post['config_ajaxadvancedsearch_color_quantityhover'];
        } else {
            $data['config_ajaxadvancedsearch_color_quantityhover'] = $this->config->get('config_ajaxadvancedsearch_color_quantityhover');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_evenresult'])) {
            $data['config_ajaxadvancedsearch_color_evenresult'] = $this->request->post['config_ajaxadvancedsearch_color_evenresult'];
        } else {
            $data['config_ajaxadvancedsearch_color_evenresult'] = $this->config->get('config_ajaxadvancedsearch_color_evenresult');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_oddresult'])) {
            $data['config_ajaxadvancedsearch_color_oddresult'] = $this->request->post['config_ajaxadvancedsearch_color_oddresult'];
        } else {
            $data['config_ajaxadvancedsearch_color_oddresult'] = $this->config->get('config_ajaxadvancedsearch_color_oddresult');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_resulthover'])) {
            $data['config_ajaxadvancedsearch_color_resulthover'] = $this->request->post['config_ajaxadvancedsearch_color_resulthover'];
        } else {
            $data['config_ajaxadvancedsearch_color_resulthover'] = $this->config->get('config_ajaxadvancedsearch_color_resulthover');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_highlight'])) {
            $data['config_ajaxadvancedsearch_color_highlight'] = $this->request->post['config_ajaxadvancedsearch_color_highlight'];
        } else {
            $data['config_ajaxadvancedsearch_color_highlight'] = $this->config->get('config_ajaxadvancedsearch_color_highlight');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_color_highlighthover'])) {
            $data['config_ajaxadvancedsearch_color_highlighthover'] = $this->request->post['config_ajaxadvancedsearch_color_highlighthover'];
        } else {
            $data['config_ajaxadvancedsearch_color_highlighthover'] = $this->config->get('config_ajaxadvancedsearch_color_highlighthover');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_quantity'])) {
            $data['config_ajaxadvancedsearch_quantity'] = $this->request->post['config_ajaxadvancedsearch_quantity'];
        } else {
            $data['config_ajaxadvancedsearch_quantity'] = $this->config->get('config_ajaxadvancedsearch_quantity');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_charlimit'])) {
            $data['config_ajaxadvancedsearch_charlimit'] = $this->request->post['config_ajaxadvancedsearch_charlimit'];
        } else {
            $data['config_ajaxadvancedsearch_charlimit'] = $this->config->get('config_ajaxadvancedsearch_charlimit');
        }

        /** 26-01-2015 ends */
        if (isset($this->request->post['config_ajaxadvancedsearch_image_height'])) {
            $data['config_ajaxadvancedsearch_image_height'] = $this->request->post['config_ajaxadvancedsearch_image_height'];
        } else {
            $data['config_ajaxadvancedsearch_image_height'] = $this->config->get('config_ajaxadvancedsearch_image_height');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_model'])) {
            $data['config_ajaxadvancedsearch_model'] = $this->request->post['config_ajaxadvancedsearch_model'];
        } else {
            $data['config_ajaxadvancedsearch_model'] = $this->config->get('config_ajaxadvancedsearch_model');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_descr'])) {
            $data['config_ajaxadvancedsearch_descr'] = $this->request->post['config_ajaxadvancedsearch_descr'];
        } else {
            $data['config_ajaxadvancedsearch_descr'] = $this->config->get('config_ajaxadvancedsearch_descr');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_manufacturer'])) {
            $data['config_ajaxadvancedsearch_manufacturer'] = $this->request->post['config_ajaxadvancedsearch_manufacturer'];
        } else {
            $data['config_ajaxadvancedsearch_manufacturer'] = $this->config->get('config_ajaxadvancedsearch_manufacturer');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_price'])) {
            $data['config_ajaxadvancedsearch_price'] = $this->request->post['config_ajaxadvancedsearch_price'];
        } else {
            $data['config_ajaxadvancedsearch_price'] = $this->config->get('config_ajaxadvancedsearch_price');
        }
        /**Cusomer group price show starts*/
        if (isset($this->request->post['config_ajaxadvancedsearch_pricelogin'])) {
            $data['config_ajaxadvancedsearch_pricelogin'] = $this->request->post['config_ajaxadvancedsearch_pricelogin'];
        } else {
            $data['config_ajaxadvancedsearch_pricelogin'] = $this->config->get('config_ajaxadvancedsearch_pricelogin');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_customergroups'])) {
            $data['config_ajaxadvancedsearch_customergroups'] = $this->request->post['config_ajaxadvancedsearch_customergroups'];
        } else if(!is_null($this->config->get('config_ajaxadvancedsearch_customergroups'))) {
            $data['config_ajaxadvancedsearch_customergroups'] = $this->config->get('config_ajaxadvancedsearch_customergroups');
        }else {
            $data['config_ajaxadvancedsearch_customergroups'] = array();
        }
        /**Cusomer group price show ends*/
        if (isset($this->request->post['config_ajaxadvancedsearch_rating'])) {
            $data['config_ajaxadvancedsearch_rating'] = $this->request->post['config_ajaxadvancedsearch_rating'];
        } else {
            $data['config_ajaxadvancedsearch_rating'] = $this->config->get('config_ajaxadvancedsearch_rating');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_stock'])) {
            $data['config_ajaxadvancedsearch_stock'] = $this->request->post['config_ajaxadvancedsearch_stock'];
        } else {
            $data['config_ajaxadvancedsearch_stock'] = $this->config->get('config_ajaxadvancedsearch_stock');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_model_search'])) {
            $data['config_ajaxadvancedsearch_model_search'] = $this->request->post['config_ajaxadvancedsearch_model_search'];
        } else {
            $data['config_ajaxadvancedsearch_model_search'] = $this->config->get('config_ajaxadvancedsearch_model_search');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_tag'])) {
            $data['config_ajaxadvancedsearch_tag'] = $this->request->post['config_ajaxadvancedsearch_tag'];
        } else {
            $data['config_ajaxadvancedsearch_tag'] = $this->config->get('config_ajaxadvancedsearch_tag');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_mpn'])) {
            $data['config_ajaxadvancedsearch_mpn'] = $this->request->post['config_ajaxadvancedsearch_mpn'];
        } else {
            $data['config_ajaxadvancedsearch_mpn'] = $this->config->get('config_ajaxadvancedsearch_mpn');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_manufacturer_search'])) {
            $data['config_ajaxadvancedsearch_manufacturer_search'] = $this->request->post['config_ajaxadvancedsearch_manufacturer_search'];
        } else {
            $data['config_ajaxadvancedsearch_manufacturer_search'] = $this->config->get('config_ajaxadvancedsearch_manufacturer_search');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_isbn'])) {
            $data['config_ajaxadvancedsearch_isbn'] = $this->request->post['config_ajaxadvancedsearch_isbn'];
        } else {
            $data['config_ajaxadvancedsearch_isbn'] = $this->config->get('config_ajaxadvancedsearch_isbn');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_jan'])) {
            $data['config_ajaxadvancedsearch_jan'] = $this->request->post['config_ajaxadvancedsearch_jan'];
        } else {
            $data['config_ajaxadvancedsearch_jan'] = $this->config->get('config_ajaxadvancedsearch_jan');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_ean'])) {
            $data['config_ajaxadvancedsearch_ean'] = $this->request->post['config_ajaxadvancedsearch_ean'];
        } else {
            $data['config_ajaxadvancedsearch_ean'] = $this->config->get('config_ajaxadvancedsearch_ean');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_upc'])) {
            $data['config_ajaxadvancedsearch_upc'] = $this->request->post['config_ajaxadvancedsearch_upc'];
        } else {
            $data['config_ajaxadvancedsearch_upc'] = $this->config->get('config_ajaxadvancedsearch_upc');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_sku'])) {
            $data['config_ajaxadvancedsearch_sku'] = $this->request->post['config_ajaxadvancedsearch_sku'];
        } else {
            $data['config_ajaxadvancedsearch_sku'] = $this->config->get('config_ajaxadvancedsearch_sku');
        }
        if (isset($this->request->post['config_ajaxadvancedsearch_highlight'])) {
            $data['config_ajaxadvancedsearch_highlight'] = $this->request->post['config_ajaxadvancedsearch_highlight'];
        } else {
            $data['config_ajaxadvancedsearch_highlight'] = $this->config->get('config_ajaxadvancedsearch_highlight');
        }
        /**
         *Ajax advanced search ends
         */


        $data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('setting/store_form.tpl', $data));
	}

	public function vendors() {
		$this->load->language('setting/vendor');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/store');

		$this->getVendorsList();
	}

	protected function getVendorsList() { 
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}

		if (isset($this->request->get['filter_email'])) {
			$filter_email = $this->request->get['filter_email'];
		} else {
			$filter_email = null;
		}

		if (isset($this->request->get['filter_store'])) {
			$filter_store = $this->request->get['filter_store'];
		} else {
			$filter_store = null;
		}

		if (isset($this->request->get['filter_ip'])) {
			$filter_ip = $this->request->get['filter_ip'];
		} else {
			$filter_ip = null;
		}

		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}	

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}	

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_store'])) {
			$url .= '&filter_store=' . $this->request->get['filter_store'];
		}

		if (isset($this->request->get['filter_ip'])) {
			$url .= '&filter_ip=' . $this->request->get['filter_ip'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('setting/store/vendors', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['add'] = $this->url->link('setting/store/add', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$data['delete'] = '';

		$data['vendors'] = array();

		$filter_data = array(
			'filter_name'              => $filter_name,
			'filter_email'             => $filter_email,
			'filter_store'            => $filter_store,
			'filter_date_added'        => $filter_date_added,
			'filter_ip'                => $filter_ip,
			'sort'                     => $sort,
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
		);

		$vendor_total = $this->model_setting_store->getTotalVendors($filter_data);

		$results = $this->model_setting_store->getVendors($filter_data);

		foreach ($results as $result) {

			$data['vendors'][] = array(
				'vendor_id'    => $result['user_id'],
				'store_id'      => $result['store_id'],
				'name'           => $result['vendor'],
				'email'          => $result['email'],	
				'store'          => ucfirst($result['name']),				
				'ip'             => $result['ip'],
				'date_added'     => date($this->language->get('date_format_short'), strtotime($result['date_added'])),				
				'edit'           => $this->url->link('setting/store/edit', 'token=' . $this->session->data['token'] . '&store_id=' . $result['store_id'] . $url, 'SSL')
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_list'] = $this->language->get('text_list');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_default'] = $this->language->get('text_default');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_email'] = $this->language->get('column_email');
		$data['column_store'] = $this->language->get('column_store');
		$data['column_customer_group'] = $this->language->get('column_customer_group');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_approved'] = $this->language->get('column_approved');
		$data['column_ip'] = $this->language->get('column_ip');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_action'] = $this->language->get('column_action');
		
		$data['button_approve'] = $this->language->get('button_approve');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_filter'] = $this->language->get('button_filter');
		$data['button_login'] = $this->language->get('button_login');
		$data['button_unlock'] = $this->language->get('button_unlock');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_store'] = $this->language->get('entry_store');
		$data['entry_date_added'] = $this->language->get('entry_date_added');

		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_store'])) {
			$url .= '&filter_store=' . $this->request->get['filter_store'];
		}

		if (isset($this->request->get['filter_ip'])) {
			$url .= '&filter_ip=' . $this->request->get['filter_ip'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('setting/store/vendors', 'token=' . $this->session->data['token'] . '&sort=name' . $url, 'SSL');
		$data['sort_email'] = $this->url->link('setting/store/vendors', 'token=' . $this->session->data['token'] . '&sort=email' . $url, 'SSL');		
		$data['sort_store'] = $this->url->link('setting/store/vendors', 'token=' . $this->session->data['token'] . '&sort=store' . $url, 'SSL');
		$data['sort_ip'] = $this->url->link('setting/store/vendors', 'token=' . $this->session->data['token'] . '&sort=m.ip' . $url, 'SSL');
		$data['sort_date_added'] = $this->url->link('setting/store/vendors', 'token=' . $this->session->data['token'] . '&sort=m.date_added' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_store'])) {
			$url .= '&filter_store=' . $this->request->get['filter_store'];
		}

		if (isset($this->request->get['filter_ip'])) {
			$url .= '&filter_ip=' . $this->request->get['filter_ip'];
		}

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $vendor_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('setting/store/vendors', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($vendor_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($vendor_total - $this->config->get('config_limit_admin'))) ? $vendor_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $vendor_total, ceil($vendor_total / $this->config->get('config_limit_admin')));

		$data['filter_name'] = $filter_name;
		$data['filter_email'] = $filter_email;		
		$data['filter_store'] = $filter_store;		
		$data['filter_ip'] = $filter_ip;
		$data['filter_date_added'] = $filter_date_added;				

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('setting/vendor_list.tpl', $data));
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'setting/store')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

        /**
         *Ajax advanced search starts
         */
        if (($this->request->post['config_ajaxadvancedsearch_image_width'] < 25 || $this->request->post['config_ajaxadvancedsearch_image_width'] > 100) || ($this->request->post['config_ajaxadvancedsearch_image_height'] < 25 || $this->request->post['config_ajaxadvancedsearch_image_height'] > 100)) {
            $this->error['config_ajaxadvancedsearch_image'] = sprintf( $this->language->get('error_config_ajaxadvancedsearch_image'),25,100);
        }
        /**
         *Ajax advanced search ends
         */


        if (!$this->request->post['config_url']) {
			$this->error['url'] = $this->language->get('error_url');
		}

        if (!$this->request->post['config_name']) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if ((utf8_strlen($this->request->post['config_owner']) < 3) || (utf8_strlen($this->request->post['config_owner']) > 64)) {
			$this->error['owner'] = $this->language->get('error_owner');
		}

		if ((utf8_strlen(trim($this->request->post['firstname'])) < 1) || (utf8_strlen(trim($this->request->post['firstname'])) > 32)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}

		if ((utf8_strlen(trim($this->request->post['lastname'])) < 1) || (utf8_strlen(trim($this->request->post['lastname'])) > 32)) {
			$this->error['lastname'] = $this->language->get('error_lastname');
		}

		if ($this->request->post['password'] || (!isset($this->request->get['store_id']))) {
			if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
				$this->error['password'] = $this->language->get('error_password');
			}

			if ($this->request->post['password'] != $this->request->post['confirm']) {
				$this->error['confirm'] = $this->language->get('error_confirm');
			}
		}

		if ((utf8_strlen($this->request->post['config_address']) < 3) || (utf8_strlen($this->request->post['config_address']) > 256)) {
			$this->error['address'] = $this->language->get('error_address');
		}

		if (!isset($this->request->get['store_id'])) {

			if ((utf8_strlen($this->request->post['config_email']) > 96) || !preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['config_email'])) {
				$this->error['email'] = $this->language->get('error_email');
			}
	
			if ($this->model_setting_store->getTotalVendorsByEmail($this->request->post['config_email'])) {
				$this->error['email'] = $this->language->get('error_exists');
			}
		}

		if ((utf8_strlen($this->request->post['config_telephone']) < 3) || (utf8_strlen($this->request->post['config_telephone']) > 32)) {
			$this->error['telephone'] = $this->language->get('error_telephone');
		}

		if (!$this->request->post['config_meta_title']) {
			$this->error['meta_title'] = $this->language->get('error_meta_title');
		}

		if (!empty($this->request->post['config_customer_group_display']) && !in_array($this->request->post['config_customer_group_id'], $this->request->post['config_customer_group_display'])) {
			$this->error['customer_group_display'] = $this->language->get('error_customer_group_display');
		}

		if (!$this->request->post['config_image_category_width'] || !$this->request->post['config_image_category_height']) {
			$this->error['image_category'] = $this->language->get('error_image_category');
		}

		if (!$this->request->post['config_image_thumb_width'] || !$this->request->post['config_image_thumb_height']) {
			$this->error['image_thumb'] = $this->language->get('error_image_thumb');
		}

		if (!$this->request->post['config_image_popup_width'] || !$this->request->post['config_image_popup_height']) {
			$this->error['image_popup'] = $this->language->get('error_image_popup');
		}

		if (!$this->request->post['config_image_product_width'] || !$this->request->post['config_image_product_height']) {
			$this->error['image_product'] = $this->language->get('error_image_product');
		}

		if (!$this->request->post['config_image_additional_width'] || !$this->request->post['config_image_additional_height']) {
			$this->error['image_additional'] = $this->language->get('error_image_additional');
		}

		if (!$this->request->post['config_image_related_width'] || !$this->request->post['config_image_related_height']) {
			$this->error['image_related'] = $this->language->get('error_image_related');
		}

		if (!$this->request->post['config_image_compare_width'] || !$this->request->post['config_image_compare_height']) {
			$this->error['image_compare'] = $this->language->get('error_image_compare');
		}

		if (!$this->request->post['config_image_wishlist_width'] || !$this->request->post['config_image_wishlist_height']) {
			$this->error['image_wishlist'] = $this->language->get('error_image_wishlist');
		}

		if (!$this->request->post['config_image_cart_width'] || !$this->request->post['config_image_cart_height']) {
			$this->error['image_cart'] = $this->language->get('error_image_cart');
		}

		if (!$this->request->post['config_image_location_width'] || !$this->request->post['config_image_location_height']) {
			$this->error['image_location'] = $this->language->get('error_image_location');
		}

		if (!$this->request->post['config_product_limit']) {
			$this->error['product_limit'] = $this->language->get('error_limit');
		}

		if (!$this->request->post['config_product_description_length']) {
			$this->error['product_description_length'] = $this->language->get('error_limit');
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		return !$this->error;
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'setting/store')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		$this->load->model('sale/order');

		foreach ($this->request->post['selected'] as $store_id) {
			if (!$store_id) {
				$this->error['warning'] = $this->language->get('error_default');
			}

			$store_total = $this->model_sale_order->getTotalOrdersByStoreId($store_id);

			if ($store_total) {
				$this->error['warning'] = sprintf($this->language->get('error_store'), $store_total);
			}
		}

		return !$this->error;
	}

	public function template() {
		if ($this->request->server['HTTPS']) {
			$server = HTTPS_CATALOG;
		} else {
			$server = HTTP_CATALOG;
		}

        if (is_file(DIR_IMAGE . 'templates/' . basename($this->request->get['template']) . '.png')) {
			$this->response->setOutput($server . 'image/templates/' . basename($this->request->get['template']) . '.png');
		} else {
			$this->response->setOutput($server . 'image/no_image.jpg');
		}
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
