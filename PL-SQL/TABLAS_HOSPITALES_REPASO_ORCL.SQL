------------------------------------------------------------
-- ORACLE
-- CREACIÓN HOSPITALES-SALAS-PLANTILLA-DOCTORES-ENFERMO
DROP TABLE HOSPITAL Cascade constraints; 

CREATE TABLE HOSPITAL (
 HOSPITAL_COD    NUMBER(2) NOT NULL primary key,
 NOMBRE          VARCHAR2(12) ,
 DIRECCION       VARCHAR2(20) ,
 TELEFONO        VARCHAR2(8) ,
 NUM_CAMAS        NUMBER(4)
   );

INSERT INTO HOSPITAL VALUES (13,'Provincial', 'O Donell 50', '964-4264',502);
INSERT INTO HOSPITAL VALUES (18,'General', 'Atocha s/n', '595-3111',987);
INSERT INTO HOSPITAL VALUES (22,'La Paz', 'Castellana 1000', '923-5411',412);
INSERT INTO HOSPITAL VALUES (45,'San Carlos', 'Ciudad Universitaria', '597-1500',845);


DROP TABLE SALA Cascade constraints; 

CREATE TABLE SALA (
 HOSPITAL_COD    NUMBER(2) NOT NULL,
 SALA_COD        NUMBER(2) NOT NULL,
 NOMBRE          VARCHAR2(20) ,
 NUM_CAMA        NUMBER(4),
 constraint pk_sal_hosp primary key(HOSPITAL_COD,SALA_COD),
 constraint fk_sal_hosp foreign key(HOSPITAL_COD) references hospital
   );


INSERT INTO SALA VALUES (13,3, 'Cuidados intensivos',21);
INSERT INTO SALA VALUES (13,6, 'Psiquiátrico', 67);
INSERT INTO SALA VALUES (18,3, 'Cuidados intensivos',10);
INSERT INTO SALA VALUES (18,4, 'Cardiología', 53);
INSERT INTO SALA VALUES (22,1, 'Recuperación', 10);
INSERT INTO SALA VALUES (22,6, 'Psiquiátrico', 118);
INSERT INTO SALA VALUES (22,2, 'Maternidad', 34);
INSERT INTO SALA VALUES (45,4, 'Cardiología', 55);
INSERT INTO SALA VALUES (45,1, 'Recuperación', 13);
INSERT INTO SALA VALUES (45,2, 'Maternidad',24);

DROP TABLE PLANTILLA cascade constraints; 

CREATE TABLE PLANTILLA (
 HOSPITAL_COD  NUMBER(2) NOT NULL,
 SALA_COD  NUMBER(2),
 EMPLEADO_NO  NUMBER(4) primary key,
 APELLIDO CHAR(16),
 FUNCION CHAR(10),
 TURNO CHAR(1),
 SALARIO NUMBER (10),
  constraint fk_plan_hosp foreign key(HOSPITAL_COD,SALA_COD) references SALA
  );

INSERT INTO PLANTILLA VALUES (13,6,3754,'Diaz B.','Enfermera','T',2262);
INSERT INTO PLANTILLA VALUES (13,6,3106,'Hernández J.','Enfermero','T',2750);
INSERT INTO PLANTILLA VALUES (18,4,6357,'Karplus W.','Interno','T',3379);
INSERT INTO PLANTILLA VALUES (22,6,1009,'Higueras D.','Enfermera','T',2005);
INSERT INTO PLANTILLA VALUES (22,6,8422,'Bocina G.','Enfermero','M',1838);
INSERT INTO PLANTILLA VALUES (22,2,9901,'Nuñez C.','Interno','M',2210);
INSERT INTO PLANTILLA VALUES (22,1,6065,'Rivera G.','Enfermera','N',1626);
INSERT INTO PLANTILLA VALUES (22,1,7379,'Carlos R.','Enfermera','T',2119);
INSERT INTO PLANTILLA VALUES (45,4,1280,'Amigo R.','Interno','N',2210);
INSERT INTO PLANTILLA VALUES (45,1,8526,'Frank H.','Enfermero','T',2522);
INSERT INTO PLANTILLA VALUES (45,2,2526,'Petra H.','Enfermera','T',2522);
INSERT INTO PLANTILLA VALUES (45,2,3406,'Juana Mar.','Enfermera','T',2522);

