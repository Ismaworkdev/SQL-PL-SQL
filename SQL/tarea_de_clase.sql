-- ***TABLA ALUMNOS***************

Drop table ALUMNOS;

create table ALUMNOS(
DNI	VARCHAR2(10) NOT NULL,
NOMBRE	VARCHAR2(15) NOT NULL,
APELLIDOS	VARCHAR2(20) NOT NULL,
FECHA_NAC	DATE,
DIRECCION	VARCHAR2(35),
POBLACION	VARCHAR2(20),
PROVINCIA	VARCHAR2(20),
CURSO	NUMBER(2)  NOT NULL,
NIVEL	VARCHAR2(10)  NOT NULL,
CLASE	CHAR(1)  NOT NULL,
FALTAS1	NUMBER(2),
FALTAS2	NUMBER(2),
FALTAS3	NUMBER(2)
);

INSERT INTO ALUMNOS VALUES ('34448974N', 'CONCHA', 'ESTRUCH VIDAL',TO_DATE('10/11/2003'),
'C/ MEDICO FELIX, 12','FUENSALIDA', 'TOLEDO',2,'CFGM','A',10,8,7);

INSERT INTO ALUMNOS VALUES ('34448999N', 'DORA', 'BRE?A MARTIN',TO_DATE('10/12/2001'),
'C/ GRANADA 20','TALAVERA', 'TOLEDO',1,'ESO','B',0,0,0);

INSERT INTO ALUMNOS VALUES ('14228974N', 'MARIA', 'GRACIA GIL',TO_DATE('07/10/2008'),
'C/ LOS ALFARES 20','OROPESA', 'TOLEDO',2,'CFGM','A',9,6,0);

INSERT INTO ALUMNOS VALUES ('23400999B', 'ANTONIO', 'RAMIREZ MARTIN',TO_DATE('01/08/2008'),
'C/ GENERAL AGUIRRE 10','NAVALMORAL', 'CACERES',1,'ESO','B',2,1,2);

INSERT INTO ALUMNOS VALUES ('8900894A', 'ALICIA', 'GOMEZ GONZALEZ',TO_DATE('06/11/2008'),
'C/ CAMINO EL RIO 12','SAN FERNANDO', 'MADRID',2,'CFGM','A',6,0,10);

INSERT INTO ALUMNOS VALUES ('2348019B', 'JUAN', 'ALFAR SALA',TO_DATE('13/12/2001'),
'C/ LAS HOJAS 110','FUENSALIDA', 'TOLEDO',1,'CFGS','C',10,4,10);

INSERT INTO ALUMNOS VALUES ('2148009C', 'PEDRO JUAN', 'MARTIN MARTIN',TO_DATE('04/07/2005'),
'C/ SEGOVIA 24-2A','ALCORCON', 'MADRID',1,'CFGS','C',0,0,4);

INSERT INTO ALUMNOS VALUES ('1330074A', 'MARIO', 'GARC?A GIL',TO_DATE('07/09/1998'),
'C/ LOS MAMELUCOS 22','TALAVERA', 'TOLEDO',2,'CFGS','C',0,1,0);

INSERT INTO ALUMNOS VALUES ('6800704A', 'BARBARA', 'FLORES SANZ',TO_DATE('07/09/1998'),
'C/ ALAMEDA 11','TALAVERA', 'TOLEDO',2,'CFGM','A',1,1,0);

INSERT INTO ALUMNOS VALUES ('59440025Z', 'BLANCA', 'GALA SOPENA',TO_DATE('01/03/1998'),
'AV/ LAS CRUCES','LAGARTERA', 'TOLEDO',1,'CFGS','C',0,10,0);

INSERT INTO ALUMNOS VALUES ('19235987M', 'BLANCA', 'PEREZ LOPEZ',TO_DATE('07/12/2098'),
'C/ DE LOS CARMENES','TORRIJOS', 'TOLEDO',2,'CFGS','C',9,5,5);

INSERT INTO ALUMNOS VALUES ('36985211C', 'BLANCA', 'MARTIN SANCHEZ',TO_DATE('17/09/1998'),
'C/ LOS CIRUELOS 22','OROPESA', 'TOLEDO',2,'CFGS','C',3,1,0);
COMMIT;

-- ******** TABLA NOTAS_ALUMNOS: ***********

Drop table notas_alumnos cascade constraints;

