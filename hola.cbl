      *COLUMNA 7: Asteriscos para comentarios
      *COLUMNA 8 - 11: Área A: Para nombres de de divisiones, y parrafos
      *COLUMNA 12 - 72: Área B: Para instrucciones y sentencias.
       
      ******************************************************************
      *                   PROGRAMA "HOLA-MUNDO" EN COBOL               *             
      ******************************************************************
      ******************************************************************
      * IDENTIFICATION DIVISION: 
      *    División más corta y sirve para identificar el programa            
      ******************************************************************
       IDENTIFICATION DIVISION. 
       PROGRAM-ID. HOLA-MUNDO.

      ******************************************************************
      * ENVIRONMENT DIVISION: 
      *    División que describe el entorno de ejecución del programa
      ****************************************************************** 
       ENVIRONMENT DIVISION. 

      ******************************************************************
      * DATA DIVISION:
      *    División donde se definen las variables y estructuras de dato
      ******************************************************************
       DATA DIVISION. 
       WORKING-STORAGE SECTION.
       
      ******************************************************************
      * PROCEDURE DIVISION:
      *    División que contiene las instrucciones y 
      *    sentencias del programa
      ****************************************************************** 
       PROCEDURE DIVISION.
           DISPLAY "HOLA, MUNDO!".
           STOP RUN.
        