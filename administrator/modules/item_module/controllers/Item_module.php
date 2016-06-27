<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Item_module extends MX_Controller {
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $this->load->model('item_module_model', 'item');

        $data = $this->item->get_all()->result();

        console_log($data);
    }
}