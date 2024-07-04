DROP TABLE TURISTAS CASCADE CONSTRAINTS;
DROP TABLE ENFERMEDADES CASCADE CONSTRAINTS;
DROP TABLE MEDICINAS CASCADE CONSTRAINTS;
DROP TABLE TRATAMIENTOS CASCADE CONSTRAINTS;
DROP TABLE medicinas_por_tratamiento CASCADE CONSTRAINTS;
DROP TABLE astronautas CASCADE CONSTRAINTS;
DROP TABLE tripulacion CASCADE CONSTRAINTS;
DROP TABLE Naves CASCADE CONSTRAINTS;
DROP TABLE Viajes CASCADE CONSTRAINTS;
DROP TABLE Reservas CASCADE CONSTRAINTS;

CREATE TABLE turistas (
    dni_tut VARCHAR2(20),
    nombre VARCHAR2(20),
    apellido1 VARCHAR2(20),
    apellido2 VARCHAR2(20),
    direccion VARCHAR2(100),
    ciudad VARCHAR2(30),
    pais VARCHAR2(20),
    nacionalidad VARCHAR2(20),
    fecha_nacimiento DATE,
    CONSTRAINT tur_dni_PK PRIMARY KEY (dni_tut)
);

INSERT INTO turistas VALUES ('12345678A', 'Juan', 'González', 'Martínez', 'Calle Mayor, 1', 'Talavera de la Reina', 'España', 'Española', TO_DATE('1990-05-15', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('23456789B', 'María', 'López', 'Sánchez', 'Avenida del Parque, 10', 'Talavera de la Reina', 'España', 'Colombiana', TO_DATE('1985-08-20', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('34567890C', 'Pedro', 'Fernández', 'Gómez', 'Calle Real, 5', 'Talavera de la Reina', 'España', 'Española', TO_DATE('1978-11-10', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('45678901D', 'Ana', 'Martínez', 'Pérez', 'Plaza España, 3', 'Talavera de la Reina', 'España', 'Española', TO_DATE('1995-03-25', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('56789012E', 'David', 'Rodrígues', 'Hernándes', 'Calle San Francisco, 15', 'Talavera de la Reina', 'España', 'Peruana', TO_DATE('1980-09-30', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('11111111A', 'Juan', 'García', 'Martínez', 'Calle Mayor 10', 'Valladolid', 'España', 'Española', TO_DATE('1985-03-15', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('22222222B', 'María', 'López', 'Fernández', 'Calle Real 5', 'Valladolid', 'España', 'Española', TO_DATE('1990-07-20', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('33333333C', 'Pedro', 'Rodríguez', 'Sánchez', 'Plaza Mayor 3', 'Valladolid', 'España', 'Española', TO_DATE('1978-11-02', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('44444444D', 'Ana', 'Pérez', 'Gómez', 'Avenida España 15', 'Valladolid', 'España', 'Española', TO_DATE('1982-09-25', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('55555555E', 'Luis', 'Schmidt', 'Müller', 'Hauptstraße 20', 'Berlín', 'Alemania', 'Alemana', TO_DATE('1995-02-10', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('66666666F', 'Sophie', 'Becker', 'Schneider', 'Kurfürstendamm 15', 'Berlín', 'Alemania', 'Alemana', TO_DATE('1989-06-28', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('77777777G', 'Marco', 'Rossi', 'Bianchi', 'Via del Corso 10', 'Roma', 'Italia', 'Italiana', TO_DATE('1990-08-15', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('88888888H', 'Giulia', 'Conti', 'Marini', 'Piazza Navona 5', 'Roma', 'Italia', 'Italiana', TO_DATE('1985-04-22', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('99999999I', 'Antonio', 'Ferrari', 'Romano', 'Via dei Fori Imperiali 8', 'Roma', 'Italia', 'Italiana', TO_DATE('1982-11-07', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('11111111J', 'Jean', 'Leroy', 'Dubois', 'Rue de Rivoli 20', 'París', 'Francia', 'Francesa', TO_DATE('1980-05-12', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('22222222K', 'Lena', 'Müller', 'Schmidt', 'Hauptstraße 15', 'Berlín', 'Alemania', 'Alemana', TO_DATE('1975-09-28', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('33333333L', 'James', 'Smith', 'Johnson', 'Baker Street 221B', 'Londres', 'Reino Unido', 'Británica', TO_DATE('1988-12-04', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('44444444M', 'Giorgio', 'Ricci', 'Moretti', 'Via Veneto 30', 'Roma', 'Italia', 'Italiana', TO_DATE('1979-03-19', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('55555555N', 'María', 'García', 'Fernández', 'Calle Mayor 12', 'Madrid', 'España', 'Española', TO_DATE('1992-07-21', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('66666666O', 'Carla', 'Martínez', 'García', 'Rambla Catalunya 100', 'Barcelona', 'España', 'Española', TO_DATE('1985-10-15', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('77777777P', 'David', 'Sánchez', 'Fernández', 'Calle Colón 25', 'Valencia', 'España', 'Española', TO_DATE('1990-04-28', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('88888888Q', 'Ana', 'Gómez', 'López', 'Calle Sierpes 8', 'Sevilla', 'España', 'Española', TO_DATE('1982-08-03', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('99999999R', 'Javier', 'Fernández', 'Martínez', 'Gran Vía 50', 'Bilbao', 'España', 'Española', TO_DATE('1976-11-11', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('101010101A', 'Elena', 'Díaz', 'Ruiz', 'Calle Larios 35', 'Málaga', 'España', 'Española', TO_DATE('1993-02-19', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('111111111B', 'Pablo', 'Moreno', 'Sanz', 'Paseo Independencia 70', 'Zaragoza', 'España', 'Española', TO_DATE('1987-07-07', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('121212121C', 'Laura', 'Pérez', 'González', 'Paseo Explanada 15', 'Alicante', 'España', 'Española', TO_DATE('1989-05-24', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('131313131D', 'Sergio', 'Jiménez', 'Díaz', 'Calle Navas 8', 'Granada', 'España', 'Española', TO_DATE('1984-09-12', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('141414141E', 'Marta', 'Rodríguez', 'Hernández', 'Calle Trapería 20', 'Murcia', 'España', 'Española', TO_DATE('1995-11-30', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('151515151F', 'Carlos', 'Romero', 'Alvarez', 'Calle Ancha 5', 'Cádiz', 'España', 'Española', TO_DATE('1980-03-08', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('161616161G', 'Giuseppe', 'Ricci', 'Conti', 'Calle Gran Vía 25', 'Madrid', 'España', 'Italiana', TO_DATE('1988-12-10', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('171717171H', 'Martina', 'Rossi', 'Moretti', 'Rambla Catalunya 50', 'Barcelona', 'España', 'Italiana', TO_DATE('1992-06-22', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('181818181I', 'Javier', 'González', 'Martínez', 'Avenida Reforma 100', 'Ciudad de México', 'México', 'Española', TO_DATE('1985-07-15', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('191919191J', 'Lucía', 'Fernández', 'Díaz', 'Avenida Corrientes 500', 'Buenos Aires', 'Argentina', 'Española', TO_DATE('1990-04-28', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('202020202K', 'Diego', 'Martínez', 'Sánchez', 'Shibuya 2-15-1', 'Tokio', 'Japón', 'Española', TO_DATE('1982-11-03', 'YYYY-MM-DD'));
INSERT INTO turistas VALUES ('212121212L', 'Elena', 'García', 'López', 'Sukhumvit Road 55', 'Bangkok', 'Tailandia', 'Española', TO_DATE('1989-09-20', 'YYYY-MM-DD'));

CREATE TABLE Enfermedades (
    id_enf NUMBER(2),
    nombre_comun VARCHAR2(50),
    gravedad NUMBER(1),
    CONSTRAINT enf_id_PK PRIMARY KEY (id_enf)
);

INSERT INTO Enfermedades VALUES (1, 'Resfriado común', 1);
INSERT INTO Enfermedades VALUES (2, 'Gripe', 2);
INSERT INTO Enfermedades VALUES (3, 'Alergia estacional', 1);
INSERT INTO Enfermedades VALUES (4, 'Bronquitis', 3);
INSERT INTO Enfermedades VALUES (5, 'Migraña', 2);
INSERT INTO Enfermedades VALUES (6, 'Tendinitis', 3);
INSERT INTO Enfermedades VALUES (7, 'Hipertensión', 3);
INSERT INTO Enfermedades VALUES (8, 'Artritis', 3);
INSERT INTO Enfermedades VALUES (9, 'Hemorroides', 2);
INSERT INTO Enfermedades VALUES (10, 'Estrés', 2);
INSERT INTO Enfermedades VALUES (11, 'Esguince', 2);
INSERT INTO Enfermedades VALUES (12, 'Acidez estomacal', 1);
INSERT INTO Enfermedades VALUES (13, 'Dolor de espalda', 2);
INSERT INTO Enfermedades VALUES (14, 'Alergia alimentaria', 1);
INSERT INTO Enfermedades VALUES (15, 'Calambre muscular', 1);
INSERT INTO Enfermedades VALUES (16, 'Anemia', 2);
INSERT INTO Enfermedades VALUES (17, 'Asma', 3);
INSERT INTO Enfermedades VALUES (18, 'Vértigo', 2);
INSERT INTO Enfermedades VALUES (19, 'Diarrea', 1);
INSERT INTO Enfermedades VALUES (20, 'Insuficiencia renal', 5);

CREATE TABLE Medicinas (
    id_med NUMBER(3),
    nombre VARCHAR2(30),
    dosis VARCHAR2(10),
    laboratorio VARCHAR2(30),
    compuesto VARCHAR2(20),
    tipo VARCHAR2(20) CHECK 
    (tipo IN ('analgesicos', 'antiestaminicos', 'descongestionantes','antiinflamatorios',
                'hipotensores','antibioticos','ansioliticos','antiulceroso',
                'diureticos','antitusivos','expectorantes','antihipertensivos')),
    CONSTRAINT med_id_PK PRIMARY KEY (id_med)
);

INSERT INTO Medicinas VALUES (1, 'Dolocatil', '500 mg', 'Farmalastic', 'Paracetamol', 'analgesicos');
INSERT INTO Medicinas VALUES (2, 'Brufen', '400 mg', 'Bayer', 'Ibuprofeno', 'analgesicos');
INSERT INTO Medicinas VALUES (3, 'Aspirina', '100 mg', 'Bayer', 'Acetilsalicílico', 'analgesicos');
INSERT INTO Medicinas VALUES (4, 'Claritine', '10 mg', 'Bayer', 'Loratadina', 'antiestaminicos');
INSERT INTO Medicinas VALUES (5, 'Zyrtec', '5 mg', 'Johnson', 'Cetirizina', 'antiestaminicos');
INSERT INTO Medicinas VALUES (6, 'Sudafed', '30 mg', 'GSK', 'Pseudoefedrina', 'descongestionantes');
INSERT INTO Medicinas VALUES (7, 'Advil', '200 mg', 'Pfizer', 'Ibuprofeno', 'analgesicos');
INSERT INTO Medicinas VALUES (8, 'Aleve', '220 mg', 'Bayer', 'Naproxeno', 'antiinflamatorios');
INSERT INTO Medicinas VALUES (9, 'Voltaren', '50 mg', 'Novartis', 'Diclofenaco', 'antiinflamatorios');
INSERT INTO Medicinas VALUES (10, 'Cozaar', '50 mg', 'Merck', 'Losartán', 'hipotensores');
INSERT INTO Medicinas VALUES (11, 'Norvasc', '5 mg', 'Pfizer', 'Amlodipino', 'hipotensores');
INSERT INTO Medicinas VALUES (12, 'Vasotec', '10 mg', 'Merck', 'Enalapril', 'hipotensores');
INSERT INTO Medicinas VALUES (13, 'Panadol', '500 mg', 'GlaxoSmithKline', 'Paracetamol', 'analgesicos');
INSERT INTO Medicinas VALUES (14, 'Advil', '400 mg', 'Pfizer', 'Ibuprofeno', 'analgesicos');
INSERT INTO Medicinas VALUES (15, 'Aleve', '220 mg', 'Bayer', 'Naproxeno', 'analgesicos');
INSERT INTO Medicinas VALUES (16, 'Cipro', '250 mg', 'Bayer', 'Ciprofloxacino', 'antibioticos');
INSERT INTO Medicinas VALUES (17, 'Amoxil', '500 mg', 'GlaxoSmithKline', 'Amoxicilina', 'antibioticos');
INSERT INTO Medicinas VALUES (18, 'Zithromax', '500 mg', 'Pfizer', 'Azitromicina', 'antibioticos');
INSERT INTO Medicinas VALUES (19, 'Ativan', '1 mg', 'Pfizer', 'Lorazepam', 'ansioliticos');
INSERT INTO Medicinas VALUES (20, 'Xanax', '0.5 mg', 'Pfizer', 'Alprazolam', 'ansioliticos');
INSERT INTO Medicinas VALUES (21, 'Klonopin', '1 mg', 'Roche', 'Clonazepam', 'ansioliticos');
INSERT INTO Medicinas VALUES (22, 'Panadol', '500 mg', 'GlaxoSmithKline', 'Paracetamol', 'analgesicos');
INSERT INTO Medicinas VALUES (23, 'Advil', '400 mg', 'Pfizer', 'Ibuprofeno', 'analgesicos');
INSERT INTO Medicinas VALUES (24, 'Aleve', '220 mg', 'Bayer', 'Naproxeno', 'analgesicos');
INSERT INTO Medicinas VALUES (25, 'Cipro', '250 mg', 'Bayer', 'Ciprofloxacino', 'antibioticos');
INSERT INTO Medicinas VALUES (26, 'Amoxil', '500 mg', 'GlaxoSmithKline', 'Amoxicilina', 'antibioticos');
INSERT INTO Medicinas VALUES (27, 'Zithromax', '500 mg', 'Pfizer', 'Azitromicina', 'antibioticos');
INSERT INTO Medicinas VALUES (28, 'Ativan', '1 mg', 'Pfizer', 'Lorazepam', 'ansioliticos');
INSERT INTO Medicinas VALUES (29, 'Xanax', '0.5 mg', 'Pfizer', 'Alprazolam', 'ansioliticos');
INSERT INTO Medicinas VALUES (30, 'Klonopin', '1 mg', 'Roche', 'Clonazepam', 'ansioliticos');
INSERT INTO Medicinas VALUES (31, 'Prilosec', '20 mg', 'AstraZeneca', 'Omeprazol', 'antiulceroso');
INSERT INTO Medicinas VALUES (32, 'Zantac', '150 mg', 'GlaxoSmithKline', 'Ranitidina', 'antiulceroso');
INSERT INTO Medicinas VALUES (33, 'Protonix', '40 mg', 'Pfizer', 'Pantoprazol', 'antiulceroso');
INSERT INTO Medicinas VALUES (34, 'Lasix', '40 mg', 'Sanofi', 'Furosemida', 'diureticos');
INSERT INTO Medicinas VALUES (35, 'HydroDIURIL', '25 mg', 'Novartis', 'Hidroclorotiazida', 'diureticos');
INSERT INTO Medicinas VALUES (36, 'Aldactone', '25 mg', 'Pfizer', 'Espironolactona', 'diureticos');
INSERT INTO Medicinas VALUES (37, 'Codeína', '30 mg', 'Mallinckrodt Pharmaceuticals', 'Codeína', 'analgesicos');
INSERT INTO Medicinas VALUES (38, 'Robitussin', '15 mg', 'Pfizer', 'Dextrometorfano', 'antitusivos');
INSERT INTO Medicinas VALUES (39, 'Bisolvon', '8 mg', 'Boehringer Ingelheim', 'Bromhexina', 'expectorantes');
INSERT INTO Medicinas VALUES (40, 'Ibuprofeno', '200 mg', 'Bayer', 'Ibuprofeno', 'analgesicos');
INSERT INTO Medicinas VALUES (41, 'Dolocatil', '500 mg', 'GlaxoSmithKline', 'Paracetamol', 'analgesicos');
INSERT INTO Medicinas VALUES (42, 'Voltaren', '100 mg', 'Novartis', 'Diclofenaco', 'antiinflamatorios');
INSERT INTO Medicinas VALUES (43, 'Claritin', '10 mg', 'Bayer', 'Loratadina', 'antiestaminicos');
INSERT INTO Medicinas VALUES (44, 'Zyrtec', '5 mg', 'Johnson', 'Cetirizina', 'antiestaminicos');
INSERT INTO Medicinas VALUES (45, 'Aerius', '5 mg', 'Merck', 'Desloratadina', 'antiestaminicos');
INSERT INTO Medicinas VALUES (46, 'Enalapril', '5 mg', 'Pfizer', 'Enalapril', 'antihipertensivos');
INSERT INTO Medicinas VALUES (47, 'Cozaar', '50 mg', 'Merck', 'Losartán', 'antihipertensivos');
INSERT INTO Medicinas VALUES (48, 'Norvasc', '5 mg', 'Pfizer', 'Amlodipino', 'antihipertensivos');
INSERT INTO Medicinas VALUES (49, 'Omeprazol', '20 mg', 'AstraZeneca', 'Omeprazol', 'antiulceroso');
INSERT INTO Medicinas VALUES (50, 'Pantoprazol', '40 mg', 'Takeda Pharmaceutical', 'Pantoprazol', 'antiulceroso');
INSERT INTO Medicinas VALUES (51, 'Nexium', '40 mg', 'AstraZeneca', 'Esomeprazol', 'antiulceroso');
INSERT INTO Medicinas VALUES (52, 'Hidroclorotiazida', '25 mg', 'Pfizer', 'Hidroclorotiazida', 'diureticos');
INSERT INTO Medicinas VALUES (53, 'Lasix', '40 mg', 'Sanofi', 'Furosemida', 'diureticos');
INSERT INTO Medicinas VALUES (54, 'Aldactone', '25 mg', 'Pfizer', 'Espironolactona', 'diureticos');

CREATE TABLE TRATAMIENTOS (
    id_tra NUMBER(3), 
    dni_tut VARCHAR2(20),
    id_enf NUMBER(2),
    fecha_inicio DATE,
    fecha_fin DATE,
    observaciones VARCHAR2(200) DEFAULT 'SIN ESPECIFICAR',
    CONSTRAINT tra_id_PK PRIMARY KEY(id_tra),
    CONSTRAINT tra_tur_fk FOREIGN KEY (dni_tut) REFERENCES turistas (dni_tut),
    CONSTRAINT tra_enf_fk FOREIGN KEY (id_enf) REFERENCES Enfermedades (id_enf)
);

INSERT INTO tratamientos VALUES (1,'12345678A', 12, TO_DATE('2024-05-09', 'YYYY-MM-DD'), TO_DATE('2024-07-16', 'YYYY-MM-DD'), 'Tratamiento estándar');
INSERT INTO tratamientos VALUES (2,'12345678A', 13, TO_DATE('2024-05-09', 'YYYY-MM-DD'), TO_DATE('2024-07-16', 'YYYY-MM-DD'), 'Tratamiento estándar');
INSERT INTO tratamientos VALUES (3,'22222222B', 20, TO_DATE('2024-05-09', 'YYYY-MM-DD'), TO_DATE('2024-07-31', 'YYYY-MM-DD'), 'Tratamiento estándar');
INSERT INTO tratamientos VALUES (4,'22222222B', 3, TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2024-08-30', 'YYYY-MM-DD'), 'A ESPECIFICAR');
INSERT INTO tratamientos VALUES (5,'11111111J', 3, TO_DATE('2024-05-09', 'YYYY-MM-DD'), TO_DATE('2024-11-16', 'YYYY-MM-DD'), 'A ESPECIFICAR');
INSERT INTO tratamientos VALUES (6,'11111111A', 18, TO_DATE('2024-05-09', 'YYYY-MM-DD'), TO_DATE('2024-05-16', 'YYYY-MM-DD'), 'Tratamiento para Enfermedad 1');
INSERT INTO tratamientos VALUES (7,'33333333C', 19, TO_DATE('2024-05-11', 'YYYY-MM-DD'), TO_DATE('2024-05-18', 'YYYY-MM-DD'), 'A ESPECIFICAR');
INSERT INTO tratamientos VALUES (8,'44444444D', 15, TO_DATE('2024-05-12', 'YYYY-MM-DD'), TO_DATE('2025-05-19', 'YYYY-MM-DD'), 'A ESPECIFICAR');
INSERT INTO tratamientos VALUES (9,'55555555E', 7, TO_DATE('2024-05-13', 'YYYY-MM-DD'), TO_DATE('2025-05-20', 'YYYY-MM-DD'), 'A ESPECIFICAR');
INSERT INTO tratamientos VALUES (10,'212121212L', 20, TO_DATE('2024-05-13', 'YYYY-MM-DD'), TO_DATE('2024-05-20','YYYY-MM-DD'), 'observaciones');


CREATE TABLE medicinas_por_tratamiento (
    id_tra NUMBER(3),
    id_med NUMBER(3),
    pauta VARCHAR2(100),
    CONSTRAINT mpt_pk PRIMARY KEY (id_tra, id_med),
    CONSTRAINT mpt_tra_FK FOREIGN KEY (id_tra) REFERENCES tratamientos (id_tra),
    CONSTRAINT mpt_med_FK FOREIGN KEY (id_med) REFERENCES medicinas (id_med)
);

INSERT INTO medicinas_por_tratamiento VALUES (1, 51, 'Un comprimido/6 horas con alimentos');
INSERT INTO medicinas_por_tratamiento VALUES (1, 41, 'Un comprimido si dolor extremo');
INSERT INTO medicinas_por_tratamiento VALUES (2, 9, 'Un comprimido/6 horas con alimentos');
INSERT INTO medicinas_por_tratamiento VALUES (2, 7, 'Un comprimido/8 horas con agua');
INSERT INTO medicinas_por_tratamiento VALUES (3, 52, 'Un comprimido/8 horas con agua');
INSERT INTO medicinas_por_tratamiento VALUES (3, 10, 'Un comprimido al día por la noche');
INSERT INTO medicinas_por_tratamiento VALUES (4, 8, 'Un comprimido/8 horas con agua');
INSERT INTO medicinas_por_tratamiento VALUES (4, 4, 'Un comprimido al día por la noche');
INSERT INTO medicinas_por_tratamiento VALUES (5, 4, 'Tomar 1 tableta al día por la mañana');
INSERT INTO medicinas_por_tratamiento VALUES (6, 38, 'Tomar 1 tableta al día por la mañana');
INSERT INTO medicinas_por_tratamiento VALUES (7, 10, 'Un comprimido/8 horas con agua');
INSERT INTO medicinas_por_tratamiento VALUES (7, 54, 'Un comprimido al día por la noche');
INSERT INTO medicinas_por_tratamiento VALUES (8, 18, 'Un comprimido/8 horas con agua');
INSERT INTO medicinas_por_tratamiento VALUES (9, 9, 'Un comprimido al día por la noche');
INSERT INTO medicinas_por_tratamiento VALUES (10, 7, 'Un comprimido/8 horas con agua');
INSERT INTO medicinas_por_tratamiento VALUES (10, 48, 'Un comprimido al día por la noche');
--INSERT INTO medicinas_por_tratamiento VALUES (11, 20, 'Un comprimido al día por la mañana');
--INSERT INTO medicinas_por_tratamiento VALUES (11, 54, 'Un comprimido al día por la mañana');

CREATE TABLE astronautas (
    dni_ast VARCHAR2(20),
    nombre VARCHAR2(20),
    ape1 VARCHAR2(20),
    ape2 VARCHAR2(20),
    nacionalidad VARCHAR2(20),
    cargo VARCHAR2(20) CHECK (cargo IN ('tripulante', 'medico', 'asistente')),
    CONSTRAINT ast_dni_PK PRIMARY KEY (dni_ast)
);

INSERT INTO astronautas VALUES ('55555555T', 'José', 'Martínez', 'García', 'Española', 'tripulante');
INSERT INTO astronautas VALUES ('66666666U', 'Manuel', 'Fernández', 'López', 'Española', 'medico');
INSERT INTO astronautas VALUES ('77777777V', 'Antonio', 'González', 'Rodríguez', 'Española', 'asistente');
INSERT INTO astronautas VALUES ('88888888W', 'Francisco', 'Pérez', 'Sánchez', 'Española', 'tripulante');
INSERT INTO astronautas VALUES ('99999999X', 'Javier', 'Gómez', 'Martínez', 'Española', 'medico');
INSERT INTO astronautas VALUES ('101010101Y', 'María', 'Rodríguez', 'López', 'Española', 'asistente');
INSERT INTO astronautas VALUES ('111111111Z', 'Ana', 'Sánchez', 'Martínez', 'Española', 'tripulante');
INSERT INTO astronautas VALUES ('121212121A', 'Isabel', 'Martínez', 'García', 'Española', 'medico');
INSERT INTO astronautas VALUES ('131313131B', 'Carmen', 'López', 'Fernández', 'Española', 'asistente');
INSERT INTO astronautas VALUES ('141414141C', 'Laura', 'Sánchez', 'Rodríguez', 'Española', 'tripulante');
INSERT INTO astronautas VALUES ('22222222T', 'Ivan', 'Ivanov', 'Ivanovich', 'Rusa', 'tripulante');
INSERT INTO astronautas VALUES ('33333333U', 'Mikhail', 'Mikhailov', 'Mikhailovich', 'Rusa', 'medico');
INSERT INTO astronautas VALUES ('44444444V', 'Vladimir', 'Vladimirov', 'Vladimirovich', 'Rumana', 'asistente');
INSERT INTO astronautas VALUES ('55555555W', 'Nicolae', 'Nicolae', 'Nicolae', 'Rumana', 'tripulante');
INSERT INTO astronautas VALUES ('66666666X', 'Alexandru', 'Alexandru', 'Alexandru', 'Árabe', 'medico');
INSERT INTO astronautas VALUES ('77777777Y', 'Ali', 'Ali', 'Ali', 'Árabe', 'asistente');
INSERT INTO astronautas VALUES ('88888888Z', 'John', 'Smith', 'Jr.', 'Estadounidense', 'tripulante');
INSERT INTO astronautas VALUES ('99999999A', 'Michael', 'Johnson', 'Sr.', 'Estadounidense', 'medico');
INSERT INTO astronautas VALUES ('101010101B', 'Emily', 'Williams', 'Jr.', 'Estadounidense', 'asistente');
INSERT INTO astronautas VALUES ('111111111C', 'Emma', 'Brown', 'Sr.', 'Estadounidense', 'tripulante');
INSERT INTO astronautas VALUES ('121212121D', 'Dmitri', 'Dmitriov', 'Dmitriovich', 'Rusa', 'tripulante');
INSERT INTO astronautas VALUES ('131313131E', 'Andrei', 'Andrei', 'Andrei', 'Rusa', 'tripulante');
INSERT INTO astronautas VALUES ('141414141F', 'Ion', 'Ion', 'Ion', 'Rumana', 'tripulante');
INSERT INTO astronautas VALUES ('151515151G', 'Ana', 'Ana', 'Ana', 'Rumana', 'tripulante');
INSERT INTO astronautas VALUES ('161616161H', 'Mohammed', 'Mohammed', 'Mohammed', 'Árabe', 'tripulante');
INSERT INTO astronautas VALUES ('171717171I', 'Fatima', 'Fatima', 'Fatima', 'Árabe', 'tripulante');
INSERT INTO astronautas VALUES ('181818181J', 'Matthew', 'Brown', 'Jr.', 'Estadounidense', 'tripulante');
INSERT INTO astronautas VALUES ('191919191K', 'Jessica', 'Taylor', 'Sr.', 'Estadounidense', 'tripulante');
INSERT INTO astronautas VALUES ('202020202L', 'David', 'Davis', 'Jr.', 'Estadounidense', 'tripulante');
INSERT INTO astronautas VALUES ('212121212M', 'Sarah', 'Miller', 'Sr.', 'Estadounidense', 'tripulante');
INSERT INTO astronautas VALUES ('122222222Z', 'Sophie', 'Dupont', 'Martin', 'Francesa', 'medico');
INSERT INTO astronautas VALUES ('232323232B', 'Isabella', 'Rossi', 'Moretti', 'Italiana', 'medico');
INSERT INTO astronautas VALUES ('242424242C', 'Maria', 'Garcia', 'Lopez', 'Española', 'medico');
INSERT INTO astronautas VALUES ('252525252D', 'Elena', 'Diaz', 'Ruiz', 'Española', 'medico');
INSERT INTO astronautas VALUES ('262626262E', 'Hannah', 'Müller', 'Schmidt', 'Alemana', 'asistente');
INSERT INTO astronautas VALUES ('272727272F', 'Anna', 'Novak', 'Kovács', 'Húngara', 'asistente');
INSERT INTO astronautas VALUES ('282828282G', 'Sophia', 'Andersen', 'Nielsen', 'Danesa', 'asistente');
INSERT INTO astronautas VALUES ('292929292H', 'Charlotte', 'Jansen', 'De Jong', 'Holandesa', 'asistente');
INSERT INTO astronautas VALUES ('303030303I', 'Lena', 'Nowak', 'Kowalska', 'Polaca', 'asistente');
INSERT INTO astronautas VALUES ('313131313J', 'Eva', 'Vasilescu', 'Ionescu', 'Rumana', 'asistente');

CREATE TABLE tripulacion (
    id_tri NUMBER(5),
    dni_ast VARCHAR2(10),
    dni_cap VARCHAR2(10) DEFAULT NULL,
    cod_via VARCHAR(8),
    CONSTRAINT tripulacion_pk PRIMARY KEY (id_tri, dni_ast),
    CONSTRAINT tri_ast_fk FOREIGN KEY (dni_ast) REFERENCES astronautas (dni_ast),
    CONSTRAINT tri_cap_fk FOREIGN KEY (dni_cap) REFERENCES astronautas (dni_ast)
);


INSERT INTO tripulacion VALUES (1, '66666666U','66666666U', 'INTER_1');
INSERT INTO tripulacion VALUES (1, '55555555T','66666666U', 'INTER_1');
INSERT INTO tripulacion VALUES (1, '88888888Z','66666666U', 'INTER_1');
INSERT INTO tripulacion VALUES (1, '111111111C','66666666U', 'INTER_1');
INSERT INTO tripulacion VALUES (1, '77777777V','66666666U', 'INTER_1');
INSERT INTO tripulacion VALUES (1, '101010101Y','66666666U', 'INTER_1');
INSERT INTO tripulacion VALUES (1, '131313131B','66666666U', 'INTER_1');
INSERT INTO tripulacion VALUES (1, '313131313J','66666666U', 'INTER_1');


INSERT INTO tripulacion VALUES (2, '122222222Z','111111111C','INTER_2');
INSERT INTO tripulacion VALUES (2, '77777777V','111111111C','INTER_2');
INSERT INTO tripulacion VALUES (2, '101010101Y','111111111C','INTER_2');
INSERT INTO tripulacion VALUES (2, '131313131B','111111111C','INTER_2');
INSERT INTO tripulacion VALUES (2, '292929292H','111111111C','INTER_2');
INSERT INTO tripulacion VALUES (2, '88888888Z','111111111C','INTER_2');
INSERT INTO tripulacion VALUES (2, '111111111C','111111111C','INTER_2');
INSERT INTO tripulacion VALUES (2, '181818181J','111111111C','INTER_2');


INSERT INTO tripulacion VALUES (3, '232323232B','111111111Z','INTER_3');
INSERT INTO tripulacion VALUES (3, '77777777Y','111111111Z','INTER_3');
INSERT INTO tripulacion VALUES (3, '262626262E','111111111Z','INTER_3');
INSERT INTO tripulacion VALUES (3, '272727272F','111111111Z','INTER_3');
INSERT INTO tripulacion VALUES (3, '282828282G','111111111Z','INTER_3');
INSERT INTO tripulacion VALUES (3, '111111111Z','111111111Z','INTER_3');
INSERT INTO tripulacion VALUES (3, '141414141C','111111111Z','INTER_3');
INSERT INTO tripulacion VALUES (3, '191919191K','111111111Z','INTER_3');

CREATE TABLE Naves (
    id_nave NUMBER(2),
    nombre VARCHAR(20) NOT NULL,
    modelo VARCHAR(20) NOT NULL,
    fabricante VARCHAR(30) NOT NULL,
    camarotes NUMBER(2),
    estado VARCHAR(20) DEFAULT 'activo' CHECK (estado IN ('activo', 'en_reparacion')) NOT NULL,
    PRIMARY KEY (id_nave)
);


INSERT INTO Naves VALUES (1, 'Discovery', 'DS-100', 'NASA', 17, 'activo');
INSERT INTO Naves VALUES (2, 'Pioneer', 'PN-200', 'SpaceX', 15, 'activo');
INSERT INTO Naves VALUES (3, 'Voyager', 'VY-300', 'ESA', 19, 'en_reparacion');

CREATE TABLE Viajes (
    cod_via VARCHAR(8),
    id_tri NUMBER(5) DEFAULT -1,
    id_nave NUMBER(2),
    fecha_ini DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    observaciones VARCHAR(100),
    CONSTRAINT pk_viajes PRIMARY KEY (cod_via),
    CONSTRAINT via_nav_FK FOREIGN KEY (id_nave) REFERENCES Naves(id_nave)
);

INSERT INTO Viajes VALUES ('INTER_1', 1, 1, SYSDATE + 40, SYSDATE + 200, 'SE DARÁN INSTRUCCIONES 30 DÍAS ANTES DE COMENZAR');
INSERT INTO Viajes VALUES ('INTER_2', 2, 2, SYSDATE + 80, SYSDATE + 300, 'SE DARÁN INSTRUCCIONES 30 DÍAS ANTES DE COMENZAR');
INSERT INTO Viajes VALUES ('INTER_3', 3, 1, SYSDATE + 90, SYSDATE + 300, 'SE DARÁN INSTRUCCIONES 30 DÍAS ANTES DE COMENZAR');

ALTER TABLE TRIPULACION ADD CONSTRAINT tri_via_FK FOREIGN KEY (cod_via) REFERENCES Viajes(Cod_via);

CREATE TABLE Reservas (
    cod_via VARCHAR(8),
    dni_tut VARCHAR(20),
    dni_rep VARCHAR(20) DEFAULT NULL,
    precio NUMBER(10,2),
    fecha_pago DATE,
    CONSTRAINT pk_reservas PRIMARY KEY (cod_via, dni_tut),
    CONSTRAINT fk_cod_via FOREIGN KEY (cod_via) REFERENCES Viajes(cod_via),
    CONSTRAINT fk_dni_tur FOREIGN KEY (dni_tut) REFERENCES Turistas(dni_tut),
    CONSTRAINT fk_dni_rep FOREIGN KEY (dni_rep) REFERENCES Turistas(dni_tut)
);

INSERT INTO Reservas (cod_via, dni_tut, dni_rep, precio, fecha_pago)
VALUES ('INTER_1', '12345678A', '12345678A', 111500.00, SYSDATE);
INSERT INTO Reservas VALUES ('INTER_1', '55555555N', '12345678A', 25000.00, SYSDATE);
INSERT INTO Reservas VALUES ('INTER_1', '66666666O', '12345678A', 25000.00, SYSDATE);
INSERT INTO Reservas VALUES ('INTER_1', '77777777P', '12345678A', 25000.00, SYSDATE);
INSERT INTO Reservas VALUES ('INTER_1', '88888888Q', '12345678A', 25000.00, SYSDATE);
INSERT INTO Reservas VALUES ('INTER_1', '22222222B', '12345678A', 30000.00, SYSDATE);
INSERT INTO Reservas VALUES ('INTER_1', '77777777G', '12345678A', 30000.00, SYSDATE);
INSERT INTO Reservas VALUES ('INTER_1', '11111111J', '12345678A', 30000.00, SYSDATE);
INSERT INTO Reservas VALUES ('INTER_1', '22222222K', '12345678A', 30000.00, SYSDATE);
INSERT INTO Reservas VALUES ('INTER_1', '33333333L', '12345678A', 30000.00, SYSDATE);
INSERT INTO Reservas VALUES ('INTER_3', '77777777G', '77777777G', 25000.00, SYSDATE + DBMS_RANDOM.VALUE(1, 10));
INSERT INTO Reservas VALUES ('INTER_3', '11111111J', '77777777G', 25000.00, SYSDATE + DBMS_RANDOM.VALUE(1, 10));
INSERT INTO Reservas VALUES ('INTER_3', '33333333L', '77777777G', 25000.00, SYSDATE + DBMS_RANDOM.VALUE(1, 10));
INSERT INTO Reservas VALUES ('INTER_3', '44444444D', '77777777G', 30000.00, SYSDATE + DBMS_RANDOM.VALUE(1, 10));
INSERT INTO Reservas VALUES ('INTER_3', '55555555E', '77777777G', 30000.00, SYSDATE + DBMS_RANDOM.VALUE(1, 10));
INSERT INTO Reservas VALUES ('INTER_3', '66666666O', '77777777G', 30000.00, SYSDATE + DBMS_RANDOM.VALUE(1, 10));
INSERT INTO Reservas VALUES ('INTER_2', '55555555E', '55555555E', 22000.00, SYSDATE + DBMS_RANDOM.VALUE(1, 10));
INSERT INTO Reservas VALUES ('INTER_2', '66666666F', '12345678A', 22000.00, SYSDATE + DBMS_RANDOM.VALUE(1, 10));
INSERT INTO Reservas VALUES ('INTER_2', '77777777G', '12345678A', 22000.00, SYSDATE + DBMS_RANDOM.VALUE(1, 10));
INSERT INTO Reservas VALUES ('INTER_2', '88888888H', '12345678A', 22000.00, SYSDATE + DBMS_RANDOM.VALUE(1, 10));
INSERT INTO Reservas VALUES ('INTER_2', '55555555N', '12345678A', 23000.00, SYSDATE + DBMS_RANDOM.VALUE(1, 10));
INSERT INTO Reservas VALUES ('INTER_2', '66666666O', '12345678A', 23000.00, SYSDATE + DBMS_RANDOM.VALUE(1, 10));
 SET SERVEROUTP ON
SET VERIFY OFF
--EJERCICIO 2 
--CREAR UN PROCEDIMENTO ALMACENADO AL QUE LE PASAREMOS UN CLDIGO DE VIAJE DE TAL FORMA QUE NOS MOSTRARA EL NOMBRE DE LOS TURISTAS QUE LO HAN RESERVADO Y LA INFORMACION DE SUS TRATAMIENTOS MEDICOD E LA SIGUIENTE FORMA 

/* EJERCICIO 2. Recibe por par?metro el c?digo de un viaje
   y lista todos los tratamientos que deben ser supervisados durate el viaje
   TURISTAS CON TRATAMIENTOS M?DICOS PARA :  INTER_1, DEL 22/06/24 AL 29/11/24
=====================================================================================
TRATAMIENTO: 1  Juan Gonz?lez Mart?nez Acidez estomacal    Duraci?n: 09/05/24-16/07/24
--------------------------------------------------------------------------------------
                Dolocatil      500 mg         Un comprimido si dolor extremo     
                Nexium         40 mg          Un comprimido/6 horas con alimentos
--------------------------------------------------------------------------------------
TRATAMIENTO: 2  Juan Gonz?lez Mart?nez Dolor de espalda    Duraci?n: 09/05/24-16/07/24
--------------------------------------------------------------------------------------
                Advil          200 mg         Un comprimido/8 horas con agua     
                Voltaren       50 mg          Un comprimido/6 horas con alimentos
                */
CREATE OR REPLACE PROCEDURE TRATA(VVV VIAJES.COD_VIA%TYPE) AS
--CABECERA
    VARIABLE_CABECERA VIAJES%ROWTYPE;
    VARIABLE_TOTAL NUMBER(8) := 0;
    
    CURSOR C1 (VVV VIAJES.COD_VIA%TYPE) IS
    SELECT TRA.ID_TRA , TURI.NOMBRE , TURI.APELLIDO1 ,TURI.APELLIDO2 , TRA.FECHA_INICIO ,TRA.FECHA_FIN
    FROM TRATAMIENTOS TRA JOIN TURISTAS TURI ON TURI.DNI_TUT = TRA.DNI_TUT
    JOIN RESERVAS RE ON RE.DNI_TUT = TURI.DNI_TUT
    WHERE RE.COD_VIA = VVV;
    VARIABLE_SEGUNDA_COSA C1%ROWTYPE;
    
    CURSOR C2 (TRA_IDD TRATAMIENTOS.ID_TRA%TYPE) IS 
    SELECT MPT.ID_TRA ,MPT.PAUTA , M.DOSIS ,M.NOMBRE
    FROM MEDICINAS M JOIN MEDICINAS_POR_TRATAMIENTO MPT ON MPT.ID_MED = M.ID_MED
    WHERE MPT.ID_TRA = TRA_IDD;
    VARIABLE_TERCERA_COSA C2%ROWTYPE;
    
BEGIN
    -- CABECERA 
    SELECT *    INTO VARIABLE_CABECERA    FROM VIAJES    WHERE COD_VIA = VVV;
                
       
  
    DBMS_OUTPUT.PUT_LINE('TURISTAS CON TRATAMIENTOS MEDICOS PARA: ' || VARIABLE_CABECERA.COD_VIA || ', DEL ' || VARIABLE_CABECERA.FECHA_INI || ' AL ' || VARIABLE_CABECERA.FECHA_FIN);
        DBMS_OUTPUT.PUT_LINE('===========================================================');

     OPEN C1(VARIABLE_CABECERA.COD_VIA );
            LOOP
             FETCH C1 INTO VARIABLE_SEGUNDA_COSA;
            EXIT WHEN C1%NOTFOUND;    
     DBMS_OUTPUT.PUT_LINE('TRATAMIENTO: ' ||VARIABLE_SEGUNDA_COSA.ID_TRA  || '  ' ||   VARIABLE_SEGUNDA_COSA.NOMBRE || VARIABLE_SEGUNDA_COSA.APELLIDO1  || VARIABLE_SEGUNDA_COSA.APELLIDO2  ||'    '||'DURACION : '|| VARIABLE_SEGUNDA_COSA.FECHA_INICIO ||'-'||VARIABLE_SEGUNDA_COSA.FECHA_FIN );
             DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------');
              VARIABLE_TOTAL := VARIABLE_TOTAL +1;
             OPEN C2(VARIABLE_SEGUNDA_COSA.ID_TRA );
            LOOP
             FETCH C2 INTO VARIABLE_TERCERA_COSA;
            EXIT WHEN C2%NOTFOUND;
              DBMS_OUTPUT.PUT_LINE('          ' ||     VARIABLE_TERCERA_COSA.NOMBRE || '  '|| VARIABLE_TERCERA_COSA.DOSIS  || '  '|| VARIABLE_TERCERA_COSA.PAUTA  );
               DBMS_OUTPUT.PUT_LINE('          ' );
   END LOOP;    
CLOSE C2;
END LOOP;    
CLOSE C1;
               DBMS_OUTPUT.PUT_LINE('     TOTAL :      ' || VARIABLE_TOTAL);
END TRATA;

-- Ejecuta el procedimiento para probarlo
EXEC TRATA('INTER_1'); 

           
                
-----------------------------------------------------------------------------------------------------------              

--EJERCICIO 3
/* Realizar un trigger que impida realizar la inserci?n de nuevas reservas cuando
no haya camarotes libres en la nave en la que se realizar? el viaje. Tened en cuenta que el n?mero de camarotes que ocupa la tripulaci?n para 
cualquiera de las naves es 8.  La ocupaci?n debeis obtenerla a trav?s de una  consulta a la tabla de NAVES (no podeis mirarla en la tabla directamente).
Implementad el trigger solo para la INSERCI?N y realizad las pruebas con los siguientes datos: */
CREATE OR REPLACE TRIGGER IMPEDIR 
BEFORE INSERT ON RESERVAS 
FOR EACH ROW 
DECLARE
    CONT NUMBER := 0;
    LOL NUMBER := 0;
BEGIN 
    -- Contar reservas actuales para el viaje especificado
    SELECT COUNT(*) INTO CONT 
    FROM RESERVAS 
    WHERE :NEW.COD_VIA = COD_VIA;
   -- Obtener el número de camarotes para el viaje especificado
    SELECT CAMAROTES INTO LOL 
    FROM NAVES 
    WHERE ID_NAVE IN        (SELECT ID_NAVE          FROM VIAJES          WHERE COD_VIA = :NEW.COD_VIA);
    -- Verificar si el límite de reservas ha sido alcanzado
    IF (LOL - 8) <= CONT THEN 
        RAISE_APPLICATION_ERROR(-20011, 'NO HAY CAMAROTES');
    END IF;
END;

CREATE OR REPLACE TRIGGER IMP 
BEFORE INSERT ON RESERVAS 
FOR EACH ROW 
DECLARE 
    CONT NUMBER := 0;

HAY NUMBER(8):=0;
BEGIN 
    SELECT COUNT(*) INTO CONT 
    FROM RESERVAS 
    WHERE :NEW.COD_VIA = COD_VIA;
SELECT N.CAMAROTES INTO HAY FROM NAVES N
LEFT JOIN VIAJES V ON N.ID_NAVE = V.ID_NAVE 
WHERE V.COD_VIA = :NEW.COD_VIA;
IF (HAY -8) <= CONT THEN 
      RAISE_APPLICATION_ERROR(-20011, 'NO HAY CAMAROTES');
      END IF ;
END ;

-- No se puede insertar, ocupaci?n m?xima. 
INSERT INTO Reservas VALUES ('INTER_1', '212121212L', '12345678A', 30000.00, SYSDATE);
-- Inserci?n sin problemas
INSERT INTO Reservas VALUES ('INTER_3', '212121212L', '12345678A', 30000.00, SYSDATE);







--EJERCICIO 1 
/* Implementar el proceso de inserci?n de nuevos tratamientos en la tabla de:
TRATAMIENTOS (ID_TRA, DNI_TUT, ID_ENF, FECHA_INICIO, FECHA_FIN, OBSERVACIONES). 
SE PIDE:
	Implementar el siguiente procedimiento almacenado:
		  PROCEDURE INSERTA_TRATAMIENTO (DNI, ENF,F_FIN,OBSERVACIONES) 
?	El ID_TRA se calcular? siendo el m?ximo en la tabla m?s uno. 
?	El DNI_TUT debe ser un DNI v?lido de un TURISTA que tenga realizada una reserva,
hay que tener en cuenta que los tratamientos de los turistas que no reservan no nos interesan. 
?	El ID_ENF debe ser un ID_ENF v?lido teniendo en cuenta que no se puede a?adir un tratamiento para una misma enfermedad y un mimo cliente. 
?	La FECHA_INICIO ser? SYSDATE. 
?	Se comprobar? con la FECHA_FIN que el tratamiento debe administrarse durante las fechas del viaje que tiene reservado, de lo contrario no nos interesa almacenar el tratamiento.  
?	En OBSERVACIONES pondremos ?A ESPECIFICAR?. 
      
Se comprobar?n estas condiciones de error dando toda la informaci?n al usuario 
posible y finalmente, se insertar?n los valores especificados informando de la
inserci?n exitosa. 

*/

CREATE OR REPLACE PROCEDURE INSER(DNI_ TURISTAS.DNI_TUT%TYPE , ENF_ ENFERMEDADES.ID_ENF%TYPE , FECHA_F VIAJES.FECHA_FIN%TYPE ,  OB  TRATAMIENTOS.OBSERVACIONES%TYPE ) AS
EXISTE NUMBER(7):=0;
EXISTE_ENF NUMBER(7):=0;
EXISTE_FECHA NUMBER(7):=0;

BEGIN
SELECT COUNT(*) INTO EXISTE_FECHA FROM VIAJES WHERE FECHA_F BETWEEN FECHA_INI AND FECHA_FIN AND COD_VIA IN (SELECT COD_VIA FROM RESERVAS WHERE DNI_TUT = DNI_);
SELECT COUNT(*) INTO EXISTE_ENF FROM ENFERMEDADES  WHERE ID_ENF  = ENF_ AND ENF_ NOT IN (SELECT ID_ENF FROM TRATAMIENTOS WHERE DNI_TUT = DNI_);
SELECT COUNT(*) INTO EXISTE FROM TURISTAS WHERE DNI_TUT = DNI_;
IF EXISTE = 1 THEN 
 DBMS_OUTPUT.PUT_LINE('   DNI EXISTE        ' );
IF EXISTE_ENF = 1 THEN 
             DBMS_OUTPUT.PUT_LINE('   ENF VALIDO      ' );  

IF EXISTE_FECHA = 1 THEN 
    DBMS_OUTPUT.PUT_LINE('   FECHA_CORRECTA      ' ); 
        DBMS_OUTPUT.PUT_LINE('   INSERCCION HECHA      ' );  

INSERT INTO TRATAMIENTOS VALUES((SELECT MAX(ID_TRA)+1 FROM TRATAMIENTOS),DNI_, ENF_ , SYSDATE ,FECHA_F , OB );
ELSE
        DBMS_OUTPUT.PUT_LINE('   FECHA_INCORRECTA      ' );  

END IF;

ELSE
             DBMS_OUTPUT.PUT_LINE('   ENF NO VALIDO       ' );  

END IF ;
ELSE 
 DBMS_OUTPUT.PUT_LINE('   DNI NO EXISTE        ' );

END IF ;

END INSER;

BEGIN
    INSER('44444444D', 7, TO_DATE('2025-03-01', 'YYYY-MM-DD'), 'A ESPECIFICAR');
END;


--SET SERVEROUTPUT ON
--SET VERIFY OFF

/* FUNCTION TIPO_CORRECTO (T MEDICINAS.TIPO%TYPE) RETURN BOOLEAN
Dado un tipo de medicamento, devolver? TRUE si est? entre los correctos y 
false en caso contrario.  */
--MIO 
CREATE OR REPLACE FUNCTION MED(LOL MEDICINAS.TIPO%TYPE) RETURN VARCHAR2 IS
    EXISTE NUMBER(7) := 0;
BEGIN
    SELECT COUNT(*) INTO EXISTE FROM MEDICINAS WHERE TIPO = LOL;
    IF EXISTE > 0 THEN
        RETURN 'TRUE';
    ELSE
        RETURN 'FALSE';
    END IF;
END;

SELECT MED('hipotensores') AS resultado FROM dual;



CREATE OR REPLACE FUNCTION TIPO_CORRECTO (T MEDICINAS.TIPO%TYPE) RETURN BOOLEAN IS


BEGIN 
    IF T IN ('analgesicos', 'antiestaminicos', 'descongestionantes','antiinflamatorios','hipotensores','antibioticos','ansioliticos','antiulceroso',
            'diureticos','antitusivos','expectorantes','antihipertensivos') THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;

/* FUNCTION EXISTE_MEDICAMENTO (NOM MEDICINAS.TIPO%TYPE, 
                                DO MEDICINAS.DOSIS%TYPE) RETURN BOOLEAN
Dado un nombre de medicamento y una dosis, devolver? TRUE si est? ya dado de 
alta en la tabla de MEDICINAS, y false en caso contrario. */
--MIO 

CREATE OR REPLACE FUNCTION EXISTE_MEDICAMENTO (NOM MEDICINAS.TIPO%TYPE, 
                                               DO MEDICINAS.DOSIS%TYPE) RETURN BOOLEAN IS
    CONT NUMBER:=0;
BEGIN
    SELECT COUNT(*) INTO CONT 
    FROM MEDICINAS WHERE NOMBRE LIKE NOM AND DOSIS LIKE DO;
    RETURN CONT>0;
END;



/* FUNCTION UNIDAD_ CORRECTA (DO MEDICINAS.DOSIS%TYPE) RETURN BOOLEAN
Dada la dosis a insertar, devolver? TRUE si la unidad de medida es 
?mg? y false en caso contrario.*/
CREATE OR REPLACE FUNCTION UNIDAD_CORRECTA (DO MEDICINAS.DOSIS%TYPE) 
                                                  RETURN BOOLEAN IS
BEGIN
    IF DO LIKE '% mg' THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END;

/* FUNCTION DOSIS_CORRECTA (DO MEDICINAS.DOSIS%TYPE) RETURN BOOLEAN
 Dada la dosis a insertar, devolver? TRUE si la dosis est? entre 1 y 600
 y false en caso contrario */

CREATE OR REPLACE FUNCTION DOSIS_CORRECTA(DO MEDICINAS.DOSIS%TYPE) RETURN BOOLEAN IS
BEGIN
    IF TO_NUMBER(SUBSTR(DO,1,INSTR(DO,' ',1)-1),'999') NOT BETWEEN 0 AND 600 THEN
        RETURN FALSE;
    END IF;
    RETURN TRUE;
END;

-- Para controlar mejor la inserci?n, necesitamos una funci?n peque?a que nos diga si 
-- existe la medicina en otras dosis. Si es as?, necesitar?amos recuperar el 
-- laboratorio, el compuesto y el tipo. 
--FUNCI?N PARA COMPROBAR SI LA MEICINA YA EXISTE CON OTRA DOSIS
CREATE OR REPLACE FUNCTION EXISTE_MEDICAMENTO_OTRAS_DOSIS(NOM MEDICINAS.NOMBRE%TYPE, 
                                                          DO MEDICINAS.DOSIS%TYPE, 
                                                          LA IN OUT MEDICINAS.LABORATORIO%TYPE, 
                                                          CO IN OUT MEDICINAS.COMPUESTO%TYPE,
                                                          T IN OUT MEDICINAS.TIPO%TYPE) RETURN BOOLEAN IS
    CONT NUMBER:=0;
BEGIN
    SELECT COUNT(*) INTO CONT FROM MEDICINAS 
    WHERE NOMBRE LIKE NOM AND DO NOT LIKE DOSIS;
    IF CONT>0 THEN 
        SELECT LABORATORIO, COMPUESTO, TIPO INTO LA, CO, T 
        FROM MEDICINAS
        WHERE ID_MED = (SELECT MAX(ID_MED) FROM MEDICINAS WHERE NOMBRE=NOM);
        RETURN TRUE;
    END IF; 
    RETURN FALSE;
END;


/*      PROCEDURE INSERTA_MEDICINA (NOM, DO, LA, CO, T) 
Recibe por par?metro todos los campos del nuevo comprimido menos el id que deb?is 
calcularlo en funci?n del contenido de la tabla.  
?	Nombre medicamento.
?	Dosis del comprimido, cadena cuya estructura es: n?mero entre 1 y 600,
    espacio en blanco y la palabra ?mg?. Ejemplos: 600 mg, 500mg, 250 mg, ?
?	Laboratorio. 
?	Compuesto principal.
?	Tipo de medicamento (debe estar entre los declarados en el script de la tabla) 
*/

CREATE OR REPLACE PROCEDURE INSERTA_MEDICINA(NOM MEDICINAS.NOMBRE%TYPE, 
                                             DO MEDICINAS.DOSIS%TYPE,
                                             LA MEDICINAS.LABORATORIO%TYPE, 
                                             CO MEDICINAS.COMPUESTO%TYPE,
                                             T MEDICINAS.TIPO%TYPE) IS
    INSERTA BOOLEAN:=TRUE;
    LAUX MEDICINAS.LABORATORIO%TYPE:=' ';
    COAUX MEDICINAS.COMPUESTO%TYPE:=' ';
    TAUX MEDICINAS.TIPO%TYPE:=' ';
BEGIN
    -- Que exista el medicamento
    IF EXISTE_MEDICAMENTO(NOM, DO) THEN
        DBMS_OUTPUT.PUT_LINE(NOM||' '||DO||' ya est? dado de alta');
        INSERTA:=FALSE;
    ELSE 
        IF EXISTE_MEDICAMENTO_OTRAS_DOSIS(NOM,DO,LAUX, COAUX, TAUX) THEN
            DBMS_OUTPUT.PUT_LINE('La medicina existe con otra dosis');
            IF LAUX NOT LIKE LA THEN
                DBMS_OUTPUT.PUT_LINE(NOM || ' es fabricado por el laboratorio '||LAUX);
                INSERTA:=FALSE;
            END IF;
            IF COAUX NOT LIKE CO THEN
                DBMS_OUTPUT.PUT_LINE('El componente principal del '||NOM||' es el '||COAUX);
                INSERTA:=FALSE;
            END IF;
            IF TAUX NOT LIKE T THEN
                DBMS_OUTPUT.PUT_LINE(NOM|| ' est? dado de alta en los medicamentos del tipo '||TAUX);
                INSERTA:=FALSE;
            END IF;
        ELSE
            IF NOT TIPO_CORRECTO(T) THEN
                DBMS_OUTPUT.PUT_LINE(T||' No es un grupo de medicamentos correcto!');
                INSERTA:=FALSE;
            END IF;
            IF NOT UNIDAD_CORRECTA (DO) THEN
              DBMS_OUTPUT.PUT_LINE('La unidad debe ser mg');
             INSERTA:=FALSE;
            END IF;
            IF NOT DOSIS_CORRECTA(DO) THEN
             DBMS_OUTPUT.PUT_LINE('La dosis debe estar entre 1 y 600');
             INSERTA:=FALSE;
            END IF;
        END IF;
    END IF;
    IF INSERTA THEN
        INSERT INTO MEDICINAS VALUES((SELECT MAX(ID_MED) FROM MEDICINAS)+1,
                                       NOM,DO,LA,CO,T);
        DBMS_OUTPUT.PUT_LINE('Se ha insertado '||NOM||' '||DO);
    ELSE
        DBMS_OUTPUT.PUT_LINE('No se puede insertar la medicina');
    END IF;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR INDETERMINADO DE LA BD');
END;

-- INSERCI?N SIN PROBLEMA, MEDICINA QUE NO EXISTE. 
EXEC INSERTA_MEDICINA('Med1','1 mg','Lab1','C1','diureticos');
-- INSERCI?N MISMA MEDICINA
EXEC INSERTA_MEDICINA('Med1','1 mg','Lab1','C1','diureticos');
-- INSERCI?N MISMA MEDICINA OTRA DOSIS
EXEC INSERTA_MEDICINA('Med1','2 mg','Lab1','C1','diureticos');
--INSERCI?N MISMA MEDICINA OTRA DOSIS Y VALORES INCORRECTOS
EXEC INSERTA_MEDICINA('Med1','3 mg','Lab2','C2','analgesicos');
--MEDICINA QUE NO EXISTE, CON VALORES INCORRECTOS.
EXEC INSERTA_MEDICINA('Med3','999 LG','Lab3','C2','varios');


/* EJERCICIO 2: Crear un procedimiento almacenado que muestre todos los 
turistas y sus tratamientos m?dicos.  Los datos que hay que mostrar son 
los que se indican a continuaci?n.  

LISTADO DE TURISTAS CON TRATAMIENTOS M?DICOS
********************************************
TURISTA: 11111111J - Jean Leroy Dubois
==============================================================================================
Comprimido           Dosis     Enfermedad                  Gravedad            INTERVALO
----------------------------------------------------------------------------------------------
Claritine            10 mg     Alergia estacional             1            09/05/24-16/11/24
----------------------------------------------------------------------------------------------
SUPERVISI?N: 1 Medicamentos en total
----------------------------------------------------------------------------------------------
TURISTA: 12345678A - Juan Gonz?lez Mart?nez
==============================================================================================
Comprimido           Dosis     Enfermedad                  Gravedad            INTERVALO
----------------------------------------------------------------------------------------------
Dolocatil            500 mg    Acidez estomacal               1            09/05/24-16/07/24
Nexium               40 mg     Acidez estomacal               1            09/05/24-16/07/24
Advil                200 mg    Dolor de espalda               2            09/05/24-16/07/24
Voltaren             50 mg     Dolor de espalda               2            09/05/24-16/07/24
----------------------------------------------------------------------------------------------
SUPERVISI?N: 4 Medicamentos en total
----------------------------------------------------------------------------------------------
*/

CREATE OR REPLACE PROCEDURE LISTADO_TURISTAS_TTOS IS
    -- El cursor C1 carga los turistas con reservas y tratamientos.  
    CURSOR C1 IS SELECT * 
    FROM TURISTAS 
    WHERE DNI_TUT IN (SELECT DNI_TUT FROM TRATAMIENTOS) AND 
          DNI_TUT IN (SELECT DNI_TUT FROM RESERVAS)
    ORDER BY NOMBRE, APELLIDO1, APELLIDO2;
    -- Registro para tratar elementos de C1
    REG_C1 C1%ROWTYPE;
    -- Los datos que debemos mostrar se extraen de: Nombre y dosis (MEDICINAS), Nombre
    -- com?n y gravedad (Enfermedad), fecha incio y fin (TRATAMIENTOS).
    CURSOR C2(DNI TURISTAS.DNI_TUT%TYPE) 
           IS SELECT NOMBRE, DOSIS, NOMBRE_COMUN, GRAVEDAD, FECHA_INICIO, FECHA_FIN 
    FROM TRATAMIENTOS JOIN MEDICINAS_POR_TRATAMIENTO 
    USING(ID_TRA) JOIN MEDICINAS 
    USING (ID_MED) JOIN ENFERMEDADES 
    USING (ID_ENF)
    WHERE DNI_TUT LIKE DNI;
     -- Registro para tratar elementos de C2    
    REG_C2 C2%ROWTYPE;
    CONT NUMBER:=0;
    TOTAL NUMBER:=0;
BEGIN
    DBMS_OUTPUT.PUT_LINE('LISTADO DE TURISTAS CON TRATAMIENTOS M?DICOS');
    DBMS_OUTPUT.PUT_LINE('********************************************');
    OPEN C1;  -- Abrir cursor Turistas
    LOOP
        FETCH C1 INTO REG_C1;
        EXIT WHEN C1%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('TURISTA: '||REG_C1.DNI_TUT||' - '||REG_C1.NOMBRE||' '||REG_C1.APELLIDO1||' '||REG_C1.APELLIDO2);
        DBMS_OUTPUT.PUT_LINE('==============================================================================================');
        DBMS_OUTPUT.PUT_LINE('Comprimido           Dosis     Enfermedad                  Gravedad            INTERVALO');
        DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------------');
        OPEN C2(REG_C1.DNI_TUT);
        CONT:=0;  -- se podr?a comprobar que el turista tiene medicinas asociadas a sus tratamientos. 
        LOOP
            FETCH C2 INTO REG_C2;
            EXIT WHEN C2%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE(RPAD(REG_C2.NOMBRE,21)||
                                 RPAD(REG_C2.DOSIS,10)||
                                 RPAD(REG_C2.NOMBRE_COMUN,31)||
                                 RPAD(REG_C2.GRAVEDAD,13)||
                                 REG_C2.FECHA_INICIO||'-'||REG_C2.FECHA_FIN);
            CONT:=CONT+1;
        END LOOP;
        CLOSE C2;
        DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------------');
        DBMS_OUTPUT.PUT_LINE('SUPERVISI?N: '||CONT||' Medicamentos en total');
        DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------------');
    END LOOP;
    CLOSE C1;
    DBMS_OUTPUT.PUT_LINE('==============================================================================================');
    -- Obtener el total de tratamientos a trav?s de una SELECT. 
    SELECT COUNT(*) INTO TOTAL 
    FROM TRATAMIENTOS 
    WHERE DNI_TUT IN (SELECT DNI_TUT FROM RESERVAS);
    DBMS_OUTPUT.PUT_LINE('Total Tratamientos: '||TOTAL);
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR INDETERMINADO EN LA BASE DE DATOS');
END;

-- PRUEBA DEL LISTADO
EXEC LISTADO_TURISTAS_TTOS;



--MIO 

CREATE OR REPLACE PROCEDURE TURISTA_COSAS  AS
CURSOR C1 IS SELECT * FROM TURISTAS ;
VARIABLE_TURISTAS C1%ROWTYPE;

CURSOR C2 (VARIABLE_TU TURISTAS.DNI_TUT%TYPE) IS 
SELECT MED.NOMBRE , MED.DOSIS , ENFER.NOMBRE_COMUN ,ENFER.GRAVEDAD , TRAT.FECHA_INICIO , TRAT.FECHA_FIN
FROM TRATAMIENTOS TRAT JOIN ENFERMEDADES ENFER ON ENFER.ID_ENF = TRAT.ID_ENF 
JOIN MEDICINAS_POR_TRATAMIENTO MPT ON MPT.ID_TRA = TRAT.ID_TRA 
JOIN MEDICINAS MED ON MED.ID_MED = MPT.ID_MED
WHERE TRAT.DNI_TUT = VARIABLE_TU;
VARIABLE_C2 C2%ROWTYPE;
VARIABLE_TRA NUMBER(7):=0;
    TREATMENT_EXISTS BOOLEAN := FALSE;

BEGIN
 OPEN C1;
    LOOP
        FETCH C1 INTO VARIABLE_TURISTAS;
        EXIT WHEN C1%NOTFOUND;

        -- Check if the tourist has at least one treatment
        OPEN C2(VARIABLE_TURISTAS.DNI_TUT);
        FETCH C2 INTO VARIABLE_C2;
        IF C2%FOUND THEN
            TREATMENT_EXISTS := TRUE;
        ELSE
            TREATMENT_EXISTS := FALSE;
        END IF;
        CLOSE C2;
  IF TREATMENT_EXISTS THEN
            DBMS_OUTPUT.PUT_LINE('   ');
DBMS_OUTPUT.PUT_LINE('   ');
DBMS_OUTPUT.PUT_LINE('TURISTA : '||VARIABLE_TURISTAS.DNI_TUT ||' - '||VARIABLE_TURISTAS.NOMBRE||'   '||VARIABLE_TURISTAS.APELLIDO1||'  '||VARIABLE_TURISTAS.APELLIDO2);
DBMS_OUTPUT.PUT_LINE('==============================================================================================');
DBMS_OUTPUT.PUT_LINE('Comprimido           Dosis        Enfermedad                   Gravedad             INTERVALO      ');
DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------------');

     OPEN C2(VARIABLE_TURISTAS.DNI_TUT);
     VARIABLE_TRA := 0;
        LOOP
            FETCH C2 INTO VARIABLE_C2;
            EXIT WHEN C2%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(VARIABLE_C2.NOMBRE ||'                  '||VARIABLE_C2.DOSIS||'          '||VARIABLE_C2.NOMBRE_COMUN ||'         '||VARIABLE_C2.GRAVEDAD||'      '||VARIABLE_C2.FECHA_INICIO ||'-'||VARIABLE_C2.FECHA_FIN );
DBMS_OUTPUT.PUT_LINE('----------------------------------------------------------------------------------------------');
VARIABLE_TRA := VARIABLE_TRA +1;
   END LOOP;
               DBMS_OUTPUT.PUT_LINE('TOTAL DE TRATAMIENTOS '|| VARIABLE_TRA);
            CLOSE C2;
                 END IF;

             END LOOP;
            CLOSE C1;
END TURISTA_COSAS;

EXEC TURISTA_COSAS;



/* Realizar un trigger para controlar las operaciones de inserci?n, la modificaci?n y 
el borrado en la tabla de astronautas. 
?	Si se realiza una operaci?n de inserci?n se grabar? en AUDITA_ASTRONAUTAS la 
siguiente cadena: ? [dd/mm/yyyy hh:mm] ? INSERCI?N: DNI_AST, Nombre y Apellidos ?
?	Si se realiza una operaci?n de modificaci?n sobre los campos nombre 
? ape1 o ape2 o nacionalidad se grabar? en AUDITA_ASTRONAUTAS la siguiente cadena:
     ?[dd/mm-/yyyy hh:mm] - MODIFICACI?N: DNI_AST + campos modificados?
?	Si se realiza una operaci?n de borrado se grabar? en AUDITA_ASTRONAUTAS 
la siguiente cadena: ?[dd/mm-/yyyy hh:mm] - BORRADO: DNI_AST, Nombre y Apellidos ?
La tabla AUDITA_ASTRONAUTA, no existe, debes crearla con un campo que tenga suficiente
tama?o, para almacenar los datos que se piden. 
Plantea una bater?a de pruebas de cada una de las acciones y especifica el resultado
de la prueba. 
?Podr?as modificar el trigger para impedir la modificaci?n del DNI_AST o el cargo? 
*/
-- Primero, creamos la tabla. 
DROP TABLE AUDITA_ASTRONAUTAS CASCADE CONSTRAINTS;

CREATE TABLE AUDITA_ASTRONAUTAS 
      (MENSAJE VARCHAR2(400)); --CREACI?N DE LA TABLA
--MIO 

CREATE OR REPLACE TRIGGER ESCRIBIR 
BEFORE  INSERT OR UPDATE OR DELETE ON ASTRONAUTAS
FOR EACH ROW
DECLARE
  MENSAJE VArchar2(400):='';
BEGIN
   MENSAJE:='['||TO_CHAR(SYSDATE,'dd/mm/yyyy HH24:mi')||'] - ';
  IF INSERTING THEN
   MENSAJE := MENSAJE ||'OPERACION = INSERCION '|| 'DNI : '|| :NEW.DNI_AST || 'NOMBRE : '|| :NEW.NOMBRE || 'APELLIDOS : '|| :NEW.APE1 ||' '|| :NEW.APE2 || ' NUEVA NACINALDAD : '|| :NEW.NACIONALIDAD || 'CARGO : '|| :NEW.CARGO ;
  

    ELSIF DELETING  THEN
   MENSAJE := MENSAJE ||'OPERACION = ELIMINACION '||  'DNI : '|| :OLD.DNI_AST || 'NOMBRE : '|| :OLD.NOMBRE || 'APELLIDOS : '|| :OLD.APE1 ||' '|| :OLD.APE2 || '  NUEVA NACINALDAD : '|| :OLD.NACIONALIDAD || ' CARGO : '|| :OLD.CARGO ;
  

    ELSIF UPDATING  THEN
   MENSAJE := MENSAJE ||'OPERACION = ACTUALIZACION  '|| 'DNI NUEVO  : '|| :NEW.DNI_AST || 'NOMBRE NUEVO : '|| :NEW.NOMBRE || 'APELLIDOS NUEVOS  : '|| :NEW.APE1 ||' '|| :NEW.APE2 || ' NUEVA NACINALDAD NUEVA : '|| :NEW.NACIONALIDAD || 'CARGO NUEVO  : '|| :NEW.CARGO ||
    'DNI ANTIGUO   : '|| :OLD.DNI_AST || 'NOMBRE ANTIGUO  : '|| :OLD.NOMBRE || 'APELLIDOS ANTIGUO   : '|| :OLD.APE1 ||' '|| :OLD.APE2 || ' NUEVA NACINALDAD ANTIGUA  : '|| :OLD.NACIONALIDAD || 'CARGO ANTIGUO   : '|| :OLD.CARGO ;
  
  END IF;
  
    INSERT INTO AUDITA_ASTRONAUTAS VALUES(MENSAJE);
    EXCEPTION
        WHEN OTHERS THEN
             DBMS_OUTPUT.PUT_LINE('ERROR INESPERADO EN LA BD');
            

END;










-- Trigger sin impedir la modificaci?n
CREATE OR REPLACE TRIGGER AUDITA_ASTRONAUTAS BEFORE INSERT OR UPDATE OR DELETE 
                                                    ON ASTRONAUTAS FOR EACH ROW
DECLARE
    MENSAJE VARCHAR2(400);
BEGIN
    MENSAJE:='['||TO_CHAR(SYSDATE,'dd/mm/yyyy HH24:mi')||'] - ';
    IF INSERTING THEN
        MENSAJE:=MENSAJE||'INSERCI?N: DNI: '||:NEW.DNI_AST||' NOMBRE COMPLETO: '||:NEW.NOMBRE||' '||:NEW.APE1||' '||:NEW.APE2;
    END IF;
    IF DELETING THEN
        MENSAJE:=MENSAJE||'BORRADO: DNI: '||:OLD.DNI_AST||' NOMBRE COMPLETO: '||:OLD.NOMBRE||' '||:OLD.APE1||' '||:OLD.APE2;
    END IF;
    IF UPDATING THEN
        MENSAJE:=MENSAJE||'MODIFICACI?N: DNI: '||:OLD.DNI_AST;
        IF UPDATING ('NOMBRE') THEN
            MENSAJE:=MENSAJE||' NOMBRE ANTIGUO: '||:OLD.NOMBRE||' NOMBRE NUEVO: '||:NEW.NOMBRE;
        END IF;
        IF UPDATING ('APE1') THEN
            MENSAJE:=MENSAJE||' APE1 ANTIGUO: '||:OLD.APE1||' APE1 NUEVO: '||:NEW.APE1;
        END IF;
        IF UPDATING ('APE2') THEN
            MENSAJE:=MENSAJE||' APE2 ANTIGUO: '||:OLD.APE2||' APE2 NUEVO: '||:NEW.APE2;
        END IF;
        IF UPDATING ('NACIONALIDAD') THEN
            MENSAJE:=MENSAJE||' NACIONALIDAD ANTIGUA: '||:OLD.NACIONALIDAD||' NACIONALIDAD NUEVA: '||:NEW.NACIONALIDAD;
        END IF;
    END IF;
     
    
    INSERT INTO AUDITA_ASTRONAUTAS VALUES(MENSAJE);
    EXCEPTION
        WHEN OTHERS THEN
             DBMS_OUTPUT.PUT_LINE('ERROR INESPERADO EN LA BD');
            
END;

-- PRUEBAS
--INSERTAMOS UN ASTRONAUTA
INSERT INTO ASTRONAUTAS VALUES('12121212Z','Nicolas','Sanchez','De Sanz','Espa?ol','tripulante');
-- MODIFICAMOS EL APE1
UPDATE ASTRONAUTAS SET APE1='Nuevo' WHERE DNI_AST LIKE '12121212Z';
-- OTRA MODIFICACI?N PARA DOS CAMPOS
UPDATE ASTRONAUTAS SET APE2='Nuevo', NACIONALIDAD='Italiana' WHERE DNI_AST LIKE '12121212Z';
--BORRAR EL MISMO
DELETE FROM ASTRONAUTAS WHERE DNI_AST LIKE '12121212Z';

-- Trigger impidiendo modificaci?n
CREATE OR REPLACE TRIGGER AUDITA_ASTRONAUTAS BEFORE INSERT OR UPDATE OR DELETE 
                                                    ON ASTRONAUTAS FOR EACH ROW
DECLARE
    MENSAJE VARCHAR2(400);
BEGIN
    MENSAJE:='['||TO_CHAR(SYSDATE,'dd/mm/yyyy HH24:mi')||'] - ';
    IF INSERTING THEN
        MENSAJE:=MENSAJE||'INSERCI?N: DNI: '||:NEW.DNI_AST||' NOMBRE COMPLETO: '||:NEW.NOMBRE||' '||:NEW.APE1||' '||:NEW.APE2;
    END IF;
    IF DELETING THEN
        MENSAJE:=MENSAJE||'BORRADO: DNI: '||:OLD.DNI_AST||' NOMBRE COMPLETO: '||:OLD.NOMBRE||' '||:OLD.APE1||' '||:OLD.APE2;
    END IF;
    IF UPDATING THEN
        MENSAJE:=MENSAJE||'MODIFICACI?N: DNI: '||:OLD.DNI_AST;
        IF UPDATING ('NOMBRE') THEN
            MENSAJE:=MENSAJE||' NOMBRE ANTIGUO: '||:OLD.NOMBRE||' NOMBRE NUEVO: '||:NEW.NOMBRE;
        END IF;
        IF UPDATING ('APE1') THEN
            MENSAJE:=MENSAJE||' APE1 ANTIGUO: '||:OLD.APE1||' APE1 NUEVO: '||:NEW.APE1;
        END IF;
        IF UPDATING ('APE2') THEN
            MENSAJE:=MENSAJE||' APE2 ANTIGUO: '||:OLD.APE2||' APE2 NUEVO: '||:NEW.APE2;
        END IF;
        IF UPDATING ('NACIONALIDAD') THEN
            MENSAJE:=MENSAJE||' NACIONALIDAD ANTIGUA: '||:OLD.NACIONALIDAD||' NACIONALIDAD NUEVA: '||:NEW.NACIONALIDAD;
        END IF;
        IF UPDATING ('CARGO') THEN
            RAISE_APPLICATION_ERROR(-20001,'NO SE PUEDE MODIFICAR EL CARGO');
        END IF;
        IF UPDATING ('DNI_AST') THEN
           RAISE_APPLICATION_ERROR(-20001,'NO SE PUEDE MODIFICAR EL DNI DEL ASTRONAUTA');
        END IF; 
    END IF;
    -- REALIZAMOS LA INSERCI?N EN AUDITA_ASTRONAUTAS. 
    INSERT INTO AUDITA_ASTRONAUTAS VALUES(MENSAJE);
    
END;

--Insertamos de nuevo el astronauta
INSERT INTO ASTRONAUTAS VALUES('12121212Z','Nicolas','Sanchez','De Sanz','Espa?ol','tripulante');
--Probamos a modificar el cargo, no se modificar? y saltar? el error en consola
UPDATE ASTRONAUTAS SET CARGO='asistente' WHERE DNI_AST LIKE '12121212Z';
--Probamos a modificar el dni, idem. 
UPDATE ASTRONAUTAS SET DNI_AST='12121212H' WHERE DNI_AST LIKE '12121212Z';