CREATE DATABASE EX5;
USE EX5;

CREATE TABLE pieza (
id INT AUTO_INCREMENT,
modelo CHAR(2),
descripcion TEXT,
precio INT,
estanteria CHAR(3) REFERENCES estanteria (codigo) ON DELETE CASCADE ON UPDATE CASCADE,
pieza_hija INT REFERENCES pieza(id) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id, modelo));

CREATE TABLE estanteria (
id CHAR(3),
almacen INT NOT NULL REFERENCES almacen(numero) ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY (id));

CREATE TABLE almacen (
numero INT AUTO_INCREMENT, 
descripcion TEXT, 
direccion VARCHAR(255),
PRIMARY KEY (numero));

INSERT INTO almacen (descripcion) VALUES 
('Amazon'),
('Almacén'),
('Almacén 2'),
('Amazon 2'),
('Almacén 3'),
('Almacén 4'),
('Almacén 5'),
('Almacén 6'),
('Almacén 7'),
('Almacén 8');

INSERT INTO estanteria (id, almacen) VALUES
('abc', 1),
('abd', 1),
('abe', 1),
('abf', 1),
('abg', 1),
('abh', 1),
('abi', 1),
('abj', 1),
('abk', 1),
('abl', 1);

INSERT INTO pieza (modelo, descripcion) VALUES
('pu', 'puerta'),
('ve', 'ventana'),
('ar', 'armario'),
('me', 'mesa');

INSERT INTO pieza (modelo, descripcion, pieza_hija) VALUES
('pi','picaporte',1),
('vi','vidrio',2),
('ma','marco',2),
('ta','tabla',4),
('pa','patas',4),
('la','laterales',3);







