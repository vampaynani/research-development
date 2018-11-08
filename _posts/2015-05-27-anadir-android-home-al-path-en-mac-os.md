---
layout: post
title:  "Añadir ANDROID_HOME al path en MAC OS"
date:   2015-05-27 00:00:00 -0600
categories: android sdk adobe air phonegap cordova react native ionic
---
Siempre que se vaya a utilizar el Android SDK con algún compilador externo, llámese Adobe AIR, Ionic, Phonegap, Cordova, etc. Es necesario agregar **ANDROID_HOME** como environment variable, o en español, que las herramientas del SDK de Android se puedan ejecutar desde cualquier ubicación en nuestro sistema de archivos. A continuación dejo una lista de pocos pasos para agregar esta variable de entorno a tu bash sin dolor.

Descargar e Instalar **Android Studio** desde: https://developer.android.com/sdk/

Instalar desde el **SDK Manager**:
- Tools > Android SDK Tools
- Tools > Android SDK Platform-tools
- Tools > Android SDK Build-tools
- SDK Platform (most recent version)> SDK Platform
- SDK Platform (most recent version) > ARM EABI v7a System Image
- Extras -> Android Support Repository
- Extras > Android Support Library
- Extras -> Google Repository
- Extras > Intel x86 Emulator Accelerator (HAXM installer)

En la **Terminal** escribir:
```bash
$ sudo nano ~/.bash_profile
```
En el archivo que se muestra, escribir lo siguiente:
```bash
export ANDROID_HOME=/Users/<nombre_del_usuario>/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
```
Para cerrarlo, presionar _ctrl+x_ después _Y_ y por último, _enter_.

Para corroborar el path de **ANDROID_HOME**, revisar en la parte superior del **SDK Manager** el campo de **SDK Path**:
![sdk image](https://digitaldealers.mx/imgs/blog/2015_05_28_01.32.54.png)

Cerrar esa ventana de la terminal y abrir una nueva para que el path se refresque e incluya las tools de Android que se han agregado.

Para probar y de paso saber que dispositivos Android están conectados a la pc y disponibles, tanto reales como virtuales usar la instrucción:

```bash
$ adb devices
```
Y listo, el Android SDK y todas sus herramientas están disponibles para ser ejecutados desde cualquier ruta.