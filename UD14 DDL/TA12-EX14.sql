CREATE DATABASE TA12_EX14;
USE TA12_EX14;

CREATE TABLE usuarios(
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
contraseña varchar(200),
email varchar(100) UNIQUE,
nombre varchar(80),
apellidos varchar(100),
direccion varchar(100),
foto varchar(100),
celebridad BOOLEAN
);

CREATE TABLE comentarios(
id_comentario INT AUTO_INCREMENT PRIMARY KEY,
texto TEXT,
imagen varchar(100),
id_usuario INT,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE SET NULL
);

CREATE TABLE grupos(
id_grupo INT AUTO_INCREMENT PRIMARY KEY,
nombre varchar(80),
id_usuario INT,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE SET NULL
);

CREATE TABLE contactos(
id INT AUTO_INCREMENT PRIMARY KEY,
id_usuario INT,
id_contacto INT,
comentario TEXT,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE SET NULL,
FOREIGN KEY (id_contacto) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE SET NULL
);

CREATE TABLE pertenece(
id INT AUTO_INCREMENT PRIMARY KEY,
id_usuario INT,
id_grupo INT,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE SET NULL,
FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo) ON DELETE CASCADE ON UPDATE SET NULL
);

CREATE TABLE bloquea(
id INT AUTO_INCREMENT PRIMARY KEY,
id_usuario INT,
id_bloqueado INT,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE SET NULL,
FOREIGN KEY (id_bloqueado) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE SET NULL
);

CREATE TABLE telefonos(
id INT AUTO_INCREMENT PRIMARY KEY,
telefono INT,
id_usuario INT,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE SET NULL
);


CREATE TABLE visibles(
id INT AUTO_INCREMENT PRIMARY KEY,
id_comentario INT,
id_grupo INT,
id_contacto INT,
FOREIGN KEY (id_grupo) REFERENCES grupos(id_grupo) ON DELETE NO ACTION ON UPDATE SET NULL,
FOREIGN KEY (id_contacto) REFERENCES contactos(id) ON DELETE CASCADE ON UPDATE SET NULL,
FOREIGN KEY (id_comentario) REFERENCES comentarios(id_comentario) ON DELETE CASCADE ON UPDATE SET NULL
);

DELETE FROM usuarios WHERE id_usuario = 1 ;
ALTER TABLE usuarios AUTO_INCREMENT = 1;
INSERT INTO usuarios (contraseña, email, nombre, apellidos, direccion, foto, celebridad) VALUES ('1234', 'facun772@gmail.com', 'facundo', 'silva castillo', 'vista alegre 23', 'foto.jpg', false), ('password', 'user@gmail.com', 'pepe', 'martinez', 'calle falsa 32', 'foto.jpg', false);
INSERT INTO usuarios (contraseña, email, nombre, apellidos, direccion, foto, celebridad) VALUES ('3333', 'pablomotos@gmail.com', 'pablo', 'motos', 'el hormiguero 23', 'foto.jpg', true);
INSERT INTO comentarios (texto, imagen, id_usuario) VALUES ("me gusta la playa", "playa.jpg", 1);
INSERT INTO contactos (id_usuario, id_contacto, comentario) VALUES (1,2,"Mi amigo pepe");
INSERT INTO grupos (nombre, id_usuario) values ("amigos", 1);
INSERT INTO pertenece (id_usuario, id_grupo) values (2, 1);
INSERT INTO telefonos (telefono, id_usuario) values (666333444, 1), (666333666, 1), (666444111, 2);
INSERT INTO bloquea (id_usuario, id_bloqueado) values (1,3);
INSERT INTO visibles (id_comentario, id_grupo, id_contacto) values (1, 1, 1);
