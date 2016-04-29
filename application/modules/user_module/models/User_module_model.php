<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Created by PhpStorm.
 * User: toshiba
 * Date: 24/01/2016
 * Time: 15:46
 */

require_once(APPPATH."models/Entities/EntityUser.php");

class User_module_model extends CI_Model {
    protected $em;

    public function __construct()
    {
        parent::__construct();
        $this->em = $this->doctrine->em;
    }

    /*public function get_all()
    {
        $data = array('a'=>'test1', 'b'=>'test2');
        return $data;
    }*/

    function get_single($id)
    {
        try
        {
            $usr = $this->em->find("EntityUser",$id);
            return $usr;
        }
        catch(Exception $err)
        {
            return NULL;
        }
    }

    function get_all()
    {
        try
        {
            $usr = $this->em->getRepository("EntityUser")->findAll();
            return $usr;
        }
        catch(Exception $err)
        {
            return NULL;
        }
    }

    function add_user($name, $email, $address)
    {
        $us = new EntityUser();
        $us->setName($name);
        $us->setEmail($email);
        $us->setAddress($address);

        try {
            //save to database
            $this->em->persist($us);
            $this->em->flush();
        }
        catch(Exception $err){

            die($err->getMessage());
        }
        return true;
    }
}

/* End of file user_model.php */
/* Location: ./application/modules/user/models/User_model.php */