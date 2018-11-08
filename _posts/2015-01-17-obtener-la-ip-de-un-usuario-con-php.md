---
layout: post
title:  "Obtener la IP de un usuario con PHP"
date:   2015-01-17 00:00:00 -0600
categories: php ip
---
Ya sea por un blog en Wordpress o una app en la que solicita el cliente datos con respecto a la IP de los usuarios que visitan su sitio, será necesario obtenerla a través de un script de backend.

Para esta sencilla tarea se puede utilizar:
```php
$_SERVER['REMOTE_ADDR'];
````
Y muy probablemente funcione. El problema es que actualmente por seguridad y desempeño, muchos servers utilizan proxys que regresan la dirección del proxy y no la del usuario que está intentando acceder al sitio. Por lo que si muchos usuarios entran a través del mismo proxy, esta es la única dirección que verás registrada en tu base de datos.

Para evitar esto se utiliza el header X-Forwarded-For, que es la dirección que el usuario manda al proxy para que este a la vez se dirija a nuestro sitio. Esto se logra a través del siguiente script:
```php
function real_ip(){
	if ( function_exists( 'apache_request_headers' ) ) {
		$headers = apache_request_headers();
	} else {
		$headers = $_SERVER;
	}
	if ( array_key_exists( 'HTTP_CLIENT_IP', $headers ) && filter_var( $headers['HTTP_CLIENT_IP'], FILTER_VALIDATE_IP, FILTER_FLAG_IPV4 ) ) { $ip = $headers['HTTP_CLIENT_IP']; }
	elseif ( array_key_exists( 'X-Forwarded-For', $headers ) && filter_var( $headers['X-Forwarded-For'], FILTER_VALIDATE_IP, FILTER_FLAG_IPV4 ) ) { $ip = $headers['X-Forwarded-For']; } 
	elseif ( array_key_exists( 'HTTP_X_FORWARDED_FOR', $headers ) && filter_var( $headers['HTTP_X_FORWARDED_FOR'], FILTER_VALIDATE_IP, FILTER_FLAG_IPV4 ) ) { $ip = $headers['HTTP_X_FORWARDED_FOR']; } 
	elseif ( array_key_exists( 'HTTP_X_FORWARDED', $headers ) && filter_var( $headers['HTTP_X_FORWARDED'], FILTER_VALIDATE_IP, FILTER_FLAG_IPV4 ) ) { $ip = $headers['HTTP_X_FORWARDED']; } 
	elseif ( array_key_exists( 'HTTP_FORWARDED_FOR', $headers ) && filter_var( $headers['HTTP_FORWARDED_FOR'], FILTER_VALIDATE_IP, FILTER_FLAG_IPV4 ) ) { $ip = $headers['HTTP_FORWARDED_FOR']; } 
	elseif ( array_key_exists( 'HTTP_FORWARDED', $headers ) && filter_var( $headers['HTTP_FORWARDED'], FILTER_VALIDATE_IP, FILTER_FLAG_IPV4 ) ) { $ip = $headers['HTTP_FORWARDED']; } 
	elseif { array_key_exists( 'REMOTE_ADDR', $headers ) && filter_var( $headers['REMOTE_ADDR'], FILTER_VALIDATE_IP, FILTER_FLAG_IPV4 ) ) { $ip = $headers['REMOTE_ADDR']; }
	else { $ip = NULL }
	return $ip;
}
```