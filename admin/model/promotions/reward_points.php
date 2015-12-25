<?php
/**
 * Created by ANH To.
 * Date: 10/2/14
 * Time: 11:37
 */

class ModelPromotionsRewardPoints extends Model
{
    CONST ENABLED = 1;
    CONST DISABLED = 0;

	protected $type_rewarded = array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12);
	protected $type_redeemed = array(11);
	public function addShoppingCartRules($data)
	{
		$data['conditions_serialized'] = base64_encode(serialize($data['rule']));
		$data['customer_group_ids'] = serialize($data['customer_group_ids']);
		$sql = "INSERT INTO ".DB_PREFIX."shopping_cart_rules SET ".
			"`rule_id` = null, ".
			"`name` = '".$data['name']."',".
			"`description` = '".$this->db->escape($data['description'])."',".
			"`conditions_serialized` = '".$data['conditions_serialized']."',".
			"`store_view` = '".(isset($data['store_view']) ? $data['store_view'] : 0)."',".
			"`customer_group_ids` = '".$data['customer_group_ids']."',".
			"`start_date` = '".$data['start_date']."',".
			"`end_date` = '".$data['end_date']."',".
			"`actions` = '".$data['actions']."',".
			"`reward_per_spent` = '".$data['reward_per_spent']."',".
			"`reward_point` = '".$data['reward_point']."',".
			"`rule_position` = '".(isset($data['rule_position']) ? $data['rule_position'] : 0)."',".
			"`stop_rules_processing` = '".(isset($data['stop_rules_processing']) ? $data['stop_rules_processing'] : 1)."',".
			"`status` = '".$data['status']."'";

		$this->db->query($sql);
	}

	public function updateShoppingCartRules($data)
	{
		$data['conditions_serialized'] = base64_encode(serialize($data['rule']));
		$data['customer_group_ids'] = serialize($data['customer_group_ids']);
		$sql = "UPDATE ".DB_PREFIX."shopping_cart_rules SET ".
			"`name` = '".$data['name']."',".
			"`description` = '".$this->db->escape($data['description'])."',".
			"`conditions_serialized` = '".$data['conditions_serialized']."',".
			"`store_view` = '".(isset($data['store_view']) ? $data['store_view'] : 0)."',".
			"`customer_group_ids` = '".$data['customer_group_ids']."',".
			"`start_date` = '".$data['start_date']."',".
			"`end_date` = '".$data['end_date']."',".
			"`actions` = '".$data['actions']."',".
			"`reward_per_spent` = '".$data['reward_per_spent']."',".
			"`reward_point` = '".$data['reward_point']."',".
			"`rule_position` = '".(isset($data['rule_position']) ? $data['rule_position'] : 0)."',".
			"`stop_rules_processing` = '".(isset($data['stop_rules_processing']) ? $data['stop_rules_processing'] : 1)."',".
			"`status` = '".$data['status']."' ".
			"WHERE rule_id = '".$data['rule_id']."'";

		$this->db->query($sql);
	}

    public function addCatalogRules($data)
    {
        $data['conditions_serialized'] = base64_encode(serialize($data['rule']));
        $data['customer_group_ids'] = serialize($data['customer_group_ids']);
        $sql = "INSERT INTO ".DB_PREFIX."catalog_rules SET ".
                    "`rule_id` = null, ".
                    "`name` = '".$data['name']."',".
                    "`description` = '".$this->db->escape($data['description'])."',".
                    "`conditions_serialized` = '".$data['conditions_serialized']."',".
                    "`store_view` = '".(isset($data['store_view']) ? $data['store_view'] : 0)."',".
                    "`customer_group_ids` = '".$data['customer_group_ids']."',".
                    "`start_date` = '".$data['start_date']."',".
                    "`end_date` = '".$data['end_date']."',".
                    "`actions` = '".$data['actions']."',".
                    "`reward_per_spent` = '".$data['reward_per_spent']."',".
                    "`reward_point` = '".$data['reward_point']."',".
                    "`rule_position` = '".(isset($data['rule_position']) ? $data['rule_position'] : 0)."',".
                    "`stop_rules_processing` = '".(isset($data['stop_rules_processing']) ? $data['stop_rules_processing'] : 0)."',".
                    "`status` = '".$data['status']."'";

        $this->db->query($sql);
	    $rule_id = $this->db->getLastId();
	    if(!empty($data['apply_rule']))
	    {
		    $this->load->model('catalog/rule');

		    $this->model_catalog_rule->applyRule($data['rule']['conditions'], $rule_id);
	    }
    }

    public function updateCatalogRules($data)
    {
        $data['conditions_serialized'] = base64_encode(serialize($data['rule']));
        $data['customer_group_ids'] = serialize($data['customer_group_ids']);
        $sql = "UPDATE ".DB_PREFIX."catalog_rules SET ".
            "`name` = '".$data['name']."',".
            "`description` = '".$this->db->escape($data['description'])."',".
            "`conditions_serialized` = '".$data['conditions_serialized']."',".
            "`store_view` = '".(isset($data['store_view']) ? $data['store_view'] : 0)."',".
            "`customer_group_ids` = '".$data['customer_group_ids']."',".
            "`start_date` = '".$data['start_date']."',".
            "`end_date` = '".$data['end_date']."',".
            "`actions` = '".$data['actions']."',".
            "`reward_per_spent` = '".$data['reward_per_spent']."',".
            "`reward_point` = '".$data['reward_point']."',".
            "`rule_position` = '".(isset($data['rule_position']) ? $data['rule_position'] : 0)."',".
            "`stop_rules_processing` = '".(isset($data['stop_rules_processing']) ? $data['stop_rules_processing'] : 0)."',".
            "`status` = '".$data['status']."' ".
            "WHERE rule_id = '".$data['rule_id']."'";
        $this->db->query($sql);

        if(!empty($data['apply_rule']))
        {
            $this->load->model('catalog/rule');

            $this->model_catalog_rule->applyRule($data['rule']['conditions'], $data['rule_id']);
        }
    }

    public function addSpendingRules($data)
    {
        $data['conditions_serialized'] = base64_encode(serialize($data['rule']));
        $data['customer_group_ids'] = serialize($data['customer_group_ids']);
        $sql = "INSERT INTO ".DB_PREFIX."spending_rules SET ".
            "`rule_id` = null, ".
            "`name` = '".$data['name']."',".
            "`description` = '".$this->db->escape($data['description'])."',".
            "`conditions_serialized` = '".$data['conditions_serialized']."',".
            "`store_view` = '".(isset($data['store_view']) ? $data['store_view'] : 0)."',".
            "`customer_group_ids` = '".$data['customer_group_ids']."',".
            "`start_date` = '".$data['start_date']."',".
            "`end_date` = '".$data['end_date']."',".
            "`actions` = '".$data['actions']."',".
            "`reward_per_spent` = '".$data['reward_per_spent']."',".
            "`reward_point` = '".$data['reward_point']."',".
            "`rule_position` = '".(isset($data['rule_position']) ? $data['rule_position'] : 0)."',".
            "`stop_rules_processing` = '".(isset($data['stop_rules_processing']) ? $data['stop_rules_processing'] : 0)."',".
            "`status` = '".$data['status']."'";

        $this->db->query($sql);
    }

	public function addBehaviorRules($data)
	{
		$data['customer_group_ids'] = serialize($data['customer_group_ids']);
		$sql = "INSERT INTO ".DB_PREFIX."behavior_rules SET ".
			"`rule_id` = null, ".
			"`name` = '".$data['name']."',".
			"`store_view` = '".(isset($data['store_view']) ? $data['store_view'] : 0)."',".
			"`customer_group_ids` = '".$data['customer_group_ids']."',".
			"`actions` = '".$data['actions']."',".
			"`reward_point` = '".$data['reward_point']."',".
			"`consecutive_in_day` = '".$data['consecutive_in_day']."',".
			"`is_cycle` = '".$data['is_cycle']."',".
			"`status` = '".$data['status']."'";

		$this->db->query($sql);
		/** DISPATCH_EVENT:MODEL_AFTER_ADD_DATA_BEHAVIOR_RULE */
	}

	public function updateBehaviorRules($data)
	{
		$data['customer_group_ids'] = serialize($data['customer_group_ids']);
		$sql = "UPDATE ".DB_PREFIX."behavior_rules SET ".
			"`name` = '".$data['name']."',".
			"`store_view` = '".(isset($data['store_view']) ? $data['store_view'] : 0)."',".
			"`customer_group_ids` = '".$data['customer_group_ids']."',".
			"`actions` = '".$data['actions']."',".
			"`reward_point` = '".$data['reward_point']."',".
			"`consecutive_in_day` = '".$data['consecutive_in_day']."',".
			"`is_cycle` = '".$data['is_cycle']."',".
			"`status` = '".$data['status']."' ".
			"WHERE rule_id = '".$data['rule_id']."'";
		$this->db->query($sql);
		/** DISPATCH_EVENT:MODEL_AFTER_UPDATE_DATA_BEHAVIOR_RULE */
	}

    public function updateSpendingRules($data)
    {
        $data['conditions_serialized'] = base64_encode(serialize($data['rule']));
        $data['customer_group_ids'] = serialize($data['customer_group_ids']);
        $sql = "UPDATE ".DB_PREFIX."spending_rules SET ".
            "`name` = '".$data['name']."',".
            "`description` = '".$this->db->escape($data['description'])."',".
            "`conditions_serialized` = '".$data['conditions_serialized']."',".
            "`store_view` = '".(isset($data['store_view']) ? $data['store_view'] : 0)."',".
            "`customer_group_ids` = '".$data['customer_group_ids']."',".
            "`start_date` = '".$data['start_date']."',".
            "`end_date` = '".$data['end_date']."',".
            "`actions` = '".$data['actions']."',".
            "`reward_per_spent` = '".$data['reward_per_spent']."',".
            "`reward_point` = '".$data['reward_point']."',".
            "`rule_position` = '".(isset($data['rule_position']) ? $data['rule_position'] : 0)."',".
            "`stop_rules_processing` = '".(isset($data['stop_rules_processing']) ? $data['stop_rules_processing'] : 0)."',".
            "`status` = '".$data['status']."' ".
            "WHERE rule_id = '".$data['rule_id']."'";
        $this->db->query($sql);
    }

    public function getCatalogRule($rule_id)
    {
        $table_catalog_rules = DB_PREFIX."catalog_rules";

        $sql = "SELECT * FROM $table_catalog_rules WHERE rule_id = $rule_id";
        $query = $this->db->query($sql);
        return $query->row;
    }

	public function getBehaviorRule($rule_id)
	{
		$table_behavior_rules = DB_PREFIX."behavior_rules";

		$sql = "SELECT * FROM $table_behavior_rules WHERE rule_id = $rule_id";
		$query = $this->db->query($sql);
		return $query->row;
	}

    public function getSpendingRule($rule_id)
    {
        $table_catalog_rules = DB_PREFIX."spending_rules";

        $sql = "SELECT * FROM $table_catalog_rules WHERE rule_id = $rule_id";
        $query = $this->db->query($sql);
        return $query->row;
    }

	public function getShoppingCartRule($rule_id)
	{
		$table_shopping_cart_rules = DB_PREFIX."shopping_cart_rules";

		$sql = "SELECT * FROM $table_shopping_cart_rules WHERE rule_id = $rule_id";
		$query = $this->db->query($sql);
		return $query->row;
	}

    public function getCatalogRules($data = array())
    {
        $table_catalog_rules = DB_PREFIX."catalog_rules";

        $sql = "SELECT * FROM $table_catalog_rules ";

        $sort_data = array(
            'rule_id',
            'rule_name',
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY rule_id";
        }

        if (isset($data['order']) && ($data['order'] == 'DESC')) {
            $sql .= " DESC";
        } else {
            $sql .= " ASC";
        }

        if (isset($data['start']) || isset($data['limit'])) {
            if ($data['start'] < 0) {
                $data['start'] = 0;
            }

            if ($data['limit'] < 1) {
                $data['limit'] = 20;
            }

            $sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
        }
        $query = $this->db->query($sql);
        return $query->rows;
    }

	public function getSpendingRules($data = array())
	{
		$table_spending_rules = DB_PREFIX."spending_rules";

		$sql = "SELECT * FROM $table_spending_rules ";

		$sort_data = array(
			'rule_id',
			'rule_name',
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY rule_id";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getBehaviorRules($data = array())
	{
		$table_behavior_rules = DB_PREFIX."behavior_rules";

		$sql = "SELECT * FROM $table_behavior_rules ";

		$sort_data = array(
			'rule_id',
			'rule_name',
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY rule_id";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getShoppingCartRules($data = array())
	{
		$table_shopping_cart_rules = DB_PREFIX."shopping_cart_rules";

		$sql = "SELECT * FROM $table_shopping_cart_rules ";

		$sort_data = array(
			'rule_id',
			'rule_name',
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY rule_id";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}
		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getTransactions($data = array())
	{
		$table_customer = DB_PREFIX."customer";
		$table_customer_reward = DB_PREFIX."customer_reward";

		$sql = "SELECT cr.* FROM $table_customer_reward as cr
			    LEFT JOIN $table_customer as c ON cr.customer_id = c.customer_id";

		$sort_data = array(
			'customer_reward_id'
		);

		if(isset($data['start_date']) && empty($data['start_date']))
		{
			unset($data['start_date']);
		}

		if(isset($data['end_date']) && empty($data['end_date']))
		{
			unset($data['end_date']);
		}

		$sql .= " WHERE 1 ";
		if(isset($data['start_date']) && isset($data['end_date']))
		{
			$data['start_date'] = date('Y-m-d', strtotime("-1 day", strtotime($data['start_date'])));
			$data['end_date']   = date('Y-m-d', strtotime("+1 day", strtotime($data['end_date'])));

			if(strtotime($data['start_date']) < strtotime($data['end_date']))
			{
				$sql .= " AND cr.date_added >= '".$data['start_date']."' AND cr.date_added <= '".$data['end_date']."'";
			}
		}

		if(isset($data['start_date']) && !isset($data['end_date']))
		{
			$data['start_date'] = date('Y-m-d', strtotime("-1 day", strtotime($data['start_date'])));
			$sql .= " AND cr.date_added >= '".$data['start_date']."'";
		}
		if(!isset($data['start_date']) && isset($data['end_date']))
		{
			$data['end_date']   = date('Y-m-d', strtotime("+1 day", strtotime($data['end_date'])));
			$sql .= "AND cr.date_added <= '".$data['end_date']."'";
		}

		if(isset($data['filter_email']) && !empty($data['filter_email']))
		{
			$sql .= " AND c.email = '".$this->db->escape($data['filter_email'])."'";
		}

		if(isset($data['filter_status']) && $data['filter_status'] != '')
		{
			$sql .= " AND cr.status = '".$this->db->escape($data['filter_status'])."'";
		}

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY cr.customer_reward_id";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " DESC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);
		return $query->rows;
	}

	public function getAllTotalRewards($data){
		$table_customer_reward = DB_PREFIX."customer_reward";
		$total_rewarded = "SUM(IF(transaction_type IN (".implode(",", $this->type_rewarded)."), points, 0)) as total_rewarded";
		$total_redeemed = "SUM(IF(transaction_type IN (".implode(",", $this->type_redeemed)."), IF(points < 0, points * -1, points), 0)) as total_redeemed";
		$total_order    = "COUNT(DISTINCT IF(order_id != 0, order_id, null)) as total_order";

		$sql = "SELECT $total_redeemed, $total_rewarded, $total_order FROM $table_customer_reward";
		if(isset($data['start_date']) && empty($data['end_date']))
		{
			unset($data['start_date']);
		}

		if(isset($data['end_date']) && empty($data['end_date']))
		{
			unset($data['end_date']);
		}

		if(isset($data['start_date']) && isset($data['end_date']))
		{
			$data['start_date'] = date('Y-m-d', strtotime("-1 day", strtotime($data['start_date'])));
			$data['end_date']   = date('Y-m-d', strtotime("+1 day", strtotime($data['end_date'])));

			if(strtotime($data['start_date']) < strtotime($data['end_date']))
			{
				$sql .= " WHERE";
				$sql .= " date_added >= '".$data['start_date']."' AND date_added <= '".$data['end_date']."'";
			}
		}

		if(isset($data['start_date']) && !isset($data['end_date']))
		{
			$data['start_date'] = date('Y-m-d', strtotime("-1 day", strtotime($data['start_date'])));
			$sql .= " WHERE";
			$sql .= " date_added >= '".$data['start_date']."'";
		}
		if(!isset($data['start_date']) && isset($data['end_date']))
		{
			$data['end_date']   = date('Y-m-d', strtotime("+1 day", strtotime($data['end_date'])));
			$sql .= " WHERE";
			$sql .= "date_added <= '".$data['end_date']."'";
		}

		$sql .= " ORDER BY date_added DESC";

		$query = $this->db->query($sql);

		return $query->row;
	}

    public function getTotalCatalogRules(){
        $table_catalog_rules = DB_PREFIX."catalog_rules";

        $sql = "SELECT COUNT(*) AS total FROM $table_catalog_rules ";
        $query = $this->db->query($sql);

        return $query->row['total'];
    }

	public function getTotalSpendingRules(){
		$table_spending_rules = DB_PREFIX."spending_rules";

		$sql = "SELECT COUNT(*) AS total FROM $table_spending_rules ";
		$query = $this->db->query($sql);

		return $query->row['total'];
	}
	public function getTotalBehaviorRules(){
		$table_behavior_rules = DB_PREFIX."behavior_rules";

		$sql = "SELECT COUNT(*) AS total FROM $table_behavior_rules ";
		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function getTotalShoppingCartRules(){
		$table_shopping_cart_rules = DB_PREFIX."shopping_cart_rules";

		$sql = "SELECT COUNT(*) AS total FROM $table_shopping_cart_rules ";
		$query = $this->db->query($sql);

		return $query->row['total'];
	}
	public function getTotalTransactions($data){
		$table_customer = DB_PREFIX."customer";
		$table_customer_reward = DB_PREFIX."customer_reward";

		$sql = "SELECT COUNT(*) AS total FROM $table_customer_reward as cr
			    LEFT JOIN $table_customer as c ON cr.customer_id = c.customer_id";

		if(isset($data['start_date']) && empty($data['end_date']))
		{
			unset($data['start_date']);
		}

		if(isset($data['end_date']) && empty($data['end_date']))
		{
			unset($data['end_date']);
		}
		$sql .= " WHERE 1 ";
		if(isset($data['start_date']) && isset($data['end_date']))
		{
			$data['start_date'] = date('Y-m-d', strtotime("-1 day", strtotime($data['start_date'])));
			$data['end_date']   = date('Y-m-d', strtotime("+1 day", strtotime($data['end_date'])));

			if(strtotime($data['start_date']) < strtotime($data['end_date']))
			{
				$sql .= " AND cr.date_added >= '".$data['start_date']."' AND cr.date_added <= '".$data['end_date']."'";
			}
		}

		if(isset($data['start_date']) && !isset($data['end_date']))
		{
			$data['start_date'] = date('Y-m-d', strtotime("-1 day", strtotime($data['start_date'])));
			$sql .= " AND cr.date_added >= '".$data['start_date']."'";
		}
		if(!isset($data['start_date']) && isset($data['end_date']))
		{
			$data['end_date']   = date('Y-m-d', strtotime("+1 day", strtotime($data['end_date'])));
			$sql .= "AND cr.date_added <= '".$data['end_date']."'";
		}

		if(isset($data['filter_email']) && !empty($data['filter_email']))
		{
			$sql .= " AND c.email = '".$this->db->escape($data['filter_email'])."'";
		}

		if(isset($data['filter_status']) && $data['filter_status'] != '')
		{
			$sql .= " AND cr.status = '".$this->db->escape($data['filter_status'])."'";
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}

	public function deleteCatalogRule($rule_id)
	{
		$this->db->query("DELETE FROM ".DB_PREFIX."catalog_rules WHERE rule_id = $rule_id");
	}

	public function deleteShoppingCartRule($rule_id)
	{
		$this->db->query("DELETE FROM ".DB_PREFIX."shopping_cart_rules WHERE rule_id = $rule_id");
	}

	public function deleteSpendingRule($rule_id)
	{
		$this->db->query("DELETE FROM ".DB_PREFIX."spending_rules WHERE rule_id = $rule_id");
	}

	public function deleteBehaviorRule($rule_id)
	{
		$this->db->query("DELETE FROM ".DB_PREFIX."behavior_rules WHERE rule_id = $rule_id");
	}
}