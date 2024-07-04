
DROP TABLE  suministros cascade constraints;
DROP TABLE  det_compras cascade constraints;
DROP TABLE  compras cascade constraints;
DROP TABLE empleados cascade constraints;
DROP TABLE almacenes cascade constraints;
DROP TABLE articulos cascade constraints;
DROP TABLE proveedores cascade constraints;

purge recyclebin;


CREATE TABLE ALMACENES
(
	CODALMA  number(5) NOT NULL,
	NOMBRE VARCHAR2(20),
	POBLACION VARCHAR2(30),
	FACTURACION  number(10,2),
	PRIMARY KEY (CODALMA)
);


CREATE TABLE ARTICULOS
(
	CODARTI  number(5) NOT NULL,
	DENOMINACION VARCHAR2(20),
	CATEGORIA VARCHAR2(10),
	PVP  number(6,2),
	STOCK  number(5),
	PRIMARY KEY (CODARTI)
);


CREATE TABLE COMPRAS
(
	NUM_COMPRA  number(5) NOT NULL,
	CODALMA  number(5) NOT NULL,
	FECHA DATE,
	PRIMARY KEY (NUM_COMPRA)
);


CREATE TABLE DET_COMPRAS
(
	NUM_COMPRA  number(5) NOT NULL,
	CODARTI  number(5) NOT NULL,
	UNIDADES  number(5),
	PRIMARY KEY (NUM_COMPRA, CODARTI)
);


CREATE TABLE EMPLEADOS
(
	CODEMPLE  number(5) NOT NULL,
	NOMBRE VARCHAR2(20),
	POBLACION VARCHAR2(30),
	FECHAALTA DATE,
	SALARIO  number(6,2),
	CODALMA  number(5) NOT NULL,
	CODJEFE  number(5),
	PRIMARY KEY (CODEMPLE)
);


CREATE TABLE PROVEEDORES
(
	CODPROV  number(5) NOT NULL,
	NOMBRE VARCHAR2(20),
	POBLACION VARCHAR2(30),
	ZONA VARCHAR2(10),
	COMISION  number(5),
	PRIMARY KEY (CODPROV)
);


CREATE TABLE SUMINISTROS
(
	CODPROV  number(5) NOT NULL,
	CODARTI  number(5) NOT NULL,
	PRIMARY KEY (CODPROV, CODARTI)
);



/* Create Foreign Keys */

ALTER TABLE COMPRAS
	ADD FOREIGN KEY (CODALMA)
	REFERENCES ALMACENES (CODALMA)

;


ALTER TABLE EMPLEADOS
	ADD FOREIGN KEY (CODALMA)
	REFERENCES ALMACENES (CODALMA)

;


ALTER TABLE DET_COMPRAS
	ADD FOREIGN KEY (CODARTI)
	REFERENCES ARTICULOS (CODARTI)

;


ALTER TABLE SUMINISTROS
	ADD FOREIGN KEY (CODARTI)
	REFERENCES ARTICULOS (CODARTI)
;


ALTER TABLE DET_COMPRAS
	ADD FOREIGN KEY (NUM_COMPRA)
	REFERENCES COMPRAS (NUM_COMPRA)
;


ALTER TABLE EMPLEADOS
	ADD FOREIGN KEY (CODJEFE)
	REFERENCES EMPLEADOS (CODEMPLE)

;


ALTER TABLE SUMINISTROS
	ADD FOREIGN KEY (CODPROV)
	REFERENCES PROVEEDORES (CODPROV)

;



/* ------------------------------------------------------ */
/* ---------- ENTRADA DE DATOS -------------------------- */
insert into almacenes values (1,'Almac?n 1','Madrid', 50000);
insert into almacenes values (2,'Almac?n 2','Madrid', 70000);
insert into almacenes values (3,'Almac?n 3','Talavera', 80000);
insert into almacenes values (4,'Almac?n 4','Sevilla', 40000);
insert into almacenes values (5,'Almac?n 5','Sevilla', 55000);
insert into almacenes values (6,'Almac?n 6','Madrid', 45000);
insert into almacenes values (7,'Almac?n 7','Madrid', 55000);
insert into almacenes values (8,'Almac?n 8','Alcal?', 10000);

/* --------------------- art?culos ------------------------ */
insert into articulos values (1,'Artic 1','A', 10, 100);
insert into articulos values (2,'Artic 2','B', 15, 150);
insert into articulos values (3,'Artic 3','C', 20, 10);
insert into articulos values (4,'Artic 4','A', 25, 200);
insert into articulos values (5,'Artic 5','A', 30, 70);
insert into articulos values (6,'Artic 6','B', 12, 10);
insert into articulos values (7,'Artic 7','B', 24, 100);
insert into articulos values (8,'Artic 8','C', 15, 80);
insert into articulos values (9,'Artic 9','C', 60, 90);
insert into articulos values (10,'Artic 10','A', 70, 140);
insert into articulos values (11,'Artic 11','C', 60, 90);
insert into articulos values (12,'Artic 12','A', 70, 140);
insert into articulos values (13,'Artic 13','A', 50, 400);


/* --------------------- compras ------------------------ */
/* -- NUM_COMPRA - CODALMA -  FECHA ----------------- */ 

/* -- almacen 1  -- */ 

insert into compras select 1,1, sysdate -5 from dual;
insert into compras select 2,1, sysdate -4 from dual;
insert into compras select 3,1, sysdate -3 from dual;
insert into compras select 4,1, sysdate -1 from dual;

/* -- almacen 2  -- */ 
insert into compras select 5,2, sysdate -5 from dual;
insert into compras select 6,2, sysdate -4 from dual;

/* -- almacen 3  -- */ 
insert into compras select 7,3, sysdate -3 from dual;
insert into compras select 8,3, sysdate -1 from dual;

/* -- almacen 4  -- */ 
insert into compras select 9,4, sysdate -3 from dual;
insert into compras select 10,4, sysdate -1 from dual; 

/* -- almacen 5  -- */ 
insert into compras select 11,5, sysdate -5 from dual;
insert into compras select 12,5, sysdate -1 from dual;

/* -- almacen 6  -- */ 
insert into compras select 13,6, sysdate -5 from dual;
insert into compras select 14,6, sysdate -4 from dual;
insert into compras select 15,6, sysdate -3 from dual;
insert into compras select 16,6, sysdate -2 from dual;
insert into compras select 17,6, sysdate -1 from dual;

/* -- almacen 7 , compra sin detalle -- */ 
insert into compras select 18,7, sysdate -1 from dual;

/* -- ------------------- Detalle compras -------------  -- */ 
/* NUM_COMPRA , CODARTI, UNIDADES  ----------------- */
/* compra 1, almacen 1 */
insert into det_compras values( 1,1,10);
insert into det_compras values( 1,2,8);
insert into det_compras values( 1,3,20);
insert into det_compras values( 1,4,5);
insert into det_compras values( 1,5,15);

/* compra 2, almacen 1 */
insert into det_compras values( 2,2,5);
insert into det_compras values( 2,3,4);
insert into det_compras values( 2,4,10);
insert into det_compras values( 2,5,5);
insert into det_compras values( 2,6,5);
insert into det_compras values( 2,7,8);
insert into det_compras values( 2,8,5);

/* compra 3, almacen 1 */
insert into det_compras values( 3,5,4);
insert into det_compras values( 3,6,10);
insert into det_compras values( 3,7,5);
/* compra 4, almacen 1 */
insert into det_compras values( 4,1,5);
insert into det_compras values( 4,5,4);
insert into det_compras values( 4,6,10);
insert into det_compras values( 4,7,5);

/* -- compra 5 almacen 2  -- */ 
insert into det_compras values( 5,7,5);
insert into det_compras values( 5,8,10);
insert into det_compras values( 5,9,10);
insert into det_compras values( 5,10,15);

