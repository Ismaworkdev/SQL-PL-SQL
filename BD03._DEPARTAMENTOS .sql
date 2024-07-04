
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
INSERT INTO DEPARTAMENTOS VALUES( 7, 'DISEÑO WEB', 5000, 66666); 
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
INSERT INTO EMPLEADOS VALUES( 33333,  'PILAR',      'PEREZ',    'ROLLAN', 1325, 'AV FRANCISCO AGUIRRE,102 2ºC', 'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('15/11/2016'), TO_DATE('02/08/1993'),1);
INSERT INTO EMPLEADOS VALUES( 88888,  'CRISTINA',   'CARRASCO', 'CASAL',  900,  'C  FELIX DEL RIO,5',           'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('01/10/2016'), TO_DATE('03/02/1975'),3);
INSERT INTO EMPLEADOS VALUES( 99999,  'TERESA',     'CORTES',   'TORRICO',1150, 'AV CULTURA,25',                'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('22/12/1999'), TO_DATE('10/09/1969'),2);
INSERT INTO EMPLEADOS VALUES( 44444,  'PEDRO PABLO','LOPEZ',    'PEREZ',  2200, 'C  HONDA,1',                   'HUECAS',               'TOLEDO',    '45511', 'H', TO_DATE('30/01/2005'), TO_DATE('03/11/1985'),4);
INSERT INTO EMPLEADOS VALUES( 55555,  'ANA',        'SANCHEZ',  'GARCIA', 2500, 'AV DEL OESTE,23',              'VILLAMANTA',           'MADRID',    '28051', 'M', TO_DATE('31/08/2012'), TO_DATE('25/12/1976'),5);
INSERT INTO EMPLEADOS VALUES( 66666,  'MARIA',      'RODRIGUEZ','RIBERA', 1000, 'AV AMADO GRANELL MESADO,23',   'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('20/05/2014'), TO_DATE('22/03/1989'),7);
INSERT INTO EMPLEADOS VALUES( 77777,  'PABLO',      'GOMEZ',    'ALEJO',  900,  'C  BERNARDINO VILLEGAS,1',     'OROPESA',              'TOLEDO',    '45560', 'H', TO_DATE('12/09/2015'), TO_DATE('05/01/1984'),3);
INSERT INTO EMPLEADOS VALUES( 14444,  'MIGUEL',     'GOMEZ',    'INISTA', 1325, 'C  CRISTO DEL OLVIDO,8',       'FUENSALIDA',           'TOLEDO',    '45510', 'H', TO_DATE('10/03/2010'), TO_DATE('05/01/1984'),4);
INSERT INTO EMPLEADOS VALUES( 12222,  'MARIA',      'GALAN',    'RODRIGO',2050, 'C  MARIA ZAMBRANO,48',         'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('15/10/2008'), TO_DATE('14/02/1957'),6); 
INSERT INTO EMPLEADOS VALUES( 13333,  'LUZ MARIA',  'YELMO',    'CRUZ',   1830, 'AV ALEJANDRA SOLER,3 1ºA',     'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('28/09/2006'), TO_DATE('31/01/1985'),6);
INSERT INTO EMPLEADOS VALUES( 15555,  'MARIA',      'GALAN',    'CASAL',  1325, 'C  TRES CRUCES,23',            'CADIZ',                'CADIZ',    '11000', 'M',  TO_DATE('03/03/2010'), TO_DATE('05/01/1990'),4);
INSERT INTO EMPLEADOS VALUES( 16666,  'MIGUEL',     'PEREZ',    'TORRICO',2050, 'AV DE LA CONSTITUCION,48',     'NAVALCARNERO',         'MADRID',    '28600', 'H', TO_DATE('21/01/2008'), TO_DATE('14/02/1990'),7); 
INSERT INTO EMPLEADOS VALUES( 17777,  'PEDRO JOSE', 'CORTES',   'CRUZ',   1830, 'C  CASTELLANAS,3 1ºA',         'CADIZ',                'CADIZ',     '11000', 'H', TO_DATE('28/02/2010'), TO_DATE('10/09/1979'),8);
INSERT INTO EMPLEADOS VALUES( 18888,  'CRISTINA',   'CARRASCO', 'CASAL',  2000, 'C  SANTA SABINA,5',            'TALAVERA DE LA REINA', 'TOLEDO',    '45600', 'M', TO_DATE('22/04/2014'), TO_DATE('03/02/1990'),3);


CREATE TABLE proyectos (
    cod_proy       NUMBER(5) NOT NULL,
    nombre         NVARCHAR2(50) NOT NULL,
    fecha_inicio   DATE NOT NULL,
    fecha_fin      DATE NOT NULL,
    descripcion    NVARCHAR2(500)
);

ALTER TABLE proyectos ADD CONSTRAINT proyectos_pk PRIMARY KEY ( cod_proy );

INSERT INTO PROYECTOS VALUES( 1, 'MONTAJE SERVIDORES',                   '05/01/2012', '01/04/2012','Montar los servidores para la empresa de construcción ENLADRILLADOS'); 
INSERT INTO PROYECTOS VALUES( 2, 'ESTUDIO SEGURIDAD PASIVA Y ACTIVA',    '20/04/2012', '30/06/2012','Estudio Seguridad Pasiva y Activa para la empresa de construcción ENLADRILLADOS'); 
INSERT INTO PROYECTOS VALUES( 3, 'INSTALACION DE SERVIDORES PROXY',      '01/02/2013', '05/02/2013','Instalación de serividor proxy para la asociación canina GUAGUAGUA'); 
INSERT INTO PROYECTOS VALUES( 4, 'DESARROLLO GESTION DE SERVICIOS VENTA','20/01/2013', '30/03/2013','Desarrollo aplicacion de gestion de ventas para tienda de paraguas NOCUELAGOTA'); 
INSERT INTO PROYECTOS VALUES( 5, 'CREACION PORTAL WEB',                  '10/10/2013', '30/10/2013','Creacion web optica BUENAVISTA'); 
INSERT INTO PROYECTOS VALUES( 6, 'INSTALACION RED',                      '20/01/2013', '30/03/2013','Instalación y puesta en funcionamiento de la red del servicio de atención al cliente de YOTEESCUCHO'); 
INSERT INTO PROYECTOS VALUES( 7, 'INSTALACION INTEGRAL DEL SERVICIOS Y SISTEMAS', '05/11/2013', '22/12/2013','Montaje e instalación de todos los servicios para la consulta odontologica QUEPIÑATA'); 
INSERT INTO PROYECTOS VALUES( 8, 'DESARROLLO PLATAFORMA ELEARNING',      '15/02/2018', '22/05/2018','Creación plataforma de aprendizaje para centro de formación MELOSETODO'); 

ALTER TABLE departamentos ADD CONSTRAINT departamentos_empleados_fk FOREIGN KEY ( dni_jefe_dpto )
    REFERENCES empleados ( dni );

ALTER TABLE emp_proy ADD CONSTRAINT emp_fk FOREIGN KEY ( empleados_dni )
    REFERENCES empleados ( dni );

ALTER TABLE empleados ADD CONSTRAINT empleados_departamentos_fk FOREIGN KEY ( dpto_cod )
    REFERENCES departamentos ( dpto_cod );

ALTER TABLE emp_proy ADD CONSTRAINT proy_fk FOREIGN KEY ( proyectos_cod_proy )
    REFERENCES proyectos ( cod_proy );

