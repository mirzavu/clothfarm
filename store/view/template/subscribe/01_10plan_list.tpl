<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
</br></br></br></br></br>
 <?php  if (isset($plans)) { ?>
                <?php foreach ($plans as $plan)  {  ?>
	<div  style="width:10%;float:left;border:1px solid;">
	<?php echo $plan['plan_name']; ?>
		<div style="width:100%;float:left;">
		<?php echo $plan['plan_amount']; ?>
			<div style="width:100%;float:left;">
				<?php echo $plan['plan_days']." Days"; ?>
				<div style="width:100%;float:left;">
			
				<a href="<?php echo $plan['subscribe']; ?>">Subscribe</a>
				</div>
			</div>
		</div>
	</div>
	
	<?php } } ?>
	
</div>

<?php echo $footer; ?> 
