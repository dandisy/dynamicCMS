<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {
    private $_presentation = array();
    private $_action = NULL;


    public function __construct()
    {
        parent::__construct();

        $this->load->model('data_wc_model', 'vmodel');

        if($this->uri->segment(1) != 'home')
        {
            $this->_action = $this->uri->segment(1) ?: NULL;
        }
        else
        {
            $this->_action = $this->uri->segment(2) ?: NULL;
        }

        // In real implementation, of course, you have to query database to get this datas
        $this->_presentation = $this->vmodel->get_presentation();
    }

    /**
     * -------------------------------------------------------------------------
     * Dynamic method and dynamic view or dynamic view only
     * -------------------------------------------------------------------------
     *
     * by rbz team
     */
    public function index()
    {
        // Dynamic view only, passing from url parameter after method parameter
        if($this->_action == 'index')
        {
            if(func_num_args() > 0)
            {
                $data['data'] = array();

                if($this->uri->segment(1) != 'home')
                {
                    for($i=1; $i<func_num_args(); $i++)
                    {
                        array_push($data['data'], func_get_args()[$i]);
                    }

                    $this->twig->display(func_get_args()[0] . '.twig', $data);
                }
                else
                {
                    if($this->router->default_controller != 'home')
                    {
                        for($i=1; $i<func_num_args(); $i++)
                        {
                            array_push($data['data'], func_get_args()[$i]);
                        }

                        $this->twig->display(func_get_args()[0] . '.twig', $data);
                    }
                    else
                    {
                        for($i=2; $i<func_num_args(); $i++)
                        {
                            array_push($data['data'], func_get_args()[$i]);
                        }

                        $this->twig->display(func_get_args()[1] . '.twig', $data);
                    }
                }
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
        else if($this->_action == 'codegen')
        {
            $this->codegen();
        }
        else
        {
            $this->load->view('welcome_message');
        }
    }

    /**
     * -------------------------------------------------------------------------
     * Dynamic method and dynamic view
     * -------------------------------------------------------------------------
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

    /**
     * -------------------------------------------------------------------------
     * Dynamic code generator
     * -------------------------------------------------------------------------
     *
     * by rbz team
     */
    public function codegen()
    {
        $this->load->library('code');

        $this->code->generator();
    }
}

// end of file
