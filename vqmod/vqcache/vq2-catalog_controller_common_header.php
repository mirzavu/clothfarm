<?php
class ControllerCommonHeader extends Controller {

                    /**
                        *Ajax advanced search starts
                        */
                    public function ajaxLiveSearch() {
                        $json = array();
                        $explode =explode(',',$this->request->get['filter_name']);
                        $this->request->get['filter_name'] =html_entity_decode(implode('', $explode), ENT_QUOTES, 'UTF-8');

                        if(!empty($this->request->get['filter_name'])){
                            $this->load->model('catalog/product');
                            $this->load->model('tool/image');

                            $filter_mpn = ($this->config->get('config_ajaxadvancedsearch_mpn')) ? true : false;
                            $filter_manufacturer = ($this->config->get('config_ajaxadvancedsearch_manufacturer_search')) ? true : false;
                            $filter_isbn = ($this->config->get('config_ajaxadvancedsearch_isbn')) ? true : false;
                            $filter_jan = ($this->config->get('config_ajaxadvancedsearch_jan')) ? true : false;
                            $filter_ean = ($this->config->get('config_ajaxadvancedsearch_ean')) ? true : false;
                            $filter_upc = ($this->config->get('config_ajaxadvancedsearch_upc')) ? true : false;
                            $filter_sku = ($this->config->get('config_ajaxadvancedsearch_sku')) ? true : false;
                            $filter_model = ($this->config->get('config_ajaxadvancedsearch_model_search')) ? true : false;
                            $filter_tag = ($this->config->get('config_ajaxadvancedsearch_tag')) ? true : false;

                            $filterdata=array(
                                'filter_name' => $this->request->get['filter_name'],
                                'filter_mpn' => $filter_mpn,
                                'filter_manufacturer' => $filter_manufacturer,
                                'filter_isbn' => $filter_isbn,
                                'filter_jan' => $filter_jan,
                                'filter_ean' => $filter_ean,
                                'filter_upc' => $filter_upc,
                                'filter_sku' => $filter_sku,
                                'filter_model' => $filter_model,
                                'filter_tag' => $filter_tag,
                                'start' => 0,
                                'limit' =>  ($this->config->get('config_ajaxadvancedsearch_limit')!=0) ? $this->config->get('config_ajaxadvancedsearch_limit') : 5,
                            );
                            $results = (array) $this->model_catalog_product->ajaxLiveSearch($filterdata);
                            foreach($results as $result){
                                $width = 100;
                                $height = 100;
                                if($this->config->get('config_ajaxadvancedsearch_image_width')!='' && $this->config->get('config_ajaxadvancedsearch_image_height')!=''){
                                    $width = $this->config->get('config_ajaxadvancedsearch_image_width');
                                    $height = $this->config->get('config_ajaxadvancedsearch_image_height');
                                }
                                if(!empty($result['image'])&&file_exists(DIR_IMAGE .$result['image'])){
                                    $image = $this->model_tool_image->resize($result['image'],$width,$height);
                                }else if(file_exists(DIR_IMAGE .'data/logo.png')){
                                    $image = $this->model_tool_image->resize('data/logo.png',$width,$height);
                                }else{
                                    $image = $this->model_tool_image->resize('no_image.jpg',$width,$height);
                                }
                                // no highlight
                                $highlight = false;
                                if($this->config->get('config_ajaxadvancedsearch_highlight')!='' && $this->config->get('config_ajaxadvancedsearch_highlight')==1){
                                    // seperate highlight
                                    $highlight = 'seperate';
                                }else if($this->config->get('config_ajaxadvancedsearch_highlight')!='' && $this->config->get('config_ajaxadvancedsearch_highlight')==2){
                                    // combine highlight
                                    $highlight = 'combine';
                                }
                                $name='';
                                $model='';
                                $manufacturer='';
                                if($highlight == 'seperate'){
                                    $breakchars = array_map('strtolower',array_unique($explode));
                                    $name = html_entity_decode ($result['name'], ENT_QUOTES, 'UTF-8');
                                    $model = html_entity_decode ($result['model'], ENT_QUOTES, 'UTF-8');
                                    $manufacturer = html_entity_decode ($result['manufacturer'], ENT_QUOTES, 'UTF-8');
                                    foreach($breakchars as $breakchar){
                                        $breakchar = html_entity_decode ($breakchar, ENT_QUOTES, 'UTF-8');
                                        $name=html_entity_decode(str_ireplace($breakchar,'~'. htmlentities(substr($name,stripos($name,$breakchar),strlen($breakchar))) .'~~',$name), ENT_QUOTES, 'UTF-8');
                                        $model=html_entity_decode(str_ireplace($breakchar,'~'. htmlentities(substr($model,stripos($model,$breakchar),strlen($breakchar))) .'~~',$model), ENT_QUOTES, 'UTF-8');
                                        $manufacturer=html_entity_decode(str_ireplace($breakchar,'~'. htmlentities(substr($manufacturer,stripos($manufacturer,$breakchar),strlen($breakchar))) .'~~',$manufacturer), ENT_QUOTES, 'UTF-8');
                                    }
                                    $name= str_ireplace('~','<span class="highlight">',str_ireplace('~~','</span>',$name));
                                    $model= str_ireplace('~','<span class="highlight">',str_ireplace('~~','</span>',$model));
                                    $manufacturer= str_ireplace('~','<span class="highlight">',str_ireplace('~~','</span>',$manufacturer));

                                    /**
                                     * str_split() will not working with UTF-8 character and other non english languages like Russian, Chiness, Arabic.
                                     *
                                    foreach((array)str_split(html_entity_decode ($result['name'], ENT_QUOTES, 'UTF-8')) as $char){
                                        if(in_array(strtolower(strtoupper($char)),$breakchars)){
                                            $name.='<span class="highlight">'. htmlentities($char) .'</span>';
                                        }else{
                                            $name .= htmlentities($char);
                                        }
                                    }
                                    foreach((array)str_split(html_entity_decode ($result['model'], ENT_QUOTES, 'UTF-8')) as $char){
                                        if(in_array(strtolower(strtoupper($char)),$breakchars)){
                                            $model.='<span class="highlight">'. htmlentities($char) .'</span>';
                                        }else{
                                            $model .= htmlentities($char);
                                        }
                                    }

                                    foreach((array)str_split(html_entity_decode ($result['manufacturer'], ENT_QUOTES, 'UTF-8')) as $char){
                                        if(in_array(strtolower(strtoupper($char)),$breakchars)){
                                            $manufacturer.='<span class="highlight">'. htmlentities($char) .'</span>';
                                        }else{
                                            $manufacturer .= htmlentities($char);
                                        }
                                    }
                                */
                                }else if($highlight == 'combine'){
                                    $breakchars = array();
                                    $result['name'] = html_entity_decode ($result['name'], ENT_QUOTES, 'UTF-8');
                                    $this->request->get['filter_name'] = html_entity_decode ($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8');
                                    $name=str_ireplace($this->request->get['filter_name'],'<span class="highlight">'. htmlentities(substr($result['name'],stripos($result['name'],$this->request->get['filter_name']),strlen($this->request->get['filter_name']))) .'</span>',$result['name']);

                                    $result['model'] = html_entity_decode ($result['model'], ENT_QUOTES, 'UTF-8');
                                    $model=str_ireplace($this->request->get['filter_name'],'<span class="highlight">'. htmlentities(substr($result['model'],stripos($result['model'],$this->request->get['filter_name']),strlen($this->request->get['filter_name']))) .'</span>',$result['model']);

                                    $result['manufacturer'] = html_entity_decode ($result['manufacturer'], ENT_QUOTES, 'UTF-8');
                                    $manufacturer=str_ireplace($this->request->get['filter_name'],'<span class="highlight">'. htmlentities(substr($result['manufacturer'],stripos($result['manufacturer'],$this->request->get['filter_name']),strlen($this->request->get['filter_name']))) .'</span>',$result['manufacturer']);
                                }else{
                                    $breakchars = array();
                                    $name=$result['name'];
                                    $model=$result['model'];
                                    $manufacturer=$result['manufacturer'];
                                }
                                /***Cusomer group price show starts*/
                                $showprice=false;
                                if($this->config->get('config_ajaxadvancedsearch_price')) {
                                    if($this->config->get('config_ajaxadvancedsearch_pricelogin')) {
                                        if( !is_null($this->config->get('config_ajaxadvancedsearch_customergroups')) && in_array($this->customer->getGroupId(),$this->config->get('config_ajaxadvancedsearch_customergroups'))){
                                            $showprice=true;
                                        }
                                    }else {
                                        $showprice=true;
                                    }
                                }


                                $price=false;
                                if($showprice){
                                    $price=$this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
                                }
                                /***Cusomer group price show ends*/
                                $json[] = array(
                                    'product_id' => $result['product_id'],
                                    'name' => $name,
                                    // seo friendly starts
                                    'url' => $this->url->link('product/product','product_id='.$result['product_id'],'SSL'),
                                    // seo friendly ends
                                    'name1' => $result['name'],
                                    'model' => ($this->config->get('config_ajaxadvancedsearch_model')) ? $model: false,

                                    'description' =>  ($this->config->get('config_ajaxadvancedsearch_descr')) ? utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..' : false,


                                    'stock_status' =>  ($this->config->get('config_ajaxadvancedsearch_stock')) ?  $result['stock_status'] : false,
                                    'quantity' =>  ($this->config->get('config_ajaxadvancedsearch_quantity')) ?  $result['quantity'] : false,
                                    'image' => ($this->config->get('config_ajaxadvancedsearch_image')) ? $image : false,
                                    'manufacturer' => ($this->config->get('config_ajaxadvancedsearch_manufacturer')) ?  $manufacturer : false,
                                    'price' => $price,
                                    'special' => ($this->config->get('config_ajaxadvancedsearch_price')) ? $result['special'] != 0.0000 ?  $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax'))) : 0 : false,
                                    'rating' => ($this->config->get('config_ajaxadvancedsearch_rating')) ? $result['rating'] : false,
                                    'reviews' => $result['reviews'],
                                    'allresults' => false,
                                );
                            }
                            $this->load->language('common/header');
                            if(!is_null($this->config->get('config_ajaxadvancedsearch_displayallresults')) && $this->config->get('config_ajaxadvancedsearch_displayallresults')!='' && $this->config->get('config_ajaxadvancedsearch_displayallresults')!=0 ){
                                $json[] = array(
                                    'product_id' => 0,
                                    'name' => $this->language->get('ajaxadvancedsearch_allresults'),
                                    // seo friendly starts
                                    'url' => '',
                                    // seo friendly ends
                                    'name1' => $this->language->get('ajaxadvancedsearch_allresults'),
                                    'model' =>false ,

                                    'description' =>false ,

                                    'stock_status' => false,
                                    'quantity' => false,
                                    'image' => false,
                                    'manufacturer' => false,
                                    'price' => false,
                                    'special' => false,
                                    'rating' => false,
                                    'reviews' => false,
                                    'allresults' => true,
                                );
                            }
                        }
                        $this->response->addHeader('Content-Type: application/json');
                        $this->response->setOutput(json_encode($json));
                    }
                    /**
                        *Ajax advanced search ends
                        */
                
	public function index() {

                    /**
                        *Ajax advanced search starts
                        */
                        $this->language->load('common/header');
                        $data['ajaxadvancedsearch_model'] = $this->language->get('ajaxadvancedsearch_model');
                        $data['ajaxadvancedsearch_manufacturer'] = $this->language->get('ajaxadvancedsearch_manufacturer');
                        $data['ajaxadvancedsearch_price'] = $this->language->get('ajaxadvancedsearch_price');
                        $data['ajaxadvancedsearch_stock'] = $this->language->get('ajaxadvancedsearch_stock');
                        $data['ajaxadvancedsearch_quantity'] = $this->language->get('ajaxadvancedsearch_quantity');
                        $data['ajaxadvancedsearch_rating'] = $this->language->get('ajaxadvancedsearch_rating');
                        $data['ajaxadvancedsearch_allresults'] = $this->language->get('ajaxadvancedsearch_allresults');

                        $data['ajaxadvancesearch_status'] = false;
                        $data['ajaxadvancesearch_imagewidth'] = 100;
                        $data['ajaxadvancesearch_imageheight'] = 100;
                        $data['ajaxadvancesearch_charlimit'] = 0;
                        $data['ajaxadvancedsearch_displayallresults'] = 0;
                        $data['ajaxadvancedsearch_result_view'] = 'default-view';
                        $data['ajaxadvancedsearch_color_evenresult'] = '';
                        $data['ajaxadvancedsearch_color_oddresult'] = '';
                        $data['ajaxadvancedsearch_color_resulthover'] = '';
                        $data['ajaxadvancedsearch_colordefaultall'] = false;
                        $data['ajaxadvancedsearch_color_default'] = '';
                        $data['ajaxadvancedsearch_color_defaulthover'] = '';
                        $data['ajaxadvancedsearch_color_heading'] = '';
                        $data['ajaxadvancedsearch_color_headinghover'] = '';
                        $data['ajaxadvancedsearch_color_model'] = '';
                        $data['ajaxadvancedsearch_color_modelhover'] = '';
                        $data['ajaxadvancedsearch_color_manufacturer'] = '';
                        $data['ajaxadvancedsearch_color_manufacturerhover'] = '';
                        $data['ajaxadvancedsearch_color_price'] = '';
                        $data['ajaxadvancedsearch_color_pricehover'] = '';
                        $data['ajaxadvancedsearch_color_stockstatus'] = '';
                        $data['ajaxadvancedsearch_color_stockstatushover'] = '';
                        $data['ajaxadvancedsearch_color_quantity'] = '';
                        $data['ajaxadvancedsearch_color_quantityhover'] = '';
                        $data['ajaxadvancedsearch_color_highlight'] = 'f5003a';
                        $data['ajaxadvancedsearch_color_highlighthover'] = 'f5003a';


                        if(''!=$this->config->get('config_ajaxadvancedsearch') && 1==$this->config->get('config_ajaxadvancedsearch')){
                            $data['ajaxadvancesearch_status'] =  $this->config->get('config_ajaxadvancedsearch');
                        }
                        if(''!=$this->config->get('config_ajaxadvancedsearch_image_width')){
                            $data['ajaxadvancesearch_imagewidth'] = (int)$this->config->get('config_ajaxadvancedsearch_image_width');
                        }
                        if(''!=$this->config->get('config_ajaxadvancedsearch_image_height')){
                            $data['ajaxadvancesearch_imageheight'] = (int)$this->config->get('config_ajaxadvancedsearch_image_height');
                        }
                        if(''!=$this->config->get('config_ajaxadvancedsearch_charlimit') && 0!=(int)$this->config->get('config_ajaxadvancedsearch_charlimit')){
                            $data['ajaxadvancesearch_charlimit'] = (int)$this->config->get('config_ajaxadvancedsearch_charlimit');
                        }
                        if(''!=$this->config->get('config_ajaxadvancedsearch_displayallresults') && !is_null($this->config->get('config_ajaxadvancedsearch_displayallresults'))){
                            $data['ajaxadvancedsearch_displayallresults'] = (int)$this->config->get('config_ajaxadvancedsearch_displayallresults');
                        }
                        if(''!=$this->config->get('config_ajaxadvancedsearch_result_view')){
                            $data['ajaxadvancedsearch_result_view'] = $this->config->get('config_ajaxadvancedsearch_result_view');
                        }
                        if($this->config->get('config_ajaxadvancedsearch_colorenabletall')) {
                            if(''!=$this->config->get('config_ajaxadvancedsearch_result_view') && 'default-view'!=$this->config->get('config_ajaxadvancedsearch_result_view')) {
                                $data['ajaxadvancedsearch_color_evenresult'] = 'FFFFFF';
                                $data['ajaxadvancedsearch_color_oddresult'] = 'FFFFFF';
                            }else{
                                $data['ajaxadvancedsearch_color_evenresult'] = 'FFFFFF';
                                $data['ajaxadvancedsearch_color_oddresult'] = 'eee';
                            }

                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_evenresult')){
                                $data['ajaxadvancedsearch_color_evenresult'] = $this->config->get('config_ajaxadvancedsearch_color_evenresult');
                            }
                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_oddresult')){
                                $data['ajaxadvancedsearch_color_oddresult'] = $this->config->get('config_ajaxadvancedsearch_color_oddresult');
                            }
                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_resulthover')){
                                $data['ajaxadvancedsearch_color_resulthover'] = $this->config->get('config_ajaxadvancedsearch_color_resulthover');
                            }
                            if(''!=$this->config->get('config_ajaxadvancedsearch_colordefaultall')){
                                $data['ajaxadvancedsearch_colordefaultall'] = $this->config->get('config_ajaxadvancedsearch_colordefaultall');
                            }
                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_heading')){
                                $data['ajaxadvancedsearch_color_heading'] = $this->config->get('config_ajaxadvancedsearch_color_heading');
                            }
                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_headinghover')){
                                $data['ajaxadvancedsearch_color_headinghover'] = $this->config->get('config_ajaxadvancedsearch_color_headinghover');
                            }
                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_model')){
                                $data['ajaxadvancedsearch_color_model'] = $this->config->get('config_ajaxadvancedsearch_color_model');
                            }
                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_modelhover')){
                                $data['ajaxadvancedsearch_color_modelhover'] = $this->config->get('config_ajaxadvancedsearch_color_modelhover');
                            }
                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_manufacturer')){
                                $data['ajaxadvancedsearch_color_manufacturer'] = $this->config->get('config_ajaxadvancedsearch_color_manufacturer');
                            }
                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_manufacturerhover')){
                                $data['ajaxadvancedsearch_color_manufacturerhover'] = $this->config->get('config_ajaxadvancedsearch_color_manufacturerhover');
                            }
                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_price')){
                                $data['ajaxadvancedsearch_color_price'] = $this->config->get('config_ajaxadvancedsearch_color_price');
                            }
                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_pricehover')){
                                $data['ajaxadvancedsearch_color_pricehover'] = $this->config->get('config_ajaxadvancedsearch_color_pricehover');
                            }
                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_stockstatus')){
                                $data['ajaxadvancedsearch_color_stockstatus'] = $this->config->get('config_ajaxadvancedsearch_color_stockstatus');
                            }
                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_stockstatushover')){
                                $data['ajaxadvancedsearch_color_stockstatushover'] = $this->config->get('config_ajaxadvancedsearch_color_stockstatushover');
                            }
                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_quantity')){
                                $data['ajaxadvancedsearch_color_quantity'] = $this->config->get('config_ajaxadvancedsearch_color_quantity');
                            }
                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_quantityhover')){
                                $data['ajaxadvancedsearch_color_quantityhover'] = $this->config->get('config_ajaxadvancedsearch_color_quantityhover');
                            }
                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_highlight')){
                                $data['ajaxadvancedsearch_color_highlight'] = $this->config->get('config_ajaxadvancedsearch_color_highlight');
                            }

                            if(''!=$this->config->get('config_ajaxadvancedsearch_color_highlighthover')){
                                $data['ajaxadvancedsearch_color_highlighthover'] = $this->config->get('config_ajaxadvancedsearch_color_highlighthover');
                            }

                            if($data['ajaxadvancedsearch_colordefaultall']){
                                if(''!=$this->config->get('config_ajaxadvancedsearch_color_default')){
                                    $data['ajaxadvancedsearch_color_default'] = $this->config->get('config_ajaxadvancedsearch_color_default');
                                }
                                if(''!=$this->config->get('config_ajaxadvancedsearch_color_defaulthover')){
                                    $data['ajaxadvancedsearch_color_defaulthover'] = $this->config->get('config_ajaxadvancedsearch_color_defaulthover');
                                }
                                $data['ajaxadvancedsearch_color_heading'] = $data['ajaxadvancedsearch_color_default'];
                                $data['ajaxadvancedsearch_color_headinghover'] = $data['ajaxadvancedsearch_color_defaulthover'];

                                $data['ajaxadvancedsearch_color_model'] = $data['ajaxadvancedsearch_color_default'];
                                $data['ajaxadvancedsearch_color_modelhover'] = $data['ajaxadvancedsearch_color_defaulthover'];

                                $data['ajaxadvancedsearch_color_manufacturer'] = $data['ajaxadvancedsearch_color_default'];
                                $data['ajaxadvancedsearch_color_manufacturerhover'] = $data['ajaxadvancedsearch_color_defaulthover'];

                                $data['ajaxadvancedsearch_color_price'] = $data['ajaxadvancedsearch_color_default'];
                                $data['ajaxadvancedsearch_color_pricehover'] = $data['ajaxadvancedsearch_color_defaulthover'];

                                $data['ajaxadvancedsearch_color_stockstatus'] = $data['ajaxadvancedsearch_color_default'];
                                $data['ajaxadvancedsearch_color_stockstatushover'] = $data['ajaxadvancedsearch_color_defaulthover'];

                                $data['ajaxadvancedsearch_color_quantity'] = $data['ajaxadvancedsearch_color_default'];
                                $data['ajaxadvancedsearch_color_quantityhover'] = $data['ajaxadvancedsearch_color_defaulthover'];

                            }
                        }
                        /**
                        *Ajax advanced search ends
                        */
                
		$data['title'] = $this->document->getTitle();

		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		if ($this->config->get('config_google_analytics_status')) {
			$data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
		} else {
			$data['google_analytics'] = '';
		}

		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$data['icon'] = $server . 'image/' . $this->config->get('config_icon');
		} else {
			$data['icon'] = '';
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');

		$data['text_home'] = $this->language->get('text_home');
		$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', 'SSL');
		$data['register'] = $this->url->link('account/register', '', 'SSL');
		$data['login'] = $this->url->link('account/login', '', 'SSL');
		$data['order'] = $this->url->link('account/order', '', 'SSL');
		$data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
		$data['download'] = $this->url->link('account/download', '', 'SSL');
		$data['logout'] = $this->url->link('account/logout', '', 'SSL');
		$data['shopping_cart'] = $this->url->link('checkout/cart');
		$data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');

		$status = true;

		if (isset($this->request->server['HTTP_USER_AGENT'])) {
			$robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

			foreach ($robots as $robot) {
				if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
					$status = false;

					break;
				}
			}
		}

		// Menu
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$data['categories'] = array();

		
				
				if(isset($this->request->get['route'])) {
					$route = $this->request->get['route'];
				} else {
					$route = 'common/home';
				}
				
				$route = explode("/", $route);
                
				if($this->config->get('simple_blog_status')) {
    				$this->load->model('simple_blog/article');
    				
    				$count_blog_categories = $this->model_simple_blog_article->getTotalCategories(0);
                }
    				
				if(isset($count_blog_categories) && $this->config->get('simple_blog_display_category') && $this->config->get('simple_blog_status')) {
					
					$categories = $this->model_simple_blog_article->getCategories(0);
					
					foreach ($categories as $category) {
						if ($category['top']) {
							// Level 2
							$children_data = array();

							$children = $this->model_simple_blog_article->getCategories($category['simple_blog_category_id']);
							
							foreach ($children as $child) {
								
								$article_total = $this->model_simple_blog_article->getTotalArticles($child['simple_blog_category_id']);
			
								$children_data[] = array(
									'name'  => $child['name'],
									'href'  => $this->url->link('simple_blog/category', 'simple_blog_category_id=' . $category['simple_blog_category_id'] . '_' . $child['simple_blog_category_id'])
								);						
							}

							$menu_class = 'simple_blog';
							
							// Level 1
							$data['categories'][] = array(
								'name'     => $category['name'],
								'children' => $children_data,

								'menu_class' => $menu_class,

								'column'   => $category['blog_category_column'] ? $category['blog_category_column'] : 1,
								'href'     => $this->url->link('simple_blog/category', 'simple_blog_category_id=' . $category['simple_blog_category_id'])
							);						
						}
					}
										
				}
				//else {
					$categories = $this->model_catalog_category->getCategories(0);
					
					foreach ($categories as $category) {
						if ($category['top']) {
							// Level 2
							$children_data = array();
			
							$children = $this->model_catalog_category->getCategories($category['category_id']);
			
							foreach ($children as $child) {
								$filter_data = array(
									'filter_category_id'  => $child['category_id'],
									'filter_sub_category' => true
								);
			
								$product_total = $this->model_catalog_product->getTotalProducts($filter_data);
			
								$children_data[] = array(
									'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
									'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
								);						
							}
			
							// Level 1
							$data['categories'][] = array(
								'name'     => $category['name'],
								'children' => $children_data,
								'column'   => $category['column'] ? $category['column'] : 1,
								'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
							);
						}
					}
				//}
			






























		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
		} else {
			return $this->load->view('default/template/common/header.tpl', $data);
		}
	}
}
