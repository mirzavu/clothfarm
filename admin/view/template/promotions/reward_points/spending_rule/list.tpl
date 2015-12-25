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
                <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-option">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <td class="text-left"><?php echo $language->get('column_id')?></td>
                                <td class="text-center"><?php echo $language->get('column_rule_name')?></td>
                                <td class="text-center"><?php echo $language->get('column_start_date')?></td>
                                <td class="text-center"><?php echo $language->get('column_end_date')?></td>
                                <td class="text-center"><?php echo $language->get('column_status')?></td>
                                <td class="text-right"><?php echo $language->get('column_action')?></td>
                            </tr>
                            </thead>
                            <tbody>
                            <?php if ($rules) { ?>
                            <?php foreach($rules as $rule) { ?>
                            <?php $rule_url = $url->link('promotions/reward_points/spendingRuleEdit', 'rule_id='.$rule['rule_id'].'&token=' . $token, 'SSL') ?>
                            <tr>
                                <td class="text-left"><?php echo $rule['rule_id']?></td>
                                <td class="text-left"><?php echo $rule['name']?></td>
                                <td class="text-center"><?php echo $rule['start_date']?></td>
                                <td class="text-center"><?php echo $rule['end_date']?></td>
                                <td class="text-center"><?php echo ($rule['status'] == '1' ? 'Enabled' : 'Disabled')?></td>
                                <td class="text-center">[<a href="<?php echo $rule_url?>">Edit</a>]</td>
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
<?php echo $footer; ?>