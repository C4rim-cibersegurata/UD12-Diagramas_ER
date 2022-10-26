create database Organigrama;
use Organigrama;
CREATE TABLE `Organigrama`.`trabajador` (
  `IdCodeTrabajador` INT NOT NULL AUTO_INCREMENT,
  `Dni` VARCHAR(45) NOT NULL,
  `NumSeguridadSocial` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NULL,
  `Telefono` INT NULL,
  `Responsable` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`IdCodeTrabajador`));
CREATE TABLE departamento (IdCodeDepartamento INT NOT NULL AUTO_INCREMENT, 
nombre VARCHAR(45) NOT NULL,
PRIMARY KEY (IdCodeDepartamento));

CREATE TABLE trabajadorDepartamento (IdCodeTrabajador INT REFERENCES trabajador (IdCodeTrabajador) on delete cascade on update cascade,
IdCodeDepartamento INT REFERENCES departamento (IdCodeDepartamento) on delete cascade on update cascade,
PRIMARY KEY(IdCodeTrabajador, IdCodeDepartamento)
);

CREATE TABLE contrato (idContrato INT PRIMARY KEY AUTO_INCREMENT, 
fechainicio DATE NOT NULL,
fechafinal DATE NOT NULL,
IdCodeTrabajador INT REFERENCES empleado (IdCodeTrabajador) on delete cascade on update cascade
);

CREATE TABLE nomina (idNomina INT PRIMARY KEY AUTO_INCREMENT, 
fecha DATE NOT NULL,
salario INT NOT NULL,
idContrato INT REFERENCES contrato (idContrato) on delete cascade on update cascade
);
INSERT INTO `trabajador` (`IdCodeTrabajador`,`Dni`,`NumSeguridadSocial`,`Nombre`,`Apellidos`,`Direccion`,`Telefono`,`Responsable`)
VALUES
  (1,"7147377D","349486668","Renee","Marks","725-8116 Dolor St.","621272758","0"),
  (2,"9685753K","538644942","Hilary","Bryan","Ap #456-806 Cras Av.","692741833","0"),
  (3,"3684797I","223353872","Victor","Harrison","Ap #599-4767 Mi Ave","636327966","0"),
  (4,"8392557W","486336551","Kennedy","Nunez","729-4921 Egestas Road","659276729","0"),
  (5,"3636462B","272766322","Maggy","Mcclain","102-4904 Dictum. St.","672648351","0"),
  (6,"9836614V","741555288","Brent","Benson","5491 Non Rd.","668664283","0"),
  (7,"6274624X","348427857","Martina","Farley","7087 Ante, Road","634358393","0"),
  (8,"3871252C","478352593","Dara","Patel","Ap #719-2878 Nibh. Road","623626513","0"),
  (9,"5288226D","214998332","Cameron","Cline","Ap #822-8019 Ante Av.","664326143","0"),
  (10,"2473523L","625473856","Rosalyn","Vega","6184 Id Avenue","625559825","0");
