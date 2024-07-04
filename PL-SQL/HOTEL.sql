drop table reservas cascade constraints;
drop table clientes cascade constraints;
drop table habitaciones cascade constraints;
drop table Tiposhabitaciones cascade constraints;


create  TABLE clientes (
  CodigoCliente int NOT NULL,
  NombreCliente varchar2(50) NOT NULL,
  Apellido varchar2(30) DEFAULT NULL,
  Telefono varchar2(15),
  direccion varchar2(40),
  Ciudad varchar2(30) NOT NULL,
  Region varchar2(30) DEFAULT NULL,
  Pais varchar2(30)  NOT NULL,
  CodigoPostal varchar2(10) ,
  LimiteCredito float ,
  PRIMARY KEY (CodigoCliente)
  ) ;
/

INSERT INTO clientes VALUES (1,'Daniel G','GoldFish','5556901745','False Street 52 2 A','San Francisco',NULL,'USA','24006',3000);
INSERT INTO clientes VALUES (3,'Anne','Wright','5557410345','Wall-e Avenue','Miami','Miami','USA','24010',6000);

INSERT INTO clientes VALUES (2,'Oscar','Mayorga','925667788','Principal 1','Talavera','Castilla la Mancha','ESPA?A','45600',5000);
INSERT INTO clientes VALUES (4,'Enzo','Santos Mayorga','75202345','Las lanchas 10','Madrid','Madrid','ESPA?A','28600',4000);
INSERT INTO clientes VALUES (5,'Raquel','Garc?a Gant','66654433','Cornella 22','Barcelona','Catalu?a','ESPA?A','08680',4000);

INSERT INTO clientes VALUES (6,'Mary','Futvher','4475202345','Street 1 - A22','Londres',null,'INGLATERRA','828600',4600);
INSERT INTO clientes VALUES (7,'Paolo','Picolino','36455345','Atrio 1 - A22','Peruggia',null,'ITALIA','987700',2600);

INSERT INTO clientes VALUES (8,'Pedro','Rius','2333440','Avenida flores 1','Madrid','Madrid','ESPA?A','28009',2300);
INSERT INTO clientes VALUES (9,'Javier','Olmedo','6338440','Avenida de los Rios 1','Burgos','Castilla leon','ESPA?A','78909',2300);

CREATE TABLE Tiposhabitaciones (
  Tipo varchar2(30) NOT NULL,
  DescripcionTexto varchar2(50),
  Precio float not null,
  PRIMARY KEY (Tipo)
);
/
INSERT INTO Tiposhabitaciones VALUES ('Doble1','Dos camas individuales 90',50);
INSERT INTO Tiposhabitaciones VALUES ('Doble2','Dos camas individuales 105',60);
INSERT INTO Tiposhabitaciones VALUES ('Twin','Dos camas unidas 200',60);
INSERT INTO Tiposhabitaciones VALUES ('Individual1','Una cama 105',30);
INSERT INTO Tiposhabitaciones VALUES ('Individual2','Una cama 105 mas office',60);
INSERT INTO Tiposhabitaciones VALUES ('SuiteA','Suite de 100 metros',160);
INSERT INTO Tiposhabitaciones VALUES ('SuiteB','Suite de 130 metros',180);


create TABLE habitaciones (
  NumHabitacion number(4) NOT NULL, 
  NombreHabitacion varchar2(50) DEFAULT ' ',
  Tipo varchar2(30) ,
  PRIMARY KEY (NumHabitacion),
  CONSTRAINT habtipoFK FOREIGN KEY (Tipo) REFERENCES Tiposhabitaciones (Tipo)
  ) ;


INSERT INTO habitaciones VALUES (101,'La rosa','Doble1');
INSERT INTO habitaciones VALUES (102,'Candelaria','Twin');
INSERT INTO habitaciones VALUES (103,'La verde','Individual1');
INSERT INTO habitaciones VALUES (104,'Calera','Individual2');

