       IDENTIFICATION DIVISION.
       PROGRAM-ID. NOMINA-SEMANAL.
       AUTHOR. JOSE-VILCA.

       ENVIRONMENT DIVISION.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
      
      *******************
      *TITULOS Y TEXTOS *
      *******************
       01 WS-TITLE                     PIC X(50)
                                                      VALUE
             "CALCULO DE NOMINA SEMANAL CON HORAS EXTRAS".
       01 WS-INPUT-DATA-TEXT           PIC X(50)
                                                      VALUE
             "INGRESO DE DATOS DEL TRABAJADOR". 
       01 WS-OUTPUT-DATA-TEXT          PIC X(50)
                                                      VALUE
             "RESULTADOS DEL CALCULO DE NOMINA".

      *******************
      *DATOS DE ENTRADA *
      ******************* 
       01 WS-NAME                      PIC X(20).
       01 WS-HOURS-WORKED.
          05 WS-HOUR                   PIC 9(02).
          05 WS-MINUTE                 PIC 9(02). 
             88 WS-MINUTE-RANGE                       VALUE 0 THRU 59.
          05 WS-SECONDS                PIC 9(02).
             88 WS-SECONDS-RANGE                      VALUE 0 THRU 59.

       01 WS-PAY-PER-HOUR              PIC 9(06)V99. 
       01 WS-TOTAL-HOURS               PIC 9(03)V9999. 
      **************
      * CONSTANTES *
      ************** 
       01 WS-CONVERT-MINUTE-TO-HOUR    PIC V9999 COMP-3
                                                      VALUE .0166.
       01 WS-CONVERT-SECONDS-TO-HOUR   PIC V9999 COMP-3
                                                      VALUE .0002777.
       01 WS-FIXED-TAX                 PIC V99 COMP-3 VALUE .1.
       01 WS-COMMISSION                PIC 99V99 COMP-3
                                                      VALUE 1.5.

      *******************
      * DATOS DE SALIDA * 
      *******************
       01 WS-PAY-TOTAL                 PIC 9(06)V99.
       01 WS-OVERTIME-PAYMENT          PIC 9(06)V99   VALUE .0.

       01 WS-PAY-TOTAL-DISPLAY         PIC ZZZ,ZZ9.99.
       01 WS-HOURS-WORKED-DISPLAY.
          05 WS-HOURS-DISPLAY          PIC 99.
          05 FILLER                    PIC X          VALUE ":".
          05 WS-MINUTES-DISPLAY        PIC 99.
          05 FILLER                    PIC X          VALUE ":".
          05 WS-SECONDS-DISPLAY        PIC 99.
       01 WS-OVERTIME-PAYMENT-DISPLAY  PIC ZZZ,ZZ9.99.
       01 WS-PAY-PER-HOUR-DISPLAY      PIC ZZZ,ZZ9.99.       
       01 WS-TOTAL-HOURS-DISPLAY       PIC ZZZ.9999.

       01 WS-DATE-TIME-SYSTEM          PIC X(20).
       01 WS-DATE-TODAY.               
          05 WS-DAY-TODAY              PIC 99.
          05 WS-FILLER                 PIC X          VALUE "-".
          05 WS-MONTH-TODAY            PIC 99.
          05 WS-FILLER                 PIC X          VALUE "-".
          05 WS-YEAR-TODAY             PIC 9999.
       01 WS-TIME-TODAY.
          05 WS-HOUR-TODAY             PIC 99.          
          05 WS-MINUTE-TODAY           PIC 99.          
          05 WS-SECONDS-TODAY          PIC 99.

       01 WS-AMPM-TODAY                PIC X(2).
       01 WS-12-HOUR-FORMAT.
          05 WS-HOUR-FORMAT            PIC 99.
          05 FILLER                    PIC X          VALUE ":".
          05 WS-MINUTE-FORMAT          PIC 99.
          05 FILLER                    PIC X          VALUE ":".
          05 WS-SECONDS-FORMAT         PIC 99.
          05 FILLER                    PIC X          VALUE SPACE. 
          05 WS-AMPM-OUT               PIC XX.
           
       

      ***************
      * VALIDADORES * 
      ***************
       01 WS-NAME-OK                   PIC X          VALUE 'N'.
          88 WS-NAME-VALIDA                           VALUE 'S'.
          88 WS-NAME-INVALIDA                         VALUE 'N'.
       01 WS-PAY-PER-HOUR-OK           PIC X          VALUE 'N'.
          88 WS-PAY-PER-HOUR-VALIDA                   VALUE 'S'.
          88 WS-PAY-PER-HOUR-INVALIDA                 VALUE 'N'.
       01 WS-TIME-OK                   PIC X          VALUE 'N'.
          88 WS-TIME-VALIDA                           VALUE 'S'.
          88 WS-TIME-INVALIDA                         VALUE 'N'.

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           SET WS-NAME-INVALIDA TO TRUE
           SET WS-PAY-PER-HOUR-INVALIDA TO TRUE
           SET WS-TIME-INVALIDA TO TRUE
           PERFORM UNTIL WS-NAME-VALIDA AND WS-PAY-PER-HOUR-VALIDA AND
              WS-TIME-VALIDA 
                   PERFORM INGRESAR-DATOS 
                   PERFORM VALIDAR-DATOS                     
           END-PERFORM.
           PERFORM CALCULO-PAGO
           PERFORM MOSTRAR-RESULTADOS 
           STOP RUN.
       
       INGRESAR-DATOS.
           MOVE SPACE TO WS-NAME 
           DISPLAY "INGRESE NOMBRE DEL TRABAJADOR:".
           ACCEPT WS-NAME
           DISPLAY "INGRESE LAS HORAS TRABAJADAS:".
           DISPLAY "HORAS:".
           ACCEPT WS-HOUR.
           DISPLAY "MINUTOS:".
           ACCEPT WS-MINUTE
           DISPLAY "SEGUNDOS:".
           ACCEPT WS-SECONDS.
           DISPLAY "INGRESE PAGO POR HORA:".
           ACCEPT WS-PAY-PER-HOUR.

       CALCULO-PAGO.
           COMPUTE WS-TOTAL-HOURS =
              (WS-CONVERT-MINUTE-TO-HOUR * WS-MINUTE) +
              (WS-CONVERT-SECONDS-TO-HOUR * WS-SECONDS) +
              WS-HOUR.

           IF WS-TOTAL-HOURS > 40
              COMPUTE WS-OVERTIME-PAYMENT =
                 (WS-TOTAL-HOURS - 40) * WS-PAY-PER-HOUR * WS-COMMISSION
              COMPUTE WS-PAY-TOTAL = WS-OVERTIME-PAYMENT
                 +(40 * WS-PAY-PER-HOUR)
           ELSE
              COMPUTE WS-PAY-TOTAL =
                 WS-TOTAL-HOURS * WS-PAY-PER-HOUR
           END-IF.

       MOSTRAR-RESULTADOS.     
           
           MOVE WS-PAY-TOTAL TO WS-PAY-TOTAL-DISPLAY
           MOVE WS-PAY-PER-HOUR TO WS-PAY-PER-HOUR-DISPLAY 
           MOVE WS-OVERTIME-PAYMENT TO WS-OVERTIME-PAYMENT-DISPLAY 
           MOVE WS-HOUR TO WS-HOURS-DISPLAY
           MOVE WS-MINUTE TO WS-MINUTES-DISPLAY
           MOVE WS-SECONDS TO WS-SECONDS-DISPLAY
           MOVE WS-TOTAL-HOURS TO WS-TOTAL-HOURS-DISPLAY     

           PERFORM FORMATO-FECHA-HORA
           
           DISPLAY "FECHA Y HORA QUE SACAMOS LA NOMINA DEL TRABAJADOR: "
                   WS-DATE-TODAY,
                   " ",
                   WS-12-HOUR-FORMAT.
           DISPLAY "NOMBRE DEL TRABAJADOR: " WS-NAME.
           DISPLAY "PAGO TOTAL: " WS-PAY-TOTAL-DISPLAY. 
           DISPLAY "PAGO POR HORA: " WS-PAY-PER-HOUR-DISPLAY.
           DISPLAY "HORAS TRABAJADAS: " WS-TOTAL-HOURS-DISPLAY.
           DISPLAY "PAGO POR HORAS EXTRAS: "
                   WS-OVERTIME-PAYMENT-DISPLAY.
           DISPLAY "TIEMPO TRABAJADO (HH:MM:SS): "
                   WS-HOURS-WORKED-DISPLAY.     
       VALIDAR-DATOS.
           SET WS-NAME-VALIDA TO TRUE.
           SET WS-PAY-PER-HOUR-VALIDA TO TRUE.
           SET WS-TIME-VALIDA TO TRUE

           IF WS-NAME = SPACE OR WS-NAME IS NOT ALPHABETIC  
              SET WS-NAME-INVALIDA TO TRUE
              DISPLAY 
              "ERROR: NOMBRE INVALIDO."
           END-IF.
           
           IF WS-PAY-PER-HOUR = ZERO OR WS-PAY-PER-HOUR IS NOT NUMERIC               
              SET WS-PAY-PER-HOUR-INVALIDA TO TRUE
              DISPLAY
               "ERROR: PAGO POR HORA DEBE SER NUMERICO Y MAYOR A CERO."
           END-IF.

           IF NOT WS-MINUTE-RANGE OR WS-MINUTE IS NOT NUMERIC
              SET WS-TIME-INVALIDA TO TRUE
              DISPLAY
                 "ERROR: MINUTOS DEBEN SER NUMERICOS ENTRE 00 Y 59."
           END-IF. 

           IF NOT WS-SECONDS-RANGE OR WS-SECONDS IS NOT NUMERIC
              SET WS-TIME-INVALIDA TO TRUE
              DISPLAY
                 "ERROR: SEGUNDOS DEBEN SER NUMERICOS ENTRE 00 Y 59."
           END-IF.

       FORMATO-FECHA-HORA. 
           MOVE FUNCTION CURRENT-DATE TO WS-DATE-TIME-SYSTEM
           MOVE WS-DATE-TIME-SYSTEM(1:4) TO WS-YEAR-TODAY         
           MOVE WS-DATE-TIME-SYSTEM(5:2) TO WS-MONTH-TODAY       
           MOVE WS-DATE-TIME-SYSTEM(7:2) TO WS-DAY-TODAY
           MOVE WS-DATE-TIME-SYSTEM(9:2) TO WS-HOUR-TODAY
           MOVE WS-DATE-TIME-SYSTEM(11:2) TO WS-MINUTE-TODAY
           MOVE WS-DATE-TIME-SYSTEM(13:2) TO WS-SECONDS-TODAY.

           EVALUATE TRUE 
           WHEN WS-HOUR-TODAY = 0
                MOVE 12 TO WS-HOUR-TODAY 
                MOVE "AM" TO WS-AMPM-TODAY 
           WHEN WS-HOUR-TODAY < 12
                MOVE "AM" TO WS-AMPM-TODAY 
           WHEN WS-HOUR-TODAY = 12
                MOVE "PM" TO WS-AMPM-TODAY 
           WHEN OTHER
                SUBTRACT 12 FROM WS-HOUR-TODAY
                MOVE "PM" TO WS-AMPM-TODAY
           END-EVALUATE.                            

           MOVE WS-HOUR-TODAY TO WS-HOUR-FORMAT         
           MOVE WS-MINUTE-TODAY TO WS-MINUTE-FORMAT           
           MOVE WS-SECONDS-TODAY TO WS-SECONDS-FORMAT
           MOVE WS-AMPM-TODAY TO WS-AMPM-OUT.