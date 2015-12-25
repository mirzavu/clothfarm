<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-option" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <a data-toggle="tooltip" class="btn btn-default"><i class="fa fa-reply"></i> Cancel</a>
            </div>
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
        <?php if ($warning) { ?>
        <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $warning; ?>
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
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-setting" class="form-horizontal">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $language->get('tab_general'); ?></a></li>
                        <li><a href="#tab-display" data-toggle="tab"><?php echo $language->get('tab_display'); ?></a></li>
                        <li><a href="#tab-module-status" data-toggle="tab" style="<?php echo (!$extensions['status'] ? 'color:red' : '')?>"><?php echo $language->get('Module Status'); ?></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-general">
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('text_opt_enabled_module'); ?></label>
                                <div class="col-sm-10">
                                    <select name="rwp_enabled_module" id="rwp_enabled_module" class="form-control">
                                        <option value="0" <?php echo ($rwp_enabled_module == "0" ? 'selected="selected"' : '')?>>No</option>
                                        <option value="1" <?php echo ($rwp_enabled_module == "1" ? 'selected="selected"' : '')?>>Yes</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group required">
                                <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('text_point_exchange_rate'); ?></label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" name="currency_exchange_rate" value="<?php echo $currency_exchange_rate?>"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('Update reward points when order status is'); ?></label>
                                <div class="col-sm-10">
                                    <select name="update_based_order_status" id="update_based_order_status" class="form-control">
                                        <?php foreach ($order_statuses as $order_status) { ?>
                                        <?php if ($order_status['order_status_id'] == $update_based_order_status) { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                                        <?php } else { ?>
                                        <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                                        <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                            <!-- DISPATCH_EVENT:CONFIGURATION_AFTER_RENDER_GENERAL_FIELDS -->
                        </div>
                        <div class="tab-pane" id="tab-display">
                            <div class="tab-pane active" id="tab-general">
                                <div class="form-group required">
                                    <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('text_unit_name_point'); ?></label>
                                    <div class="col-sm-10">
                                        <ul class="nav nav-tabs">
                                            <?php foreach ($languages as $_language) { ?>
                                            <li class="<?php echo ($language->get('code') == $_language['code'] ? 'active' : '')?>"><a href="#language<?php echo $_language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $_language['image']; ?>" title="<?php echo $_language['name']; ?>" /> <?php echo $_language['name']; ?></a></li>
                                            <?php } ?>
                                        </ul>
                                        <div class="tab-content">
                                            <?php foreach ($languages as $_language) { ?>
                                            <?php $var = "text_points_".$_language['code']; ?>
                                            <div class="tab-pane <?php echo ($language->get('code') == $_language['code'] ? 'active' : '')?>" id="language<?php echo $_language['language_id']; ?>">
                                                <div class="col-sm-5">
                                                <input type="text" class="form-control" name="text_points_<?php echo $_language['code']; ?>" value="<?php echo ${$var}?>"/>
                                                </div>
                                            </div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('Show point on listing page'); ?></label>
                                    <div class="col-sm-10">
                                        <select name="show_point_listing" id="show_point_listing" class="form-control">
                                            <option value="1" <?php echo ($show_point_listing == '1' ? 'selected="selected"' : '')?>>Yes</option>
                                            <option value="0" <?php echo ($show_point_listing == '0' ? 'selected="selected"' : '')?>>No</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('Show point on product detail page'); ?></label>
                                    <div class="col-sm-10">
                                        <select name="show_point_detail" id="show_point_detail" class="form-control">
                                            <option value="1" <?php echo ($show_point_detail == '1' ? 'selected="selected"' : '')?>>Yes</option>
                                            <option value="0" <?php echo ($show_point_detail == '0' ? 'selected="selected"' : '')?>>No</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tab-module-status">
                            <i style="margin: 0 10px;">Please go to <b style="background: rgb(236, 236, 236);padding: 4px;color: dimgrey;font-weight: normal;">Extension -> Order Total</b> to install or enable both.</i>
                            <!-- TODO  -->
                            <table style="margin: 15px 10px;">
                                <tr style="height: 30px;">
                                    <td style="width: 200px;">Allow Earn Points</td>
                                    <td style="width: 50px;"><div style="background: <?php echo ($extensions['earn_point']['status'] ? 'green' : 'red')?>; width: 15px;height: 15px"></div></td>
                                    <td>Sort order: <b><?php echo $extensions['earn_point']['sort_order']?></b></td>
                                </tr>
                                <tr style="height: 30px;">
                                    <td style="width: 200px;">Allow Redeem Points</td>
                                    <td style="width: 50px;"><div style="background: <?php echo ($extensions['redeem_point']['status'] ? 'green' : 'red')?>; width: 15px;height: 15px"></div></td>
                                    <td>Sort order: <b><?php echo $extensions['redeem_point']['sort_order']?></b> (<i><u>Note:</u>Value this sort order must less than sort order of Total +1 unit</i>)</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>