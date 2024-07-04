
DROP TABLE departamentos CASCADE CONSTRAINTS;

DROP TABLE emp_proy CASCADE CONSTRAINTS;

DROP TABLE empleados CASCADE CONSTRAINTS;

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
INSERT INTO DEPARTAMENTOS VALUES( 7, 'DISEÃ‘O WEB', 5000, 66666); 
INSERT INTO DEPARTAMENTOS VALUES( 8, 'HARDWARE', 15500, 17777); 
INSERT INTO DEPARTAMENTOS VALUES( 9, 'ADMINISTRACION', 10000, 15555);

CREATE TABLE emp_proy (
    empleados_dni        NUMBER(8) NOT NULL,
    proyectos_cod_proy   NUMBER(5) NOT NULL,
    puesto               NVARCHAR2(40) NOT NULL
);

ALTER TABLE emp_proy ADD CONSTRAINT emp_proy_pk PRIMARY KEY ( empleados_dni,proyectos_cod_proy );

INSERT INTO EMP_PROY VALUES( 12345, 1,'JEFE DE PROYECTO');
INSERT INTO EMP_PROY VALUES( 22222, 1,'ADMINISTRADOR DE SISTEMAS');
INSERT INTO EMP_PROY VALUES( 33333, 1,'MONTAJE DE SERVIDORES');
INSERT INTO EMP_PROY VALUES( 88888, 2,'JEFE DE PROYECTO');
INSERT INTO EMP_PROY VALUES( 99999, 2,'DISEÃ‘ADOR DEL SISTEMA SEGURIDAD ACTIVA');
INSERT INTO EMP_PROY VALUES( 44444, 2,'DISEÃ‘ADOR SISTEMA SEGURIDAD PASIVA');
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

