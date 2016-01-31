<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Created by PhpStorm.
 * User: toshiba
 * Date: 24/01/2016
 * Time: 15:46
 */

class User extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->library('doctrine');
        $this->load->model('user_model');
    }

    public function index()
    {
        $data['user'] = $this->user_model->get_all();
        echo "test ok";

        $this->load->view('user', $data);
    }

    public function add()
    {
        $this->user_model->add_user('Eka', 'sri.ikhwati@gmail.com', 'Jepara');
    }

    public function get()
    {
        $data['user'] = $this->user_model->get_single(1);
    }
}

/* End of file User.php */
/* Location: ./application/modules/user/controllers/User.php */