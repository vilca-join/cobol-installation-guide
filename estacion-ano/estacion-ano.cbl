       IDENTIFICATION DIVISION. 
       PROGRAM-ID. ESTACION-ANO.
       AUTHOR. JOSE-VILCA.

       ENVIRONMENT DIVISION. 
       DATA DIVISION. 
       WORKING-STORAGE SECTION.      
       
       01 WS-FECHA-INPUT.
          05 WS-DIA             PIC 99.
             88 WS-DIA-RANGO              VALUE 1 THRU 31.           
          05 WS-MES             PIC 99.
             88 WS-MES-RANGO              VALUE 1 THRU 12.
          05 WS-ANO             PIC 9999.
             88 WS-ANO-RANGO              VALUE 1900 THRU 2100.
       01 WS-MES-DIA            PIC 99999.

       01 WS-FECHA-OK           PIC X     VALUE 'N'.
          88 WS-FECHA-VALIDA              VALUE 'S'.
          88 WS-FECHA-INVALIDA            VALUE 'N'.
       

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.           
           SET WS-FECHA-INVALIDA TO TRUE
           PERFORM UNTIL WS-FECHA-VALIDA
                   PERFORM INGRESAR-FECHA
                   PERFORM VALIDAR-LOGICA-FECHA 
                   IF WS-FECHA-INVALIDA
                      DISPLAY
                        "FECHA INVALIDA, POR FAVOR INGRESE NUEVAMENTE."
                   END-IF     
                   
           END-PERFORM.           
           PERFORM MOSTRAR-FECHA.
           PERFORM EVALUAR-ESTACION.
           STOP RUN.
          
       INGRESAR-FECHA.
           DISPLAY "INGRESE EL DIA (DD): ".
           ACCEPT WS-DIA.
           DISPLAY "INGRESE EL MES (MM): ".
           ACCEPT WS-MES.
           DISPLAY "INGRESE EL ANO (YYYY): ".
           ACCEPT WS-ANO.

       EVALUAR-ESTACION.
           COMPUTE WS-MES-DIA =(WS-MES * 100) + WS-DIA.
           EVALUATE TRUE
           WHEN WS-MES-DIA >= 1221 OR WS-MES-DIA < 0320
                DISPLAY "LA ESTACION ES: VERANO"
           WHEN WS-MES-DIA >= 0320 AND WS-MES-DIA < 0621
                DISPLAY "LA ESTACION ES: OTONO"
           WHEN WS-MES-DIA >= 0621 AND WS-MES-DIA < 0922
                DISPLAY "LA ESTACION ES: INVIERNO"
           WHEN WS-MES-DIA >= 0922 AND WS-MES-DIA < 1221
                DISPLAY "LA ESTACION ES: PRIMAVERA"
           WHEN OTHER
                DISPLAY "ERROR EN EL CALCULO DE ESTACION"
           END-EVALUATE.

       MOSTRAR-FECHA.
           DISPLAY "LA FECHA INGRESADA ES: "
                   WS-DIA
                   "/"
                   WS-MES
                   "/"
                   WS-ANO.

       VALIDAR-LOGICA-FECHA.
           SET WS-FECHA-VALIDA TO TRUE.
           IF NOT (WS-DIA-RANGO AND WS-MES-RANGO AND WS-ANO-RANGO)
              SET WS-FECHA-INVALIDA TO TRUE
           END-IF.
           
           IF (WS-MES = 04 OR WS-MES = 06 OR WS-MES = 09 OR WS-MES = 11)
              AND WS-DIA > 30
              SET WS-FECHA-INVALIDA TO TRUE 
           END-IF.

           IF WS-MES = 02
              IF FUNCTION MOD(WS-ANO, 4) = 0
                 IF WS-DIA > 29
                    SET WS-FECHA-INVALIDA TO TRUE
                 END-IF
              ELSE
                 IF WS-DIA > 28
                    SET WS-FECHA-INVALIDA TO TRUE
                 END-IF
              END-IF
           END-IF.