<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	
	class Sensacion_m extends CI_Model {
			
		public function __construct() {
			parent::__construct();
		}
		
		public function get	($id_sensacion = NULL)
		{
			if (!is_null($id_sensacion)) {
				$query = $this->db->SELECT('*')->FROM('sensacion')->WHERE('id_sensacion', $id_sensacion)->GET();
				if ($query->num_rows() === 1) {
					return $query->row_array();
				} else {
					return NULL;
				}
			} else {
				$query = $this->db->SELECT('*')->FROM('sensacion')->GET();
				if ($query->num_rows() > 0) {
					return $query->result_array();
				} else {
					return NULL;
				}
			}
		}
		
		public function save($sensacion)
		{
			$this->db->SET(
				$this->_setSensacion($sensacion)
				)
				->INSERT('sensacion');
			if ($this->db->affected_rows() === 1) {
				$this->db->where('id_usuaria', $sensacion['id_usuaria']);
				$this->db->set('sensacion_usuaria', 'sensacion_usuaria + 1', FALSE);
				$this->db->update('usuaria');
				return $this->db->insert_id();
			}
			return NULL;
		}
				
		private function _setSensacion($sensacion)
		{
			$set_sensacion = array();
			
			if (isset($sensacion['id_usuaria'])) {
				$set_sensacion['id_usuaria'] = $sensacion['id_usuaria'];
			};
			if (isset($sensacion['id_cat_sensacion'])) {
				$set_sensacion['id_cat_sensacion'] = $sensacion['id_cat_sensacion'];
			};
			if (isset($sensacion['latitud_sensacion'])) {
				$set_sensacion['latitud_sensacion'] = $sensacion['latitud_sensacion'];
			};
			if (isset($sensacion['longitud_sensacion'])) {
				$set_sensacion['longitud_sensacion'] = $sensacion['longitud_sensacion'];
			};
			if (isset($sensacion['id_cat_lugar'])) {
				$set_sensacion['id_cat_lugar'] = $sensacion['id_cat_lugar'];
			};
			if (isset($sensacion['fecha_sensacion'])) {
				$set_sensacion['fecha_sensacion'] = $sensacion['fecha_sensacion'];
			};
			if (isset($sensacion['calificacion_total'])) {
				$set_sensacion['calificacion_total'] = $sensacion['calificacion_total'];
			};	
			
			return $set_sensacion;
		}
}
