<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Item_module_model extends CI_Model {
    public function __construct()
    {
        parent::__construct();
    }

    public function get_all()
    {
        $query = $this->db->select('id, title as name, icon, parent_id')
            //->where('domain', NULL)
            ->get('item');
        
        return $query;
    }
}