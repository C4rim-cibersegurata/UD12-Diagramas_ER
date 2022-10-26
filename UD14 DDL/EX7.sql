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
CREATE TABLE departamento (
IdCodeDepartamento INT NOT NULL AUTO_INCREMENT, 
nombre VARCHAR(45) NOT NULL,
PRIMARY KEY (IdCodeDepartamento));

CREATE TABLE trabajadorDepartamento (
IdCodeTrabajador INT REFERENCES trabajador (IdCodeTrabajador) on delete cascade on update cascade,
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
INSERT INTO `departamento` (`nombre`) VALUES  ("Compras"), ("Legal"), ("Personal"), ("Programación"), ("Seguridad"), ("Operaciones"), ("Sistemas"), ("RRHH"), ("Marketing"), ("Contabilidad");

INSERT INTO `contrato` (`fechainicio`,`fechafinal`)
VALUES
  ("01/20/22","10/22/22"),
  ("10/24/22","03/27/22"),
  ("11/30/22","12/25/21"),
  ("04/13/22","09/09/22"),
  ("01/04/23","11/26/21"),
  ("08/24/22","03/02/22"),
  ("12/21/22","11/10/21"),
  ("08/22/22","06/06/22"),
  ("12/08/22","10/29/21"),
  ("05/26/22","09/28/22");

INSERT INTO `nomina` (`fecha`,`salario`)
VALUES
  ("01/20/22",1100),
  ("10/24/22",930),
  ("11/30/22",850),
  ("04/13/22",1200),
  ("01/04/23",2100),
  ("08/24/22",1090),
  ("12/21/22",910),
  ("08/22/22",1066),
  ("12/08/22",1560),
  ("05/26/22",12000);

INSERT INTO `trabajador` (`Dni`,`NumSeguridadSocial`,`Nombre`,`Apellidos`,`Direccion`,`Telefono`,`Responsable`)
VALUES
  ("7147377D","349486668","Renee","Marks","725-8116 Dolor St.","621272758","0"),
  ("9685753K","538644942","Hilary","Bryan","Ap #456-806 Cras Av.","692741833","0"),
  ("3684797I","223353872","Victor","Harrison","Ap #599-4767 Mi Ave","636327966","0"),
  ("8392557W","486336551","Kennedy","Nunez","729-4921 Egestas Road","659276729","0"),
  ("3636462B","272766322","Maggy","Mcclain","102-4904 Dictum. St.","672648351","0"),
  ("9836614V","741555288","Brent","Benson","5491 Non Rd.","668664283","0"),
  ("6274624X","348427857","Martina","Farley","7087 Ante, Road","634358393","0"),
  ("3871252C","478352593","Dara","Patel","Ap #719-2878 Nibh. Road","623626513","0"),
  ("5288226D","214998332","Cameron","Cline","Ap #822-8019 Ante Av.","664326143","0"),
  (1"2473523L","625473856","Rosalyn","Vega","6184 Id Avenue","625559825","0");
