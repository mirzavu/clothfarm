<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">


<div class="pln-dtl col-lg-12 col-md-12 col-sm-12 col-xs-12">
	<?php /*	<?php
	foreach($plans as $plan){ ?>
	<p><?php echo 'Plan Name : '.$plan['plan_name']; ?></p>
	<p><?php echo 'Plan Amount : '.$plan['plan_amount']; ?></p>
	<?php } ?>*/?>	

	<table class="pln-detl-tbl">
		<tr>
			<th>Plan Name</th>
                        <th>Plan Days</th>
			<th>Plan Amount</th>
			<th rowspan="2">
				
			

	<form action="https://sandbox.paypal.com/cgi-bin/webscr" method="post" target="_top">
<input type="hidden" name="cmd" value="_xclick">
<input type="hidden" name="business" value="<?php echo $payment_email; ?>">
<input type="hidden" name="lc" value="US">
<input type="hidden" name="item_name" value="<?php echo $plan_name; ?>">
<input type="hidden" name="custom" value="<?php echo $plan_merchant_id; ?>">
<input type="hidden" name="amount" value="<?php echo $plan_amount; ?>">
<input type="hidden" name="currency_code" value="USD">
<input type="hidden" name="button_subtype" value="services">
<input type="hidden" name="no_note" value="0">
<input type="hidden" name="cn" value="Add special instructions to the seller:">
<input type="hidden" name="no_shipping" value="2">
<input type="hidden" name="rm" value="1">
<input type="hidden" name="return" value="<?php echo $return_method; ?>">
<input type="hidden" name="cancel_return"     value="<?php echo $cancel_return; ?>">
<input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest">
<input type="hidden" name="notify_url" value="<?php echo $return_ipn; ?>">
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynowCC_LG.gif"     border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
			
		

			</th>
		</tr>
		<tr>
			<?php foreach($plans as $plan){ ?>
				<td><?php echo $plan['plan_name']; ?></td>
                                <td><?php echo $plan['plan_days']; ?></td>
				<td>AED <?php echo $plan['plan_amount']; ?></td>
			<?php } ?>
		</tr>
                <tr>
		<td colspan="4"><b>Want to Pay CASH ? Click Here to </b><a href="mailto:<?php echo $emailto; ?>?Subject=Payment%20Cash" target="_blank"><b>Email Admin</b></a></td>


		</tr>
		
	</table>

	






</div><!--pln-dtl-->	

</div><!--#content-->

<?php echo $footer; ?> 




