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
INSERT INTO EMPLE VALUES (7934,'MU�OZ','EMPLEADO',7782,'23/01/1992',
                        1690,NULL,10);

COMMIT;

CREATE OR REPLACE TRIGGER nombre_del_trigger  -- Se define el nombre del trigger
BEFORE INSERT                                 -- Se especifica el momento del disparo (BEFORE, AFTER) y la acci�n (INSERT, UPDATE, DELETE)
ON nombre_de_la_tabla                         -- Se especifica la tabla sobre la que act�a el trigger
FOR EACH ROW                                  -- Se indica que el trigger se disparar� para cada fila afectada por la acci�n
DECLARE
    -- Aqu� puedes declarar las variables que necesites
BEGIN
    -- Aqu� va la l�gica del trigger. Puedes acceder a la fila nueva con :NEW y a la fila antigua con :OLD
    -- Por ejemplo, si quieres evitar que se inserten valores nulos en una columna espec�fica, podr�as hacer algo como esto:
    IF :NEW.nombre_de_la_columna IS NULL THEN
        RAISE_APPLICATION_ERROR(-20000, 'No se permiten valores nulos en la columna nombre_de_la_columna');
    END IF;
--EXCEPTION
 --   WHEN OTHERS THEN
    -- Aqu� puedes manejar cualquier excepci�n que ocurra dentro del trigger
END;




--TRIGGERS 
--1.Crea un disparador que se ejecute al insertar en DEPART, debe comprobar que el DEPT_NO sea mayor de 0, si no es as� hay que hacer que no se inserte el registro en la tabla.

CREATE OR REPLACE TRIGGER INSERTAR_DEPART
BEFORE INSERT
ON DEPART FOR EACH ROW 
DECLARE
BEGIN
IF :NEW.DEPT_NO <0 THEN
        RAISE_APPLICATION_ERROR(-20000, 'DEPT_NO ES MENOR QUE 0 ');
END IF;
END;

INSERT INTO DEPART VALUES(-44,'LOL','LOL');

--2.Crear un trigger que se ejecute cuando se inserte en emple, hay que comprobar que el oficio sea uno de los que aparece en la tabla EMPLE.
--Abortar el trigger si no es un oficio de los que hay en la tabla 
CREATE OR REPLACE TRIGGER INSERTAR_DEPART_DEPART
BEFORE INSERT
ON EMPLE FOR EACH ROW 
DECLARE
    v_oficio EMPLE.OFICIO%TYPE;
BEGIN
    SELECT OFICIO INTO v_oficio FROM EMPLE WHERE OFICIO = :NEW.OFICIO;

    IF v_oficio IS NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'OFICIO NO NO NO  ');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'OFICIO NO NO NO  ');
END;


INSERT INTO EMPLE (EMP_NO, APELLIDO, OFICIO, DIR, FECHA_ALT, SALARIO, COMISION, DEPT_NO)
VALUES (1, 'Garcia', 'Ingeniero', 1234, SYSDATE, 3000, 500, 10);


--3.Crear un trigger que se ejecute cuando se borre un empleado con el oficio �PRESIDENTE�. En ese caso hacer que no se ejecute el borrado.

CREATE OR REPLACE TRIGGER NO_BORRAR_EMPELADO
BEFORE DELETE
ON EMPLE FOR EACH ROW 
DECLARE
    v_oficio EMPLE.OFICIO%TYPE;
BEGIN
  

    IF :OLD.OFICIO LIKE 'PRESIDENTE' THEN
        RAISE_APPLICATION_ERROR(-20002, 'ESTE PRESIDENTE NO NO NO  NO NO NON  ');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'OFICIO NO NO NO  ');
END;

DELETE FROM EMPLE
WHERE OFICIO LIKE 'PRESIDENTE';



--4.Escribir un disparador que haga fallar cualquier operaci�n de modificaci�n del apellido o del n�mero de un empleado, o que suponga una subida de sueldo superior al 10% en la tabla EMPLE

CREATE OR REPLACE TRIGGER APELLID_SUELDO
BEFORE DELETE OR INSERT OR UPDATE
ON EMPLE FOR EACH ROW 
DECLARE
    VARIABLE_APELLIDO EMPLE.APELLIDO%TYPE;
    VARIABLE_SUELDO EMPLE.SALARIO%TYPE;
BEGIN
      SELECT APELLIDO INTO VARIABLE_APELLIDO FROM EMPLE WHERE APELLIDO = :OLD.APELLIDO;
   SELECT APELLIDO INTO VARIABLE_APELLIDO FROM EMPLE WHERE APELLIDO = :NEW.APELLIDO;
      SELECT SALARIO INTO VARIABLE_SUELDO FROM EMPLE WHERE SALARIO  = :NEW.APELLIDO;

  IF :OLD.APELLIDO = 'SANCHEZ' OR :NEW.APELLIDO = 'SANCHEZ' THEN
        RAISE_APPLICATION_ERROR(-20003, 'ESTE APELLIDO NO NO NO   ');
    END IF;
    
       IF :NEW.SALARIO  <= :OLD.SALARIO *1.10 THEN
        RAISE_APPLICATION_ERROR(-20004, 'NO SE PERMITE SUBIR EL SALARIO MAS DE 10%   ');
    END IF;
    
  
    
    
    
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
         RAISE_APPLICATION_ERROR(-20003, 'ESTE APELLIDO NO NO NO   ');
        RAISE_APPLICATION_ERROR(-20004, 'NO SE PERMITE SUBIR EL SALARIO MAS DE 10%   ');
