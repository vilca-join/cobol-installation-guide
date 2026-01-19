# Guia de instalacion de GnuCOBOL 3.2 para Windows
En esta Guia subire el enalce y algunos pasos para agregar GnuCobol 3.2 a tu computadora win11.
# 1. Introduccion
Es la versión más reciente de un compilador de código abierto y libre del lenguaje de programación COBOL, que permite generar ejecutables nativos en múltiples sistemas operativos (Linux, Windows, macOS, etc.) traduciendo el código COBOL a C y luego compilándolo con un compilador C. Esta versión mejora la compatibilidad con estándares COBOL (ANSI 85, COBOL2002, COBOL2014), optimiza el rendimiento, reduce el uso de memoria, añade soporte para dialectos COBOL, y ofrece un mejor entorno de depuración con integración de GDB.
# 2. Pasos de la instalacion
- Para la instalacion necesitaremos entrar a este enlace [Arnold Trembley](https://www.arnoldtrembley.com/GnuCOBOL.htm)
- Arnold Trembley es un programador veterano y miembro destacado de la comunidad de software libre que se toma el trabajo de:
  - Descargar el código fuente de GnuCOBOL.
  - Adaptarlo para que sea compatible con Windows.
  - Compilarlo y empaquetarlo en esos archivos .zip o .exe que tú descargaste.
- Descargamos el Binario mas reciente dentro de nuestro computadora, tendra un nombre parecido a este ´GC32-BDB-SP1-rename-7z-to-exe.7z´.
- Tenemos que cambiar la extencion a ´.exe´.
- Creamos una carpeta en nuestro ´disco local C´
- Luego pasamos a ejecutarlo, se nos abrira una ventana donde descomprimiremos el archivo en la carpeta que creamos.
- Una vez terminado la descomprecion pasamos ubicarnos a la carpeta ´bin´.
- Copiamos la ubicacion que sera parecida a esta ´C:\gnucobol\bin´.
- Luego editaremos nuestras variables de entorno, buscamos el ´variables del sistema´ -> ´Path´ -> ´Nuevo´ -> Copiamos y pegamos ´C:\gnucobol\bin´ -> Finalizamos dando en guardar o aceptar en todas las ventanas.
- Una vez hecho esto abrimos nuestro ´cmd´ y ejecutamos lo siguiente ´cobc --version´.
- Nos deberia aparecer un mensaje con la version de GnuCobol 3.2. 
