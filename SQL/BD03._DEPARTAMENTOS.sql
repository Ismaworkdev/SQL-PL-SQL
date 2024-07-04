DROP TABLE departamentos CASCADE CONSTRAINTS;

DROP TABLE emp_proy CASCADE CONSTRAINTS;

DROP TABLE emplea2 CASCADE CONSTRAINTS;

DROP TABLE proyectos CASCADE CONSTRAINTS;

CREATE TABLE departamentos (
    dpto_cod        NUMBER(5) NOT NULL,
    nombre_dpto     NVARCHAR2(25) NOT NULL,
    presupuesto     NUMBER(7,2),
    dni_jefe_dpto   NUMBER(8) NOT NULL
);

ALTER TABLE departamentos ADD CONSTRAINT pk_departamentos PRIMARY KEY ( dpto_cod );

/* DEPARTAMENTOS */ 
INSERT INTO DEPARTAMENTOS VALUES( 1, 'SISTEMAS', 12500, 12345); 
INSERT INTO DEPARTAMENTOS VALUES( 2, 'SEGURIDAD', 9000, 22222); 
INSERT INTO DEPARTAMENTOS VALUES( 3, 'SOFTWARE', 15000, 88888); 
INSERT INTO DEPARTAMENTOS VALUES( 4, 'ATENCION CLIENTE', 2500, 44444); 
INSERT INTO DEPARTAMENTOS VALUES( 5, 'DESARROLLO', 1000, 55555); 
INSERT INTO DEPARTAMENTOS VALUES( 6, 'MANTENIMIENTO', 1000, 12222);
INSERT INTO DEPARTAMENTOS VALUES( 7, 'DISEÑO WEB', 5000, 66666); 
INSERT INTO DEPARTAMENTOS VALUES( 8, 'HARDWARE', 15500, 17777); 
INSERT INTO DEPARTAMENTOS VALUES( 9, 'ADMINISTRACION', 10000, 15555);

CREATE TABLE emp_proy (
    emplea2_dni        NUMBER(8) NOT NULL,
    proyectos_cod_proy   NUMBER(5) NOT NULL,
    puesto               NVARCHAR2(40) NOT NULL
);

ALTER TABLE emp_proy ADD CONSTRAINT emp_proy_pk PRIMARY KEY ( emplea2_dni,proyectos_cod_proy );

INSERT INTO EMP_PROY VALUES( 12345, 1,'JEFE DE PROYECTO');
INSERT INTO EMP_PROY VALUES( 22222, 1,'ADMINISTRADOR DE SISTEMAS');
INSERT INTO EMP_PROY VALUES( 33333, 1,'MONTAJE DE SERVIDORES');
INSERT INTO EMP_PROY VALUES( 88888, 2,'JEFE DE PROYECTO');
INSERT INTO EMP_PROY VALUES( 99999, 2,'DISEÑADOR DEL SISTEMA SEGURIDAD ACTIVA');
INSERT INTO EMP_PROY VALUES( 44444, 2,'DISEÑADOR SISTEMA SEGURIDAD PASIVA');
INSERT INTO EMP_PROY VALUES( 55555, 2,'ESTUDIO DE REQUERIMINTOS Y REQUISITOS');
INSERT INTO EMP_PROY VALUES( 22222, 3,'JEFE DE PROYECTO');
INSERT INTO EMP_PROY VALUES( 66666, 3,'INSTALACION HARDWARE');
INSERT INTO EMP_PROY VALUES( 77777, 3,'INSTALACION SOFWARE');
INSERT INTO EMP_PROY VALUES( 88888, 4,'JEFE DE PROYECTO');
INSERT INTO EMP_PROY VALUES( 99999, 4,'ANALISIS DE REQUISITOS');
INSERT INTO EMP_PROY VALUES( 12222, 4,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 13333, 4,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 14444, 4,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 77777, 4,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 66666, 4,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 55555, 4,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 44444, 4,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 33333, 4,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 88888, 5,'JEFE DE PROYECTO');
INSERT INTO EMP_PROY VALUES( 12345, 5,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 12222, 5,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 13333, 5,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 14444, 5,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 22222, 6,'JEFE DE PROYECTO');
INSERT INTO EMP_PROY VALUES( 12345, 6,'MONTAJE DE LA RED');
INSERT INTO EMP_PROY VALUES( 12345, 7,'JEFE DE PROYECTO');
INSERT INTO EMP_PROY VALUES( 33333, 7,'ANALISIS DE REQUISISTOS');
INSERT INTO EMP_PROY VALUES( 44444, 7,'INSTALACION HARDWARE');
INSERT INTO EMP_PROY VALUES( 55555, 7,'INSTALACION HARDWARE');
INSERT INTO EMP_PROY VALUES( 12222, 7,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 13333, 7,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 14444, 7,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 55555, 8,'INSTALACION HARDWARE');
INSERT INTO EMP_PROY VALUES( 12222, 8,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 13333, 8,'DESARROLLADOR');
INSERT INTO EMP_PROY VALUES( 14444, 8,'DESARROLLADOR');

