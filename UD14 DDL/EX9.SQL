CREATE DATABASE Recetas;
USE Recetas;

CREATE TABLE chef(
IdChef INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
NumRecetasCreadas INT NOT NULL
);

CREATE TABLE receta(
IdReceta INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
duración VARCHAR(45) NOT NULL,
complejidad VARCHAR(45) NOT NULL,
IdChef INT NOT NULL REFERENCES chef (IdChef) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE paso(
IdPaso INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
duración VARCHAR(45) NOT NULL,
descripción VARCHAR(1000) NOT NULL,
IdReceta INT NOT NULL REFERENCES receta (IdReceta) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ingrediente(
IdIngrediente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(45) NOT NULL,
cantidad VARCHAR(45) NOT NULL,
IdReceta INT NOT NULL REFERENCES receta (IdReceta) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO `ingrediente` (`nombre`,`cantidad`)
VALUES
  ("Aceite de oliva",40),
  ("Patata",260),
  ("Huevo de codorniz",12),
  ("Alubias",60),
  ("Sal fina",20),
  ("Comino",16),
  ("Oregano",8),
  ("Mantequilla",20),
  ("Margarina",80),
  ("Queso",140);
  
INSERT INTO `paso` (`duracion`,`descripcion`)
VALUES
  (11,"Batimos Los huevos"),
  (54,"Cortamos las papas"),
  (44,"Salteamos las gambas"),
  (16,"Limbiamos la lechuga"),
  (16,"Freímos la cebolla"),
  (31,"Mezclamos la ensalada"),
  (42,"Sazonamos el pollo"),
  (36,"Horneamos a 180º"),
  (15,"Cocinamos a fuego lento"),
  (32,"Añadimos las alubias");

INSERT INTO `receta` (`duracion`,`complejidad`)
VALUES
  (23,"Medio"),
  (12,"Medio"),
  (2,"Medio"),
  (53,"Fácil"),
  (19,"Fácil"),
  (29,"Díficil"),
  (48,"Fácil"),
  (24,"Medio"),
  (13,"Medio"),
  (57,"Díficil");

INSERT INTO `chef` (`nombre`,`NumRecetasCreadas`)
VALUES
  ("Susan Copeland",7),
  ("Alexis Berg",2),
  ("Erica Copeland",7),
  ("Herman Anderson",6),
  ("Avram Gutierrez",3),
  ("Aaron Berger",5),
  ("Sybil Lancaster",4),
  ("Ocean Allen",3),
  ("Lareina Oneal",9),
  ("Irene Mclaughlin",8);
