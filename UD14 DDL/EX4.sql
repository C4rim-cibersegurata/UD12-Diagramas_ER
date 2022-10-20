CREATE DATABASE EX4;
USE EX4;

CREATE TABLE guerra (
nombre VARCHAR(255),
fecha_inicio DATE,
fecha_fin DATE,
PRIMARY KEY (nombre));

CREATE TABLE bando (
nombre VARCHAR(255),
fecha_union DATE,
fecha_desunion DATE,
guerra VARCHAR(255) REFERENCES guerra(nombre) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (nombre));

CREATE TABLE pais (
nombre VARCHAR(255),
fecha_union DATE,
fecha_desunion DATE,
bando VARCHAR(255) REFERENCES bando(nombre) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (nombre));

CREATE TABLE independencia (
pais VARCHAR(255) REFERENCES pais(nombre) ON DELETE CASCADE ON UPDATE CASCADE,
es_independiente BOOLEAN NOT NULL,
fecha_comienzo DATE,
fecha_fin DATE,
PRIMARY KEY (pais));

INSERT INTO guerra(nombre) VALUES 
('1ra Guerra Mundial'),
('2da Guerra Mundial'),
('Guerra de Malvinas'),
('Guerra de los cien años'),
('Guerra de Vietnam'),
('Guerra del Golfo Pérsico'),
('Guerra Independencia Argentina'),
('Guerra Hispano-Estadounidense'),
('Guerra de los Balcanes'),
('Guerra de la triple alianza');

INSERT INTO bando(nombre, guerra) VALUES 
('Triple Entente','1ra Guerra Mundial'),
('Potencias Centrales','1ra Guerra Mundial'),
('Aliados','2da Guerra Mundial'),
('Potencias del eje','2da Guerra Mundial'),
('Vietnam del Norte','Guerra de Vietnam'),
('Vietnam del Sur','Guerra de Vietnam'),
('Triple Alianza','Guerra de la triple alianza'),
('Paraguay','Guerra de la triple alianza'),
('Coalición','Guerra del Golfo Pérsico'),
('Irak','Guerra del Golfo Pérsico');

INSERT INTO pais(nombre, bando) VALUES
('Gran Bretaña','Triple Entente'),
('Francia','Triple Entente'),
('Serbia','Triple Entente'),
('Rusia Imperial','Triple Entente'),
('Italia','Triple Entente'),
('Grecia','Triple Entente'),
('Portugal','Triple Entente'),
('Alemania','Potencias Centrales'),
('Imperio Austro-Hungaro','Potencias Centrales'),
('Imperio Otomano','Potencias Centrales');

INSERT INTO independencia (pais,es_independiente) VALUES 
('Francia', true),
('Serbia', true),
('Italia', true),
('Grecia', true),
('Alemania', true),
('Portugal', true),
('Imperio Austro-Húngaro', false),
('Imperio Otomano', false),
('Rusia Imperioal', false);


