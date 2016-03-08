<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Codigo_postal_m extends CI_Model {

	public function __construct() {
		parent::__construct();
	}

	public function get_id_colonia_by_cp($cp) {
		$custom_query = "SELECT id_cat_colonia_cp FROM cat_colonia_cp WHERE codigo_postal = '".$cp."' AND estatus = 1 LIMIT 1;";
		
		$resultado = $this->db->query($custom_query);
		$resultado = $resultado->result_array();		

		if (count($resultado) > 0) {
			return $resultado[0]["id_cat_colonia_cp"];
		} else {
			return null;
		}
	}

}

/* End of file Codigo_postal.php */
/* Location: ./application/models/Codigo_postal.php */