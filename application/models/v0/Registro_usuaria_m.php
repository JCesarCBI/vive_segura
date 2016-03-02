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
		
		public function save($usuaria)
		{
			$this->db->SET(
				$this->_setUsuaria($usuaria)
				)
				->INSERT('usuarias');
			if ($this->db->affected_rows() === 1) {
				return $this->db->insert_id();
			}
			return NULL;
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
			return array(
					'mac_dispositivo' => $usuaria['mac_dispositivo'], 
					'plataforma_dispositivo' => $usuaria['plataforma_dispositivo'], 
					'nickname_usuaria' => $usuaria['nickname_usuaria'], 
					'nombre_usuaria' => $usuaria['nombre_usuaria'], 
					'primer_apellido_usuaria' => $usuaria['primer_apellido_usuaria'], 
					'segundo_apellido_usuaria' => $usuaria['segundo_apellido_usuaria'], 
					'numero_celular_usuaria' => $usuaria['numero_celular_usuaria'], 
					'fecha_nacimiento_usuaria' => $usuaria['fecha_nacimiento_usuaria'], 
					'id_cat_colonia_cp' => $usuaria['id_cat_colonia_cp'], 
					'correo_electronico_usuaria' => $usuaria['correo_electronico_usuaria'], 
					'trabaja_usuaria' => $usuaria['trabaja_usuaria'], 
					'estudia_usuaria' => $usuaria['estudia_usuaria'], 
					'ama_casa_usuaria' => $usuaria['ama_casa_usuaria'], 
					'fecha_registro_usuaria' => $usuaria['fecha_registro_usuaria']
					);
		}
}