-- ********* TABLAS ENFERMO Y DOCTOR

DROP TABLE DOCTOR cascade constraints; 

CREATE TABLE DOCTOR (
 HOSPITAL_COD  NUMBER(2) NOT NULL,
 DOCTOR_NO  NUMBER(3) NOT NULL primary key,
 APELLIDO CHAR(16),
 ESPECIALIDAD CHAR(16),
constraint fk_doct_hosp foreign key(HOSPITAL_COD) references hospital ) ;

INSERT INTO DOCTOR VALUES (13,435,'Lopez A.','Cardiología');
INSERT INTO DOCTOR VALUES (18,585,'Miller G.','Ginecología');
INSERT INTO DOCTOR VALUES (18,982,'Cajal R.','Cardiología');
INSERT INTO DOCTOR VALUES (22,453,'Galo D.','Pediatría');
INSERT INTO DOCTOR VALUES (22,398,'Best D.','Urología');
INSERT INTO DOCTOR VALUES (22,386,'Cabeza D.','Psiquiatría');
INSERT INTO DOCTOR VALUES (45,607,'Nino P.','Pediatría');
INSERT INTO DOCTOR VALUES (45,522,'Adams C.','Neurología');


DROP TABLE ENFERMO cascade constraints; 

CREATE TABLE ENFERMO (
 INSCRIPCION  NUMBER(5) NOT NULL primary key,
 APELLIDO  VARCHAR2(14), 
 DIRECCION  VARCHAR(20), 
 FECHA_NAC  DATE,
 S CHAR (1),
 NSS      NUMBER(9),
 HOSPITAL_COD    NUMBER(2),
 constraint fk_enf_hosp foreign key(HOSPITAL_COD) references hospital 
 );

ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';

INSERT INTO ENFERMO VALUES (10995,'Laguía M.','Goya, 20','16/05/1956','M',280862482,13);
INSERT INTO ENFERMO VALUES (18004,'Serrano V.','Alcala 12','21/05/1960','F',284991452,18);
INSERT INTO ENFERMO VALUES (14024,'Fernández M.','Recoletos 50','23/06/1967','F',321790059,13);
INSERT INTO ENFERMO VALUES (36658,'Domin S.','Mayor 71','01/01/1942','M',160654471,22);
INSERT INTO ENFERMO VALUES (38702,'Neal R.','Orense 11','18/06/1940','F',380010217,22);
INSERT INTO ENFERMO VALUES (39217,'Cervantes M.','Perón 38','29/02/1952','M',440294390,13);
INSERT INTO ENFERMO VALUES (59076,'Miller B.','Lopez de Hoyos 2','16/09/1945','F',311969044,22);
INSERT INTO ENFERMO VALUES (63827,'Ruiz P.','Esquerdo 103','26/12/1980','M',100973253,18);
INSERT INTO ENFERMO VALUES (64823,'Fraser A.','Soto 3','10/07/1980','F',285201776,18);
INSERT INTO ENFERMO VALUES (74835,'Benitez E.','Argentina 5','05/10/1957','M',154811767,18);
COMMIT;
ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YY';



--1) ¿Quiénes son las enfermeras y enfermeros que trabajan en turnos de tarde o 
--mañana?


SELECT APELLIDO ,FUNCION ,TURNO
FROM PLANTILLA
WHERE TURNO ='T' OR FUNCION ='Enfermero' AND FUNCION =' Enfermera';


--2) Haz un listado de las enfermeras que ganen entre 2000 y 2500 Euros.