/* -- compra 6 almacen 2  -- */ 
insert into det_compras values( 6,3,5);
insert into det_compras values( 6,4,10);
insert into det_compras values( 6,5,10);
insert into det_compras values( 6,6,10);
insert into det_compras values( 6,7,10);
insert into det_compras values( 6,8,10);

/* -- compra 7 almacen 3  -- */ 
insert into det_compras values( 7,1,5);
insert into det_compras values( 7,2,10);
insert into det_compras values( 7,3,10);
insert into det_compras values( 7,10,15);

/* -- compra 8 almacen 3  -- */ 
insert into det_compras values( 8,2,5);
insert into det_compras values( 8,4,10);
insert into det_compras values( 8,5,10);
insert into det_compras values( 8,6,10);
insert into det_compras values( 8,7,10);
insert into det_compras values( 8,8,10);

/* -- compra 9 almacen 4  -- */ 
insert into det_compras values( 9,1,15);
insert into det_compras values( 9,3,10);
insert into det_compras values( 9,5,20);
insert into det_compras values( 9,7,15);
insert into det_compras values( 9,11,15);

/* -- compra 10 almacen 4  -- */ 
insert into det_compras values( 10,2,5);
insert into det_compras values( 10,4,10);
insert into det_compras values( 10,5,10);
insert into det_compras values( 10,6,10);
insert into det_compras values( 10,7,10);
insert into det_compras values( 10,8,15);
insert into det_compras values( 10,9,5);


/* -- compra 11 almacen 5  -- */ 
insert into det_compras values( 11,1,15);
insert into det_compras values( 11,3,10);


/* -- compra 12 almacen 5  -- */ 
insert into det_compras values( 12,1,5);
insert into det_compras values( 12,2,5);
insert into det_compras values( 12,6,8);
insert into det_compras values( 12,4,10);
insert into det_compras values( 12,7,10);
insert into det_compras values( 12,8,15);

/* -- compra 13 almacen 6  -- */ 
insert into det_compras values( 13,2,15);

/* -- compra 14 almacen 6  -- */ 
insert into det_compras values( 14,1,15);
insert into det_compras values( 14,8,10);
insert into det_compras values( 14,9,20);

/* -- compra 15 almacen 6  -- */ 
insert into det_compras values( 15,1,5);
insert into det_compras values( 15,2,5);
insert into det_compras values( 15,6,20);
insert into det_compras values( 15,9,10);
/* -- compra 16 almacen 6  -- */ 
insert into det_compras values( 16,1,15);
insert into det_compras values( 16,2,25);
insert into det_compras values( 16,3,5);
insert into det_compras values( 16,7,5);
insert into det_compras values( 16,8,10);
insert into det_compras values( 16,9,5);
insert into det_compras values( 16,10,15);
insert into det_compras values( 16,11,10);

/* -- compra 17 almacen 6  -- */ 
insert into det_compras values( 17,10,10);
insert into det_compras values( 17,11,10);



/* --------------------- empleados ------------------------ */
/* -- CODEMPLE - NOMBRE - POBLACION- FECHAALTA --SALARIO-----CODALMA-----CODJEFE----- */ 
/* -- almacen 1  -- */ 
insert into empleados 
   select 1,'Empleado 1','Madrid', sysdate -100, 1000, 1, null from dual;
insert into empleados 
   select 2,'Empleado 2','Madrid', sysdate -150, 1200, 1, 1 from dual;
insert into empleados 
   select 3,'Empleado 3','Madrid', sysdate -170, 1250, 1, 1 from dual;
insert into empleados 
   select 4,'Empleado 4','Alcal? de Henares', sysdate -190, 1350, 1, 3 from dual;
 
/* -- almacen 2  -- */ 
  insert into empleados 
   select 5,'Empleado 5','Madrid', sysdate -90, 1000, 2, null from dual;
insert into empleados 
   select 6,'Empleado 6','Coslada', sysdate -130, 1200, 2, 5 from dual;
insert into empleados 
   select 7,'Empleado 7','Madrid', sysdate -150, 1250, 2, 5 from dual;
insert into empleados 
   select 8,'Empleado 8','Alcal? de Henares', sysdate -190, 1350, 2, 5 from dual;
insert into empleados 
   select 9,'Empleado 9','Alcal? de Henares', sysdate -180, 1350, 2, 5 from dual;
   
  /* -- almacen 3  -- */ 
  insert into empleados 
   select 10,'Empleado 10','Talavera', sysdate -90, 1100, 3, null from dual;
insert into empleados 
   select 11,'Empleado 11','Talavera', sysdate -130, 1200, 3, 10 from dual;
insert into empleados 
   select 12,'Empleado 12','Talavera', sysdate -150, 1250, 3, 10 from dual;
insert into empleados 
   select 13,'Empleado 13','Oropesa', sysdate -190, 1350, 3, 10 from dual;
insert into empleados 
   select 14,'Empleado 14','Oropesa', sysdate -130, 1650, 3, 5 from dual;
insert into empleados 
   select 15,'Empleado 15','Talavera', sysdate -140, 1850, 3, 14 from dual;
insert into empleados 
   select 16,'Empleado 16','Talavera', sysdate -130, 1850, 3, 14 from dual;
   
    /* -- almacen 4  -- */ 
  insert into empleados 
   select 17,'Empleado 17','Sevilla', sysdate -90, 1200, 4, null from dual;
insert into empleados 
   select 18,'Empleado 18','Sevilla', sysdate -130, 1200, 4, 17 from dual;
insert into empleados 
   select 19,'Empleado 19','Ja?n', sysdate -150, 1250, 4, 17 from dual;

/* --------------------- proveedores ------------------------ */
/* -- CODPROV - NOMBRE - POBLACION- ZONA --COMISION ---- */ 

insert into proveedores values (1,'Proveedor 1', 'Madrid', 'CENTRO', 1000);
insert into proveedores values (2,'Proveedor 2', 'Madrid', 'CENTRO', 1500);
insert into proveedores values (3,'Proveedor 3', 'Sevilla', 'SUR', 1700);
insert into proveedores values (4,'Proveedor 4', 'Toledo', 'CENTRO', 1660);
insert into proveedores values (5,'Proveedor 5', 'Madrid', 'CENTRO', 1500);
insert into proveedores values (6,'Proveedor 6', 'Cadiz', 'SUR', 1600);
insert into proveedores values (7,'Proveedor 7', 'Barcelona', 'CATALU?A', 1900);
insert into proveedores values (8,'Proveedor 8', 'Madrid', 'CENTRO', 1000);
insert into proveedores values (9,'Proveedor 9', 'Madrid', 'CENTRO', 1500);
insert into proveedores values (10,'Proveedor 10', 'Ja?n', 'SUR', 1700);
insert into proveedores values (11,'Proveedor 11', 'Toledo', 'CENTRO', 1600);
insert into proveedores values (12,'Proveedor 12', 'Valencia', 'LEVANTE', 1550);
insert into proveedores values (13,'Proveedor 13', 'Tarragona', 'CATALU?A', 1670);
insert into proveedores values (14,'Proveedor 14', 'Gerona', 'CATALU?A', 1800);
insert into proveedores values (15,'Proveedor 15', 'Alicante', 'LEVANTE', 1700);
insert into proveedores values (16,'Proveedor 16', 'Elche', 'LEVANTE', 1500);

