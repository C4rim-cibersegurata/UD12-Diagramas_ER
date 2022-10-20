CREATE DATABASE EX6;
USE EX6;

CREATE TABLE autor (
id INT AUTO_INCREMENT,
nombre VARCHAR(100),
pais VARCHAR(122),
PRIMARY KEY (id));

CREATE TABLE libro (
codigo INT AUTO_INCREMENT, 
nombre VARCHAR(100),
resumen TEXT,
lanzamiento SMALLINT,
danio BOOLEAN NOT NULL, 
descripcion_danio TEXT,
paginas SMALLINT,
PRIMARY KEY (codigo));

CREATE TABLE cd (
codigo INT AUTO_INCREMENT, 
nombre VARCHAR(100),
resumen TEXT,
lanzamiento SMALLINT,
danio BOOLEAN NOT NULL, 
descripcion_danio TEXT,
numero_canciones TINYINT,
PRIMARY KEY (codigo));

CREATE TABLE pelicula (
codigo INT AUTO_INCREMENT, 
nombre VARCHAR(100),
resumen TEXT,
lanzamiento SMALLINT,
danio BOOLEAN NOT NULL, 
descripcion_danio TEXT,
duracion SMALLINT,
PRIMARY KEY (codigo));

CREATE TABLE escrito_por (
libro INT REFERENCES libro(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
autor INT REFERENCES autor(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (libro, autor));

CREATE TABLE compuesto_por (
cd INT REFERENCES cd(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
autor INT REFERENCES autor(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (cd, autor));

CREATE TABLE dirigida_por (
pelicula INT REFERENCES pelicula(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
autor INT REFERENCES autor(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(pelicula, autor));

CREATE TABLE prestamo (
id INT AUTO_INCREMENT,
fecha_inicio DATE,
fecha_fin DATE,
fecha_devolucion DATE,
socio VARCHAR(9) NOT NULL REFERENCES socio (codigo) ON DELETE CASCADE ON UPDATE CASCADE,
libro INT REFERENCES libro (codigo) ON DELETE CASCADE ON UPDATE CASCADE,
cd INT REFERENCES cd (codigo) ON DELETE CASCADE ON UPDATE CASCADE,
pelicula INT REFERENCES pelicula (codigo) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

CREATE TABLE socio (
codigo INT AUTO_INCREMENT, 
dni VARCHAR(9),
nombre VARCHAR(100),
apellidos VARCHAR(100),
direccion VARCHAR(255),
PRIMARY KEY (codigo));

CREATE TABLE telefono (
numero VARCHAR(15),
socio INT REFERENCES socio(codigo) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (numero, socio));

INSERT INTO libro (nombre, danio, descripcion_danio) VALUES
('El lobo estepario', false,''),
('Fundacion', false,''),
('Viaje a Oriente', true, 'Hojas manchadas'),
('Demian', true, 'Hojas escritas'),
('Rebelion en la Granja', false, ''),
('Siddharte', false, ''),
('Cuentos', true, 'Falta una hoja'),
('Los pilares de la tierra', false, ''),
('El señor de los anillos', false, '');

INSERT INTO pelicula (nombre, danio) VALUES
('El señor de los anillos', false),
('Interstellar', false),
('Batman', false),
('Donnie Darko', false),
('Darjeeling', false),
('Inception', false),
('Avatar I', false),
('Avatar II', false),
('Bullet Train', false),
('Stars Wars', false);

INSERT INTO cd (nombre, danio) VALUES
('Racine Carrée', false),
('Honestly, Never Mind', false),
('Grandes Éxitos', false),
('The dark side of the moon', false),
('The wall', false),
('The division bell', false),
('Certified Boy Lover', false),
('More life', false),
('Dark Lane', false),
('Multitude', false);

INSERT INTO autor(nombre) VALUES
('Herman Hesse'), ('Drake'), ('Stromae'), ('Christopher Nolan'), ('Pink Floyd'),
('J.R.R Tolkien'), ('Isaac Asimov'), ('George Orwell'), ('Ken Follet'), ('Soda Estereo');

INSERT INTO escrito_por (libro, autor) VALUES 
(1,1), (2,6), (3,1), (4,1), (5,7), (6,1), (7,1), (8,9), (9,6);

INSERT INTO compuesto_por (cd, autor) VALUES
(1,3), (10,3), (2,2), (7,2), (8,2), (9,2), (5,4), (5,5), (5,6), (3,10); 

INSERT INTO dirigida_por (pelicula, autor) VALUES
(2,4),(3,4),(6,4);

INSERT INTO socio (nombre) VALUES
('Maria'), ('Eugenia'), ('Juan'), ('Pepe'), ('Albert'), ('Joan'), ('Pablo'), ('Jesus'), ('Eli'), ('Fur');

INSERT INTO telefono (socio, numero) VALUES
(1, '312451346'),(2, '652451346'),(3, '33456346'),(4, '2342451346'),(5, '34534551346'),(6, '387671346'),
(7, '323211246'),(8, '52567245'), (9, '3124534536'),(10, '31245345');

INSERT INTO prestamo (socio, libro) VALUES
(1,1), (2,2), (3,3), (4,4), (5,5), (6,6), (7,7),(8,8), (9,9);


