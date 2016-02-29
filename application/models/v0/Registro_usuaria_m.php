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
			
		}
		
		public function update($id_usuaria, $usuaria)
		{
			
		}
		
		private function __usuaria($usuaria)
		{
			
		}
}
