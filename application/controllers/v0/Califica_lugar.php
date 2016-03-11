<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

	require(APPPATH.'/libraries/REST_Controller.php');
		
	class Califica_lugar extends REST_Controller {

		function __construct() {
			parent::__construct();
			$this->load->model('v0/Califica_lugar_m');
		}

		public function index_get() {			
			$response = "No implementado";
			$code = 501;

			$this->response(array("code" => $code, "response" => $response));
		}
		
		public function find_get($id_usuaria) {			
			$response = "No implementado";
			$code = 501;

			$this->response(array("code" => $code, "response" => $response));
		}		
		
		public function index_post() {
			if (!$this->post()) {
				$response = "No se recibieron parametros";
				$code = 400;
			} else {
				$datos = $this->post();
				if ($this->validar_datos_califica_lugar($datos) == 1) {
					$id_califica_lugar = $this->Califica_lugar_m->save($datos);
					$response = array('id_califica_lugar' => $id_califica_lugar);
					$code = 200;
				} else {
					$response = "Datos no validos";
					$code = 400;
				}
			}

			$this->response(array("code" => $code, "response" => $response));
		}
		
		public function index_put($id_usuaria) {
			$response = "No implementado";
			$code = 501;

			$this->response(array("code" => $code, "response" => $response));
		}
		
		public function index_delete($id_usuaria) {
			$response = "No implementado";
			$code = 501;

			$this->response(array("code" => $code, "response" => $response));
		}

		/**
		 * @param  Arreglo
		 * @return Entero 1 si los datos son validos, 0 en caso contrario
		 */
		private function validar_datos_califica_lugar($datos) {
			$validado = 0;
			if (isset($datos["id_usuaria"]) && isset($datos["latitud_califica_lugar"]) && isset($datos["longitud_califica_lugar"]) && isset($datos["id_cat_lugar"])  && isset($datos["fecha_califica_lugar"]) && isset($datos["calificacion_total"]) && isset($datos["lista_califica_lugar"]) && $datos["id_usuaria"] > 0 && $datos["id_cat_lugar"] > 0) {
				$validado = 1;
				}

			return $validado;
		}

	

}

/* End of file califica_lugar.php */
/* Location: ./application/controllers/califica_lugar.php */