create table NOTAS_ALUMNOS
 (
   NOMBRE_ALUMNO VARCHAR2(25) NOT NULL ,
   nota1 number(2),
   nota2 number(2),
   nota3 number(2)
 ) ;
 
insert into NOTAS_ALUMNOS VALUES ('Alcalde Garc?a, M. Luisa',5,5,5);
insert into NOTAS_ALUMNOS VALUES ('Benito Mart?n, Luis',7,6,8);
insert into NOTAS_ALUMNOS VALUES ('Casas Mart?nez, Manuel',5,10,0);
insert into NOTAS_ALUMNOS VALUES ('Corregidor S?nchez, Ana',10,10,4);
insert into NOTAS_ALUMNOS VALUES ('D?az S?nchez, Maria',NULL,NULL,7);
COMMIT;

-- ******** TABLA LIBRERIAS: *************

Drop table LIBRERIAS cascade constraints;

create table LIBRERIAS
 (TEMA CHAR(15) NOT NULL ,
  ESTANTE CHAR(1),
  EJEMPLARES NUMBER(2)
 ) ;

INSERT INTO LIBRERIAS VALUES ('INFORMATICA', 'A',15);
INSERT INTO LIBRERIAS VALUES ('ECONOMIA',    'A',10);
INSERT INTO LIBRERIAS VALUES ('GEOMETRIA',    'B',8);
INSERT INTO LIBRERIAS VALUES ('FILOSOFIA',   'C',7);
INSERT INTO LIBRERIAS VALUES ('DIBUJO',      'C',10);
INSERT INTO LIBRERIAS VALUES ('MEDICINA',    'C',0);
INSERT INTO LIBRERIAS VALUES ('GEOGRAFIA',    'B',11);
INSERT INTO LIBRERIAS VALUES ('GEOLOGIA',    'B',7);
INSERT INTO LIBRERIAS VALUES ('SOCIEDAD',    'D',9);
INSERT INTO LIBRERIAS VALUES ('LABORES',     'B',20);
INSERT INTO LIBRERIAS VALUES ('JARDINERIA',    'E',0);
COMMIT;







select nombre ||'-'|| apellidos AS NOMBRE , 'Nacio en el a�o '||  EXTRACT(YEAR FROM FECHA_NAC)   as "fecha nacimiento"
from alumnos 
order by  EXTRACT(year FROM FECHA_NAC);





select nombre ||'-'|| apellidos AS NOMBRE , 'Nacio en el a�o '||  EXTRACT(YEAR FROM FECHA_NAC)   as "fecha nacimiento"
from alumnos 
order by  EXTRACT(year FROM FECHA_NAC);


select nombre ||'-'|| apellidos , 'Nacio en el a�o '||  EXTRACT(YEAR FROM FECHA_NAC)   as "fecha nacimiento"
from alumnos 
order by  EXTRACT(year FROM FECHA_NAC);


select nombre ||'-'|| apellidos , FECHA_NAC, 'Nacio en el a�o '||  EXTRACT(YEAR FROM FECHA_NAC)   as "fecha nacimiento"
from alumnos 
order by  EXTRACT(year FROM FECHA_NAC);




select nombre , apellidos , fecha_nac as "fecha nacimiento"
from alumnos 
order by  EXTRACT(year FROM FECHA_NAC);



--fecha formateada tendr� el siguiente formato: Naci� el 12 de mayo de 2001
SELECT NOMBRE, APELLIDOS, 'Naci� el ' || TO_CHAR(FECHA_NAC, 'DAY"de" MONTH "de" YY') AS FECHA_FORMATEADA
FROM ALUMNOS;

SELECT NOMBRE, APELLIDOS, 'Naci� el ' || TO_CHAR(FECHA_NAC, 'Day "de" MONTH "de" YY') AS FECHA_FORMATEADA
FROM ALUMNOS;
SELECT NOMBRE, APELLIDOS, 'Naci� el ' || TO_CHAR(FECHA_NAC, 'DD "de" MONTH "de" YY') AS FECHA_FORMATEADA
FROM ALUMNOS;
SELECT NOMBRE, APELLIDOS, 'Naci� el ' || TO_CHAR(FECHA_NAC, 'DD "de" MONTH "de" YYYY') AS FECHA_FORMATEADA
FROM ALUMNOS;
SELECT NOMBRE, APELLIDOS, 'Naci� el ' || TO_CHAR(FECHA_NAC, 'DD "de" MONTH "de" YYYY') AS FECHA_FORMATEADA
FROM ALUMNOS;



