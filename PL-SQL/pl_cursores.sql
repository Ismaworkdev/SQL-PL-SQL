-- ******** TABLA DEPART: ***********

DROP TABLE DEPART cascade constraints; 

CREATE TABLE DEPART (
 DEPT_NO  NUMBER(2) NOT NULL,
 DNOMBRE  VARCHAR2(14), 
 LOC      VARCHAR2(14) ) ;

INSERT INTO DEPART VALUES (10,'CONTABILIDAD','SEVILLA');
INSERT INTO DEPART VALUES (20,'INVESTIGACION','MADRID');
INSERT INTO DEPART VALUES (30,'VENTAS','BARCELONA');
INSERT INTO DEPART VALUES (40,'PRODUCCION','BILBAO');
COMMIT;


-- ******** TABLA EMPLE: *************

ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';

DROP TABLE EMPLE cascade constraints; 

CREATE TABLE EMPLE (
 EMP_NO    NUMBER(4) NOT NULL,
 APELLIDO  VARCHAR2(10)  ,
 OFICIO    VARCHAR2(10)  ,
 DIR       NUMBER(4) ,
 FECHA_ALT DATE      ,
 SALARIO   NUMBER(7),
 COMISION  NUMBER(7),
 DEPT_NO   NUMBER(2) NOT NULL) ;

INSERT INTO EMPLE VALUES (7369,'SANCHEZ','EMPLEADO',7902,'17/12/1990',
                        1040,NULL,20);
INSERT INTO EMPLE VALUES (7499,'ARROYO','VENDEDOR',7698,'20/02/1990',
                        1500,390,30);
INSERT INTO EMPLE VALUES (7521,'SALA','VENDEDOR',7698,'22/02/1991',
                        1625,650,30);
INSERT INTO EMPLE VALUES (7566,'JIMENEZ','DIRECTOR',7839,'02/04/1991',
                        2900,NULL,20);
INSERT INTO EMPLE VALUES (7654,'MARTIN','VENDEDOR',7698,'29/09/1991',
                        1600,1020,30);
INSERT INTO EMPLE VALUES (7698,'NEGRO','DIRECTOR',7839,'01/05/1991',
                        3005,NULL,30);
INSERT INTO EMPLE VALUES (7782,'CEREZO','DIRECTOR',7839,'09/06/1991',
                        2885,NULL,10);
INSERT INTO EMPLE VALUES (7788,'GIL','ANALISTA',7566,'09/11/1991',
                        3000,NULL,20);
INSERT INTO EMPLE VALUES (7839,'REY','PRESIDENTE',NULL,'17/11/1991',
                        4100,NULL,10);
INSERT INTO EMPLE VALUES (7844,'TOVAR','VENDEDOR',7698,'08/09/1991',
                        1350,0,30);
INSERT INTO EMPLE VALUES (7876,'ALONSO','EMPLEADO',7788,'23/09/1991',
                        1430,NULL,20);
INSERT INTO EMPLE VALUES (7900,'JIMENO','EMPLEADO',7698,'03/12/1991',
                        1335,NULL,30);
INSERT INTO EMPLE VALUES (7902,'FERNANDEZ','ANALISTA',7566,'03/12/1991',
                        3000,NULL,20);
INSERT INTO EMPLE VALUES (7934,'MUÑOZ','EMPLEADO',7782,'23/01/1992',
                        1690,NULL,10);

COMMIT;


--1. Programa que visualice por cada departamento: el departamento, el número de empleados, la media de salario, el salario máximo, el salario mínimo y la suma de salarios.
---DEPT_NO   NUM EMPLES   MEDIA SALARIO   SALARIO MAX   SALARIO MIN  SUMA SALARIO
-------   ----------- -------------- --------------- ------------  -----------
--xxxxxx    xxxxxxxxxx    xxxxxxxxxx     xxxxxxxxxxx    xxxxxxxxxxx     xxxxxxx
--xxxxxx    xxxxxxxxxx    xxxxxxxxxx     xxxxxxxxxxx    xxxxxxxxxxx     xxxxxxx

--TOTALES : xxxtemples   xxtmsalxxxx     xxxxtsmaxxxx   xxxtsminxxxx   tsumaxxxx

SET SERVEROUTPUT ON 
SET VERIFY OFF

DECLARE 
CURSOR C1 IS SELECT DEPT_NO , COUNT(*) NUM_EMPLE ,AVG(SALARIO)  MEDIA_SAL,
MAX(SALARIO) MAX_SAL , MIN(SALARIO) MIN_SAL ,  SUM(SALARIO) SUM_SAL 
FROM EMPLE
GROUP BY DEPT_NO;
REG C1%ROWTYPE;

--VARIABLES TOTALES 

TEMPLES NUMBER(5):=0;
TMSAL NUMBER(9,2):=0;
TSMAX NUMBER(9,2):=0;
TSMIN NUMBER(9,2):=0;
TSUMA NUMBER(9,2):=0;
BEGIN

DBMS_OUTPUT.PUT_LINE('DEPT_NO   NUM EMPLES   MEDIA SALARIO   SALARIO MAX   SALARIO MIN  SUMA SALARIO ');
DBMS_OUTPUT.PUT_LINE('-------   ----------- -------------- --------------- ------------  ----------- ');
OPEN C1;
LOOP
FETCH C1 INTO REG;
EXIT WHEN  C1%NOTFOUND;

