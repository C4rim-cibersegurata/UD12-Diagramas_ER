CREATE DATABASE EX1;
USE EX1;

CREATE TABLE socio (
codigo INT AUTO_INCREMENT,
DNI VARCHAR (8),
nombre VARCHAR (30),
apellidos VARCHAR(30),
direccion VARCHAR(100),
telefono VARCHAR(15),
PRIMARY KEY (codigo));

CREATE TABLE autor (
id INT AUTO_INCREMENT,
nombre VARCHAR (30),
apellidos VARCHAR(30),
PRIMARY KEY (id));

CREATE TABLE prestamo (
id INT AUTO_INCREMENT,
codigo_socio INT REFERENCES socio(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
isbn VARCHAR(25) REFERENCES libro(isbn) ON DELETE CASCADE ON UPDATE CASCADE,
fecha_inicio DATE,
fecha_tope DATE,
fecha_devolucion DATE,
PRIMARY KEY (id));

CREATE TABLE libro (
isbn VARCHAR(25),
titulo VARCHAR(100),
editorial VARCHAR (40),
edicion SMALLINT,
deteriorado BOOLEAN,
PRIMARY KEY (isbn));

CREATE TABLE escrito_por (
autor INT REFERENCES autor(id) ON DELETE CASCADE ON UPDATE CASCADE,
isbn VARCHAR(25) REFERENCES libro(isbn) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (autor, isbn));

INSERT INTO socio (DNI, nombre, apellidos, direccion, telefono) VALUES
('12345678','Leo','Messi','París','985632125478541'),
('23456789','Fideo','Di Maria','Turin','96325874125478'),
('34567891','Rodrigo','De Paul','Madrid','987564123456851'),
('45678912','Arnold','Schwarzenegger','California','854697584213548'),
('56789123','Rocky','Balboa','Los Angeles','123456789123456'),
('67891234', 'Obi-Wan','Kenobi','Las estrellas','234567895412354'),
('78912345','Donnie','Darko','CA','258741369852147'),
('89123456','Jerry','Seinfield','NY','321654987456321'),
('91234567','George','Costanza','NY','456987852369741'),
('32165485','Cosmo','Kramer','NY','753951456987852');

INSERT INTO autor (nombre, apellidos) VALUES 
('Herman','Hesse'),
('Aldous', 'Huxley'),
('Hermest', 'Hemingway'),
('Ken', 'Follet'),
('Fiódor', 'Dostoyevski'),
('Charles', 'Dickens'),
('George', 'Orwell'),
('Jack', 'Kornfield'),
('Howard', 'Lovecraft'),
('Isaac', 'Asimov');

INSERT INTO libro (isbn, titulo) VALUES
('123456789AA', 'David Copperfield'),
('123456789AB', 'Demian'),
('123456789AC', 'Siddharta'),
('123456789AD', 'Rebelión en la granja'),
('123456789AF', 'Los pilares de la tierra'),
('123456789AG', 'Los hermanos Karamazov'),
('123456789AH', 'Fundación'),
('123456789AI', 'Cuentos'),
('123456789AJ', 'Puertas de la percepción'),
('123456789AK', 'El viejo y el mar');

INSERT INTO escrito_por (isbn, autor) VALUES
('123456789AA', 6),
('123456789AB', 1),
('123456789AC', 1),
('123456789AD', 7),
('123456789AF', 4),
('123456789AG', 5),
('123456789AH', 10),
('123456789AI', 9),
('123456789AJ', 2),
('123456789AK', 3);

INSERT INTO prestamo (codigo_socio, isbn) VALUES
(1,'123456789AA'),
(2,'123456789AB'),
(3,'123456789AC'),
(4,'123456789AD'),
(5,'123456789AF'),
(6,'123456789AG'),
(7,'123456789AH'),
(8,'123456789AI'),
(9,'123456789AJ'),
(10,'123456789AK');

SELECT * FROM prestamo;