SELECT APELLIDO ,FUNCION ,TURNO
FROM PLANTILLA
WHERE  FUNCION = 'Enfermera' AND
SALARIO BETWEEN 2000 AND 2500 ;


--3) Visualiza el sueldo al año de los enfermeros y las enfermeras.

SELECT APELLIDO ,FUNCION ,TURNO , TO_CHAR(SALARIO*12)
FROM PLANTILLA
WHERE  FUNCION = 'Enfermera' OR FUNCION = 'Enfermera'
;

--4) Mostrar, para todos los hospitales, el código de hospital, el nombre completo del 
--hospital y su nombre abreviado de tres letras (a esta columna la podemos llamar ABR). 
--Ordenar la recuperación por esta abreviatura.

SELECT HOSPITAL_COD,NOMBRE,SUBSTR(NOMBRE, 1, 3) AS ABR
FROM HOSPITAL
ORDER BY SUBSTR(NOMBRE, 1, 3) ;

--5) En la tabla DOCTOR otorgar a cardiología un código de 1, a Psiquiatría un código de 
--2, a Pediatría un código de 3 y a cualquier otra especialidad un código de 4. Recuperar 
--todos los doctores, su especialidad y el código asignado.

ALTER TABLE DOCTOR
ADD CODIGO NUMBER;

UPDATE DOCTOR
SET CODIGO =
    CASE
        WHEN ESPECIALIDAD = 'Cardiología' THEN 1
        WHEN ESPECIALIDAD = 'Psiquiatría' THEN 2
        WHEN ESPECIALIDAD = 'Pediatría' THEN 3
        ELSE 4
    END;


--6) Encontrar el salario medio de los internos.

SELECT AVG(SALARIO)
FROM PLANTILLA
WHERE FUNCION = 'Interno'
;

--7) Encontrar el salario más alto y el más bajo de la tabla de personal, así como la 
--diferencia entre los dos.
SELECT min(SALARIO) ,MAX(SALARIO),TO_NUMBER( MAX(SALARIO) -MIN(SALARIO)) AS DIFERENCIA
FROM PLANTILLA;

--8) Calcular el número de tareas distintas que hay, en total, en las salas 1 y 2 del hospital 
--22.
SELECT COUNT(NOMBRE) AS TAREAS
FROM SALA 
WHERE HOSPITAL_COD=22;

--9) Buscar qué turnos tienen más de dos personas realizando un trabajo concreto.
SELECT TURNO, FUNCION, COUNT(EMPLEADO_NO) AS NUM_PERSONAS
FROM PLANTILLA
GROUP BY TURNO, FUNCION
HAVING COUNT(EMPLEADO_NO) > 2;

--10) Buscar qué turnos tienen más de dos personas. 
SELECT TURNO, COUNT(EMPLEADO_NO) AS NUM_PERSONAS
FROM PLANTILLA
GROUP BY TURNO
HAVING COUNT(EMPLEADO_NO) > 2;

--11) Listar, a partir de las tablas al inicio expuestas, el nombre de cada empleado, su 
--trabajo y localización de su puesto de trabajo (el nombre del hospital y código de sala)

SELECT P.APELLIDO , P.FUNCION , H.NOMBRE, S.SALA_COD
FROM PLANTILLA P JOIN HOSPITAL H ON P.HOSPITAL_COD=H.HOSPITAL_COD
JOIN SALA S ON S.HOSPITAL_COD=H.HOSPITAL_COD;
--


--Utilizamos DISTINCT para asegurarnos de que los apellidos de los empleados se muestren solo una vez.
SELECT DISTINCT P.APELLIDO, P.FUNCION, H.NOMBRE AS NOMBRE_HOSPITAL, S.SALA_COD
FROM PLANTILLA P
JOIN HOSPITAL H ON P.HOSPITAL_COD = H.HOSPITAL_COD
JOIN SALA S ON P.SALA_COD = S.SALA_COD;


