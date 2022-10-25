create database Futbol;
use Futbol;

CREATE TABLE equipo (
IdEquipo INT PRIMARY KEY AUTO_INCREMENT, 
nombre VARCHAR(45) NOT NULL,
pais VARCHAR(45) NOT NULL,
NumJugadores INT NOT NULL
);

CREATE TABLE jugador (
IdJugador INT NOT NULL PRIMARY KEY, 
nombre VARCHAR(45) NOT NULL,
posicion VARCHAR(45) NOT NULL,
edad INT NOT NULL,
IdEquipo INT NULL references equipo (IdEquipo) on delete cascade on update cascade
);

CREATE TABLE liga (
IdNombreLiga VARCHAR(45) NOT NULL PRIMARY KEY, 
temporada YEAR NOT NULL
);

CREATE TABLE entrenador (
IdNombre VARCHAR(45) NOT NULL PRIMARY KEY, 
edad INT NOT NULL,
IdEquipo INT NULL references equipo (IdEquipo) on delete cascade on update cascade
);

CREATE TABLE partido (
IdPartido INT PRIMARY KEY AUTO_INCREMENT, 
visitantes VARCHAR(45) NOT NULL,
locales VARCHAR(45) NOT NULL,
GolesVisitantes INT NOT NULL,
GolesLocales INT NOT NULL,
idliga INT REFERENCES liga (idliga) on delete cascade on update cascade
);

CREATE TABLE juega (
idequipo INT REFERENCES equipo (idequipo) on delete cascade on update cascade,
idpartido INT REFERENCES partido (idpartido) on delete cascade on update cascade 
);
