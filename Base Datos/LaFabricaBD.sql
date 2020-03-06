CREATE DATABASE LaFabricaDB;
USE LaFabricaDB


CREATE TABLE Paises (
Nombre	 VARCHAR (20) PRIMARY KEY,
ID	 VARCHAR (20)
)

CREATE TABLE Regiones(
Nombre	 VARCHAR (20) PRIMARY KEY,
Pais	 VARCHAR (20),

)

CREATE TABLE Universidades (
Nombre	 VARCHAR (20)	 PRIMARY KEY,
ID	 VARCHAR  (20),
Pais	 VARCHAR (20),

)

CREATE TABLE Deportes (
Nombre	VARCHAR (20)	 PRIMARY KEY,
ID 	VARCHAR (20)
)

CREATE TABLE Posiciones (
Nombre 	VARCHAR (20) 	PRIMARY KEY,
ID 	VARCHAR (20)
)

CREATE TABLE Atleta(
Nombre 	VARCHAR (30) 	NOT NULL,
Apellido1 VARCHAR (30) 	NOT NULL,
Apellido2 VARCHAR (30)	NOT NULL,
Email1 	VARCHAR (30) 	NOT NULL,
Email2 	VARCHAR (30),
FechaNacimiento DATETIME 	NOT NULL,
FechaIngreso 	DATETIME  	NOT NULL,
Pais 	VARCHAR (20)  	NOT NULL,
Region 	VARCHAR (20) 	NOT NULL,
Carnet 	VARCHAR (20) 	NOT NULL,
Universidad 	VARCHAR (20) 	NOT NULL,
Deporte 	VARCHAR (20) 	NOT NULL,
PosicionP 	VARCHAR (20) 	NOT NULL,
PosicionS 	VARCHAR (20),
Telefono 	VARCHAR (10),
[Password] 	VARCHAR (8) 	NOT NULL,
PRIMARY KEY (Carnet)

)

CREATE TABLE Entrenador(
Nombre 	VARCHAR (30) 	NOT NULL,
Apellido1 	VARCHAR (30) 	NOT NULL,
Apellido2 	VARCHAR (30) 	NOT NULL,
Email1 	VARCHAR (50) 	NOT NULL,
FechaIngreso 	DATETIME 	NOT NULL,
Estado 	INT 	NOT NULL,
[Password] 	VARCHAR (8) 	NOT NULL,
Pais 	VARCHAR (20) 	NOT NULL,
Universidad 	VARCHAR (20) 	NOT NULL,
PRIMARY KEY (Email1)
)

CREATE TABLE Scout (
Nombre 	VARCHAR (30) 	NOT NULL,
Apellido1 	VARCHAR (30) 	NOT NULL,
Apellido2 	VARCHAR (30) 	NOT NULL,
Email1 	VARCHAR (50) 		NOT NULL,
FechaIngreso 	DATETIME 	NOT NULL,
[Password] 	VARCHAR (8) 	NOT NULL,
Estado 	INT 	NOT NULL,
PRIMARY KEY (Email1)
)

CREATE TABLE Administrador ( 
Nombre 	VARCHAR (20) 	NOT NULL,
Apellido1 	VARCHAR (20) 	NOT NULL,
Apellido2 	VARCHAR (20) 	NOT NULL,
Email1 	VARCHAR (20) 	NOT NULL,
Estado 	INT 	NOT NULL,
[Password] 	VARCHAR (20) 	NOT NULL,
PRIMARY KEY (Email1)
)

CREATE TABLE Estado(
ID 	VARCHAR (20) PRIMARY KEY,
Nombre 	VARCHAR (20)
)

CREATE TABLE Lesiones(
ID 	INT PRIMARY KEY,
Carne 	VARCHAR (20),
Lesion 	VARCHAR (300),
Descripcion 	VARCHAR (20),

)
CREATE TABLE Equipo(
ID 	INT,
Entrenador 	VARCHAR (20),

)

