	CREATE DATABASE TA12_EX16;
    USE TA12_EX16;
    
    CREATE TABLE usuarios(
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    email varchar(50),
    nombre varchar(80),
    apellidos varchar(80),
    telefono INT
    );
    
    CREATE TABLE notificaciones(
    id_notificacion INT AUTO_INCREMENT PRIMARY KEY,
    texto varchar(200),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
    CREATE TABLE tweets(
    id_tweet INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    texto TEXT,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
    CREATE TABLE mensajes(
    id_mensaje INT AUTO_INCREMENT PRIMARY KEY,
    texto TEXT,
    receptor_id INT,
    remitente_id INT,
    FOREIGN KEY (receptor_id) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (remitente_id) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
    );

    CREATE TABLE sigue(
    id INT AUTO_INCREMENT PRIMARY KEY,
    seguidor_id INT,
    seguido_id INT,
    FOREIGN KEY (seguidor_id) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (seguido_id) REFERENCES usuarios(id_usuario) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
    INSERT INTO usuarios (email, nombre, apellidos, telefono) VALUES ('facun772@gmail.com', 'facundo', 'silva castillo', 666333444), ('pepitogrillo@gmail.com', 'pepito', 'grillo', 666333444), ('juan@gmail.com', 'juan', 'rodriguez', 666333444);
    INSERT INTO notificaciones (texto, id_usuario) VALUES ('te han dado 5 likes',1), ('te ha seguido facundo',2);
    INSERT INTO tweets (fecha, texto, id_usuario) VALUES ('2022-10-20', 'me he comido una pipsa', 1);
    INSERT INTO mensajes (texto, receptor_id, remitente_id) VALUES ('hola!', 2, 1), ('buenas, que tal?', 1, 2);
    INSERT INTO sigue (seguidor_id, seguido_id) VALUES (1,2), (2,1), (3,2);