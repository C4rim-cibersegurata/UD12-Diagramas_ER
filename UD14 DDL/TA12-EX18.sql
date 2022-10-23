    DROP DATABASE TA12_EX18;
    CREATE DATABASE TA12_EX18;
	USE TA12_EX18;

	CREATE TABLE trabajadores(
	id_trabajador INT AUTO_INCREMENT PRIMARY KEY,
    DNI varchar(9),
	telefono_fijo INT,
    telefono_personal INT,
	nombre varchar(80),
	apellidos varchar(100)
	);
    CREATE TABLE clientes(
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	DNI varchar(9),
	telefono_fijo INT,
    telefono_personal INT,
	nombre varchar(80),
	apellidos varchar(100)
    );
    
    CREATE TABLE compras(
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    valor FLOAT,
    id_cliente INT,
    id_trabajador INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
    CREATE TABLE alquileres(
    id_alquiler INT AUTO_INCREMENT PRIMARY KEY,
    id_trabajador INT,
    id_cliente INT, 
    FOREIGN KEY (id_trabajador) REFERENCES trabajadores(id_trabajador) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
    CREATE TABLE pagos(
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    valor float,
    año INT,
    mes INT,
    id_alquiler INT,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_alquiler) REFERENCES alquileres(id_alquiler) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
    CREATE TABLE pisos(
    id_piso INT AUTO_INCREMENT PRIMARY KEY,
    metros INT, 
    descripcion TEXT,
    direccion varchar(80),
    id_compra INT,
    id_alquiler INT,
    FOREIGN KEY (id_alquiler) REFERENCES alquileres(id_alquiler) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_compra) REFERENCES compras(id_compra) ON DELETE CASCADE ON UPDATE CASCADE
    );

	CREATE TABLE garajes(
    id_garaje INT AUTO_INCREMENT PRIMARY KEY,
    metros INT, 
    descripcion TEXT,
    direccion varchar(80),
    numero INT,
    planta INT,
    id_piso INT,
    id_compra INT,
    id_alquiler INT,
    FOREIGN KEY (id_alquiler) REFERENCES alquileres(id_alquiler) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_compra) REFERENCES compras(id_compra) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_piso) REFERENCES pisos(id_piso) ON DELETE CASCADE ON UPDATE CASCADE
    );

	CREATE TABLE locales(
    id_local INT AUTO_INCREMENT PRIMARY KEY,
    metros INT, 
    descripcion TEXT,
    direccion varchar(80),
    uso varchar(80),
    servicio varchar(80),
    id_compra INT,
    id_alquiler INT,
    FOREIGN KEY (id_alquiler) REFERENCES alquileres(id_alquiler) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_compra) REFERENCES compras(id_compra) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
    INSERT INTO trabajadores (DNI, telefono_fijo, telefono_personal, nombre, apellidos) VALUES ('55444333A', 666333444, 666444555, 'pepito', 'grillo'), ('55333222A', 666777888, 666333111, 'juan', 'perez');
    INSERT INTO clientes (DNI, telefono_fijo, telefono_personal, nombre, apellidos) VALUES ('52444333A', 666888777, 655222333, 'victor', 'perez'), ('66444333A', 644333111, 666444888, 'jose', 'murillo');
    INSERT INTO compras (fecha, valor, id_cliente, id_trabajador) VALUES ('2022-09-22', 150000, 1, 2);
	INSERT INTO alquileres (id_trabajador, id_cliente) VALUES (1, 2);
    INSERT INTO pagos (id_alquiler, id_cliente, valor, año, mes) VALUES (1,2,650,2022,09);
    INSERT INTO pisos (metros, descripcion, direccion, id_compra, id_alquiler) VALUES (75, '3 habitaciones 2 baños', 'calle falsa 23', null, 1);	
	INSERT INTO garajes (metros, descripcion, direccion, numero, planta, id_piso, id_compra, id_alquiler) VALUES (4, 'garaje', 'calle falsa 23', 5, 1, 1, null, null);
    INSERT INTO locales (metros, descripcion, direccion, uso, servicio, id_compra, id_alquiler) VALUES (89, 'local bar', 'calle falsa 28', 'bar', 'bar', 1,null);
