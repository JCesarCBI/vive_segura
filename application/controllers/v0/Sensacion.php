<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

	require(APPPATH.'/libraries/REST_Controller.php');
	
	class Sensacion extends REST_Controller {
			
		function __construct() {
			parent::__construct();
			$this->load->model('v0/Sensacion_m');
		}

		public function index_get() {			
			$sensacion = $this->Sensacion_m->get();
			
			if (!is_null($sensacion)) {
				$this->response(array("Response"=>$sensacion), 200);
			} else {
				$this->response(array("Error"=>"No hay sensaciones."), 404);
			}
		}
		
		public function find_get($id_sensacion) {			
			if (! $id_sensacion) {
				$this->response(NULL, 400);
			} else {
				$sensacion = $this->Sensacion_m->get($id_sensacion);
			
				if (!is_null($sensacion)) {
					$this->response(array("Response" => $sensacion), 200);
				} else {
					$this->response(array("Error" => "No se encuentra la sensacion."), 404);
				}
			}
		}		
		
		public function index_post()
		{			
			if (! $this->post('datos')) {
				$response = "No se enviaron parametros";
				$code = 400;
			} else {
				$datos = $this->post('datos');
				$datos = $this->seguridad->descifra($datos);
				$datos = json_decode($datos, true);
				$id_sensacion = $this->Sensacion_m->save($datos);
				if (!is_null($id_sensacion)) {
					$response = array('id_sensacion' => $id_sensacion);
					$response = json_encode($response);
					$response = $this->seguridad->cifra($response);
					$code = 200;
				} else {
					$response = "Ha ocurrido un error al registrar la sensacion.";
					$code = 400;
				}
			}
			
			$this->response(array("code" => $code, "response" => $response));

		}
		
		public function index_put($id_sensacion) {
			$response = "No implementado";
			$code = 501;
			
			$this->response(array("code" => $code, "response" => $response));
		}
		
		public function index_delete($id_sensacion) {
			$response = "No implementado";
			$code = 501;

			$this->response(array("code" => $code, "response" => $response));
		}

	}

/* End of file Sensacion.php */
/* Location: ./application/controllers/v0/Sensacion.php */