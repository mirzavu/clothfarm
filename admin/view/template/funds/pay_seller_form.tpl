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
<?php if($balance > 0){ ?>
        <button type="submit" form="form-refund" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary">Pay</button>
<?php } ?>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default">Cancel</a></div>
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

	

	<div class="form-group">
            <label class="col-sm-2 control-label" for="input-author"><?php echo $entry_balance; ?></label>
            <div class="col-sm-10">
              <input type="text" readonly value="<?php echo $display_total_due; ?>" placeholder="<?php echo $entry_balance; ?>" id="input-balance" class="form-control" />             
            </div>
          </div>

	<div class="form-group required">
            <label class="col-sm-2 control-label" for="input-payment"><?php echo $entry_payment; ?></label>
            <div class="col-sm-10">
              <input type="text" name="payment" value="<?php echo $payment; ?>" placeholder="<?php echo $entry_payment; ?>" id="input-payment" class="form-control" />             
            </div>
          </div>

          
          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-text"><?php echo $entry_notes; ?></label>
            <div class="col-sm-10">
              <textarea name="notes" cols="60" rows="8" placeholder="<?php echo $entry_notes; ?>" id="input-text" class="form-control"><?php echo $notes; ?></textarea>
             
            </div>
          </div>
          
          
        </form>
      </div>
    </div>
  </div>
 </div>
<?php echo $footer; ?>