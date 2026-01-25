# Guia de instalacion de GnuCOBOL 3.2 para Windows
En esta Guia subire el enalce y algunos pasos para agregar GnuCobol 3.2 a tu computadora win11.
# 1. Introduccion
Es la versión más reciente de un compilador de código abierto y libre del lenguaje de programación COBOL, que permite generar ejecutables nativos en múltiples sistemas operativos (Linux, Windows, macOS, etc.) traduciendo el código COBOL a C y luego compilándolo con un compilador C. Esta versión mejora la compatibilidad con estándares COBOL (ANSI 85, COBOL2002, COBOL2014), optimiza el rendimiento, reduce el uso de memoria, añade soporte para dialectos COBOL, y ofrece un mejor entorno de depuración con integración de GDB.
# 2. Pasos de la instalacion

## 2.1 Descargar GnuCOBOL 3.2
  - Para la descarga entramos al siguiente enlace [Arnold Trembley](https://www.arnoldtrembley.com/GnuCOBOL.htm)
  - 📝 Nota: Arnold Trembley es un programador veterano y miembro destacado de la comunidad de software libre que se toma el trabajo de:
    - Descargar el código fuente de GnuCOBOL.
    - Adaptarlo para que sea compatible con Windows.
    - Compilarlo y empaquetarlo en esos archivos .zip o .exe para que tu los descarges.
  - Descargamos el Binario mas reciente dentro de nuestro computadora, tendra un nombre parecido a este ´GC32-BDB-SP1-rename-7z-to-exe.7z´.
  - 📝 Nota: Cambiar la extension a `.exe` para poder ejecutarlo para descomprimir el paquete. 

## 2.2 Descomprimir el paquete descargado.
  - Creamos una carpeta en el disco local C `C:\` -> nombraremos la carpeta `GnuCobol`.
  - Luego ejecutamos el paquete que descargamos verificando que esta con la extension `.exe`. Cuando ejecutemos se nos abrira una ventana de bloqueo de windows defender para que nos deje extraer los paquetes desactivamos la proteccion basada en reputacion. Una vez desactivada esta opcion se nos abrira una ventana donde seleccionaremos como destino la carpeta que creamos `GnuCobol` donde vamos a descomprimir todos los paquetes.
  - 📝 Nota: Desactivamos la proteccion basada en reputacion.

## 2.3 Configuracion de las variables de entorno.
  - Primero nos ubicamose en la carpeta `bin` copiamos la direccion sera algo asi `C:\gnucobol\bin`.
  - Luego editaremos nuestras variables de entorno, buscamos `Editar variables de entorno` en la barra de busqueda de Windows -> hacemos click en `Variables de entorno` ->  nos posicionamos en `Variables del sistema` -> Buscamos `Path` y le damos en editar -> ponesmos `Nuevo` -> Copiamos y pegamos `C:\gnucobol\bin` -> Finalizamos dando en guardar o aceptar en todas las ventanas.

## 2.4 Validacion de la instalacion.
  - Una vez hecho esto abrimos nuestro `cmd` y ejecutamos lo siguiente `cobc --version`.
  - Nos deberia aparecer un mensaje con la version de GnuCobol 3.2.

## 2.5 Configurar el entorno de ejecucion.
  - Si nos vota este error `/mingw/share/gnucobol/config\default.conf: No such file or directory` al ejecutar nuestro proyecto, lo que tenemos que hacer es decirle a GnuCOBOL exactamente dónde están sus carpetas de configuracion.
  - Configurar las variables de entorno del sistema.
  - Creamos estos nuevos parametros y le damos en guardar:
      - `COB_CONFIG_DIR	C:\gnucobol\config`.
      - `COB_COPY_DIR	C:\gnucobol\copy`.
      - `COB_LIBRARY_PATH	C:\gnucobol\lib`.
  - Finalizamos probando reiniciando nuestra terminal y ejecutando nuevamente nuestro proyecto.
# 3. Mi primer codigo.
## 3.1 Escribiremos un hola mundo
  - Definimos la estructura de nuestro proyecto, respetando las 4 diviciones:
    - `IDENTIFICATION DIVISION.`
    - `ENVIRONMENT DIVISION.`
    - `DATA DIVISION.`
    - `PROCEDURE DIVISION.`
  - En `IDENTIFICATION DIVISION.` para identificar el programa dentro del sistema. Podemos colocarle `PROGRAM-ID.` y `AUTHOR.`.
  - En `ENVIRONMENT DIVISION.` Aqui podemos decirle al programa con que archivos se va a comunicar.
  - En `DATA DIVISION.` Aqui podemos declarar todas las varibles que usaremos en muestro programa.
  - En `PROCEDURE DIVISION.` Aqui es donde daremos instrucciones que el programa debe ejecutar.
    - Ejemplo: 
    `DISPLAY "BIENVENIDO AL SISTEMA, " NOMBRE-USER.`
    `PERFORM PROCESAR-DATOS.`
    `STOP RUN.`
