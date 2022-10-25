create database Organigrama;
use Organigrama;
CREATE TABLE `Organigrama`.`trabajador` (
  `IdCodeTrabajador` INT NOT NULL AUTO_INCREMENT,
  `Dni` VARCHAR(45) NOT NULL,
  `Num Seguridad Social` VARCHAR(45) NOT NULL,
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