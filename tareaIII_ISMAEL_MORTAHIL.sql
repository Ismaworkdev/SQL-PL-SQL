DROP TABLE Transportistas;
DROP TABLE Camiones;
DROP TABLE Clientes;
DROP TABLE Prepara;
DROP TABLE Paquete_Helados;
DROP TABLE Trabajadores_Industriales;
DROP TABLE TRABAJADORES;
DROP TABLE FABRICA_INDUSTRIAL;

CREATE TABLE TRABAJADORES(
    IDTrabajadores Number,
    tipo VARCHAR(20) NOT   NULL,
    Dni VARCHAR(9) UNIQUE,
    Nombre VARCHAR2(20) NOT NULL, 
    Ape1 VARCHAR2(30) NOT NULL, 
    Ape2 VARCHAR2(30),    
    Edad Number(2) NOT NULL,
    Ciudad VARCHAR2(30), 
    Calle VARCHAR2(100) NOT NULL,
    Numero INT NOT NULL,
    Telefono Number(9),
    CONSTRAINT IDTrabajadores_PK PRIMARY KEY(IDTrabajadores),
    CONSTRAINT Tipotrabajadores CHECK (tipo IN ('Industrial', 'Transportista')));
   
    
CREATE TABLE Trabajadores_Industriales(
     IDtrabajadores Number,
     Numero_Puesto INT NOT NULL,
     CONSTRAINT IDTrabajadores_FK FOREIGN KEY(IDTrabajadores) REFERENCES TRABAJADORES,
     CONSTRAINT Industriales_PK PRIMARY KEY(IDTrabajadores));

CREATE TABLE Paquete_Helados(
    id_paquete_helado Number,
    CONSTRAINT IDPaquete_PK PRIMARY KEY(id_paquete_helado));

CREATE TABLE PREPARA(
    IDtrabajadores Number,
    id_paquete_helado Number,
    fecha DATE,
    CONSTRAINT PreparaPK PRIMARY KEY (IDtrabajadores,id_paquete_helado,fecha),
    CONSTRAINT IDTrabajadoresPrepara_FK FOREIGN KEY (IDtrabajadores) REFERENCES Trabajadores_Industriales,
    CONSTRAINT IDPaquetePrepara_FK FOREIGN KEY (id_paquete_helado) REFERENCES Paquete_Helados);
     
CREATE TABLE clientes(
    IDClientes Number,
    Dni VARCHAR(9) UNIQUE,
    Nombre VARCHAR2(20) NOT NULL, 
    Ape1 VARCHAR2(30) NOT NULL, 
    Ape2 VARCHAR2(30)NOT NULL,    
    Edad Number(2) NOT NULL,
    Ciudad VARCHAR2(30), 
    Calle VARCHAR2(100) NOT NULL,
    Numero INT NOT NULL,
    Telefono Number(9)NOT NULL,
    CONSTRAINT IDclientes_PK PRIMARY KEY(IDClientes));
    
CREATE TABLE Camiones(
    IDCamion Number,
    matricula Varchar2(7) NOT NULL,
    CONSTRAINT IDCamion_PK PRIMARY KEY(IDCamion));
    
CREATE TABLE Transportistas(
    IDTrabajadores Number,
    licencia_conducir Varchar(8),
    IDCamion Number,
    CONSTRAINT IDTrabajadoresTrans_PK PRIMARY KEY(IDTrabajadores),
    CONSTRAINT IDTrabajadoresTrans_FK FOREIGN KEY (IDTrabajadores) REFERENCES TRABAJADORES,
    CONSTRAINT IDCamion_FK FOREIGN KEY(IDCamion) REFERENCES Camiones);
    
CREATE TABLE Pedido(
    id_paquete_helado Number,
    IDtrabajadores Number,
    IDClientes Number,
    Fecha DATE NOT NULL,
    Precio FLOAT NOT NULL,
    CONSTRAINT IDPaquetePedido_PK PRIMARY KEY(id_paquete_helado,IDtrabajadores),
    CONSTRAINT IDPaquetePedido_FK FOREIGN KEY (id_paquete_helado) REFERENCES Paquete_Helados,
    CONSTRAINT IDTrabajadoresPedido_FK FOREIGN KEY (IDTrabajadores) REFERENCES Transportistas,
    CONSTRAINT IDClientesPedido_FK FOREIGN KEY (IDClientes) REFERENCES Clientes);
    
