<?php echo $header; ?><?php echo $column_left; ?>
<?php $rule_counter = 1; ?>
<?php $rule_sub_counter = 1; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right">
                <button type="submit" form="form-option" data-toggle="tooltip" title="<?php echo 'Save'; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $language->get('button_delete'); ?>" class="btn btn-danger" onclick="if(confirm('Are you sure want to delete this rule?')) location.href='<?php echo $url->link('promotions/reward_points/shoppingCartRuleDelete', 'token=' . $token."&rule_id=".$rule_id, 'SSL'); ?>';"><i class="fa fa-trash-o"></i></button>
                <a href="<?php echo $cancel?>" class="button"><i class="fa fa-reply"></i> <?php echo $language->get('button_cancel'); ?></a>
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
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $language->get('text_edit'); ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-setting" class="form-horizontal">
                    <input type="hidden" id="rule_id" name="rule_id" value="<?php echo $rule_id ?>"/>
                    <input type="hidden" id="rule_counter" value="<?php echo $rule_counter?>"/>
                    <input type="hidden" id="rule_sub_counter" value="<?php echo $rule_sub_counter?>"/>
                    <input type="hidden" id="rule_url_post" value="<?php echo $url->link('promotions/reward_points/getDataOption', 'token=' . $token, 'SSL')?>"/>

                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab-rule-infomation" data-toggle="tab"><?php echo $language->get('tab_rule_infomation'); ?></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane behavior-customer-rule active" id="tab-rule-infomation">
                            <div>
                                <div id="rule_actions_fieldset">
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('Rule Name')?></label>
                                        <div class="col-sm-5">
                                            <input type="text" name="name" value="<?php echo $name?>" class="form-control" />
                                            <?php if ($error_name) { ?>
                                            <div class="text-danger"><?php echo $error_name; ?></div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('Reward for')?></label>
                                        <div class="col-sm-5">
                                            <select name="actions" id="actions" class="form-control">
                                                <option value="1" <?php echo ($actions == "1" ? 'selected="selected"' : '')?>><?php echo $language->get('Signing Up')?></option>
                                                <option value="2" <?php echo ($actions == "2" ? 'selected="selected"' : '')?>><?php echo $language->get('Posting Product Review')?></option>
                                                <!--<option value="3" <?php echo ($actions == "3" ? 'selected="selected"' : '')?>><?php echo $language->get('Referral Visitor (Friend click on referral link)')?></option>
                                                <option value="4" <?php echo ($actions == "4" ? 'selected="selected"' : '')?>><?php echo $language->get('Referral Sign-Up')?></option>-->
                                                <option value="5" <?php echo ($actions == "5" ? 'selected="selected"' : '')?>><?php echo $language->get('Signing Up Newsletter')?></option>
                                                <!--<option value="6" <?php echo ($actions == "6" ? 'selected="selected"' : '')?>><?php echo $language->get('Facebook Like')?></option>
                                                <option value="7" <?php echo ($actions == "7" ? 'selected="selected"' : '')?>><?php echo $language->get('Facebook Share')?></option>
                                                <option value="8" <?php echo ($actions == "8" ? 'selected="selected"' : '')?>><?php echo $language->get('Customer Birthday')?></option>-->
                                                <option value="9" <?php echo ($actions == "9" ? 'selected="selected"' : '')?>><?php echo $language->get('Daily Login Reward')?></option>
                                            </select>
                                            <p class="note" style="margin: 6px 0 0;">
                                                <span id="post_review" style="display: <?php echo ($actions == '2' ? 'block' : 'none')?>"><?php echo $language->get('text_note_behavior_review')?></span>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('Status')?></label>
                                        <div class="col-sm-5">
                                            <select name="status" id="status" class="form-control">
                                                <option value="0" <?php echo ($status == "0" ? 'selected="selected"' : '')?>><?php echo $language->get('Disabled')?></option>
                                                <option value="1" <?php echo ($status == "1" ? 'selected="selected"' : '')?>><?php echo $language->get('Enabled')?></option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('Customer Groups')?></label>
                                        <div class="col-sm-5">
                                            <select class="form-control" name="customer_group_ids[]" id="customer_group_ids" multiple="multiple">
                                                <option value="99" <?php echo (count($customer_group_ids) > 0 && in_array(99, $customer_group_ids) ? 'selected="selected"' : '')?>><?php echo $language->get('NOT LOGGED IN')?></option>
                                                <?php foreach($customer_groups as $group) { ?>
                                                <option value="<?php echo $group["customer_group_id"] ?>" <?php echo (count($customer_group_ids) > 0 && in_array($group["customer_group_id"], $customer_group_ids) ? 'selected="selected"' : '')?>><?php echo $group["name"] ?></option>
                                                <?php } ?>
                                            </select>
                                            <?php if ($error_customer_group) { ?>
                                            <div class="text-danger"><?php echo $error_customer_group; ?></div>
                                            <?php } ?>
                                        </div>
                                    </div>
                                    <div class="form-group required">
                                        <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('Reward Points (X)')?></label>
                                        <div class="col-sm-2">
                                            <input type="text" name="reward_point" style="width: 242px" value="<?php echo $reward_point?>" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group consecutive-in-day" style="display: <?php echo ($actions == '9' ? 'block' : 'none')?>;">
                                        <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('Consecutive in (day)')?></label>
                                        <div class="col-sm-2">
                                            <input type="text" name="consecutive_in_day" style="width: 242px" value="<?php echo $consecutive_in_day?>" class="form-control"/>
                                            <p style="margin: 6px 0 0;">
                                                <span id="post_review" style="display: block;width: 300px">Leave blank will reward every day</span>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="form-group consecutive-in-day required" style="display: <?php echo ($actions == '9' ? 'block' : 'none')?>;">
                                        <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('Cycle')?></label>
                                        <div class="col-sm-2">
                                            <input type="radio" name="is_cycle" value="1" <?php echo ($is_cycle == '1' ? 'checked="checked"' : '')?>/> Yes <input type="radio" name="is_cycle" value="0" <?php echo ($is_cycle == '0' ? 'checked="checked"' : '')?>/> No
                                        </div>
                                    </div>
                                    <!-- DISPATCH_EVENT:BEHAVIOR_AFTER_RENDER_FIELD_REWARD_POINT -->
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });
    //--></script>
<?php echo $footer; ?>