--12) Repetir la misma lista, excepto que en esta ocasión se obtendrá el nombre de la sala 
--y el código de hospital.

SELECT DISTINCT P.APELLIDO, P.FUNCION, H.HOSPITAL_COD AS NOMBRE_HOSPITAL, S.NOMBRE
FROM PLANTILLA P
JOIN HOSPITAL H ON P.HOSPITAL_COD = H.HOSPITAL_COD
JOIN SALA S ON P.SALA_COD = S.SALA_COD;


--13) Listar el nombre, la función, el turno y el salario de todos los empleados que tienen un 
--salario superior al salario más bajo del turno 'N'. Por favor ordenar el listado en orden 
--descendente de salarios.
SELECT DISTINCT APELLIDO ,FUNCION ,TURNO,SALARIO
FROM PLANTILLA
WHERE SALARIO >(SELECT MIN(SALARIO)
FROM PLANTILLA WHERE TURNO LIKE 'N')
ORDER BY SALARIO DESC;

--14) Listar el número de empleados por sala y hospital, sacar las salas que no tienen a 
--nadie.

SELECT COUNT(P.EMPLEADO_NO) AS NUM_PERSONAS, H.HOSPITAL_COD, S.SALA_COD, S.NOMBRE
FROM PLANTILLA P
JOIN HOSPITAL H ON P.HOSPITAL_COD = H.HOSPITAL_COD
JOIN SALA S ON S.HOSPITAL_COD = H.HOSPITAL_COD
GROUP BY H.HOSPITAL_COD, S.SALA_COD, S.NOMBRE
ORDER BY NUM_PERSONAS;

--15) Listar el número de enfermos que tiene cada hospital. Visualizar también los 
--hospitales que no tienen enfermos.

SELECT H.HOSPITAL_COD,H.NOMBRE,COUNT( E.APELLIDO)
FROM HOSPITAL H JOIN ENFERMO E ON E.HOSPITAL_COD=H.HOSPITAL_COD
GROUP BY H.HOSPITAL_COD,H.NOMBRE 
ORDER BY COUNT( E.APELLIDO)
;
--LEFT MUESTRA AQUELLOS QUE NO NISIQUIERA TIENE ENFERMOS LO PONE 0 
SELECT H.HOSPITAL_COD, H.NOMBRE, COUNT(E.APELLIDO) AS NUM_ENFERMOS
FROM HOSPITAL H
LEFT JOIN ENFERMO E ON E.HOSPITAL_COD = H.HOSPITAL_COD
GROUP BY H.HOSPITAL_COD, H.NOMBRE
ORDER BY NUM_ENFERMOS DESC;



--16) Listar las salas y los empleados que tiene cada una. Sacar también las salas que no 
--tenga a nadie.

SELECT  DISTINCT P.APELLIDO , S.NOMBRE 
FROM SALA S 
LEFT JOIN PLANTILLA P ON P.HOSPITAL_COD = S.HOSPITAL_COD
;

SELECT S.NOMBRE AS NOMBRE_SALA, P.APELLIDO AS NOMBRE_EMPLEADO
FROM SALA S
LEFT JOIN PLANTILLA P ON S.HOSPITAL_COD = P.HOSPITAL_COD
ORDER BY S.NOMBRE;

--17) Visualizar por cada hospital y sala el empleado con más salario.
--código_sala, nombre de sala ,Cod_hospital, nombre, apellido, cod_empleado

 
SELECT H.NOMBRE AS NOMBRE_HOSPITAL, MAX(P.SALARIO) AS SALARIO_MAXIMO
FROM PLANTILLA P
JOIN HOSPITAL H ON H.HOSPITAL_COD = P.HOSPITAL_COD
GROUP BY H.NOMBRE;


--18) Visualizar las salas compartidas por más de un hospital.

SELECT S.NOMBRE ,H.HOSPITAL_COD
FROM SALA S JOIN HOSPITAL H ON S.HOSPITAL_COD =H.HOSPITAL_COD
;