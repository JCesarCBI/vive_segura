<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	
	require(APPPATH.'/libraries/REST_Controller.php');
	
	class Usuarias extends REST_Controller {
			
		function __construct() {
			parent::__construct();
			$this->load->model('v0/Registro_usuaria_m');
			$this->load->model('v0/Codigo_postal_m');
		}
		
		public function index_get() {			
			$usuarias = $this->Registro_usuaria_m->get();
			
			if (!is_null($usuarias)) {
				$this->response(array("Response"=>$usuarias), 200);
			} else {
				$this->response(array("Error"=>"No hay usuarias."), 404);
			}
		}
		
		public function find_get($id_usuaria) {			
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
		
		public function index_post() {
			if (!$this->post('datos')) {
				$response = "No se enviaron parametros";
				$code = 400;
			} else {
				$datos = $this->post('datos');
				$datos = $this->seguridad->descifra($datos);
				$datos = json_decode($datos);

				$id_cat_colonia_cp = $this->Codigo_postal_m->get_id_colonia_by_cp($datos["codigo_postal"]);

				if (! is_null($id_cat_colonia_cp)) {
					$datos["id_cat_colonia_cp"] = $id_cat_colonia_cp;
					unset($datos["codigo_postal"]);
					// echo "<pre>";
					// print_r($datos);
					// echo "</pre>";
					$id_usuaria = $this->Registro_usuaria_m->save($datos);
					if (!is_null($id_usuaria)) {
						$response = array('id_usuaria' => $id_usuaria);
						$response = json_encode($response);
						$response = $this->seguridad->cifra($response);
						$code = 200;
					} else {
						$response = "Ha ocurrido un error al registrar la usuaria.";
						$code = 400;
					}
				} else {
					$response = "Ha ocurrido un error al buscar el codigo postal.";
					$code = 400;
				}
			}

			$this->response(array("code" => $code, "response" => $response));
		}
		
		public function index_put($id_usuaria) {
			if (! $this->put() || !$id_usuaria) {
				$this->response(NULL, 400);
			} else {
				$update = $this->Registro_usuaria_m->update($id_usuaria, $this->put());
				if (!is_null($update)) {
					$this->response(array("Response" => "Datos de la usuaria actualizados"), 200);
				} else {
					$this->response(array("Error" => "Ha ocurrido un error."), 400);
				}
			}
		}
		
		public function index_delete($id_usuaria) {
			if (!$id_usuaria) {
				$this->response(NULL, 400);
			}
			
			$delete = $this->Registro_usuaria_m->delete($id_usuaria);
			
			if (!is_null($delete)) {
				$this->response(array("Response" => "Datos de la usuaria eliminados"), 200);
			} else {
				$this->response(array("Error" => "Ha ocurrido un error."), 400);
			}
		}

	}

/* End of file Usuarias.php */
/* Location: ./application/controllers/usuarias.php */