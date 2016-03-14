<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
	class Conexion_api_c extends CI_Controller {
		
		public function __construct(){
			parent::__construct();
		}
		
		public function registrar() {
			
			// set post fields
			$usuaria = array(
				'mac_dispositivo' => 'e0:98:61:cc:9d:f2',
				'plataforma_dispositivo' => 1,
				'nickname_usuaria' => 'CelesteCDMX',
				'nombre_usuaria' => 'CelesteCDMX',
				'fecha_nacimiento_usuaria' => '1985-02-16',
				'codigo_postal' => '04910',
				'trabaja_usuaria' => 1,
				'estudia_usuaria' => 0,
				'ama_casa_usuaria' => 1,
				'fecha_registro_usuaria' => '2016-03-14',
			);
			
			$ch = curl_init('http://localhost/vive_segura/v0/Usuarias');
			
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $usuaria);
			
			$response = curl_exec($ch);
			curl_close($ch);
			
			var_dump($usuaria);
			var_dump($response);
			
			
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
		
		
		public function sensacion() {
			
			// set post fields
			$sensacion = array(
				'id_usuaria' => 1,
				'id_cat_sensacion' => 1,
				'id_cat_sensacion' => 3,
				'latitud_sensacion' => '19.360439',
				'longitud_sensacion' => '-99.073316',
				'id_cat_lugar' => 1,
				'fecha_sensacion' => '2016-03-14',
				'calificacion_total' => 10
			);
			
			$ch = curl_init('http://localhost/vive_segura/v0/Sensacion');
			
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $sensacion);
			
			$response = curl_exec($ch);
			curl_close($ch);
			
			var_dump($sensacion);
			var_dump($response);
			
		}
}