INSERT INTO habitaciones VALUES (201,'La rosa','Doble2');
INSERT INTO habitaciones VALUES (202,'Candelaria','Twin');
INSERT INTO habitaciones VALUES (203,'La verde','Individual1');
INSERT INTO habitaciones VALUES (204,'Calera','Individual1');

INSERT INTO habitaciones VALUES (301,'MiraGredos','SuiteA');
INSERT INTO habitaciones VALUES (302,'La Sierra','SuiteB');
INSERT INTO habitaciones VALUES (303,'Azul','Individual2');



create TABLE reservas (
  codreserva int not null,
  NumHabitacion number(4) NOT NULL, 
  CodigoCliente int NOT NULL,
  Camassupletorias int default 0,
  Fechaentrada date not null,
  Fechasalida date not null,
  descuento int default 0,
  PRIMARY KEY (codreserva),
  CONSTRAINT resclientesFK FOREIGN KEY (CodigoCliente) REFERENCES clientes (CodigoCliente),
  CONSTRAINT reshabitacionesFK FOREIGN KEY (NumHabitacion) REFERENCES habitaciones (NumHabitacion)
 ) ;


/* 1 y 2 usa, 3 4 5 espa?a, 6 Inglaterra 7  Italia) -- 1 T 200, abril 150  */

insert into reservas values (1,101, 1, 1, sysdate-200, sysdate -198 , 0);
insert into reservas values (2,102, 2, 2, sysdate-150, sysdate -146  , 2);
insert into reservas values (3,103, 1, 0, sysdate-50, sysdate -47 , 0);
insert into reservas values (4,202, 2, 0, sysdate-30, sysdate -26  , 2);
insert into reservas values (5,302, 2, 2, sysdate-10, sysdate -4  , 2);


insert into reservas values (6,201, 3, 1, sysdate-240, sysdate-237, 5);
insert into reservas values (7,201, 3, 3, sysdate-140, sysdate-137,  0);
insert into reservas values (8,201, 3, 0, sysdate-40, sysdate-37, 10);
insert into reservas values (9,202, 4, 1, sysdate-20, sysdate-15 , 0);
insert into reservas values (10,301, 4, 2, sysdate, sysdate + 2 , 5);
insert into reservas values (11,303, 5, 0, sysdate, sysdate + 3 , 0);
insert into reservas values (12,301, 3, 2, sysdate-15, sysdate -13 , 10);


insert into reservas values (13,202, 6, 2, sysdate-220, sysdate -217, 10);
insert into reservas values (14,302, 6, 1, sysdate-160, sysdate -156 , 0);
insert into reservas values (15,302, 6, 1, sysdate, sysdate + 4 , 0);

insert into reservas values (16,302, 7, 2, sysdate-233, sysdate -230 , 10);
insert into reservas values (17,302, 7, 0, sysdate-203, sysdate -200 , 10);
insert into reservas values (18,201, 7, 1, sysdate, sysdate + 4 , 5);
insert into reservas values (19,202, 9, 2, sysdate-60, sysdate -57  , 2);
insert into reservas values (20,202, 5, 2, sysdate-80, sysdate -77  , 2);

insert into reservas values (21,202, 5, 2, sysdate-80, sysdate -77  , 2);


insert into reservas values (22,202, 5, 2, sysdate-80, sysdate -77  , 2);
insert into reservas values (23,202, 5, 2, sysdate-1, sysdate+3  , 2);
insert into reservas values (24,101, 5, 2, sysdate-2, sysdate+7  , 2);

commit;

 SET SERVEROUTP ON
SET VERIFY OFF

--Crea una función HABITACION_LIBRE que devuelva TRUE o FALSE. La función recibirá por parámetro un número de habitación y si la habitación está actualmente ocupada devolverá TRUE, de lo contrario, devolverá FALSE; 
--Nota: la habitación se considerará libre si la fecha de hoy no está entre la fecha de inicio y la fecha de fin. 	