INSERT INTO TRABAJADORES VALUES(1,'Transportista', '12345678X','David','Sanchez','Cuadrado',22,'Talavera','Alcaudete',68,685696774);
INSERT INTO TRABAJADORES VALUES(2,'Industrial','02317449L','Fran','Lauren','Castillo',21,'Talavera','Sol',8,695284333);
INSERT INTO TRABAJADORES VALUES(3,'Industrial','98983382A','Alequi','Mach?n','Cueva',23,'Talavera','Avenida Madrid',23,925768955);
INSERT INTO TRABAJADORES VALUES(4,'Transportista','04567338L','Kirin','Jindosh','Rulek',24,'Talavera','Isaac Peral',2,555888333);
INSERT INTO TRABAJADORES VALUES(5,'Industrial','08917564P','Corvo','Attano','Fiera',22,'Talavera','Sol',9,877343567);
INSERT INTO TRABAJADORES VALUES(6,'Transportista','02344878J','Juan','De Dios','Heredia',32,'Talavera','Plaza del Pan',3,923567893);
INSERT INTO trabajadores_industriales VALUES(1,123);
INSERT INTO trabajadores_industriales VALUES(2,321);
INSERT INTO trabajadores_industriales VALUES(3,132);
INSERT INTO Camiones VALUES(1,'ASD1234');
INSERT INTO Camiones VALUES(2,'DSA4321');
INSERT INTO Camiones VALUES(3,'DAD1423');
INSERT INTO Camiones VALUES(4,'T6272AD');
INSERT INTO Camiones VALUES(5,'2324TOL');
INSERT INTO Transportistas VALUES(1,'12345678',1);
INSERT INTO Transportistas VALUES(4,'23548716',4);
INSERT INTO Transportistas VALUES(6,'83129831',3);
INSERT INTO clientes VALUES(1,'01234564Z','Ismael','Moraleda','Nu?ez',20,'Talavera','Francisco Aguirrez',18,685464574);
INSERT INTO clientes VALUES(2,'65432104Z','Paco','Sanz','Adios',25,'Talavera','Plaza Espa?a',28,925686866);
INSERT INTO clientes VALUES(3,'09823782M','Delilah','Coppersponn','Martinez',33,'Talavera','Plaza del reloj',12,925898998);
INSERT INTO clientes VALUES(4,'45669953K','John','Sierra','Reach',17,'Talavera','Vicar?a Vieja',3,455678898);
INSERT INTO clientes VALUES(5,'89768322P','Sara','Palmer','Cabello',12,'Talavera','Carnicer?as',11,925334433);
INSERT INTO clientes VALUES(6,'09897612W','Emile','Sierra','Bielsa',21,'Talavera','Real F?brica de Seda',12,925722233);
INSERT INTO Paquete_helados VALUES(1);
INSERT INTO Paquete_helados VALUES(2);
INSERT INTO Paquete_helados VALUES(3);
INSERT INTO Paquete_helados VALUES(4);
INSERT INTO Paquete_helados VALUES(5);
INSERT INTO Pedido VALUES(1,1,1,DATE'2023-11-27',200);
INSERT INTO Pedido VALUES(2,1,2,DATE'2023-11-28',120);
INSERT INTO Pedido VALUES(5,4,3,DATE'2023-11-29',110);
INSERT INTO Pedido VALUES(4,4,1,DATE'2023-12-04',100);
INSERT INTO Pedido VALUES(3,4,5,DATE'2023-12-04',80);
INSERT INTO Prepara VALUES(1,1,DATE'2023-11-28');
INSERT INTO Prepara VALUES(2,2,DATE'2023-11-29');
INSERT INTO Prepara VALUES(2,3,DATE'2023-11-29');
INSERT INTO Prepara VALUES(1,4,DATE'2023-12-01');
INSERT INTO Prepara VALUES(1,5,DATE'2023-12-04');



