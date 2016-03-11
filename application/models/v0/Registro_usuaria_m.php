<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	
	class Registro_usuaria_m extends CI_Model {
			
		public function __construct() {
			parent::__construct();
		}
		
		public function get	($id_usuaria = NULL)
		{
			if (!is_null($id_usuaria)) {
				$query = $this->db->SELECT('*')->FROM('usuaria')->WHERE('id_usuaria', $id_usuaria)->GET();
				if ($query->num_rows() === 1) {
					return $query->row_array();
				} else {
					return NULL;
				}
			} else {
				$query = $this->db->SELECT('*')->FROM('usuaria')->GET();
				if ($query->num_rows() > 0) {
					return $query->result_array();
				} else {
					return NULL;
				}
			}
		}
		
		// public function save($usuaria)
		// {
		// 	$this->db->SET(
		// 		$this->_setUsuaria($usuaria)
		// 		)
		// 		->INSERT('usuaria');
		// 	if ($this->db->affected_rows() === 1) {
		// 		return $this->db->insert_id();
		// 	}
		// 	return NULL;
		// }
		
		public function save($usuaria) {
			$custom_query = "INSERT INTO usuaria(mac_dispositivo,plataforma_dispositivo,nickname_usuaria,nombre_usuaria,fecha_nacimiento_usuaria,id_cat_colonia_cp,trabaja_usuaria,estudia_usuaria,ama_casa_usuaria,fecha_registro_usuaria) VALUES ('".$usuaria["mac_dispositivo"]."', ".$usuaria["plataforma_dispositivo"].",
	    			'".$usuaria["nickname_usuaria"]."',
	    			'".$usuaria["nombre_usuaria"]."',
	    			'".$usuaria["fecha_nacimiento_usuaria"]."',
	    			".$usuaria["id_cat_colonia_cp"].",
	    			".$usuaria["trabaja_usuaria"].",
	    			".$usuaria["estudia_usuaria"].",
	    			".$usuaria["ama_casa_usuaria"].",
	    			'".$usuaria["fecha_registro_usuaria"]."'
    		);";
			
			$resultado = $this->db->query($custom_query);

			if ($resultado) {
				return $this->db->insert_id();
			} else {
				return null;
			}
		}
		
		public function update($id_usuaria, $usuaria)
		{
			$this->db->SET(
				$this->_setUsuaria($usuaria)
				)
				->WHERE('id_usuaria', $id_usuaria)
				->UPDATE('usuaria');
			if ($this->db->affected_rows() === 1) {
				return TRUE;
			}
			return NULL;
		}
		
		public function delete($id_usuaria)
		{
			$this->db->WHERE('id_usuaria', $id_usuaria)->DELETE("usuaria");
			
			if ($this->db->affected_rows() === 1) {
				return TRUE;
			}
			return FALSE;
		}
		
		private function _setUsuaria($usuaria)
		{
			$set_usuaria = array();
			
			if (isset($usuaria['mac_dispositivo'])) {
				$set_usuaria['mac_dispositivo'] = $usuaria['mac_dispositivo'];
			};
			if (isset($usuaria['plataforma_dispositivo'])) {
				$set_usuaria['plataforma_dispositivo'] = $usuaria['plataforma_dispositivo'];
			};
			if (isset($usuaria['nickname_usuaria'])) {
				$set_usuaria['nickname_usuaria'] = $usuaria['nickname_usuaria'];
			};
			if (isset($usuaria['nombre_usuaria'])) {
				$set_usuaria['nombre_usuaria'] = $usuaria['nombre_usuaria'];
			};
			if (isset($usuaria['primer_apellido_usuaria'])) {
				$set_usuaria['primer_apellido_usuaria'] = $usuaria['primer_apellido_usuaria'];
			};
			if (isset($usuaria['segundo_apellido_usuaria'])) {
				$set_usuaria['segundo_apellido_usuaria'] = $usuaria['segundo_apellido_usuaria'];
			};
			if (isset($usuaria['numero_celular_usuaria'])) {
				$set_usuaria['numero_celular_usuaria'] = $usuaria['numero_celular_usuaria'];
			};
			if (isset($usuaria['fecha_nacimiento_usuaria'])) {
				$set_usuaria['fecha_nacimiento_usuaria'] = $usuaria['fecha_nacimiento_usuaria'];
			};
			if (isset($usuaria['id_cat_colonia_cp'])) {
				$set_usuaria['id_cat_colonia_cp'] = $usuaria['id_cat_colonia_cp'];
			};
			if (isset($usuaria['correo_electronico_usuaria'])) {
				$set_usuaria['correo_electronico_usuaria'] = $usuaria['correo_electronico_usuaria'];
			};
			if (isset($usuaria['trabaja_usuaria'])) {
				$set_usuaria['trabaja_usuaria'] = $usuaria['trabaja_usuaria'];
			};
			if (isset($usuaria['estudia_usuaria'])) {
				$set_usuaria['estudia_usuaria'] = $usuaria['estudia_usuaria'];
			};
			if (isset($usuaria['ama_casa_usuaria'])) {
				$set_usuaria['ama_casa_usuaria'] = $usuaria['ama_casa_usuaria'];
			};
			if (isset($usuaria['fecha_registro_usuaria'])) {
				$set_usuaria['fecha_registro_usuaria'] = $usuaria['fecha_registro_usuaria'];
			};
			
			return $set_usuaria;
		}
}