END;
--PROBLEMA DE MUTACION AYUDA PROFE 
UPDATE EMPLE
SET SALARIO = SALARIO*20
WHERE APELLIDO = 'SANCHEZ';




--5.A�adir una columna a la tabla depart, con nombre num_emple. Esta columna debe almacenar el n�mero de empleados de la tabla emple de ese departamento. Se trata de mantener actualizado el n�mero de empleados de la tabla emple que son del departamento. El trigger se va a disparar cuando insertemos, borremos o modifiquemos en la tabla emple.
--NO SE ME ACTUALIZA AYUDA PROFE 
ALTER TABLE depart
ADD (num_emple NUMBER);

CREATE OR REPLACE TRIGGER actualizar_num_emple
AFTER INSERT OR DELETE OR UPDATE ON emple
FOR EACH ROW
DECLARE
 VARIABLE_EMPLE EMPLE.DEPT_NO%TYPE;
BEGIN
 IF INSERTING OR DELETING THEN
  SELECT DEPT_NO INTO VARIABLE_EMPLE FROM EMPLE WHERE DEPT_NO  = :NEW.DEPT_NO;
  UPDATE depart
   SET num_emple = num_emple +1
   WHERE DEPT_NO = VARIABLE_EMPLE;
 ELSIF UPDATING THEN
  SELECT DEPT_NO INTO VARIABLE_EMPLE FROM EMPLE WHERE DEPT_NO  = :OLD.DEPT_NO;
  UPDATE depart
   SET num_emple = num_emple -1
   WHERE DEPT_NO = VARIABLE_EMPLE;
   
  SELECT DEPT_NO INTO VARIABLE_EMPLE FROM EMPLE WHERE DEPT_NO  = :NEW.DEPT_NO;
  UPDATE depart
   SET num_emple = num_emple +1
   WHERE DEPT_NO = VARIABLE_EMPLE;
 END IF;
EXCEPTION
   WHEN OTHERS THEN
      NULL;
END;



INSERT INTO EMPLE VALUES (74,'HOLS','EMPLEADO',332,sysdate,
                        46,NULL,30);
ALTER TRIGGER APELLID_SUELDO DISABLE;

--6.Escribe un trigger que permita auditar de la tabla EMPLE, las operaciones de inserci�n y borrado. 
--Para ello se crear� la tabla AUDITAEMPLE con una columna de 200 caracteres.
--Cuando se produzca el evento insertar la fecha, la hora, el n�mero de empleado, el apellido y la operaci�n realizada, INSERCI�N o BORRADO.	

CREATE TABLE AUDITAEMPLE (
  AUDIT_INFO VARCHAR2(200)
);


CREATE OR REPLACE TRIGGER AUDITAR_EMPLE
AFTER INSERT OR DELETE ON EMPLE
FOR EACH ROW
DECLARE
  v_operation VARCHAR2(50);
BEGIN
  IF INSERTING THEN
    v_operation := 'INSERCI�N';
  ELSIF DELETING THEN
    v_operation := 'BORRADO';
  END IF;

  INSERT INTO AUDITAEMPLE (AUDIT_INFO)
  VALUES (TO_CHAR(SYSDATE, 'DD-MON-YYYY HH24:MI:SS') || ' - ' || :NEW.EMP_NO || ' - ' || :NEW.APELLIDO || ' - ' || v_operation);
EXCEPTION
  WHEN OTHERS THEN
     
    NULL;
END;


--7.Realizar un trigger para controlar las modificaciones en la tabla EMPLE. Si ocurre una modificaci�n se grabar� en audita_emple, la fecha y hora, el n�mero de empleado, el apellido, la operaci�n de MODIFICACI�N, y adem�s el valor anterior y nuevo de las columnas modificadas, s�lo de las columnas modificadas.

CREATE OR REPLACE TRIGGER AUDITAR_EMPLE
AFTER INSERT OR DELETE ON EMPLE
FOR EACH ROW
DECLARE

  v_operation VARCHAR2(50);
BEGIN
  IF INSERTING THEN
    v_operation := 'INSERCI�N';
  ELSIF DELETING THEN
    v_operation := 'BORRADO';
    ELSIF UPDATING THEN
       v_operation := 'ACTUALIZACION';
  END IF;

  INSERT INTO AUDITAEMPLE (AUDIT_INFO)
  VALUES (SYSDATE || ' - ' || :NEW.EMP_NO || ' - ' || :NEW.APELLIDO || ' - ' || v_operation);
EXCEPTION
  WHEN OTHERS THEN
     
    NULL;
END;








