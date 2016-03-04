<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Conexion_api_c extends CI_Controller {
		
		public function __construct(){
			parent::__construct();
		}
		
		public function registrar() {
			$username = 'vive_segura';
			$password = 'VgI9VgE4-SeGyU8R5Aw';
						
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_USERPWD, $username . ':' . $password);
			curl_setopt($ch, CURLOPT_URL, 'http://localhost/vive_segura/v0/Registro_usuaria_c');
			curl_setopt($ch, CURLOPT_HEADER, FALSE);  
			curl_setopt($ch, CURLOPT_POST, TRUE);

			$usuaria = array(
				'mac_dispositivo' => 'e0:98:61:cc:9d:f2',
				'plataforma_dispositivo' => 1,
				'nickname_usuaria' => 'CelesteCDMX',
				'fecha_nacimiento_usuaria' => '1985-02-16',
				'id_cat_colonia_cp' => 569,
				'trabaja_usuaria' => 1,
				'estudia_usuaria' => 1,
				'ama_casa_usuaria' => 1,
				'fecha_registro_usuaria' => '2016-03-03'
			);
					
			curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($usuaria));
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
					
			$registro = curl_exec($ch);
			$respuesta = json_decode($registro, TRUE);
					
			print_r($usuaria);
			echo "<br/>";
			echo "<br/>";
			print_r($respuesta);
		}

		public function actualizar() {
			
			$id_usuaria = 1;
			$username = 'vive_segura';
			$password = 'VgI9VgE4-SeGyU8R5Aw';
						
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_USERPWD, $username . ':' . $password);
			curl_setopt($ch, CURLOPT_URL, 'http://localhost/vive_segura/v0/Registro_usuaria_c/index_put/id_usuaria/');
			curl_setopt($ch, CURLOPT_HEADER, FALSE);  
			curl_setopt($ch, CURLOPT_PUT, TRUE);

			$usuaria_update = array(
				'nombre_usuaria' => 'Carmen',
				'primer_apellido_usuaria' => 'Padilla',
				'segundo_apellido_usuaria' => 'Dorantes',
				'numero_celular_usuaria' => '5519477118',
				'correo_electronico_usuaria' => 'celeste79@gmail.com',
			);
					
			curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($usuaria_update));
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
					
			$registro = curl_exec($ch);
			$respuesta = json_decode($registro, TRUE);
					
			print_r($usuaria_update);
			echo "<br/>";
			echo "<br/>";
			print_r($respuesta);
	}
}