--Obtener APELLIDOS y NOMBRE en un solo campo, que se llamar� NOMBRE COMPLETO y la
--poblaci�n, de la tabla ALUMNOS, de los alumnos que vivan en TALAVERA, ordenado
--alfab�ticamente por APELLIDOS. �Ves algo mejorable?



--Obtener el NOMBRE en may�sculas, CURSO y el NIVEL en min�sculas de la tabla ALUMNOS,
--de los alumnos que est�n en el segundo curso de un ciclo formativo, ordenado de tal forma
--que aparezcan primero los alumnos de grado superior.

SELECT UPPER(CONCAT(CONCAT(NOMBRE,' '),APELLIDOS)) AS 
"NOMBRE COMPLETO" ,LOWER(NIVEL) AS "NIVEL", CURSO
FROM ALUMNOS WHERE CURSO=2 AND NIVEL LIKE 'CF$' 
ORDER BY NIVEL DESC;

--Mostrar NOMBRE, POBLACION (con s�lo la primera letra en may�sculas) y PROVINCIA (en
--min�sculas), de la tabla ALUMNOS, de aquellos alumnos, que tengan un nombre compuesto.
--No se pueden utilizar comodines.
SELECT INITCAP(NOMBRE),INITCAP(POBLACION),LOWER(PROVINCIA)
FROM ALUMNOS
WHERE INSTR(NOMBRE, ' ') NOT LIKE 0;


--Obtener la mejor nota (MEJOR Nota) y la peor nota (PEOR Nota), 
--obtenida por los alumnos
--en cada una de las evaluaciones, de la tabla NOTAS_ALUMNOS.

SELECT MAX(NOTA1)AS "NOTA 1 MEJOR" ,MIN(NOTA1) AS "PEOR NOTA 1EVAU", 
    MAX(NOTA2)AS "NOTA 2 MEJOR" ,MIN(NOTA2) AS "PEOR NOTA 2EVAU",
    MAX(NOTA3)AS "NOTA 3 MEJOR" ,MIN(NOTA3) AS "PEOR NOTA 3EVAU"
    FROM NOTAS_ALUMNOS;
    
--5. Obtener APELLIDOS y NOMBRE en un solo campo, que se llamar� NOMBRE COMPLETO, de la
--tabla ALUMNOS. El campo APELLIDOS tendr� una longitud de 20 caracteres (si el campo ocupa
--menos de 20 caracteres rellenaremos con el car�cter �.� hasta completar los 20 caracteres).
--No se puede utilizar la funci�n CONCAT  MARTIN SANCHEZ......BLANCA

SELECT NOMBRE || RPAD(APELLIDOS,20,'.')||NOMBRE AS "NOMBRE COMPLETO"
FROM ALUMNOS;


--Obtener TEMA de la tabla LIBRERIAS de los temas que empiecen por �GEO� y acaben en �ia� y
--tengan entre 5 y 20 ejemplares.

SELECT TEMA 
FROM LIBRERIAS 
WHERE UPPER(TEMA) LIKE 'GEO%' AND LOWER(TEMA) LIKE '%ia%'
AND EJEMPLARES BETWEEN 5 AND 20; 

--Obtener cuantos TEMAS de la tabla LIBRERIAS de los temas que empiecen por �geo� y acaben
--en �ia� y tengan entre 5 y 20 ejemplares.

SELECT COUNT(TEMA)AS "NUMERO DE TEMAS"
FROM LIBRERIAS 
WHERE UPPER (TRIM(TEMA)) LIKE 'GEO%' AND LOWER(TEMA) LIKE '%ia%'
AND EJEMPLARES BETWEEN 5 AND 20;

--Obtener TEMA y cuantos TEMAS de la tabla LIBRERIAS de los temas que empiecen por �geo� y
--acaben en �fia� y tengan entre 5 y 20 ejemplares. �Qu� resultados obtienes? Explica el
--resultado obtenido

SELECT TEMA, COUNT(TEMA)"NUMERO TEMAS"
FROM LIBRERIAS 
WHERE LOWER (TRIM(TEMA)) LIKE 'geo%' and LOWER(TEMA)LIKE '%fia%'
GROUP BY TEMA;

