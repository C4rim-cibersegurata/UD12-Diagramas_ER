create database Accidentes;
use Accidentes;
CREATE TABLE IF NOT EXISTS pais(
nombrepais VARCHAR(45) NOT NULL PRIMARY KEY,
extension INT NOT NULL,
poblacion INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Accidente(
nombreaccidente VARCHAR(45) NOT NULL PRIMARY KEY,
vertical VARCHAR(45) NOT NULL,
horizontal VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS PaisAccidente(
nombrepais VARCHAR(45) REFERENCES pais (nombrepais) on delete cascade on update cascade,
nombreaccidente VARCHAR(45) REFERENCES Accidente (nombreaccidente) on delete cascade on update cascade 
);

CREATE TABLE IF NOT EXISTS montaña(
nombreMontaña VARCHAR(45) NOT NULL PRIMARY KEY,
altura INTEGER UNSIGNED NOT NULL,
nombreaccidente VARCHAR(45) REFERENCES Accidente (nombreaccidente) on delete cascade on update cascade 
);

CREATE TABLE IF NOT EXISTS lago(
nombreLago VARCHAR(45) NOT NULL PRIMARY KEY,
extension INTEGER UNSIGNED NOT NULL,
nombreaccidente VARCHAR(45) REFERENCES Accidente (nombreaccidente) on delete cascade on update cascade 
);

CREATE TABLE IF NOT EXISTS rio(
nombreRio VARCHAR(45) NOT NULL PRIMARY KEY,
longitud INTEGER UNSIGNED NOT NULL,
nombreaccidente VARCHAR(45) REFERENCES Accidente (nombreaccidente) on delete cascade on update cascade 
);


CREATE TABLE IF NOT EXISTS localidad(
nombrelocalidad VARCHAR(45) NOT NULL PRIMARY KEY,
nombrepais VARCHAR(45) REFERENCES pais (nombrepais) on delete cascade on update cascade,
);


CREATE TABLE IF NOT EXISTS RioLocalidad(
nombreRio VARCHAR(45) REFERENCES rio (nombreRio) on delete cascade on update cascade,
nombrelocalidad VARCHAR(45) REFERENCES localidad (nombrelocalidad) on delete cascade on update cascade 
);