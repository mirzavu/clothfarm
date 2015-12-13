<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  
  
  <div>    
    <div class="row noGutter">
	
	
	<div class="subtitle">
        <div><span>SUBSCRIPTION PLAN</span></div>
    </div>
	<div class="divider divider-sm"></div>
	
    

<?php if(count($plans)>0){ foreach ($plans as $plan) { ?>

        <div class="col-sm-6 col-md-3">
            <div class="price-table <?php if($plan['highlight']==1){ echo 'active'; } ?> ">
                <div class="price-table-title"><?php echo $plan['plan_name']; ?></div>
                <div class="price-table-price"><?php if($plan['plan_amount'] != 0){ echo $plan['plan_amount']. " AED"; }else{ echo "FREE"; } ?></div>
                <ul class="price-table-info">
                    <?php ?>					
					<li><?php echo $plan['plan_days']."Days"; ?></li>
                    
					<li><?php echo $plan['description']; ?></li>
						
					<?php ?>	
						
                </ul>
 <button class="btn btn-cool btn-md" onclick="location.href='<?php echo $action; ?>&plan_id=<?php echo $plan['plan_id']; ?>' ">Register</button>
            </div>
        </div>

<?php } } ?>

    </div>




</div>
  
  
  
</div>

<?php echo $footer; ?>
