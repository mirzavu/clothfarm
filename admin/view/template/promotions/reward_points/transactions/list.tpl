<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    <div class="page-header">
        <div class="container-fluid">
            <div class="pull-right"><a href="<?php echo $add_rule; ?>" data-toggle="tooltip" title="<?php echo $language->get('button_add_rule'); ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
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
        <?php if ($success) { ?>
        <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
        <?php } ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $language->get('text_list'); ?></h3>
            </div>
            <div class="panel-body">
                <form action="<?php echo $action?>" method="get">
                    <input type="hidden" name="token" value="<?php echo $token?>"/>
                    <input type="hidden" name="route" value="promotions/reward_points/allTransactionHistory"/>
                    <input type="hidden" id="url_post_status" value="<?php echo $url_post_status?>"/>
                    <div class="statistic">
                        <table class="form" style="width: 800px">

                            <tr>
                                <td>
                                    Date Range:
                                </td>
                                <td>
                                    From: <input type="text" class="date" name="start_date" value="<?php echo $start_date?>"/>
                                    To: <input type="text" class="date" name="end_date" value="<?php echo $end_date?>"/>
                                    <input type="submit" class="button" value="<?php echo $language->get('button_filter'); ?>" />
                                </td>
                            </tr>
                            <tr>
                                <td>Total <b>Rewarded Points</b></td>
                                <td><b><?php echo number_format($stats['total_rewarded'])?></b> <?php echo $config_text_points?></td>
                            </tr>
                            <tr>
                                <td>Total <b>Redeemed Points</b></td>
                                <td><b><?php echo number_format($stats['total_redeemed'])?></b> <?php echo $config_text_points?></td>
                            </tr>
                            <tr>
                                <td>Total <b>Orders</b></td>
                                <td><b><?php echo $stats['total_order']?></b></td>
                            </tr>
                        </table>
                    </div>
                    <div style="clear:both;"></div>
                    <div style="float: right;color: gray;  margin: 0 0 10px;display: block;"><i>Hover on status column to change and update</i></div>
                    <div class="table-responsive" style="margin: 36px 0;">
                        <table class="table table-bordered table-hover transactions">
                            <thead>
                            <tr>
                                <td class="text-left"><?php echo $language->get('column_id')?></td>
                                <td class="text-center"><?php echo $language->get('column_date_added')?></td>
                                <!-- DISPATCH_EVENT:TRANSACTION_AFTER_RENDER_COLUMN_DATE_ADDED -->
                                <td class="text-center"><?php echo $language->get('column_customer_name')?></td>
                                <td class="text-center"><?php echo $language->get('column_customer_email')?></td>
                                <td class="text-center"><?php echo $language->get('column_amount')?></td>
                                <!-- DISPATCH_EVENT:TRANSACTION_AFTER_RENDER_COLUMN_AMOUNT-->
                                <td class="text-center"><?php echo $language->get('column_transaction_detail')?></td>
                                <!-- DISPATCH_EVENT:TRANSACTION_AFTER_RENDER_COLUMN_DETAIL -->
                                <td class="text-center"><?php echo $language->get('column_status')?></td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="row-filter-field" style="height: 40px;">
                                <td><!-- ID --></td>
                                <td><!-- START_DATE --></td>
                                <!-- DISPATCH_EVENT:TRANSACTION_AFTER_RENDER_COLUMN_FILTER_DATE_ADDED -->
                                <td></td>
                                <td><input type="text" name="filter_email" value="<?php echo $filter_email?>"/></td>
                                <td></td>
                                <!-- DISPATCH_EVENT:TRANSACTION_AFTER_RENDER_COLUMN_FILTER_AMOUNT -->
                                <td></td>
                                <!-- DISPATCH_EVENT:TRANSACTION_AFTER_RENDER_COLUMN_FILTER_DETAIL -->
                                <td>
                                    <select name="filter_status" id="">
                                        <option value=""></option>
                                        <option value="0" <?php echo ($filter_status == '0' ? 'selected="selected"' : '')?>>Pending</option>
                                        <option value="1" <?php echo ($filter_status == '1' ? 'selected="selected"' : '')?>>Complete</option>
                                        <option value="2" <?php echo ($filter_status == '2' ? 'selected="selected"' : '')?>>Expired</option>
                                    </select>
                                </td>
                            </tr>
                            <?php if ($transactions) { ?>
                            <?php foreach($transactions as $transaction) { ?>
                            <?php if($transaction['customer_id'] != '0'){ ?>
                            <?php $customer = $model_sale_customer->getCustomer($transaction['customer_id'])?>
                            <?php $customer_name = $customer['firstname']." ".$customer['lastname']?>
                            <?php }else{ ?>
                            <?php if($transaction['order_id'] != 0){ ?>
                            <?php $order = $model_sale_order->getOrder($transaction['order_id']); ?>
                            <?php $customer_name = $order['firstname']." ". $order['lastname'] ?>
                            <?php $customer['email'] = $order['email']; ?>
                            <?php } ?>
                            <?php }?>
                            <tr>
                                <td class="text-left"><?php echo $transaction['customer_reward_id']?></td>
                                <td class="text-left"><?php echo $transaction['date_added']?></td>
                                <!-- DISPATCH_EVENT:TRANSACTION_AFTER_FOREACH_COLUMN_DATE_ADDED -->
                                <td class="text-left"><?php echo $customer_name?></td>
                                <td class="text-center"><?php echo $customer['email']?></td>
                                <td class="text-center"><?php echo ($transaction['points'] > 0 ? '+' : '').$transaction['points']?></td>
                                <!-- DISPATCH_EVENT:TRANSACTION_AFTER_FOREACH_COLUMN_AMOUNT -->
                                <td class="text-left"><?php echo $transaction['description']?></td>
                                <!-- DISPATCH_EVENT:TRANSACTION_AFTER_FOREACH_COLUMN_DETAIL -->
                                <td class="text-center transaction_status">
                                    <span class="container_status">
                                        <span class="text_status"><?php echo ($transaction['status'] == '1' ? 'Complete' : ($transaction['status'] == '2' ? 'Expired' : 'Pending'))?></span>
                                        <span class="selection_status">
                                            <select class="reward_status">
                                                <option value="0" <?php echo ($transaction['status'] == "0" ? 'selected="selected"' : '')?>>Pending</option>
                                                <option value="1" <?php echo ($transaction['status'] == "1" ? 'selected="selected"' : '')?>>Complete</option>
                                            </select>
                                        </span>
                                        <span class="action_status"><a href="javascript:;" data="<?php echo $transaction['customer_reward_id']?>" class="update_status">Update</a></span>
                                    </span>
                                </td>
                            </tr>
                            <?php } ?>
                            <?php } else { ?>
                            <tr>
                                <td class="center" colspan="8"><?php echo $language->get('text_no_result'); ?></td>
                            </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div class="row">
                    <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                    <div class="col-sm-6 text-right"><?php echo $results; ?></div>
                </div>
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