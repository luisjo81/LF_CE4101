/*CREATE DATABASE LaFabricaDB;

DROP DATABASE LaFabricaDB
*/
/*USE LaFabricaDB;*/



CREATE TABLE Paises (
Nombre		VARCHAR (30),
ID			INT				IDENTITY(1,1) UNIQUE,
PRIMARY KEY (Nombre)
)



CREATE TABLE Regiones(
Nombre	 VARCHAR (50),
Pais	 VARCHAR (30),
ID		 INT			IDENTITY(1,1) UNIQUE,
PRIMARY KEY (Nombre)

)


CREATE TABLE Universidades (
Nombre		VARCHAR (50),
ID			INT				 IDENTITY(1,1) UNIQUE,
Pais		VARCHAR (30),
PRIMARY KEY (Nombre)
)



CREATE TABLE Deportes (
Nombre		VARCHAR (20),
ID			INT				 IDENTITY(1,1) UNIQUE,
PRIMARY KEY (Nombre)
)




CREATE TABLE Posiciones (
Nombre 		VARCHAR (20),
Deporte		VARCHAR (20),
ID 			INT				IDENTITY(1,1) UNIQUE,
PRIMARY KEY (Nombre)
)



CREATE TABLE TiposDeUsuario (
ID		INT		PRIMARY KEY,
Tipo	VARCHAR (20),
);



CREATE TABLE Atleta(
Nombre 			VARCHAR (30) 	NOT NULL,
Apellido1		VARCHAR (30) 	NOT NULL,
Apellido2		VARCHAR (30)	NOT NULL,
Email1 			VARCHAR (50) 	NOT NULL,
Email2 			VARCHAR (50),
FechaNacimiento DATE 			NOT NULL,
FechaIngreso 	DATETIME  		NOT NULL,
Pais 			INT  			NOT NULL,
Region 			INT 			NOT NULL,
Carne 			VARCHAR (20) 	NOT NULL,
Universidad 	INT 			NOT NULL,
Deporte 		INT 			NOT NULL,
PosicionP 		INT 			NOT NULL,
PosicionS 		INT,
Telefono 		VARCHAR (10),
[Password] 		VARCHAR (8) 	NOT NULL,
TipoUsuario		INT				NOT NULL,
Estado			INT				NOT NULL,
Altura			INT				NOT NULL,
Peso			INT				NOT NULL,
Equipo			INT,				
PRIMARY KEY (Email1),

)



CREATE TABLE Entrenador(
Nombre 			VARCHAR (30) 	NOT NULL,
Apellido1 		VARCHAR (30) 	NOT NULL,
Apellido2 		VARCHAR (30) 	NOT NULL,
Email1 			VARCHAR (50) 	NOT NULL,
FechaIngreso 	DATETIME 		NOT NULL,
Estado 			INT 			NOT NULL,
[Password] 		VARCHAR (8) 	NOT NULL,
Pais 			INT 			NOT NULL,
Universidad 	INT 			NOT NULL,
TipoUsuario		INT				NOT NULL,
PRIMARY KEY (Email1)
)

CREATE TABLE Scout (
Nombre 			VARCHAR (30) 	NOT NULL,
Apellido1 		VARCHAR (30) 	NOT NULL,
Apellido2 		VARCHAR (30) 	NOT NULL,
Email1 			VARCHAR (50) 	NOT NULL,
FechaIngreso 	DATETIME 		NOT NULL,
[Password] 		VARCHAR (8) 	NOT NULL,
Estado 			INT 			NOT NULL,
TipoUsuario		INT				NOT NULL,
PRIMARY	KEY (Email1)
)

CREATE TABLE Administrador ( 
Nombre 			VARCHAR (20) 	NOT NULL,
Apellido1 		VARCHAR (20) 	NOT NULL,
Apellido2 		VARCHAR (20) 	NOT NULL,
Email1 			VARCHAR (50) 	NOT NULL,
FechaIngreso 	DATETIME 		NOT NULL,
[Password] 		VARCHAR (8) 	NOT NULL,
Estado 			INT 			NOT NULL,
TipoUsuario		INT				NOT NULL,
PRIMARY KEY (Email1)

)





CREATE TABLE Estado(
ID 		INT PRIMARY KEY,
Nombre 	VARCHAR (20)
)



CREATE TABLE Lesiones(
ID 				INT		PRIMARY KEY,
Email 			VARCHAR (50),
Lesion 			VARCHAR (30),
Descripcion 	VARCHAR (300)
)

CREATE TABLE Equipo(
ID 			INT IDENTITY (1,1),
Nombre		VARCHAR (50),
Entrenador 	VARCHAR (50),
PRIMARY KEY (Nombre)
)