CREATE TABLE EstadisticasEntrenamientoAtleta (

Carne 	VARCHAR (20) 	PRIMARY KEY,
NumEntrenamientos 	INT 	NOT NULL,
PromedioEntrenamientos 	INT 	NOT NULL,
PromTDistanciaCorta 	TIME 	NOT NULL,
PromTDistanciaLarga 	TIME 	NOT NULL,
MejorTiempoDistanciaLarga 	TIME 	NOT NULL,
MejorTiempoDistanciaCorta 	TIME 	NOT NULL,
PromedioSalto 	INT 	NOT NULL,
MejorSalto 	INT 	NOT NULL,
PruebaPace 	TIME 	NOT NULL,
PruebaHR 	TIME 	NOT NULL,
NotaXSport 	INT 	NOT NULL
)

CREATE TABLE EstadisticasPartidoAtleta(
Carne 	VARCHAR (20),
NumPartidos 	INT 	NOT NULL,
PromedioCalifPartidos 	INT 	NOT NULL,
TotalJuegos 	INT 	NOT NULL,
TotalJuegosGanados 	INT 	NOT NULL,
TotalJuegosPerdidos 	INT 	NOT NULL,
TotalJuegosEmpatados 	INT 	NOT NULL,
TotalGoles 	INT 	NOT NULL,
TotalAsistencias 	INT 	NOT NULL,
TotalBalonesRecuperados INT 	NOT NULL,
BalonesRecupPorPartido 	INT 	NOT NULL,
TotalPases 	INT 	NOT NULL,
PorcentPasesExitosos 	INT 	NOT NULL,
TotalCentros 	INT 	NOT NULL,
PorcentCentrosExitosos 	INT 	NOT NULL,
TarjetasAmarillas 	INT 	NOT NULL,
TarjetasRojas 	INT 	NOT NULL,
PenalesDetenidos 	INT 	NOT NULL,
PenalesSalvados 	INT 	NOT NULL,
PorcentRematesSalvados 	INT 	NOT NULL,
)

CREATE TABLE TiposDeUsuario (
ID Varchar (20) PRIMARY KEY,
Tipo VARCHAR (20),
);

ALTER TABLE Regiones ADD FOREIGN KEY (Pais) REFERENCES Paises (Nombre);
ALTER TABLE Universidades ADD FOREIGN KEY (ID) REFERENCES Paises (Nombre);
ALTER TABLE Atleta ADD FOREIGN KEY (Pais) REFERENCES Paises (Nombre);
ALTER TABLE Atleta ADD FOREIGN KEY (TipoUsuario) REFERENCES TiposDeUsuario (ID);
ALTER TABLE Scout ADD FOREIGN KEY (TipoUsuario) REFERENCES TiposDeUsuario (ID);
ALTER TABLE Entrenador ADD FOREIGN KEY (TipoUsuario) REFERENCES TiposDeUsuario (ID);
ALTER TABLE Atleta ADD FOREIGN KEY (Region) REFERENCES Regiones (Nombre);
ALTER TABLE Atleta ADD FOREIGN KEY (PosicionP) REFERENCES Posiciones (Nombre);
ALTER TABLE Atleta ADD FOREIGN KEY (PosicionS)  REFERENCES Posiciones(Nombre);
ALTER TABLE Atleta ADD FOREIGN KEY (Deporte) REFERENCES Deportes (Nombre);
ALTER TABLE Atleta ADD FOREIGN KEY  (Universidad) REFERENCES Universidades(Nombre);
ALTER TABLE Lesiones ADD FOREIGN KEY (ID) REFERENCES Atleta (Carne);
ALTER TABLE Equipo ADD FOREIGN KEY (Entrenador) REFERENCES Entrenador (Email1);
ALTER TABLE EstadisticasPartidoAtletas ADD FOREIGN KEY (Carne)  REFERENCES EstadisticasEntrenamientoAtleta (Carne);
