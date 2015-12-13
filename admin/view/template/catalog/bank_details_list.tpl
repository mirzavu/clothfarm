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
      <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-bank_details').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
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
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-bank_details">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left"><?php if ($sort == 'name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?></td>
                     <td class="text-left"><?php if ($sort =='bank_name') { ?>
                    <a href="<?php echo $sort_bank_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_bank_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_bank_name; ?>"><?php echo $column_bank_name; ?></a>
                    <?php } ?></td>
                     <td class="text-left"><?php if ($sort == 'account_no') { ?>
                    <a href="<?php echo $sort_account_no; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_account_no; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_account_no; ?>"><?php echo $column_account_no; ?></a>
                    <?php } ?></td>
                     <td class="text-left"><?php if ($sort == 'branch_name') { ?>
                    <a href="<?php echo $sort_branch_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_branch_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_branch_name; ?>"><?php echo $column_branch_name; ?></a>
                    <?php } ?></td>
                     <td class="text-left"><?php if ($sort == 'ifsc_code') { ?>
                    <a href="<?php echo $sort_ifsc_code; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_ifsc_code; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_ifsc_code; ?>"><?php echo $column_ifsc_code; ?></a>
                    <?php } ?></td>
                    <td class="text-left"><?php if ($sort == 'vendor') { ?>
                    <a href="<?php echo $sort_vendor; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_ifsc_code; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_vendor; ?>"><?php echo $column_vendor; ?></a>
                    <?php } ?></td>
                     <td class="text-left"><?php if ($sort == 'email') { ?>
                    <a href="<?php echo $sort_email; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_email; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_email; ?>"><?php echo $column_email; ?></a>
                    <?php } ?></td>
                  <!-- <td class="text-right"><?php if ($sort == 'sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                    <?php } ?></td> -->
                 <!--  <td class="text-right"><?php echo $column_action; ?></td> -->
                </tr>
              </thead>
              <tbody>
                <?php if ($bank_detailss) { ?>
                <?php foreach ($bank_detailss as $bank_details) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($bank_details['bank_details_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $bank_details['bank_details_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $bank_details['bank_details_id']; ?>" />
                    <?php } ?></td>
                  <td class="text-left"><?php echo $bank_details['name']; ?></td>
                   <td class="text-left"><?php echo $bank_details['bank_name']; ?></td>
                    <td class="text-left"><?php echo $bank_details['account_no']; ?></td>
                     <td class="text-left"><?php echo $bank_details['branch_name']; ?></td>
                      <td class="text-left"><?php echo $bank_details['ifsc_code']; ?></td>
                      <td class="text-left"><?php echo $bank_details['vendor']; ?></td>
                      <td class="text-left"><?php echo $bank_details['email']; ?></td>
               <!--    <td class="text-right"><?php echo ucfirst($bank_details['store_id']); ?></td> -->
                 <!--  <td class="text-right"><a href="<?php echo $bank_details['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td> -->
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
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
