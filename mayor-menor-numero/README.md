# NOMBRE DEL PROGRAMA - highest-lowest-number
## 📋 Descripción
Este ejemplo es para evaluar el mayor y menor de dos numeros. El objetivo es entender mejor las sintaxis del lenguaje cobol.

## 🛠️ Especificaciones Técnicas
- **Lugar de Ejecución:** [.exe]

## 🏗️ Lógica del Programa
1. **Inicialización:** Declaramos variables de entrada y salida
    - Entrada: WS-NUMBER-1, WS-NUMBER-2.
    - Salida: WS-RESULT-HIGHEST, WS-RESULT-LOWEST.
2. **Proceso Principal:** Descripción de la sentencia `PERFORM` y validaciones clave de los dos numero.
3. **Finalización:** Imprimimos los resultados y los mostramos con un formato adecuado.

## 🚀 Cómo ejecutarlo
1. Asegúrate de tener instalado GnuCOBOL (`cobc`).
2. Compila con: `cobc -x programa.cbl`
3. Ejecuta con: `./programa`

## 📊 Ejemplo de Salida
```text
---------------------------------------
EL NUMERO MAYOR ES:         4
EL NUMERO MENOR ES:         1
---------------------------------------
```