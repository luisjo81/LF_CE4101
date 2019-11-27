

/********   POPULACION ******************/


INSERT INTO Paises (Nombre) VALUES ('Costa Rica');





INSERT INTO Regiones (Nombre, Pais) VALUES ('San José', 'Costa Rica'),
										   ('Cartago', 'Costa Rica'),
										   ('Alajuela', 'Costa Rica'),
										   ('Guanacaste', 'Costa Rica'),
										   ('Puntarenas', 'Costa Rica'),
										   ('Limón', 'Costa Rica'),
										   ('Heredia', 'Costa Rica');
GO




INSERT INTO Universidades (Nombre, Pais) VALUES ('ITCR', 'Costa Rica');
GO



INSERT INTO Deportes (Nombre) VALUES ('Futbol');
GO



INSERT INTO TiposDeUsuario (ID, Tipo) VALUES (1, 'Administrador'),
											 (2, 'Scout'),
											 (3, 'Entrenador'),
											 (4, 'Atleta');
GO





INSERT INTO Estado (ID, Nombre) VALUES (1, 'Habilitado'),
									   (2, 'Deshabilitado');
GO




INSERT INTO Administrador (Nombre, Apellido1, Apellido2, Email1, FechaIngreso, [Password], Estado, TipoUsuario) 
VALUES ('Daniel', 'Madriz', 'Huertas', 'danielmadriz@gmail.com', CURRENT_TIMESTAMP, 'espe1234', 1, 1);
GO

INSERT INTO Scout (Nombre, Apellido1, Apellido2, Email1, FechaIngreso, [Password], Estado, TipoUsuario) 
VALUES ('Javier', 'Perez', 'Nomeacuerdo', 'JPGod@gmail.com', CURRENT_TIMESTAMP, 'test1234', 1, 2);
GO

INSERT INTO Entrenador(Nombre, Apellido1, Apellido2, Email1, FechaIngreso, Estado, [Password], Pais, Universidad, TipoUsuario) 
VALUES ('Pedro', 'Escamoso', 'Nomeacuerdo', 'quedado@gmail.com', CURRENT_TIMESTAMP, 1, 'test1234', 1, 1, 3);
GO


INSERT INTO Posiciones (Nombre, Deporte) VALUES ('Delantero', 'Futbol'),
												('Portero', 'Futbol'),
												('Defensa', 'Futbol');



INSERT INTO Logros (Logro, Descripcion) VALUES ('Consistencia', 'Se asigna por el sistema a un atleta que logre la marca de 50 partidos con un equipo'),
											   ('MVP', 'Se asigna por el sistema a un atleta que logre la marca de 10 partidos con calificación de 10 asignada por el entrenador (no aplica para entrenamientos)'),
											   ('Goleador', 'Se asigna por el sistema a un atleta que logre la marca de 100 goles');



