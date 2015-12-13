<ul id="menu">

<li id="dashboard"><a href="<?php echo $home; ?>"><i class="fa fa-dashboard fa-fw"></i> <span><?php echo $text_dashboard; ?></span></a></li>

<li id="sale"><a class="parent"><i class="fa fa-shopping-cart fa-fw"></i> <span><?php echo $text_sale; ?></span></a>
	<ul>
		<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
		<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>      
		<li><a href="<?php echo $paypal_search ?>"><?php echo $text_paypal_search ?></a></li>
		<li><a class="parent"><?php echo $text_tax; ?></a>
			<ul>
				<li><a href="<?php echo $tax_class; ?>"><?php echo $text_tax_class; ?></a></li>
				<li><a href="<?php echo $tax_rate; ?>"><?php echo $text_tax_rate; ?></a></li>
				<li><a href="<?php echo $length_class; ?>"><?php echo $text_length_class; ?></a></li>
				<li><a href="<?php echo $weight_class; ?>"><?php echo $text_weight_class; ?></a></li>
			</ul>
		</li>
		
	</ul>
</li>

<li id="funds"><a class="parent"><i class="fa fa-money fa-fw"></i> <span><?php echo $text_funds; ?></span></a>
	<ul>
		<li><a href="<?php echo $sales_commission; ?>"><?php echo $text_sales_commission; ?></a></li>
		<li><a href="<?php echo $sales_debits; ?>"><?php echo $text_sales_debits; ?></a></li>
		<li><a href="<?php echo $pay_seller; ?>"><?php echo $text_pay_seller; ?></a></li>	
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
		<li><a href="<?php echo $review; ?>"><?php echo $text_review; ?></a></li>
		<li><a href="<?php echo $option; ?>"><?php echo $text_option; ?></a></li>      
		<li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>      
	</ul>
</li>

<li><a class="parent"><i class="fa fa-share-alt fa-fw"></i> <span><?php echo $text_promotions; ?></span></a>
	<ul>
		<li><a href="<?php echo $news; ?>">News</a></li>
			
		<?php /*
		<li><a class="parent"><?php echo $text_voucher; ?></a>
			<ul>
				<li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
				<li><a href="<?php echo $voucher_theme; ?>"><?php echo $text_voucher_theme; ?></a></li>
			</ul>
		</li>*/ ?>
		<li><a href="<?php echo $coupon; ?>"><?php echo $text_coupon; ?></a></li>
<?php /*
		<li><a href="<?php echo $marketing; ?>"><?php echo $text_marketing; ?></a></li>
		<li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>      
*/ ?>
		<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
	</ul>
</li>

<li id="vendors"><a class="parent"><i class="fa fa-bank fa-fw"></i> <span><?php echo $text_vendors; ?></span></a>
	<ul>
		<li><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li>
		<li><a href="<?php echo $manage_vendors; ?>"><?php echo $text_manage_vendors; ?></a></li>
		<li><a href="<?php echo $location; ?>"><?php echo $text_location; ?></a></li>
		<li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
	</ul>
</li>
	
<li id="customer"><a class="parent"><i class="fa fa-user fa-fw"></i> <span><?php echo $text_customer; ?></span></a>
	<ul>
		<li><a href="<?php echo $customer; ?>"><?php echo $text_customer; ?></a></li>
		<li><a href="<?php echo $customer_group; ?>"><?php echo $text_customer_group; ?></a></li>
		<li><a href="<?php echo $custom_field; ?>"><?php echo $text_custom_field; ?></a></li>
		<li><a href="<?php echo $customer_ban_ip; ?>"><?php echo $text_customer_ban_ip; ?></a></li>
	</ul>
</li>

<li id="admins"><a class="parent"><i class="fa fa-group fa-fw"></i> <span><?php echo $text_users; ?></span></a>	
	<ul>
		  <li><a href="<?php echo $user; ?>"><?php echo $text_user; ?></a></li>
		  <li><a href="<?php echo $user_group; ?>"><?php echo $text_user_group; ?></a></li>          
	</ul>
</li>

<li id="cms"><a class="parent"><i class="fa fa-newspaper-o fa-fw"></i> <span><?php echo $text_cms; ?></span></a>
	<ul>
		<li><a class="parent"><?php echo $text_design; ?></a>
			<ul>
