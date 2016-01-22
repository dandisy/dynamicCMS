<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Doctrine_generate_entities extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->library('doctrine');
        $this->load->library('twig');
    }

    public function index()
    {
        $this->twig->display('doctrine_generate_entities');
    }
}