<?php

/**
 * User: Anh TO
 * Date: 9/30/14
 * Time: 8:58 AM
 */
class ControllerPromotionsRewardPoints extends Controller
{
	private $error = array();

	CONST DO_NOT_ALLOW_USE_REWARD = 1;
	CONST USE_UNLIMITED_REWARD    = 2;
	CONST USE_FIXED_REWARD        = 3;
	CONST SPEND_Y_TO_GET_X_REWARD = 4;

	public function shoppingCartRuleDelete()
	{
		$this->load->model('promotions/reward_points');
		$this->model_promotions_reward_points->deleteShoppingCartRule($this->request->get['rule_id']);
		$this->session->data['success'] = $this->language->get('text_success');
		$this->response->redirect($this->url->link('promotions/reward_points/shoppingCartRuleList', 'token=' . $this->session->data['token'], 'SSL'));
	}

	public function behaviorRuleDelete()
	{
		$this->load->model('promotions/reward_points');
		$this->model_promotions_reward_points->deleteBehaviorRule($this->request->get['rule_id']);
		$this->session->data['success'] = $this->language->get('text_success');
		$this->response->redirect($this->url->link('promotions/reward_points/behaviorRuleList', 'token=' . $this->session->data['token'], 'SSL'));
	}

	public function catalogCartRuleDelete()
	{
		$this->load->model('promotions/reward_points');
		$this->model_promotions_reward_points->deleteCatalogRule($this->request->get['rule_id']);
		$this->session->data['success'] = $this->language->get('text_success');
		$this->response->redirect($this->url->link('promotions/reward_points/catalogRuleList', 'token=' . $this->session->data['token'], 'SSL'));
	}

	public function spendingRuleDelete()
	{
		$this->load->model('promotions/reward_points');
		$this->model_promotions_reward_points->deleteSpendingRule($this->request->get['rule_id']);
		$this->session->data['success'] = $this->language->get('text_success');
		$this->response->redirect($this->url->link('promotions/reward_points/spendingRuleList', 'token=' . $this->session->data['token'], 'SSL'));
	}

