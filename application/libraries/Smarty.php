<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Smarty Class
 *
 * @package		CodeIgniter
 * @subpackage	Libraries
 * @category	Smarty
 * @author		Kepler Gelotte
 * @link		http://www.coolphptools.com/codeigniter-smarty
 */
/* require_once( BASEPATH.'libs/smarty/libs/Smarty.class.php' ); */
require_once(APPPATH . 'third_party/smarty/libs/Smarty.class.php');

class CI_Smarty extends Smarty {

	function CI_Smarty()
	{
		parent::Smarty();
		$this->compile_dir = APPPATH . "views/templates_c";
		$this->template_dir = APPPATH . "views/templates";
		$this->debugging = False;
		$this->assign('APPPATH', APPPATH);
		$this->assign('BASEPATH', BASEPATH);

		log_message('debug', "Smarty Class Initialized");
	}

	function __construct()
	{
		parent::__construct();
		require_once(APPPATH . "language/cn/cn_lang.php");
		$this->compile_dir = APPPATH . "views/templates_c";
		$this->debugging = False;
		$this->template_dir = APPPATH . "views/templates";
		$this->assign('APPPATH', APPPATH);
		$this->assign('BASEPATH', BASEPATH);
		//$this->assign('LANG', $lang);

		// Assign CodeIgniter object by reference to CI
		if ( method_exists( $this, 'assignByRef') )
		{
			$ci =& get_instance();
			$ci->load->helper('url');
			$this->assignByRef("ci", $ci);
			$this->assign('BASE_URL', base_url());
			$this->assign('RES_PREFIX', base_url(). "static/");
		}

		log_message('debug', "Smarty Class Initialized");
	}


	/**
	 *  Parse a template using the Smarty engine
	 *
	 * This is a convenience method that combines assign() and
	 * display() into one step. 
	 *
	 * Values to assign are passed in an associative array of
	 * name => value pairs.
	 *
	 * If the output is to be returned as a string to the caller
	 * instead of being output, pass true as the third parameter.
	 *
	 * @access	public
	 * @param	string
	 * @param	array
	 * @param	bool
	 * @return	string
	 */
	function view($template, $data = array(), $return = FALSE)
	{
		foreach ($data as $key => $val)
		{
			$this->assign($key, $val);
		}
		
		if ($return == FALSE)
		{
			$CI =& get_instance();
			if (method_exists( $CI->output, 'set_output' ))
			{
				$CI->output->set_output( $this->fetch($template) );
			}
			else
			{
				$CI->output->final_output = $this->fetch($template);
			}
			return;
		}
		else
		{
			return $this->fetch($template);
		}
	}
}
// END Smarty Class
