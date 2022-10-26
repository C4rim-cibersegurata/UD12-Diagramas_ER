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

INSERT INTO equipo (nombre, pais, NumJugadores) VALUES ('Xavineta', 'España', 23);
VALUES
  ("Boca F.C.","Argentina",21),
  ("Medellín","Colombia",18),
  ("Arsenal","United Kingdom",16),
  ("Fénix","Uruguay",25),
  ("PSG","France",30),
  ("Er Betis","España",17),
  ("Borussia Dortmund","Deutschland",21),
  ("Barça","España",22),
  ("RCD Español","España",25),
  ("Real Madrid","España",22);
INSERT INTO jugador (nombre, posicion, edad) 
VALUES
  ("Gavi","Punta Izquierda",25),
  ("Balotelli","Defensa central",30),
  ("Cristiano Rnaldo","Mediapunta ",24),
  ("Schweinsteiger","Punta Izquierda",24),
  ("Sergio Ramos","Defensa central",22),
  ("Messi","Delantero",22),
  ("Mbappé","Punta Izquierda",19),
  ("Bufón","Punta derecha",33),
  ("Busquets","Mediapunta ",29),
  ("Pedri","Defensa central",35);
INSERT INTO liga (temporada) VALUES (2021), (2022), (201), (2020), (2016), (2017), (2019), (2022), (2014), (2010);
INSERT INTO entrenador (IdNombre, edad)
VALUES
  ("Xavineta",63),
  ("Gattuso",46),
  ("Pep guardiola",56),
  ("Mourinho",55),
  ("Valverde",39),
  ("Simeone",53),
  ("Ancelotti",46),
  ("Zinedine Zidane",45),
  ("Lopetegui",61),
  ("Klopp",43);
INSERT INTO partido (visitantes, locales, GolesVisitantes, GolesLocales)
VALUES
  ("Celta de Vigo","Manchester United",6,6),
  ("Manchester United","Celta de Vigo",4,5),
  ("Er Betis","Manchester United",6,3),
  ("Sevilla F.C","Atlético de Bilbao",6,0),
  ("Manchester United","Atlético de Bilbao",7,0),
  ("Sevilla F.C","Er Betis",9,2),
  ("Sevilla F.C","Bayern München",11,10),
  ("Atlético de Madrid","Atlético de Bilbao",7,3),
  ("Er Betis","Bayern München",11,6),
  ("Celta de Vigo","Manchester United",11,11);


