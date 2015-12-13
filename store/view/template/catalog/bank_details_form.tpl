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
        <button type="submit" form="form-bank_details" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-bank_details" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
           <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-bank_name"><?php echo $entry_bank_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="bank_name" value="<?php echo $bank_name; ?>" placeholder="<?php echo $entry_bank_name; ?>" id="input-bank_name" class="form-control" />
              <?php if ($error_bank_name) { ?>
              <div class="text-danger"><?php echo $error_bank_name; ?></div>
              <?php } ?>
            </div>
          </div>
           <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-account_no"><?php echo $entry_account_no; ?></label>
            <div class="col-sm-10">
              <input type="text" name="account_no" value="<?php echo $account_no; ?>" placeholder="<?php echo $entry_account_no; ?>" id="input-account_no" class="form-control" />
              <?php if ($error_account_no) { ?>
              <div class="text-danger"><?php echo $error_account_no; ?></div>
              <?php } ?>
            </div>
          </div>
           <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-branch_name"><?php echo $entry_branch_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="branch_name" value="<?php echo $branch_name; ?>" placeholder="<?php echo $entry_branch_name; ?>" id="input-branch_name" class="form-control" />
              <?php if ($error_branch_name) { ?>
              <div class="text-danger"><?php echo $error_branch_name; ?></div>
              <?php } ?>
            </div>
          </div>
           <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-ifsc_code"><?php echo $entry_ifsc_code; ?></label>
            <div class="col-sm-10">
              <input type="text" name="ifsc_code" value="<?php echo $ifsc_code; ?>" placeholder="<?php echo $entry_ifsc_code; ?>" id="input-ifsc_code" class="form-control" />
              <?php if ($error_ifsc_code) { ?>
              <div class="text-danger"><?php echo $error_ifsc_code; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>
            <div class="form-group" style="display:none;">
            <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
            <div class="col-sm-10">
              <div class="well well-sm" style="height: 150px; overflow: auto;">

                <?php foreach ($stores as $store) { ?>
                <div class="checkbox">                 
    <label>                       
                        <input type="checkbox" name="bank_details_store[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                        <?php echo $store['name']; ?>                       
                      </label>  
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>