/* --------------------- suministros ------------------------ */
/* -- CODPROV - CODARTI -  */ 
/* -- proveedor 1  -- */ 
insert into suministros values( 1,1);
insert into suministros values( 1,2);
insert into suministros values( 1,3);
insert into suministros values( 1,7);
/* -- proveedor 2  -- */ 
insert into suministros values( 2,1);
insert into suministros values( 2,2);
insert into suministros values( 2,3);
insert into suministros values( 2,4);
insert into suministros values( 2,5);
insert into suministros values( 2,6);
insert into suministros values( 2,7);
insert into suministros values( 2,8);

/* -- proveedor 3  -- */ 
insert into suministros values( 3,1);
insert into suministros values( 3,2);
insert into suministros values( 3,3);
insert into suministros values( 3,4);


/* -- proveedor 4  -- */ 
insert into suministros values( 4,5);
insert into suministros values( 4,6);
insert into suministros values( 4,7);
insert into suministros values( 4,8);

/* -- proveedor 5  -- */ 
insert into suministros values( 5,8);
insert into suministros values( 5,9);
insert into suministros values( 5,10);
insert into suministros values( 5,11);

/* -- proveedor 6  -- */ 
insert into suministros values( 6,3);
insert into suministros values( 6,4);
insert into suministros values( 6,5);

/* -- proveedor 7  -- */ 
insert into suministros values( 7,6);
insert into suministros values( 7,7);
insert into suministros values( 7,8);

/* -- proveedor 8  -- */ 
insert into suministros values( 8,1);
insert into suministros values( 8,2);
insert into suministros values( 8,3);

/* -- proveedor 9  -- */ 
insert into suministros values( 9,1);
insert into suministros values( 9,2);
insert into suministros values( 9,3);

/* -- proveedor 10  -- */ 
insert into suministros values( 10,1);

/* -- proveedor 11  -- */ 
insert into suministros values( 11,2);
insert into suministros values( 11,3);

/* -- proveedor 12  -- */ 
insert into suministros values( 12,1);

/* -- proveedor 13  -- */ 
insert into suministros values( 13,12);
insert into suministros values( 13,13);


/* -- proveedor 14  -- */ 
insert into suministros values( 14,11);

/* -- proveedor 15  -- */ 
insert into suministros values( 15,9);
insert into suministros values( 15,10);

--?	Realizar un bloque PL para visualizar los art�culos de un n�mero de compra le�do de teclado. Obtener
--NUM COMPRA  CODARTI   DENOMINACION  CATEGORIA  UNIDADES  PVP  IMPORTE  STOCK-ACTUAL
----------  ---------  -------------- ---------- ---------- ------ -------- -------
--xxxxxxxxxx    xxxx     xxxxxxxxxx    xxxxxx    xxxxx     xxxx   xxxxxx    xxxxxxx
--xxxxxxxxxx    xxxx     xxxxxxxxxx    xxxxxx     xxxxx     xxxx   xxxxxx    xxxxxxx
----------  ---------  -------------- ---------- ---------- ------ -------- -------
--TOTALES DE UNIDADES: xxxxxx
--TOTAl IMPORTE: xxxxxxxx

--Donde IMPORTE = PVP * UNIDADES
---STOCK-ACTUAl = STOCK � UNIDADES
 SET SERVEROUTP ON
SET VERIFY OFF

DECLARE 
    NUMERO_COMPRA NUMBER(2);
    CURSOR C1 IS SELECT * FROM DET_COMPRAS D WHERE NUMERO_COMPRA = D.NUM_COMPRA;
    VARIABLE_DET_COMPRA C1%ROWTYPE;
    
    CURSOR C2(VARIABLE_DET DET_COMPRAS.CODARTI%TYPE) IS 
        SELECT CODARTI, DENOMINACION, CATEGORIA, PVP, STOCK 
        FROM ARTICULOS
        WHERE CODARTI = VARIABLE_DET;
    VARIABLE_ARTICULO C2%ROWTYPE;
    
    TOTAL_UNIDADES NUMBER(10) := 0;
    TOTAL_IMPORTE NUMBER(10) := 0; 
BEGIN
    NUMERO_COMPRA := TO_NUMBER(TRIM('&NUMERO_COMPRA'));
            DBMS_OUTPUT.PUT_LINE('NUM_COMPRA: ' || VARIABLE_DET_COMPRA.NUM_COMPRA);
         DBMS_OUTPUT.PUT_LINE('NUM COMPRA             CODARTI          DENOMINACION      CATEGORIA          UNIDADES           PVP                IMPORTE             STOCK-ACTUAL');
            DBMS_OUTPUT.PUT_LINE('------------      ------------       ------------      ------------      ------------      ------------        ------------         ------------');
    OPEN C1;
    LOOP
        FETCH C1 INTO VARIABLE_DET_COMPRA;
        EXIT WHEN C1%NOTFOUND;
        

        OPEN C2(VARIABLE_DET_COMPRA.CODARTI);
        LOOP
            FETCH C2 INTO VARIABLE_ARTICULO;
            EXIT WHEN C2%NOTFOUND;
            
           
            DBMS_OUTPUT.PUT_LINE(VARIABLE_DET_COMPRA.NUM_COMPRA || '                ' || VARIABLE_ARTICULO.CODARTI || '                  ' || VARIABLE_ARTICULO.DENOMINACION || '                  ' || VARIABLE_ARTICULO.CATEGORIA || '                    ' || VARIABLE_DET_COMPRA.UNIDADES || '          ' || VARIABLE_ARTICULO.PVP || '                        ' || VARIABLE_ARTICULO.PVP * VARIABLE_DET_COMPRA.UNIDADES || '                        ' || (VARIABLE_ARTICULO.STOCK - VARIABLE_DET_COMPRA.UNIDADES) || '   ');
        END LOOP;
        
        CLOSE C2;
    END LOOP;
    
    CLOSE C1;
    
    -- Cierre de la sesi�n DBMS_OUTPUT
    DBMS_OUTPUT.PUT_LINE('Fin del proceso.');
END;


--?	Realizar un bloque PL que visualice por cada almac�n el n�mero de compras realizadas y el total importe de sus compras. Visualizar tambi�n el total de compras realizadas por los almacenes y el total importe de todos los almacenes.
--COD_ALMACEN	  NOMBRE	    NUM_COMPRAS 	TOTAL IMPORTE
--------------    --------------  ------------     -------------
--XXXXXXX         XXXXXXXXXXXXX      XXXXXX           XXXXXXXX
--XXXXXXX         XXXXXXXXXXXXX      XXXXXX           XXXXXXXX
--XXXXXXX         XXXXXXXXXXXXX      XXXXXX           XXXXXXXX

--TOTAL COMPRAS: XXXXXXXXXXX (totalcompra)
--TOTAL IMPORTE TODOS LOS ALMACENES: XXXXXXXX   (totalimporte)  

--NUM_COMPRAS: es el n�mero de compras que realiza cada almac�n.
--TOTAL IMPORTE: es la suma de los importes de las compras de cada almac�n. Los importes se calculan multiplicando el PVP*UNIDADES de los art�culos de las compras de los almacenes.
--TOTAL COMPRAS: suma del n�mero de compras de los almacenes.
--TOTAL IMPORTE TODOS LOS ALMACENES: suma de los totales importe de cada almac�n.



DECLARE
    CURSOR C1 IS SELECT * FROM ALMACENES;
    VARIABLE_ALMACENES C1%ROWTYPE;

    CURSOR C2(VARIABLE_ALMA ALMACENES.CODALMA%TYPE) IS
        SELECT * FROM COMPRAS WHERE CODALMA = VARIABLE_ALMA;
    VARIABLE_COMPRA C2%ROWTYPE;

    CURSOR C3(VARIABLE_COM COMPRAS.NUM_COMPRA%TYPE) IS
        SELECT * FROM DET_COMPRAS WHERE NUM_COMPRA = VARIABLE_COM;
    VARIABLE_DETCOMPRA C3%ROWTYPE;

    CURSOR C4(VARIABLE_DET DET_COMPRAS.CODARTI%TYPE) IS
        SELECT * FROM ARTICULOS WHERE CODARTI = VARIABLE_DET;
    VARIABLE_ARTICULO C4%ROWTYPE;

    TOTAL_COMPRAS NUMBER(10) := 0;
    TOTAL_IMPORTE NUMBER(10) := 0;
