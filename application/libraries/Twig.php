<?php defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *	Class Twig Environment
 */
class Twig
{
	private $CI;
	private $_twig;
	private $_template_dir;
	private $_cache_dir;

	public function __construct($debug = false)
	{
		$this->CI =& get_instance();

		self::requireTwigAutoloader();

		Twig_Autoloader::register();

		$this->CI->config->load('webcore');

		$this->_template_dir = $this->CI->config->item('template_dir');
		$this->_cache_dir = $this->CI->config->item('cache_dir');

		$loader = new Twig_Loader_Filesystem($this->_template_dir);

		$this->_twig = new Twig_Environment($loader, array(
			'cache' => $this->_cache_dir,
			'debug' => true,
		));

		$this->_twig->addExtension(new Twig_Extension_Debug());

		// enable all php function on twig
		foreach(get_defined_functions() as $functions) {
			foreach($functions as $func) {
				$this->_twig->addFunction($func, new Twig_Function_Function($func));
			}
		}

		// add session on twig template
		$this->_twig->addGlobal("session", $this->CI->session);
	}

	public function add_function($name)
	{
		$this->_twig->addFunction($name, new Twig_Function_Function($name));
	}

	public function render($template, $data = array())
	{
		$template = $this->_twig->loadTemplate($template);
		return $template->render($data);
	}

	/**
	 * Render application views
	 *
	 * @author	rbz
	 *
	 * @param	string $template
	 * @param	array[] $data
	 * @return	string
	 */
	public function display($template, $data = array())
	{
		$template = 'views/' . $template;

		$template = $this->_twig->loadTemplate($template);

		/* elapsed_time and memory_usage */
		$data['elapsed_time'] = $this->CI->benchmark->elapsed_time(
			'total_execution_time_start',
			'total_execution_time_end'
		);

		$data['memory_usage'] = 0;
		if (function_exists('memory_get_usage')) {
			$memory = memory_get_usage() / 1024 / 1024;
			$data['memory_usage'] = round($memory, 2) . 'MB';
		}

		$template->display($data);
	}

	/**
	 * Render modules views
	 *
	 * @author	rbz
	 *
	 * @param	string $template
	 * @param	array[] $data
	 * @return	string
	 */
	public function run($template,$data = array()){
		$template = 'modules/' . $this->CI->router->fetch_module() . '/views/' . $template;

		$template = $this->_twig->loadTemplate($template);

		/* elapsed_time and memory_usage */
		$data['elapsed_time'] = $this->CI->benchmark->elapsed_time(
			'total_execution_time_start',
			'total_execution_time_end'
		);

		$data['memory_usage'] = 0;
		if (function_exists('memory_get_usage')) {
			$memory = memory_get_usage() / 1024 / 1024;
			$data['memory_usage'] = round($memory, 2) . 'MB';
		}

		$template->display($data);
	}

	private static function requireTwigAutoloader()
	{
		$twig_dir = PATH_SEPARATOR . APPPATH . 'libraries/Twig';
		ini_set('include_path', ini_get('include_path') . $twig_dir);

		//require_once (string) "../vendor/autoload" . EXT;

		log_message('debug', "Twig Autoloader Loaded");
	}
}

// end of file
