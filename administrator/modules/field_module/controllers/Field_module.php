<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Field_module extends MX_Controller {
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $this->load->model('field_module_model', 'field');

        $data = $this->field->get_all()->result();

        console_log($data);
    }
}