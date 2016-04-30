<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
    private $_presentation = array();
    private $_action = NULL;


    public function __construct()
    {
        parent::__construct();

        if($this->uri->segment(1) != 'home')
        {
            $this->_action = $this->uri->segment(1) ?: NULL;
        }
        else
        {
            $this->_action = $this->uri->segment(2) ?: NULL;
        }

        // In real world you query database to fill this properties
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
            )
        );
    }

    /**
     * -----------------------------------------------------
     * Dynamic method and dynamic view or dynamic view only
     * -----------------------------------------------------
     *
     * by rbz team
     */
    public function index()
    {
        // Dynamic view only from url parameter after method
        if($this->_action == 'index')
        {
            if(func_num_args() > 0)
            {
                $data['data'] = array();

                for($i=1; $i<func_num_args(); $i++)
                {
                    array_push($data['data'], func_get_args()[$i]);
                }

                $this->twig->display(func_get_args()[0] . '.twig', $data);
            }
            else
            {
                $this->load->view('welcome_message');
            }
        }
        // Dynamic method and dynamic view
        else if($this->_action != NULL)
        {
            $action = $this->_action;
            $this->$action(func_get_args());
        }
        else
        {
            $this->load->view('welcome_message');
        }
    }

    /**
     * -----------------------------------------------------
     * Dynamic method and dynamic view
     * -----------------------------------------------------
     *
     * by rbz team
     */
    public function __call($routing, $args)
    {
        if(array_key_exists($routing, $this->_presentation))
        {
            $view = $this->_presentation[$routing]['view'];
            $data['view'] = $this->_presentation[$routing]['data'];

            $data['url_parameters'] = $args[0];

            $this->twig->display($view . '.twig', $data);
        }
        else
        {
            show_404();
        }
    }
}

// end of file
