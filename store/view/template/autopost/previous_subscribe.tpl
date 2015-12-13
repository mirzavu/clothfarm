<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">

  <div class="page-header">
    <div class="container-fluid">
    
      <h1><?php echo $heading_title; ?></h1>
      
    </div>
  </div>
  <div class="container-fluid">
   
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
                 
				   <td class="text-left">S.No</td>
                  <td class="text-left"><?php echo $plan_name; ?></td>
                <?php /*  <td class="text-left"><?php echo $plan_amount; ?></td> */ ?>
				  <td class="text-left"><?php echo $start_date; ?></td>
				   <td class="text-left"><?php echo $expiry_date; ?></td>
				 
				
			
                </tr>
              </thead>
              <tbody>
                <?php   if(isset($plans)) { ?>
                <?php $i = 0; foreach ($plans as $plan)  {  $i++; ?>
                <tr>
                 
					 <td class="text-left"><?php echo $i; ?></td>
                  <td class="text-left"><?php echo $plan['plan_name']; ?></td>
                <?php /*  <td class="text-left"><?php echo $plan['plan_amount']; ?></td> */ ?>
				  <td class="text-left"><?php echo $plan['plan_days']; ?></td>
				   <td class="text-left"><?php echo $plan['expiry_date']; ?></td>
				  
				 
                 
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
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
