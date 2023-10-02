--PRACTICA 6
--UNIDAD 1
CREATE DATABASE SecretariaSalud --La creacion de la BD es estandar 
ON PRIMARY
( 
  NAME = 'SecretariaSalud.mdf',
  FILENAME = 'C:\TBD2023\UNIDAD1\SecretariaSalud.mdf'
 )
 LOG ON 
 (
  NAME = 'SecretariaSalud_log',
  FILENAME = 'C:\TBD2023\UNIDAD1\SecretariaSalud.ldf'
  )
  go 

  USE SecretariaSalud

  --CREACION TABLA HOSPITAL
  --código que lo identifica, nombre, dirección, teléfono,cantidad de camas
  CREATE TABLE HOSPITAL
  (
   CODIGO_IDE INT IDENTITY(1,1) NOT NULL,

  );
  --CREACION TABLA SALA
  --id, nombre, cantidad de camas.
  CREATE TABLE SALA
  (
   SL_ID INT IDENTITY(1,1) NOT NULL,
   SL_NOMBRE VARCHAR(60),
   SL_CANTIDAD_CAMAS INT 
   );
   --CREACION TABLA CAMAS
   --id, sala a la que pertenece, numero.
   CREATE TABLE CAMAS
   ( 
    CMS_ID INT IDENTITY(1,1) NOT NULL,
	CMS_SALA_PER VARCHAR(60),
	CMS_NUMERO INT,
   );  
   --CREACION TABLA MEDICO
   --cédula de profesional, nombre, especialidad.
   CREATE TABLE MEDICO
   (
    MED_CELULA_PROF VARCHAR(100),
	MED_NOMBRE VARCHAR(60),
	MED_ESPECIALIDAD VARCHAR(60),
	); 
	--CREACION TABLA LABORATORIO
	--código que lo identifica, nombre, dirección, teléfono.
	CREATE TABLE LABORATORIO 
	( 
	LAB_COD INT IDENTITY(1,1) NOT NULL,
	LAB_NOMBRE VARCHAR(60),
	LAB_DIRECCION VARCHAR(80),
	LAB_TELEFONO VARCHAR(30),
	);
	--CREACION TABLA PACIENTE DATOS
	--identificador, número de registro, número de cama,
	--nombre, dirección, fecha de nacimiento, sexo.
	CREATE TABLE PACIENTE_DATOS
	(
	PTE_IDENTIFICADOR INT IDENTITY(1,1) NOT NULL,
	PTE_NUM_REGISTRO INT,
	PTE_NUM_CAMA INT,
	PTE_NOMBRE VARCHAR(60),
	PTE_DIRECCION VARCHAR(80),
	PTE_FECHA_NACIMIENTO DATE,
	PTE_SEXO VARCHAR(20) 
	); 
    --CREACION TABLA DIAGNOSTICO
	--código que lo identifica, tipo, complicaciones.
	CREATE TABLE DIAGNOSTICO
	(
	DIAG_COD INT IDENTITY NOT NULL,
	DIAG_TIPO VARCHAR(60),
	DIAG_COMPLICACIONES VARCHAR(60),
	);  

    --CREACION DE CONSTRAINTS PK, FK, DEFAULT Y CHECK 



