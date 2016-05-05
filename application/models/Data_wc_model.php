<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Data_wc_model extends CI_Model {
    private $_presentation;

    public function __construct()
    {
        parent::__construct();
    }

    public function get_presentation()
    {
        // In real implementation, of course, you have to query database to get this datas
        $this->_presentation = array(
            'about' => array(
                'view' => 'about',
                'data' => array(
                    'title' => 'About Page',
                    'description' => 'this is just about page'
                )
            ),
            'service' => array(
                'view' => 'service',
                'data' => array(
                    'title' => 'Service Page',
                    'description' => 'this is just service page'
                )
            ),
            'contact' => array(
                'view' => 'contact',
                'data' => array(
                    'title' => 'Contact Us Page',
                    'description' => 'this is just contact us page'
                )
            ),
            'info' => array(
                'view' => 'info',
                'data' => array(
                    'title' => 'Info Page',
                    'description' => 'this is just info page'
                )
            )
        );

        return $this->_presentation;
    }
}

// end of file