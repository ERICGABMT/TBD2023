--Prectica 15
--Jugeo de Ajedrez

CREATE DATABASE Campeonato_Ajedrez
ON PRIMARY 
(
 NAME = 'Campeonato_Ajedrez_data',
 FILENAME = 'C:\TBD2023\UNIDAD1\Campeonato_Ajedrez.mdf'
 )
 LOG ON 
 (
 NAME = 'Campeonato_Ajedrez_log',
 FILENAME = 'C:\TBD2023\UNIDAD1\Campeonato_Ajedrez.ldf'
 )
 GO

 USE Campeonato_Ajedrez

 CREATE TABLE TIPO_CONCURSO
 (
  tip_id INT IDENTITY (1,1) PRIMARY KEY,
  tip_nombre VARCHAR (50),
  tip_nivel TINYINT DEFAULT 1 CHECK (tip_nivel IN (1,2,3,4,5,6))
  );
  CREATE TABLE CARRERAS
  (
   car_id CHAR(5) PRIMARY KEY,
   car_nombre VARCHAR(60),
   car_vigencia1 DATE,
   car_vigencia2 DATE,
   );
   CREATE TABLE PARTICIPANTES
   (
    [No de Control] VARCHAR(8) PRIMARY KEY,
	[Nombre Completo] VARCHAR(120),
	Carrera CHAR(5) FOREIGN KEY REFERENCES CARRERAS(car_id),
	Semestre CHAR(2),
	[Fecha_Nacimiento] DATE,
	Tipo_Concurso INT FOREIGN KEY REFERENCES TIPO_CONCURSO(tip_id)
	);
	CREATE TABLE RESULTADOS
	(
	res_id INT IDENTITY(1,1) CONSTRAINT PK_RESULTADOS PRIMARY KEY,
	res_nocontrol VARCHAR(8) FOREIGN KEY 
	REFERENCES PARTICIPANTES([No de Control]),
	res_tipoconcurso INT FOREIGN KEY REFERENCES TIPO_CONCURSO(tip_id),
	res_lugar TINYINT CHECK (res_lugar >=1 and res_lugar <= 3),
	res_puntos INT DEFAULT 100
	); 

	--4 Agregar Observaciones a tipo de concurso
	ALTER TABLE TIPO_CONCURSO
	ADD tip_observaciones VARCHAR(300);

	--5 Quitar vigencia2 a carreras
	ALTER TABLE CARRERAS
	DROP COLUMN car_vigencia2;
