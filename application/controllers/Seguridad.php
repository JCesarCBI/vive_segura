<?php 
	defined('BASEPATH') OR exit('No direct script access allowed');
	define("KEY", "cdmx_taxi_seguro");

	class Seguridad {

		function cifra($mensaje) {
			/* Apertura de un modo, y creación de un IV */
			$td = mcrypt_module_open('tripledes', '', 'ecb', '');
			$iv_size = mcrypt_enc_get_iv_size($td);
			$iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
			mcrypt_generic_init($td, KEY, $iv);
			$encrypted_data = mcrypt_generic($td, $mensaje);
			$encrypted_data = base64_encode($encrypted_data);
			$encrypted_data = bin2hex($encrypted_data);
			mcrypt_generic_deinit($td);
			mcrypt_module_close($td);
			return $encrypted_data;
		}

		function descifra($mensaje) {
			$mensaje_bin = hex2bin($mensaje);
			$decrypted_data = base64_decode($mensaje_bin);
			$td = mcrypt_module_open('tripledes', '', 'ecb', '');
			$iv = mcrypt_create_iv (mcrypt_enc_get_iv_size($td), MCRYPT_RAND);
			$key = substr(KEY, 0, mcrypt_enc_get_key_size($td));
			mcrypt_generic_init($td, $key, $iv);
			$decrypted_data = mdecrypt_generic($td, $decrypted_data);
			mcrypt_generic_deinit($td);
			mcrypt_module_close($td);
			$decrypted_data = preg_replace('/[\x00-\x1F\x80-\xFF]/', '', $decrypted_data);
			return $decrypted_data;
		}
	}
?>
