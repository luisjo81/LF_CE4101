


/* STORED PROCEDURES */


/* VERIFICACION DE LOGIN *****************************/

CREATE PROCEDURE usp_GetLogin @Email VARCHAR(50)
AS
BEGIN
	SELECT	Email1, Password, TipoUsuario, Estado
	FROM	Administrador, Estado
	WHERE	Email1 = @Email
	UNION	
	SELECT	Email1, Password, TipoUsuario, Estado
	FROM	Entrenador
	WHERE	Email1 = @Email
	UNION
	SELECT	Email1, Password, TipoUsuario, Estado
	FROM	Atleta
	WHERE	Email1 = @Email
	UNION
	SELECT	Email1, Password, TipoUsuario, Estado
	FROM	Scout   
	WHERE	Email1 = @Email
END
GO



  
  

/* REGISTRO DE ADMINISTRADOR *****************************/

CREATE PROCEDURE usp_CreateAdmin @nombre VARCHAR(20), @apellido1 VARCHAR(20), @apellido2 VARCHAR(20), @email VARCHAR(50), @password VARCHAR(8)
AS
BEGIN
	INSERT INTO Administrador (Nombre, Apellido1, Apellido2, Email1, FechaIngreso, [Password], Estado, TipoUsuario) 
	VALUES (@nombre, @apellido1, @apellido2, @email, CURRENT_TIMESTAMP, @password, 1, 1);
END
GO


/* REGISTO DE ENTRENADOR *****************************/

CREATE PROCEDURE usp_CreateEntrenador @nombre VARCHAR(30), @apellido1 VARCHAR(30), @apellido2 VARCHAR(30), @email VARCHAR(50), @password VARCHAR(8), @pais INT, @universidad INT
AS
BEGIN
	INSERT INTO Entrenador (Nombre, Apellido1, Apellido2, Email1, FechaIngreso, Estado, [Password], Pais, Universidad, TipoUsuario) 
	VALUES (@nombre, @apellido1, @apellido2, @email, CURRENT_TIMESTAMP, 1, @password, @pais, @universidad, 3);
END
GO



/* REGISTRO DE SCOUT *****************************/

CREATE PROCEDURE usp_CreateScout @nombre VARCHAR(30), @apellido1 VARCHAR(30), @apellido2 VARCHAR(30), @email VARCHAR(50), @password VARCHAR(8)
AS
BEGIN
	INSERT INTO Scout (Nombre, Apellido1, Apellido2, Email1, FechaIngreso, [Password], Estado, TipoUsuario) 
	VALUES (@nombre, @apellido1, @apellido2, @email, CURRENT_TIMESTAMP, @password, 1, 2);
END
GO



/* REGISTRO DE ATLETA  *********************************/

