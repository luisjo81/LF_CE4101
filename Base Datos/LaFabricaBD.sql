CREATE DATABASE LaFabricaDB;
USE LaFabricaDB,


CREATE TABLE Paises (
Nombre VARCHAR (20) primary key,
ID VARCHAR (20)
)

CREATE TABLE Regiones(
Nombre VARCHAR (20) primary key,
Pais VARCHAR (20),

)

CREATE TABLE Universidades (
Nombre VARCHAR (20) primary key,
ID VARCHAR  (20),
Pais VARCHAR (20),

)

CREATE TABLE Deportes (
Nombre  VARCHAR (20) primary key,
ID VARCHAR (20)
)

CREATE TABLE Posiciones (
Nombre VARCHAR (20) primary key,
ID VARCHAR (20)
)

CREATE TABLE Atleta(
Nombre VARCHAR (30),
Apellido1 VARCHAR (30),
Apellido2 VARCHAR (30),
Email1 VARCHAR (30),
Email2 VARCHAR (30),
FechaNacimiento DATETIME,
FechaIngreso DATETIME,
Pais VARCHAR (20),
Region VARCHAR (20),
Carnet VARCHAR (20) primary key,
Universidad VARCHAR (20),
Deporte VARCHAR (20),
PosicionP VARCHAR (20),
PosicionS VARCHAR (20),
Telefono VARCHAR (10),
Clave VARCHAR (8),


)

CREATE TABLE Entrenador(
Nombre VARCHAR (30),
Apellido1 VARCHAR (30),
Apellido2 VARCHAR (30),
Email VARCHAR (50) primary key,
FechaIngreso DATETIME,
Estado VARCHAR (1),
Clave VARCHAR (8),
Pais VARCHAR (20),
Universidad VARCHAR (20),

)

CREATE TABLE Info_Scout (
Nombre VARCHAR (30),
Apellido1 VARCHAR (30),
Apellido2 VARCHAR (30),
Email1 VARCHAR (50) primary key,
FechaIngreso DATETIME,
Clave VARCHAR (8),
Estado VARCHAR (20)
)

CREATE TABLE Administrador ( 
Nombre VARCHAR (20),
Apellido1 VARCHAR (20),
Apellido2 VARCHAR (20),
Email1 VARCHAR (20) primary key,
Estado VARCHAR (20),
Clave VARCHAR (20)
)

CREATE TABLE Estado(
ID (20) primary key,
Nombre VARCHAR (20)
)

CREATE TABLE Lesiones(
ID INT primary key,
Carne VARCHAR (20),
Lesion VARCHAR (300),
Descripcion VARCHAR (20),

)
CREATE TABLE Equipo(
ID INT,
Entrenador VARCHAR (20),

)

CREATE TABLE EstadisticasEntrenamientoAtleta (

Carne VARCHAR (20) primary key,
NumEntrenamientos VARCHAR (20),
PromedioEntrenamientos VARCHAR char(20),
PromTDistanciaCorta VARCHAR (20),
PromTDistanciaLarga VARCHAR (20),
MejorTiempoDistanciaLarga VARCHAR (20),
MejorTiempoDistanciaCorta VARCHAR (20),
PromedioSalto VARCHAR (20),
MejorSalto VARCHAR (20),
PruebaPace VARCHAR (20),
PruebaHR VARCHAR (20),
NotaXSport INT
)

CREATE TABLE EstadisticasPartidoAtleta(
Carne VARCHAR (20),
NumPartidos VARCHAR (20),
PromedioCalifPartidos VARCHAR (20),
TotalJuegos VARCHAR (20),
TotalJuegosGanados VARCHAR (20),
TotalJuegosPerdidos VARCHAR (20),
TotalJuegosEmpatados VARCHAR (20),
TotalGoles VARCHAR (20),
Total_asistencias VARCHAR (20),
TotalBalonesRecuperados VARCHAR (20),
BalonesRecupPorPartido VARCHAR (20),
TotalPases VARCHAR (20),
PorcentPasesExitosos VARCHAR (20),
TotalCentros VARCHAR (20),
PorcentCentrosExitosos VARCHAR (20),
TarjetasAmarillas VARCHAR (20),
TarjetasRojas VARCHAR (20),
PenalesDetenidos VARCHAR (20),
PenalesSalvados VARCHAR (20),
PorcentRematesSalvados VARCHAR (20),
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
ALTER TABLE Lesiones ADD FOREIGN KEY (ID) REFERENCES Atleta (Carne),
ALTER TABLE Equipo ADD FOREIGN KEY (Entrenador) REFERENCES Entrenador (Email1);
ALTER TABLE EstadisticasPartidoAtletas ADD FOREIGN KEY (Carne)  REFERENCES EstadisticasEntrenamientoAtleta (Carne);