--9. Obtener el NOMBRE, DIRECCION y PROVINCIA de la tabla ALUMNOS, de los alumnos que vivan
--en la provincia de TOLEDO y que no vivan en el n�mero de 20 de su calle o avenida.

SELECT NOMBRE, DIRECCION, PROVINCIA
FROM ALUMNOS
WHERE PROVINCIA LIKE 'TOLEDO' AND DIRECCION NOT LIKE '%20';

--10. Obtener la media de las faltas, de todos los alumnos, de la primera evaluaci�n con dos
--decimales (MEDIA FALTAS 1� EVALUACI�N), la suma de las faltas de todos los alumnos, de la
--segunda evaluaci�n (SUMA FALTAS SEGUNDA EVALUACION), el n�mero de alumnos que
--tenemos actualmente (TOTAL ALUMNOS), de la tabla ALUMNOS.

SELECT ROUND(AVG(FALTAS1),2)AS "MEDIA FALTA 1 EVAU" ,
SUM(FALTAS2)"SUMA FALTA 2EVAU",
COUNT(DNI)"TOTAL ALUMNO"
FROM ALUMNOS;


--Obtener el NOMBRE, APELLIDOS, POBLACI�N y la media de faltas, redondeado al entero
--superior de la tabla ALUMNOS, de los alumnos que tengan una media m�s de un tres, y menos
--de un 7, que se llamen �BLANCA� de nombre, vivan en �TORRIJOS� y se apelliden �LOPEZ�.

SELECT NOMBRE, APELLIDOS, POBLACION, ((FALTAS1+FALTAS2+FALTAS3)/3) AS "MEDIA FALTAS"
FROM ALUMNOS
WHERE ((FALTAS1+FALTAS2+FALTAS3)/3) BETWEEN 3 AND 7
AND TRIM(NOMBRE) LIKE 'BLANCA' AND POBLACION LIKE 'TORRIJOS'
AND APELLIDOS LIKE '%LOPEZ%';

--12. Obtener el mayor y el menor n�mero de faltas en la tercera evaluaci�n.
SELECT MAX(FALTAS3)"MAXIMO",MIN(FALTAS3)"MINIMO"
FROM ALUMNOS;
--1313. Obtener la media de las faltas, de todos los alumnos, de la tercera evaluaci�n con dos
--decimales. No se puede utilizar la funci�n AVG.

SELECT ROUND(SUM (FALTAS3)/COUNT(*),2)"MEDIA FALTAS"
FROM ALUMNOS;
--14. Obtener NOMBRE, APELLIDOS, DIRECCI�N, POBLACION, PROVINCIA, adem�s tendr�s que
--mostrar el CURSO y la CLASE en un solo campo que se llamar� GRUPO y la media de faltas de
--cada alumno, que se llamar� FALTAS, de la tabla ALUMNOS, de los alumnos que tengan una
--media de faltas superior a 5 faltas, ordenado por la media de las faltas.
--El NOMBRE y los APELLIDOS, aparecer�n con la primera letra en may�scula y el resto en min�scula.
--La POBLACION, la PROVINCIA y la DIRECCI�N, aparecer�n en may�sculas.
--CURSO y CLASE, es decir GRUPO, aparecer� en min�sculas de la siguiente forma: �2�c�
--La media de faltas, es decir FALTAS, aparecer� con dos decimales

-------------------------------------------------------------



--15. Obtener s�lo los APELLIDOS y la nota media de las tres evaluaciones, que se llamar� NOTA
--MEDIA de la tabla NOTAS_ALUMNOS, de aquellos alumnos que hayan aprobado todas las
--evaluaciones. Ordenado alfab�ticamente por APELLIDOS.
--La NOTA MEDIA ser� el valor al entero inmediatamente superior a la nota media obtenida, y
--los APELLIDOS aparecer�n sin la coma al final.

select substr(nombre_alumno,1,instr(nombre_alumno,',')-1)"apellidos",
ceil((nota1+nota2+nota3)/3) "nota media"
from notas_alumnos
where nota1>=5 and nota2>=5 and nota3>=5
order by 1;

--16. Una vez hayas realizado la consulta del apartado anterior, realiza la misma consulta
--cambiando que la NOTA MEDIA sea el valor al entero inmediatamente inferior a la nota media
--obtenida. Observa los resultados obtenidos.