<?php /*
				<li><a href="<?php echo $layout; ?>"><?php echo $text_layout; ?></a></li>
*/ ?>
				<li><a href="<?php echo $banner; ?>"><?php echo $text_banner; ?></a></li>
			</ul>
		</li>
		<li><a href="<?php echo $information; ?>"><?php echo $text_information; ?></a></li>	
	</ul>
</li> 
 
<li id="shipping"><a href="<?php echo $shipping; ?>"><i class="fa fa-truck fa-fw"></i> <span><?php echo $text_shipping; ?></span></a></li>

<li id="payment"><a href="<?php echo $payment; ?>"><i class="fa fa-credit-card fa-fw"></i> <span><?php echo $text_payment; ?></span></a></li>

<li id="tools"><a href="<?php echo $tickets; ?>"><i class="fa fa-wrench fa-fw"></i> <span><?php echo $vendor_ticket; ?></span></a></li>

<li id="system"><a class="parent"><i class="fa fa-cog fa-fw"></i> <span><?php echo $text_system; ?></span></a>
	<ul> 
		<li><a href="<?php echo $general_settings; ?>"><?php echo $text_general_settings; ?></a></li>                 
		<li><a class="parent"><?php echo $text_localisation; ?></a>
			<ul>         
				<li><a href="<?php echo $language; ?>"><?php echo $text_language; ?></a></li>
				<li><a href="<?php echo $currency; ?>"><?php echo $text_currency; ?></a></li>          
				<li><a href="<?php echo $country; ?>"><?php echo $text_country; ?></a></li>
				<li><a href="<?php echo $zone; ?>"><?php echo $text_zone; ?></a></li>
				<li><a href="<?php echo $geo_zone; ?>"><?php echo $text_geo_zone; ?></a></li>          
			</ul>
		</li>
		<li><a class="parent"><?php echo $text_manage_statuses; ?></a>	
			<ul>                   
				<li><a href="<?php echo $stock_status; ?>"><?php echo $text_stock_status; ?></a></li>
				<li><a href="<?php echo $order_status; ?>"><?php echo $text_order_status; ?></a></li>
				<li><a class="parent"><?php echo $text_return; ?></a>
					<ul>
						<li><a href="<?php echo $return_status; ?>"><?php echo $text_return_status; ?></a></li>
						<li><a href="<?php echo $return_action; ?>"><?php echo $text_return_action; ?></a></li>
						<li><a href="<?php echo $return_reason; ?>"><?php echo $text_return_reason; ?></a></li>
					</ul>
				</li>                    
			</ul>
		</li>	
		<li><a class="parent"><?php echo $text_tools; ?></a>
			<ul>
				<li><a href="<?php echo $upload; ?>"><?php echo $text_upload; ?></a></li>
				<li><a href="<?php echo $backup; ?>"><?php echo $text_backup; ?></a></li>
				<li><a href="<?php echo $error_log; ?>"><?php echo $text_error_log; ?></a></li>
			</ul>
		</li>
		 <li><a href="<?php echo $module; ?>"><?php echo $text_module; ?></a></li>
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
		<li><a class="parent"><?php echo $text_customer; ?></a>
			<ul>
				<li><a href="<?php echo $report_customer_online; ?>"><?php echo $text_report_customer_online; ?></a></li>
				<li><a href="<?php echo $report_customer_activity; ?>"><?php echo $text_report_customer_activity; ?></a></li>
				<li><a href="<?php echo $report_customer_order; ?>"><?php echo $text_report_customer_order; ?></a></li>
<?php /*
				<li><a href="<?php echo $report_customer_reward; ?>"><?php echo $text_report_customer_reward; ?></a></li>
				<li><a href="<?php echo $report_customer_credit; ?>"><?php echo $text_report_customer_credit; ?></a></li>
*/ ?>
			</ul>
		</li>

		
		<li><a class="parent"><?php echo $text_vendor_reports; ?></a>
			<ul>
				<li><a href="<?php echo $report_vendor_products; ?>"><?php echo $text_vendor_products; ?></a></li>
				<li><a href="<?php echo $report_vendor_orders; ?>"><?php echo $text_vendor_orders; ?></a></li>         
			</ul>
		</li>	
	</ul>
</li>
  
</ul>