CREATE OR REPLACE FUNCTION HABITACION_LIBRE(NUM_H HABITACIONES.NUMHABITACION%TYPE) RETURN VARCHAR2 AS
  HAY NUMBER(10);
BEGIN
  SELECT COUNT(*) INTO HAY FROM RESERVAS WHERE NUMHABITACION = NUM_H;
  IF HAY > 0 THEN
    RETURN 'FALSE'; --HABITACION OCUPADA
  ELSE
    RETURN 'TRUE'; --HABITACION LIBRE 
  END IF;
END;

SELECT HABITACION_LIBRE(101)FROM DUAL;


--Realiza un procedimiento llamado RESERVA_EXPRESS(HAB, CLI). 
--El procedimiento servirá para hacer una reserva con entrada hoy y salida mañana. 
--Recibirá por parámetro el número de la habitación y el cliente. 
--Es OBLIGATORIO capturar la excepción NO_DATA_FOUND. No se pueden usar CONTADORES ni variables booleanas para controlar la inserción. 

CREATE OR REPLACE PROCEDURE  RESERVA_EXPRESS (
 HABI RESERVAS.NUMHABITACION%TYPE , CLI RESERVAS.CODIGOCLIENTE%TYPE
) AS 
  LIBRE NUMBER(10);
    EXISTE_CLIENTE NUMBER(10);
    EXISTE_HABI NUMBER(10);

BEGIN
SELECT COUNT(*) INTO LIBRE FROM RESERVAS WHERE NUMHABITACION = HABI;
SELECT COUNT(*) INTO EXISTE_CLIENTE FROM CLIENTES WHERE CODIGOCLIENTE = CLI;
SELECT COUNT(*) INTO EXISTE_HABI FROM HABITACIONES WHERE NUMHABITACION = HABI;
  IF LIBRE > 0 THEN
    DBMS_OUTPUT.PUT_LINE('NO ESTA LIBRE');
  ELSE
   
    DBMS_OUTPUT.PUT_LINE('Esta libre la habitacion ');
    IF EXISTE_CLIENTE > 0 AND EXISTE_HABI > 0 THEN 
                   INSERT INTO RESERVAS VALUES((SELECT MAX(CODRESERVA)+1 FROM RESERVAS),HABI,CLI,1,SYSDATE,SYSDATE+1,0 );

ELSE
           DBMS_OUTPUT.PUT_LINE('ALMO MAL A PASADO ');
END IF;
  END IF;
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    IF EXISTE_CLIENTE = 0 THEN
      DBMS_OUTPUT.PUT_LINE('Codigo cliente no válido');
    ELSIF EXISTE_HABI = 0 THEN
      DBMS_OUTPUT.PUT_LINE('Código habitación no válido');
    END IF;
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error indeterminado');
END  RESERVA_EXPRESS;


--LO INSERTAMOS 
BEGIN
   RESERVA_EXPRESS(204,9);
END;


--?	Añade un campo a la tabla HABITACIONES, llamado NUMRESERVAS.

--?	Actualiza el valor del campo NUMRESERVAS con el número de veces que se 
--ha reservado cada habitación.

--?	Crea un TRIGGER que mantenga actualizado este campo en los siguientes casos:
--?	Al realizarse una nueva reserva, incrementando el valor del campo. 
--?	Cuando se produzca una cancelación (borrado), restando en uno el valor del campo.
--?	Cuando el usuario decida cambiar de habitación, sumando o restando según corresponda. Solo debe contemplarse la modificación del campo número de la habitación.
ALTER TABLE HABITACIONES ADD NUMRESERVAS NUMBER(10);

UPDATE HABITACIONES H
SET NUMRESERVAS = (SELECT COUNT(*) FROM RESERVAS R WHERE R.NUMHABITACION = H.NUMHABITACION);