--LO A?ADIDO 
-- PAQUETE HELADO
INSERT INTO Paquete_helados VALUES(6);
INSERT INTO Paquete_helados VALUES(7);

-- TRANSPORTISTAS
INSERT INTO Transportistas VALUES(2,'87654321',2);
INSERT INTO Transportistas VALUES(5,'65432178',5);

-- PEDIDOS
INSERT INTO Pedido VALUES(6,2,3,DATE'2023-12-05',90);
INSERT INTO Pedido VALUES(7,5,4,DATE'2023-12-06',150);

--PREPARA 
INSERT INTO Prepara VALUES(2,6,DATE'2023-12-05');
INSERT INTO Prepara VALUES(2,7,DATE'2023-12-06');

SET SERVEROUTPUT ON 
SET VERIFY OFF

--trigger
CREATE OR REPLACE TRIGGER InsertarCamion_Trabajador
BEFORE INSERT ON Transportistas
FOR EACH ROW
DECLARE
    variable_camion Camiones.IDCAMION%TYPE;
BEGIN
    -- Insertar un nuevo registro en la tabla Camiones
    SELECT NVL(MAX(IDCAMION), 0) + 1 INTO variable_camion FROM Camiones;
    INSERT INTO Camiones (IDCAMION, MATRICULA) VALUES (variable_camion, 'ASD12');

    -- Actualizar el IDCamion del nuevo trabajador
    :NEW.IDCAMION := variable_camion;

    DBMS_OUTPUT.PUT_LINE('Se ha asignado el camión con ID ' || variable_camion || ' al trabajador con ID ' || :NEW.IDTrabajadores);
END;

-- Insertar un nuevo trabajador de tipo 'Transportista' en la tabla 'TRABAJADORES'
INSERT INTO TRABAJADORES (IDTrabajadores, tipo, Dni, Nombre, Ape1, Ape2, Edad, Ciudad, Calle, Numero, Telefono)
VALUES (101, 'Transportista', '123445', 'Juan', 'López', 'García', 30, 'Madrid', 'Calle Mayor', 10, 6789);

INSERT INTO Transportistas(IDTrabajadores,licencia_conducir) VALUES(101,'123555');


--procedure 


CREATE OR REPLACE PROCEDURE TRASPORTISTAS AS
  -- Declaración de cursores
  CURSOR C1 IS
    SELECT *
    FROM TRANSPORTISTAS;
  VARIABLE_TRASPORTISTAS C1%ROWTYPE;
 
  CURSOR C2(VARIABLE_TRAS VARIABLE_TRASPORTISTAS.IDCAMION%TYPE ) IS  --VARIABLE_TRAS NUMBER PUEDES HACER ESTO TAMBIEN 
    SELECT *
    FROM CAMIONES 
    WHERE IDCAMION = VARIABLE_TRAS;
  VARIABLE_CAMIONES C2%ROWTYPE;
    

BEGIN
  -- Mostrar encabezado de tabla
  DBMS_OUTPUT.PUT_LINE('IDTRABAJADOR | LICENCIA        | IDCAMION        | MATRICULA     ');
  DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------');

    -- Recorriendo cursor de transportistas para obtener licencia_conducir y matricula
      OPEN C1;
    LOOP
        FETCH C1 INTO VARIABLE_TRASPORTISTAS;
        EXIT WHEN C1%NOTFOUND;
        
         OPEN C2(VARIABLE_TRASPORTISTAS.IDCAMION);
        LOOP
            FETCH C2 INTO VARIABLE_CAMIONES;
            EXIT WHEN C2%NOTFOUND;
             DBMS_OUTPUT.PUT_LINE(VARIABLE_TRASPORTISTAS.IDTRABAJADORES || '                ' || VARIABLE_TRASPORTISTAS.LICENCIA_CONDUCIR || '                  ' || VARIABLE_CAMIONES.IDCAMION || '                  ' || VARIABLE_CAMIONES.MATRICULA ||  '   ');
       
        
      END LOOP;
        
        CLOSE C2;
    END LOOP;
    
    CLOSE C1;
    
  
  DBMS_OUTPUT.PUT_LINE('Fin del proceso.');
END;


EXEC TRASPORTISTAS;
