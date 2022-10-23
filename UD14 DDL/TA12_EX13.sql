CREATE DATABASE TA12_EX13;
USE TA12_EX13;

CREATE TABLE cocineros(
DNI varchar(9) UNIQUE PRIMARY KEY,
nombre varchar(80),
apellido varchar(80),
numero_ss INT,
tel_fijo INT,
tel_movil INT,
años_de_servicio INT
);

CREATE TABLE pinches(
DNI varchar(9) UNIQUE PRIMARY KEY,
nombre varchar(80),
apellido varchar(80),
numero_ss INT,
tel_fijo INT,
tel_movil INT,
fecha_nacimiento DATE,
cocinero_jefe varchar(9),
FOREIGN KEY (cocinero_jefe) REFERENCES cocineros(DNI) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE platos(
id_plato INT AUTO_INCREMENT PRIMARY KEY,
nombre varchar(50),
precio float, 
tipo varchar (20)
);

CREATE TABLE almacen(
almacen_id INT AUTO_INCREMENT PRIMARY KEY,
nombre varchar(80),
descripcion TEXT
);

CREATE TABLE estanteria(
id_estanteria INT AUTO_INCREMENT PRIMARY KEY,
letra1 char(1),
letra2 char(1),
almacen_id INT,
tamaño INT,
FOREIGN KEY (almacen_id) REFERENCES almacen(almacen_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ingredientes(
id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
nombre varchar(50),
cantidad int,
id_estanteria INT,
FOREIGN KEY (id_estanteria) REFERENCES estanteria(id_estanteria) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tiene(
id INT AUTO_INCREMENT PRIMARY KEY,
id_plato INT,
id_ingrediente INT,
FOREIGN KEY (id_plato) REFERENCES platos(id_plato) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_ingrediente) REFERENCES ingredientes(id_ingrediente) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE prepara(
id INT AUTO_INCREMENT PRIMARY KEY,
DNI_cocinero varchar(9),
id_plato INT,
FOREIGN KEY (id_plato) REFERENCES platos(id_plato) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (DNI_cocinero) REFERENCES cocineros(DNI) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO cocineros VALUES ( '55444333A', 'pepito', 'grillo', 123456789, 666333444, 666555777, 4);
INSERT INTO pinches VALUES ( '77222333F', 'perico', 'de los palotes', 123456789, 666333444, 666555777, '2000-01-13', '55444333A');
INSERT INTO platos (nombre, precio, tipo) VALUES ('macarrones', 3, 'primero');
INSERT INTO almacen (nombre, descripcion) VALUES ('almacen1', 'gran almacen numero 1');
INSERT INTO estanteria (letra1, letra2, almacen_id, tamaño) VALUES ('A', 'F', 1, 400);
INSERT INTO ingredientes (nombre, cantidad, id_estanteria) VALUES ('zanahoria', 20, 1);
INSERT INTO ingredientes (nombre, cantidad, id_estanteria) VALUES ('cebolla', 12, 1);
INSERT INTO tiene (id_plato, id_ingrediente) VALUES (1,1), (1,2);
INSERT INTO prepara (DNI_cocinero, id_plato) VALUES ('55444333A', 1);

