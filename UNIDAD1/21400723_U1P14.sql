--Parctica 14 
--Unidad 1 
--Gourmet 

CREATE DATABASE ElGourmet
ON PRIMARY
 (
  NAME = 'ElGourmet.mdf',
  FILENAME = 'C:\TBD2023\UNIDAD1\ElGourmet.mdf'
 ) 
 LOG ON 
 ( 
  NAME = 'ElGourmet.ldf',
  FILENAME = 'C:\TBD2023\UNIDAD1\ElGourmet.ldf'
  ) 
  Go

  use ElGourmet

  CREATE TABLE Ingrediente 
  ( 
   IDIngrediente INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
   IngNombre VARCHAR(50) NULL,
   IngDescripcion VARCHAR(200) NULL,
  );

  CREATE TABLE Chef 
  (
   IDChef TINYINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
   ChefNombre VARCHAR(70) NULL,
   ChefEspecialidad VARCHAR(30) NULL,
  ); 

  CREATE TABLE DetReceta
  (
   IDDetReceta INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
   IDIngrediente INT NULL,
   IDReceta INT NOT NULL,
   CONSTRAINT FK_DetReceta_Receta FOREIGN KEY(IDReceta)
   REFERENCES Receta(IDReceta),
   CONSTRAINT FK_DetReceta_Ingredientes FOREIGN KEY(IDIngrediente)
   REFERENCES Ingrediente(IDIngrediente)
  ); 
  CREATE TABLE Receta
  (
   IDReceta INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
   RecetaNombre VARCHAR(50) NULL,
   RecetaDescripcion VARCHAR(200) NULL,
   RecetaCosto MONEY NULL,
   ReceraModoPreparacion VARCHAR(MAX),
   IDChef TINYINT NULL,
   IDCategoria SMALLINT NULL,
   CONSTRAINT FK_Receta_Categotia FOREIGN KEY(IDCategoria)
   REFERENCES Categoria(IDCategoria),
   
   
   ); 

  CREATE TABLE Categoria
  (
   IDCategoria SMALLINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
   CategoriaDescri VARCHAR(50)
  ); 

  ALTER TABLE Receta
  ADD CONSTRAINT DF_Des DEFAULT  'ES UNA RECETA DELICIOSA' 
  FOR RecetaDescripcion

  ALTER TABLE Receta
  ADD CONSTRAINT CK_Costo CHECK  (RecetaCosto >= 100 AND RecetaCosto <=1000)
  
  ALTER TABLE Chef 
  ADD CONSTRAINT CK_Especialidad CHECK (ChefEspecialidad in ('Desayuno','Cena','Comida','Cocina Mexicana','Comida Asiatica'))

  ALTER TABLE Receta
  ADD CONSTRAINT FK_Receta_Chef FOREIGN KEY(IDChef)
  REFERENCES Chef(IDChef)
