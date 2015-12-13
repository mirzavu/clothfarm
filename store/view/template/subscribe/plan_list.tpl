<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
	
	<div class="subs-bx-prnt col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<div class="pln-txt col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<h3>Plan Details</h3>
		<p>Current Plan is <b><?php echo $current_plan_name; ?></b>. Expiry Date on <b><?php echo $current_expiry_date; ?></b></p>
	</div>
		<?php  if (isset($plans)) { ?>
		            <?php foreach ($plans as $plan)  {  ?>
		<div  class="col-lg-3 col-md-3 col-sm-3 col-xs-12 subs-bx ">
			<div  class="col-lg-12 col-md-12 col-sm-12 col-xs-12 text-center subs-bx-inr <?php if($current_plan_id === $plan['plan_id']){ ?>active<?php } ?>">
				<h4 class="text-uppercase"><?php echo $plan['plan_name']; ?></h4>
				
				<p class="price">AED <?php echo $plan['plan_amount']; ?></p>
				<p class="days"><?php echo $plan['plan_days']." Days"; ?></p>
				
				<div class="subs-btn"><a href="<?php echo $plan['subscribe']; ?>" class="btn btn-default">Subscribe</a></div><!--subs-btn-->
			</div><!--subs-bx-inr-->
		</div><!--subs-bx-->

		<?php } } ?>
	</div><!--subs-bx-prnt-->
	
</div><!--#content-->

<?php echo $footer; ?> 
