<?php
class ModelReportBestSeller extends Model {
	public function getBestSellers() {

		$query = $this->db->query("SELECT st.name AS store, SUM(op.total + op.tax) AS total, SUM(op.quantity) AS sold FROM ". DB_PREFIX ."order_product op LEFT JOIN ". DB_PREFIX ."store st on op.merchant_id = st.store_id WHERE op.merchant_id > 0 GROUP BY op.merchant_id ORDER BY total DESC LIMIT 5");

		return $query->rows;
	}
}