CREATE PROCEDURE usp_CreateAtleta @nombre VARCHAR (30), @apellido1 VARCHAR(30), @apellido2 VARCHAR(30), @email1 VARCHAR(50), @email2 VARCHAR(50),
@fechaNacimiento DATETIME, @pais INT, @region INT, @carne VARCHAR(20), @universidad INT, @deporte INT, @posicionP INT, 
@posicionS INT, @telefono VARCHAR(10), @password VARCHAR(8), @altura INT, @peso INT
AS
BEGIN
	INSERT INTO Atleta (Nombre, Apellido1, Apellido2, Email1, Email2, FechaNacimiento, FechaIngreso, Pais, Region, Carne, Universidad, Deporte, PosicionP, PosicionS,
						Telefono, [Password], TipoUsuario, Estado, Altura, Peso)
						VALUES (@nombre, @apellido1, @apellido2, @email1, @email2, @fechaNacimiento, CURRENT_TIMESTAMP, @pais, @region, @carne, @universidad, @deporte, @posicionP,
								@posicionS, @telefono, @password, 4, 1, @altura, @peso)
	INSERT INTO EstadisticasEntrenamientoAtleta VALUES(@Email1, 0, 0, '00:00:00', '00:00:00', '00:00:00', '00:00:00', 0, 0, '00:00:00', 0, 0)
	INSERT INTO EstadisticasPartidoAtleta VALUES (@Email1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
END
GO



/*********** HABILITAR/ DESABILITAR ATLETA ***************************************************/

CREATE PROCEDURE usp_ActivacionAtleta @email VARCHAR(50), @estado INT
AS
BEGIN
	UPDATE	Atleta
	SET		Estado = @estado
	WHERE	Email1 = @email
END
GO



/*********** HABILITAR/ DESABILITAR SCOUT ***************************************************/

CREATE PROCEDURE usp_ActivacionScout @email VARCHAR(50), @estado INT
AS
BEGIN
	UPDATE	Scout
	SET		Estado = @estado
	WHERE	Email1 = @email
END
GO



/*********** HABILITAR/ DESABILITAR ENTRENADOR ***************************************************/

CREATE PROCEDURE usp_ActivacionEntrenador @email VARCHAR(50), @estado INT
AS
BEGIN
	UPDATE	Entrenador
	SET		Estado = @estado
	WHERE	Email1 = @email
END
GO




/*********** HABILITAR/ DESABILITAR ADMINISTRADOR ***************************************************/

CREATE PROCEDURE usp_ActivacionAdmin @email VARCHAR(50), @estado INT
AS
BEGIN
	UPDATE	Administrador
	SET		Estado = @estado
	WHERE	Email1 = @email
END
GO



/*********** OBTENER INFO DEL ADMINISTRADOR ***************************************************/

CREATE PROCEDURE usp_GetInfoAdministrador @email VARCHAR (50)
AS
BEGIN
	SELECT	* 
	FROM	Administrador
	WHERE	Administrador.Email1 = @email
END
GO


/*********** OBTENER INFO DEL ENTRENADOR ***************************************************/

CREATE PROCEDURE usp_GetInfoEntrenador @email VARCHAR (50)
AS
BEGIN
	SELECT	Entrenador.*, Universidades.Nombre, Paises.Nombre 
	FROM	Entrenador, Universidades, Paises
	WHERE	Email1 = @email
END
GO


/*********** OBTENER INFO DEL SCOUT ***************************************************/

CREATE PROCEDURE usp_GetInfoScout @email VARCHAR (50)
AS
BEGIN
	SELECT	* 
	FROM	Scout
	WHERE	Email1 = @email
END
GO


/*********** OBTENER INFO DEL ATLETA ***************************************************/

CREATE PROCEDURE usp_GetInfoAtleta @email VARCHAR (20)
AS
BEGIN
	SELECT	A.Nombre, A.Apellido1, A.Apellido2, A.Email1, A.Email2, A.FechaNacimiento, 
			A.FechaIngreso, A.Carne, A.Telefono, A.TipoUsuario, A.Estado, A.Altura, A.Peso,
			Paises.Nombre AS Pais, Regiones.Nombre AS Region, Universidades.Nombre AS Universidad, Deportes.Nombre AS Deporte, p1.Nombre as P1, p2.Nombre as P2
	FROM	Atleta as A 
			INNER JOIN Paises			ON A.Pais = Paises.ID
			INNER JOIN Regiones			ON A.Region = Regiones.ID
			INNER JOIN Deportes			ON A.Deporte = Deportes.ID
			INNER JOIN Posiciones p1	ON A.PosicionP = p1.ID  
			INNER JOIN Posiciones p2	ON A.PosicionS = p2.ID  
			INNER JOIN Universidades	ON A.Universidad = Universidades.ID
	WHERE	A.Email1 = @email
END
GO





/*********** OBTENER INFO DE LOS ENTRENAMIENTOS DE UN ATLETA ***************************************************/

CREATE PROCEDURE usp_GetInfoAtletaEntrenamientos @email VARCHAR (20)
AS
BEGIN
	SELECT	* 
	FROM	EstadisticasEntrenamientoAtleta
	WHERE	Email = @email
END
GO




/*********** OBTENER INFO DE LOS PARTIDOS DE UN ATLETA ***************************************************/

CREATE PROCEDURE usp_GetInfoAtletaPartidos @email VARCHAR (20)
AS
BEGIN
	SELECT	* 
	FROM	EstadisticasPartidoAtleta
	WHERE	Email = @email
END
GO




/************************************* AGREGAR UN PAIS NUEVO ********************************/

CREATE PROCEDURE usp_AgregarPais @nombrePais VARCHAR(30)
AS
BEGIN
	INSERT INTO Paises (Nombre) VALUES (@nombrePais)
END
GO



/************************************* AGREGAR UNA REGION NUEVA ********************************/

CREATE PROCEDURE usp_AgregarRegion @nombreRegion VARCHAR(30), @nombrePais VARCHAR(30)
AS
BEGIN
	INSERT INTO Regiones (Nombre, Pais) VALUES (@nombrePais, @nombrePais)
END
GO



/************************************* AGREGAR UN DEPORTE NUEVO ********************************/

CREATE PROCEDURE usp_AgregarDeporte @nombreDeporte VARCHAR(20)
AS
BEGIN
	INSERT INTO Deportes (Nombre) VALUES (@nombreDeporte)
END
GO



/************************************* AGREGAR UNA UNIVERSIDAD NUEVA ********************************/

CREATE PROCEDURE usp_AgregarUniversidad @nombreUniversidad VARCHAR(20), @nombrePais VARCHAR(30)
AS
BEGIN
	INSERT INTO Universidades (Nombre, Pais) VALUES (@nombreUniversidad, @nombrePais)
END
GO



/************************************* AGREGAR UNA POSICION NUEVA ********************************/

CREATE PROCEDURE usp_AgregarPosicion @nombrePosicion VARCHAR(20), @nombreDeporte VARCHAR(20)
AS
BEGIN
	INSERT INTO Posiciones (Nombre, Deporte) VALUES (@nombrePosicion, @nombreDeporte)
END
GO



/************************************* OBETENER LOS DEPORTES ********************************/

CREATE PROCEDURE usp_GetDeportes
AS
BEGIN
	SELECT * FROM Deportes
END
GO



/************************************* OBETENER LOS PAISES ********************************/

CREATE PROCEDURE usp_GetPaises
AS
BEGIN
	SELECT * FROM Paises
END
GO



/************************************* OBETENER LAS POSICIONES ********************************/

CREATE PROCEDURE usp_GetPosiciones @deporte VARCHAR(20)
AS
BEGIN
	SELECT	* 
	FROM	Posiciones
	Where	Deporte = @deporte
END
GO



/************************************* OBETENER LAS REGIONES ********************************/

CREATE PROCEDURE usp_GetRegiones @pais VARCHAR(30)
AS
BEGIN
	SELECT	* 
	FROM	Regiones
	WHERE	Regiones.Pais = @pais
END
GO



/************************************* OBETENER LAS UNIVERSIDADES ********************************/

CREATE PROCEDURE usp_GetUniversidades @pais VARCHAR(30)
AS
BEGIN
	SELECT	* 
	FROM	Universidades
	WHERE	Universidades.Pais = @pais
END
GO




/*********************** INGRESAR RESULTADOS DE JUEGO **************************/

CREATE PROCEDURE usp_ResultadosDeJuego @email VARCHAR(50), @calificacionPartido INT, @juegoGanado INT, @juegoPerdido INT, @juegoEmpatado INT, @goles INT, @asistencias INT, 
									   @balonRecuperado INT, @balonesRecPartido INT, @pasesPerdidos INT, @pasesExitosos INT, @centrosPerdidos INT, @centrosExitosos INT,
									   @tarjetasAmarillas INT, @tarjetasRojas INT, @penalesDetenidos INT, @penalesSalvados INT, @rematesSalvados INT, @rematesPerdidos INT
									   
AS
BEGIN
	UPDATE	EstadisticasPartidoAtleta
	SET		NumPartidos += 1, 
			PromedioCalifPartidos = (PromedioCalifPartidos + @calificacionPartido)/2,
			TotalJuegos += 1,
			TotalJuegosGanados += @juegoGanado,
			TotalJuegosPerdidos += @juegoPerdido,
			TotalJuegosEmpatados += @juegoEmpatado,
			TotalGoles = TotalGoles + @goles,
			TotalAsistencias += @asistencias,
			TotalBalonesRecuperados += @balonRecuperado,
			BalonesRecupPorPartido = @balonesRecPartido,
			TotalPases += @pasesExitosos + @pasesPerdidos,
			PasesExitosos += @pasesExitosos,
			PasesPerdidos += @pasesPerdidos,
			
			CentrosExitosos += @centrosExitosos,
			CentrosPerdidos += @centrosPerdidos,
			TotalCentros += @centrosPerdidos + @centrosExitosos,
			
			TarjetasAmarillas += @tarjetasAmarillas,
			TarjetasRojas += @tarjetasRojas,
			PenalesDetenidos += @penalesDetenidos,
			PenalesSalvados += @penalesSalvados,
			RematesPerdidos += @rematesPerdidos,
			RematesSalvados += @rematesSalvados

	WHERE	Email = @email
END
BEGIN
	UPDATE	EstadisticasPartidoAtleta
	SET		PorcentPasesExitosos = case
										when TotalPases = 0 then 100
										else (PasesExitosos *100) / TotalPases
										end,
			PorcentCentrosExitosos = case
										when TotalCentros = 0 then 100
										else (CentrosExitosos * 100) / TotalCentros
										end,
			PorcentRematesSalvados = case
										when RematesSalvados = 0 and RematesPerdidos =0 then 0
										else (RematesSalvados * 100) / (RematesSalvados + RematesPerdidos)
										end
	WHERE	Email =@email
END
GO




/*********************** INGRESAR RESULTADOS DE Entrenamiento **************************/
/*									   		
CREATE PROCEDURE usp_ResultadosDeEntrenamiento @email VARCHAR (50), @numEntrenamientos INT, @promedioEntrenamientos INT, @promTDistanciaCorta TIME, @promTDistanciaLarga TIME ,
											   @mejorTiempoDistanciaLarga TIME , @mejorTiempoDistanciaCorta TIME , @promedioSalto INT, @mejorSalto INT, @pruebaPace TIME, 
											   @pruebaHR INT, @notaXSport INT 
AS
BEGIN
	UPDATE	EstadisticasEntrenamientoAtleta
	SET		NumEntrenamientos += 1,
			PromedioEntrenamientos = case
									 when PromedioEntrenamientos = 0 then @promedioEntrenamientos
									 else (PromedioEntrenamientos + @promedioEntrenamientos) / 2
									 end,
			PromTDistanciaCorta = case
								  when PromTDistanciaCorta = 0 then @promTDistanciaCorta
								  else (PromTDistanciaCorta + @promTDistanciaCorta) / 2
								  end,
			PromTDistanciaLarga = case
								  when PromTDistanciaLarga = 0 then @promTDistanciaLarga
								  else (PromTDistanciaLarga + @promTDistanciaLarga) / 2
								  end,
			MejorTiempoDistanciaLarga = case
										when MejorTiempoDistanciaLarga > @mejorTiempoDistanciaLarga then MejorTiempoDistanciaLarga
										else @mejorTiempoDistanciaLarga
										end,
			MejorTiempoDistanciaCorta = case
										when MejorTiempoDistanciaCorta > @mejorTiempoDistanciaCorta then MejorTiempoDistanciaCorta
										else @mejorTiempoDistanciaCorta
										end,
			PromedioSalto =		case
								when PromedioEntrenamientos = 0 then @promedioEntrenamientos
								else (PromedioEntrenamientos + @promedioEntrenamientos) / 2
								end,
			MejorSalto =		case
								when MejorSalto > @mejorSalto then MejorSalto
								else @mejorSalto
								end,
			PruebaPace = @pruebaPace,
			PruebaHR = @pruebaHR,
			NotaXSport = @notaXSport
END
GO
			







/********************** 


EXEC usp_ResultadosDeJuego @email = 'pesquive@gmail.com', @calificacionPartido = 100, @juegoGanado = 1, @juegoPerdido =0, @juegoEmpatado =0, @goles = 3, @asistencias =2, 
									   @balonRecuperado = 8, @balonesRecPartido = 8, @pasesPerdidos = 4, @pasesExitosos =6, @centrosPerdidos =3, @centrosExitosos =3,
									   @tarjetasAmarillas =0, @tarjetasRojas =0, @penalesDetenidos = 0, @penalesSalvados=0, @rematesSalvados =0, @rematesPerdidos =0
									   		




SELECT * FROM EstadisticasPartidoAtleta

UPDATE EstadisticasPartidoAtleta
SET		NumPartidos = 0, 
			PromedioCalifPartidos =  0,
			TotalJuegos = 0,
			TotalJuegosGanados = 0,
			TotalJuegosPerdidos = 0,
			TotalJuegosEmpatados = 0,
			TotalGoles = 0,
			TotalAsistencias = 0,
			TotalBalonesRecuperados = 0,
			BalonesRecupPorPartido = 0,
			TotalPases = 0,
			PasesExitosos = 0,
			PasesPerdidos = 0,
			
			CentrosExitosos = 0,
			CentrosPerdidos = 0,
			TotalCentros = 0,
			
			TarjetasAmarillas = 0,
			TarjetasRojas = 0,
			PenalesDetenidos = 0,
			PenalesSalvados = 0,
			RematesPerdidos = 0,
			RematesSalvados = 0,
			PorcentPasesExitosos = 0,
			PorcentCentrosExitosos =0,
			PorcentRematesSalvados = 0

where Email = 'pesquive@gmail.com'







EXEC usp_ActivacionAtleta @carne = '2020123123', @estado = 1;

SELECT Estado.Nombre FROM Estado, Atleta
WHERE Atleta.Carne = '2020123123' AND Atleta.Estado = Estado.ID


EXEC usp_CreateScout @nombre = '@Nombre', @apellido1 = '@Apellido1', @apellido2 = '@Apellido2', @email = '@Email', @password = 'ssword'

DELETE FROM Scout WHERE Nombre = 'Obi';





SELECT * FROM Atleta;
SELECT * FROM EstadisticasEntrenamientoAtleta;
SELECT * FROM EstadisticasPartidoAtleta;

*/