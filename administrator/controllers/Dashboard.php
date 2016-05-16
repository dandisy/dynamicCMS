<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard extends CI_Controller {
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data['title'] = 'Dashboard - Webcore - Dynamic Web Content Management Platform';
        $data['page'] = 'Dashboard';

        $this->twig->display('dashboard.twig', $data);
    }
}