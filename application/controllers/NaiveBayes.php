<?php
defined('BASEPATH') OR exit('No direct script access allowed');
include ("libraries/autoload.php");
use GroceryCrud\Core\GroceryCrud;
class NaiveBayes extends CI_Controller {
	function __construct() {
        parent::__construct();
        $database   = include ('database.php'); //config database Grocery
        $config     = include ('config.php'); //config library Grocery
        $this->crud = new GroceryCrud($config, $database); //initialize Grocery
    		$this->crud->unsetBootstrap();
    		$this->crud->unsetExport();
    		$this->crud->unsetPrint();
	}
    public function index(){
        $var['module'] = "naivebayes/dashboard";
        $var['var_module'] = array();
        $var['content_title'] = "";
        $var['breadcrumb'] = array(
                "Home"=>"",
                "Dashboard"=>"active"
        );
        $this->load->view('main',$var);

    }
	public function process($page="dataset")
	{
      $var['module'] = "naivebayes/process";
    	$var['var_module'] = array("page"=>$page);
      $var['content_title'] = "Metode Naive Bayes";
    	$var['breadcrumb'] = array(
    			"Home"=>"",
    			"Naive Bayes"=>"active"
    	);
	    $this->load->view('main',$var);
	}
  function dataset(){
    $var = array();
		$var['gcrud'] = 1;
		$var['content_title'] = "Data Quisioner";
		$var['breadcrumb'] = array(
			"Data History"=>""
		);
		$this->crud->setTable('naivebayes_textclassifier');
		$output = $this->crud->render();
		if ($output->isJSONResponse) {
				header('Content-Type: application/json; charset=utf-8');
				echo $output->output;
				exit;
		}
		$var['css_files']   = $output->css_files;
		$var['js_files']    = $output->js_files;
		$var['output']      = $output->output;
		$this->load->view('main',$var);
  }
  function export(){
    $this->load->view('module/export');
  }
  function debug(){
    $data = array(
    ['overcast','hot','high','FALSE','yes'],
    ['overcast','cool','normal','TRUE','yes'],
    ['overcast','mild','high','TRUE','yes'],
    ['overcast','hot','normal','FALSE','yes'],
    ['rainy','mild','high','FALSE','yes'],
    ['rainy','cool','normal','FALSE','yes'],
    ['rainy','cool','normal','TRUE','no'],
    ['rainy','mild','normal','FALSE','yes'],
    ['rainy','mild','high','TRUE','no'],
    ['sunny','hot','high','FALSE','no'],
    ['sunny','hot','high','TRUE','no'],
    ['sunny','mild','high','FALSE','no'],
    ['sunny','cool','normal','FALSE','yes'],
    ['sunny','mild','normal','TRUE','yes']);
    $predict = array("rainy","cool","normal","TRUE");
    $this->naivebayes->init($data,$predict);
    print_r($this->naivebayes->predict());
    print_r($this->naivebayes->resall);
    print_r($this->naivebayes->reslabel);
  }
}
