<?php echo $header; ?>

<style type="text/css">
    .network_name {
        display: inline;
        margin-left: 10px;
    }
    
    .required_hide {
        color: #999;
    }
</style>

<?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-socl-login" data-toggle="tooltip" title="<?php echo $button_save_all; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
        <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
        </div>
        <div class="panel-body">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-socl-login" class="form-horizontal">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab-commonsettings" data-toggle="tab"><?php echo $tab_common_settings; ?></a></li>
                    <li><a href="#tab-apisettings" data-toggle="tab"><?php echo $tab_api_settings; ?></a></li>
                    <li><a href="#tab-managenetwork" data-toggle="tab"><?php echo $tab_manage_network; ?></a></li>
                </ul>
                
                <div class="tab-content">
                    <div class="tab-pane active" id="tab-commonsettings">
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-group"><span data-toggle="tooltip" data-container="#tab-commonsettings" title="<?php echo $help_customer_group; ?>"><?php echo $entry_customer_group; ?></span></label>
                                <div class="col-sm-10">
                                    <select name="soclall_customer_group_id" id="input-group" class="form-control">
                                        <?php foreach($customer_groups as $group){ ?>
                                            <?php if($soclall_customer_group_id == $group['customer_group_id']) { ?>
                                                <option value="<?php echo $group['customer_group_id']; ?>" selected="selected"><?php echo $group['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $group['customer_group_id']; ?>"><?php echo $group['name']; ?></option>
                                        <?php }} ?>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-required"><span data-toggle="tooltip" data-container="#tab-commonsettings" title="<?php echo $help_user_required; ?>"><?php echo $entry_user_required; ?></span></label>
                                <div class="col-sm-10">
                                    <div class="well well-sm" style="height: 315px; overflow: auto;">
                                        <?php foreach($new_user_details as $detail){ ?>
                                            <div class="checkbox">
                                                <label>
                                                    <?php if (is_array($soclall_required_details) && in_array($detail['value'], $soclall_required_details)) { ?>
                                                        <input type="checkbox" name="soclall_required_details[]" value="<?php echo $detail['value']; ?>" checked="checked" />
                                                    <?php } else { ?>
                                                        <input type="checkbox" name="soclall_required_details[]" value="<?php echo $detail['value']; ?>" />
                                                    <?php } ?>
                                                    <?php echo $detail['text']; ?>
                                                </label>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                    </div>
                    
                    <div class="tab-pane" id="tab-apisettings">                    
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-apiid"><?php echo $entry_app_id; ?></label>
                                <div class="col-sm-10"><input id="input-apiid" type="text" name="soclall_appid" value="<?php echo $soclall_appid; ?>" class="form-control" /></div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-secretkey"><?php echo $entry_secret_key; ?></label>
                                <div class="col-sm-10"><input id="input-secretkey" type="text" name="soclall_secretkey" value="<?php echo $soclall_secretkey; ?>" class="form-control" /></div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">&nbsp;</label>
                                <div class="col-sm-10"><?php echo $text_view_your_dashboard; ?></div>
                            </div>                       
                    </div>
                    
                    <div class="tab-pane" id="tab-managenetwork">
                        <fieldset>
                            <legend><?php echo $help_tab_manage_network; ?></legend>
                            <?php if(count($networks)) { foreach($networks as $network) { ?>
                            <div class="form-group">
                                <label class="col-sm-2" for="input-name" style="margin-bottom: 0;">
                                    <img src="<?php echo $network['icon']; ?>" alt="" />
                                    <div class="network_name"><?php echo $network['name']; ?></div>
                                </label>
                                <div class="col-sm-10" style="line-height: 32px;">
                                    <?php if (is_array($soclall_enabled_network) && in_array($network['code'], $soclall_enabled_network)) { ?>
                                    <input type="checkbox" name="soclall_enabled_network[]" value="<?php echo $network['code']; ?>" checked="checked" />
                                    <?php } else { ?>
                                    <input type="checkbox" name="soclall_enabled_network[]" value="<?php echo $network['code']; ?>" />
                                    <?php } ?>
                                </div>
                            </div>
                            <?php }} ?>
                        </fieldset>
                    </div>
                </div>
            </form>
        </div>
    </div>
  </div>
</div>	

<script type="text/javascript">    
    $(document).ready(function() {
        $('#tab-commonsettings input[type=checkbox]').each( function() {
            if(!$(this).is(':checked')) {
                $(this).parent().addClass('required_hide');
            }
        });
            
        $('#tab-commonsettings input[type=checkbox]').change(function() {
            if($(this).val() == 'country' && !$(this).is(':checked')) {
                $('#tab-commonsettings input[type=checkbox][value=\'postcode\']').removeAttr('checked').parent().addClass('required_hide');
                $('#tab-commonsettings input[type=checkbox][value=\'region\']').removeAttr('checked').parent().addClass('required_hide');
            }
            
            if($(this).is(':checked')) {
                $(this).parent().removeClass('required_hide');
            } else {
                $(this).parent().addClass('required_hide');
            }
        });  
    });    
</script>							
<?php echo $footer; ?>