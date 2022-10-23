	CREATE DATABASE TA12_EX15;
    USE TA12_EX15;
    
    CREATE TABLE menus(
    id_menu INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    menús_servidos INT,
    temperatura INT
    );

    CREATE TABLE platos(
    id_plato INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(80),
    descripcion TEXT,
    tipo varchar(20)
    );

    CREATE TABLE compone(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_menu INT,
    id_plato INT,
    platos_servidos INT,
    FOREIGN KEY (id_menu) REFERENCES menus(id_menu) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_plato) REFERENCES platos(id_plato) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
    INSERT INTO menus (fecha, menús_servidos, temperatura) VALUES ('2022-10-17', 29, 23), ('2022-10-18', 33, 24), ('2022-10-19', 22, 20);
    INSERT INTO platos (nombre, descripcion, tipo) VALUES ('macarrones con tomate', 'macarrones con salsa de tomate', 'primero'), ('ensalada', 'lechuga tomate y tal', 'entrante'), ('chuletón', 'buena vaca', 'segundo');
    INSERT INTO compone (id_menu, id_plato, platos_servidos) VALUES (1, 1, 6), (1, 2, 5), (1, 3, 9);