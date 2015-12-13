<?php
include_once __DIR__ . '/ve_platform_api.php';
include_once __DIR__ . '/api.php';

class ModelVePlatformVePlatform extends Model {

    public $api = null;

    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->api = new ModelVePlatformAPI($this);
    }

    //Set the layouts of the module to show tag and pixel
    public function setModuleLayouts()
    {
        $positions = array(
            'column_left' => 'Checkout Success',
            'content_bottom' => 'All pages (Javascript)'
        );

        $this->load->model('design/layout');
        $this->load->model('extension/module');

        $this->db->query("DELETE FROM `" . DB_PREFIX . "module` WHERE `code` = 'veplatform'");
        $this->db->query("DELETE FROM `" . DB_PREFIX . "layout_module` WHERE `code` LIKE 'veplatform.%'");

        $layouts = $this->model_design_layout->getLayouts();
        foreach ($positions as $position => $description) {
            $name = 'VePlatform - ' . $description;
            $setting = array('status' => '1', 'name' => $name, 'position' => $position);
            $this->db->query("INSERT INTO `" . DB_PREFIX . "module` SET `name` = '" . $description . "', `code` = 'veplatform', `setting` = '" . $this->db->escape(serialize($setting)) . "'");
            $id = $this->db->getLastId();
            foreach ($layouts as $layout) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "layout_module` SET `layout_id` = '" . (int)$layout['layout_id'] . "', code = 'veplatform." . $id . "', position = '" . $position . "', sort_order = '1'");
            }
        }
    }
}
