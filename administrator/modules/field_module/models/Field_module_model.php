<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Field_module_model extends CI_Model {
    public function __construct()
    {
        parent::__construct();
    }

    public function get_all()
    {
        $query = $this->db->select('*')
            ->get('field');
        
        return $query;
    }
}