select substr(nombre_alumno,1,instr(nombre_alumno,',')-1)"apellidos",
floor((nota1+nota2+nota3)/3) "nota media"
from notas_alumnos
where nota1>=5 and nota2>=5 and nota3>=5
order by 1;

--17. Una vez hayas realizado la consulta del apartado anterior, realiza la misma consulta
--cambiando que la NOTA MEDIA se redondee a dos decimales. Observa los resultados
--obtenidos.
select substr(nombre_alumno,1,instr(nombre_alumno,',')-1)"apellidos",
round(((nota1+nota2+nota3)/3),2) "nota media"
from notas_alumnos
where nota1>=5 and nota2>=5 and nota3>=5
order by 1;

--18. Obtener NOMBRE, APELLIDOS y el segundo APELLIDO, que se llamara SEGUNDO APELLIDO de
--la tabla ALUMNOS, de los alumnos que tengan de segundo apellido �martin�.
--Aunque el criterio de selecci�n sea en min�sculas, el SEGUNDO APELLIDO debe aparecer en
--may�sculas en la salida. Realizar la consulta sin comodines.

select nombre , apellidos ,
 substr(apellidos,instr(apellidos,' ')+1)"segundo apellido"
 from alumnos
 where lower(substr(apellidos,instr(apellidos,' ')+1) )like 'martin';
 
 
-- 19. Obtener NOMBRE y APELLIDOS de la tabla ALUMNOS, de los alumnos que tengan de primer
--apellido �martin�.
--Aunque el criterio de selecci�n sea en min�sculas, el SEGUNDO APELLIDO debe aparecer en
--may�sculas en la salida. Realizar la consulta sin comodines. �����������������������������������������������������������.
select nombre , apellidos
from alumnos 
where lower(substr(apellidos,1,instr(apellidos,' ')-1)) like 'martin';
--20. Obtener la fecha actual de dos formas diferentes, compara los resultados.

select to_char(sysdate,'Day,DD/MM/YYY'),
to_char(sysdate,'Day,"DE" Month "DE" YYYY')
FROM DUAL;

--21. Obtener NOMBRE, APELLIDOS y FECHA_NAC, en la salida aparecer� como FECHA DE
--NACIMIENTO, de la tabla ALUMNOS, ordenado por fecha, de tal forma que aparezcan en
--primer lugar las fechas m�s recientes.

SELECT NOMBRE , APELLIDOS ,FECHA_NAC "FECHA NACIMIEMTO"
FROM ALUMNOS 
ORDER BY FECHA_NAC DESC;
--22. Obtener la fecha de hoy para que aparezca con los siguientes formatos:
SELECT TO_CHAR(SYSDATE,'month DD ,YYYY')"FECHA FORMATO",
TO_CHAR(SYSDATE,'MM--DD--YY')"YY",
TO_CHAR(SYSDATE,'MM')"MM",
TO_CHAR(SYSDATE,'YY')"AA",
TO_CHAR(SYSDATE,'YYYY')"AAAA",
TO_CHAR(SYSDATE,'MON')"MES",
TO_CHAR(SYSDATE,'mon')"mon"
from dual;

--23. Obtener NOMBRE, APELLIDOS y FECHA_NAC, en la salida aparecer� como FECHA DE
--NACIMIENTO, as� como el nombre del mes y el n�mero de d�as del mes en el que nacieron
--cada uno de los alumnos, de la tabla ALUMNOS, ordenado por fecha, de tal forma que
--aparezcan en primer lugar las fechas m�s recientes.

select nombre,apellidos,to_char(fecha_nac,'DD/MM/YYYY')"FECHA NACIMIENTO",
TO_CHAR(FECHA_NAC,'MONTH')"MES NACIMEINTO",
TO_CHAR(LAST_DAY(FECHA_NAC),'DD')"NUMERO DIA MES NACIMENTO"
FROM ALUMNOS
ORDER BY FECHA_NAC DESC;

--24. Obtener el NOMBRE, APELLIDOS y el a�o de nacimiento, en la salida aparecer� como A�O DE
--NACIMIENTO, de la tabla ALUMNOS, ordenador por el a�o de nacimiento. Cada uno de los
--resultados tendr� que aparecer con siguiente formato:
--Blanca - Martin S�nchez naci� en el a�o 2000

