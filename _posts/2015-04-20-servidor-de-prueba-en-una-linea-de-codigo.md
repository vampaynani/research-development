---
layout: post
title:  "Servidor de prueba en una línea de código"
date:   2015-04-20 00:00:00 -0600
categories: server python
---
Hay ocasiones en las cuales aunque el código que estamos desarrollando es sencillo (basado sólo en HTML, CSS y JS)necesitamos probarlo en el entorno de un servidor http debido a sus características, por ejemplo:

- Estamos haciendo una petición ajax a algún sitio y debido a restricciones de seguridad no podemos ejecutar ese código utilizando el protocolo file://.
- Estamos utilizando canvas con funciones que implican interacción del usuario a nivel de píxeles.
- Necesitamos evaluar nuestro código desde un virtual domain para hacer pruebas antes de subir a producción.

Para esto en la agencia usamos un servidor sumamente simple que genera la siguiente línea de código en Python que escribimos en la terminal:
```bash
$ python -m SimpleHTTPServer
```
Y con esa línea basta para tener un servidor http que funciona perfectamente para correr proyectos que no requieren mayor exigencia de recursos.