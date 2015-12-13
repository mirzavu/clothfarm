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
        <button type="submit" form="form-refund" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-refund" class="form-horizontal">

	<div class="form-group required">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_vendor; ?></label>
            <div class="col-sm-10">              
                <select name="store" id="input-order-status" class="form-control">
                  <option value=""></option>                 
                  <?php foreach ($stores as $stores) { ?>
                  <?php if ($stores['store_id'] == $store) { ?>
                  <option value="<?php echo $stores['store_id']; ?>" selected="selected"><?php echo ucfirst($stores['name']); ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $stores['store_id']; ?>"><?php echo ucfirst($stores['name']); ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
		 <?php if ($error_store) { ?>
              <div class="text-danger"><?php echo $error_store; ?></div>
              <?php } ?>
            </div>
          </div>

	<div class="form-group required">
            <label class="col-sm-2 control-label" for="input-author"><?php echo $entry_debit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="debit" value="<?php echo $debit; ?>" placeholder="<?php echo $entry_debit; ?>" id="input-debit" class="form-control" />            
            </div>
          </div>

	<div class="form-group required">
            <label class="col-sm-2 control-label" for="input-author"><?php echo $entry_dispute; ?></label>
            <div class="col-sm-10">
              <input type="text" name="dispute" value="<?php echo $dispute; ?>" placeholder="<?php echo $entry_dispute; ?>" id="input-dispute" class="form-control" />             
            </div>
          </div>

          
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-text"><?php echo $entry_reason; ?></label>
            <div class="col-sm-10">
              <textarea name="reason" cols="60" rows="8" placeholder="<?php echo $entry_reason; ?>" id="input-text" class="form-control"><?php echo $reason; ?></textarea>
             
            </div>
          </div>
          
          
        </form>
      </div>
    </div>
  </div>
 </div>
<?php echo $footer; ?>