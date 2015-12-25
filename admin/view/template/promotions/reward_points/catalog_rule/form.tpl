<?php echo $header; ?><?php echo $column_left; ?>
<?php $rule_counter = 1; ?>
<?php $rule_sub_counter = 1; ?>
<div id="content">
<div class="page-header">
    <div class="container-fluid">
        <div class="pull-right">
            <a onclick="$('#apply_rule').val(1);$('#form-setting').submit();" data-toggle="tooltip" class="btn btn-default"><i class="fa fa-reply"></i> <?php echo $language->get('button_save_and_apply'); ?></a>
            <button type="submit" form="form-option" data-toggle="tooltip" title="<?php echo 'Save'; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
            <button type="button" data-toggle="tooltip" title="<?php echo $language->get('button_delete'); ?>" class="btn btn-danger" onclick="if(confirm('Are you sure want to delete this rule?')) location.href='<?php echo $url->link('promotions/reward_points/catalogCartRuleDelete', 'token=' . $token."&rule_id=".$rule_id, 'SSL'); ?>';"><i class="fa fa-trash-o"></i></button>
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
        <input type="hidden" id="apply_rule" name="apply_rule" value=""/>
        <input type="hidden" id="rule_counter" value="<?php echo $rule_counter?>"/>
        <input type="hidden" id="rule_sub_counter" value="<?php echo $rule_sub_counter?>"/>
        <input type="hidden" id="rule_url_post" value="<?php echo $url->link('promotions/reward_points/getDataOption', 'token=' . $token, 'SSL')?>"/>

        <ul class="nav nav-tabs">
            <li class="active"><a href="#tab-rule-infomation" data-toggle="tab"><?php echo $language->get('tab_rule_infomation'); ?></a></li>
            <li><a href="#tab-rule-conditions" data-toggle="tab"><?php echo $language->get('tab_rule_conditions'); ?></a></li>
            <li><a href="#tab-rule-actions" data-toggle="tab"><?php echo $language->get('tab_rule_actions'); ?></a></li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="tab-rule-infomation">
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
                            <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('Rule Description')?></label>
                            <div class="col-sm-5">
                                <textarea name="description" id="" cols="60" rows="10" class="form-control"><?php echo $description?></textarea>
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
                            <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('Start Date')?></label>
                            <div class="col-sm-2">
                                <div class="input-group date">
                                    <input type="text" name="start_date" class="date form-control" value="<?php echo $start_date?>"/>
                                     <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('End Date')?></label>
                            <div class="col-sm-2">
                                <div class="input-group date">
                                    <input type="text" name="end_date" class="form-control" value="<?php echo $end_date?>"/>
                                    <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane" id="tab-rule-conditions">
                <div class="rule-tree">
                    <div class="entry-head">
                        <h4><?php echo $language->get('tab_rule_conditions_h4')?></h4>
                    </div>
                    <?php
                        if(!isset($conditions_combine) || count($conditions_combine) == 0)
                        {
                            $conditions_combine[$rule_counter] = array(
                                'aggregator'  =>  'all',
                    'value'  =>  '1',
                    'new_child'  =>  '',
                    );
                    }
                    ?>

                    <?php foreach($conditions_combine as $counter => $condition){ ?>
                    <?php $rule_counter++?>
                    <fieldset id="rule_conditions_fieldset">
                        If <span class="rule-param"><a href="javascript:void(0)" class="label"><?php echo strtoupper($condition['aggregator'])?></a><span class="element"> <select id="conditions__<?php echo $counter?>__aggregator" name="rule[conditions][<?php echo $counter?>][aggregator]" class=" element-value-changer select">
                                    <option value="all" <?php echo ($condition['aggregator'] == 'all' ? 'selected="selected"' : '')?>>ALL</option>
                                    <option value="any" <?php echo ($condition['aggregator'] == 'any' ? 'selected="selected"' : '')?>>ANY</option>
                                </select>
                            </span></span>&nbsp; of these conditions are
                            <span class="rule-param"><a href="javascript:void(0)" class="label"><?php echo ($condition['value'] ? 'TRUE' : 'FALSE')?></a>
                                <span class="element">
                                    <select id="conditions__<?php echo $counter?>__value" name="rule[conditions][<?php echo $counter?>][value]" class=" element-value-changer select">
                                        <option value="1" <?php echo ($condition['value'] == '1' ? 'selected="selected"' : '')?>>TRUE</option>
                                        <option value="0" <?php echo ($condition['value'] == '0' ? 'selected="selected"' : '')?>>FALSE</option>
                                    </select>
                                </span>
                            </span>&nbsp;:
                        <ul class="rule-param-children">
                            <?php $sub_counter = 0;?>
                            <?php foreach ($rule as $key => $data) { ?>
                            <?php $sub_counter++;?>
                            <?php $key_counter = explode("--", $key);?>
                            <?php $key_counter = $key_counter[0];?>
                            <?php if($counter == $key_counter) { ?>
                            <li>
                            <input id="conditions__<?php echo $counter?>--<?php echo $sub_counter?>__type" name="rule[conditions][<?php echo $counter?>--<?php echo $sub_counter?>][type]" value="<?php echo $data['type']?>" class="hidden" type="hidden">
                            <input type="hidden" class="hidden" id="conditions__<?php echo $counter?>--<?php echo $sub_counter?>__attribute" name="rule[conditions][<?php echo $counter?>--<?php echo $sub_counter?>][attribute]" value="attribute_set_id"> <?php echo $data['data']['label']?>&nbsp;
                            <span class="rule-param"><a href="javascript:void(0)" class="label"><?php echo $model->getOperatorToText(htmlspecialchars_decode($data['operator']))?></a>
                            <span class="element">
                            <select id="conditions__<?php echo $counter?>--<?php echo $sub_counter?>__operator" name="rule[conditions][<?php echo $counter?>--<?php echo $sub_counter?>][operator]" class=" element-value-changer select">
                            <?php foreach($data['data']['operator'] as $op => $label) { ?>
                            <option value="<?php echo $op?>" <?php echo (htmlspecialchars_decode($data['operator']) === $op ? 'selected="selected"' : '')?>><?php echo $label?></option>
                            <?php } ?>
                            </select>
                            </span></span>&nbsp;
                                            <span class="rule-param"><a href="javascript:void(0)" class="label"><?php echo $data['data']['selected']?></a>
                                            <span class="element">
                                                <?php if($data['data']['type'] == 'select' || $data['data']['type'] == 'radio' || $data['data']['type'] == 'select') { ?>
                                                <select id="conditions__<?php echo $counter?>--<?php echo $sub_counter?>__value" name="rule[conditions][<?php echo $counter?>--<?php echo $sub_counter?>][value]" class=" element-value-changer select">
                                                    <option value=""></option>
                                                    <?php foreach($data['data']['values'] as $v) { ?>
                                                    <option value="<?php echo $v['value_id']?>" <?php echo ($v['selected'] > 0 ? 'selected="selected"' : '')?>><?php echo $v['name']?></option>
                                                    <?php } ?>
                                                </select>
                                                <?php }else{ ?>
                                                <input id="conditions__<?php echo $counter?>--<?php echo $sub_counter?>__value" name="rule[conditions][<?php echo $counter?>--<?php echo $sub_counter?>][value]" value="<?php echo $data['data']['selected']?>" type="text" class=" input-text element-value-changer">
                                                <?php } ?>
                                            </span></span>&nbsp; <span class="rule-param"><a href="javascript:void(0)" class="rule-param-remove" title="Remove"><img src="view/image/rewardpoints/rule_component_remove.gif" alt="" class="v-middle"></a></span>
                            </li>
                            <?php } ?>
                            <?php } ?>
                            <li>
                                    <span class="rule-param rule-param-new-child">
                                        <a href="javascript:void(0)" class="label"><img src="view/image/rewardpoints/rule_component_add.gif" class="rule-param-add v-middle" alt="" title="Add"></a><span class="element">
                                            <select id="conditions__<?php echo $counter?>__new_child" name="rule[conditions][<?php echo $counter?>][new_child]" class="element-value-changer select">
                                                <option value="" selected="selected">Please choose a condition to add...</option>
                                                <optgroup label="<?php echo $language->get('text_product_option')?>">
                                                    <?php foreach($product_attributes as $product_attribute){ ?>
                                                    <?php
                                                        $addition_model = $product_attribute['model'].
                                                                          (isset($product_attribute['type']) && !empty($product_attribute['type']) ? '-'.$product_attribute['type'] : '').
                                                                          (isset($product_attribute['method']) && !empty($product_attribute['method']) ? '-'.$product_attribute['method'] : '');
                                                    ?>
                                                    <option value="<?php echo $addition_model.($product_attribute['id'] ? '|'.$product_attribute['id']: '')?>"><?php echo $product_attribute['text']?></option>
                                                    <?php } ?>
                                                </optgroup>
                                            </select>
                                    </span></span>&nbsp;
                            </li>
                        </ul>
                    </fieldset>
                    <?php } ?>
                </div>
            </div>
            <div class="tab-pane " id="tab-rule-actions">
                <div>
                    <div class="entry-head">
                        <h4><?php echo $language->get('tab_rule_actions_h4')?></h4>
                    </div>
                    <div id="rule_actions_fieldset">
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('text_apply')?></label>
                            <div class="col-sm-5">
                                <select id="rule_simple_action" name="actions" class="form-control">
                                    <option value="1" <?php echo ($actions == "1" ? 'selected=="selected"' : '')?>><?php echo $language->get('Fixed Reward Points per item(X)')?></option>
                                    <option value="2" <?php echo ($actions == "2" ? 'selected=="selected"' : '')?>><?php echo $language->get('Spend (Y) Get (X) Reward Points per item')?></option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('Reward Points (X)')?></label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" name="reward_point" style="width: 242px" value="<?php echo $reward_point?>"/>

                                <?php if ($error_reward_point) { ?>
                                <div class="text-danger"><?php echo $error_reward_point; ?></div>
                                <?php } ?>
                            </div>
                        </div>
                        <div class="form-group required">
                            <label class="col-sm-2 control-label" for="input-name"><?php echo $language->get('Per (Y) dollars Spent')?></label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" name="reward_per_spent" style="width: 242px" value="<?php echo $reward_per_spent?>"/>
                                <p class="note" id="note_reward_per_spent"><span><?php echo $language->get('Skip if Fixed Reward Points chosen')?></span></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</div>