CREATE TABLE emplea2 (
    dni          NUMBER(8) NOT NULL,
    nombre       NVARCHAR2(25) NOT NULL,
    apellido1    NVARCHAR2(25) NOT NULL,
    apellido2    NVARCHAR2(25),
    salario      NUMBER(7,2),
    direcc       NVARCHAR2(35),
    poblacion    NVARCHAR2(25),
    provincia    NVARCHAR2(25),
    cod_postal   NVARCHAR2(5),
    sexo         CHAR(1),
    fecha_inicio DATE,
    fecha_nac    DATE,
	dpto_cod     NUMBER(5) NOT NULL
);

ALTER TABLE emplea2 ADD CONSTRAINT ck_sexo CHECK (
    sexo IN (
        'H','M'
    )
);

ALTER TABLE emplea2 ADD CONSTRAINT pk_emplea2 PRIMARY KEY ( dni );

ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY'; 
/* emplea2 */ 

INSERT INTO emplea2 VALUES( 12345,  'PABLO JOSE', 'MERCE',    'LOPEZ',  1500, 'C  SOL,1',                     'CADIZ',                'CADIZ',     '11000', 'H', TO_DATE('10/01/2018'), TO_DATE('05/01/1984'),1);
INSERT INTO emplea2 VALUES( 22222,  'INES',       'ROSAL',    'LOPEZ',  2500, 'C  FIDEL MARTIN INES,48',      'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('11/02/2005'), TO_DATE('11/03/1967'),2);
INSERT INTO emplea2 VALUES( 33333,  'PILAR',      'PEREZ',    'ROLLAN', 1325, 'AV FRANCISCO AGUIRRE,102 2ºC', 'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('15/11/2016'), TO_DATE('02/08/1993'),1);
INSERT INTO emplea2 VALUES( 88888,  'CRISTINA',   'CARRASCO', 'CASAL',  900,  'C  FELIX DEL RIO,5',           'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('01/10/2016'), TO_DATE('03/02/1975'),3);
INSERT INTO emplea2 VALUES( 99999,  'TERESA',     'CORTES',   'TORRICO',1150, 'AV CULTURA,25',                'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('22/12/1999'), TO_DATE('10/09/1969'),2);
INSERT INTO emplea2 VALUES( 44444,  'PEDRO PABLO','LOPEZ',    'PEREZ',  2200, 'C  HONDA,1',                   'HUECAS',               'TOLEDO',    '45511', 'H', TO_DATE('30/01/2005'), TO_DATE('03/11/1985'),4);
INSERT INTO emplea2 VALUES( 55555,  'ANA',        'SANCHEZ',  'GARCIA', 2500, 'AV DEL OESTE,23',              'VILLAMANTA',           'MADRID',    '28051', 'M', TO_DATE('31/08/2012'), TO_DATE('25/12/1976'),5);
INSERT INTO emplea2 VALUES( 66666,  'MARIA',      'RODRIGUEZ','RIBERA', 1000, 'AV AMADO GRANELL MESADO,23',   'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('20/05/2014'), TO_DATE('22/03/1989'),7);
INSERT INTO emplea2 VALUES( 77777,  'PABLO',      'GOMEZ',    'ALEJO',  900,  'C  BERNARDINO VILLEGAS,1',     'OROPESA',              'TOLEDO',    '45560', 'H', TO_DATE('12/09/2015'), TO_DATE('05/01/1984'),3);
INSERT INTO emplea2 VALUES( 14444,  'MIGUEL',     'GOMEZ',    'INISTA', 1325, 'C  CRISTO DEL OLVIDO,8',       'FUENSALIDA',           'TOLEDO',    '45510', 'H', TO_DATE('10/03/2010'), TO_DATE('05/01/1984'),4);
INSERT INTO emplea2 VALUES( 12222,  'MARIA',      'GALAN',    'RODRIGO',2050, 'C  MARIA ZAMBRANO,48',         'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('15/10/2021'), TO_DATE('14/02/2000'),6); 
INSERT INTO emplea2 VALUES( 13333,  'LUZ MARIA',  'YELMO',    'CRUZ',   1830, 'AV ALEJANDRA SOLER,3 1ºA',     'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('28/09/2006'), TO_DATE('31/01/1985'),6);
INSERT INTO emplea2 VALUES( 15555,  'MARIA',      'GALAN',    'CASAL',  1325, 'C  TRES CRUCES,23',            'CADIZ',                'CADIZ',    '11000', 'M',  TO_DATE('03/03/2010'), TO_DATE('05/01/1990'),4);
INSERT INTO emplea2 VALUES( 16666,  'MIGUEL',     'PEREZ',    'TORRICO',2050, 'AV DE LA CONSTITUCION,48',     'NAVALCARNERO',         'MADRID',    '28600', 'H', TO_DATE('21/01/2023'), TO_DATE('14/02/1994'),7); 
INSERT INTO emplea2 VALUES( 17777,  'PEDRO JOSE', 'CORTES',   'CRUZ',   1830, 'C  CASTELLANAS,3 1ºA',         'CADIZ',                'CADIZ',     '11000', 'H', TO_DATE('28/02/2023'), TO_DATE('10/09/1995'),8);
INSERT INTO emplea2 VALUES( 18888,  'CRISTINA',   'CARRASCO', 'CASAL',  2000, 'C  SANTA SABINA,5',            'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('22/04/2014'), TO_DATE('03/02/1990'),3);


CREATE TABLE proyectos (
    cod_proy       NUMBER(5) NOT NULL,
    nombre         NVARCHAR2(50) NOT NULL,
    fecha_inicio   DATE NOT NULL,
    fecha_fin      DATE NOT NULL,
    descripcion    NVARCHAR2(500)
);

ALTER TABLE proyectos ADD CONSTRAINT proyectos_pk PRIMARY KEY ( cod_proy );

INSERT INTO PROYECTOS VALUES( 1, 'MONTAJE SERVIDORES',                   '05/01/2007', '01/04/2007','Montar los servidores para la empresa de construcción ENLADRILLADOS'); 
INSERT INTO PROYECTOS VALUES( 2, 'ESTUDIO SEGURIDAD PASIVA Y ACTIVA',    '20/04/2007', '30/06/2009','Estudio Seguridad Pasiva y Activa para la empresa de construcción ENLADRILLADOS'); 
INSERT INTO PROYECTOS VALUES( 3, 'INSTALACION DE SERVIDORES PROXY',      '01/02/2008', '05/02/2010','Instalación de serividor proxy para la asociación canina GUAGUAGUA'); 
INSERT INTO PROYECTOS VALUES( 4, 'DESARROLLO GESTION DE SERVICIOS VENTA','20/01/2009', '30/03/2013','Desarrollo aplicacion de gestion de ventas para tienda de paraguas NOCUELAGOTA'); 
INSERT INTO PROYECTOS VALUES( 5, 'CREACION PORTAL WEB',                  '10/10/2020', '30/10/2023','Creacion web optica BUENAVISTA'); 
INSERT INTO PROYECTOS VALUES( 6, 'INSTALACION RED',                      '20/01/2021', '30/03/2023','Instalación y puesta en funcionamiento de la red del servicio de atención al cliente de YOTEESCUCHO'); 
INSERT INTO PROYECTOS VALUES( 7, 'INSTALACION INTEGRAL DEL SERVICIOS Y SISTEMAS', '05/11/2022', '22/12/2014','Montaje e instalación de todos los servicios para la consulta odontologica QUEPIÑATA'); 
INSERT INTO PROYECTOS VALUES( 8, 'DESARROLLO PLATAFORMA ELEARNING',      '15/02/2018', '22/05/2024','Creación plataforma de aprendizaje para centro de formación MELOSETODO'); 

ALTER TABLE departamentos ADD CONSTRAINT departamentos_emplea2_fk FOREIGN KEY ( dni_jefe_dpto )
    REFERENCES emplea2 ( dni );

ALTER TABLE emp_proy ADD CONSTRAINT emp_fk FOREIGN KEY ( emplea2_dni )
    REFERENCES emplea2 ( dni );

ALTER TABLE emplea2 ADD CONSTRAINT emplea2_departamentos_fk FOREIGN KEY ( dpto_cod )
    REFERENCES departamentos ( dpto_cod );

ALTER TABLE emp_proy ADD CONSTRAINT proy_fk FOREIGN KEY ( proyectos_cod_proy )
    REFERENCES proyectos ( cod_proy );


--PARA REALIZAR LAS CONSULTAS DEBES UTILIZAR LA BASE DE DATOS BD03.





-- 1.Obtener el mayor de todos los salarios, el campo se llamará MAYOR SUELDO EN TOLEDO de la tabla de EMPLEADOS, de los empleados de la provincia de ‘TOLEDO’


SELECT MAX(SALARIO)  "Mayor sueldo en Toledo" 
FROM EMPLEADOS 
WHERE PROVINCIA LIKE 'TOLEDO';
--2.Obtener la POBLACION y el mayor de todos los salarios de cada población de la tabla de EMPLEADOS.

SELECT POBLACION ,MAX(SALARIO)
FROM EMPLEADOS
GROUP BY POBLACION;


--3.Obtener la PROVINCIA, la POBLACION y la media de salarios, con dos decimales de la cada provincia
--y población, que se llamará MEDIA POBLACIÓN de la tabla de EMPEADOS ordenado por MEDIA POBLACIÓN. 

SELECT PROVINCIA, POBLACION, ROUND(AVG(SALARIO),2) AS MEDIA_POBLACION
FROM EMPLEADOS
GROUP BY PROVINCIA, POBLACION
ORDER BY MEDIA_POBLACION DESC;

--5. Obtener la POBLACION y el menor salario de cada población, de aquellos empleados que vivan en la provincia de Toledo, ordenados por población.

SELECT POBLACION , MIN(SALARIO) 
FROM EMPLEADOS
WHERE PROVINCIA LIKE 'TOLEDO'
GROUP BY POBLACION;

--6. Obtener la DEPARTAMENTO y la media de sueldos por departamentos, con dos decimales, de la tabla de EMPLEDOS, que tengan unos apellidos con una longitud mayor a 10 caracteres. Ordenado por la media de sueldos
 
SELECT DPTO_COD, ROUND(AVG(SALARIO), 2)AS MEDIA_SUELDOS
FROM EMPLEADOS
WHERE LENGTH(APELLIDO1 || APELLIDO2) > 10
GROUP BY DPTO_COD
ORDER BY MEDIA_SUELDOS DESC;


--7. Obtener el DEPARTAMENTO, la media de sueldos por departamento y el número de trabajadores de cada departamento, de la tabla de EMPLEADOS, de aquellos departamentos que tengan algún
--empleado y la media de sueldos sea menor a 1550€. Ordenado por la media descendentemente. 

SELECT DPTO_COD, ROUND(AVG(SALARIO), 2) AS MEDIA_SUELDOS, COUNT(*) AS NUM_TRABAJADORES
FROM EMPLEADOS
GROUP BY DPTO_COD
HAVING COUNT(*) > 0 AND AVG(SALARIO) < 1550
ORDER BY MEDIA_SUELDOS DESC;

--8 Obtener el mayor salario, el menor salario, la suma de los salarios, cuantos salarios hay y la media de salarios de los empleados de Toledo, que pertenezcan al departamento 1. 
SELECT MAX(SALARIO) AS MAXIMO, MIN(SALARIO) AS MINIMO, SUM(SALARIO) AS SUMA, COUNT(SALARIO) AS CUANTOS, AVG(SALARIO) AS MEDIA
FROM EMPLEADOS
WHERE PROVINCIA LIKE 'TOLEDO' AND DPTO_COD = 1
GROUP BY SALARIO;

--9. Obtener el POBLACION, el mayor de los salarios de la población y el menor de los salarios de la
--población, de la tabla de EMPLEADOS, de las poblaciones de Toledo, que tengan algún empleado. Ordenador del salario más bajo, al salario más alto. 

SELECT POBLACION , MAX(SALARIO), MIN(SALARIO)
FROM EMPLEADOS
WHERE PROVINCIA LIKE 'TOLEDO'  
GROUP BY POBLACION
HAVING COUNT(*)<=1
ORDER BY MAX(SALARIO) ASC;


--10. Obtener el APELLIDO1, el APELLIDOS2 y el NOMBRE todo en un campo, separando por una coma los
--apellidos del nombre que se llamará NOMBRE COMPLETO, la edad y el salario, de la tabla de EMPLEADOS, de los empleados que tengan más de 32 años, ordenado por edad. 
SELECT APELLIDO1 || ',' || APELLIDO2 || ',' || NOMBRE AS NOMBRE_COMPLETO,
TRUNC(MONTHS_BETWEEN(SYSDATE, TRUNC(FECHA_NAC))/12) AS EDAD, SALARIO
FROM EMPLEADOS
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, TRUNC(FECHA_NAC))/12) > 32
ORDER BY TRUNC(MONTHS_BETWEEN(SYSDATE, TRUNC(FECHA_NAC))/12);

--11. Obtener la PROVINCIA, la POBLACION, el SEXO, y el número de trabajadores, de la tabla de
--EMPLEDOS, que no pertenezcan al departamento 6 y vivan en Toledo. Para el resultado final solo se
--contarán a los empleados de sexo masculino. Ordenado por el número de trabajadores. 

SELECT PROVINCIA ,POBLACION , SEXO ,COUNT(*)  
FROM EMPLEADOS

WHERE DPTO_COD !=6 AND PROVINCIA LIKE 'TOLEDO' AND SEXO='H'
GROUP BY SEXO, PROVINCIA , POBLACION;





--PARA REALIZAR LAS CONSULTAS DEBES UTILIZAR LA BASE DE DATOS BD03_2.--


--1. Obtener los departamentos que tengan un presupuesto menor al presupuesto del departamento de sistemas. Respeta el formato de los campos del listado:

SELECT DPTO_COD, NOMBRE_DPTO, PRESUPUESTO
FROM DEPARTAMENTOS
WHERE PRESUPUESTO < (SELECT PRESUPUESTO FROM DEPARTAMENTOS WHERE NOMBRE_DPTO = 'SISTEMAS')
ORDER BY DPTO_COD;


--2. Obtener el nombre completo, la provincia y salario de los empleados de Toledo que estén trabajando
--el proyecto del DISEÑO DE LA PLATAFORMA ELEARNING. Respeta los formatos de salida. 

SELECT NOMBRE || ' ' || APELLIDO1 || ' ' || APELLIDO2 AS "NOMBRE COMPLETO"

, PROVINCIA, TO_CHAR(SALARIO,'999G99L') AS "SALARIO"
FROM EMPLEADOS
WHERE PROVINCIA LIKE 'TOLEDO'
AND DNI IN (
    SELECT EMPLEADOS_DNI
    FROM EMP_PROY WHERE PROYECTOS_COD_PROY IN (
        SELECT PROYECTOS_COD_PROY 
        FROM PROYECTOS 
        WHERE NOMBRE LIKE '%DESARROLLO PLATAFORMA%'
    )
)
ORDER BY SALARIO ASC;

--3. Obtener el nombre completo, separando nombre y apellidos por una coma, la edad, la fecha de
--nacimiento con el nombre del mes (escrito en letras mayúsculas), el salario redondeado a dos
--decimales de aquellos trabajadores que tengan un sueldo inferior a la media de los sueldos.


--4. Obtener nombre, apellidos, dirección y salario de los empleados q que tengan un salario igual al mayorsalario.

SELECT NOMBRE || ' ' || APELLIDO1 || ' ' || APELLIDO2 AS "NOMBRE COMPLETO" , DIRECC,SALARIO
FROM EMPLEADOS
WHERE SALARIO =(SELECT MAX(SALARIO)
FROM EMPLEADOS);

--5. Mostrar los datos de todos los departamentos si hay algún empleado de menos de 25 años en la empresa.

--MUY IMPORTANTE 
SELECT *
FROM DEPARTAMENTOS
WHERE EXISTS (
    SELECT 1
    FROM EMPLEADOS
    WHERE EMPLEADOS.DPTO_COD = DEPARTAMENTOS.DPTO_COD
    AND EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM FECHA_NAC) > 25
);


--6. Obtener el nombre completo, antigüedad en años y salario, de los empleados que tengan un sueldo
--que se encuentre entre la media de sueldos del departamento de ‘SEGURIDAD’ y la media de sueldos
--del departamento de ‘HARDWARE’.
--? NO podrás utilizar expresiones como: dpto_cod=1
--? Respeta los formatos de salida.





--7. Obtener el nombre, dirección y el salario de aquellos empleados que tengan un salario mayor, que el
--empleado que más cobra del departamento de ‘SOFTWARE’. Realizar la consulta de dos formas de
--tal formas: usando MAX(SALARIO) en una de las subconsultas y usando ALL. 

SELECT NOMBRE, DIRECC, SALARIO
FROM EMPLEADOS
WHERE SALARIO > (
    SELECT MAX(SALARIO)
    FROM DEPARTAMENTOS
    WHERE DPTO_COD = (SELECT DPTO_COD
    FROM DEPARTAMENTOS WHERE TRIM(NOMBRE_DPTO)LIKE 'SOFTWARE'))
    ORDER BY SALARIO;

--REVISAR 

--8. Obtener el nombre del departamento con la primera letra en mayúsculas, del departamento que
--tenga menor presupuesto y su jefe de departamento sea de la provincia de Toledo.
SELECT INITCAP(NOMBRE_DPTO) 
FROM DEPARTAMENTOS
WHERE PRESUPUESTO =(SELECT  MIN(PRESUPUESTO) FROM DEPARTAMENTOS )
ORDER BY NOMBRE_DPTO;

SELECT INITCAP(NOMBRE_DPTO) AS NOMBRE_MAYUSCULAS
FROM DEPARTAMENTOS
WHERE PRESUPUESTO = (SELECT MIN(PRESUPUESTO) FROM DEPARTAMENTOS)
ORDER BY NOMBRE_DPTO;


--9. Obtener los nombres, el presupuesto y el DNI del jefe de departamento,
--de aquellos departamentos
--que tengan menos de 2 trabajadores.

SELECT NOMBRE_DPTO , TO_CHAR(PRESUPUESTO, 'FM999999990.00L') AS PRESUPUESTO_FORMATEADO , DNI_JEFE_DPTO 
FROM DEPARTAMENTOS 
WHERE DPTO_COD IN(SELECT DPTO_COD FROM EMPLEA2 GROUP BY DPTO_COD HAVING COUNT(*)<2 );



--10. Obtener los nombres y el presupuesto de aquellos departamentos que tengan un presupuesto mayor
--a 5.000€, si hay algún departamento en el que trabaje un empleado que tenga un sueldo superior al
--mayor de todos los sueldos del departamento de ‘SISTEMAS’. 
SELECT D.NOMBRE_DPTO, TO_CHAR(D.PRESUPUESTO, 'FM999999990.00L') AS PRESUPUESTO_FORMATEADO
FROM DEPARTAMENTOS D
WHERE D.PRESUPUESTO > 5000
AND EXISTS (
    SELECT 1
    FROM EMPLEADOS E
    WHERE E.DPTO_COD = D.DPTO_COD
    AND E.SALARIO < (SELECT MAX(SALARIO) FROM EMPLEADOS WHERE DPTO_COD = 'SISTEMAS'))
;

--11. Obtener el nombre completo, la edad de los empleados en números romanos en minúsculas, la fecha
--de nacimiento, la fecha de nacimiento con el nombre del mes en minúsculas y la fecha de nacimiento
--con números romanos, el salario, la provincia en minúsculas y la dirección de aquellos empleados
--hombres que tengan menos de 30 años, que tengan un sueldo que se MAYOR que la media de sueldos
--de alguno de los departamentos

SELECT
    NOMBRE || ' ' || APELLIDO1 || ' ' ||APELLIDO2 AS NOMBRE_COMPLETO,
    TO_CHAR(MONTHS_BETWEEN(SYSDATE, FECHA_NAC) / 12, 'FM9999') AS EDAD_NUMEROS_ROMANOS,
    TO_CHAR(FECHA_NAC, 'DD "de" MONTH "de" YYYY', 'NLS_DATE_LANGUAGE=SPANISH') AS FECHA_NACIMIENTO_MES,
    TO_CHAR(FECHA_NAC, 'DD "de" MONTH "de" YYYY', 'NLS_DATE_LANGUAGE=SPANISH') AS ROMANOS,
    SALARIO,
    LOWER(PROVINCIA) AS PROVINCIA,
    DIRECC
FROM EMPLEA2
WHERE SEXO = 'H'
    AND TRUNC(MONTHS_BETWEEN(SYSDATE, FECHA_NAC) / 12) < 30
    AND SALARIO > (SELECT AVG(SALARIO) FROM EMPLEADOS );
    
    
    
  --  12. Obtener los nombres y apellidos de los trabajadores separados por guiones en mayúsculas, el sueldo
--con dos decimales, la edad, y la antigüedad en la empresa en días, de aquellos empleados que tengan
--un nombre compuesto, de una longitud de 10 o más caracteres, tenga una edad menor a la media de
--la empresa y tenga una antigüedad menor a la media de la empresa.
SELECT
    UPPER(NOMBRE || ' - ' || APELLIDO1 || ' - ' || APELLIDO2) AS NOMBRE_COMPLETO,
    TO_CHAR(SALARIO, 'FM999999990.00L') AS SALARIO_FORMATEADO,
    TRUNC(MONTHS_BETWEEN(SYSDATE, FECHA_NAC) / 12) AS EDAD,
    TRUNC(SYSDATE - FECHA_INICIO) AS ANTIGUEDAD_EN_DIAS
FROM EMPLEA2
WHERE LENGTH(NOMBRE || ' ' || APELLIDO1 || ' ' || APELLIDO2) > 10
    AND TRUNC(MONTHS_BETWEEN(SYSDATE, FECHA_NAC) / 12) < (SELECT AVG(TRUNC(MONTHS_BETWEEN(SYSDATE, FECHA_NAC) / 12)) FROM EMPLEA2)
    AND TRUNC(SYSDATE - FECHA_INICIO) < (SELECT AVG(TRUNC(SYSDATE - FECHA_INICIO)) FROM EMPLEA2);


 
--13. Obtener el nombre, la población y el sueldo de los empleados, con tres decimales, de tal forma que se
--les incrementará el sueldo un 10% a los empleados Talavera y se les decrementará un 5% a los
--empleados de Fuensalida y Oropesa, de aquellos empleados que hayan participado en algún proyecto
--como ‘DESARROLLADORES’ -- ESACTAMENTE NO SE QUE 
SELECT 
    NOMBRE || ' - ' || POBLACION || ' - ' || TO_CHAR(SALARIO * 1.10, 'FM999999990.000') AS INCREMENTO_SUELDO,
    CASE
        WHEN POBLACION IN ('Talavera', 'Fuensalida', 'Oropesa') THEN TO_CHAR(SALARIO * 0.95, 'FM999999990.000')
        ELSE TO_CHAR(SALARIO, 'FM999999990.000')
    END AS SUELDO_CON_DECIMALES
FROM EMPLEA2
WHERE EXISTS (
    SELECT 1
    FROM PROYECTOS
    WHERE EMPLEA2.DNI = EMP_PROY.EMPLEA2_DNI

);



