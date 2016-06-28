<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Item_module extends MX_Controller {
    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $this->load->model('item_module_model', 'item');

        $data = $this->item->get_all()->result();

        if($this->input->is_ajax_request()){
            return $this->output
                ->set_content_type('application/json')
                ->set_output(json_encode($this->buildtree($data)));
        } else {
            return $this->buildtree($data);
        }
    }

    private function buildtree($datas, $parent_id = NULL) {
        $branch = array();

        foreach ($datas as $data) {
            if ($data ->parent_id == $parent_id) {
                $children = $this->buildtree($datas, $data->id);
                if ($children) {
                    $data->children = $children;
                }
                $branch[] = $data;
            }
        }

        return $branch;

        /*$tree = array();
         
         foreach($src_arr as $key => $value) {
            if($value->parent_id == $parent_id)
            {
                foreach($value as $k => $v) {
                    $tree[$value->id][$k] = $v;
                }

                unset($src_arr->key);
                $tree[$value->id]['children'] = $this->buildtree($src_arr, $value->id);
            }
        }

        ksort($tree);
        return $tree;*/
    }
}