SELECT INITCAP(NOMBRE) ||' - '||INITCAP(APELLIDOS) ||' NACIO EN EL A�O '||TO_CHAR(FECHA_NAC,'YYYY')"A�O NACIMIENTO"
FROM ALUMNOS
ORDER BY EXTRACT( YEAR FROM FECHA_NAC);

--25. Obtener el NOMBRE, APELLIDOS y FECHA_NAC de la tabla ALUMNOS de los alumnos nacidos
--en el a�o 2000.
SELECT NOMBRE ,APELLIDOS , FECHA_NAC ---CON NUMEROS
FROM ALUMNOS
WHERE EXTRACT(YEAR FROM FECHA_NAC)=2001;
                                          --CON CADENAS
                                          
SELECT NOMBRE ,APELLIDOS , FECHA_NAC 
FROM ALUMNOS
WHERE TO_CHAR(FECHA_NAC,'YYYY')LIKE '2001';


--26. Obtener NOMBRE, FECHA_NAC, y la fecha FECHA_FORMATEADA, de la tabla ALUMNOS, la
--fecha formateada tendr� el siguiente formato:
--Naci� el 12 de mayo de 2001

SELECT NOMBRE , FECHA_NAC , 'NACIO EL ' ||TO_CHAR(FECHA_NAC ,'DD "DE" month "de  "YYYY')"FECHA FORMATEADA"
FROM ALUMNOS;

--27. Obtener el NOMBRE, APELLIDOS y el d�a de la semana en que nacieron (en la salida aparecer�
--como DIA DE NACIMIENTO) de la tabla ALUMNOS.
SELECT NOMBRE , APELLIDOS, TO_CHAR(FECHA_NAC,'day')"dia nacimiento"
from alumnos;


--28. Obtener el NOMBRE, APELLIDOS, FECHA_NAC y el a�o de nacimiento de cada alumno, de la
--tabla ALUMNOS de los alumnos nacidos en la d�cada de los 80 y en la primera d�cada del
--siglo XXI.

SELECT NOMBRE , APELLIDOS , FECHA_NAC, TO_CHAR(FECHA_NAC,'YYYY')
FROM ALUMNOS
WHERE EXTRACT(YEAR FROM FECHA_NAC) BETWEEN 1980 AND 1989
OR 
EXTRACT (YEAR FROM FECHA_NAC) BETWEEN 2000 AND 2009;

--29. Obtener el NOMBRE, APELLIDOS, FECHA_NAC y el a�o de nacimiento de cada alumno, de la
--tabla ALUMNOS de los alumnos nacidos en la d�cada de los 80, en la d�cada de los 90 y en la
--primera d�cada del 2000, ordenado por el a�o de nacimiento.
SELECT NOMBRE , APELLIDOS , FECHA_NAC, TO_CHAR(FECHA_NAC,'YYYY')
FROM ALUMNOS

WHERE
EXTRACT (YEAR FROM FECHA_NAC) BETWEEN 2000 AND 2009
ORDER BY 4;


--30. Obtener el NOMBRE, APELLIDOS, FECHA_NAC y la edad que tiene cada alumno, de la tabla
--ALUMNOS.


SELECT NOMBRE , APELLIDOS , FECHA_NAC, TRUNC((SYSDATE-FECHA_NAC)/365) "EDAD1",
TRUNC(MONTHS_BETWEEN(SYSDATE ,FECHA_NAC)/12) "MES"
FROM ALUMNOS;
SELECT NOMBRE, APELLIDOS, FECHA_NAC
FROM ALUMNOS
WHERE 
    (EXTRACT(MONTH FROM FECHA_NAC) = EXTRACT(MONTH FROM SYSDATE) AND EXTRACT(DAY FROM FECHA_NAC) >= EXTRACT(DAY FROM SYSDATE))
    OR 
    EXTRACT(MONTH FROM FECHA_NAC) = EXTRACT(MONTH FROM ADD_MONTHS(SYSDATE, 1))
    OR 
    EXTRACT(MONTH FROM FECHA_NAC) = EXTRACT(MONTH FROM ADD_MONTHS(SYSDATE, 2));


--32. Obtener el NOMBRE, APELLIDOS, FECHA_NAC y la edad que tiene cada alumno, de la tabla
--ALUMNOS, de aquellos alumnos que sean menores de edad el mes que viene.




















