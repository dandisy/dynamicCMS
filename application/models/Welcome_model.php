<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: toshiba
 * Date: 24/01/2016
 * Time: 15:46
 */

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