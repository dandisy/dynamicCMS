<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Memio
{

    public function __construct()
    {
        ini_set('include_path', ini_get('include_path') . PATH_SEPARATOR . APPPATH . 'libraries');
    }

    public function load($sClassName)
    {
        require_once (string) $sClassName . EXT;

        log_message('debug', "-> Zend Class $sClassName Loaded from the library");
    }

}