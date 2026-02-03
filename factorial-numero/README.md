# NOMBRE DEL PROGRAMA - factorial-numero
## 📋 Descripción
Este ejemplo simularemos la operacion matematica para calcular el factorial de un numero N.
El objetivo es entender como funciona `PERFORM VARYING`. 
## 🛠️ Especificaciones Técnicas
- **Lugar de Ejecución:** [.exe]

## 🏗️ Lógica del Programa
1. **Inicialización:** Declaramos las variables de entrada y salida.
    - Entrada: WS-NUMBER, WS-FACTORIA y WS-COUNTER.
    - Entrada Display: DISPLAY-TITULO, DISPLAY-INPUT, DISPLAY-OUPUT y DISPLAY-ERROR
    - Salida: WS-FACTORIA.
2. **Proceso Principal:** Calcular el factorial de un numero, haciendo uso de `PERFORM VARYING`.
ejemplo: 5! = 5*4*3*2*1 = 120
3. **Finalización:** Imprimimos los resultado del factorial

## 🚀 Cómo ejecutarlo
1. Asegúrate de tener instalado GnuCOBOL (`cobc`).
2. Compila con: `cobc -x programa.cbl`
3. Ejecuta con: `./programa`

## 📊 Ejemplo de Salida
```text
---------------------------------------
INGRESE UN NUMERO ENTERO:
6
---------------------------------------
RESULTADO CALCULADO:                720
---------------------------------------
```