BEGIN
    OPEN C1;
    LOOP
        FETCH C1 INTO VARIABLE_ALMACENES;
        EXIT WHEN C1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('El ALMACEN '||VARIABLE_ALMACENES.NOMBRE);
 DBMS_OUTPUT.PUT_LINE('COD_ALMACEN   NOMBRE          NUM_COMPRAS   TOTAL IMPORTE');
            DBMS_OUTPUT.PUT_LINE('------------ --------------- ------------  -------------');
        OPEN C2(VARIABLE_ALMACENES.CODALMA);
        LOOP
            FETCH C2 INTO VARIABLE_COMPRA;
            EXIT WHEN C2%NOTFOUND;

            TOTAL_COMPRAS := 0; -- Reiniciar el total de compras para cada compra
            TOTAL_IMPORTE := 0; -- Reiniciar el total de importe para cada compra

            OPEN C3(VARIABLE_COMPRA.NUM_COMPRA);
            LOOP
                FETCH C3 INTO VARIABLE_DETCOMPRA;
                EXIT WHEN C3%NOTFOUND;

                OPEN C4(VARIABLE_DETCOMPRA.CODARTI);
                LOOP
                    FETCH C4 INTO VARIABLE_ARTICULO;
                    EXIT WHEN C4%NOTFOUND;

                    
                END LOOP;


                CLOSE C4;

            END LOOP;

          
            CLOSE C3;
  -- Imprimir los resultados para cada compra
           
            DBMS_OUTPUT.PUT_LINE(VARIABLE_COMPRA.CODALMA ||'              '||VARIABLE_ALMACENES.NOMBRE||'              '||VARIABLE_COMPRA.NUM_COMPRA||'                ' ||VARIABLE_ARTICULO.PVP *  VARIABLE_DETCOMPRA.UNIDADES );

        END LOOP;

        CLOSE C2;

    END LOOP;

    CLOSE C1;

    -- Cierre de la sesi�n DBMS_OUTPUT
    DBMS_OUTPUT.PUT_LINE('Fin del proceso.');
END;




--Visualizar para cada compra, el detalle de los art�culos que componen la compra. Lo siguiente:   
--recorrer todas las compras vamos . 
--NUM COMPRA: xxxxxx   Nombre Almac�n: xxxxxxxx  Fecha de compra: xxxxxxxxx
--CODARTI    DENOMINACION   CATEGORIA  UNIDADES   PVP   IMPORTE  STOCK-ACTUAL
---------  -------------- ---------- ---------- ------ -------- ------------
--  xxxx        xxxxxxxxxx    xxxxxx     xxxxx     xxxx   xxxxxx    xxxxxxx
--  xxxx        xxxxxxxxxx    xxxxxx     xxxxx     xxxx   xxxxxx    xxxxxxx
---------  -------------- ---------- ---------- ------ -------- ------------
--TOTALES DE UNIDADES: xxxxxx
--TOTAl IMPORTE: xxxxxxxx


--NUM COMPRA: xxxxxx   Nombre Almac�n: xxxxxxxx  Fecha de compra: xxxxxxxxx
--CODARTI    DENOMINACION   CATEGORIA  UNIDADES   PVP   IMPORTE  STOCK-ACTUAL
---------  -------------- ---------- ---------- ------ -------- ------------
--  xxxx        xxxxxxxxxx    xxxxxx     xxxxx     xxxx   xxxxxx    xxxxxxx
--  xxxx        xxxxxxxxxx    xxxxxx     xxxxx     xxxx   xxxxxx    xxxxxxx
---------  -------------- ---------- ---------- ------ -------- ------------
---TOTALES DE UNIDADES: xxxxxx
--TOTAl IMPORTE: xxxxxxxx

--NUM COMPRA: xxxxxx   Nombre Almac�n: xxxxxxxx  Fecha de compra: xxxxxxxxx
--CODARTI    DENOMINACION   CATEGORIA  UNIDADES   PVP   IMPORTE  STOCK-ACTUAL
---------  -------------- ---------- ---------- ------ -------- ------------
--  xxxx        xxxxxxxxxx    xxxxxx     xxxxx     xxxx   xxxxxx    xxxxxxx
--  xxxx        xxxxxxxxxx    xxxxxx     xxxxx     xxxx   xxxxxx    xxxxxxx
---------  -------------- ---------- ---------- ------ -------- ------------
--TOTALES DE UNIDADES: xxxxxx
--TOTAl IMPORTE: xxxxxxxx
---------  -------------- ---------- ---------- ------ -------- ------------

--Donde IMPORTE = PVP * UNIDADES
--STOCK-ACTUAl = STOCK � UNIDADES


DECLARE 
    CURSOR C1 IS SELECT * FROM COMPRAS;
    VARIABLE_COMPRAS C1%ROWTYPE;
    
        CURSOR C2(VARIABLE_COMPRA COMPRAS.CODALMA%TYPE) IS
                SELECT * FROM ALMACENES WHERE CODALMA = VARIABLE_COMPRA;
    VARIABLE_ALMACENES C2%ROWTYPE;
    
    CURSOR C3(VARIABLE_COM COMPRAS.NUM_COMPRA%TYPE) IS
                SELECT * FROM DET_COMPRAS WHERE NUM_COMPRA = VARIABLE_COM;
    VARIABLE_DETCOMPRA C3%ROWTYPE;
    
      
    CURSOR C4(VARIABLE_DET DET_COMPRAS.CODARTI%TYPE) IS
                SELECT * FROM ARTICULOS WHERE CODARTI = VARIABLE_DET;
    VARIABLE_ARTICULO C4%ROWTYPE;
    
    IMPORTE NUMBER(5):=0;
    STOCK_ACTUAl NUMBER(5):=0;
    

BEGIN

 OPEN C1;
    LOOP
            FETCH C1 INTO VARIABLE_COMPRAS;
        EXIT WHEN C1%NOTFOUND;
        
         OPEN C2(VARIABLE_COMPRAS.CODALMA);
    LOOP
                FETCH C2 INTO VARIABLE_ALMACENES;
            EXIT WHEN C2%NOTFOUND;
          
         DBMS_OUTPUT.PUT_LINE('NUM COMPRA:'|| VARIABLE_COMPRAS.NUM_COMPRA||'   Nombre Almac�n:' ||VARIABLE_ALMACENES.NOMBRE ||'  Fecha de compra: '||VARIABLE_COMPRAS.FECHA);
           DBMS_OUTPUT.PUT_LINE('CODARTI          DENOMINACION         CATEGORIA       UNIDADES         PVP         IMPORTE          STOCK-ACTUAL');
  DBMS_OUTPUT.PUT_LINE('---------       ----------------      ------------    ------------    -------     ----------         ------------');
          OPEN C3(VARIABLE_COMPRAS.NUM_COMPRA);
    LOOP
            FETCH C3 INTO VARIABLE_DETCOMPRA;
        EXIT WHEN C3%NOTFOUND;
        
         OPEN C4(VARIABLE_DETCOMPRA.CODARTI);
    LOOP
                FETCH C4 INTO VARIABLE_ARTICULO;
            EXIT WHEN C4%NOTFOUND;
            

