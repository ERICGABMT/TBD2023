-- PRACTICA: 1
-- UNIDAD: 1
CREATE DATABASE Disney
ON PRIMARY
(
 NAME = 'Disney.mdf',
 FILENAME = 'C:\TBD2023\UNIDAD1\Disney.mdf',
 SIZE = 10MB,
 MAXSIZE = UNLIMITED,
 FILEGROWTH = 10%
) 
LOG ON 
(
 NAME = 'Disney_log',
 FILENAME = 'C:\TBD2023\UNIDAD1\Disney.ldf',
 SIZE = 10MB,
 MAXSIZE = UNLIMITED,
 FILEGROWTH = 10%
 ) 
 go  

 USE Disney

 --Sala (sal_id caracter (3) no cepta nulos
 --sal_nombre cadena variable (25),
 --enc_id entero)

 CREATE TABLE Sala
 (
 sal_id CHAR(3) NOT NULL,
 sal_nombre VARCHAR(25),
 enc_id INT

 ); 

 CREATE TABLE Encargado 
 (
 enc_id INT IDENTITY(1,1) NOT NULL,
 enc_puesto VARCHAR(15),
 enc_nombre VARCHAR(30),
 enc_direccion VARCHAR(50),
 enc_tel VARCHAR(20),
 enc_fecha DATE,

 ); 
 CREATE TABLE Alumno
 (
 alu_id INT NOT NULL,
 alu_nombre VARCHAR(100),
 alu_edad INT,
 alu_fechaingreso DATE,
 alu_tutor VARCHAR(100), 
 sal_id CHAR(3),
 ); 
 CREATE TABLE Reporte 
 (
 rep_id INT IDENTITY(1,1) NOT NULL,
 rep_hora VARCHAR(5),
 rep_fecha DATE,
 enc_id INT,
 alu_id INT, 
 rep_observaciones VARCHAR(200),
 );
 CREATE TABLE Entrada_Salida 
 (
 reg_id INT IDENTITY(1,1) NOT NULL,
 reg_hora TIME,
 reg_fecha DATE,
 reg_tipo CHAR(1),
 alu_id INT,
 ); 

 --Paso 3. CREAR PRIMARY KEYS
 ALTER TABLE Alumno 
 ADD Observaciones VARCHAR(100);

 ALTER TABLE Alumno
 ADD CONSTRAINT PK_ALUMNO
 PRIMARY KEY (alu_id);

 ALTER TABLE Encargado
 ADD CONSTRAINT PK_ENCARGADO
 PRIMARY KEY (enc_id);

 ALTER TABLE Reporte 
 ADD CONSTRAINT PK_REPORTE 
 PRIMARY KEY (rep_id);

 ALTER TABLE Entrada_Salida
 ADD CONSTRAINT PK_ENTRADA_SALIDA
 PRIMARY KEY (reg_id);

 ALTER TABLE Sala
 ADD PRIMARY KEY (sal_id); 

 --Probando los SP
 EXEC sp_helpdb Disney;

 --VERIFICAR UNA TABLA 
 EXEC sp_help Alumno; 

 --VERIFICAR LOS CONSTRAINT DE UNA TABLA
 EXEC sp_helpconstraint	Sala; 

 --Practica 4 
 ALTER TABLE Alumno
 ADD CONSTRAINT FK_Alumno_Sala
 FOREIGN KEY(sal_id)
 REFERENCES Sala(sal_id);

 ALTER TABLE Entrada_Salida
 ADD CONSTRAINT FK_EntradaSalida_Alumno
 FOREIGN KEY (alu_id)
 REFERENCES Alumno(alu_id);

 ALTER TABLE Reporte
 ADD CONSTRAINT FK_Reporte_Alumno
 FOREIGN KEY (alu_id)
 REFERENCES Alumno(alu_id); 

 ALTER TABLE Sala
 ADD CONSTRAINT FK_Sala_Encargado
 FOREIGN KEY (enc_id)
 REFERENCES Encargado(enc_id); 

 ALTER TABLE Reporte 
 ADD CONSTRAINT FK_Reporte_Encargado
 FOREIGN KEY (enc_id)
 REFERENCES Encargado(enc_id);

 --Practica 5
 --Check: Edad del alumno no debe de ser mayor a 6 años 
 use Disney;
 ALTER TABLE Alumno
 ADD CONSTRAINT CK_Alumno_Edad
 CHECK (alu_edad <= 6); 

 --DEFAULT: La fecha de ingreso 
 --debde ser la fecha actual o de sistema 
 ALTER TABLE Alumno 
 ADD CONSTRAINT DF_Alumno_Fechaingreso
 DEFAULT getdate() --FUNCION PARA OBTENER LA FECHA DEL SISTEMA
 FOR alu_fechaingreso; 

 ALTER TABLE Encargado
 ADD CONSTRAINT DF_Encargado_Puesto
 DEFAULT 'MESTRO TITULAR'
 FOR enc_puesto;
 
 
 ALTER TABLE Entrada_Salida
 ADD CONSTRAINT CK_Entrada_Salida_Tipo
 CHECK (reg_tipo IN ('E','S'));
 -- reg_tipo = 'E' OR reg_tipo = 'S'

 --La fecha no puede ser mayor que la fecha actual
 ALTER TABLE Entrada_Salida
 ADD CONSTRAINT CK_Entrada_Salida_Fecha
 CHECK (reg_fecha <= getdate());

 --DEFAULT: La observacion es sin observacion
 ALTER TABLE Reporte
 ADD CONSTRAINT DF_Reporte_Observacion
 DEFAULT 'Sin Observacion'
 FOR rep_observaciones;






