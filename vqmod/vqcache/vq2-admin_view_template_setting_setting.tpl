<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
<div class="breadcrumbox">
	<ul class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
	<?php } ?>
	 </ul>	
    </div>
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-setting" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-setting" class="form-horizontal">
          <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
            <li><a href="#tab-store" data-toggle="tab"><?php echo $tab_store; ?></a></li>
            <li><a href="#tab-local" data-toggle="tab"><?php echo $tab_local; ?></a></li>
            <li><a href="#tab-option" data-toggle="tab"><?php echo $tab_option; ?></a></li>
            <li><a href="#tab-image" data-toggle="tab"><?php echo $tab_image; ?></a></li>
            <li><a href="#tab-ftp" data-toggle="tab"><?php echo $tab_ftp; ?></a></li>
            <li><a href="#tab-mail" data-toggle="tab"><?php echo $tab_mail; ?></a></li>
            <li><a href="#tab-fraud" data-toggle="tab"><?php echo $tab_fraud; ?></a></li>
            <li><a href="#tab-server" data-toggle="tab"><?php echo $tab_server; ?></a></li>

                    <!--
                    /**
                        *Ajax advanced search starts
                        */
                    -->
                    <li><a href="#tab-ajaxadvancedsearch" data-toggle="tab"><?php echo $tab_ajaxadvancedsearch; ?></a></li>
                    <!--
                    /**
                        *Ajax advanced search ends
                        */
                    -->
                
            <li><a href="#tab-google" data-toggle="tab"><?php echo $tab_google; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-general">
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_name" value="<?php echo $config_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
                  <?php if ($error_name) { ?>
                  <div class="text-danger"><?php echo $error_name; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-owner"><?php echo $entry_owner; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_owner" value="<?php echo $config_owner; ?>" placeholder="<?php echo $entry_owner; ?>" id="input-owner" class="form-control" />
                  <?php if ($error_owner) { ?>
                  <div class="text-danger"><?php echo $error_owner; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-address"><?php echo $entry_address; ?></label>
                <div class="col-sm-10">
                  <textarea name="config_address" placeholder="<?php echo $entry_address; ?>" rows="5" id="input-address" class="form-control"><?php echo $config_address; ?></textarea>
                  <?php if ($error_address) { ?>
                  <div class="text-danger"><?php echo $error_address; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-geocode"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_geocode; ?>"><?php echo $entry_geocode; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="config_geocode" value="<?php echo $config_geocode; ?>" placeholder="<?php echo $entry_geocode; ?>" id="input-geocode" class="form-control" />
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_email" value="<?php echo $config_email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                  <?php if ($error_email) { ?>
                  <div class="text-danger"><?php echo $error_email; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_telephone" value="<?php echo $config_telephone; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone" class="form-control" />
                  <?php if ($error_telephone) { ?>
                  <div class="text-danger"><?php echo $error_telephone; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_fax" value="<?php echo $config_fax; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-image"><?php echo $entry_image; ?></label>
                <div class="col-sm-10"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="config_image" value="<?php echo $config_image; ?>" id="input-image" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-open"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_open; ?>"><?php echo $entry_open; ?></span></label>
                <div class="col-sm-10">
                  <textarea name="config_open" rows="5" placeholder="<?php echo $entry_open; ?>" id="input-open" class="form-control"><?php echo $config_open; ?></textarea>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-comment"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_comment; ?>"><?php echo $entry_comment; ?></span></label>
                <div class="col-sm-10">
                  <textarea name="config_comment" rows="5" placeholder="<?php echo $entry_comment; ?>" id="input-comment" class="form-control"><?php echo $config_comment; ?></textarea>
                </div>
              </div>
              <?php if ($locations) { ?>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_location; ?>"><?php echo $entry_location; ?></span></label>
                <div class="col-sm-10">
                  <?php foreach ($locations as $location) { ?>
                  <div class="checkbox">
                    <label>
                      <?php if (in_array($location['location_id'], $config_location)) { ?>
                      <input type="checkbox" name="config_location[]" value="<?php echo $location['location_id']; ?>" checked="checked" />
                      <?php echo $location['name']; ?>
                      <?php } else { ?>
                      <input type="checkbox" name="config_location[]" value="<?php echo $location['location_id']; ?>" />
                      <?php echo $location['name']; ?>
                      <?php } ?>
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
            </div>
            <div class="tab-pane" id="tab-store">
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-meta-title"><?php echo $entry_meta_title; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_meta_title" value="<?php echo $config_meta_title; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title" class="form-control" />
                  <?php if ($error_meta_title) { ?>
                  <div class="text-danger"><?php echo $error_meta_title; ?></div>
                  <?php } ?>
                </div>
              </div>
			   <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-meta-title"><?php echo $entry_paypal_merchant; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_paypal_merchant" value="<?php echo $config_paypal_merchant; ?>" placeholder="<?php echo $entry_paypal_merchant; ?>" id="input-meta-title" class="form-control" />
                  <?php if ($error_paypal_merchant) { ?>
                  <div class="text-danger"><?php echo $error_paypal_merchant; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-meta-description"><?php echo $entry_meta_description; ?></label>
                <div class="col-sm-10">
                  <textarea name="config_meta_description" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description" class="form-control"><?php echo $config_meta_description; ?></textarea>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-meta-keyword"><?php echo $entry_meta_keyword; ?></label>
                <div class="col-sm-10">
                  <textarea name="config_meta_keyword" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword" class="form-control"><?php echo $config_meta_keyword; ?></textarea>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-template"><?php echo $entry_template; ?></label>
                <div class="col-sm-10">
                  <select name="config_template" id="input-template" class="form-control">
                    <?php foreach ($templates as $template) { ?>
                    <?php if ($template == $config_template) { ?>
                    <option value="<?php echo $template; ?>" selected="selected"><?php echo $template; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $template; ?>"><?php echo $template; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                  <br />
                  <img src="" alt="" id="template" class="img-thumbnail" /></div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-layout"><?php echo $entry_layout; ?></label>
                <div class="col-sm-10">
                  <select name="config_layout_id" id="input-layout" class="form-control">
                    <?php foreach ($layouts as $layout) { ?>
                    <?php if ($layout['layout_id'] == $config_layout_id) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-local">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-country"><?php echo $entry_country; ?></label>
                <div class="col-sm-10">
                  <select name="config_country_id" id="input-country" class="form-control">
                    <?php foreach ($countries as $country) { ?>
                    <?php if ($country['country_id'] == $config_country_id) { ?>
                    <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-zone"><?php echo $entry_zone; ?></label>
                <div class="col-sm-10">
                  <select name="config_zone_id" id="input-zone" class="form-control">
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-language"><?php echo $entry_language; ?></label>
                <div class="col-sm-10">
                  <select name="config_language" id="input-language" class="form-control">
                    <?php foreach ($languages as $language) { ?>
                    <?php if ($language['code'] == $config_language) { ?>
                    <option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-admin-language"><?php echo $entry_admin_language; ?></label>
                <div class="col-sm-10">
                  <select name="config_admin_language" id="input-admin-language" class="form-control">
                    <?php foreach ($languages as $language) { ?>
                    <?php if ($language['code'] == $config_admin_language) { ?>
                    <option value="<?php echo $language['code']; ?>" selected="selected"><?php echo $language['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $language['code']; ?>"><?php echo $language['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-currency"><span data-toggle="tooltip" title="<?php echo $help_currency; ?>"><?php echo $entry_currency; ?></span></label>
                <div class="col-sm-10">
                  <select name="config_currency" id="input-currency" class="form-control">
                    <?php foreach ($currencies as $currency) { ?>
                    <?php if ($currency['code'] == $config_currency) { ?>
                    <option value="<?php echo $currency['code']; ?>" selected="selected"><?php echo $currency['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_currency_auto; ?>"><?php echo $entry_currency_auto; ?></span></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_currency_auto) { ?>
                    <input type="radio" name="config_currency_auto" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_currency_auto" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_currency_auto) { ?>
                    <input type="radio" name="config_currency_auto" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_currency_auto" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-length-class"><?php echo $entry_length_class; ?></label>
                <div class="col-sm-10">
                  <select name="config_length_class_id" id="input-length-class" class="form-control">
                    <?php foreach ($length_classes as $length_class) { ?>
                    <?php if ($length_class['length_class_id'] == $config_length_class_id) { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-weight-class"><?php echo $entry_weight_class; ?></label>
                <div class="col-sm-10">
                  <select name="config_weight_class_id" id="input-weight-class" class="form-control">
                    <?php foreach ($weight_classes as $weight_class) { ?>
                    <?php if ($weight_class['weight_class_id'] == $config_weight_class_id) { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-option">
              <fieldset>
                <legend><?php echo $text_product; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_product_count; ?>"><?php echo $entry_product_count; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_product_count) { ?>
                      <input type="radio" name="config_product_count" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_product_count" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_product_count) { ?>
                      <input type="radio" name="config_product_count" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_product_count" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-catalog-limit"><span data-toggle="tooltip" title="<?php echo $help_product_limit; ?>"><?php echo $entry_product_limit; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_product_limit" value="<?php echo $config_product_limit; ?>" placeholder="<?php echo $entry_product_limit; ?>" id="input-catalog-limit" class="form-control" />
                    <?php if ($error_product_limit) { ?>
                    <div class="text-danger"><?php echo $error_product_limit; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-list-description-limit"><span data-toggle="tooltip" title="<?php echo $help_product_description_length; ?>"><?php echo $entry_product_description_length; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_product_description_length" value="<?php echo $config_product_description_length; ?>" placeholder="<?php echo $entry_product_description_length; ?>" id="input-list-description-limit" class="form-control" />
                    <?php if ($error_product_description_length) { ?>
                    <div class="text-danger"><?php echo $error_product_description_length; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-admin-limit"><span data-toggle="tooltip" title="<?php echo $help_limit_admin; ?>"><?php echo $entry_limit_admin; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_limit_admin" value="<?php echo $config_limit_admin; ?>" placeholder="<?php echo $entry_limit_admin; ?>" id="input-admin-limit" class="form-control" />
                    <?php if ($error_limit_admin) { ?>
                    <div class="text-danger"><?php echo $error_limit_admin; ?></div>
                    <?php } ?>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_review; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_review; ?>"><?php echo $entry_review; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_review_status) { ?>
                      <input type="radio" name="config_review_status" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_review_status" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_review_status) { ?>
                      <input type="radio" name="config_review_status" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_review_status" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_review_guest; ?>"><?php echo $entry_review_guest; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_review_guest) { ?>
                      <input type="radio" name="config_review_guest" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_review_guest" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_review_guest) { ?>
                      <input type="radio" name="config_review_guest" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_review_guest" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_review_mail; ?>"><?php echo $entry_review_mail; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_review_mail) { ?>
                      <input type="radio" name="config_review_mail" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_review_mail" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_review_mail) { ?>
                      <input type="radio" name="config_review_mail" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_review_mail" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_voucher; ?></legend>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-voucher-min"><span data-toggle="tooltip" title="<?php echo $help_voucher_min; ?>"><?php echo $entry_voucher_min; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_voucher_min" value="<?php echo $config_voucher_min; ?>" placeholder="<?php echo $entry_voucher_min; ?>" id="input-voucher-min" class="form-control" />
                    <?php if ($error_voucher_min) { ?>
                    <div class="text-danger"><?php echo $error_voucher_min; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-voucher-max"><span data-toggle="tooltip" title="<?php echo $help_voucher_max; ?>"><?php echo $entry_voucher_max; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_voucher_max" value="<?php echo $config_voucher_max; ?>" placeholder="<?php echo $entry_voucher_max; ?>" id="input-voucher-max" class="form-control" />
                    <?php if ($error_voucher_max) { ?>
                    <div class="text-danger"><?php echo $error_voucher_max; ?></div>
                    <?php } ?>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_tax; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><?php echo $entry_tax; ?></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_tax) { ?>
                      <input type="radio" name="config_tax" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_tax" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_tax) { ?>
                      <input type="radio" name="config_tax" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_tax" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-tax-default"><span data-toggle="tooltip" title="<?php echo $help_tax_default; ?>"><?php echo $entry_tax_default; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_tax_default" id="input-tax-default" class="form-control">
                      <option value=""><?php echo $text_none; ?></option>
                      <?php  if ($config_tax_default == 'shipping') { ?>
                      <option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
                      <?php } else { ?>
                      <option value="shipping"><?php echo $text_shipping; ?></option>
                      <?php } ?>
                      <?php  if ($config_tax_default == 'payment') { ?>
                      <option value="payment" selected="selected"><?php echo $text_payment; ?></option>
                      <?php } else { ?>
                      <option value="payment"><?php echo $text_payment; ?></option>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-tax-customer"><span data-toggle="tooltip" title="<?php echo $help_tax_customer; ?>"><?php echo $entry_tax_customer; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_tax_customer" id="input-tax-customer" class="form-control">
                      <option value=""><?php echo $text_none; ?></option>
                      <?php  if ($config_tax_customer == 'shipping') { ?>
                      <option value="shipping" selected="selected"><?php echo $text_shipping; ?></option>
                      <?php } else { ?>
                      <option value="shipping"><?php echo $text_shipping; ?></option>
                      <?php } ?>
                      <?php  if ($config_tax_customer == 'payment') { ?>
                      <option value="payment" selected="selected"><?php echo $text_payment; ?></option>
                      <?php } else { ?>
                      <option value="payment"><?php echo $text_payment; ?></option>
                      <?php } ?>
                    </select>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_account; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_customer_online; ?>"><?php echo $entry_customer_online; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_customer_online) { ?>
                      <input type="radio" name="config_customer_online" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_customer_online" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_customer_online) { ?>
                      <input type="radio" name="config_customer_online" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_customer_online" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-customer-group"><span data-toggle="tooltip" title="<?php echo $help_customer_group; ?>"><?php echo $entry_customer_group; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_customer_group_id" id="input-customer-group" class="form-control">
                      <?php foreach ($customer_groups as $customer_group) { ?>
                      <?php if ($customer_group['customer_group_id'] == $config_customer_group_id) { ?>
                      <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_customer_group_display; ?>"><?php echo $entry_customer_group_display; ?></span></label>
                  <div class="col-sm-10">
                    <?php foreach ($customer_groups as $customer_group) { ?>
                    <div class="checkbox">
                      <label>
                        <?php if (in_array($customer_group['customer_group_id'], $config_customer_group_display)) { ?>
                        <input type="checkbox" name="config_customer_group_display[]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                        <?php echo $customer_group['name']; ?>
                        <?php } else { ?>
                        <input type="checkbox" name="config_customer_group_display[]" value="<?php echo $customer_group['customer_group_id']; ?>" />
                        <?php echo $customer_group['name']; ?>
                        <?php } ?>
                      </label>
                    </div>
                    <?php } ?>
                    <?php if ($error_customer_group_display) { ?>
                    <div class="text-danger"><?php echo $error_customer_group_display; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_customer_price; ?>"><?php echo $entry_customer_price; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_customer_price) { ?>
                      <input type="radio" name="config_customer_price" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_customer_price" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_customer_price) { ?>
                      <input type="radio" name="config_customer_price" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_customer_price" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-login-attempts"><span data-toggle="tooltip" title="<?php echo $help_login_attempts; ?>"><?php echo $entry_login_attempts; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_login_attempts" value="<?php echo $config_login_attempts; ?>" placeholder="<?php echo $entry_login_attempts; ?>" id="input-login-attempts" class="form-control" />
                    <?php if ($error_login_attempts) { ?>
                    <div class="text-danger"><?php echo $error_login_attempts; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-account"><span data-toggle="tooltip" title="<?php echo $help_account; ?>"><?php echo $entry_account; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_account_id" id="input-account" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <?php foreach ($informations as $information) { ?>
                      <?php if ($information['information_id'] == $config_account_id) { ?>
                      <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_account_mail; ?>"><?php echo $entry_account_mail; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_account_mail) { ?>
                      <input type="radio" name="config_account_mail" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_account_mail" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_account_mail) { ?>
                      <input type="radio" name="config_account_mail" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_account_mail" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_checkout; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-invoice-prefix"><span data-toggle="tooltip" title="<?php echo $help_invoice_prefix; ?>"><?php echo $entry_invoice_prefix; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_invoice_prefix" value="<?php echo $config_invoice_prefix; ?>" placeholder="<?php echo $entry_invoice_prefix; ?>" id="input-invoice-prefix" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-api"><span data-toggle="tooltip" title="<?php echo $help_api; ?>"><?php echo $entry_api; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_api_id" id="input-api" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <?php foreach ($apis as $api) { ?>
                      <?php if ($api['api_id'] == $config_api_id) { ?>
                      <option value="<?php echo $api['api_id']; ?>" selected="selected"><?php echo $api['username']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $api['api_id']; ?>"><?php echo $api['username']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_cart_weight; ?>"><?php echo $entry_cart_weight; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_cart_weight) { ?>
                      <input type="radio" name="config_cart_weight" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_cart_weight" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_cart_weight) { ?>
                      <input type="radio" name="config_cart_weight" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_cart_weight" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_checkout_guest; ?>"><?php echo $entry_checkout_guest; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_checkout_guest) { ?>
                      <input type="radio" name="config_checkout_guest" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_checkout_guest" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_checkout_guest) { ?>
                      <input type="radio" name="config_checkout_guest" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_checkout_guest" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-checkout"><span data-toggle="tooltip" title="<?php echo $help_checkout; ?>"><?php echo $entry_checkout; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_checkout_id" id="input-checkout" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <?php foreach ($informations as $information) { ?>
                      <?php if ($information['information_id'] == $config_checkout_id) { ?>
                      <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-order-status"><span data-toggle="tooltip" title="<?php echo $help_order_status; ?>"><?php echo $entry_order_status; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_order_status_id" id="input-order-status" class="form-control">
                      <?php foreach ($order_statuses as $order_status) { ?>
                      <?php if ($order_status['order_status_id'] == $config_order_status_id) { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-process-status"><span data-toggle="tooltip" title="<?php echo $help_processing_status; ?>"><?php echo $entry_processing_status; ?></span></label>
                  <div class="col-sm-10">
                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                      <?php foreach ($order_statuses as $order_status) { ?>
                      <div class="checkbox">
                        <label>
                          <?php if (in_array($order_status['order_status_id'], $config_processing_status)) { ?>
                          <input type="checkbox" name="config_processing_status[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
                          <?php echo $order_status['name']; ?>
                          <?php } else { ?>
                          <input type="checkbox" name="config_processing_status[]" value="<?php echo $order_status['order_status_id']; ?>" />
                          <?php echo $order_status['name']; ?>
                          <?php } ?>
                        </label>
                      </div>
                      <?php } ?>
                    </div>
                    <?php if ($error_processing_status) { ?>
                    <div class="text-danger"><?php echo $error_processing_status; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-complete-status"><span data-toggle="tooltip" title="<?php echo $help_complete_status; ?>"><?php echo $entry_complete_status; ?></span></label>
                  <div class="col-sm-10">
                    <div class="well well-sm" style="height: 150px; overflow: auto;">
                      <?php foreach ($order_statuses as $order_status) { ?>
                      <div class="checkbox">
                        <label>
                          <?php if (in_array($order_status['order_status_id'], $config_complete_status)) { ?>
                          <input type="checkbox" name="config_complete_status[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
                          <?php echo $order_status['name']; ?>
                          <?php } else { ?>
                          <input type="checkbox" name="config_complete_status[]" value="<?php echo $order_status['order_status_id']; ?>" />
                          <?php echo $order_status['name']; ?>
                          <?php } ?>
                        </label>
                      </div>
                      <?php } ?>
                    </div>
                    <?php if ($error_complete_status) { ?>
                    <div class="text-danger"><?php echo $error_complete_status; ?></div>
                    <?php } ?>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_order_mail; ?>"><?php echo $entry_order_mail; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_order_mail) { ?>
                      <input type="radio" name="config_order_mail" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_order_mail" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_order_mail) { ?>
                      <input type="radio" name="config_order_mail" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_order_mail" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_stock; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_stock_display; ?>"><?php echo $entry_stock_display; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_stock_display) { ?>
                      <input type="radio" name="config_stock_display" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_stock_display" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_stock_display) { ?>
                      <input type="radio" name="config_stock_display" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_stock_display" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_stock_warning; ?>"><?php echo $entry_stock_warning; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_stock_warning) { ?>
                      <input type="radio" name="config_stock_warning" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_stock_warning" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_stock_warning) { ?>
                      <input type="radio" name="config_stock_warning" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_stock_warning" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_stock_checkout; ?>"><?php echo $entry_stock_checkout; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_stock_checkout) { ?>
                      <input type="radio" name="config_stock_checkout" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_stock_checkout" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_stock_checkout) { ?>
                      <input type="radio" name="config_stock_checkout" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_stock_checkout" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_affiliate; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_affiliate_approval; ?>"><?php echo $entry_affiliate_approval; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_affiliate_approval) { ?>
                      <input type="radio" name="config_affiliate_approval" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_affiliate_approval" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_affiliate_approval) { ?>
                      <input type="radio" name="config_affiliate_approval" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_affiliate_approval" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_affiliate_auto; ?>"><?php echo $entry_affiliate_auto; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_stock_checkout) { ?>
                      <input type="radio" name="config_affiliate_auto" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_affiliate_auto" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_stock_checkout) { ?>
                      <input type="radio" name="config_affiliate_auto" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_affiliate_auto" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-affiliate-commission"><span data-toggle="tooltip" title="<?php echo $help_affiliate_commission; ?>"><?php echo $entry_affiliate_commission; ?></span></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_affiliate_commission" value="<?php echo $config_affiliate_commission; ?>" placeholder="<?php echo $entry_affiliate_commission; ?>" id="input-affiliate-commission" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-affiliate"><span data-toggle="tooltip" title="<?php echo $help_affiliate; ?>"><?php echo $entry_affiliate; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_affiliate_id" id="input-affiliate" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <?php foreach ($informations as $information) { ?>
                      <?php if ($information['information_id'] == $config_affiliate_id) { ?>
                      <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_affiliate_mail; ?>"><?php echo $entry_affiliate_mail; ?></span></label>
                  <div class="col-sm-10">
                    <label class="radio-inline">
                      <?php if ($config_affiliate_mail) { ?>
                      <input type="radio" name="config_affiliate_mail" value="1" checked="checked" />
                      <?php echo $text_yes; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_affiliate_mail" value="1" />
                      <?php echo $text_yes; ?>
                      <?php } ?>
                    </label>
                    <label class="radio-inline">
                      <?php if (!$config_affiliate_mail) { ?>
                      <input type="radio" name="config_affiliate_mail" value="0" checked="checked" />
                      <?php echo $text_no; ?>
                      <?php } else { ?>
                      <input type="radio" name="config_affiliate_mail" value="0" />
                      <?php echo $text_no; ?>
                      <?php } ?>
                    </label>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_return; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-return"><span data-toggle="tooltip" title="<?php echo $help_return; ?>"><?php echo $entry_return; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_return_id" id="input-return" class="form-control">
                      <option value="0"><?php echo $text_none; ?></option>
                      <?php foreach ($informations as $information) { ?>
                      <?php if ($information['information_id'] == $config_return_id) { ?>
                      <option value="<?php echo $information['information_id']; ?>" selected="selected"><?php echo $information['title']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $information['information_id']; ?>"><?php echo $information['title']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-return-status"><span data-toggle="tooltip" title="<?php echo $help_return_status; ?>"><?php echo $entry_return_status; ?></span></label>
                  <div class="col-sm-10">
                    <select name="config_return_status_id" id="input-return-status" class="form-control">
                      <?php foreach ($return_statuses as $return_status) { ?>
                      <?php if ($return_status['return_status_id'] == $config_return_status_id) { ?>
                      <option value="<?php echo $return_status['return_status_id']; ?>" selected="selected"><?php echo $return_status['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $return_status['return_status_id']; ?>"><?php echo $return_status['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select>
                  </div>
                </div>
              </fieldset>
            </div>
            <div class="tab-pane" id="tab-image">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-logo"><?php echo $entry_logo; ?></label>
                <div class="col-sm-10"><a href="" id="thumb-logo" data-toggle="image" class="img-thumbnail"><img src="<?php echo $logo; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="config_logo" value="<?php echo $config_logo; ?>" id="input-logo" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-icon"><?php echo $entry_icon; ?></label>
                <div class="col-sm-10"><a href="" id="thumb-icon" data-toggle="image" class="img-thumbnail"><img src="<?php echo $icon; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
                  <input type="hidden" name="config_icon" value="<?php echo $config_icon; ?>" id="input-icon" />
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-category-width"><?php echo $entry_image_category; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_category_width" value="<?php echo $config_image_category_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-category-width" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_category_height" value="<?php echo $config_image_category_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_category) { ?>
                  <div class="text-danger"><?php echo $error_image_category; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-thumb-width"><?php echo $entry_image_thumb; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_thumb_width" value="<?php echo $config_image_thumb_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-thumb-width" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_thumb_height" value="<?php echo $config_image_thumb_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_thumb) { ?>
                  <div class="text-danger"><?php echo $error_image_thumb; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-popup-width"><?php echo $entry_image_popup; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_popup_width" value="<?php echo $config_image_popup_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-popup-width" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_popup_height" value="<?php echo $config_image_popup_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_popup) { ?>
                  <div class="text-danger"><?php echo $error_image_popup; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-product-width"><?php echo $entry_image_product; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_product_width" value="<?php echo $config_image_product_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-product-width" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_product_height" value="<?php echo $config_image_product_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_product) { ?>
                  <div class="text-danger"><?php echo $error_image_product; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-additional-width"><?php echo $entry_image_additional; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_additional_width" value="<?php echo $config_image_additional_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-additional-width" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_additional_height" value="<?php echo $config_image_additional_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_additional) { ?>
                  <div class="text-danger"><?php echo $error_image_additional; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-related"><?php echo $entry_image_related; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_related_width" value="<?php echo $config_image_related_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-related" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_related_height" value="<?php echo $config_image_related_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_related) { ?>
                  <div class="text-danger"><?php echo $error_image_related; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-compare"><?php echo $entry_image_compare; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_compare_width" value="<?php echo $config_image_compare_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-compare" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_compare_height" value="<?php echo $config_image_compare_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_compare) { ?>
                  <div class="text-danger"><?php echo $error_image_compare; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-wishlist"><?php echo $entry_image_wishlist; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_wishlist_width" value="<?php echo $config_image_wishlist_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-wishlist" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_wishlist_height" value="<?php echo $config_image_wishlist_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_wishlist) { ?>
                  <div class="text-danger"><?php echo $error_image_wishlist; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-cart"><?php echo $entry_image_cart; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_cart_width" value="<?php echo $config_image_cart_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-cart" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_cart_height" value="<?php echo $config_image_cart_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_cart) { ?>
                  <div class="text-danger"><?php echo $error_image_cart; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-image-location"><?php echo $entry_image_location; ?></label>
                <div class="col-sm-10">
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="text" name="config_image_location_width" value="<?php echo $config_image_location_width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-image-location" class="form-control" />
                    </div>
                    <div class="col-sm-6">
                      <input type="text" name="config_image_location_height" value="<?php echo $config_image_location_height; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                    </div>
                  </div>
                  <?php if ($error_image_location) { ?>
                  <div class="text-danger"><?php echo $error_image_location; ?></div>
                  <?php } ?>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-ftp">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-ftp-host"><?php echo $entry_ftp_hostname; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_ftp_hostname" value="<?php echo $config_ftp_hostname; ?>" placeholder="<?php echo $entry_ftp_hostname; ?>" id="input-ftp-host" class="form-control" />
                  <?php if ($error_ftp_hostname) { ?>
                  <div class="text-danger"><?php echo $error_ftp_hostname; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-ftp-port"><?php echo $entry_ftp_port; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_ftp_port" value="<?php echo $config_ftp_port; ?>" placeholder="<?php echo $entry_ftp_port; ?>" id="input-ftp-port" class="form-control" />
                  <?php if ($error_ftp_port) { ?>
                  <div class="text-danger"><?php echo $error_ftp_port; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-ftp-username"><?php echo $entry_ftp_username; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_ftp_username" value="<?php echo $config_ftp_username; ?>" placeholder="<?php echo $entry_ftp_username; ?>" id="input-ftp-username" class="form-control" />
                  <?php if ($error_ftp_username) { ?>
                  <div class="text-danger"><?php echo $error_ftp_username; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-ftp-password"><?php echo $entry_ftp_password; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_ftp_password" value="<?php echo $config_ftp_password; ?>" placeholder="<?php echo $entry_ftp_password; ?>" id="input-ftp-password" class="form-control" />
                  <?php if ($error_ftp_password) { ?>
                  <div class="text-danger"><?php echo $error_ftp_password; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-ftp-root"><span data-toggle="tooltip" data-html="true" title="<?php echo htmlspecialchars($help_ftp_root); ?>"><?php echo $entry_ftp_root; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="config_ftp_root" value="<?php echo $config_ftp_root; ?>" placeholder="<?php echo $entry_ftp_root; ?>" id="input-ftp-root" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_ftp_status; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_ftp_status) { ?>
                    <input type="radio" name="config_ftp_status" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_ftp_status" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_ftp_status) { ?>
                    <input type="radio" name="config_ftp_status" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_ftp_status" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-mail">
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mail-protocol"><span data-toggle="tooltip" title="<?php echo $help_mail_protocol; ?>"><?php echo $entry_mail_protocol; ?></span></label>
                <div class="col-sm-10">
                  <select name="config_mail_protocol" id="input-mail-protocol" class="form-control">
                    <?php if ($config_mail_protocol == 'mail') { ?>
                    <option value="mail" selected="selected"><?php echo $text_mail; ?></option>
                    <?php } else { ?>
                    <option value="mail"><?php echo $text_mail; ?></option>
                    <?php } ?>
                    <?php if ($config_mail_protocol == 'smtp') { ?>
                    <option value="smtp" selected="selected"><?php echo $text_smtp; ?></option>
                    <?php } else { ?>
                    <option value="smtp"><?php echo $text_smtp; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mail-parameter"><span data-toggle="tooltip" title="<?php echo $help_mail_parameter; ?>"><?php echo $entry_mail_parameter; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="config_mail_parameter" value="<?php echo $config_mail_parameter; ?>" placeholder="<?php echo $entry_mail_parameter; ?>" id="input-mail-parameter" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mail-smtp-hostname"><span data-toggle="tooltip" title="<?php echo $help_mail_smtp_hostname; ?>"><?php echo $entry_mail_smtp_hostname; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="config_mail_smtp_hostname" value="<?php echo $config_mail_smtp_hostname; ?>" placeholder="<?php echo $entry_mail_smtp_hostname; ?>" id="input-mail-smtp-hostname" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mail-smtp-username"><?php echo $entry_mail_smtp_username; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_mail_smtp_username" value="<?php echo $config_mail_smtp_username; ?>" placeholder="<?php echo $entry_mail_smtp_username; ?>" id="input-mail-smtp-username" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mail-smtp-password"><?php echo $entry_mail_smtp_password; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_mail_smtp_password" value="<?php echo $config_mail_smtp_password; ?>" placeholder="<?php echo $entry_mail_smtp_password; ?>" id="input-mail-smtp-password" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mail-smtp-port"><?php echo $entry_mail_smtp_port; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_mail_smtp_port" value="<?php echo $config_mail_smtp_port; ?>" placeholder="<?php echo $entry_mail_smtp_port; ?>" id="input-mail-smtp-port" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-mail-smtp-timeout"><?php echo $entry_mail_smtp_timeout; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_mail_smtp_timeout" value="<?php echo $config_mail_smtp_timeout; ?>" placeholder="<?php echo $entry_mail_smtp_timeout; ?>" id="input-mail-smtp-timeout" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-alert-email"><span data-toggle="tooltip" title="<?php echo $help_mail_alert; ?>"><?php echo $entry_mail_alert; ?></span></label>
                <div class="col-sm-10">
                  <textarea name="config_mail_alert" rows="5" placeholder="<?php echo $entry_mail_alert; ?>" id="input-alert-email" class="form-control"><?php echo $config_mail_alert; ?></textarea>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-fraud">
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" data-html="true" data-trigger="click" title="<?php echo htmlspecialchars($help_fraud_detection); ?>"><?php echo $entry_fraud_detection; ?></span></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_fraud_detection) { ?>
                    <input type="radio" name="config_fraud_detection" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_fraud_detection" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_fraud_detection) { ?>
                    <input type="radio" name="config_fraud_detection" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_fraud_detection" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-fraud-key"><?php echo $entry_fraud_key; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_fraud_key" value="<?php echo $config_fraud_key; ?>" placeholder="<?php echo $entry_fraud_key; ?>" id="input-fraud-key" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-fraud-score"><span data-toggle="tooltip" title="<?php echo $help_fraud_score; ?>"><?php echo $entry_fraud_score; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="config_fraud_score" value="<?php echo $config_fraud_score; ?>" placeholder="<?php echo $entry_fraud_score; ?>" id="input-fraud-score" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-fraud-status"><span data-toggle="tooltip" title="<?php echo $help_fraud_status; ?>"><?php echo $entry_fraud_status; ?></span></label>
                <div class="col-sm-10">
                  <select name="config_fraud_status_id" id="input-fraud-status" class="form-control">
                    <?php foreach ($order_statuses as $order_status) { ?>
                    <?php if ($order_status['order_status_id'] == $config_fraud_status_id) { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </div>
              </div>
            </div>

                    <!--
                    /**
                        *Ajax advanced search starts
                        */
                    -->
                    <div class="tab-pane" id="tab-ajaxadvancedsearch">
                        <!-- 26-01-2014 starts -->
                        <style type="text/css">
                            .preview { width: 60px; height: 35px; background: #fff; border: 1px solid #dddddd; padding: 3px; }
                        </style>
                        <!-- 26-01-2014 ends -->
                        <ul class="nav nav-tabs">
                <li class="active"><a href="#tab-ajaxadvancedsearchgeneral" data-toggle="tab"><?php echo $tab_ajaxadvancedsearchgeneral; ?></a></li>
                <li><a href="#tab-ajaxadvancedsearchsearch" data-toggle="tab"><?php echo $tab_ajaxadvancedsearchsearch; ?></a></li>
                <li><a href="#tab-ajaxadvancedsearchshow" data-toggle="tab"><?php echo $tab_ajaxadvancedsearchshow; ?></a></li>
                <li><a href="#tab-ajaxadvancedsearchcolors" data-toggle="tab"><?php echo $tab_ajaxadvancedsearchcolors; ?></a></li>
                        </ul>
                        <?php $chk = 'checked="checked"';?>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab-ajaxadvancedsearchgeneral">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-status"><?php echo $text_ajaxadvancedsearch; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch" value="1" <?php if($config_ajaxadvancedsearch==1){echo $chk;}?> /> <?php echo $text_enabled; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch" value="0" <?php if($config_ajaxadvancedsearch==0 || !$config_ajaxadvancedsearch){echo $chk;}?> /> <?php echo $text_disabled; ?></label></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-input-limit"><span data-toggle="tooltip" title="<?php echo $help_ajaxadvancedsearch_limit; ?>"><?php echo $text_ajaxadvancedsearch_limit; ?></span></label>
                                    <div class="col-sm-10"><input type="text" class="form-control" name="config_ajaxadvancedsearch_limit" value="<?php echo $config_ajaxadvancedsearch_limit; ?>" /> </div>
                                </div>
                                <!-- 26-01-2014 starts -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-input-charlimit"><span data-toggle="tooltip" title="<?php echo $help_ajaxadvancedsearch_charlimit; ?>"><?php echo $text_ajaxadvancedsearch_charlimit; ?></span></label>
                                    <div class="col-sm-10"><input type="text" class="form-control" name="config_ajaxadvancedsearch_charlimit" value="<?php echo $config_ajaxadvancedsearch_charlimit; ?>" /> </div>
                                </div>
                                <!-- 26-01-2014 ends -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-display-image"><?php echo $text_display_image; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_image" value="1" <?php if($config_ajaxadvancedsearch_image==1){echo $chk;}?> /> <?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_image" value="0" <?php if($config_ajaxadvancedsearch_image==0 || !$config_ajaxadvancedsearch_image){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <div class="form-group required">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-image-size"><span data-toggle="tooltip" title="<?php echo $help_imagesize; ?>"><?php echo $text_imagesize; ?></span></label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" name="config_ajaxadvancedsearch_image_width" value="<?php echo $config_ajaxadvancedsearch_image_width; ?>" placeholder="<?php echo $text_imagewidth; ?>" />
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control" name="config_ajaxadvancedsearch_image_height" value="<?php echo $config_ajaxadvancedsearch_image_height; ?>" placeholder="<?php echo $text_imageheight; ?>" />
                                            </div>
                                        </div>
                                        <?php if ($error_config_ajaxadvancedsearch_image) { ?>
                                        <div class="text-danger"><?php echo $error_config_ajaxadvancedsearch_image; ?></div>
                                        <?php } ?>
                                    </div>
                                </div>
                                <!-- 26-01-2014 starts -->

                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-dsplay-query"><?php echo $text_result_view; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_result_view" value="border-bottom" <?php if($config_ajaxadvancedsearch_result_view=='border-bottom' ){echo $chk;}?> /><?php echo $text_result_viewbottom; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_result_view" value="default-view" <?php if($config_ajaxadvancedsearch_result_view=='default-view' || empty($config_ajaxadvancedsearch_result_view)){echo $chk;}?> /> <?php echo $text_result_viewborder; ?></label><br/><img class="img-thumbnail" id="ajaxadvancedsearchtemplate" alt="" src=""></div>
                                </div>
                                <!-- 26-01-2014 starts -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-color-highlightkeyword"><span data-toggle="tooltip" title="<?php echo $help_colorpicker; ?>"><?php echo $text_colorhighlight; ?></span></label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-6 row">
                                                <label for="ajaxadvancedsearch-color-highlightkeyword1" class="col-sm-12"><?php echo $text_colorhighlight; ?></label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_highlight" value="<?php echo $config_ajaxadvancedsearch_color_highlight; ?>" placeholder="<?php echo $text_colorhighlight; ?>" />
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="preview"></div>
                                                </div>
                                            </div>
                                            <div class="col-sm-6 row">
                                                <label for="ajaxadvancedsearch-color-highlightkeywordhover" class="col-sm-12"><?php echo $text_colorhighlighthover; ?></label>
                                                <div class="col-sm-8">
                                                    <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_highlighthover" value="<?php echo $config_ajaxadvancedsearch_color_highlighthover; ?>" placeholder="<?php echo $text_colorhighlighthover; ?>" />
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="preview"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- 26-01-2014 ends -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-hightlight"><?php echo $text_highlight; ?></label>
                                    <div class="col-sm-10"><label for="ajaxadvancedsearch-highlight-sepeate" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_highlight" value="1" <?php if($config_ajaxadvancedsearch_highlight==1){echo $chk;}?> /><?php echo $text_highlight_sepeate; ?></label><label for="ajaxadvancedsearch-highlight-combine" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_highlight" value="2" <?php if($config_ajaxadvancedsearch_highlight==2){echo $chk;}?> /><?php echo $text_highlight_combine; ?></label><label for="ajaxadvancedsearch-highlight-no" class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_highlight" value="0" <?php if($config_ajaxadvancedsearch_highlight==0 || !$config_ajaxadvancedsearch_highlight){echo $chk;}?> /><?php echo $text_highlight_no; ?></label></div>
                                </div>
                            </div> <!-- // tab-ajaxadvancedsearchgeneral end // -->
                            <div class="tab-pane" id="tab-ajaxadvancedsearchcolors">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-colordefaultall"><span data-toggle="tooltip" title="<?php echo $help_colorenableall; ?>"><?php echo $text_colorenabletall; ?></span></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_colorenabletall" value="1" <?php if($config_ajaxadvancedsearch_colorenabletall==1){echo $chk;}?> /><?php echo $text_enabled; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_colorenabletall" value="0" <?php if($config_ajaxadvancedsearch_colorenabletall==0 || !$config_ajaxadvancedsearch_colorenabletall){echo $chk;}?> /> <?php echo $text_disabled; ?></label></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-colordefaultall"><span data-toggle="tooltip" title="<?php echo $help_colordefaultall; ?>"><?php echo $text_colordefaultall; ?></span></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_colordefaultall" value="1" <?php if($config_ajaxadvancedsearch_colordefaultall==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_colordefaultall" value="0" <?php if($config_ajaxadvancedsearch_colordefaultall==0 || !$config_ajaxadvancedsearch_colordefaultall){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-color-defaultall"><span data-toggle="tooltip" title="<?php echo $help_colorpicker; ?>"><?php echo $text_colordefaultall; ?></span></label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-6 row">
                                            <label class="col-sm-12" for="ajaxadvancedsearch-color-default1"><?php echo $text_colordefault; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_default" value="<?php echo $config_ajaxadvancedsearch_color_default; ?>" placeholder="<?php echo $text_colordefault; ?>" />
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="preview"></div>
                                            </div>
                                            </div>
                                            <div class="col-sm-6 row">
                                            <label class="col-sm-12" for="ajaxadvancedsearch-color-default-hover"><?php echo $text_colordefaulthover; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_defaulthover" value="<?php echo $config_ajaxadvancedsearch_color_defaulthover; ?>" placeholder="<?php echo $text_colordefaulthover; ?>" />
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="preview"></div>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-color-heading"><span data-toggle="tooltip" title="<?php echo $help_colorpicker; ?>"><?php echo $text_colorheading; ?></span></label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-6 row">
                                            <label class="col-sm-12" for="ajaxadvancedsearch-color-heading1"><?php echo $text_colorheading; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_heading" value="<?php echo $config_ajaxadvancedsearch_color_heading; ?>" placeholder="<?php echo $text_colorheading; ?>" />
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="preview"></div>
                                            </div>
                                            </div>
                                            <div class="col-sm-6 row">
                                            <label class="col-sm-12" for="ajaxadvancedsearch-color-heading-hover"><?php echo $text_colorheadinghover; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_headinghover" value="<?php echo $config_ajaxadvancedsearch_color_headinghover; ?>" placeholder="<?php echo $text_colorheadinghover; ?>" />
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="preview"></div>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-color-model"><span data-toggle="tooltip" title="<?php echo $help_colorpicker; ?>"><?php echo $text_colormodel; ?></span></label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-6 row">
                                            <label class="col-sm-12" for="ajaxadvancedsearch-color-model1"><?php echo $text_colormodel; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_model" value="<?php echo $config_ajaxadvancedsearch_color_model; ?>" placeholder="<?php echo $text_colormodel; ?>" />
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="preview"></div>
                                            </div>
                                            </div>
                                            <div class="col-sm-6 row">
                                            <label class="col-sm-12" for="ajaxadvancedsearch-color-model-hover"><?php echo $text_colormodelhover; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_modelhover" value="<?php echo $config_ajaxadvancedsearch_color_modelhover; ?>" placeholder="<?php echo $text_colormodelhover; ?>" />
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="preview"></div>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-color-manufacturer"><span data-toggle="tooltip" title="<?php echo $help_colorpicker; ?>"><?php echo $text_colormanufacturer; ?></span></label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-6 row">
                                            <label class="col-sm-12" for="ajaxadvancedsearch-color-manufacturer1"><?php echo $text_colormanufacturer; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_manufacturer" value="<?php echo $config_ajaxadvancedsearch_color_manufacturer; ?>" placeholder="<?php echo $text_colormanufacturer; ?>" />
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="preview"></div>
                                            </div>
                                            </div>
                                            <div class="col-sm-6 row">
                                            <label class="col-sm-12" for="ajaxadvancedsearch-color-manufacturer-hover"><?php echo $text_colormanufacturerhover; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_manufacturerhover" value="<?php echo $config_ajaxadvancedsearch_color_manufacturerhover; ?>" placeholder="<?php echo $text_colormanufacturerhover; ?>" />
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="preview"></div>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-color-price"><span data-toggle="tooltip" title="<?php echo $help_colorpicker; ?>"><?php echo $text_colorprice; ?></span></label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-6 row">
                                            <label class="col-sm-12" for="ajaxadvancedsearch-color-price1"><?php echo $text_colorprice; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_price" value="<?php echo $config_ajaxadvancedsearch_color_price; ?>" placeholder="<?php echo $text_colorprice; ?>" />
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="preview"></div>
                                            </div>
                                            </div>
                                            <div class="col-sm-6 row">
                                            <label class="col-sm-12" for="ajaxadvancedsearch-color-price-hover"><?php echo $text_colorpricehover; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_pricehover" value="<?php echo $config_ajaxadvancedsearch_color_pricehover; ?>" placeholder="<?php echo $text_colorpricehover; ?>" />
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="preview"></div>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-color-stockstatus"><span data-toggle="tooltip" title="<?php echo $help_colorpicker; ?>"><?php echo $text_colorstockstatus; ?></span></label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-6 row">
                                            <label class="col-sm-12" for="ajaxadvancedsearch-color-stockstatus1"><?php echo $text_colorstockstatus; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_stockstatus" value="<?php echo $config_ajaxadvancedsearch_color_stockstatus; ?>" placeholder="<?php echo $text_colorstockstatus; ?>" />
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="preview"></div>
                                            </div>
                                            </div>
                                            <div class="col-sm-6 row">
                                            <label class="col-sm-12" for="ajaxadvancedsearch-color-stockstatus-hover"><?php echo $text_colorstockstatushover; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_stockstatushover" value="<?php echo $config_ajaxadvancedsearch_color_stockstatushover; ?>" placeholder="<?php echo $text_colorstockstatushover; ?>" />
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="preview"></div>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-color-quantity"><span data-toggle="tooltip" title="<?php echo $help_colorpicker; ?>"><?php echo $text_colorquantity; ?></span></label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-6 row">
                                            <label class="col-sm-12" for="ajaxadvancedsearch-color-quantity1"><?php echo $text_colorquantity; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_quantity" value="<?php echo $config_ajaxadvancedsearch_color_quantity; ?>" placeholder="<?php echo $text_colorquantity; ?>" />
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="preview"></div>
                                            </div>
                                            </div>
                                            <div class="col-sm-6 row">
                                            <label class="col-sm-12" for="ajaxadvancedsearch-color-quantity-hover"><?php echo $text_colorquantityhover; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_quantityhover" value="<?php echo $config_ajaxadvancedsearch_color_quantityhover; ?>" placeholder="<?php echo $text_colorquantityhover; ?>" />
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="preview"></div>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-color-result"><span data-toggle="tooltip" title="<?php echo $help_colorpicker; ?>"><?php echo $text_colorresult; ?></span></label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-6 row">
                                            <label class="col-sm-12" for="ajaxadvancedsearch-color-even-result"><?php echo $text_colorresulteven; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_evenresult" value="<?php echo $config_ajaxadvancedsearch_color_evenresult; ?>" placeholder="<?php echo $text_colorresulteven; ?>" />
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="preview"></div>
                                            </div>
                                            </div>
                                            <div class="col-sm-6 row">
                                            <label class="col-sm-12" for="ajaxadvancedsearch-color-odd-result"><?php echo $text_colorresultodd; ?></label>
                                            <div class="col-sm-8">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_oddresult" value="<?php echo $config_ajaxadvancedsearch_color_oddresult; ?>" placeholder="<?php echo $text_colorresultodd; ?>" />
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="preview"></div>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-color-result"><span data-toggle="tooltip" title="<?php echo $help_colorpicker; ?>"><?php echo $text_colorresulthover; ?></span></label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-sm-10">
                                                <input type="text" class="colorpickers form-control" name="config_ajaxadvancedsearch_color_resulthover" value="<?php echo $config_ajaxadvancedsearch_color_resulthover; ?>" placeholder="<?php echo $text_colorresulthover; ?>" />
                                            </div>
                                            <div class="col-sm-2">
                                                <div class="preview"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- // tab-ajaxadvancedsearchcolors end // -->

                            <!-- 26-01-2014 ends -->
                            <div class="tab-pane" id="tab-ajaxadvancedsearchshow">
                                <!-- 26-01-2014 starts -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-dsplay-query"><span data-toggle="tooltip" title="<?php echo $help_display_query; ?>"><?php echo $text_display_query; ?></span></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_displayallresults" value="1" <?php if($config_ajaxadvancedsearch_displayallresults==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_displayallresults" value="0" <?php if($config_ajaxadvancedsearch_displayallresults==0 || !$config_ajaxadvancedsearch_displayallresults){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <!-- 26-01-2014 ends -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-display-model"><?php echo $text_display_model; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_model" value="1" <?php if($config_ajaxadvancedsearch_model==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_model" value="0" <?php if($config_ajaxadvancedsearch_model==0 || !$config_ajaxadvancedsearch_model){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-display-descr">Show description in result</label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_descr" value="1" <?php if($config_ajaxadvancedsearch_descr==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_descr" value="0" <?php if($config_ajaxadvancedsearch_descr==0 || !$config_ajaxadvancedsearch_descr){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-display-manufacturer"><?php echo $text_display_manufacturer; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_manufacturer" value="1" <?php if($config_ajaxadvancedsearch_manufacturer==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_manufacturer" value="0" <?php if($config_ajaxadvancedsearch_manufacturer==0 || !$config_ajaxadvancedsearch_manufacturer){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-display-price"><?php echo $text_display_price; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_price" value="1" <?php if($config_ajaxadvancedsearch_price==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_price" value="0" <?php if($config_ajaxadvancedsearch_price==0 || !$config_ajaxadvancedsearch_price){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <!--/**Customer group price show starts*/-->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" 	for="ajaxadvancedsearch-display-price-customergroups"><span data-toggle="tooltip" title="<?php echo $help_login_display_price; ?>"><?php echo $text_login_display_price; ?></span></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_pricelogin" value="1" <?php if($config_ajaxadvancedsearch_pricelogin==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_pricelogin" value="0" <?php if($config_ajaxadvancedsearch_pricelogin==0 || !$config_ajaxadvancedsearch_pricelogin){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-display-price-customers"><span data-toggle="tooltip" title="<?php echo $help_display_price_customergroups; ?>"><?php echo $text_display_price_customergroups; ?></span></label>
                                    <div class="col-sm-10">
                                        <div class="well well-sm">
                                            <?php foreach($ajaxadvance_customergroups as $ajaxadvance_customergroup) {
                                            $chk1='';
                                            if(in_array($ajaxadvance_customergroup['customer_group_id'],$config_ajaxadvancedsearch_customergroups)){
                                                $chk1='checked="checked"';
                                            }
                                            ?>
                                            <div id="group-<?php echo $ajaxadvance_customergroup['customer_group_id']; ?>" class="checkbox">
                                            <label><input <?php echo $chk1; ?> type="checkbox" name="config_ajaxadvancedsearch_customergroups[]" value="<?php echo $ajaxadvance_customergroup['customer_group_id']; ?>">
                                            <?php echo $ajaxadvance_customergroup['name']; ?></label>
                                            </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                                <!--/**Customer group price show ends*/-->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-display-rating"><?php echo $text_display_rating; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_rating" value="1" <?php if($config_ajaxadvancedsearch_rating==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_rating" value="0" <?php if($config_ajaxadvancedsearch_rating==0 || !$config_ajaxadvancedsearch_rating){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-display-stock"><?php echo $text_display_stock; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_stock" value="1" <?php if($config_ajaxadvancedsearch_stock==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_stock" value="0" <?php if($config_ajaxadvancedsearch_stock==0 || !$config_ajaxadvancedsearch_stock){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <!-- 26-01-2014 starts -->
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-display-quantity"><?php echo $text_display_quantity; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_quantity" value="1" <?php if($config_ajaxadvancedsearch_quantity==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_quantity" value="0" <?php if($config_ajaxadvancedsearch_quantity==0 || !$config_ajaxadvancedsearch_quantity){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <!-- 26-01-2014 ends -->
                            </div> <!-- // tab-ajaxadvancedsearchshow end // -->
                            <div class="tab-pane" id="tab-ajaxadvancedsearchsearch">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-search-model"><?php echo $text_search_model; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_model_search" value="1" <?php if($config_ajaxadvancedsearch_model_search==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_model_search" value="0" <?php if($config_ajaxadvancedsearch_model_search==0 || !$config_ajaxadvancedsearch_model_search){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-search-tag"><?php echo $text_search_tag; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_tag" value="1" <?php if($config_ajaxadvancedsearch_tag==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_tag" value="0" <?php if($config_ajaxadvancedsearch_tag==0 || !$config_ajaxadvancedsearch_tag){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-searh-mpn"><?php echo $text_search_mpn; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_mpn" value="1" <?php if($config_ajaxadvancedsearch_mpn==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_mpn" value="0" <?php if($config_ajaxadvancedsearch_mpn==0 || !$config_ajaxadvancedsearch_mpn){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-searh-manufacturer"><?php echo $text_search_manufacturer; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_manufacturer_search" value="1" <?php if($config_ajaxadvancedsearch_manufacturer_search==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_manufacturer_search" value="0" <?php if($config_ajaxadvancedsearch_manufacturer_search==0 || !$config_ajaxadvancedsearch_manufacturer_search){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-search-isbn"><?php echo $text_search_isbn; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_isbn" value="1" <?php if($config_ajaxadvancedsearch_isbn==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_isbn" value="0" <?php if($config_ajaxadvancedsearch_isbn==0 || !$config_ajaxadvancedsearch_isbn){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-search-jan"><?php echo $text_search_jan; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_jan" value="1" <?php if($config_ajaxadvancedsearch_jan==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_jan" value="0" <?php if($config_ajaxadvancedsearch_jan==0 || !$config_ajaxadvancedsearch_jan){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-search-ean"><?php echo $text_search_ean; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_ean" value="1" <?php if($config_ajaxadvancedsearch_ean==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_ean" value="0" <?php if($config_ajaxadvancedsearch_ean==0 || !$config_ajaxadvancedsearch_ean){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-search-upc"><?php echo $text_search_upc; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_upc" value="1" <?php if($config_ajaxadvancedsearch_upc==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_upc" value="0" <?php if($config_ajaxadvancedsearch_upc==0 || !$config_ajaxadvancedsearch_upc){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ajaxadvancedsearch-search-sku"><?php echo $text_search_sku; ?></label>
                                    <div class="col-sm-10"><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_sku" value="1" <?php if($config_ajaxadvancedsearch_sku==1){echo $chk;}?> /><?php echo $text_yes; ?></label><label class="radio-inline"><input type="radio" name="config_ajaxadvancedsearch_sku" value="0" <?php if($config_ajaxadvancedsearch_sku==0 || !$config_ajaxadvancedsearch_sku){echo $chk;}?> /> <?php echo $text_no; ?></label></div>
                                </div>
                            </div> <!-- // tab-ajaxadvancedsearchsearch end // -->
                        </div> <!-- // tab-content end // -->
                    </div>
                    <!--
                    /**
                        *Ajax advanced search ends
                        */
                    -->
                
            <div class="tab-pane" id="tab-server">
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_secure; ?>"><?php echo $entry_secure; ?></span></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_secure) { ?>
                    <input type="radio" name="config_secure" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_secure" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_secure) { ?>
                    <input type="radio" name="config_secure" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_secure" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_shared; ?>"><?php echo $entry_shared; ?></span></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_shared) { ?>
                    <input type="radio" name="config_shared" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_shared" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_shared) { ?>
                    <input type="radio" name="config_shared" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_shared" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-robots"><span data-toggle="tooltip" title="<?php echo $help_robots; ?>"><?php echo $entry_robots; ?></span></label>
                <div class="col-sm-10">
                  <textarea name="config_robots" rows="5" placeholder="<?php echo $entry_robots; ?>" id="input-robots" class="form-control"><?php echo $config_robots; ?></textarea>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_seo_url; ?>"><?php echo $entry_seo_url; ?></span></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_seo_url) { ?>
                    <input type="radio" name="config_seo_url" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_seo_url" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_seo_url) { ?>
                    <input type="radio" name="config_seo_url" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_seo_url" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-file-max-size"><span data-toggle="tooltip" title="<?php echo $help_file_max_size; ?>"><?php echo $entry_file_max_size; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="config_file_max_size" value="<?php echo $config_file_max_size; ?>" placeholder="<?php echo $entry_file_max_size; ?>" id="input-file-max-size" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-file-ext-allowed"><span data-toggle="tooltip" title="<?php echo $help_file_ext_allowed; ?>"><?php echo $entry_file_ext_allowed; ?></span></label>
                <div class="col-sm-10">
                  <textarea name="config_file_ext_allowed" rows="5" placeholder="<?php echo $entry_file_ext_allowed; ?>" id="input-file-ext-allowed" class="form-control"><?php echo $config_file_ext_allowed; ?></textarea>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-file-mime-allowed"><span data-toggle="tooltip" title="<?php echo $help_file_mime_allowed; ?>"><?php echo $entry_file_mime_allowed; ?></span></label>
                <div class="col-sm-10">
                  <textarea name="config_file_mime_allowed" cols="60" rows="5" placeholder="<?php echo $entry_file_mime_allowed; ?>" id="input-file-mime-allowed" class="form-control"><?php echo $config_file_mime_allowed; ?></textarea>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_maintenance; ?>"><?php echo $entry_maintenance; ?></span></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_maintenance) { ?>
                    <input type="radio" name="config_maintenance" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_maintenance" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_maintenance) { ?>
                    <input type="radio" name="config_maintenance" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_maintenance" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_password; ?>"><?php echo $entry_password; ?></span></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_password) { ?>
                    <input type="radio" name="config_password" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_password" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_password) { ?>
                    <input type="radio" name="config_password" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_password" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-encryption"><span data-toggle="tooltip" title="<?php echo $help_encryption; ?>"><?php echo $entry_encryption; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="config_encryption" value="<?php echo $config_encryption; ?>" placeholder="<?php echo $entry_encryption; ?>" id="input-encryption" class="form-control" />
                  <?php if ($error_encryption) { ?>
                  <div class="text-danger"><?php echo $error_encryption; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-compression"><span data-toggle="tooltip" title="<?php echo $help_compression; ?>"><?php echo $entry_compression; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="config_compression" value="<?php echo $config_compression; ?>" placeholder="<?php echo $entry_compression; ?>" id="input-compression" class="form-control" />
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_error_display; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_error_display) { ?>
                    <input type="radio" name="config_error_display" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_error_display" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_error_display) { ?>
                    <input type="radio" name="config_error_display" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_error_display" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $entry_error_log; ?></label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                    <?php if ($config_error_log) { ?>
                    <input type="radio" name="config_error_log" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_error_log" value="1" />
                    <?php echo $text_yes; ?>
                    <?php } ?>
                  </label>
                  <label class="radio-inline">
                    <?php if (!$config_error_log) { ?>
                    <input type="radio" name="config_error_log" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                    <?php } else { ?>
                    <input type="radio" name="config_error_log" value="0" />
                    <?php echo $text_no; ?>
                    <?php } ?>
                  </label>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-error-filename"><?php echo $entry_error_filename; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_error_filename" value="<?php echo $config_error_filename; ?>" placeholder="<?php echo $entry_error_filename; ?>" id="input-error-filename" class="form-control" />
                  <?php if ($error_error_filename) { ?>
                  <div class="text-danger"><?php echo $error_error_filename; ?></div>
                  <?php } ?>
                </div>
              </div>
            </div>
            <div class="tab-pane" id="tab-google">
              <fieldset>
                <legend><?php echo $text_google_analytics; ?></legend>
                <div class="alert alert-info"><?php echo $help_google_analytics; ?></div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-google-analytics"><?php echo $entry_google_analytics; ?></label>
                  <div class="col-sm-10">
                    <textarea name="config_google_analytics" rows="5" placeholder="<?php echo $entry_google_analytics; ?>" id="input-google-analytics" class="form-control"><?php echo $config_google_analytics; ?></textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-google-analytics-status"><?php echo $entry_status; ?></label>
                  <div class="col-sm-10">
                    <select name="config_google_analytics_status" id="input-google-analytics-status" class="form-control">
                      <?php if ($config_google_analytics_status) { ?>
                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                      <option value="0"><?php echo $text_disabled; ?></option>
                      <?php } else { ?>
                      <option value="1"><?php echo $text_enabled; ?></option>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                      <?php } ?>
                    </select>
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend><?php echo $text_google_captcha; ?></legend>
                <div class="alert alert-info"><?php echo $help_google_captcha; ?></div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-google-captcha-public"><?php echo $entry_google_captcha_public; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_google_captcha_public" value="<?php echo $config_google_captcha_public; ?>" placeholder="<?php echo $entry_google_captcha_public; ?>" id="input-google-captcha-public" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-google-captcha-secret"><?php echo $entry_google_captcha_secret; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="config_google_captcha_secret" value="<?php echo $config_google_captcha_secret; ?>" placeholder="<?php echo $entry_google_captcha_secret; ?>" id="input-google-captcha-secret" class="form-control" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-google-captcha-status"><?php echo $entry_status; ?></label>
                  <div class="col-sm-10">
                    <select name="config_google_captcha_status" id="input-google-captcha-status" class="form-control">
                      <?php if ($config_google_captcha_status) { ?>
                      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                      <option value="0"><?php echo $text_disabled; ?></option>
                      <?php } else { ?>
                      <option value="1"><?php echo $text_enabled; ?></option>
                      <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                      <?php } ?>
                    </select>
                  </div>
                </div>
              </fieldset>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
$('select[name=\'config_template\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=setting/setting/template&token=<?php echo $token; ?>&template=' + encodeURIComponent(this.value),
		dataType: 'html',
		beforeSend: function() {
			$('select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(html) {
			$('#template').attr('src', html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'config_template\']').trigger('change');
//--></script> 
  <script type="text/javascript"><!--
$('select[name=\'config_country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=setting/setting/country&token=<?php echo $token; ?>&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'config_country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},
		success: function(json) {
			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone'] && json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
          			html += '<option value="' + json['zone'][i]['zone_id'] + '"';

					if (json['zone'][i]['zone_id'] == '<?php echo $config_zone_id; ?>') {
            			html += ' selected="selected"';
					}

					html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}

			$('select[name=\'config_zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'config_country_id\']').trigger('change');
//--></script></div>

                    <!--
                    /**
                        *Ajax advanced search starts
                        */
                    -->
                    <!--26-01-2014 starts-->
                    <script type="text/javascript"><!--
                    $(document).ready(function(){
                        var ajaxadvancedsearch_currentcol = null;
                        $('.colorpickers').ColorPicker({
                            curr : '',
                            onShow: function (colpkr) {
                                $(colpkr).fadeIn(500);
                                return false;
                            },
                            onHide: function (colpkr) {
                                $(colpkr).fadeOut(500);
                                return false;
                            },
                            onSubmit: function(hsb, hex, rgb, el) {
                                $(el).val(hex);
                                $(el).ColorPickerHide();
                            },
                            onBeforeShow: function () {
                                $(this).ColorPickerSetColor(this.value);
                            },onChange: function (hsb, hex, rgb) {
                                ajaxadvancedsearch_currentcol.curr.parent().next().children('.preview').css('background', '#' + hex);
                                ajaxadvancedsearch_currentcol.curr.val(hex);
                            }
                        })
                        .bind('keyup', function(){
                            $(this).ColorPickerSetColor(this.value);
                        }).click(function(){
                            ajaxadvancedsearch_currentcol = this;
                            ajaxadvancedsearch_currentcol.curr = $(this);
                        });

                        $.each($('.colorpickers'),function(key,value){
                            $(this).parent().next().children('.preview').css({'background':'#'+$(this).val()});
                        });

                        $('input[name=\'config_ajaxadvancedsearch_result_view\']').on('click', function() {
                            $.ajax({
                                url: 'index.php?route=setting/setting/ajaxadvancedsearchtemplate&token=<?php echo $token; ?>&template=' + encodeURIComponent(this.value),
                                dataType: 'html',
                                beforeSend: function() {
                                },
                                complete: function() {
                                },
                                success: function(html) {
                                    $('#ajaxadvancedsearchtemplate').attr('src', html);
                                },
                                error: function(xhr, ajaxOptions, thrownError) {
                                    alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                                }
                            });
                        });

                        $('input[name=\'config_ajaxadvancedsearch_result_view\']:checked').trigger('click');
                    });
                    //--></script>
                    <!--26-01-2014 ends-->
                    <!--
                    /**
                        *Ajax advanced search ends
                        */
                    -->
                
<?php echo $footer; ?>
