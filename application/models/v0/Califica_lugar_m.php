<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Califica_lugar_m extends CI_Model {

	public function __construct() {
		parent::__construct();
		
	}

	public function save($datos) {
			$custom_query = "SELECT save_califica_lugar(".$datos["id_usuaria"].", '".$datos["latitud_califica_lugar"]."', '".$datos["longitud_califica_lugar"]."', ".$datos["id_cat_lugar"].", '".$datos["fecha_califica_lugar"]."', ".$datos["calificacion_total"].", 1, ARRAY[".$datos["lista_califica_lugar"]."]);";
			
			$resultado = $this->db->query($custom_query);
			$resultado = $resultado->result_array();
			if (isset($resultado[0]["save_califica_lugar"])) {
				$id_califica_lugar = $resultado[0]["save_califica_lugar"];
			} else {
				$id_califica_lugar = null;
			}
			
			return $id_califica_lugar;
		}
}

/* End of file Califica_lugar_m.php */
/* Location: ./application/models/Califica_lugar_m.php */