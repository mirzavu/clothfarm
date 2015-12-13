<?php
class ModelShippingVendor extends Model {
	function getQuote($address) {
		$this->load->language('shipping/vendor');
		
		$method_data = array();

		$rate = 0.00;

		foreach ($this->cart->getProducts() as $product) { 
			$query = $this->db->query("SELECT vsr.rate, vsr.geo_zone_id FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "vendor_shipping_rate vsr on p.vendor_shipping_rate_id = vsr.vendor_shipping_rate_id WHERE product_id = '". $product['product_id'] ."'");

			$zones = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . $query->row['geo_zone_id'] . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

			if (!$query->row['geo_zone_id']) {
				$status = true;
			} elseif ($zones->num_rows) {
				$status = true;
			} else {
				$status = false;
			}
			if( $query->row['rate'] && $status ){
				$rate += $query->row['rate'];
			}
		}

		$quote_data = array();

		$quote_data['vendor'] = array(
			'code'         => 'vendor.vendor',
			'title'        => $this->language->get('text_description'),
			'cost'         => $rate,
			'tax_class_id' => 0,
			'text'         => $this->currency->format($this->tax->calculate($rate, 0, $this->config->get('config_tax')))
		);

		$method_data = array(
			'code'       => 'vendor',
			'title'      => $this->language->get('text_title'),
			'quote'      => $quote_data,
			'sort_order' => $this->config->get('vendor_sort_order'),
			'error'      => false
		);
		

		return $method_data;
	}
}