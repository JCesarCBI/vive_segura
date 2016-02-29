<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	
	require(APPPATH.'/libraries/REST_Controller.php');
	
	class Registro_usuaria_c extends REST_Controller {
			
		function __construct() {
			parent::__construct();
			$this->load->model('v0/Registro_usuaria_m');
		}
		
		public function index_get()
		{
			// echo "Vive Segura GET";
			
			$usuarias = $this->Registro_usuaria_m->get();
			
			if (!is_null($usuarias)) {
				$this->response(array("Response"=>$usuarias), 200);
			} else {
				$this->response(array("Error"=>"No hay usuarias."), 404);
			}
		}
		
		public function find_get($id_usuaria)
		{
			// echo "Vive Segura FIND GET";
			
			if (! $id_usuaria) {
				$this->response(NULL, 400);
			} else {
				$usuaria = $this->Registro_usuaria_m->get($id_usuaria);
			
				if (!is_null($usuaria)) {
					$this->response(array("Response" => $usuaria), 200);
				} else {
					$this->response(array("Error" => "No se encuentra la usuaria."), 404);
				}
			}
		}		
		
		public function index_post()
		{
			echo "Vive Segura POST";
			
			if (! $this->post('usuaria')) {
				$this->response(NULL, 400);
			} else {
				$id_usuaria = $this->Registro_usuaria_m->save($this->post('usuaria'));
				if (!is_null($id_usuaria)) {
					$this->response(array("Response" => $id_usuaria), 200);
				} else {
					$this->response(array("Error" => "Ha ocurrido un error."), 400);
				}
			}

		}
		
		public function index_put()
		{
			echo "Vive Segura PUT";
		}
		
		public function index_delete()
		{
			echo "Vive Segura DELETE";
		}
	}
	
?>