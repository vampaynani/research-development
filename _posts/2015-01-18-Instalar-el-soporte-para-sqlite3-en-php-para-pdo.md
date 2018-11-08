---
layout: post
title:  "Instalar el soporte para Sqlite3 en PHP para PDO"
date:   2015-01-18 00:00:00 -0600
categories: php sqlite3 pdo
---
Dando soporte a uno de nuestros proyectos en el que cualquier opción distinta a Sqlite estaba sobrada, decidimos utilizarlo en conjunto con un script que teníamos desarrollado con PDO ya que la migración en este sentido era sencilla, el problema que encontramos fué que por default Ubuntu no incluye el driver de Sqlite para PDO.

La solución fue sencilla:
```bash
$ sudo apt-get install php5-sqlite
```
Aunque uno de nosotros tuvo un problema:
```bash
configure: error: Cannot find php_pdo_driver.h.
ERROR: `/tmp/pear/temp/PDO_SQLITE/configure' failed
```
El cual solucionamos con:
```bash
$ apt-get --purge remove php5*
$ sudo apt-get install php5 php5-sqlite php5-mysql
```