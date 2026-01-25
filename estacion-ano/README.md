# RESOLUCION - ESTACIONES DEL AÑO
Cada estacion tiene una duracion de entre 80 a 94 dias aproximadamente. A continuacion veremos el analisis del problema.

## 1. DESCRIPCION DEL PROBLEMA
Determinar la estacion del año ingresando solo la fecha con el siguiente formato DD, MM, YYYY.
Validar las fechas ingresadas para garantizar la integridad de los datos ingresados.
Si la fecha es invalida se volvera a solicitar la fecha hasta que se coloque una fecha valida.
Como dato de salida mostrar la fecha y la estacion del año en funcion a la fecha. 

## 2. ANALISIS DEL PROBLEMA
1. Analizamos tiempo o fechas:
    - Verano        inicia 21 de diciembre,     termina 20 de marzo.
    - Otoño         inicia 20 de marzo,         termina 21 de junio.
    - Invierno      inicia 21 de junio,         termina 22 de septiembre.
    - Primavera     inicia 22 de septiembre,    termina 21 de diciembre.
2. Verificamos que aca existe un patron, si agrupamos la fecha dia y fecha mes podemos obtener el siguiente dato -> diciembre es 12 asi que seria 12-21 y junto seria 1221 un numero entero.Ejemplo:
    - Verano -> inicia 1221 || fin 320.
    - Otoño -> inicia 320 || fin 621.
    - Invierno -> inicia 621 || fin 922.
    - Primavera -> inicia 922 || fin 1221
3. Teniendo este analisis podemos determinar las siguientes condicionales
    - Verano -> fecha-evaluar >= 1221 and fecha-evaluar < 320.
    - Otoño -> fecha-evaluar >= 320 and fecha-evaluar < 621.
    - Invierno -> fecha-evaluar >= 621 and fecha-evaluar < 922.
    - Primavera -> fecha-evaluar >= 922 and fecha-evaluar < 1221
4. Teniendo este analisis podemos implementar el codigo para determinar la estacion del año segun la fecha ingresada por el usuario.

## 2. COMANDOS PARA EJECUCION.
1. Generamos el .exe con `cobc -x hola-mundo.cbl`
2. luego ejecutamos el exe generado `.\hola-mundo.exe`