CREATE TABLE EstadisticasEntrenamientoAtleta (

Email 						VARCHAR (50) 	PRIMARY KEY,
NumEntrenamientos 			INT 			NOT NULL,
PromedioEntrenamientos 		INT 			NOT NULL,
PromTDistanciaCorta 		TIME 			NOT NULL,
PromTDistanciaLarga 		TIME 			NOT NULL,
MejorTiempoDistanciaLarga 	TIME 			NOT NULL,
MejorTiempoDistanciaCorta 	TIME 			NOT NULL,
PromedioSalto 				INT 			NOT NULL,
MejorSalto 					INT 			NOT NULL,
PruebaPace 					TIME 			NOT NULL,
PruebaHR 					INT 			NOT NULL,
NotaXSport 					INT 			NOT NULL
)

CREATE TABLE EstadisticasPartidoAtleta(
Email 					VARCHAR (50),
NumPartidos 			INT 			NOT NULL,
PromedioCalifPartidos 	INT 			NOT NULL,
TotalJuegos 			INT 			NOT NULL,
TotalJuegosGanados		INT 			NOT NULL,
TotalJuegosPerdidos 	INT 			NOT NULL,
TotalJuegosEmpatados 	INT 			NOT NULL,
TotalGoles 				INT 			NOT NULL,
TotalAsistencias 		INT 			NOT NULL,
TotalBalonesRecuperados INT 			NOT NULL,
BalonesRecupPorPartido 	INT 			NOT NULL,
TotalPases 				INT 			NOT NULL,
PorcentPasesExitosos 	INT 			NOT NULL,
TotalCentros 			INT 			NOT NULL,
PorcentCentrosExitosos 	INT 			NOT NULL,
TarjetasAmarillas 		INT 			NOT NULL,
TarjetasRojas 			INT 			NOT NULL,
PenalesDetenidos 		INT 			NOT NULL,
PenalesSalvados 		INT 			NOT NULL,
PorcentRematesSalvados 	INT 			NOT NULL,
PasesPerdidos			INT				NOT NULL,
CentrosPerdidos			INT				NOT NULL,
RematesSalvados			INT				NOT NULL,
RematesPerdidos			INT				NOT NULL,
PasesExitosos			INT				NOT NULL,
CentrosExitosos			INT				NOT NULL,
PRIMARY KEY( Email)
)



CREATE TABLE Logros(
Logro			VARCHAR(20)		NOT NULL,
Descripcion		VARCHAR(300)	NOT NULL,
ID				INT				IDENTITY(1,1) UNIQUE,
PRIMARY KEY(Logro)
)

CREATE TABLE LogrosObtenidos(
Email		VARCHAR(50)		NOT NULL,
ID			INT				NOT NULL
)



ALTER TABLE Regiones		ADD FOREIGN KEY (Pais)				REFERENCES Paises (Nombre);
ALTER TABLE Posiciones		ADD FOREIGN KEY (Deporte)			REFERENCES Deportes (Nombre);
ALTER TABLE Universidades	ADD FOREIGN KEY (Pais)				REFERENCES Paises (Nombre);
ALTER TABLE Atleta			ADD FOREIGN KEY (Pais)				REFERENCES Paises (ID);
ALTER TABLE Atleta			ADD FOREIGN KEY (TipoUsuario)		REFERENCES TiposDeUsuario (ID);
ALTER TABLE Scout			ADD FOREIGN KEY (TipoUsuario)		REFERENCES TiposDeUsuario (ID);
ALTER TABLE Entrenador		ADD FOREIGN KEY (TipoUsuario)		REFERENCES TiposDeUsuario (ID);
ALTER TABLE Administrador	ADD FOREIGN KEY (TipoUsuario)		REFERENCES TiposDeUsuario (ID);
ALTER TABLE Atleta			ADD FOREIGN KEY (Region)			REFERENCES Regiones (ID);
ALTER TABLE Atleta			ADD FOREIGN KEY (PosicionP)			REFERENCES Posiciones (ID);
ALTER TABLE Atleta			ADD FOREIGN KEY (PosicionS)			REFERENCES Posiciones(ID);
ALTER TABLE Atleta			ADD FOREIGN KEY (Deporte)			REFERENCES Deportes (ID);
ALTER TABLE Atleta			ADD FOREIGN KEY  (Universidad)		REFERENCES Universidades(ID);
ALTER TABLE Lesiones		ADD FOREIGN KEY (Email)				REFERENCES Atleta (Email1);
ALTER TABLE Equipo			ADD FOREIGN KEY (Entrenador)		REFERENCES Entrenador (Email1);
ALTER TABLE EstadisticasPartidoAtleta			ADD FOREIGN KEY (Email)  REFERENCES Atleta (Email1);
ALTER TABLE EstadisticasEntrenamientoAtleta	ADD FOREIGN KEY (Email)  REFERENCES Atleta (Email1);
ALTER TABLE LogrosObtenidos	ADD FOREIGN KEY (Email)  REFERENCES Atleta (Email1);
ALTER TABLE LogrosObtenidos	ADD FOREIGN KEY (ID)  REFERENCES Logros (ID);