DBMS_OUTPUT.PUT_LINE(RPAD(TO_CHAR(REG.DEPT_NO) ,10 ,' ' ) || RPAD(TO_CHAR(REG.NUM_EMPLE) ,10 ,' ' ) 
                        ||  RPAD(TO_CHAR(REG.MEDIA_SAL ,'9G999D99')||'$' ,15 ,' ' )||
                          RPAD(TO_CHAR(REG.MAX_SAL ,'9G999D99')||'$' ,15 ,' ' )||
                            RPAD(TO_CHAR(REG.MIN_SAL ,'9G999D99')||'$' ,15 ,' ' )||
                              RPAD(TO_CHAR(REG.SUM_SAL ,'999G999D99')||'$' ,15 ,' ' ));
                              
   TEMPLES := TEMPLES +REG.NUM_EMPLE;
   TMSAL:= TMSAL + REG.MEDIA_SAL;
   TSMAX:= TSMAX + REG.MAX_SAL;
   TSMIN:= TMSAL + REG.MEDIA_SAL;
   TSUMA:= TSUMA + REG.SUM_SAL;

   
END LOOP;
CLOSE C1;


DBMS_OUTPUT.PUT_LINE('-------   ----------- -------------- --------------- ------------  ----------- ');
DBMS_OUTPUT.PUT_LINE('TOTALES : ' ||  RPAD(TO_CHAR(TEMPLES ,'999G999D99')||'$' ,15 ,' ' ) || 
 RPAD(TO_CHAR(TMSAL ,'999G999D99')||'$' ,15 ,' ' ) || 
 RPAD(TO_CHAR(TSMAX ,'999G999D99')||'$' ,15 ,' ' ) ||
                 RPAD(TO_CHAR(TMSAL ,'999G999D99')||'$' ,15 ,' ' ) ||
                   RPAD(TO_CHAR(TSUMA ,'999G999D99')||'$' ,15 ,' ' ));



END;

--2. Programa que lea de teclado un departamento (UTILIZANDO VARIABLES DE SUSTITUCIÓN) y visualice los empleados del departamento. Obtener este listado
--NOMBRE DE DEPARTAMENTO: XXXXXXXXX
--EMPNO     APELLIDO     SALARIO        FECHA_ALTA      COMISION    SALARIO+COMISION 
-------   ----------- -------------- --------------- ------------  ------------
--xxxxxx    xxxxxxxxxx    xxxxxxxxxx     xxxxxxxxxxx    xxxxxxxxxxx     xxxxxxx
--xxxxxx    xxxxxxxxxx    xxxxxxxxxx     xxxxxxxxxxx    xxxxxxxxxxx     xxxxxxx

--TOTAL SALARIO: XXXXX  TOTALSAL
--TOTAL SALARIO+comision: XXXXX  TOTALSALCOM

--Se lee el departamento, nombre de departamento
--Ya en el begin
--Comprobar que el nombre de departamento existe en la tabla depart, para que nos devuelva el número de departamento. Si no existe visualizar mensaje
 --      con la select into, y la excepción WHEN NO DATA FOUND 

--si el departamento existe se visualizan las cabeceras
--NOMBRE DE DEPARTAMENTO: XXXXXXXXX
--EMPNO     APELLIDO     SALARIO      FECHA_ALTA      COMISION  SALARIO+COMISION 
---------  -----------  ------------ ---------------  --------  ----------------


DECLARE 
    v_dept_name DEPART.DNOMBRE%TYPE := &dept_name;
    v_dept_no DEPART.DEPT_NO%TYPE;
    v_total_sal NUMBER := 0;
    v_total_sal_com NUMBER := 0;

    CURSOR c_emple IS
        SELECT EMP_NO, APELLIDO, SALARIO, FECHA_ALT, COMISION, SALARIO + NVL(COMISION, 0) AS SAL_COM
        FROM EMPLE
        WHERE DEPT_NO = v_dept_no;
        
    r_emple c_emple%ROWTYPE;
BEGIN
    BEGIN
        SELECT DEPT_NO INTO v_dept_no FROM DEPART WHERE DNOMBRE = v_dept_name;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('El departamento ' || v_dept_name || ' no existe.');
            RETURN;
    END;

    DBMS_OUTPUT.PUT_LINE('NOMBRE DE DEPARTAMENTO: ' || v_dept_name);
    DBMS_OUTPUT.PUT_LINE('EMPNO     APELLIDO     SALARIO      FECHA_ALTA      COMISION  SALARIO+COMISION');
    DBMS_OUTPUT.PUT_LINE('-------  -----------  ------------ ---------------  --------  ----------------');

    OPEN c_emple;
    LOOP
        FETCH c_emple INTO r_emple;
        EXIT WHEN c_emple%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(RPAD(TO_CHAR(r_emple.EMP_NO), 10) || RPAD(r_emple.APELLIDO, 14) || 
                             RPAD(TO_CHAR(r_emple.SALARIO), 14) || RPAD(TO_CHAR(r_emple.FECHA_ALT, 'DD/MM/YYYY'), 15) || 
                             RPAD(NVL(TO_CHAR(r_emple.COMISION), ' '), 10) || TO_CHAR(r_emple.SAL_COM));
                             
        v_total_sal := v_total_sal + r_emple.SALARIO;
        v_total_sal_com := v_total_sal_com + r_emple.SAL_COM;
    END LOOP;
    CLOSE c_emple;

    DBMS_OUTPUT.PUT_LINE('TOTAL SALARIO: ' || TO_CHAR(v_total_sal));
    DBMS_OUTPUT.PUT_LINE('TOTAL SALARIO+comision: ' || TO_CHAR(v_total_sal_com));
END;
/

