--SET SERVEROUTPUT ON
-- SET VERIFY OFF
/*1.	Programa que visualice por cada departamento: el departamento, 
el número de empleados, la media de salario, el salario máximo, 
el salario mínimo y la suma de salarios.
DPTO_NO NUM EMPLES   MEDIA SALARIO   SALARIO MAX   SALARIO MIN  SUMA SALARIO
-------   ----------- -------------- --------------- ------------  -----------
xxxxxx    xxxxxxxxxx    xxxxxxxxxx     xxxxxxxxxxx    xxxxxxxxxxx     xxxxxxx
xxxxxx    xxxxxxxxxx    xxxxxxxxxx     xxxxxxxxxxx    xxxxxxxxxxx     xxxxxxx

TOTALES : xxxtemples   xxtmsalxxxx     xxxxtsmaxxxx   xxxtsminxxxx   tsumaxxxx
*/

DECLARE
    -- RECUPERAMOS DE LA BASE DE DATOS LOS DATOS QUE QUEREMOS MOSTRAR. 
    -- SI USAMOS FUNCIONES DE GRUPO (SUM, AVG, MIN, MAX...) PONEMO UN ALIAS AL CAMPO. 
    CURSOR C1 IS 
        SELECT DEPT_NO, COUNT(*) AS NUM_EMPLE, AVG(SALARIO) AS MEDIA_SAL , 
               MAX(SALARIO) AS MAX_SAL, MIN(SALARIO) AS MIN_SAL, SUM(SALARIO) AS SUM_SAL
        FROM EMPLE
        GROUP BY DEPT_NO
        ORDER BY DEPT_NO;
    
    REG C1%ROWTYPE; -- REGISTRO ELEMENTOS DEL CURSOR
    
    -- VARIABLES TOTALES
    TEMPLES NUMBER(5):=0; -- NUMERO TOTAL EMPLEADOS
    TMSAL NUMBER(9,2):=0; -- SUMA MEDIA DE LOS SALARIOS. 
    TSMAX NUMBER(9,2):=0; -- SUMA SALARIO MAXIMO. 
    TSMIN NUMBER(9,2):=0; -- SUMA SALARIO MINIMO.
    TSUMA NUMBER(9,2):=0; -- SUMA DE LOS SALARIOS. 
       
BEGIN
    -- CABECERAS 
    DBMS_OUTPUT.PUT_LINE('DPTO_NO  NUM EMPLES   MEDIA SALARIO   SALARIO MAX   SALARIO MIN  SUMA SALARIO');
    DBMS_OUTPUT.PUT_LINE('-------  ----------   -------------   -----------   -----------  ------------');
    
    -- ABRIR CURSOR
    OPEN C1;
    
    -- PLANTEAMIENTO BUCCLE
    LOOP
        FETCH C1 INTO REG;      -- CAPTURAMOS EL ELEMENTO DONDE APUNTA EL PUNTERO DEL CURSOR. 
        EXIT WHEN C1%NOTFOUND;  -- CONDICIÓN DE SALIDA DEL BUCLE. 
        
        -- MOSTRAR EL CONTENIDO DEL REGISTRO. 
        DBMS_OUTPUT.PUT_LINE(RPAD(TO_CHAR(REG.DEPT_NO), 10,' ') ||
                             RPAD(TO_CHAR(REG.NUM_EMPLE), 12, ' ') ||
                             RPAD(TO_CHAR(REG.MEDIA_sAL,'9G999D99')||'€',15,' ')||
                             RPAD(TO_CHAR(REG.MAX_SAL,'9G999D99')||'€',15,' ')||
                             RPAD(TO_CHAR(REG.MIN_SAL,'9G999D99')||'€',12,' ')||
                             TO_CHAR(REG.SUM_SAL,'999G999D99')||'€');
    
        TEMPLES:=TEMPLES+REG.NUM_EMPLE;
        TMSAL:=TMSAL+REG.MEDIA_SAL;
        TSMAX:=TSMAX+REG.MAX_SAL;
        TSMIN:=TSMIN+REG.MIN_SAL;
        TSUMA:=TSUMA+REG.SUM_SAL;
        
    END LOOP;
    CLOSE C1;
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('TOTALES : ' ||
                          RPAD(TO_CHAR(TEMPLES),10,' ')||
                          RPAD(TO_CHAR(TMSAL,'999G999D99')||'€',15,' ')||
                          RPAD(TO_CHAR(TSMAX,'999G999D99')||'€',15,' ')||
                          RPAD(TO_CHAR(TSMIN,'999G999D99')||'€',15,' ')||
                          RPAD(TO_CHAR(TSUMA,'999G999D99')||'€',15,' '));
    
END;




