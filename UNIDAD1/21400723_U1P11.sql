--Practica 11
--Unnidad 1
CREATE DATABASE Biblioteca
ON PRIMARY
(
 NAME = 'Biblioteca.mdf',
 FILENAME = 'C:\TBD2023\UNIDAD1\Biblioteca.mdf' 
 )
 LOG ON
 (
 NAME = 'Biblioteca.Ldf',
 FILENAME = 'C:\TBD2023\UNIDAD1\Biblioteca.Ldf' 
 )
GO  

CREATE TABLE SOCIOS
(  
 SOC_NUM_SOCIO SMALLINT IDENTITY(1,1),
 SOC_NOMBRE VARCHAR(20) NOT NULL,
 SOC_DIRECCION VARCHAR(60),
 SOC_NUM_TEL VARCHAR(15),
 SOC_FECHA_INSCRIPCION DATE,
 
 ); 
 CREATE TABLE LIBROS
 (
  LIB_TITULO VARCHAR(50),
  LIB_AUTOR1 VARCHAR(50),
  LIB_AUTOR2 VARCHAR(50),
  LIB_AUTOR3 VARCHAR(50),
  LIB_FECHA_EDICION DATE,
  LIB_NO_LIBRO INT IDENTITY(1,1),
 );
 CREATE TABLE PRESTAMOS 
 (
  PRE_FECHA_PRESTAMO DATE,
  PRE_FECHA_ENTREGA DATE,
  PRE_NO_SOCIO SMALLINT,
  PRE_NO_LIBRO INT,
  PRE_ID INT IDENTITY(1,1)
  )

  --Creacion de Constraints 