<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Test extends MX_Controller {
	public function __construct()
	{
		parent::__construct();
	}

	public function index()
	{
        $test = new modules\test\models\Test();

        $data['test'] = $test->get_data();

		$this->twig->run('test.twig', $data);
	}
}

// end of file