--31. Obtener el NOMBRE, APELLIDOS, FECHA_NAC de la tabla ALUMNOS, de aquellos alumnos
--cumplan a�os en los 2 pr�ximos meses.--malllllllllllllllllllllllllllllllllllll
SELECT NOMBRE, APELLIDOS, FECHA_NAC
FROM ALUMNOS
WHERE MONTH(FECHA_NAC) IN (MONTH(CURRENT_DATE), MONTH(DATEADD(MONTH, 1, CURRENT_DATE)))
AND EXTRACT(DAY FROM FECHA_NAC) >= EXTRACT(DAY FROM CURRENT_DATE)
ORDER BY MONTH(FECHA_NAC), EXTRACT(DAY FROM FECHA_NAC);


--32. Obtener el NOMBRE, APELLIDOS, FECHA_NAC y la edad que tiene cada alumno, de la tabla
--ALUMNOS, de aquellos alumnos que sean menores de edad el mes que viene.nom lo seeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee









--33. Obtener el NOMBRE, APELLIDOS concatenados y separados por una coma y un espacio, y el
---n�mero y nombre de mes correspondiente de su nacimiento, as� como el a�o, de la tabla de
--ALUMNOS.

SELECT NOMBRE || ', ' || APELLIDOS AS "Nombre completo", 
       TO_CHAR(FECHA_NAC, 'MM') AS "N�mero de mes", 
       TO_CHAR(FECHA_NAC, 'Month') AS "Nombre de mes", 
       TO_CHAR(FECHA_NAC, 'YYYY') AS "A�o"
FROM ALUMNOS
WHERE TO_CHAR(FECHA_NAC, 'Q') = 3;  --eso significan los trimestres que da 

--35. Convertir la cadena '010712' a fecha y visualizar su nombre de mes en may�sculas.

SELECT UPPER(TO_CHAR(TO_DATE('010712', 'DDMMYY'), 'MONTH')) AS "Nombre del Mes",
       TO_CHAR(TO_DATE('010712', 'DDMMYY'), 'YYYY') AS "A�o"
FROM DUAL;


--36. Convertir el n�mero 127 a cadena y mostrar el NOMBRE de todos los alumnos si la conversi�n
--se ha realizado correctamente.


--no se a que se refiere 



--37. Obtener la media de las notas de la primera evaluaci�n, la nota media de la segunda
--evaluaci�n y la nota media de la tercera evaluaci�n, de la tabla de NOTAS_ALUMNOS.

SELECT AVG(nota1) AS "media 1", AVG(nota2) AS "media 2", AVG(nota3) AS "media 3"
FROM notas_alumnos
GROUP BY nombre_alumno;


SELECT AVG(nota1) AS "media nota1", AVG(nota2) AS "media nota2", AVG(nota3) AS "media nota3"
FROM notas_alumnos;


--38. Obtener la media de las notas de la primera evaluaci�n, la nota media de la segunda
--evaluaci�n y la nota media de la tercera evaluaci�n, de la tabla de NOTAS_ALUMNOS, si hay
--alg�n valor que sea null tendremos que sustituirlo por el valor 0. Compara los resultados de
--esta consulta con el resultado obtenido en la consulta anterior

SELECT AVG(COALESCE(nota1, 0)) AS media_primera_evaluacion,
       AVG(COALESCE(nota2, 0)) AS media_segunda_evaluacion,
       AVG(COALESCE(nota3, 0)) AS media_tercera_evaluacion
FROM NOTAS_ALUMNOS;

--39. Obtener cuantas notas hay en la primera evaluaci�n, cuantas notas hay en la segunda
--evaluaci�n y cuantas notas hay en la tercera evaluaci�n, de la tabla de NOTAS_ALUMNOS.

SELECT count(nota1) AS "media nota1", count(nota2) AS "media nota2", count(nota3) AS "media nota3"
FROM notas_alumnos;


--40. Obtener cuantas notas hay en la primera evaluaci�n, cuantas notas hay en la segunda
--evaluaci�n y cuantas notas hay en la tercera evaluaci�n, de la tabla de NOTAS_ALUMNOS.
--Consideramos que todos los alumnos tienen nota independientemente del valor que tenga la
--nota. Compara los resultados de esta consulta con el resultado obtenido en la consulta
-- anterior.



