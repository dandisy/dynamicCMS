<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Created by PhpStorm.
 * User: toshiba
 * Date: 24/01/2016
 * Time: 15:46
 */

class User_module extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->library('doctrine');
        $this->load->model('user_module_model', 'umm');
    }

    public function index()
    {
        $data['user'] = $this->umm->get_all();
        echo "test ok";

        $this->load->view('user', $data);
    }

    public function add()
    {
        $this->umm->add_user('Eka', 'sri.ikhwati@gmail.com', 'Jepara');
    }

    public function get()
    {
        $data['user'] = $this->umm->get_single(1);
    }
}

/* End of file User_module.php */
/* Location: ./application/modules/user_module/controllers/User_module.php */