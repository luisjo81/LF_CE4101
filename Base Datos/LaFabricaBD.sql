create database LaFabricaDB,
use LaFabricaDB,


CREATE TABLE Paises (
Nombre varchar (20) primary key,
ID varchar (20)
)

CREATE TABLE Regiones(
Nombre varchar (20) primary key,
Pais varchar (20),
foreign key (Pais) references Paises (Nombre)
)

CREATE TABLE Universidades (
Nombre varchar (20) primary key,
ID varchar (20),
Pais varchar (20),
foreign key (ID) references Paises (Nombre)
)

CREATE TABLE Deportes (
Nombre  varchar (20) primary key,
ID varchar (20)
)

CREATE TABLE Posiciones (
Nombre varchar (20) primary key,
ID varchar (20)
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

foreign key (Pais) references Paises (Nombre),
foreign key (Region) references Regiones (Nombre),
foreign key (Universidad) references Universidades (Nombre),
foreign key (Deporte) references Deportes (Nombre),
foreign key (PosicionP) references Posiciones (Nombre),
foreign key (PosicionS) references Posiciones (Nombre),
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
foreign key (Pais) references Paises (Nombre),
foreign key (Universidad) references Universidades (Nombre),
)

CREATE TABLE Info_Scout (
Nombre VARCHAR (30),
Apellido1 VARCHAR (30),
Apellido2 VARCHAR (30),
Email VARCHAR (50) primary key,
FechaIngreso DATETIME,
Clave VARCHAR (8),
Estado VARCHAR (20)
)

CREATE TABLE Administrador ( 
Nombre VARCHAR (20),
Apellido1 VARCHAR (20),
Apellido2 VARCHAR (20),
Email VARCHAR (20) primary key,
Estado VARCHAR (20),
Clave VARCHAR (20)
)

CREATE TABLE Estado(
ID (20) primary key,
Nombre varchar (20)
)

CREATE TABLE Lesiones(
ID int primary key,
Carne varchar (20),
Lesion varchar (300),
Descripcion varchar (20),
foreign key (ID) references Atleta (Carne)
)
CREATE TABLE Equipo(
ID int,
Entrenador varchar(20),
foreign key (Entrenador) references Entrenador (Email)
)

CREATE TABLE EstadisticasEntrenamientoAtleta (

Carne varchar(20) primary key,
NumEntrenamientos varchar(20),
PromedioEntrenamientos varchar(20),
PromTDistanciaCorta varchar(20),
PromTDistanciaLarga varchar(20),
MejorTiempoDistanciaLarga varchar(20),
MejorTiempoDistanciaCorta varchar(20),
PromedioSalto varchar(20),
MejorSalto varchar(20),
PruebaPace varchar(20),
PruebaHR varchar(20),
NotaXSport int
)

CREATE TABLE EstadisticasPartidoAtleta(
Carne varchar(20),
NumPartidos varchar (20),
PromedioCalifPartidos varchar(20),
TotalJuegos varchar(20),
TotalJuegosGanados varchar(20),
TotalJuegosPerdidos varchar(20),
TotalJuegosEmpatados varchar(20),
TotalGoles varchar(20),
Total_asistencias varchar(20),
TotalBalonesRecuperados varchar(20),
BalonesRecupPorPartido varchar(20),
TotalPases varchar(20),
porcenta_pases_exitosos varchar(20),
TotalCentros varchar(20),
PorcentCentrosExitosos varchar(20),
TarjetasAmarillas varchar(20),
TarjetasRojas varchar(20),
PenalesDetenidos varchar(20),
PenalesSalvados varchar(20),
PorcentRematesSalvados varchar(20),

foreign key (Carne) references EstadisticasEntrenamientoAtleta (Carne)
)