DBMS_OUTPUT.PUT_LINE(
    SUBSTR(TO_CHAR(VARIABLE_ARTICULO.CODARTI), 1, 4) ||'                  '||
    VARIABLE_ARTICULO.DENOMINACION||'                 '||
    SUBSTR(VARIABLE_ARTICULO.CATEGORIA, 1, 4)||'                 '||
    SUBSTR(TO_CHAR(VARIABLE_DETCOMPRA.UNIDADES), 1, 4)||'          '||
    SUBSTR(TO_CHAR(VARIABLE_ARTICULO.PVP), 1, 4) ||'        '||SUBSTR(TO_CHAR(VARIABLE_ARTICULO.PVP*VARIABLE_DETCOMPRA.UNIDADES), 1, 4)
    ||'                       '||SUBSTR(TO_CHAR(VARIABLE_ARTICULO.STOCK - VARIABLE_DETCOMPRA.UNIDADES), 1, 4)
);


--TOTALES DE UNIDADES: xxxxxx
--TOTAl IMPORTE: xxxxxxxx

END LOOP;
CLOSE C4;
END LOOP;
CLOSE C3;
        END LOOP;
        CLOSE C2;
         END LOOP;
        CLOSE C1;
END;

















--procedure y function 


--1. Crear una funci�n almacenada que reciba un n�mero de almac�n y que devuelva true si existe en la BD y false si no existe.
CREATE OR REPLACE FUNCTION F_PRUEBA(VALOR NUMBER) RETURN VARCHAR2 AS
  EXISTE NUMBER(1);
BEGIN
  SELECT COUNT(*) INTO EXISTE FROM ALMACENES WHERE CODALMA = VALOR;
  IF EXISTE > 0 THEN
    RETURN 'Existe';
  ELSE
    RETURN 'NO Existe';
  END IF;
END;

SELECT F_PRUEBA(2)FROM DUAL;

--2. Realiza una procedure almacenada para insertar datos en la tabla almacenes. La procedure recibe los datos del almac�n. La procedure har� uso de la funci�n anterior para comprobar que existe el almac�n. Si no existe el almac�n se insertar� un reg en la BD, pero antes hay que comprobar que el nombre y la poblaci�n sean distintas de null, y que la facturaci�n sea mayor que 0.
--Visualizar los mensajes que correspondan de lo que ocurra (almac�n ya existe, la poblaci�n no puede ser nula, la facturaci�n debe ser mayor que 0, etc ...).

CREATE OR REPLACE PROCEDURE INSERTAR_ALMACEN (
  CODALMAS NUMBER, 
  NOMBRE VARCHAR2,
  POBLACION VARCHAR2, 
  FACTURACION NUMBER
) AS 
  EXISTE NUMBER(1);
BEGIN
  SELECT COUNT(*) INTO EXISTE FROM ALMACENES WHERE CODALMA = CODALMAS;

  IF EXISTE > 0 THEN
    DBMS_OUTPUT.PUT_LINE('EXISTE');
  ELSE
    INSERT INTO ALMACENES VALUES(CODALMAS, NOMBRE, POBLACION, FACTURACION);
    DBMS_OUTPUT.PUT_LINE('NO EXISTE');
  END IF;
END INSERTAR_ALMACEN;

--LO INSERTAMOS 
BEGIN
  INSERTAR_ALMACEN(88, 'LOL', 'LOL', 999);
END;


--3. Crear una funci�n almacenada que reciba de par�metro un n�mero de almac�n y una subida de salario. La funci�n deber� actualizar el salario de los empleados de ese almac�n y devolver� el n�mero de empleados actualizados. La actualizaci�n consistir� en sumar la subida al salario.
CREATE OR REPLACE PROCEDURE ACTUALIZDAR_SALARIO (CODALMAS NUMBER) AS 
  NUM_EMPLEADOS_ACTUALIZADOS NUMBER;
BEGIN
  UPDATE EMPLEADOS 
  SET SALARIO = SALARIO * 0.6
  WHERE CODALMA = CODALMAS;

  NUM_EMPLEADOS_ACTUALIZADOS := SQL%ROWCOUNT;

  DBMS_OUTPUT.PUT_LINE('N�mero de empleados actualizados: ' || NUM_EMPLEADOS_ACTUALIZADOS);
END ACTUALIZDAR_SALARIO;


BEGIN
  ACTUALIZDAR_SALARIO(2);
END;







--EJEMPLOS FUNCIONES Y PROCEDURE 
-- Funci�n
CREATE OR REPLACE FUNCTION SALUDO (NOMBRE IN VARCHAR2) 
RETURN VARCHAR2 AS 
BEGIN
  RETURN 'Hola ' || NOMBRE;
END SALUDO;


SELECT SALUDO((SELECT NOMBRE FROM EMPLEADOS WHERE CODEMPLE = 1 )) FROM DUAL;

-- Procedimiento
CREATE OR REPLACE PROCEDURE ACTUALIZAR_SALARIOS (CODALMAS NUMBER , SUBIDA NUMBER) AS 
 
BEGIN
  UPDATE EMPLEADOS 
  SET SALARIO = SALARIO * SUBIDA
  WHERE CODALMA = CODALMAS;


END ACTUALIZAR_SALARIOS;

--4. Realizar una procedure a  lmacenada que haga uso de esta funci�n, y la funci�n del ejercicio 1. La procedure recibe un n�mero de almac�n y una subida de salario. La procedure primero comprobar� que
--el almac�n exista, haciendo uso de la funci�n del primer ejercicio. Si el almac�n existe ha de comprobar que la subida sea mayor que 0, si no es as� no se debe actualizar. Y si la subida es mayor que 0 se llamar� a la funci�n del apartado 3 pas�ndole el almac�n y la subida.
--La procedure visualizar� los mensajes de lo que ocurra. Almac�n no existe, la subida es menor que 0, se han actualizado tantos empleados, etc..

CREATE OR REPLACE PROCEDURE INSERTAR_ALMACEN (
  CODALMAS NUMBER, 
  NOMBRE VARCHAR2,
  POBLACION VARCHAR2, 
  FACTURACION NUMBER
) AS 
  EXISTE NUMBER(1);
BEGIN
  SELECT COUNT(*) INTO EXISTE FROM ALMACENES WHERE CODALMA = CODALMAS;

  IF EXISTE > 0 THEN
    DBMS_OUTPUT.PUT_LINE('EXISTE');
  ELSE
    INSERT INTO ALMACENES VALUES(CODALMAS, NOMBRE, POBLACION, FACTURACION);
    DBMS_OUTPUT.PUT_LINE('NO EXISTE');
  END IF;
END INSERTAR_ALMACEN;


CREATE OR REPLACE PROCEDURE ACTUALIZAR_SALARIOS (CODALMAS NUMBER , SUBIDA NUMBER) AS 
BEGIN
  UPDATE EMPLEADOS 
  SET SALARIO = SALARIO * (1 + SUBIDA/100)
  WHERE CODALMA = CODALMAS;
END ACTUALIZAR_SALARIOS;

CREATE OR REPLACE PROCEDURE COMPROBAR_SUBIR (CODALMASS NUMBER, SUBIDA_ALMACEN NUMBER) AS 
  EXISTE NUMBER(1);
  COD_HAY NUMBER(1);
BEGIN
  SELECT COUNT(*) INTO EXISTE FROM ALMACENES WHERE CODALMA = CODALMASS;
  IF EXISTE > 0 THEN 
    DBMS_OUTPUT.PUT_LINE('EXISTE');
    
  IF SUBIDA_ALMACEN > 0 THEN 
    ACTUALIZAR_SALARIOS(CODALMASS, SUBIDA_ALMACEN);
     DBMS_OUTPUT.PUT_LINE('SE ACTUALIZO '); 
  END IF;
  ELSE
    DBMS_OUTPUT.PUT_LINE('NO EXISTE');
  END IF;