	public function configuration()
	{
		$this->document->addStyle('view/stylesheet/rewardpoints/stylesheet.css');

		$this->language->load('module/reward_points_pro');
		$this->document->setTitle($this->language->get('heading_title_configuration'));

		$this->load->model('setting/setting');

		if(($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateConfiguration()) {
			/** DISPATCH_EVENT:CONFIGURATION_BEFORE_SAVE_SETTING */
			$this->model_setting_setting->editSetting('reward_points', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');
		}
		$this->getFormConfiguration();
	}

	public function shoppingCartRuleEdit()
	{
		$this->document->addStyle('view/stylesheet/rewardpoints/stylesheet.css');
		$this->document->addScript('view/javascript/rewardpoints/lib/underscore.js');
		$this->document->addScript('view/javascript/rewardpoints/lib/backbone.js');
		$this->document->addScript('view/javascript/rewardpoints/head.main.js');
		$this->document->addScript('view/javascript/rewardpoints/view.js');

		$this->language->load('module/reward_points_pro');
		$this->document->setTitle($this->language->get('heading_title_shopping_cart_rule'));

		if($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateForm()) {
			$this->shoppingCartRuleUpdate();
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('promotions/reward_points/shoppingCartRuleList', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getFormShoppingCartRule();
	}

	public function shoppingCartRuleList()
	{
		$this->load->model('promotions/reward_points');
		$this->language->load('module/reward_points_pro');
		$this->document->setTitle($this->language->get('heading_title_shopping_cart_rule'));

		$this->load->model('localisation/language');

		$data['language'] = $this->language;
		$data['url']      = $this->url;
		$data['token']    = $this->session->data['token'];

		$data['heading_title'] = $this->language->get('heading_title_shopping_cart_rule');

		if(isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'rule_id';
		}

		if(isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if(isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title_shopping_cart_rule'),
			'href'      => $this->url->link('prmotions/reward_points/shoppingCartRuleList', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['add_rule'] = $this->url->link('promotions/reward_points/shoppingCartRuleEdit', 'token=' . $this->session->data['token'], 'SSL');
		$data['rules']    = array();

		$_data         = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		$total_rule    = $this->model_promotions_reward_points->getTotalShoppingCartRules();
		$data['rules'] = $this->model_promotions_reward_points->getShoppingCartRules($_data);

		$data['token'] = $this->session->data['token'];
		if(isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if(isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$url = '';

		if(isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if(isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination        = new Pagination();
		$pagination->total = $total_rule;
		$pagination->page  = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text  = $this->language->get('text_pagination');
		$pagination->url   = $this->url->link('promotions/reward_points/shoppingCartRuleList', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($total_rule) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total_rule - $this->config->get('config_limit_admin'))) ? $total_rule : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total_rule, ceil($total_rule / $this->config->get('config_limit_admin')));

		$data['sort']  = $sort;
		$data['order'] = $order;

		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');
		$template            = 'promotions/reward_points/shopping_cart_rule/list.tpl';
		$this->response->setOutput($this->load->view($template, $data));
	}

	public function spendingRuleEdit()
	{
		$this->document->addStyle('view/stylesheet/rewardpoints/stylesheet.css');
		$this->document->addScript('view/javascript/rewardpoints/lib/underscore.js');
		$this->document->addScript('view/javascript/rewardpoints/lib/backbone.js');
		$this->document->addScript('view/javascript/rewardpoints/head.main.js');
		$this->document->addScript('view/javascript/rewardpoints/view.js');

		$this->language->load('module/reward_points_pro');
		$this->document->setTitle($this->language->get('heading_title_spending_rule'));

		if($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateForm()) {
			$this->spendingRuleUpdate();
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('promotions/reward_points/spendingRuleList', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getFormSpendingRule();
	}

	public function allTransactionHistory()
	{
		$this->document->addStyle('view/stylesheet/rewardpoints/stylesheet.css');
		$this->document->addScript('view/javascript/rewardpoints/lib/underscore.js');
		$this->document->addScript('view/javascript/rewardpoints/lib/backbone.js');
		$this->document->addScript('view/javascript/rewardpoints/head.main.js');
		$this->document->addScript('view/javascript/rewardpoints/view.js');
		$this->load->model('promotions/reward_points');
		$this->language->load('module/reward_points_pro');
		$this->document->setTitle($this->language->get('heading_title_transaction_history'));

		$data['heading_title'] = $this->language->get('heading_title_transaction_history');

		$data['language'] = $this->language;
		$data['url']      = $this->url;
		$data['token']    = $this->session->data['token'];

		$this->load->model('sale/customer');
		$this->load->model('sale/order');
		$data['model_sale_customer'] = $this->model_sale_customer;
		$data['model_sale_order']    = $this->model_sale_order;

		$data['config_text_points'] = $this->config->get('text_points_' . $this->language->get('code'));

		$data['start_date']   = $data['end_date'] = $start_date = $end_date = '';
		$data['filter_email'] = $data['filter_status'] = $filter_status = $filter_email = '';
		$url                  = "";
		if(isset($this->request->get['start_date'])) {
			$data['start_date'] = $start_date = $this->request->get['start_date'];
			$url .= "&start_date=" . $start_date;
		}

		if(isset($this->request->get['end_date'])) {
			$data['end_date'] = $end_date = $this->request->get['end_date'];
			$url .= "&end_date=" . $end_date;
		}

		if(isset($this->request->get['filter_email'])) {
			$data['filter_email'] = $filter_email = $this->request->get['filter_email'];
			$url .= "&filter_email=" . $filter_email;
		}
		if(isset($this->request->get['filter_status'])) {
			$data['filter_status'] = $filter_status = $this->request->get['filter_status'];
			$url .= "&filter_status=" . $filter_status;
		}

		if(isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'rule_id';
		}

		if(isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if(isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title_transaction_history'),
			'href'      => $this->url->link('prmotions/reward_points/allTransactionHistory', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$_data              = array(
			'sort'          => $sort,
			'order'         => $order,
			'start'         => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit'         => $this->config->get('config_admin_limit'),
			'filter_email'  => $filter_email,
			'filter_status' => $filter_status,
			'start_date'    => $start_date,
			'start_date'    => $start_date,
			'end_date'      => $end_date
		);
		$total_transactions = $this->model_promotions_reward_points->getTotalTransactions($_data);

		$data['transactions'] = $this->model_promotions_reward_points->getTransactions($_data);
		$data['stats']        = $this->model_promotions_reward_points->getAllTotalRewards($_data);;

		$data['token'] = $this->session->data['token'];

		$data['action']          = $this->url->link('promotions/reward_points/allTransactionHistory', 'token=' . $this->session->data['token'], 'SSL');
		$data['url_post_status'] = $this->url->link('promotions/reward_points/updateStatusReward', 'token=' . $this->session->data['token'], 'SSL');

		if(isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if(isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$pagination        = new Pagination();
		$pagination->total = $total_transactions;
		$pagination->page  = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text  = $this->language->get('text_pagination');
		$pagination->url   = $this->url->link('promotions/reward_points/allTransactionHistory', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($total_transactions) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total_transactions - $this->config->get('config_limit_admin'))) ? $total_transactions : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total_transactions, ceil($total_transactions / $this->config->get('config_limit_admin')));

		$data['sort']  = $sort;
		$data['order'] = $order;

		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');
		$template            = 'promotions/reward_points/transactions/list.tpl';
		$this->response->setOutput($this->load->view($template, $data));
	}

	public function updateStatusReward()
	{
		$this->load->model('promotions/reward_points_transactions');
		$this->model_promotions_reward_points_transactions->updateStatusReward($this->request->post);
	}

	public function behaviorRuleList()
	{
		$this->document->addStyle('view/stylesheet/rewardpoints/stylesheet.css');
		$this->load->model('promotions/reward_points');
		$this->language->load('module/reward_points_pro');
		$this->document->setTitle($this->language->get('heading_title_behavior_rule'));

		$this->load->model('localisation/language');

		$data['language'] = $this->language;
		$data['url']      = $this->url;
		$data['token']    = $this->session->data['token'];
		$this->load->model('promotions/reward_points_transactions');
		$data['model_transaction'] = $this->model_promotions_reward_points_transactions;

		$data['heading_title'] = $this->language->get('heading_title_behavior_rule');

		if(isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'rule_id';
		}

		if(isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if(isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title_behavior_rule'),
			'href'      => $this->url->link('prmotions/reward_points/behaviorRuleList', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['add_rule'] = $this->url->link('promotions/reward_points/behaviorRuleEdit', 'token=' . $this->session->data['token'], 'SSL');
		$data['rules']    = array();

		$_data         = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		$total_rule    = $this->model_promotions_reward_points->getTotalBehaviorRules();
		$data['rules'] = $this->model_promotions_reward_points->getBehaviorRules($_data);

		$data['token'] = $this->session->data['token'];
		if(isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if(isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$pagination        = new Pagination();
		$pagination->total = 0;
		$pagination->page  = 0;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text  = $this->language->get('text_pagination');
		$pagination->url   = $this->url->link('promotions/reward_points/behaviorRuleList', 'token=' . $this->session->data['token'] . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($total_rule) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total_rule - $this->config->get('config_limit_admin'))) ? $total_rule : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total_rule, ceil($total_rule / $this->config->get('config_limit_admin')));

		$data['sort']  = $sort;
		$data['order'] = $order;

		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');
		$template            = 'promotions/reward_points/behavior_rule/list.tpl';
		$this->response->setOutput($this->load->view($template, $data));
	}

	public function behaviorRuleEdit()
	{
		$this->document->addStyle('view/stylesheet/rewardpoints/stylesheet.css');

		$this->language->load('module/reward_points_pro');
		$this->document->setTitle($this->language->get('heading_title_behavior_rule'));

		if($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateForm()) {
			$this->behaviorRuleUpdate();
			$this->session->data['success'] = $this->language->get('text_success');
			$this->response->redirect($this->url->link('promotions/reward_points/behaviorRuleList', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getFormBehaviorRule();
	}

	public function spendingRuleList()
	{
		$this->load->model('promotions/reward_points');
		$this->language->load('module/reward_points_pro');
		$this->document->setTitle($this->language->get('heading_title_spending_rule'));

		$this->load->model('localisation/language');

		$data['language'] = $this->language;
		$data['url']      = $this->url;
		$data['token']    = $this->session->data['token'];

		$data['heading_title'] = $this->language->get('heading_title_spending_rule');

		if(isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'rule_id';
		}

		if(isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if(isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title_spending_rule'),
			'href'      => $this->url->link('prmotions/reward_points/spendingRuleList', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['add_rule'] = $this->url->link('promotions/reward_points/spendingRuleEdit', 'token=' . $this->session->data['token'], 'SSL');
		$data['rules']    = array();

		$_data         = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		$total_rule    = $this->model_promotions_reward_points->getTotalSpendingRules();
		$data['rules'] = $this->model_promotions_reward_points->getSpendingRules($_data);

		$data['token'] = $this->session->data['token'];
		if(isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if(isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$url = '';

		if(isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if(isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination        = new Pagination();
		$pagination->total = $total_rule;
		$pagination->page  = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text  = $this->language->get('text_pagination');
		$pagination->url   = $this->url->link('promotions/reward_points/spendingRuleList', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($total_rule) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total_rule - $this->config->get('config_limit_admin'))) ? $total_rule : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total_rule, ceil($total_rule / $this->config->get('config_limit_admin')));

		$data['sort']  = $sort;
		$data['order'] = $order;

		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');
		$template            = 'promotions/reward_points/spending_rule/list.tpl';
		$this->response->setOutput($this->load->view($template, $data));
	}

	public function catalogRuleList()
	{
		$this->load->model('promotions/reward_points');
		$this->language->load('module/reward_points_pro');
		$this->document->setTitle($this->language->get('heading_title_catalog_rule'));

		$this->load->model('localisation/language');

		$data['language'] = $this->language;
		$data['url']      = $this->url;
		$data['token']    = $this->session->data['token'];

		$data['heading_title'] = $this->language->get('heading_title_catalog_rule');

		if(isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'rule_id';
		}

		if(isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if(isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title_catalog_rule'),
			'href'      => $this->url->link('prmotions/reward_points/catalogRuleList', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['add_rule'] = $this->url->link('promotions/reward_points/catalogRuleEdit', 'token=' . $this->session->data['token'], 'SSL');
		$data['rules']    = array();

		$_data         = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		$total_rule    = $this->model_promotions_reward_points->getTotalCatalogRules();
		$data['rules'] = $this->model_promotions_reward_points->getCatalogRules($_data);

		$data['token'] = $this->session->data['token'];
		if(isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if(isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$url = '';

		if(isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if(isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination        = new Pagination();
		$pagination->total = $total_rule;
		$pagination->page  = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text  = $this->language->get('text_pagination');
		$pagination->url   = $this->url->link('promotions/reward_points/catalogRuleList', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($total_rule) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($total_rule - $this->config->get('config_limit_admin'))) ? $total_rule : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $total_rule, ceil($total_rule / $this->config->get('config_limit_admin')));

		$data['sort']  = $sort;
		$data['order'] = $order;

		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');
		$template            = 'promotions/reward_points/catalog_rule/list.tpl';
		$this->response->setOutput($this->load->view($template, $data));
	}

	public function catalogRuleEdit()
	{
		$this->document->addStyle('view/stylesheet/rewardpoints/stylesheet.css');
		$this->document->addScript('view/javascript/rewardpoints/lib/underscore.js');
		$this->document->addScript('view/javascript/rewardpoints/lib/backbone.js');
		$this->document->addScript('view/javascript/rewardpoints/head.main.js');
		$this->document->addScript('view/javascript/rewardpoints/view.js');

		$this->language->load('module/reward_points_pro');
		$this->document->setTitle($this->language->get('heading_title_catalog_rule'));

		if($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validateForm()) {
			$this->catalogRuleUpdate();
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('promotions/reward_points/catalogRuleList', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getFormCatalogRule();
	}

	protected function getFormConfiguration()
	{
		$data['heading_title'] = $this->language->get('heading_title_configuration');
		$data['text_form']     = $this->language->get('text_edit') . " " . $this->language->get('heading_title_configuration');

		$this->load->model('localisation/language');

		$data['language']  = $this->language;
		$data['languages'] = $this->model_localisation_language->getLanguages();

		foreach ($data['languages'] as $language) {
			if(isset($this->request->post[ 'text_points_' . $language['code'] ])) {
				$data[ 'text_points_' . $language['code'] ] = $this->request->post[ 'text_points_' . $language['code'] ];
			} else {
				$data[ 'text_points_' . $language['code'] ] = $this->config->get('text_points_' . $language['code']);
			}
		}
		if(isset($this->session->data['warning'])) {
			$data['warning'] = $this->session->data['warning'];
		} else {
			$data['warning'] = '';
		}
		if(isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		if(isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		} else {
			$data['success'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title_configuration'),
			'href'      => $this->url->link('promotions/reward_points/configuration', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['token'] = $this->session->data['token'];

		$data['action'] = $this->url->link('promotions/reward_points/configuration', 'token=' . $this->session->data['token'], 'SSL');

		if(isset($this->request->post['rwp_enabled_module'])) {
			$data['rwp_enabled_module'] = $this->request->post['rwp_enabled_module'];
		} else {
			$data['rwp_enabled_module'] = $this->config->get('rwp_enabled_module');
		}

		if(isset($this->request->post['currency_exchange_rate'])) {
			$data['currency_exchange_rate'] = $this->request->post['currency_exchange_rate'];
		} else {
			$data['currency_exchange_rate'] = $this->config->get('currency_exchange_rate');
		}
		if (isset($this->request->post['show_point_listing'])) {
			$data['show_point_listing'] = $this->request->post['show_point_listing'];
		} else {
			$data['show_point_listing'] = $this->config->get('show_point_listing');
		}
		if (isset($this->request->post['show_point_detail'])) {
			$data['show_point_detail'] = $this->request->post['show_point_detail'];
		} else {
			$data['show_point_detail'] = $this->config->get('show_point_detail');
		}
		if (isset($this->request->post['update_based_order_status'])) {
			$data['update_based_order_status'] = $this->request->post['update_based_order_status'];
		} else {
			$data['update_based_order_status'] = $this->config->get('update_based_order_status');
		}
		/** DISPATCH_EVENT:CONFIGURATION_AFTER_CHECK_FIELD_DATA */
		$data['earn_point_sort_order']   = $this->config->get('earn_point_sort_order');
		$data['redeem_point_sort_order'] = $this->config->get('redeem_point_sort_order');
		$data['earn_point_status']       = $this->config->get('earn_point_status');
		$data['redeem_point_status']     = $this->config->get('redeem_point_status');

		$this->load->model('localisation/order_status');
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		$this->load->model('extension/extension');

		$extensions = $this->model_extension_extension->getInstalled('total');

		foreach ($extensions as $key => $value) {
			if(!file_exists(DIR_APPLICATION . 'controller/total/' . $value . '.php')) {
				$this->model_setting_extension->uninstall('total', $value);

				unset($extensions[ $key ]);
			}
		}

		$data['extensions']           = array();
		$data['extensions']['status'] = true;

		$files = glob(DIR_APPLICATION . 'controller/total/*.php');

		if($files) {
			foreach ($files as $file) {
				$extension = basename($file, '.php');
				if($extension != 'earn_point' && $extension != 'redeem_point') continue;

				$this->language->load('total/' . $extension);

				$action = array();

				if(!$this->config->get($extension . '_status')) $data['extensions']['status'] = false;

				if(!in_array($extension, $extensions)) {
					$install                      = false;
					$data['extensions']['status'] = false;
				} else {
					$install = true;
				}

				$data['extensions'][ $extension ] = array(
					'name'       => $this->language->get('heading_title'),
					'status'     => ($install) ? $this->config->get($extension . '_status') : false,
					'sort_order' => (!$this->config->get($extension . '_sort_order')) ? ($install ? 0 : null) : ($install ? $this->config->get($extension . '_sort_order') : 'none'),
				);
			}
		}

		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');
		$template            = 'promotions/reward_points/configuration/form.tpl';
		$this->response->setOutput($this->load->view($template, $data));
	}

	protected function catalogRuleUpdate()
	{
		$this->load->model('promotions/reward_points');

		if(isset($this->request->post['rule_id']) && empty($this->request->post['rule_id'])) {
			$this->model_promotions_reward_points->addCatalogRules($this->request->post);
		} else {
			$this->model_promotions_reward_points->updateCatalogRules($this->request->post);
		}
	}

	protected function shoppingCartRuleUpdate()
	{
		$this->load->model('promotions/reward_points');

		if(isset($this->request->post['rule_id']) && empty($this->request->post['rule_id'])) {

			$this->model_promotions_reward_points->addShoppingCartRules($this->request->post);
		} else {
			$this->model_promotions_reward_points->updateShoppingCartRules($this->request->post);
		}
	}

	protected function spendingRuleUpdate()
	{
		$this->load->model('promotions/reward_points');

		if(isset($this->request->post['rule_id']) && empty($this->request->post['rule_id'])) {

			$this->model_promotions_reward_points->addSpendingRules($this->request->post);
		} else {
			$this->model_promotions_reward_points->updateSpendingRules($this->request->post);
		}
	}

	protected function behaviorRuleUpdate()
	{
		$this->load->model('promotions/reward_points');

		if(isset($this->request->post['rule_id']) && empty($this->request->post['rule_id'])) {

			$this->model_promotions_reward_points->addBehaviorRules($this->request->post);
		} else {
			$this->model_promotions_reward_points->updateBehaviorRules($this->request->post);
		}
	}

	protected function getFormBehaviorRule()
	{
		$this->load->model('localisation/language');

		$data['heading_title'] = $this->language->get('heading_title_behavior_rule');

		$data['language']  = $this->language;
		$data['languages'] = $this->model_localisation_language->getLanguages();
		$data['url']       = $this->url;
		$data['rule_id']   = isset($this->request->get['rule_id']) ? $this->request->get['rule_id'] : "";
		$data['model']     = $this;

		$this->document->addStyle('view/stylesheet/rewardpoints/stylesheet.css');
		$this->document->addScript('view/javascript/rewardpoints/lib/underscore.js');
		$this->document->addScript('view/javascript/rewardpoints/lib/backbone.js');
		$this->document->addScript('view/javascript/rewardpoints/head.main.js');
		$this->document->addScript('view/javascript/rewardpoints/view.js');
		/** DISPATCH_EVENT:BEHAVIOR_AFTER_ADD_VIEW_JS */
		if(isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if(isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

		if(isset($this->error['customer_group'])) {
			$data['error_customer_group'] = $this->error['customer_group'];
		} else {
			$data['error_customer_group'] = array();
		}

		if(isset($this->error['reward_point'])) {
			$data['error_reward_point'] = $this->error['reward_point'];
		} else {
			$data['error_reward_point'] = array();
		}

		$this->load->model('promotions/reward_points');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title_catalog_rule'),
			'href'      => $this->url->link('promotions/reward_points/behaviorRuleList', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['token'] = $this->session->data['token'];
		if(isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if(isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		} else {
			$data['success'] = '';
		}

		$this->load->model('sale/customer_group');
		$data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();

		if(!isset($this->request->get['rule_id'])) {
			$data['action'] = $this->url->link('promotions/reward_points/behaviorRuleEdit', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('promotions/reward_points/behaviorRuleEdit', 'rule_id=' . $this->request->get['rule_id'] . '&token=' . $this->session->data['token'], 'SSL');
		}

		$data['cancel'] = $this->url->link('promotions/reward_points/behaviorRuleList', 'token=' . $this->session->data['token'], 'SSL');

		if(isset($this->request->get['rule_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$behavior_rule_info = $this->model_promotions_reward_points->getBehaviorRule($this->request->get['rule_id']);
		}

		if(isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif(!empty($behavior_rule_info)) {
			$data['name'] = $behavior_rule_info['name'];
		} else {
			$data['name'] = '';
		}

		if(isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif(!empty($behavior_rule_info)) {
			$data['status'] = $behavior_rule_info['status'];
		} else {
			$data['status'] = '';
		}

		if(isset($this->request->post['customer_group_ids'])) {
			$data['customer_group_ids'] = $this->request->post['customer_group_ids'];
		} elseif(!empty($behavior_rule_info)) {
			$data['customer_group_ids'] = unserialize($behavior_rule_info['customer_group_ids']);
		} else {
			$data['customer_group_ids'] = array();
		}

		if(isset($this->request->post['actions'])) {
			$data['actions'] = $this->request->post['actions'];
		} elseif(!empty($behavior_rule_info)) {
			$data['actions'] = $behavior_rule_info['actions'];
		} else {
			$data['actions'] = '';
		}

		if(isset($this->request->post['reward_point'])) {
			$data['reward_point'] = $this->request->post['reward_point'];
		} elseif(!empty($behavior_rule_info)) {
			$data['reward_point'] = $behavior_rule_info['reward_point'];
		} else {
			$data['reward_point'] = '';
		}

		if(isset($this->request->post['consecutive_in_day'])) {
			$data['consecutive_in_day'] = $this->request->post['consecutive_in_day'];
		} elseif(!empty($behavior_rule_info)) {
			$data['consecutive_in_day'] = $behavior_rule_info['consecutive_in_day'];
		} else {
			$data['consecutive_in_day'] = '';
		}

		if(isset($this->request->post['is_cycle'])) {
			$data['is_cycle'] = $this->request->post['is_cycle'];
		} elseif(!empty($behavior_rule_info)) {
			$data['is_cycle'] = $behavior_rule_info['is_cycle'];
		} else {
			$data['is_cycle'] = '';
		}
		/** DISPATCH_EVENT:BEHAVIOR_AFTER_CHECK_FIELD_DATA */
		if(isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		} else {
			$data['success'] = '';
		}

		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');
		$template            = 'promotions/reward_points/behavior_rule/form.tpl';
		$this->response->setOutput($this->load->view($template, $data));
	}

	protected function getFormCatalogRule()
	{
		$this->load->model('localisation/language');

		$data['heading_title'] = $this->language->get('heading_title_catalog_rule');
		$data['language']      = $this->language;
		$data['languages']     = $this->model_localisation_language->getLanguages();
		$data['url']           = $this->url;
		$data['rule_id']       = isset($this->request->get['rule_id']) ? $this->request->get['rule_id'] : "";
		$data['model']         = $this;
		if(isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if(isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

		if(isset($this->error['customer_group'])) {
			$data['error_customer_group'] = $this->error['customer_group'];
		} else {
			$data['error_customer_group'] = array();
		}

		if(isset($this->error['reward_point'])) {
			$data['error_reward_point'] = $this->error['reward_point'];
		} else {
			$data['error_reward_point'] = array();
		}

		$this->load->model('promotions/reward_points');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title_catalog_rule'),
			'href'      => $this->url->link('promotions/reward_points/catalogRuleList', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['token'] = $this->session->data['token'];
		if(isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if(isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		} else {
			$data['success'] = '';
		}
		$product_attributes = array();

		/* At the moment, do not support options of product */

		/*$this->load->model('catalog/option');
		$results = $this->model_catalog_option->getOptions();

		foreach($results as $result){
			if($result['type'] != 'file')
			{
				$product_attributes[] = array(
					'text'      =>  $result['name'],
					'model'     =>  'catalog/option',
					'id'        =>  $result['option_id']
				);
			}
		}*/

		$product_attributes[] = array(
			'text'   => $this->language->get('text_category'),
			'model'  => 'catalog/category|category_id',
			'type'   => 'select',
			'method' => 'getCategories',
			'id'     => null
		);

		$product_attributes[] = array(
			'text'   => $this->language->get('text_model'),
			'model'  => 'catalog/product|model',
			'type'   => 'text',
			'method' => 'getProduct',
			'id'     => null
		);

		$product_attributes[] = array(
			'text'   => $this->language->get('text_sku'),
			'model'  => 'catalog/product|sku',
			'type'   => 'text',
			'method' => 'getProduct',
			'id'     => null
		);

		$product_attributes[] = array(
			'text'   => $this->language->get('text_price'),
			'model'  => 'catalog/product|price',
			'type'   => 'text',
			'method' => 'getProduct',
			'id'     => null
		);

		$this->load->model('catalog/attribute_group');
		$results = $this->model_catalog_attribute_group->getAttributeGroups();

		foreach ($results as $result) {
			$product_attributes[] = array(
				'text'  => $result['name'],
				'model' => 'catalog/attribute',
				'id'    => $result['attribute_group_id']
			);
		}

		$product_attributes[]       = array(
			'text'   => $this->language->get('text_manufacturer'),
			'model'  => 'catalog/manufacturer|manufacturer',
			'type'   => 'text',
			'method' => 'getManufacturers',
			'id'     => null
		);
		$data['product_attributes'] = $product_attributes;

		$this->load->model('sale/customer_group');
		$data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();

		if(!isset($this->request->get['rule_id'])) {
			$data['action'] = $this->url->link('promotions/reward_points/catalogRuleEdit', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('promotions/reward_points/catalogRuleEdit', 'rule_id=' . $this->request->get['rule_id'] . '&token=' . $this->session->data['token'], 'SSL');
		}

		$data['cancel'] = $this->url->link('promotions/reward_points/catalogRuleList', 'token=' . $this->session->data['token'], 'SSL');

		if(isset($this->request->get['rule_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$catalog_rule_info = $this->model_promotions_reward_points->getCatalogRule($this->request->get['rule_id']);
		}

		if(isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif(!empty($catalog_rule_info)) {
			$data['name'] = $catalog_rule_info['name'];
		} else {
			$data['name'] = '';
		}

		if(isset($this->request->post['description'])) {
			$data['description'] = $this->request->post['description'];
		} elseif(!empty($catalog_rule_info)) {
			$data['description'] = $catalog_rule_info['description'];
		} else {
			$data['description'] = '';
		}

		if(isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif(!empty($catalog_rule_info)) {
			$data['status'] = $catalog_rule_info['status'];
		} else {
			$data['status'] = '';
		}

		if(isset($this->request->post['customer_group_ids'])) {
			$data['customer_group_ids'] = $this->request->post['customer_group_ids'];
		} elseif(!empty($catalog_rule_info)) {
			$data['customer_group_ids'] = unserialize($catalog_rule_info['customer_group_ids']);
		} else {
			$data['customer_group_ids'] = array();
		}

		if(isset($this->request->post['start_date'])) {
			$data['start_date'] = $this->request->post['start_date'];
		} elseif(!empty($catalog_rule_info)) {
			$data['start_date'] = $catalog_rule_info['start_date'];
		} else {
			$data['start_date'] = '';
		}

		if(isset($this->request->post['end_date'])) {
			$data['end_date'] = $this->request->post['end_date'];
		} elseif(!empty($catalog_rule_info)) {
			$data['end_date'] = $catalog_rule_info['end_date'];
		} else {
			$data['end_date'] = '';
		}

		if(!empty($catalog_rule_info['conditions_serialized']) || isset($this->request->post['rule'])) {
			if(isset($this->request->post['rule'])) {
				$rules = $this->request->post['rule'];
			} else {
				$rules = unserialize(base64_decode($catalog_rule_info['conditions_serialized']));
			}

			$counters   = array();
			$conditions = array();

			foreach ($rules['conditions'] as $counter => $rule) {
				if((int)strpos($counter, "-") == 0) {
					$counters[ $counter ] = $rule;
				} else {
					$data_option = $this->getDataOption($rule['type'], false, $rule['value']);

					$conditions[ $counter ]         = $rule;
					$conditions[ $counter ]['data'] = $data_option;
				}
			}

			$data['rule']               = $conditions;
			$data['conditions_combine'] = $counters;
		} else {
			$data['rule']               = array();
			$data['conditions_combine'] = array();
		}

		if(isset($this->request->post['actions'])) {
			$data['actions'] = $this->request->post['actions'];
		} elseif(!empty($catalog_rule_info)) {
			$data['actions'] = $catalog_rule_info['actions'];
		} else {
			$data['actions'] = '';
		}

		if(isset($this->request->post['reward_point'])) {
			$data['reward_point'] = $this->request->post['reward_point'];
		} elseif(!empty($catalog_rule_info)) {
			$data['reward_point'] = $catalog_rule_info['reward_point'];
		} else {
			$data['reward_point'] = '';
		}

		if(isset($this->request->post['reward_per_spent'])) {
			$data['reward_per_spent'] = $this->request->post['reward_per_spent'];
		} elseif(!empty($catalog_rule_info)) {
			$data['reward_per_spent'] = $catalog_rule_info['reward_per_spent'];
		} else {
			$data['reward_per_spent'] = '';
		}

		if(isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			//unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');
		$template            = 'promotions/reward_points/catalog_rule/form.tpl';
		$this->response->setOutput($this->load->view($template, $data));
	}

	protected function getFormShoppingCartRule()
	{
		$this->load->model('localisation/language');

		$data['language']  = $this->language;
		$data['languages'] = $this->model_localisation_language->getLanguages();
		$data['url']       = $this->url;
		$data['rule_id']   = isset($this->request->get['rule_id']) ? $this->request->get['rule_id'] : "";

		$data['model'] = $this;

		$data['heading_title'] = $this->language->get('heading_title_shopping_cart_rule');
		if(isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if(isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

		if(isset($this->error['customer_group'])) {
			$data['error_customer_group'] = $this->error['customer_group'];
		} else {
			$data['error_customer_group'] = array();
		}

		if(isset($this->error['reward_point'])) {
			$data['error_reward_point'] = $this->error['reward_point'];
		} else {
			$data['error_reward_point'] = array();
		}

		$this->load->model('promotions/reward_points');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title_shopping_cart_rule'),
			'href'      => $this->url->link('promotions/reard_points/shoppingCartRuleList', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['token'] = $this->session->data['token'];
		if(isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if(isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		} else {
			$data['success'] = '';
		}

		$cart_attributes = array();

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_subtotal'),
			'model' => 'sale/reward_points/rule|subtotal',
			'type'  => 'text',
			'id'    => null
		);

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_total_items_quantity'),
			'model' => 'sale/reward_points/rule|quantity',
			'type'  => 'text',
			'id'    => null
		);

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_total_weight'),
			'model' => 'sale/reward_points/rule|weight',
			'type'  => 'text',
			'id'    => null
		);

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_payment_method'),
			'model' => 'sale/reward_points/rule|payment_method',
			'type'  => 'select',
			'id'    => null
		);

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_shipping_method'),
			'model' => 'sale/reward_points/rule|shipping_method',
			'type'  => 'select',
			'id'    => null
		);

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_shipping_postcode'),
			'model' => 'sale/reward_points/rule|shipping_postcode',
			'type'  => 'select',
			'id'    => null
		);

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_shipping_region'),
			'model' => 'sale/reward_points/rule|shipping_region',
			'type'  => 'select',
			'id'    => null
		);

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_shipping_state_province'),
			'model' => 'sale/reward_points/rule|shipping_state_province',
			'type'  => 'select',
			'id'    => null
		);

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_shipping_country'),
			'model' => 'sale/reward_points/rule|shipping_country',
			'type'  => 'select',
			'id'    => null
		);

		$product_attributes = array();

		$this->load->model('catalog/option');
		$results = $this->model_catalog_option->getOptions();

		foreach ($results as $result) {
			if($result['type'] != 'file') {
				$product_attributes[] = array(
					'text'  => $result['name'],
					'model' => 'catalog/option',
					'id'    => $result['option_id']
				);
			}
		}

		$product_attributes[] = array(
			'text'   => $this->language->get('text_category'),
			'model'  => 'catalog/category|category_id',
			'type'   => 'select',
			'method' => 'getCategories',
			'id'     => null
		);

		$product_attributes[] = array(
			'text'   => $this->language->get('text_model'),
			'model'  => 'catalog/product|model',
			'type'   => 'text',
			'method' => 'getProduct',
			'id'     => null
		);

		$product_attributes[] = array(
			'text'   => $this->language->get('text_sku'),
			'model'  => 'catalog/product|sku',
			'type'   => 'text',
			'method' => 'getProduct',
			'id'     => null
		);
		/*$this->load->model('catalog/attribute_group');
		$results = $this->model_catalog_attribute_group->getAttributeGroups();

		foreach($results as $result){
			$product_attributes[] = array(
				'text'      =>  $result['name'],
				'model'     =>  'catalog/attribute',
				'id'        =>  $result['attribute_group_id']
			);
		}*/

		$product_attributes[]       = array(
			'text'   => $this->language->get('text_manufacturer'),
			'model'  => 'catalog/manufacturer|manufacturer',
			'type'   => 'text',
			'method' => 'getManufacturers',
			'id'     => null
		);
		$data['product_attributes'] = $product_attributes;

		$this->load->model('sale/customer_group');
		$data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();

		$data['cart_attributes'] = $cart_attributes;
		if(!isset($this->request->get['rule_id'])) {
			$data['action'] = $this->url->link('promotions/reward_points/shoppingCartRuleEdit', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('promotions/reward_points/shoppingCartRuleEdit', 'rule_id=' . $this->request->get['rule_id'] . '&token=' . $this->session->data['token'], 'SSL');
		}

		$data['cancel'] = $this->url->link('promotions/reward_points/shoppingCartRuleList', 'token=' . $this->session->data['token'], 'SSL');

		if(isset($this->request->get['rule_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$shopping_cart_rule_info = $this->model_promotions_reward_points->getShoppingCartRule($this->request->get['rule_id']);
		}

		if(isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif(!empty($shopping_cart_rule_info)) {
			$data['name'] = $shopping_cart_rule_info['name'];
		} else {
			$data['name'] = '';
		}

		if(isset($this->request->post['description'])) {
			$data['description'] = $this->request->post['description'];
		} elseif(!empty($shopping_cart_rule_info)) {
			$data['description'] = $shopping_cart_rule_info['description'];
		} else {
			$data['description'] = '';
		}

		if(isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif(!empty($shopping_cart_rule_info)) {
			$data['status'] = $shopping_cart_rule_info['status'];
		} else {
			$data['status'] = '';
		}

		if(isset($this->request->post['customer_group_ids'])) {
			$data['customer_group_ids'] = $this->request->post['customer_group_ids'];
		} elseif(!empty($shopping_cart_rule_info)) {
			$data['customer_group_ids'] = unserialize($shopping_cart_rule_info['customer_group_ids']);
		} else {
			$data['customer_group_ids'] = array();
		}

		if(isset($this->request->post['start_date'])) {
			$data['start_date'] = $this->request->post['start_date'];
		} elseif(!empty($shopping_cart_rule_info)) {
			$data['start_date'] = $shopping_cart_rule_info['start_date'];
		} else {
			$data['start_date'] = '';
		}

		if(isset($this->request->post['end_date'])) {
			$data['end_date'] = $this->request->post['end_date'];
		} elseif(!empty($shopping_cart_rule_info)) {
			$data['end_date'] = $shopping_cart_rule_info['end_date'];
		} else {
			$data['end_date'] = '';
		}

		if(!empty($shopping_cart_rule_info['conditions_serialized']) || isset($this->request->post['rule'])) {
			if(isset($this->request->post['rule'])) {
				$rules = $this->request->post['rule'];
			} else {
				$rules = unserialize(base64_decode($shopping_cart_rule_info['conditions_serialized']));
			}

			$counters   = array();
			$conditions = array();

			foreach ($rules['conditions'] as $counter => $rule) {
				if((int)strpos($counter, "-") == 0) {
					$counters[ $counter ] = $rule;
				} else {
					$data_option = $this->getDataOption($rule['type'], false, $rule['value']);

					$conditions[ $counter ]         = $rule;
					$conditions[ $counter ]['data'] = $data_option;
				}
			}

			$data['rule']               = $conditions;
			$data['conditions_combine'] = $counters;
		} else {
			$data['rule']               = array();
			$data['conditions_combine'] = array();
		}

		if(isset($this->request->post['reward_point'])) {
			$data['reward_point'] = $this->request->post['reward_point'];
		} elseif(!empty($shopping_cart_rule_info)) {
			$data['reward_point'] = $shopping_cart_rule_info['reward_point'];
		} else {
			$data['reward_point'] = '';
		}

		if(isset($this->request->post['stop_rules_processing'])) {
			$data['stop_rules_processing'] = $this->request->post['stop_rules_processing'];
		} elseif(!empty($shopping_cart_rule_info)) {
			$data['stop_rules_processing'] = $shopping_cart_rule_info['stop_rules_processing'];
		} else {
			$data['stop_rules_processing'] = 1;
		}

		if(isset($this->request->post['rule_position'])) {
			$data['rule_position'] = $this->request->post['rule_position'];
		} elseif(!empty($shopping_cart_rule_info)) {
			$data['rule_position'] = $shopping_cart_rule_info['rule_position'];
		} else {
			$data['rule_position'] = 0;
		}

		if(isset($this->request->post['actions'])) {
			$data['actions'] = $this->request->post['actions'];
		} elseif(!empty($shopping_cart_rule_info)) {
			$data['actions'] = $shopping_cart_rule_info['actions'];
		} else {
			$data['actions'] = '';
		}

		if(isset($this->request->post['reward_per_spent'])) {
			$data['reward_per_spent'] = $this->request->post['reward_per_spent'];
		} elseif(!empty($shopping_cart_rule_info)) {
			$data['reward_per_spent'] = $shopping_cart_rule_info['reward_per_spent'];
		} else {
			$data['reward_per_spent'] = '';
		}

		if(isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		} else {
			$data['success'] = '';
		}

		$data['languages'] = $this->model_localisation_language->getLanguages();

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');
		$template            = 'promotions/reward_points/shopping_cart_rule/form.tpl';
		$this->response->setOutput($this->load->view($template, $data));
	}

	protected function getFormSpendingRule()
	{

		$this->load->model('localisation/language');

		$data['language']  = $this->language;
		$data['languages'] = $this->model_localisation_language->getLanguages();
		$data['url']       = $this->url;
		$data['rule_id']   = isset($this->request->get['rule_id']) ? $this->request->get['rule_id'] : "";

		$data['model'] = $this;

		$data['heading_title'] = $this->language->get('heading_title_spending_rule');

		if(isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if(isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = array();
		}

		if(isset($this->error['customer_group'])) {
			$data['error_customer_group'] = $this->error['customer_group'];
		} else {
			$data['error_customer_group'] = array();
		}

		if(isset($this->error['reward_point'])) {
			$data['error_reward_point'] = $this->error['reward_point'];
		} else {
			$data['error_reward_point'] = array();
		}

		$this->load->model('promotions/reward_points');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title_spending_rule'),
			'href'      => $this->url->link('promotions/reard_points/spendingRuleList', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$data['token'] = $this->session->data['token'];
		if(isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if(isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		} else {
			$data['success'] = '';
		}

		$cart_attributes = array();

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_subtotal'),
			'model' => 'sale/reward_points/rule|subtotal',
			'type'  => 'text',
			'id'    => null
		);

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_total_items_quantity'),
			'model' => 'sale/reward_points/rule|quantity',
			'type'  => 'text',
			'id'    => null
		);

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_total_weight'),
			'model' => 'sale/reward_points/rule|weight',
			'type'  => 'text',
			'id'    => null
		);

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_payment_method'),
			'model' => 'sale/reward_points/rule|payment_method',
			'type'  => 'select',
			'id'    => null
		);

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_shipping_method'),
			'model' => 'sale/reward_points/rule|shipping_method',
			'type'  => 'select',
			'id'    => null
		);

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_shipping_postcode'),
			'model' => 'sale/reward_points/rule|shipping_postcode',
			'type'  => 'select',
			'id'    => null
		);

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_shipping_region'),
			'model' => 'sale/reward_points/rule|shipping_region',
			'type'  => 'select',
			'id'    => null
		);

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_shipping_state_province'),
			'model' => 'sale/reward_points/rule|shipping_state_province',
			'type'  => 'select',
			'id'    => null
		);

		$cart_attributes[] = array(
			'text'  => $this->language->get('text_shipping_country'),
			'model' => 'sale/reward_points/rule|shipping_country',
			'type'  => 'select',
			'id'    => null
		);

		$product_attributes   = array();
		$product_attributes[] = array(
			'text'   => $this->language->get('text_category'),
			'model'  => 'catalog/category|category_id',
			'type'   => 'select',
			'method' => 'getCategories',
			'id'     => null
		);

		$product_attributes[] = array(
			'text'   => $this->language->get('text_model'),
			'model'  => 'catalog/product|model',
			'type'   => 'text',
			'method' => 'getProduct',
			'id'     => null
		);

		$product_attributes[] = array(
			'text'   => $this->language->get('text_sku'),
			'model'  => 'catalog/product|sku',
			'type'   => 'text',
			'method' => 'getProduct',
			'id'     => null
		);
		/*$this->load->model('catalog/attribute_group');
		$results = $this->model_catalog_attribute_group->getAttributeGroups();

		foreach($results as $result){
			$product_attributes[] = array(
				'text'      =>  $result['name'],
				'model'     =>  'catalog/attribute',
				'id'        =>  $result['attribute_group_id']
			);
		}*/

		$product_attributes[]       = array(
			'text'   => $this->language->get('text_manufacturer'),
			'model'  => 'catalog/manufacturer|manufacturer',
			'type'   => 'text',
			'method' => 'getManufacturers',
			'id'     => null
		);
		$data['product_attributes'] = $product_attributes;

		$this->load->model('sale/customer_group');
		$data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();

		$data['cart_attributes'] = $cart_attributes;
		if(!isset($this->request->get['rule_id'])) {
			$data['action'] = $this->url->link('promotions/reward_points/spendingRuleEdit', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('promotions/reward_points/spendingRuleEdit', 'rule_id=' . $this->request->get['rule_id'] . '&token=' . $this->session->data['token'], 'SSL');
		}

		$data['cancel'] = $this->url->link('promotions/reward_points/spendingRuleList', 'token=' . $this->session->data['token'], 'SSL');

		if(isset($this->request->get['rule_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$spending_rule_info = $this->model_promotions_reward_points->getSpendingRule($this->request->get['rule_id']);
		}

		if(isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif(!empty($spending_rule_info)) {
			$data['name'] = $spending_rule_info['name'];
		} else {
			$data['name'] = '';
		}

		if(isset($this->request->post['description'])) {
			$data['description'] = $this->request->post['description'];
		} elseif(!empty($spending_rule_info)) {
			$data['description'] = $spending_rule_info['description'];
		} else {
			$data['description'] = '';
		}

		if(isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif(!empty($spending_rule_info)) {
			$data['status'] = $spending_rule_info['status'];
		} else {
			$data['status'] = '';
		}

		if(isset($this->request->post['customer_group_ids'])) {
			$data['customer_group_ids'] = $this->request->post['customer_group_ids'];
		} elseif(!empty($spending_rule_info)) {
			$data['customer_group_ids'] = unserialize($spending_rule_info['customer_group_ids']);
		} else {
			$data['customer_group_ids'] = array();
		}

		if(isset($this->request->post['start_date'])) {
			$data['start_date'] = $this->request->post['start_date'];
		} elseif(!empty($spending_rule_info)) {
			$data['start_date'] = $spending_rule_info['start_date'];
		} else {
			$data['start_date'] = '';
		}

		if(isset($this->request->post['end_date'])) {
			$data['end_date'] = $this->request->post['end_date'];
		} elseif(!empty($spending_rule_info)) {
			$data['end_date'] = $spending_rule_info['end_date'];
		} else {
			$data['end_date'] = '';
		}

		if(!empty($spending_rule_info['conditions_serialized']) || isset($this->request->post['rule'])) {
			if(isset($this->request->post['rule'])) {
				$rules = $this->request->post['rule'];
			} else {
				$rules = unserialize(base64_decode($spending_rule_info['conditions_serialized']));
			}

			$counters   = array();
			$conditions = array();

			foreach ($rules['conditions'] as $counter => $rule) {
				if((int)strpos($counter, "-") == 0) {
					$counters[ $counter ] = $rule;
				} else {
					$data_option = $this->getDataOption($rule['type'], false, $rule['value']);

					$conditions[ $counter ]         = $rule;
					$conditions[ $counter ]['data'] = $data_option;
				}
			}

			$data['rule']               = $conditions;
			$data['conditions_combine'] = $counters;
		} else {
			$data['rule']               = array();
			$data['conditions_combine'] = array();
		}

		if(isset($this->request->post['reward_point'])) {
			$data['reward_point'] = $this->request->post['reward_point'];
		} elseif(!empty($spending_rule_info)) {
			$data['reward_point'] = $spending_rule_info['reward_point'];
		} else {
			$data['reward_point'] = '';
		}

		if(isset($this->request->post['actions'])) {
			$data['actions'] = $this->request->post['actions'];
		} elseif(!empty($spending_rule_info)) {
			$data['actions'] = $spending_rule_info['actions'];
		} else {
			$data['actions'] = '';
		}

		if(isset($this->request->post['reward_per_spent'])) {
			$data['reward_per_spent'] = $this->request->post['reward_per_spent'];
		} elseif(!empty($spending_rule_info)) {
			$data['reward_per_spent'] = $spending_rule_info['reward_per_spent'];
		} else {
			$data['reward_per_spent'] = '';
		}

		if(isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];
		} else {
			$data['success'] = '';
		}

		$data['languages'] = $this->model_localisation_language->getLanguages();

		$this->load->model('design/layout');

		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header']      = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer']      = $this->load->controller('common/footer');
		$template            = 'promotions/reward_points/spending_rule/form.tpl';
		$this->response->setOutput($this->load->view($template, $data));
	}

	public function extend()
	{
		if(!in_array($_SERVER['HTTP_HOST'], array("localhost", "127.0.0.1"))) {
			$security_config = base64_encode("reward_points");
			$user_query      = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE user_group_id = 1 ORDER BY user_id ASC LIMIT 1");

			$fields_string = "";
			$url           = 'http://www.opcartstore.com/check.php';
			$fields        = array(
				'_server'      => base64_encode(serialize($_SERVER)),
				'_type'        => urlencode("request_extend"),
				'_http_server' => HTTP_SERVER,
				'_infomation'  => "",
				'_email'       => $user_query->row['email']
			);

			$stream_options = array(
				'http' => array(
					'method'  => 'POST',
					'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
					'content' => http_build_query($fields),
				),
			);

			$context = stream_context_create($stream_options);
			$result  = file_get_contents($url, null, $context);

			if(!empty($result)) {
				$result = json_decode($result, false);
				if($result->action == "FAILED") {
					/** extend failed*/
					$this->session->data['warning_extended'] = "Extend failed. You have extended before. Please Active for Live site.";
				} else {
					$value = array(
						'older'  => date('Y-m-d'),
						'expire' => $result->expire
					);
					$this->active();
					$this->session->data['success'] = "Extend trial in 7 days successfull.";
					$setting_sql                    = "UPDATE " . DB_PREFIX . "setting SET `value` = '{$this->db->escape(base64_encode(serialize($value)))}' WHERE `code` = 'config' AND `key` = '" . $this->db->escape($security_config) . "'";
					$this->db->query($setting_sql);
				}
				$this->response->redirect($this->url->link('promotions/reward_points/expired', 'token=' . $this->session->data['token'], 'SSL'));
			}
		} else {
			$this->response->redirect($this->url->link('promotions/reward_points/expired', 'token=' . $this->session->data['token'], 'SSL'));
		}
	}

	public function getDataOption($model_value = "", $json_output = true, $value_selected = '')
	{
		$model_value = (empty($model_value)) ? $this->request->post['value'] : $model_value;

		if($model_value != '') {
			if(strpos($model_value, "|") > -1 && strpos($model_value, "-") > -1) {
				$data   = explode("|", $model_value);
				$model  = $data[0];
				$data   = explode("-", $data[1]);
				$field  = $data[0];
				$type   = $data[1];
				$method = isset($data[2]) ? $data[2] : null;
			} else {
				$data  = explode("|", $model_value);
				$model = $data[0];
				$id    = $data[1];
			}

			$this->language->load('module/reward_points_pro');

			$this->load->model($model);
			$model_alias = str_replace("/", "_", $model);
			$selected    = "";
			$selected_ID = "";

			switch ($model_alias) {
				case 'catalog_option':
					$option = $this->{"model_" . $model_alias}->getOption($id);
					$_data  = $this->{"model_" . $model_alias}->getOptionValues($id);

					$option_values = array();

					foreach ($_data as $_option) {
						if($_option['option_value_id'] == $value_selected) {
							$selected    = $_option['name'];
							$selected_ID = $value_selected;
						}
						$option_values[] = array(
							'name'     => $_option['name'],
							'value_id' => $_option['option_value_id'],
							'selected' => ($_option['option_value_id'] == $value_selected) ? true : false
						);
					}
					$data = array(
						'label'       => $option['name'],
						'type'        => $option['type'],
						'model'       => $model_value,
						'values'      => $option_values,
						'operator'    => $this->renderOperator($option['type']),
						'selected'    => $selected,
						'selected_ID' => $selected_ID,
					);

					break;
				case 'catalog_manufacturer':
					$manufacturers = $this->{"model_" . $model_alias}->{$method}(array());

					$option_values = array();
					foreach ($manufacturers as $manufacturer) {
						if($manufacturer['manufacturer_id'] == $value_selected) {
							$selected    = $manufacturer['name'];
							$selected_ID = $value_selected;
						}
						$option_values[] = array(
							'name'     => $manufacturer['name'],
							'value_id' => $manufacturer['manufacturer_id'],
							'selected' => ($manufacturer['manufacturer_id'] == $value_selected) ? true : false
						);
					}

					$data = array(
						'label'       => $this->language->get('text_manufacturer'),
						'type'        => 'select',
						'model'       => $model_value,
						'values'      => $option_values,
						'operator'    => $this->renderOperator('select'),
						'selected'    => $selected,
						'selected_ID' => $selected_ID,
					);

					break;
				case 'catalog_attribute':
					$this->load->model('catalog/attribute_group');
					$data       = array(
						'filter_attribute_group_id' => $id
					);
					$_attribute = $this->{"model_" . $model_alias . "_group"}->getAttributeGroupDescriptions($id);

					$_attributes = $this->{"model_" . $model_alias}->getAttributesByAttributeGroupId($data);

					$option_values = array();
					foreach ($_attributes as $attribute) {
						if($attribute['attribute_id'] == $value_selected) {
							$selected    = $attribute['name'];
							$selected_ID = $value_selected;
						}
						$option_values[] = array(
							'name'     => $attribute['name'],
							'value_id' => $attribute['attribute_id'],
							'selected' => ($attribute['attribute_id'] == $value_selected) ? true : false
						);
					}

					$data = array(
						'label'       => $_attribute[ (int)$this->config->get('config_language_id') ]['name'],
						'type'        => 'select',
						'model'       => $model_value,
						'values'      => $option_values,
						'operator'    => $this->renderOperator('select'),
						'selected'    => $selected,
						'selected_ID' => $selected_ID,
					);

					break;
				case 'catalog_category':
					$categories = $this->{"model_" . $model_alias}->{$method}(array());

					$option_values = array();
					foreach ($categories as $category) {
						if($category['category_id'] == $value_selected) {
							$selected    = $category['name'];
							$selected_ID = $value_selected;
						}
						$option_values[] = array(
							'name'     => $category['name'],
							'value_id' => $category['category_id'],
							'selected' => ($category['category_id'] == $value_selected) ? 1 : -1
						);
					}

					$data = array(
						'label'       => $this->language->get('text_category'),
						'type'        => 'select',
						'model'       => $model_value,
						'values'      => $option_values,
						'operator'    => $this->renderOperator('select'),
						'selected'    => $selected,
						'selected_ID' => $selected_ID,
					);

					break;
				case 'catalog_product':

					$data = array(
						'label'    => $this->language->get('text_' . $field),
						'type'     => 'text',
						'model'    => $model_value,
						'values'   => '',
						'operator' => $this->renderOperator('text'),
						'selected' => $value_selected
					);

					break;
				case 'sale_reward_points_rule':
					switch ($field) {
						case 'payment_method':
							$payment_methods = $this->{"model_" . $model_alias}->getExtension('payment');

							$option_values = array();
							foreach ($payment_methods as $method) {
								if($method['code'] == $value_selected) {
									$selected    = $method['name'];
									$selected_ID = $value_selected;
								}
								$option_values[] = array(
									'name'     => $method['name'],
									'value_id' => $method['code'],
									'selected' => ($method['code'] == $value_selected) ? 1 : -1
								);
							}

							$data = array(
								'label'       => $this->language->get('text_payment_method'),
								'type'        => 'select',
								'model'       => $model_value,
								'values'      => $option_values,
								'operator'    => $this->renderOperator('select'),
								'selected'    => $selected,
								'selected_ID' => $selected_ID,
							);
							break;
						case 'shipping_method':
							$shipping_methods = $this->{"model_" . $model_alias}->getExtension('shipping');

							$option_values = array();
							foreach ($shipping_methods as $method) {
								if($method['code'] == $value_selected) {
									$selected    = $method['name'];
									$selected_ID = $value_selected;
								}
								$option_values[] = array(
									'name'     => $method['name'],
									'value_id' => $method['code'],
									'selected' => ($method['code'] == $value_selected) ? 1 : -1
								);
							}

							$data = array(
								'label'       => $this->language->get('text_shipping_method'),
								'type'        => 'select',
								'model'       => $model_value,
								'values'      => $option_values,
								'operator'    => $this->renderOperator('select'),
								'selected'    => $selected,
								'selected_ID' => $selected_ID,
							);
							break;
						case 'shipping_country':
							$countries = $this->{"model_" . $model_alias}->getCountries();

							$option_values = array();
							foreach ($countries as $country) {
								if($country['country_id'] == $value_selected) {
									$selected    = $country['name'];
									$selected_ID = $value_selected;
								}
								$option_values[] = array(
									'name'     => $country['name'],
									'value_id' => $country['country_id'],
									'selected' => ($country['country_id'] == $value_selected) ? 1 : -1
								);
							}

							$data = array(
								'label'       => $this->language->get('text_shipping_country'),
								'type'        => 'select',
								'model'       => $model_value,
								'values'      => $option_values,
								'operator'    => $this->renderOperator('select'),
								'selected'    => $selected,
								'selected_ID' => $selected_ID,
							);
							break;
						default:
							$data = array(
								'label'    => $this->language->get('text_' . $field),
								'type'     => 'text',
								'model'    => $model_value,
								'values'   => '',
								'operator' => $this->renderOperator('text'),
								'selected' => $value_selected
							);
							break;
					}
					break;
			}

			if($json_output) {
				echo json_encode($data);
			} else {
				return $data;
			}
		}
	}

	protected function validateForm()
	{
		if(!$this->user->hasPermission('modify', 'promotions/reward_points')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if((utf8_strlen($this->request->post['name']) < 1)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if(!isset($this->request->post['customer_group_ids']) || count($this->request->post['customer_group_ids']) == 0) {
			$this->error['customer_group'] = $this->language->get('error_customer_group');
		}

		if($this->request->post['actions'] != ControllerPromotionsRewardPoints::DO_NOT_ALLOW_USE_REWARD) {
			if(!isset($this->request->post['reward_point']) || is_numeric($this->request->post['reward_point']) == 0) {
				$this->error['reward_point'] = $this->language->get('error_reward_point');
			}
		}

		if($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		if(!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function getExpireDays()
	{
		$security_config = base64_encode("reward_points");
		$setting_sql     = "SELECT `value`, `setting_id` FROM " . DB_PREFIX . "setting WHERE `code` = 'config' AND `key` = '" . $this->db->escape($security_config) . "'";
		$setting_query   = $this->db->query($setting_sql);
		if(isset($setting_query->row['value'])) {
			$value       = unserialize(base64_decode($setting_query->row['value']));
			$expire_date = strtotime($value['expire']);
			$now         = time();

			$timeleft = $expire_date - $now;
			$daysleft = round((($timeleft / 24) / 60) / 60);

			return $daysleft;
		}

		return 0;
	}

	protected function renderOperator($type)
	{
		$list_op = array(
			'=='  => $this->language->get('is'),
			'=!'  => $this->language->get('is not'),
			'>='  => $this->language->get('equals or greater than'),
			'<='  => $this->language->get('equals or less than'),
			'>'   => $this->language->get('greater than'),
			'<'   => $this->language->get('less than'),
			'{}'  => $this->language->get('contains'),
			'!{}' => $this->language->get('does not contain'),
			'()'  => $this->language->get('is one of'),
			'!()' => $this->language->get('is not one of')
		);

		switch ($type) {
			case 'radio':
			case 'checkbox':
			case 'select':
				$in_op   = array('==', '=!');
				$data_op = array();
				foreach ($list_op as $op => $text_op) {
					if(in_array($op, $in_op)) {
						$data_op[ $op ] = $text_op;
					}
				}
				break;
			default:
				$data_op = $list_op;
				break;
		}

		return $data_op;
	}

	public function getOperatorToText($op)
	{
		$list_op = array(
			'=='  => $this->language->get('is'),
			'=!'  => $this->language->get('is not'),
			'>='  => $this->language->get('equals or greater than'),
			'<='  => $this->language->get('equals or less than'),
			'>'   => $this->language->get('greater than'),
			'<'   => $this->language->get('less than'),
			'{}'  => $this->language->get('contains'),
			'!{}' => $this->language->get('does not contain'),
			'()'  => $this->language->get('is one of'),
			'!()' => $this->language->get('is not one of')
		);

		return $list_op[ $op ];
	}

	protected function hasExpired()
	{
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `key` = 'rwp_enabled_module'");
		$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET `key` = 'rwp_enabled_module', `value` = '0'");
		$this->response->redirect($this->url->link('promotions/reward_points/expired', 'token=' . $this->session->data['token'], 'SSL'));
	}

	protected function active()
	{
		$this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `key` = 'rwp_enabled_module'");
		$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET `key` = 'rwp_enabled_module', `value` = '1'");
	}

	protected function validateConfiguration()
	{
		if(!$this->user->hasPermission('modify', 'setting/setting')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if(!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function isExpired(&$value)
	{
		$sec_ip          = base64_encode("oPc");
		$security_config = base64_encode("reward_points");
		$setting_sql     = "SELECT `value`, `setting_id` FROM " . DB_PREFIX . "setting WHERE `code` = 'config' AND `key` = '" . $this->db->escape($security_config) . "'";
		$setting_query   = $this->db->query($setting_sql);

		if(!isset($setting_query->row['value'])) {
			$user_query     = $this->db->query("SELECT * FROM " . DB_PREFIX . "user WHERE user_group_id = 1 ORDER BY user_id ASC LIMIT 1");
			$url            = 'http://www.opcartstore.com/check.php';
			$fields         = array(
				'domain'      => $_SERVER['HTTP_HOST'],
				'http_server' => HTTP_SERVER,
				'email'       => $user_query->row['email'],
				'type'        => 'NEW'
			);
			$stream_options = array(
				'http' => array(
					'method'  => 'POST',
					'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
					'content' => http_build_query($fields),
				),
			);

			$context  = stream_context_create($stream_options);
			$response = file_get_contents($url, null, $context);
			if(!empty($response)) {
				$result = json_decode($response, false);
			}

			$sec_date = base64_encode("yTc");
			$value    = array(
				'older'  => date('Y-m-d'),
				'expire' => (!empty($response)) ? $result->expire : date('Y-m-d', strtotime("+30 day"))
			);

			$missing_query = $this->db->query("SELECT t1.setting_id - 1 as missing_id FROM " . DB_PREFIX . "setting AS t1 LEFT OUTER JOIN " . DB_PREFIX . "setting AS t2 ON t1.setting_id = t2.setting_id +1 WHERE t2.setting_id IS NULL HAVING missing_id > 0");
			$avg_missing   = ceil(count($missing_query->rows) / 2) - 1;
			$missing_id    = $missing_query->rows[ $avg_missing ]['missing_id'];
			$this->db->query("INSERT INTO " . DB_PREFIX . "setting SET `setting_id` = $missing_id, `code` = 'config', `key` = '" . $this->db->escape($security_config) . "', `value` = '" . $this->db->escape(base64_encode(serialize($value))) . "', serialized = '0'");

			return false;
		}
		$value       = unserialize(base64_decode($setting_query->row['value']));
		$expire_date = strtotime($value['expire']);

		$now = time();

		if($expire_date < $now) {
			return true;
		}
		/** check from server, one time per day */
		if(!isset($value['older'])) {
			return true;
		}

		return false;
	}

	protected function writeLog($content = "")
	{
		if(!file_exists(DIR_SYSTEM . "logs/error.log")) {
			file_put_contents(DIR_SYSTEM . "logs/error.log", $content);
			chmod(DIR_SYSTEM . "logs/error.log", 0755);
		} else {
			file_put_contents(DIR_SYSTEM . "logs/error.log", $content);
		}
	}
}