CREATE OR REPLACE TRIGGER ACTUALIZAR_NUMRESERVAS
AFTER INSERT OR DELETE OR UPDATE ON RESERVAS 
FOR EACH ROW
DECLARE
BEGIN
    IF INSERTING THEN
        UPDATE HABITACIONES H
        SET NUMRESERVAS = NUMRESERVAS + 1
        WHERE H.NUMHABITACION = :NEW.NUMHABITACION;
    END IF;

    IF DELETING THEN
        UPDATE HABITACIONES H
        SET H.NUMRESERVAS = H.NUMRESERVAS - 1
        WHERE H.NUMHABITACION = :OLD.NUMHABITACION;
    END IF;

    IF UPDATING THEN
        UPDATE HABITACIONES H
        SET H.NUMRESERVAS = H.NUMRESERVAS + 1
        WHERE H.NUMHABITACION = :NEW.NUMHABITACION;

        UPDATE HABITACIONES H
        SET H.NUMRESERVAS = H.NUMRESERVAS - 1
        WHERE H.NUMHABITACION = :OLD.NUMHABITACION;
    END IF;
END;

insert into reservas values (31,301, 3, 2, sysdate-15, sysdate -13 , 10);


--Realizar un PROCEDURE haciendo uso de cursores que muestre para cada habitación, las reservas que ha tenido de la forma que aparece en el listado. 
--Además, por habitación, hay que indicar cuántas de esas reservas han contratado camas supletorias. 
--Al final del listado, habrá que informar sobre el NÚMERO DE CAMAS SUPLETORIAS TOTAL que han contratado los clientes y la media de camas por reserva. 
 CREATE OR REPLACE PROCEDURE HABITACION AS
CURSOR C1 IS SELECT *
             FROM HABITACIONES;
    VARIABLE_HABITACION C1%ROWTYPE;
    
    CURSOR C2(VARIABLE_HABIT HABITACIONES.NUMHABITACION%TYPE) IS 
       SELECT *
             FROM RESERVAS  
             WHERE NUMHABITACION=VARIABLE_HABIT;
    VARIABLE_RESERVA C2%ROWTYPE;
    
    CURSOR C3(VARIABLE_RESER RESERVAS.CODIGOCLIENTE%TYPE) IS 
       SELECT *
             FROM CLIENTES  
             WHERE CODIGOCLIENTE=VARIABLE_RESER;
    VARIABLE_CLIENTE C3%ROWTYPE;
    
    
    
    CS NUMBER:=0;
    NUMC NUMBER:=0;
    NUMR NUMBER:=0;
    BEGIN
          OPEN C1;
        LOOP
            FETCH C1 INTO VARIABLE_HABITACION;
            EXIT WHEN C1%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE('HABITACI?N: '||VARIABLE_HABITACION.NOMBREHABITACION||'     NUMERO: '||VARIABLE_HABITACION.NUMHABITACION||'    TIPO: '||VARIABLE_HABITACION.TIPO);
            DBMS_OUTPUT.PUT_LINE('=======================================================================');
                        DBMS_OUTPUT.PUT_LINE('CLIENTE                  PAIS         ENTRADA  SALIDA');
            DBMS_OUTPUT.PUT_LINE('------------------------ ------------ -------- --------');
            OPEN C2(VARIABLE_HABITACION.NUMHABITACION);
            LOOP
             FETCH C2 INTO VARIABLE_RESERVA;
            EXIT WHEN C2%NOTFOUND;
            
             
            OPEN C3(VARIABLE_RESERVA.CODIGOCLIENTE);
            LOOP
             FETCH C3 INTO VARIABLE_CLIENTE;
            EXIT WHEN C3%NOTFOUND;
            

            DBMS_OUTPUT.PUT_LINE(VARIABLE_CLIENTE.NOMBRECLIENTE||'                    '||VARIABLE_CLIENTE.PAIS||'      '||VARIABLE_RESERVA.FECHAENTRADA||'    '||VARIABLE_RESERVA.FECHASALIDA);
            
            
            END LOOP;
            CLOSE C3;
            END LOOP;
            CLOSE C2;
            END LOOP;
            CLOSE C1;
    END;

EXEC HABITACION;