END COMPROBAR_SUBIR;




CREATE OR REPLACE PROCEDURE COMPROBAR_SUBIR (CODALMASS NUMBER, SUBIDA_ALMACEN NUMBER) AS 
  EXISTE VARCHAR2(10);
BEGIN
  EXISTE := F_PRUEBA(CODALMASS);
  IF EXISTE = 'Existe' THEN 
    DBMS_OUTPUT.PUT_LINE('El almacén existe');
    
    IF SUBIDA_ALMACEN > 0 THEN 
      BEGIN
        ACTUALIZAR_SALARIOS(CODALMASS, SUBIDA_ALMACEN);
        DBMS_OUTPUT.PUT_LINE('Se ha actualizado el salario'); 
      EXCEPTION
        WHEN OTHERS THEN
          DBMS_OUTPUT.PUT_LINE('Error al actualizar los salarios: ' || SQLERRM);
      END;
    ELSE
      DBMS_OUTPUT.PUT_LINE('La subida es menor que 0, no se actualiza el salario');
    END IF;
  ELSE
    DBMS_OUTPUT.PUT_LINE('El almacén no existe');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error en el procedimiento: ' || SQLERRM);
END COMPROBAR_SUBIR;


BEGIN
  COMPROBAR_SUBIR(999 , 10); -- Aumento del 10%
END;



--5. Crea una procedure almacenada que reciba un c�digo de almac�n y devuelva (par�metros OUT) su nombre, su poblaci�n, el n�mero de empleados que tiene, el n�mero de compras que ha realizado, y el total importe de todas sus compras. Esta procedure har� uso de la funci�n del ejercicio 1 para comprobar si existe o no el almac�n.
--Si el almac�n no existe debe devolver en nombre la cadena 'ALMAC�N NO EXISTE', el resto de datos a 0 los num�ricos y null las cadenas (excepto el nombre). 
--Realizar un bloque PL que haga uso de esta procedure, y visualice los datos devueltos (La procedure no debe visualizar nada).
CREATE OR REPLACE PROCEDURE P_ALMACEN_INFO (
  P_CODALMA IN ALMACENES.CODALMA%TYPE,
  P_NOMBRE OUT ALMACENES.NOMBRE%TYPE,
  P_POBLACION OUT ALMACENES.POBLACION%TYPE,
  P_NUM_EMPLEADOS OUT NUMBER,
  P_NUM_COMPRAS OUT NUMBER,
  P_TOTAL_IMPORTES OUT NUMBER
) AS
  V_EXISTE VARCHAR2(10);
BEGIN
  V_EXISTE := F_PRUEBA(P_CODALMA);
  
  IF V_EXISTE = 'Existe' THEN
    SELECT NOMBRE, POBLACION INTO P_NOMBRE, P_POBLACION FROM ALMACENES WHERE CODALMA = P_CODALMA;
    SELECT COUNT(*) INTO P_NUM_EMPLEADOS FROM EMPLEADOS WHERE CODALMA = P_CODALMA;
    -- Asumiendo que tienes una tabla de COMPRAS con campos CODALMA e IMPORTE
    SELECT COUNT(*), NVL(SUM(NUM_COMPRA), 0) INTO P_NUM_COMPRAS, P_TOTAL_IMPORTES FROM COMPRAS WHERE CODALMA = P_CODALMA;
  ELSE
    P_NOMBRE := 'ALMAC�N NO EXISTE';
    P_POBLACION := NULL;
    P_NUM_EMPLEADOS := 0;
    P_NUM_COMPRAS := 0;
    P_TOTAL_IMPORTES := 0;  
  END IF;
END;


DECLARE
  V_NOMBRE ALMACENES.NOMBRE%TYPE;
  V_POBLACION ALMACENES.POBLACION%TYPE;
  V_NUM_EMPLEADOS NUMBER;
  V_NUM_COMPRAS NUMBER;
  V_TOTAL_IMPORTES NUMBER;
BEGIN
  P_ALMACEN_INFO(6, V_NOMBRE, V_POBLACION, V_NUM_EMPLEADOS, V_NUM_COMPRAS, V_TOTAL_IMPORTES);
  
  DBMS_OUTPUT.PUT_LINE('Nombre: ' || V_NOMBRE);
  DBMS_OUTPUT.PUT_LINE('Poblaci�n: ' || V_POBLACION);
  DBMS_OUTPUT.PUT_LINE('N�mero de empleados: ' || V_NUM_EMPLEADOS);
  DBMS_OUTPUT.PUT_LINE('N�mero de compras: ' || V_NUM_COMPRAS);
  DBMS_OUTPUT.PUT_LINE('Total importes: ' || V_TOTAL_IMPORTES);
END;


--TRIGGERS 


--8.Crear la columna NUM_ARTIS dentro de la tabla proveedores. Num�rica de 4 d�gitos. Debe guardar el n�mero de art�culos que suministra el proveedor
--Realizar un trigger para mantener actualizada esa columna.

ALTER TABLE PROVEEDORES
ADD (NUM_ARTIS NUMBER);

CREATE OR REPLACE TRIGGER ACTUALIZAR_PROV
AFTER INSERT ON SUMINISTROS
FOR EACH ROW
DECLARE
  v_operation NUMBER(5);
BEGIN
  SELECT COUNT(*) INTO v_operation FROM SUMINISTROS WHERE CODPROV = :NEW.CODPROV;
  UPDATE PROVEEDORES 
  SET NUM_ARTIS = v_operation
  WHERE CODPROV = :NEW.CODPROV;
EXCEPTION
  WHEN OTHERS THEN
    NULL;
END;



--9.Crear dentro de la tabla COMPRAS la columna IMPORTECOMPRA, num�rico 9,2. Esta columna debe almacenar el total de la compra, que ser� la suma de unidades * precio de los art�culos que forman la compra.
--Realizar un trigger para mantener actualizada esa columna.
--A nivel de sentencia

ALTER TABLE COMPRAS
ADD IMPORTECOMPRA NUMBER(9,2);

CREATE OR REPLACE TRIGGER actualizar_importecompra
AFTER INSERT OR UPDATE ON DET_COMPRAS
FOR EACH ROW
BEGIN
  UPDATE COMPRAS
  SET IMPORTECOMPRA = (SELECT SUM(UNIDADES * PVP)
                       FROM DET_COMPRAS
                       JOIN ARTICULOS ON DET_COMPRAS.CODARTI = ARTICULOS.CODARTI
                       WHERE NUM_COMPRA = :NEW.NUM_COMPRA)
  WHERE NUM_COMPRA = :NEW.NUM_COMPRA;
END;
/




--10.Cambiar el trigger para mantener actualizada la columna stock de la tabla art�culo.
--Si se inserta un DET_COMPRA, hay que restar las unidades de ese detalle, y del art�culo al STOCK del art�culo de la tabla art�culos.
--Si se borra un detalle compra hay que sumar las unidades del art�culo que se borra en detalle compras, al stock del art�culo en la tabla ART�CULOS.
--Si se actualiza un detalle compra, se restan las unidades del nuevo art�culo al stock de la tabla art�culos. Y se suman las unidades del antiguo art�culo al stock 
--del art�culo en la tabla ARTICULOS
--Comprobar que el stock resultante sea >= 10, caso contrario se aborta el trigger y no se inserta o actualiza en detalle compras

CREATE OR REPLACE TRIGGER actualizar_stock
AFTER INSERT OR UPDATE OR DELETE ON DET_COMPRAS
FOR EACH ROW
DECLARE
  nuevo_stock NUMBER(5);
