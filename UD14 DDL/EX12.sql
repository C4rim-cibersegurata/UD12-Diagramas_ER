create database Empresa;
use Empresa;
CREATE TABLE empresa(
IdCodigoInterno INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
cif VARCHAR(10) NOT NULL,
nombre VARCHAR(30) NOT NULL,
direccion VARCHAR(50) NOT NULL,
telefono INT NOT NULL
codigo_interno INT NOT NULL UNIQUE);

CREATE TABLE proyecto(
IdProyecto INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
fechaPrevista DATE NOT NULL,
fechaInicio DATE NOT NULL,
fechaFinal DATE,
IdCodigoInterno INT REFERENCES empresa (IdCodigoInterno) on delete cascade on update cascade
);

CREATE TABLE puesto(
IdPuesto INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(30),
IdProyecto INT REFERENCES proyecto (IdProyecto) on delete cascade on update cascade
);

CREATE TABLE trabajador(
IdCodeTrabajador INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
dni VARCHAR(9) NOT NULL,
nombre VARCHAR(30),
apellidos VARCHAR(30)
);


CREATE TABLE trabaja(
HorasTrabajadas INT NOT NULL,
IdCodeTrabajador VARCHAR(45) REFERENCES trabajadro (IdCodeTrabajador) on delete cascade on update cascade,
IdPuesto VARCHAR(45) REFERENCES puesto (IdPuesto) on delete cascade on update cascade );

CREATE TABLE profesion(
IdCodigoProfesion INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(30),
IdPuesto VARCHAR(45) REFERENCES puesto (IdPuesto) on delete cascade on update cascade
);
