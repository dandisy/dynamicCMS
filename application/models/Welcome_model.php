<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome_model extends CI_Model {
    public function __construct()
    {
        parent::__construct();
    }

    public function get_all()
    {
        $data = array('a'=>'test1', 'b'=>'test2');
        return $data;
    }
}