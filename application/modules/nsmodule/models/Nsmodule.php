<?php

namespace modules\nsmodule\models;

if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Created by PhpStorm.
 * User: toshiba
 * Date: 24/01/2016
 * Time: 15:46
 */

class Nsmodule extends CI_Model {

    public function __construct()
    {
        parent::__construct();
    }

    function get_data()
    {
        $data = array('name'=>'sri ikhwati', 'email'=>'sri.ikhwati@gmail.com');

        return $data;
    }
}

// end of file