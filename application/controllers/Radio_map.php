<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Radio_map extends CI_Controller {
	
	public function __construct() {
		parent::__construct();
    }
	
	public function index()
	{
		$this->load->view('mapa');
	}

}/*Fin controlador*/
