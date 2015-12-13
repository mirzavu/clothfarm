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
        <button type="submit" form="form-store" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      
    </div>
  </div>
  <div class="container-fluid">
   
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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-store" class="form-horizontal">
         <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  
                
                  <td class="text-left"><?php echo $subject; ?></td>
                  <td class="text-left"><?php echo $message; ?></td>
				  <td class="text-left"><?php echo $vendor_label; ?></td>
				  <td class="text-left"><?php echo $date_label; ?></td>
				   <td class="text-left"><?php echo $status_label; ?></td>
				  
                </tr>
              </thead>
              <tbody>
                <?php  if (isset($current_ticket)) { ?>
                <?php foreach ($current_ticket as $store)  {  ?>
                <tr>
                 
					
                  <td class="text-left"><?php echo $store['current_ticket_subject']; ?></td>
                  <td class="text-left"><?php echo $store['current_ticket_message']; ?></td>
				  <td class="text-left"><?php echo $store['current_ticket_vendor']; ?></td>
				   <td class="text-left"><?php echo date("Y-m-d h:i:s",$store['current_ticket_time']); ?></td>
				  <td class="text-left"><a  data-toggle="tooltip"><?php if($store['current_status']==1){ echo $open; }else if($store['current_status']==2){ echo $closed; }else if($store['current_status']==3){ echo $onhold; }else if($store['current_status']==4){ echo $pending_customer; }else if($store['current_status']==5){ echo $pending_vendor; }else{ echo ""; } ?></a></td>
               
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
			
			  <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  
                  <td class="text-left"><?php echo $sender; ?></td>
                  <td class="text-left"><?php echo $message; ?></td>
				  <td class="text-left"><?php echo $date_label; ?></td>
			 </tr>
              </thead>
              <tbody>
                <?php  if (isset($reply_ticket)) { ?>
                <?php foreach ($reply_ticket as $store)  {  ?>
                <tr>
                 
				  <td class="text-left"><?php echo $store['sender_email']; ?></td>
                  <td class="text-left"><?php echo $store['reply_ticket_message']; ?></td>
				  <td class="text-left"><?php echo date("Y-m-d h:i:s",$store['reply_ticket_time']); ?></td>
				
               
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
			 <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-url"><span data-toggle="tooltip" data-html="true" ><?php echo $message_label; ?></span></label>
                <div class="col-sm-10">
                  <textarea  name="message" id="message" class="form-control" /></textarea>
                   <?php if (isset($error_message)) { ?>
                  <div class="text-danger"><?php echo $error_message; ?></div>
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