CREATE TABLE empleados (
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

ALTER TABLE empleados ADD CONSTRAINT ck_sexo CHECK (
    sexo IN (
        'H','M'
    )
);

ALTER TABLE empleados ADD CONSTRAINT pk_empleados PRIMARY KEY ( dni );

ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY'; 
/* EMPLEADOS */ 

INSERT INTO EMPLEADOS VALUES( 12345,  'PABLO JOSE', 'MERCE',    'LOPEZ',  1500, 'C  SOL,1',                     'CADIZ',                'CADIZ',     '11000', 'H', TO_DATE('10/01/2018'), TO_DATE('05/01/1984'),1);
INSERT INTO EMPLEADOS VALUES( 22222,  'INES',       'ROSAL',    'LOPEZ',  2500, 'C  FIDEL MARTIN INES,48',      'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('11/02/2005'), TO_DATE('11/03/1967'),2);
INSERT INTO EMPLEADOS VALUES( 33333,  'PILAR',      'PEREZ',    'ROLLAN', 1325, 'AV FRANCISCO AGUIRRE,102 2ÂºC', 'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('15/11/2016'), TO_DATE('02/08/1993'),1);
INSERT INTO EMPLEADOS VALUES( 88888,  'CRISTINA',   'CARRASCO', 'CASAL',  900,  'C  FELIX DEL RIO,5',           'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('01/10/2016'), TO_DATE('03/02/1975'),3);
INSERT INTO EMPLEADOS VALUES( 99999,  'TERESA',     'CORTES',   'TORRICO',1150, 'AV CULTURA,25',                'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('22/12/1999'), TO_DATE('10/09/1969'),2);
INSERT INTO EMPLEADOS VALUES( 44444,  'PEDRO PABLO','LOPEZ',    'PEREZ',  2200, 'C  HONDA,1',                   'HUECAS',               'TOLEDO',    '45511', 'H', TO_DATE('30/01/2005'), TO_DATE('03/11/1985'),4);
INSERT INTO EMPLEADOS VALUES( 55555,  'ANA',        'SANCHEZ',  'GARCIA', 2500, 'AV DEL OESTE,23',              'VILLAMANTA',           'MADRID',    '28051', 'M', TO_DATE('31/08/2012'), TO_DATE('25/12/1976'),5);
INSERT INTO EMPLEADOS VALUES( 66666,  'MARIA',      'RODRIGUEZ','RIBERA', 1000, 'AV AMADO GRANELL MESADO,23',   'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('20/05/2014'), TO_DATE('22/03/1989'),7);
INSERT INTO EMPLEADOS VALUES( 77777,  'PABLO',      'GOMEZ',    'ALEJO',  900,  'C  BERNARDINO VILLEGAS,1',     'OROPESA',              'TOLEDO',    '45560', 'H', TO_DATE('12/09/2015'), TO_DATE('05/01/1984'),3);
INSERT INTO EMPLEADOS VALUES( 14444,  'MIGUEL',     'GOMEZ',    'INISTA', 1325, 'C  CRISTO DEL OLVIDO,8',       'FUENSALIDA',           'TOLEDO',    '45510', 'H', TO_DATE('10/03/2010'), TO_DATE('05/01/1984'),4);
INSERT INTO EMPLEADOS VALUES( 12222,  'MARIA',      'GALAN',    'RODRIGO',2050, 'C  MARIA ZAMBRANO,48',         'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('15/10/2008'), TO_DATE('14/02/1957'),6); 
INSERT INTO EMPLEADOS VALUES( 13333,  'LUZ MARIA',  'YELMO',    'CRUZ',   1830, 'AV ALEJANDRA SOLER,3 1ÂºA',     'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('28/09/2006'), TO_DATE('31/01/1985'),6);
INSERT INTO EMPLEADOS VALUES( 15555,  'MARIA',      'GALAN',    'CASAL',  1325, 'C  TRES CRUCES,23',            'CADIZ',                'CADIZ',    '11000', 'M',  TO_DATE('03/03/2010'), TO_DATE('05/01/1990'),4);
INSERT INTO EMPLEADOS VALUES( 16666,  'MIGUEL',     'PEREZ',    'TORRICO',2050, 'AV DE LA CONSTITUCION,48',     'NAVALCARNERO',         'MADRID',    '28600', 'H', TO_DATE('21/01/2008'), TO_DATE('14/02/1990'),7); 
INSERT INTO EMPLEADOS VALUES( 17777,  'PEDRO JOSE', 'CORTES',   'CRUZ',   1830, 'C  CASTELLANAS,3 1ÂºA',         'CADIZ',                'CADIZ',     '11000', 'H', TO_DATE('28/02/2010'), TO_DATE('10/09/1979'),8);
INSERT INTO EMPLEADOS VALUES( 18888,  'CRISTINA',   'CARRASCO', 'CASAL',  2000, 'C  SANTA SABINA,5',            'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('22/04/2014'), TO_DATE('03/02/1990'),3);


CREATE TABLE proyectos (
    cod_proy       NUMBER(5) NOT NULL,
    nombre         NVARCHAR2(50) NOT NULL,
    fecha_inicio   DATE NOT NULL,
    fecha_fin      DATE NOT NULL,
    descripcion    NVARCHAR2(500)
);

ALTER TABLE proyectos ADD CONSTRAINT proyectos_pk PRIMARY KEY ( cod_proy );

INSERT INTO PROYECTOS VALUES( 1, 'MONTAJE SERVIDORES',                   '05/01/2012', '01/04/2012','Montar los servidores para la empresa de construcciÃ³n ENLADRILLADOS'); 
INSERT INTO PROYECTOS VALUES( 2, 'ESTUDIO SEGURIDAD PASIVA Y ACTIVA',    '20/04/2012', '30/06/2012','Estudio Seguridad Pasiva y Activa para la empresa de construcciÃ³n ENLADRILLADOS'); 
INSERT INTO PROYECTOS VALUES( 3, 'INSTALACION DE SERVIDORES PROXY',      '01/02/2013', '05/02/2013','InstalaciÃ³n de serividor proxy para la asociaciÃ³n canina GUAGUAGUA'); 
INSERT INTO PROYECTOS VALUES( 4, 'DESARROLLO GESTION DE SERVICIOS VENTA','20/01/2013', '30/03/2013','Desarrollo aplicacion de gestion de ventas para tienda de paraguas NOCUELAGOTA'); 
INSERT INTO PROYECTOS VALUES( 5, 'CREACION PORTAL WEB',                  '10/10/2013', '30/10/2013','Creacion web optica BUENAVISTA'); 
INSERT INTO PROYECTOS VALUES( 6, 'INSTALACION RED',                      '20/01/2013', '30/03/2013','InstalaciÃ³n y puesta en funcionamiento de la red del servicio de atenciÃ³n al cliente de YOTEESCUCHO'); 
INSERT INTO PROYECTOS VALUES( 7, 'INSTALACION INTEGRAL DEL SERVICIOS Y SISTEMAS', '05/11/2013', '22/12/2013','Montaje e instalaciÃ³n de todos los servicios para la consulta odontologica QUEPIÃ‘ATA'); 
INSERT INTO PROYECTOS VALUES( 8, 'DESARROLLO PLATAFORMA ELEARNING',      '15/02/2018', '22/05/2018','CreaciÃ³n plataforma de aprendizaje para centro de formaciÃ³n MELOSETODO'); 

ALTER TABLE departamentos ADD CONSTRAINT departamentos_empleados_fk FOREIGN KEY ( dni_jefe_dpto )
    REFERENCES empleados ( dni );

ALTER TABLE emp_proy ADD CONSTRAINT emp_fk FOREIGN KEY ( empleados_dni )
    REFERENCES empleados ( dni );

ALTER TABLE empleados ADD CONSTRAINT empleados_departamentos_fk FOREIGN KEY ( dpto_cod )
    REFERENCES departamentos ( dpto_cod );

ALTER TABLE emp_proy ADD CONSTRAINT proy_fk FOREIGN KEY ( proyectos_cod_proy )
    REFERENCES proyectos ( cod_proy );

--01._Ejercicio01._Agrupamientos


--Obtener el mayor de todos los salarios, el campo se llamará MAYOR SUELDO EN TOLEDO de la tabla de EMPLEADOS, de los empleados de la provincia de ‘TOLEDO’
SELECT MAX(SALARIO)  FROM EMPLEADOS

WHERE PROVINCIA LIKE'TOLEDO';
--Obtener la POBLACION y el mayor de todos los salarios de cada población de la tabla de EMPLEADOS.
SELECT POBLACION , MAX(SALARIO)
FROM EMPLEADOS
GROUP BY POBLACION;
--Obtener la PROVINCIA, la POBLACION y la media de salarios, con dos decimales de la cada provincia y población, que se llamará MEDIA POBLACIÓN de la tabla de EMPEADOS ordenado por MEDIA POBLACIÓN.
SELECT PROVINCIA, POBLACION, TO_CHAR(AVG(SALARIO), 'FM999999990.000') AS SALARIO_PROMEDIO
FROM EMPLEADOS
GROUP BY PROVINCIA, POBLACION;

--Realiza la consulta anterior con las siguientes ordenaciones y compara los resultados obtenidos en cada caso:

--Ordena el resultado sólo por provincia
-- el resultado sólo por población.
--Ordena el resultado provincia y población.



--Obtener la POBLACION y el menor salario de cada población, de aquellos empleados que vivan en la provincia de Toledo, ordenados por población.
SELECT POBLACION , TO_CHAR(MIN(SALARIO),'FM999999.000L')
FROM EMPLEADOS
WHERE EMPLEADOS.PROVINCIA LIKE 'TOLEDO'
GROUP BY POBLACION;
--
SELECT POBLACION , TO_CHAR(MIN(SALARIO),'FM999999.000L')
FROM EMPLEADOS
WHERE EMPLEADOS.PROVINCIA LIKE 'TOLEDO'
GROUP BY POBLACION;
--Obtener la DEPARTAMENTO y la media de sueldos por departamentos, con dos decimales, de la tabla de EMPLEDOS, que tengan unos apellidos con una longitud mayor a 10 caracteres. Ordenado por la media de sueldos.
SELECT DPTO_COD, ROUND(AVG(SALARIO), 2) AS MEDIA_SUELDOS
FROM EMPLEADOS
WHERE LENGTH(APELLIDO1) < 10
GROUP BY DPTO_COD
ORDER BY MEDIA_SUELDOS;

--Obtener el DEPARTAMENTO, la media de sueldos por departamento y el número de trabajadores de cada departamento, de la tabla de EMPLEADOS, de aquellos departamentos que tengan algún empleado y la media de sueldos sea menor a 1550€. Ordenado por la media descendentemente.
SELECT DPTO_COD,TO_CHAR(MIN(SALARIO),'FM999999.000L') SALARIO,COUNT(*)
FROM EMPLEADOS
WHERE (SELECT AVG(SALARIO)FROM DEPARTAMENTOS) <1500
GROUP BY DPTO_COD;
--Obtener el mayor salario, el menor salario, la suma de los salarios, cuantos salarios hay y la media de salarios de los empleados de Toledo, que pertenezcan al departamento 1.
SELECT TO_CHAR(MAX(SALARIO),'FM999999.000L') AS MAX_SALARIO,
       TO_CHAR(SUM(SALARIO),'FM999999.000L') AS SUMA_SALARIOS,
       COUNT(SALARIO) AS NUMERO_TRABAJADORES,
       TO_CHAR(AVG(SALARIO),'FM999999.000L') AS MEDIA_SALARIOS
FROM EMPLEADOS
WHERE PROVINCIA LIKE 'TOLEDO' AND DPTO_COD NOT LIKE  1
GROUP BY SALARIO;

--Obtener el POBLACION, el mayor de los salarios de la población y el menor de los salarios de la población, de la tabla de EMPLEADOS, de las poblaciones de Toledo, que tengan algún empleado. Ordenador del salario más bajo, al salario más alto.
SELECT POBLACION ,TO_CHAR(MAX(SALARIO),'FM999999.000L'),TO_CHAR(MIN(SALARIO),'FM999999.000L')
FROM EMPLEADOS
WHERE PROVINCIA LIKE 'TOLEDO' AND EXISTS (SELECT 2 FROM EMPLEADOS WHERE PROVINCIA = 'TOLEDO')
GROUP BY POBLACION
;

--Obtener el APELLIDO1, el APELLIDOS2 y el NOMBRE todo en un campo, separando por una coma los apellidos del nombre que se llamará NOMBRE COMPLETO, la edad y el salario, de la tabla de EMPLEADOS, de los empleados que tengan más de 32 años, ordenado por edad.
SELECT NOMBRE||' '||APELLIDO1||' '||APELLIDO2 AS NOMBRE,  TRUNC(MONTHS_BETWEEN(SYSDATE, FECHA_NAC) / 12) AS EDAD,SALARIO
FROM EMPLEADOS 
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE, FECHA_NAC) / 12) >32
ORDER BY TRUNC(MONTHS_BETWEEN(SYSDATE, FECHA_NAC) / 12) ;
--Obtener la PROVINCIA, la POBLACION, el SEXO, y el número de trabajadores, de la tabla de EMPLEDOS, que no pertenezcan al departamento 6 y vivan en Toledo. Para el resultado final solo se contarán a los empleados de sexo masculino. Ordenado por el número de trabajadores.
SELECT PROVINCIA, COUNT(*) AS NUMERO_TRABAJADORES
FROM EMPLEADOS
WHERE DPTO_COD NOT LIKE 6 AND PROVINCIA NOT LIKE 'TOLEDO'
GROUP BY PROVINCIA
ORDER BY NUMERO_TRABAJADORES DESC;









--02_ejercicio_subconsultas

--?	Obtener los departamentos que tengan un presupuesto menor al presupuesto del departamento de sistemas.
SELECT NOMBRE_DPTO 
FROM DEPARTAMENTOS
WHERE PRESUPUESTO <
(SELECT PRESUPUESTO FROM DEPARTAMENTOS WHERE NOMBRE_DPTO LIKE'SISTEMAS')
ORDER BY NOMBRE_DPTO;


--?	Obtener el nombre completo, la dirección, la población, 
--la provincia y salario de los empleados de Toledo y de Cádiz. 
--Ordenado por salario. Realizar la consulta de dos formas distintas.

SELECT NOMBRE||' '||APELLIDO1||' '|| APELLIDO2 , POBLACION ,SALARIO ,PROVINCIA
FROM EMPLEADOS
WHERE PROVINCIA LIKE 'TOLEDO' OR  PROVINCIA LIKE 'CADIZ'
ORDER BY SALARIO;


--?	Obtener el nombre completo, separando nombre y apellidos por una coma, la edad, la fecha de nacimiento con el nombre del mes (escrito en letras mayúsculas), el salario redondeado a dos decimales de aquellos trabajadores que tengan un sueldo inferior a la media de los sueldos.

SELECT TO_CHAR(NOMBRE || ',' || APELLIDO1 || ',' || APELLIDO2) AS NOMBRECOMPLETO , 
MONTHS_BETWEEN(FECHA_NAC,SYSDATE)/12 AS EDAD ,
TO_CHAR(FECHA_NAC, 'DD/MON/YYYY') AS FECHA_NA,
TO_CHAR(SALARIO,'FM999999.00L')AS SALARIO
FROM EMPLEADOS 
WHERE SALARIO <(SELECT AVG(SALARIO) FROM EMPLEADOS);


--?	Obtener las fechas de nacimiento y el número de departamento, de los empleados más jóvenes de los departamentos de los departamentos 2, 4, 6 u 8.

SELECT FECHA_NAC AS FECHA_NACIMIENTO , DPTO_COD
FROM EMPLEADOS
WHERE MONTHS_BETWEEN(FECHA_NAC, SYSDATE) / 12 < 25 AND DPTO_COD IN (SELECT DPTO_COD FROM EMPLEADOS WHERE DPTO_COD IN (2, 4, 6, 8))
ORDER BY FECHA_NAC;



--?	Obtener nombre, apellidos, dirección y salario de los empleados q que tengan un salario igual al mayor salario. Realizar la consulta de dos formas distintas.
SELECT NOMBRE, APELLIDO1, DIRECC, SALARIO
FROM EMPLEADOS
WHERE SALARIO >= (SELECT MAX(SALARIO) FROM EMPLEADOS);


--?	Mostrar los datos de todos los departamentos si hay algún empleado de menos de 25 años en la empresa.
SELECT *
FROM EMPLEADOS
WHERE FECHA_INICIO < TO_DATE('25','YY');

--?	Mostar los datos de los departamentos en los que haya trabajadores que tengan menos de 25 años, y el departamento sea el departamento de sistemas. Realizar la consulta de dos formas distintas.
SELECT NOMBRE_DPTO
FROM DEPARTAMENTOS
WHERE DPTO_COD = (SELECT DPTO_COD
                  FROM EMPLEADOS
                  WHERE TO_DATE(FECHA_INICIO, 'YY') < TO_DATE('25', 'YY')
                    AND NOMBRE_DPTO LIKE 'SISTEMAS');
--NO SE PORQUE NO FUNCIONA . 
-------------------------OTRA FORTMA------------------------------------------------

SELECT *
FROM DEPARTAMENTOS
WHERE DPTO_COD IN (SELECT DPTO_COD
                   FROM EMPLEADOS
                   WHERE EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM FECHA_NAC) > 25
                     AND NOMBRE_DPTO LIKE 'SISTEMAS');


--?	Obtener el nombre completo, antigüedad en años y salario con dos decimales, de los empleados que tengan un sueldo que se encuentre entre la media de sueldos del departamento de ‘SEGURIDAD’ y la media de sueldos del departamento de ‘HARDWARE’. 
--Realiza la consulta de dos formas:
--?	En una puedes utilizar el valor del código del departamento, es decir, puedes utilizar expresiones como: dpto_cod=1
--?	Pero en la otra no podrás utilizar valores constantes para comparar con el código del departamento, es decir, NO podrás utilizar expresiones como: dpto_cod=1
SELECT NOMBRE, TO_DATE(FECHA_INICIO, 'YY-MM-DD'), TO_CHAR(SALARIO, 'FM999999.00L')
FROM EMPLEADOS
WHERE SALARIO BETWEEN (SELECT AVG(SALARIO) FROM EMPLEADOS WHERE DPTO_COD = 2)
    AND (SELECT AVG(SALARIO) FROM EMPLEADOS WHERE DPTO_COD = 8);




--?	Obtener el nombre, dirección y el salario de aquellos empleados que tengan un salario
--mayor, que el empleado que más cobra del departamento de ‘SOFTWARE’. Realizar la 
--consulta de dos formas de tal forma que en una de ellas sólo puedes utilizar 
--operadores relacionales y en la otra puedes utilizar operadores relacionales 
--y operadores de grupo. 

SELECT NOMBRE,DIRECC,SALARIO 
FROM EMPLEADOS
WHERE SALARIO >(SELECT MAX(SALARIO) FROM EMPLEADOS WHERE DPTO_COD=3 );


--?	Obtener el nombre del departamento con la primera letra en mayúsculas,
--del departamento que
--tenga menor presupuesto y su jefe de departamento sea de la provincia de Toledo.


--?	Obtener el nombre del departamento con la primera letra en mayúsculas, del departamento que
--tenga menor presupuesto y su jefe de departamento sea de la provincia de Toledo.
SELECT INITCAP(NOMBRE_DPTO) 
FROM DEPARTAMENTOS d
WHERE PRESUPUESTO =(SELECT MIN(PRESUPUESTO) FROM DEPARTAMENTOS)
AND DNI_JEFE_DPTO IN (SELECT DNI FROM EMPLEADOS e WHERE PROVINCIA LIKE 'TOLEDO' AND e.dni=d.DNI_JEFE_DPTO);

--?	Obtener los nombres, el presupuesto y el DNI del 
--jefe de departamento, de aquellos departamentos que tengan más de 2 trabajadores.

SELECT INITCAP(NOMBRE_DPTO),PRESUPUESTO,DNI_JEFE_DPTO
FROM DEPARTAMENTOS d
WHERE (SELECT COUNT(*)FROM EMPLEADOS e 
where e.DPTO_COD=d.DPTO_COD)>2;


--?	Obtener los nombres y el presupuesto de aquellos departamentos que tengan un
--presupuesto mayor a 5.000€, si hay algún departamento en el que trabaje un 
--empleado que tenga 
--un sueldo superior al mayor de todos los sueldos del departamento de ‘SISTEMAS’. 
SELECT NOMBRE_DPTO , PRESUPUESTO
FROM DEPARTAMENTOS D
WHERE PRESUPUESTO > 5000  AND  EXISTS(SELECT 1 FROM EMPLEADOS E WHERE
E.DNI=D.DNI_JEFE_DPTO AND E.SALARIO >
(SELECT MAX(SALARIO) FROM EMPLEADOS WHERE DPTO_COD=1) );

--?	Obtener el nombre completo (nombre y apellidos), la edad de los empleados en 
--números romanos en minúsculas, la fecha de nacimiento, la fecha de nacimiento con
--el nombre del mes en minúsculas y la fecha de nacimiento con números romanos, el 
--salario, la provincia en minúsculas y la dirección de aquellos empleados que tengan
--menos de 30 años, hayan nacido en la provincia de ‘Toledo’, vivan en una avenida, 
--sus apellidos contengan una ‘LL’, que 
--tengan un sueldo que se menor que la media de sueldos de alguno de los departamentos.

SELECT TO_CHAR(NOMBRE || ' ' || APELLIDO1 || ' ' || APELLIDO2) AS NOMBRECOMPLETO ,
TRUNC(MONTHS_BETWEEN(SYSDATE , FECHA_NAC)/12) AS EDAD ,
  TO_CHAR(FECHA_NAC, 'DD MONTH YYYY') AS FECHA_NACIMIENTO ,SALARIO , LOWER(PROVINCIA),
  DIRECC
FROM EMPLEADOS
;
SELECT
    TO_CHAR(UPPER(NOMBRE) || '- ' || UPPER(APELLIDO1) || ' - ' || UPPER(APELLIDO2)) AS NOMBRECOMPLETO,
    TO_CHAR(SALARIO, 'FM999,999,999.00') AS SALARIO_FORMATEADO,
    TRUNC(MONTHS_BETWEEN(SYSDATE, FECHA_NAC) / 12) AS EDAD,
    TRUNC(MONTHS_BETWEEN(SYSDATE, FECHA_INICIO)) AS ANTIGUEDAD
FROM EMPLEADOS
WHERE LENGTH(NOMBRE) >= 10
  AND INSTR(NOMBRE, ' ') > 0 -- Verificar si hay un espacio en el nombre
  AND TRUNC(MONTHS_BETWEEN(SYSDATE, FECHA_NAC) / 12) < (SELECT AVG(TRUNC(MONTHS_BETWEEN(SYSDATE, FECHA_NAC) / 12)) FROM EMPLEADOS)
  AND TRUNC(MONTHS_BETWEEN(SYSDATE, FECHA_INICIO)) < (SELECT AVG(TRUNC(MONTHS_BETWEEN(SYSDATE, FECHA_INICIO))) FROM EMPLEADOS);

--	Obtener el nombre, la población y el sueldo de los empleados, con tres decimales, de tal forma que se les incrementará el sueldo un 10% a los empleados Talavera y se les decrementará un 5% a los empleados de Fuensalida y Oropesa, de
--aquellos empleados que hayan participado en algún proyecto como ‘DESARROLLADORES’.--LOL
SELECT
    NOMBRE,
    POBLACION,
    TO_CHAR(SALARIO * 1.10, 'FM999,999,999.000') AS SUELDO_INCREMENTADO,
    CASE
        WHEN POBLACION IN ('Talavera', 'TALAVERA') THEN TO_CHAR(SALARIO * 1.10, 'FM999,999,999.000')
        WHEN POBLACION IN ('Fuensalida', 'Oropesa') THEN TO_CHAR(SALARIO * 0.95, 'FM999,999,999.000')
        ELSE TO_CHAR(SALARIO, 'FM999,999,999.000')
    END AS SUELDO_MODIFICADO
FROM EMPLEADOS
WHERE EXISTS (
    SELECT 1
    FROM PROYECTOS
    WHERE EMPLEADOS.COD_PROY = PROYECTOS.COD_PROY
      AND DESCRIPCION = 'DESARROLLADORES'
);







--03_EJERCICIOS_03 _SUBCONSULTAS Para realizar las consultas debes utilizar la base de datos BD03.







--?	Obtener los datos de los departamentos que tengan un presupuesto mayor que la media de todos los departamentos.
SELECT *
FROM DEPARTAMENTOS 
WHERE PRESUPUESTO>
(SELECT AVG(PRESUPUESTO)FROM DEPARTAMENTOS);

--?	Obtener el nombre de los departamentos, ordenados alfabéticamente, de aquellos departamentos en hay salarios de más de 2.000€.

SELECT NOMBRE_DPTO
FROM DEPARTAMENTOS
WHERE DPTO_COD IN(SELECT DPTO_COD FROM EMPLEADOS 
WHERE SALARIO > 2000);


--?	Obtener los datos de
--los empleados de la provincia de Toledo y que vivan en Talavera o en Huecas.

SELECT *
FROM EMPLEADOS
WHERE (POBLACION LIKE 'TALAVERA%' OR POBLACION LIKE 'HUESCAS');

--?	Mostrar los datos de los empleados que hayan sido jefes de proyecto.

SELECT *
FROM EMPLEADOS
WHERE DNI IN(SELECT DNI_JEFE_DPTO FROM DEPARTAMENTOS);

--salario que los trabajadores que se llamen ‘carrasco’ o ‘sanchez’ de primer apellido. Si hay varios empelados que se llamen ‘carrasco’ o ‘sanchez’ nos
--quedaremos con el sueldo más alto. Realizar la consulta de dos formas diferentes.
SELECT MAX(SALARIO) AS SALARIO_MAXIMO
FROM EMPLEADOS
WHERE APELLIDO1 IN ('carrasco', 'sanchez') or  APELLIDO2 IN ('carrasco', 'sanchez');


SELECT SALARIO AS SALARIO_MAXIMO
FROM EMPLEADOS
WHERE APELLIDO1 = 'carrasco'
UNION
SELECT nombre
FROM EMPLEADOS
WHERE APELLIDO1 = 'sanchez';




--?	Mostar los datos de los departamentos que tengan un presupuesto mayor a la media,
--pero que sea menor a 15.000€. Ordenado por el presupuesto decrecientemente.

select *
FROM DEPARTAMENTOS
WHERE PRESUPUESTO > (SELECT  AVG(PRESUPUESTO)
FROM DEPARTAMENTOS) OR PRESUPUESTO <15000
ORDER BY PRESUPUESTO DESC;


--?	Obtener la
--descripción de los proyectos en los que hayan trabajados más de tres empleados.

SELECT DESCRIPCION
FROM PROYECTOS P
WHERE P.COD_PROY IN (
    SELECT PROYECTOS_COD_PROY
    FROM EMP_PROY
    GROUP BY PROYECTOS_COD_PROY
    HAVING COUNT(*) > 3
);

--?	Mostrar el nombre del departamento y el presupuesto, de aquellos departamentos que tengan un presupuesto mayor a la media de todos los departamentos y tenga trabajadores mayores de 40 años.
SELECT NOMBRE_DPTO ,PRESUPUESTO
FROM DEPARTAMENTOS
WHERE PRESUPUESTO > (SELECT AVG(PRESUPUESTO) FROM EMPLEADOS
) OR DPTO_COD IN (SELECT DPTO_COD FROM EMPLEADOS 
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE , FECHA_NAC)/12)>40);



--?	Obtener el nombre completo, la edad, la antigüedad en años, el salario y el 
--salario incrementado en 10% del jefe de departamento(s) que tenga más empleados.
SELECT TO_CHAR(NOMBRE || ' ' || APELLIDO1 || ' ' || APELLIDO2) AS NOMBRECOMPLETO ,
TRUNC(MONTHS_BETWEEN(SYSDATE , FECHA_NAC)/12) AS EDAD , TRUNC(MONTHS_BETWEEN(SYSDATE , FECHA_INICIO)/12)AS ANTIGUEDAD , SALARIO , TO_CHAR(SALARIO*1.1)AS SALARIO_INCREMENTADO
FROM EMPLEADOS E
WHERE E.DNI IN (SELECT DNI_JEFE_DPTO FROM DEPARTAMENTOS
WHERE DPTO_COD IN (SELECT MAX(DPTO_COD) FROM EMPLEADOS));




--?	Obtener código del departamento y cuántos empleados, del departamento(s) que tenga menos empleados.

SELECT DPTO_COD, COUNT(*) AS cantidad_empleados
FROM EMPLEADOS
GROUP BY DPTO_COD
HAVING COUNT(*) = (SELECT MIN(COUNT(*))
                   FROM EMPLEADOS
                   GROUP BY DPTO_COD);



--?	Obtener el nombre del departamento y el presupuesto de aquellos departamentos en los que el salario máximo de los trabajadores de ese departamento sea mayor de 1500 € y el presupuesto del departamento sea mayor o igual a 9000 Euros.
SELECT NOMBRE_DPTO ,PRESUPUESTO 
FROM DEPARTAMENTOS 
WHERE DPTO_COD IN (SELECT DPTO_COD FROM EMPLEADOS 
WHERE SALARIO>1500
GROUP BY DPTO_COD
HAVING MAX(SALARIO)>1500) AND PRESUPUESTO >= 9000;
 
 --AND requiere que todas las condiciones sean verdaderas.
--OR requiere que al menos una condición sea verdadera.

--?	Mostrar nombre del departamento y el presupuesto de los departamentos que tengan algún trabajador con menos de 5 años de antigüedad.
SELECT NOMBRE_DPTO ,PRESUPUESTO 
FROM DEPARTAMENTOS 
WHERE DPTO_COD IN (SELECT DPTO_COD FROM EMPLEADOS 
WHERE  TRUNC(MONTHS_BETWEEN(SYSDATE ,FECHA_INICIO)/12)<=5);


--?	Mostrar el nombre completo, el salario y la fecha de ingreso en la empresa, de los empleados que hayan trabajado en algún proyecto como desarrollador, jefe de proyecto o realizando la instalación de hardware. Ordenado por fecha de ingreso en la empresa.
SELECT TO_CHAR(NOMBRE || ' ' || APELLIDO1 || ' ' || APELLIDO2) AS NOMBRECOMPLETO ,
FECHA_INICIO
FROM EMPLEADOS E
WHERE DNI IN (SELECT EMPLEADOS_DNI FROM EMP_PROY EMP
WHERE PUESTO LIKE 'DESAROLLADOR'  AND emp.empleados_dni =e.dni) OR DNI IN
(SELECT DNI_JEFE_DPTO FROM DEPARTAMENTOS D
WHERE E.DNI=D.DNI_JEFE_DPTO ) OR DNI IN (SELECT EMPLEADOS_DNI FROM EMP_PROY EMP
WHERE PUESTO LIKE 'INSTALACION HARDWARE' AND emp.empleados_dni =e.dni );



--?	Obtener el nombre y la descripción de los proyectos en los que haya trabajado el trabajador de mayor antigüedad.
SELECT NOMBRE , DESCRIPCION 
FROM PROYECTOS
WHERE COD_PROY IN 
(SELECT PROYECTOS_COD_PROY 
FROM EMP_PROY 
WHERE EMPLEADOS_DNI IN
(SELECT DNI FROM EMPLEADOS
WHERE TRUNC(MONTHS_BETWEEN(SYSDATE , FECHA_INICIO)) = 
(SELECT MAX(TRUNC(MONTHS_BETWEEN(SYSDATE, FECHA_INICIO)))
             FROM EMPLEADOS)
    )
);

--?	Obtener el nombre completo, con la primera letra en mayúsculas, la dirección y el salario incrementado en un 5%, de los empleados, que hayan trabajado en el proyecto ‘INSTALACION RED’ o ‘MONTAJE SERVIDORES’ y su sueldo no supere los 1.600€. Ordenado por apellidos.
SELECT TO_CHAR(INITCAP(NOMBRE) || ' ' || APELLIDO1 || ' ' || APELLIDO2) AS NOMBRECOMPLETO ,DIRECC,SALARIO ,TO_CHAR(SALARIO *1.05)
FROM EMPLEADOS
WHERE DNI IN (SELECT EMPLEADOS_DNI FROM EMP_PROY
WHERE PROYECTOS_COD_PROY IN (SELECT COD_PROY FROM PROYECTOS 
WHERE NOMBRE LIKE 'INSTALACION RED' OR  NOMBRE LIKE 'MONTAJE SERVIDORES' ))
AND SALARIO <1600 
ORDER BY APELLIDO1;














--04_EJER04_MULTITABLA --JOIN BASICAMENTE     --Para realizar las consultas debes utilizar la base de datos BD03.

--?	Obtener el nombre completo de los trabajadores, su sueldo, el nombre del departamento al que pertenece y el presupuesto del departamento. Realiza la consulta relacionando las claves de diferentes formas. Realiza la consulta con dos sintaxis diferentes.



SELECT E.NOMBRE AS "Nombre del Empleado",
       E.SALARIO AS "Salario",
       D.NOMBRE_DPTO AS "Nombre del Departamento",
       D.PRESUPUESTO AS "Presupuesto del Departamento"
FROM EMPLEADOS E
JOIN DEPARTAMENTOS D ON E.DPTO_COD = D.DPTO_COD;




--?	Obtener el nombre completo del trabajador, el nombre de los proyectos en los que ha participado, la fecha de inicio de cada proyecto y el puesto que ocupó en cada uno de los proyectos. Ordenado por apellidos y fecha de inicio



SELECT E.NOMBRE, P.NOMBRE, P.FECHA_INICIO, EMP.PUESTO
FROM EMP_PROY EMP
JOIN EMPLEADOS E ON EMP.EMPLEADOS_DNI = E.DNI
JOIN PROYECTOS P ON EMP.PROYECTOS_COD_PROY = P.COD_PROY;


--?	Obtener el nombre completo del trabajador, la población, la provincia y la función que ha realizado en cada uno de los proyectos en los que ha participado.

SELECT TO_CHAR(INITCAP(E.NOMBRE) || ' ' || E.APELLIDO1 || ' ' || E.APELLIDO2) AS NOMBRECOMPLETO ,E.POBLACION , E.PROVINCIA , EMP.PUESTO
FROM EMPLEADOS E JOIN EMP_PROY EMP  ON EMP.EMPLEADOS_DNI = E.DNI;


--?	Obtener el nombre completo y el puesto de los trabajadores que hayan trabajado en algún proyecto como desarrolladores o como instaladores de hardware. Ordenado por el puesto

SELECT TO_CHAR(INITCAP(E.NOMBRE) || ' ' || E.APELLIDO1 || ' ' || E.APELLIDO2) AS NOMBRECOMPLETO 
, EMP.PUESTO
FROM EMPLEADOS E JOIN EMP_PROY EMP ON EMP.EMPLEADOS_DNI = E.DNI
WHERE  EMP.PUESTO IN  ('DESARROLLADOR' ,'INSTALACION HARDWARE');

--?	Obtener el nombre completo de los empleados y su edad de aquellos departamentos que tengan un presupuesto menor que la media de los presupuestos de todos los departamentos. Ordenado por nombre completo.

SELECT TO_CHAR(INITCAP(E.NOMBRE) || ' ' || E.APELLIDO1 || ' ' || E.APELLIDO2) AS NOMBRECOMPLETO , TRUNC(MONTHS_BETWEEN(SYSDATE,FECHA_NAC)/12)
FROM EMPLEADOS E JOIN  DEPARTAMENTOS D ON D.DPTO_COD = E.DPTO_COD
WHERE D.PRESUPUESTO <(SELECT AVG(PRESUPUESTO) FROM DEPARTAMENTOS);


--?	Obtener el nombre completo del trabajador, la edad, la antigüedad, el nombre del proyecto, la duración en meses de cada proyecto, el nombre del departamento al que pertenece el trabajador y el presupuesto incrementado en un 20% con dos decimales.

SELECT TO_CHAR(INITCAP(E.NOMBRE) || ' ' || E.APELLIDO1 || ' ' || 
E.APELLIDO2) AS NOMBRECOMPLETO , TRUNC(MONTHS_BETWEEN(SYSDATE,E.FECHA_NAC)/12)
AS EDAD
,TRUNC(MONTHS_BETWEEN(SYSDATE,E.FECHA_INICIO)/12) AS Antiguedad , 
P.NOMBRE ,TRUNC(MONTHS_BETWEEN(P.FECHA_FIN ,P.FECHA_INICIO)) 
AS DURACION_PROYECTO , D.NOMBRE_DPTO ,
TO_CHAR(TO_CHAR(TO_NUMBER(D.PRESUPUESTO * 1.2), 'FM999999.00L')) AS PRESUPUESTO_INCREMENTADO

FROM EMPLEADOS E JOIN  EMP_PROY EMP ON E.DNI = EMP.EMPLEADOS_DNI
JOIN PROYECTOS P ON EMP.PROYECTOS_COD_PROY=P.COD_PROY
JOIN DEPARTAMENTOS D ON E.DPTO_COD = D.DPTO_COD;



--?	Los nombres de departamentos y el presupuesto, de aquellos departamentos que tengan un presupuesto menor al presupuesto del departamento de desarrollo web.
SELECT NOMBRE_DPTO , PRESUPUESTO FROM 
DEPARTAMENTOS 
WHERE PRESUPUESTO <(SELECT PRESUPUESTO FROM DEPARTAMENTOS 
WHERE NOMBRE_DPTO LIKE 'DISEÃ‘O WEB');


--?	Obtener el nombre de los departamentos y el nombre completo de los trabajadores que trabajen en un departamento con más de dos trabajadores. Ordenado por el primer apellido.
SELECT D.NOMBRE_DPTO , TO_CHAR(INITCAP(E.NOMBRE) || ' ' || E.APELLIDO1 || ' ' || 
E.APELLIDO2) AS NOMBRECOMPLETO  
FROM DEPARTAMENTOS D JOIN  EMPLEADOS E ON E.DPTO_COD =D.DPTO_COD
WHERE E.DPTO_COD IN (SELECT DPTO_COD 
FROM EMPLEADOS
GROUP BY DPTO_COD
HAVING COUNT(DPTO_COD)>2)
ORDER BY E.APELLIDO1;

--?	Los nombres de departamentos, y la media de salarios de cada uno de ellos. Ordenado por la media.

SELECT D.NOMBRE_DPTO ,AVG(E.SALARIO)
FROM DEPARTAMENTOS D JOIN EMPLEADOS E
ON E.DPTO_COD = D.DPTO_COD
GROUP BY  D.NOMBRE_DPTO;


--?	Mostrar los nombres de los proyectos, los presupuesto y los nombres de los departamentos de los empleados que pertenezca al departamento con el menor presupuesto.

SELECT P.NOMBRE ,  MIN(D.PRESUPUESTO) ,D.NOMBRE_DPTO
FROM EMPLEADOS E  JOIN  DEPARTAMENTOS D
ON E.DPTO_COD= D.DPTO_COD 
JOIN EMP_PROY EMP ON EMP.EMPLEADOS_DNI=E.DNI
JOIN PROYECTOS P ON P.COD_PROY = EMP.PROYECTOS_COD_PROY

WHERE D.PRESUPUESTO = (SELECT MIN(PRESUPUESTO) FROM DEPARTAMENTOS)
GROUP BY P.NOMBRE, D.NOMBRE_DPTO;

--?	El nombre de todos los proyectos y el número de trabajadores que han participado en de cada uno de ellos.

SELECT P.NOMBRE ,COUNT(E.DPTO_COD)
FROM PROYECTOS P JOIN EMP_PROY EMP
ON P.COD_PROY= EMP.PROYECTOS_COD_PROY
JOIN EMPLEADOS E ON E.DNI=EMP.EMPLEADOS_DNI
GROUP BY P.NOMBRE;

--?	El nombre completo de los empleados, el nombre del proyecto y la fecha de inicio de aquellos proyectos que empezaran en el primer trimestre del 2013.

SELECT TO_CHAR(INITCAP(E.NOMBRE) || ' ' || E.APELLIDO1 || ' ' || E.APELLIDO2) AS NOMBRECOMPLETO 
,P.NOMBRE ,P.FECHA_INICIO
FROM EMPLEADOS E JOIN EMP_PROY EMP
ON EMP.EMPLEADOS_DNI = E.DNI 
JOIN PROYECTOS P ON P.COD_PROY=EMP.PROYECTOS_COD_PROY
WHERE P.FECHA_INICIO BETWEEN TO_DATE('20/01/2013', 'DD/MM/YYYY') AND
TO_DATE('20/03/2013', 'DD/MM/YYYY');

--?	Obtener el nombre completo, la edad, la antigüedad, el sueldo con dos decimales, el nombre del departamento en minúsculas, de aquellos trabajadores que tengan un nombre compuesto y su primer apellido o su segundo apellido contengan ‘EZ’.

SELECT TO_CHAR(INITCAP(E.NOMBRE) || ' ' || E.APELLIDO1 || ' ' || E.APELLIDO2) AS NOMBRECOMPLETO ,
TRUNC(MONTHS_BETWEEN(SYSDATE,E.FECHA_NAC)/12) AS EDAD , TRUNC(MONTHS_BETWEEN(SYSDATE,E.FECHA_INICIO)/12) AS ANTIGUEDAD ,TO_CHAR(SALARIO,'FM999999.00L')AS SALARIO , LOWER(D.NOMBRE_DPTO)

FROM EMPLEADOS E JOIN DEPARTAMENTOS D
ON E.DPTO_COD = D.DPTO_COD
WHERE( TO_CHAR( E.APELLIDO1) LIKE '%EZ%' OR TO_CHAR( E.APELLIDO1) LIKE '% %')
AND (TO_CHAR( E.APELLIDO2)LIKE '%EZ%' OR TO_CHAR( E.APELLIDO2) LIKE '% %') ;



---TEN EN CUENTA LAS LOS ()  EN TO_CHAR ETC...

--?	Mostrar el nombre de todos los departamentos con su presupuesto y el mayor de los sueldos de cada departamento.

SELECT D.NOMBRE_DPTO ,D.PRESUPUESTO, MAX(E.SALARIO)
FROM DEPARTAMENTOS D JOIN EMPLEADOS E
ON E.DPTO_COD=D.DPTO_COD

GROUP BY D.PRESUPUESTO, D.NOMBRE_DPTO
;


--?	El nombre del proyecto, el nombre del departamento y el nombre de empleados,
--que tengan un salario menor al sueldo medio de todos los trabajadores, que vivan 
--en Toledo, el departamento tenga un presupuesto mayor a la media de los presupuestos 
--de todos los departamentos.

SELECT P.NOMBRE,
       D.NOMBRE_DPTO,
       E.NOMBRE 
FROM PROYECTOS P
JOIN EMP_PROY EMP ON P.COD_PROY = EMP.PROYECTOS_COD_PROY
JOIN EMPLEADOS E ON EMP.EMPLEADOS_DNI = E.DNI
JOIN DEPARTAMENTOS D ON D.DPTO_COD=E.DPTO_COD

WHERE E.SALARIO <(SELECT AVG(SALARIO)  FROM EMPLEADOS)
AND E.PROVINCIA = 'TOLEDO' AND
 D.PRESUPUESTO >(SELECT AVG(PRESUPUESTO) FROM DEPARTAMENTOS);

--Si utilizas “OR” en la cláusula WHERE, la consulta devolverá filas que cumplan cualquiera de las condiciones especificadas. Por ejemplo:

--Si utilizas “AND” en la cláusula WHERE, la consulta devolverá filas que cumplan todas las condiciones especificadas. Por ejemplo:


--?	Los nombres de los departamentos, el presupuesto, el nombre del proyecto, la fecha de inicio y la fecha de finalización del departamento con el menor de los presupuestos.

SELECT D.NOMBRE_DPTO,D.PRESUPUESTO ,P.NOMBRE, P.FECHA_INICIO ,P.FECHA_FIN
FROM PROYECTOS P
JOIN EMP_PROY EMP ON P.COD_PROY = EMP.PROYECTOS_COD_PROY
JOIN EMPLEADOS E ON EMP.EMPLEADOS_DNI = E.DNI
JOIN DEPARTAMENTOS D ON D.DPTO_COD=E.DPTO_COD
WHERE D.PRESUPUESTO IN (SELECT MIN(PRESUPUESTO) FROM DEPARTAMENTOS);



--?	El nombre completo de los empleados, la edad y la antigüedad de aquellos 
--empleados, que pertenezcan al departamento con más empleados, el salario 
--sea menor al salario medio del departamento que tenga mayor media de salarios y 
--tengan más de 5 años de antigüedad. 
--Ordenado por antigüedad, salario, primer apellido y segundo apellido.

SELECT TO_CHAR(INITCAP(E.NOMBRE) || ' ' || E.APELLIDO1 || ' ' || E.APELLIDO2) AS NOMBRECOMPLETO ,
TRUNC(MONTHS_BETWEEN(SYSDATE,E.FECHA_NAC)/12) AS EDAD , TRUNC(MONTHS_BETWEEN(SYSDATE,E.FECHA_INICIO)/12) AS ANTIGUEDAD 
FROM EMPLEADOS E 
WHERE E.DPTO_COD IN (SELECT MAX(E.DPTO_COD) FROM EMPLEADOS E 
GROUP BY E.DPTO_COD) AND E.SALARIO < 

(SELECT AVG(E.SALARIO)
FROM EMPLEADOS E JOIN DEPARTAMENTOS D ON D.DPTO_COD=E.DPTO_COD

WHERE AVG(E.SALARIO) IN(SELECT MAX(E.SALARIO) FROM EMPLEADOS) AND 
TRUNC(MONTHS_BETWEEN(SYSDATE,E.FECHA_INICIO)/12)>5
 GROUP BY E.SALARIO
);

--VER CONSULTA
SELECT TO_CHAR(INITCAP(E.NOMBRE) || ' ' || E.APELLIDO1 || ' ' || E.APELLIDO2) AS NOMBRECOMPLETO,
       TRUNC(MONTHS_BETWEEN(SYSDATE, E.FECHA_NAC) / 12) AS EDAD,
       TRUNC(MONTHS_BETWEEN(SYSDATE, E.FECHA_INICIO) / 12) AS ANTIGUEDAD
FROM EMPLEADOS E
WHERE E.DPTO_COD = (
    SELECT DPTO_COD
    FROM (
        SELECT DPTO_COD, COUNT(*) AS NUM_EMPLEADOS
        FROM EMPLEADOS
        GROUP BY DPTO_COD
        ORDER BY COUNT(*) DESC
    )
    WHERE ROWNUM = 1 --single-row subquery returns more than one row
)
AND E.SALARIO < (
    SELECT AVG(SALARIO)
    FROM EMPLEADOS
    WHERE DPTO_COD = (
        SELECT DPTO_COD
        FROM (
            SELECT DPTO_COD, AVG(SALARIO) AS MEDIA_SALARIOS
            FROM EMPLEADOS
            GROUP BY DPTO_COD
            ORDER BY AVG(SALARIO) DESC
        )
        WHERE ROWNUM = 1
    )
)
AND TRUNC(MONTHS_BETWEEN(SYSDATE, E.FECHA_INICIO)) > 5
ORDER BY E.NOMBRE;
