	CREATE DATABASE TA12_EX17;
	USE TA12_EX17;

	CREATE TABLE profesores(
	id_profesor INT AUTO_INCREMENT PRIMARY KEY,
	nombre varchar(80),
	direccion varchar(100),
	telefono INT,
	email varchar(50),
	DNI varchar(9),
	numero_ss INT
	);
    
    CREATE TABLE asignatura(
	id_asignatura INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(80),
    codigo_europeo varchar(20),
    codigo_tutor INT,
    FOREIGN KEY (codigo_tutor) REFERENCES profesores(id_profesor) ON DELETE CASCADE ON UPDATE SET NULL
	);
    
    CREATE TABLE imparten(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_profesor INT,
    id_asignatura INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor) ON DELETE CASCADE ON UPDATE SET NULL,
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura) ON DELETE CASCADE ON UPDATE SET NULL
    );
    
    CREATE TABLE requiere(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_asignatura INT,
    id_requerida INT,
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura) ON DELETE CASCADE ON UPDATE SET NULL,
    FOREIGN KEY (id_requerida) REFERENCES asignatura(id_asignatura) ON DELETE CASCADE ON UPDATE SET NULL
    );
    
    CREATE TABLE ciclos(
    id_ciclo INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(80),
    tipo varchar(40)
    );
    
    CREATE TABLE se_imparten(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_asignatura INT,
    id_ciclo INT,
    curso varchar(40),
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura) ON DELETE CASCADE ON UPDATE SET NULL,
    FOREIGN KEY (id_ciclo) REFERENCES ciclos(id_ciclo) ON DELETE CASCADE ON UPDATE CASCADE
    );
    
    CREATE TABLE aulas(
    id_aula INT AUTO_INCREMENT PRIMARY KEY,
    nombre varchar(80),
    numero INT,
    metros INT
    );
    
    CREATE TABLE horarios(
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    dia DATE,
    hora INT,
    id_asignatura INT,
    id_aula INT,
    FOREIGN KEY (id_asignatura) REFERENCES asignatura(id_asignatura) ON DELETE CASCADE ON UPDATE SET NULL,
    FOREIGN KEY (id_aula) REFERENCES aulas(id_aula) ON DELETE CASCADE ON UPDATE SET NULL
    );
    
    INSERT INTO profesores (nombre, direccion, telefono, email, DNI, numero_ss) VALUES ('jose', 'calle falsa 23', 666333444, 'jose@gmail.com', '55444333A', 1234567), ('Pepito', 'calle falsa 24', 666333444, 'pepito@gmail.com', '55333222A', 12234568 );
    INSERT INTO asignatura (nombre, codigo_europeo, codigo_tutor) VALUES ('mates', 'ASJW234', 1), ('historia', 'ASD2JFG', 2);
    INSERT INTO imparten (id_profesor, id_asignatura, fecha_inicio) VALUES (1, 1, '2022-04-22'), (2, 2,'2022-04-23') ;
    INSERT INTO requiere (id_asignatura, id_requerida) VALUES (1,2);
    INSERT INTO ciclos (nombre, tipo) VALUES ('Desenvolupament Aplicacions Web', 'CFGS'), ('Sistemes microinformatics i xarxes', 'CFGM');
    INSERT INTO se_imparten (id_asignatura, id_ciclo, curso) VALUES (1,2,'primero'), (2,1,'segundo');
    INSERT INTO aulas (nombre, numero, metros) VALUES ('4B', 4, 40), ('3C', 3, 42);
    INSERT INTO horarios (dia, hora, id_asignatura, id_aula) VALUES ('2022-04-22', 9, 1, 1), ('2022-04-23', 11, 2, 2);
    