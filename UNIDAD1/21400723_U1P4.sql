--CREAR LA BD
CREATE DATABASE TBD2023_GB
ON PRIMARY 
( 
NAME = 'TBD2023_GB_data',
FILENAME = 'C:\TBD2023\UNIDAD1\TBD2023_GB.mdf'
)
LOG ON 
(
 NAME = 'TBD2023_GB_log',
 FILENAME = 'C:\TBD2023\UNIDAD1\TBD2023_GB.ldf'
 );

 use TBD2023_GB

 CREATE TABLE Alumnos
 (
  noControl VARCHAR(8) PRIMARY KEY,
  nombreAlumno VARCHAR(30),
  apellidosAlumno VARCHAR(60),
  edad TINYINT,
  semestre TINYINT CHECK (semestre >=5 and semestre <=14)
  );
  /*
  **Unidades**
  NO.
  NOMBRE
  */
  CREATE TABLE Unidades
  (
   noUnidad TINYINT PRIMARY KEY,
   nombre VARCHAR(100)
   );

   /*
   **TAREAS**
   IDTAREA
   UNIDAD
   NOMBRE
   CALIFICACION MAXIMA
   FECHA DE ENTREGA
   DESCRIPCION
   */
   CREATE TABLE Tareas
   (
    idTarea TINYINT NOT NULL,
	noUnidad TINYINT NOT NULL,
	nombre VARCHAR(100),
	calificacionMaxima TINYINT DEFAULT 100,
	fechaEntrega DATE,
	descripcion TEXT,
	CONSTRAINT PK_Tarea PRIMARY KEY (idTarea,noUnidad),
	CONSTRAINT FK_Tarea_Unidades FOREIGN KEY (noUnidad)
	REFERENCES Unidades (noUnidad),
	CONSTRAINT CK_Calificacion CHECK (calificacionMaxima BETWEEN 70 AND 100)
	);

	/*
	**TAREAS ENTREGADAS**
	IDTAREA
	NO.CONTROL
	CALIFICAION OBTENIDA
	OBSERVACIONES
	*/ 

	CREATE TABLE TareasEntregadas
	(
	  idTarea TINYINT NOT NULL,
	  noUnidad TINYINT NOT NULL,
	  noControl VARCHAR(8) NOT NULL,
	  calificacion TINYINT DEFAULT 100,
	  observaciones VARCHAR(100) DEFAULT 'EXCELENTE TAREA',
	  CONSTRAINT PK_TareasEntregadas
	  PRIMARY KEY (idTarea,noUnidad,noControl),
	  CONSTRAINT FK_TareasEntregadas_Tareas
	  FOREIGN KEY (idTarea,noUnidad)
	  REFERENCES Tareas (idTarea,noUnidad),
	  CONSTRAINT FK_TareasEntregadas_Alumnos FOREIGN KEY (noControl)
	  REFERENCES Alumnos (noControl),
	  CONSTRAINT CK_Cal_Examen
	  CHECK (calificacion >= 70 and calificacion <= 100)
	 ); 
	 CREATE TABLE Examenes
	 (
	 noUnidad TINYINT NOT NULL,
	 noControl VARCHAR(8) NOT NULL,
	 calificacion TINYINT DEFAULT 70,
	 CONSTRAINT PK_Examenes PRIMARY KEY (noUnidad,noControl),
	 CONSTRAINT FK_Examenes_Alumnos
	 FOREIGN KEY (noControl)
	 REFERENCES Alumnos(noControl),
	 CONSTRAINT FK_Examenes_Unidades
	 FOREIGN KEY (noUnidad)
	 REFERENCES Unidades (noUnidad),
	 CONSTRAINT CK_Calificaion_Examen
	 CHECK (calificacion BETWEEN 70 AND 100)
	 );
