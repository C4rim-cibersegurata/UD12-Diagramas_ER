CREATE DATABASE EX3;
USE EX3;

CREATE TABLE comunidad_autonoma (
nombre VARCHAR (100),
poblacion INT,
superficie INT,
capital INT REFERENCES localidad (id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (nombre));

CREATE TABLE provincia (
comienzo_cp TINYINT,
nombre VARCHAR (100),
poblacion INT,
superficie INT,
comunidad VARCHAR(100) NOT NULL REFERENCES comunidad_autonoma(nombre) ON DELETE CASCADE ON UPDATE CASCADE,
capital INT REFERENCES localidad(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(comienzo_cp));

CREATE TABLE localidad (
id INT AUTO_INCREMENT,
nombre VARCHAR (100),
poblacion INT,
superficie INT,
provincia TINYINT NOT NULL REFERENCES provincia(comienzo_cp) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

INSERT INTO comunidad_autonoma(nombre) VALUES
('Andalucía'),
('Cataluña'),
('Madrid'),
('Extremadura'),
('Galicia'),
('País vasco'),
('Aragon'),
('Asturias'),
('Castilla y León'),
('Castilla-La Mancha'),
('Cantabria');

INSERT INTO provincia(comienzo_cp, nombre, comunidad) VALUES 
(11, 'Granada','Andalucia'),
(12, 'Málaga','Andalucia'),
(13, 'Almería','Andalucia'),
(14, 'Cádiz','Andalucia'),
(15, 'Huelva','Andalucia'),
(16, 'Sevilla','Andalucia'),
(17, 'Córdoba','Andalucia'),
(18, 'Jaén','Andalucia'),
(19, 'Tarragona','Cataluña'),
(20, 'Gerona','Cataluña');

INSERT INTO localidad(nombre, provincia) VALUES
('Soportujar',11),
('Órgiva',11),
('Pampaneira',11),
('Trévelez',11),
('Capileira',11),
('Bubión',11),
('Cañar',11),
('Granada',11),
('Motril',11),
('Velez',11);

UPDATE provincia SET capital=8 WHERE comienzo_cp=11;
