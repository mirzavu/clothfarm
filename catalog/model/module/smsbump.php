<?php
class ModelModuleSmsbump extends Model {
  
  	public function getSetting($group, $store_id) {
    	$data = array(); 
    	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "setting WHERE store_id = '" . (int)$store_id . "' AND `group` = '" . $this->db->escape($group) . "'");
    	foreach ($query->rows as $result) {
      		if (!$result['serialized']) {
        		$data[$result['key']] = $result['value'];
      		} else {
        		$data[$result['key']] = unserialize($result['value']);
      		}
    	} 
    	return $data;
  	}
	

	public static function SmsBumpCallback($response) {
		global $log;
		
		if ($response['status'] == 'Queued') {
			
		} else if ($response['status'] == 'error') {
			$log->write('SMSBump: '.$response['message']);
		}
	}
	
	public function formatNumber($number) {
		$this->load->model('setting/setting');
		$SMSBump = $this->model_setting_setting->getSetting('SMSBump', $this->config->get('config_store_id'));
		if( isset($SMSBump) && ($SMSBump['SMSBump']['Enabled'] == 'yes') && isset($SMSBump['SMSBump']['NumberPrefix']) && !empty($SMSBump['SMSBump']['NumberPrefix']) && ($SMSBump['SMSBump']['PhoneNumberPrefix']=='yes')) {
			$numberCheck = ltrim($number, '+');
			$prefixCheck = ltrim($SMSBump['SMSBump']['NumberPrefix'], '+');
			$newNumber = '';
			if (isset($SMSBump['SMSBump']['PhoneRemoveZeros']) && $SMSBump['SMSBump']['PhoneRemoveZeros']=='yes') {
				$numberCheck = ltrim($numberCheck, '0');
			}
			$newNumber = $numberCheck;
			if (strpos($numberCheck, $prefixCheck) !== 0) {
				$newNumber = $SMSBump['SMSBump']['NumberPrefix'].$numberCheck;
			}
			return $newNumber;	
		} else {
			return $number;	
		}
	}
	
	public function sendCheck($phone) {
		$this->load->model('setting/setting');
		$SMSBump = $this->model_setting_setting->getSetting('SMSBump', $this->config->get('config_store_id'));
		
		if(isset($SMSBump) && isset($SMSBump['SMSBump']['StrictPrefix']) && ($SMSBump['SMSBump']['StrictPrefix']=='yes'))
		{
			$numberCheck = ltrim($this->formatNumber($phone), '+');
			$prefixCheck = ltrim($SMSBump['SMSBump']['StrictNumberPrefix'], '+');
			
			if (0 === strpos($numberCheck, $prefixCheck)) {
			   return true;
			} else {
			   return false;
			}
		}
		return true;
	}
}
?>