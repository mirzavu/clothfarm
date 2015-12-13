<ul id="menu">

<li id="dashboard"><a href="<?php echo $home; ?>"><i class="fa fa-dashboard fa-fw"></i> <span><?php echo $text_dashboard; ?></span></a></li>

<li id="sale"><a class="parent"><i class="fa fa-shopping-cart fa-fw"></i> <span><?php echo $text_sale; ?></span></a>
	<ul>
		<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
		<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>      				
		
	</ul>
</li>

<li id="funds"><a class="parent"><i class="fa fa-money fa-fw"></i> <span><?php echo $text_funds; ?></span></a>
	<ul>
		<li><a href="<?php echo $sales_commission; ?>"><?php echo $text_sales_commission; ?></a></li>
		<li><a href="<?php echo $sales_debits; ?>"><?php echo $text_sales_debits; ?></a></li>		
		<li><a href="<?php echo $vendor_payments; ?>"><?php echo $text_vendor_payment; ?></a></li>   	   
	</ul>
</li>

<li id="catalog"><a class="parent"><i class="fa fa-tags fa-fw"></i> <span><?php echo $text_catalog; ?></span></a>
	<ul>
		<li><a href="<?php echo $category; ?>"><?php echo $text_category; ?></a></li>
		<li><a href="<?php echo $product; ?>"><?php echo $text_manage_product; ?></a></li>   		  
		<li><a href="<?php echo $filter; ?>"><?php echo $text_filter; ?></a></li>
		<li><a class="parent"><?php echo $text_attribute; ?></a>
			<ul>
				<li><a href="<?php echo $attribute; ?>"><?php echo $text_attribute; ?></a></li>
				<li><a href="<?php echo $attribute_group; ?>"><?php echo $text_attribute_group; ?></a></li>
			</ul>
		</li>
		<li><a href="<?php echo $bank_details; ?>"><?php echo $text_bank_details; ?></a></li>
		<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
		<li><a href="<?php echo $review; ?>"><?php echo $text_review; ?></a></li>
<?php /*
		<li><a href="<?php echo $option; ?>"><?php echo $text_option; ?></a></li>      
*/ ?>
		<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>      
	</ul>
</li>

<li><a class="parent"><i class="fa fa-share-alt fa-fw"></i> <span><?php echo $text_promotions; ?></span></a>
	<ul>
		<li><a href="<?php echo $coupon; ?>"><?php echo $text_coupon; ?></a></li>		     
<?php /*		<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li> */?>
	</ul>
</li>

<li id="vendors"><a class="parent"><i class="fa fa-bank fa-fw"></i> <span><?php echo $text_vendors; ?></span></a>
	<ul>
		<li><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li>		
		<li><a href="<?php echo $location; ?>"><?php echo $text_location; ?></a></li>		
	</ul>
</li>

<li id="tools"><a href="<?php echo $tickets; ?>"><i class="fa fa-wrench fa-fw"></i> <span><?php echo $vendor_ticket; ?></span></a></li>

<li id="system"><a class="parent"><i class="fa fa-cog fa-fw"></i> <span><?php echo $text_system; ?></span></a>
	<ul> 	
		               
			
		<li><a href="<?php echo $banner; ?>"><?php echo $text_banner; ?></a></li>
		<li><a href="<?php echo $information; ?>"><?php echo $text_information; ?></a></li>
	</ul>
</li>          

<li id="reports"><a class="parent"><i class="fa fa-bar-chart-o fa-fw"></i> <span><?php echo $text_reports; ?></span></a>
	<ul>
		<li><a class="parent"><?php echo $text_sale; ?></a>
			<ul>
				<li><a href="<?php echo $report_sale_order; ?>"><?php echo $text_report_sale_order; ?></a></li>
				<li><a href="<?php echo $report_sale_tax; ?>"><?php echo $text_report_sale_tax; ?></a></li>
                               <li><a href="<?php echo $report_sale_shipping; ?>"><?php echo $text_report_sale_shipping; ?></a></li>
				<li><a href="<?php echo $report_sale_return; ?>"><?php echo $text_report_sale_return; ?></a></li>
				<li><a href="<?php echo $report_sale_coupon; ?>"><?php echo $text_report_sale_coupon; ?></a></li>
			</ul>
		</li>
		<li><a class="parent"><?php echo $text_product; ?></a>
			<ul>
				<li><a href="<?php echo $report_product_viewed; ?>"><?php echo $text_report_product_viewed; ?></a></li>
				<li><a href="<?php echo $report_product_purchased; ?>"><?php echo $text_report_product_purchased; ?></a></li>
			</ul>
		</li>
			
	</ul>
</li>
<li id="subscribe"><a class="parent"><i class="fa fa-bank fa-fw"></i> <span><?php echo $subscriber; ?></span></a>
	<ul>
		<li><a href="<?php echo $subscribe; ?>"><?php echo $renew_subscribe; ?></a></li>		
		<li><a href="<?php echo $prev_subscribe; ?>"><?php echo $prev_subscriber; ?></a></li>		
	</ul>
</li>
<li id="autopost"><a class="parent"><i class="fa fa-bank fa-fw"></i> <span><?php echo $autoposter; ?></span></a>
	<ul>
		<li><a href="<?php echo $autopost; ?>"><?php echo $renew_autopost; ?></a></li>		
		<li><a href="<?php echo $prev_autopost; ?>"><?php echo $prev_autoposter; ?></a></li>		
	</ul>
</li>
  
</ul>