BEGIN
  IF INSERTING THEN
    SELECT STOCK - :NEW.UNIDADES INTO nuevo_stock FROM ARTICULOS WHERE CODARTI = :NEW.CODARTI;
  ELSIF DELETING THEN
    SELECT STOCK + :OLD.UNIDADES INTO nuevo_stock FROM ARTICULOS WHERE CODARTI = :OLD.CODARTI;
  ELSIF UPDATING THEN
    SELECT STOCK - :NEW.UNIDADES + :OLD.UNIDADES INTO nuevo_stock FROM ARTICULOS WHERE CODARTI = :NEW.CODARTI;
  END IF;

  IF nuevo_stock < 10 THEN
    RAISE_APPLICATION_ERROR(-20001, 'El stock resultante es menor que 10');
  ELSE
    UPDATE ARTICULOS SET STOCK = nuevo_stock WHERE CODARTI = :NEW.CODARTI;
  END IF;
END;
/








--ejercicios repaso examen 

--?	Crear una vista que nos permite obtener todos los datos del art�culo(s) que m�s unidades se hayan comprado.

DECLARE
    CURSOR C1 IS SELECT * FROM ARTICULOS;
    VARIABLE_ARTICULO C1%ROWTYPE;
    
    BEGIN
      DBMS_OUTPUT.PUT_LINE('CODARTI      DENOMINACION          CATEGORIA         PVP         STOCK');
      DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------');
     OPEN C1;
    LOOP
            FETCH C1 INTO VARIABLE_ARTICULO;
        EXIT WHEN C1%NOTFOUND;
              DBMS_OUTPUT.PUT_LINE(VARIABLE_ARTICULO.CODARTI ||'    '||VARIABLE_ARTICULO.DENOMINACION||'       '||VARIABLE_ARTICULO.CATEGORIA||'      '||VARIABLE_ARTICULO.PVP||'     '||VARIABLE_ARTICULO.STOCK);
        END LOOP;
        CLOSE C1;
        
END;

--?	Crear una vista con los datos de los empleados que trabajen en los almacenes del art�culo del que se hayan realizado m�s compras. (NO DEL ART�CULO DEL QUE SE HAYAN COMPRADO M�S UNIDADES).

SELECT DISTINCT (E.CODEMPLE), E.NOMBRE, E.POBLACION, E.FECHAALTA, E.SALARIO 
FROM EMPLEADOS E JOIN ALMACENES A ON(E.CODALMA = A.CODALMA)
                 	           JOIN COMPRAS C ON (A.CODALMA = C.CODALMA)
                                       JOIN DET_COMPRAS D ON (C.NUM_COMPRA = D.NUM_COMPRA)
WHERE CODARTI IN (SELECT CODARTI FROM DET_COMPRAS
                                        GROUP BY CODARTI
                                        HAVING COUNT(CODARTI) = (SELECT MAX(COUNT(CODARTI))
                                                                                              FROM DET_COMPRAS
                                                                                              GROUP BY CODARTI))
ORDER BY E.CODEMPLE;
--?	Crear un bloque de c�digo que nos permita controlar si existe el art�culo que introduzcamos por teclado. Si el art�culo existe, mostraremos todos los dados de sus proveedores por pantalla.



DECLARE

 COD_ARTICULO ARTICULOS.CODARTI%TYPE :=&CODIGO_ARTICULO;

    CURSOR C1 IS SELECT * FROM ARTICULOS
     WHERE CODARTI =COD_ARTICULO;
    VARIABLE_ARTICULO C1%ROWTYPE;
    
      CURSOR C2(VARIABLE_ARTI ARTICULOS.CODARTI%TYPE) IS SELECT * FROM SUMINISTROS
     WHERE CODARTI =VARIABLE_ARTI;
    VARIABLE_SUMINISTROS C2%ROWTYPE;
    
    CURSOR C3(VARIABLE_SUMI SUMINISTROS.CODPROV%TYPE) IS SELECT * FROM PROVEEDORES
     WHERE CODPROV =VARIABLE_SUMI;
    VARIABLE_PROVEEDORES C3%ROWTYPE;
    
    BEGIN
         DBMS_OUTPUT.PUT_LINE('EXISTE');
      DBMS_OUTPUT.PUT_LINE('CODPROV      NOMBRE          POBLACION         ZONA         COMISION       NUM_ARTIS');
      DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------');
     OPEN C1;
    LOOP
            FETCH C1 INTO VARIABLE_ARTICULO;
        EXIT WHEN C1%NOTFOUND;
        
          OPEN C2(VARIABLE_ARTICULO.CODARTI);
    LOOP
            FETCH C2 INTO VARIABLE_SUMINISTROS;
        EXIT WHEN C2%NOTFOUND;
        
          OPEN C3(VARIABLE_SUMINISTROS.CODPROV);
    LOOP
            FETCH C3 INTO VARIABLE_PROVEEDORES;
        EXIT WHEN C3%NOTFOUND;
        
              DBMS_OUTPUT.PUT_LINE(VARIABLE_PROVEEDORES.CODPROV ||'    '||VARIABLE_PROVEEDORES.NOMBRE||'       '||VARIABLE_PROVEEDORES.POBLACION||'      '||VARIABLE_PROVEEDORES.ZONA||'      '||VARIABLE_PROVEEDORES.COMISION||'     '||VARIABLE_PROVEEDORES.NUM_ARTIS);
                END LOOP;
        CLOSE C3;
                END LOOP;
        CLOSE C2;
        END LOOP;
        CLOSE C1;
        
END;

--?	Crear un procedimiento al que le pasaremos desde un bloque de c�digo como par�metro un n�mero de compra (que introducir� el usuario) para que nos muestre por pantalla la denominaci�n de cada uno de los art�culos de la compra, su categor�a, las unidades vendidas en una compra y el precio del art�culo.
--Tendremos que comprobar que el n�mero de la compra sea correcto, en caso de no ser correcto, no se realizar� la llamada al procedimiento y mostraremos un mensaje de error.
--La salida se realizar� el procedimiento ser� la siguiente forma:
--NUMERO_COMPRA: xxxxxxxx                                   FECHA_COMPRA: xxxxxx
--------------------------------------------------------------------------------
--DENOMINACION    CATEGORIA    UNIDADES   PRECIO    SUBTOTAL
------------    ---------    --------   ------   --------
--xxxxxxxxxxxx    xxxxxxxxx    xxxxxxxx   xxxxxx   xxxxxxxx
--xxxxxxxxxxxx    xxxxxxxxx    xxxxxxxx   xxxxxx   xxxxxxxx
---------------------------------------------------------------------------------
--TOTAL_ART�CULOS:xxxxx        TOTAL_UNIDADES:xxxxx        TOTAL_COMPRA: xxxxx         


CREATE OR REPLACE PROCEDURE DENOMINACION_ARTICULOS ( NUM_COMPRA_ COMPRAS.NUM_COMPRA%TYPE) AS

 VARIABLE_FECHA COMPRAS.FECHA%TYPE;
CURSOR C1 IS SELECT * FROM DET_COMPRAS WHERE NUM_COMPRA = NUM_COMPRA_;
  VARIABLE_DET_COMPRAS C1%ROWTYPE;
  
  CURSOR C2(VARIABLE_DET_COM DET_COMPRAS.CODARTI%TYPE) IS SELECT * FROM ARTICULOS WHERE CODARTI = VARIABLE_DET_COM;
  VARIABLE_ARTICULO C2%ROWTYPE;
  TOTAL_ART�CULOS NUMBER(10) :=0;
  TOTAL_UNIDADES NUMBER(10) :=0;
   TOTAL_COMPRA NUMBER(10) :=0;
