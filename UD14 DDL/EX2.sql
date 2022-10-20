CREATE DATABASE EX2;
USE EX2;

CREATE TABLE empresa (
cif VARCHAR(30),
nombre VARCHAR(100),
telefono VARCHAR(15),
direccion VARCHAR(100),
PRIMARY KEY (cif));

CREATE TABLE alumno (
dni VARCHAR (9),
nombre VARCHAR(100),
telefono VARCHAR(15),
direccion VARCHAR(100),
edad TINYINT,
empresa VARCHAR(30) NULL REFERENCES empresa(cif) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (dni));

CREATE TABLE nota (
alumno VARCHAR(9) REFERENCES alumno(dni) ON DELETE CASCADE ON UPDATE CASCADE,
curso INT REFERENCES curso(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
nota VARCHAR(2),
PRIMARY KEY (alumno, curso));

CREATE TABLE curso (
codigo INT AUTO_INCREMENT,
titulo VARCHAR (200),
fecha_inicio DATE,
fecha_finalizacion DATE,
programa TEXT,
duracion TINYINT,
numero SMALLINT,
profesor VARCHAR(9) NOT NULL REFERENCES profesor(dni) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (codigo));

CREATE TABLE profesor (
dni VARCHAR(9),
apellidos VARCHAR(100),
nombre VARCHAR(100),
telefono VARCHAR(15),
direccion VARCHAR(100),
PRIMARY KEY (dni));

INSERT INTO empresa (cif, nombre) VALUES 
('456123asd','Microsoft'),
('456123gfd','Google'),
('456123trd','Meta'),
('456123aop','T-Systems');

INSERT INTO alumno(dni, nombre) VALUES 
('12345678A', 'Pepe'),
('12345678B', 'Tomas'),
('12345678C', 'Lionel'),
('12345678D', 'Fideo'),
('12345678E', 'Juan'),
('12345678F', 'Maria');

INSERT INTO alumno (dni, nombre, empresa) VALUES
('12345678G', 'Marieta','456123asd'),
('12345678H', 'Josefa', '456123gfd'),
('12345678I', 'Cristina', '456123trd'),
('12345678J', 'Juan', '456123aop');

INSERT INTO profesor (dni, nombre) VALUES 
('1345678K','Diego'),
('1345678L','Roberto'),
('1345678M','Antonieta'),
('1345678N','Maria'),
('1345678U','Olivia'),
('1345678P','Frodo'),
('1345678Q','Timoteo'),
('1345678R','Juan'),
('1345678S','Pepe'),
('1345678T','Petaca');

INSERT INTO curso (titulo, profesor) VALUES
('Programacion Backend','1345678P'),
('Bases de datos','1345678U'),
('Java','1345678U'),
('Desarrollo front-end','1345678P'),
('Baile','1345678K');

INSERT INTO nota (alumno, curso, nota) VALUES
('12345678C',1,'10'),
('12345678C',2,'10'),
('12345678D',1,'7'),
('12345678D',2,'8'),
('12345678J',3,'10'),
('12345678J',4,'9'),
('12345678J',5,'5'),
('12345678H',1,'5'),
('12345678H',2,'6'),
('12345678G',3,'10'),
('12345678G',4,'9');