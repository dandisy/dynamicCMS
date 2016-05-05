<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Nsmodule extends MX_Controller {
	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
        $test = new modules\nsmodule\models\Nsmodule();

        $data['test'] = $test->get_data();

		$this->twig->run('nsmodule.twig', $data);
	}
}

// end of file