</div>
</div>
<script type="text/template" id="rule-condition-li">
    <li>
        <input id="conditions__1--<%= counter %>__type" name="rule[conditions][1--<%= counter %>][type]" value="<%= condition_model %>" class="hidden" type="hidden">
        <input id="conditions__1--<%= counter %>__text" name="rule[conditions][1--<%= counter %>][text]" value="<%= condition_label %>" class="hidden" type="hidden">
        <input type="hidden" class="hidden" id="conditions__1--<%= counter %>__attribute" name="rule[conditions][1--<%= counter %>][attribute]" value="attribute_set_id"> <%= condition_label %>&nbsp;
        <span class="rule-param"><a href="javascript:void(0)" class="label">is</a>
        <span class="element">
        <%= condition_operator %>
        </span></span>&nbsp;
        <span class="rule-param"><a href="javascript:void(0)" class="label"><%= condition_value_selected %></a>
            <span class="element">
        <%= condition_options_value %>
        </span></span>&nbsp; <span class="rule-param"><a href="javascript:void(0)" class="rule-param-remove" title="Remove"><img src="view/image/rewardpoints/rule_component_remove.gif" alt="" class="v-middle"></a></span>
    </li>
</script>

<script type="text/template" id="rule-condition-li-wait">
    <li class="rule-param-wait"><?php echo $language->get('text_rule_condition_wait')?></li>
</script>

<script type="text/template" id="rule-condition-operator">
    <select id="conditions__1--<%= counter %>__operator" name="rule[conditions][1--<%= counter %>][operator]" class=" element-value-changer select">
        <% _.each(operator, function(text, op){ %>
        <option value="<%= op%>"><%= text%></option>
        <% });%>
    </select>
</script>

<script type="text/template" id="rule-condition-value">
    <% if(type == 'select' || type == 'radio' || type == 'checkbox') { %>
    <select id="conditions__1--<%= counter %>__value" name="rule[conditions][1--<%= counter %>][value]" class=" element-value-changer select">
        <option value="" selected="selected"></option>
        <% _.each(values, function(value){ %>
        <option value="<%= value.value_id%>"><%= value.name%></option>
        <% });%>
    </select>
    <% }else{ %>
    <input id="conditions__1--<%= counter %>__value" name="rule[conditions][1--<%= counter %>][value]" value="" type="text" style='width:100px !important;' class=" input-text element-value-changer">
    <% } %>
</script>
<script type="text/javascript"><!--
    $('.date').datetimepicker({
        pickTime: false
    });
    //--></script>
<?php echo $footer; ?>