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
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-store').submit() : false;"><i class="fa fa-trash-o"></i></button>
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
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-store">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left"><?php echo $subject; ?></td>
                  <td class="text-left"><?php echo $message; ?></td>
				  <td class="text-left"><?php echo $vendor_label; ?></td>
				  <td class="text-left"><?php echo $date_label; ?></td>
				   <td class="text-left"><?php echo $status_label; ?></td>
			
                </tr>
              </thead>
              <tbody>
                <?php  if (isset($tickets)) { ?>
                <?php foreach ($tickets as $store)  {  ?>
                <tr>
                  <td class="text-center"><?php if (in_array($store['ticket_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $store['ticket_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $store['ticket_id']; ?>" />
                    <?php } ?></td>
					
                  <td class="text-left"><?php echo $store['subject']; ?></td>
                  <td class="text-left"><?php echo $store['message']; ?></td>
				  <td class="text-left"><?php echo $store['vendor']; ?></td>
				   <td class="text-left"><?php echo date("Y-m-d h:i:s",$store['ticket_time']); ?></td>
				  <td class="text-left"><a href="<?php echo $store['list_child']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" ><?php if($store['status']==1){ echo $open; }else if($store['status']==2){ echo $closed; }else if($store['status']==3){ echo $onhold; }else if($store['status']==4){ echo $pending_customer; }else if($store['status']==5){ echo $pending_vendor; }else{ echo ""; } ?></a></td>
                 
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
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 