BEGIN
    SELECT FECHA INTO VARIABLE_FECHA FROM COMPRAS WHERE NUM_COMPRA = NUM_COMPRA_;
      DBMS_OUTPUT.PUT_LINE('CODARTI      DENOMINACION          CATEGORIA         PVP         STOCK              ');
      DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------------------------------');
         DBMS_OUTPUT.PUT_LINE('NUM COMPRA '|| NUM_COMPRA_ ||'                      FECHA COMPRA '||VARIABLE_FECHA );
    OPEN C1;
    
    LOOP
  
            FETCH C1 INTO VARIABLE_DET_COMPRAS;
            
        EXIT WHEN C1%NOTFOUND;
         
          OPEN C2(VARIABLE_DET_COMPRAS.CODARTI);
    LOOP
            FETCH C2 INTO VARIABLE_ARTICULO;
        EXIT WHEN C2%NOTFOUND;
                      DBMS_OUTPUT.PUT_LINE(VARIABLE_ARTICULO.CODARTI ||'    '||VARIABLE_ARTICULO.DENOMINACION||'       '||VARIABLE_ARTICULO.CATEGORIA||'      '||VARIABLE_ARTICULO.PVP||'      '||VARIABLE_ARTICULO.STOCK);

        TOTAL_ART�CULOS := TOTAL_ART�CULOS +1;
        TOTAL_UNIDADES := TOTAL_UNIDADES + VARIABLE_DET_COMPRAS.UNIDADES;
        TOTAL_COMPRA := TOTAL_COMPRA +  VARIABLE_ARTICULO.PVP;
        
                  END LOOP;
        CLOSE C2;
        END LOOP;
        CLOSE C1;
                 DBMS_OUTPUT.PUT_LINE(' TOTAL_ART�CULOS:'||TOTAL_ART�CULOS||'        TOTAL_UNIDADES:'||TOTAL_UNIDADES||'        TOTAL_COMPRA: '|| TOTAL_COMPRA||'   ');

             
END;

DECLARE 
BEGIN
DENOMINACION_ARTICULOS(1);
END;



--?	Crear una funci�n que nos devuelva el c�digo del empleado que tenga el mayor sueldo del almac�n que introduzca el usuario. La funci�n ser� llamada desde un bloque donde se mostrar�n los datos del empleado. 
--A la funci�n le paremos como par�metro el c�digo del almac�n y nos devolver� el c�digo del empleado.
--En caso de que el almac�n no exista, o se produzca otro error. Se mostrar� un mensaje y la funci�n no realizar� ninguna acci�n.
CREATE OR REPLACE FUNCTION EMPLEADO_SUELDO (ALMAA ALMACENES.CODALMA%TYPE) 
RETURN EMPLEADOS.NOMBRE%TYPE AS 
LOL EMPLEADOS.NOMBRE%TYPE;
BEGIN
  SELECT NOMBRE INTO LOL FROM EMPLEADOS WHERE SALARIO = (SELECT MAX(SALARIO) FROM EMPLEADOS WHERE CODALMA = ALMAA) AND CODALMA = ALMAA;
  RETURN LOL;
EXCEPTION
      WHEN NO_DATA_FOUND THEN
           DBMS_OUTPUT.PUT_LINE('ERROR!!!  EL ALMACEN NO EXISTE');
           RETURN 0;
    WHEN TOO_MANY_ROWS THEN
          DBMS_OUTPUT.PUT_LINE('ERROR!!!  EXISTEN DEMASIADOS VALORES');
          RETURN 0;
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('ERROR!!!  LA OPERACI�N NO SE PUEDE REALIZAR');
        RETURN 0;

END EMPLEADO_SUELDO;


SELECT EMPLEADO_SUELDO(14444666) FROM dual;
                
                


--?	Crear una funci�n que devolver� el c�digo del proveedor que introduzca el usuario por teclado, esta informaci�n ser� pasada a un procedimiento que se encargar� de mostrar los datos del proveedor introducido o bien un mensaje de error en caso de que no exista el proveedor.
--Ni la funci�n, ni el procedimiento se almacenar�n en la base de datos.
             
DECLARE
--FUNCTION
FUNCTION PROVEEDORES_ 
RETURN PROVEEDORES.CODPROV%TYPE AS 
LOL PROVEEDORES.CODPROV%TYPE := &CODIGO_PROV;
BEGIN
RETURN LOL;
END PROVEEDORES_;
--PROVEDORES
PROCEDURE PROVV(LOOL PROVEEDORES.CODPROV%TYPE )
AS
CURSOR C1 IS SELECT * FROM PROVEEDORES WHERE CODPROV = LOOL;
VARIABLE_PROVEEDOR C1%ROWTYPE;

BEGIN
          DBMS_OUTPUT.PUT_LINE(' CODPROV    NOMBRE     POBLACION      ZONA     COMISION    ');

    OPEN C1;
    
    LOOP
  
            FETCH C1 INTO VARIABLE_PROVEEDOR;
            
        EXIT WHEN C1%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(VARIABLE_PROVEEDOR.CODPROV ||'    '||VARIABLE_PROVEEDOR.NOMBRE||'       '||VARIABLE_PROVEEDOR.POBLACION||'      '||VARIABLE_PROVEEDOR.ZONA||'      '||VARIABLE_PROVEEDOR.COMISION);

          END LOOP;
        CLOSE C1;
        
  EXCEPTION
      WHEN NO_DATA_FOUND THEN
           DBMS_OUTPUT.PUT_LINE('ERROR!!!  EL PROV  NO EXISTE');
         
  
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('ERROR!!!  LA OPERACI�N NO SE PUEDE REALIZAR');
             
END;
BEGIN
PROVV(PROVEEDORES_);
END;

--COMO HACER UN TRIGGER PARA EVITAR QUE NO SE SUPERE EL  MAXIMO UN 10% AL SALARIO DEL EMPLEADO 


CREATE OR REPLACE TRIGGER check_salario
BEFORE UPDATE OF SALARIO ON EMPLEADOS
FOR EACH ROW
DECLARE
  max_salario NUMBER(6,2);
BEGIN
  -- Calcular el m�ximo salario permitido (un 10% m�s del actual)
  max_salario := :OLD.SALARIO * 1.10;

  -- Comprobar si el nuevo salario supera el m�ximo permitido
  IF :NEW.SALARIO > max_salario THEN
    RAISE_APPLICATION_ERROR(-20091, 'No se puede aumentar el salario m�s de un 10%');
  END IF;
END;

UPDATE EMPLEADOS SET SALARIO = SALARIO * 1.20 WHERE CODEMPLE = 1;



--EVITAR LA INSERCION SI CODALMA Y CODJEFE NO EXISTE 
CREATE OR REPLACE TRIGGER check_codalma_codjefe
BEFORE INSERT ON EMPLEADOS
FOR EACH ROW
DECLARE
  v_count NUMBER(7);
   v_count_ NUMBER(7);
BEGIN
  -- Comprobar si CODALMA existe
  SELECT COUNT(*) INTO v_count FROM ALMACENES WHERE CODALMA = :NEW.CODALMA;
  IF v_count = 0 THEN
    RAISE_APPLICATION_ERROR(-20002, 'CODALMA no existe en la tabla ALMACENES');
  END IF;

  -- Comprobar si CODJEFE existe
  SELECT COUNT(*) INTO v_count_ FROM EMPLEADOS WHERE CODJEFE = :NEW.CODJEFE;
  IF v_count_ = 0 THEN
    RAISE_APPLICATION_ERROR(-20003, 'CODJEFE no existe en la tabla JEFES');
  END IF;
END;

INSERT INTO EMPLEADOS (CODEMPLE, NOMBRE,POBLACION,FECHAALTA,SALARIO,CODALMA,CODJEFE) VALUES ((SELECT MAX(CODEMPLE)+1 FROM EMPLEADOS), 'LOLL', 'LKLL', SYSDATE,1000,1,1);


