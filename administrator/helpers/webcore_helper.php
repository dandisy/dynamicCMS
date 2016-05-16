<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

// for module return string
if(!function_exists('module_run'))
{
    function module_run($module, $param = array())
    {
        echo modules::run($module, $param);
    }
}

// for module return array
if(!function_exists('module_array'))
{
    function module_array($module)
    {
        return modules::run($module);
    }
}

/*
 *---------------------------------------------------------------
 * RUN MODEL IN VIEW
 *---------------------------------------------------------------
 *
 * Using unlimited number of arguments
 *      example :
 * {% set query = query_run('model_name', 'method_name', 'param', 'param', param, NULL, param, param, param) %}
 * <p>{{ print_r(query) }}</p>
 *
 * Using array as single argument on the third
 * You must extract the array parameter in your model
 *      example :
 * $query = isset($param['query']) ? $param['query'] : NULL;
 * $category = isset($param['category']) ? $param['category'] : (isset($param[0]) ? $param[0] : NULL);
 * $province = isset($param['province']) ? $param['province'] : (isset($param[1]) ? $param[1] : NULL);
 * $limit = isset($param['limit']) ? $param['limit'] : (isset($param[2]) ? $param[2] : 3);
 * $offset = isset($param['offset']) ? $param['offset'] : (isset($param[3]) ? $param[3] : 0);
 *
 */
if(!function_exists('query_run'))
{
    function query_run($model, $method)
    {
        $num_args = func_num_args();
        $arg_list = func_get_args();

        $param = '';

        if($num_args > 2)
        {
            for ($i = 2; $i < $num_args; $i++)
            {
                if($i == 2)
                {
                    $param .= $arg_list[$i];
                }
                else
                {
                    $param .= ', '.$arg_list[$i];
                }
            }
        }
        else
        {
            $param = NULL;
        }

        $CI =& get_instance();
        $CI->load->model($model);
        $query = $CI->$model->$method($param);

        return $query;
    }
}

if(!function_exists('console_log'))
{
    function console_log($data) {
        $output  = "<script>console.log( 'START-PHP-DEBUGGER: ";
        $output .= json_encode(print_r($data, true));
        $output .= "END-PHP-DEBUGGER');</script>";
        echo $output;
    }
}

if(!function_exists('session_data'))
{
    function session_data($key = NULL)
    {
        $CI =& get_instance();
        $data = $CI->session->userdata($key);

        return $data;
    }
}

if(!function_exists('asset_path'))
{
    function asset_path($sub = '')
    {
        $CI =& get_instance();
        $path = $CI->config->item('wc_asset_path') . ($sub != "" ? "/" : "") . $sub . "/";

        return $path;
    }
}

if(!function_exists('image_path'))
{
    function image_path($sub = '')
    {
        $CI =& get_instance();
        $path = $CI->config->item('wc_image_path') . ($sub != "" ? "/" : "") . $sub . "/";

        return $path;
    }
}

// end file
