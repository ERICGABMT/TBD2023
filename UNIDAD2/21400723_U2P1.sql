--Unidad2 

USE Superheroes; 

INSERT INTO HEROE ( HER_NOMBRE,HER_ALIAS,LUG_ID)
VALUES ('Peter Parker','Spiderman',5);

INSERT INTO UNIVERSO
VALUES ('DC','ES UN LUGAR MARAVILLOSO')

INSERT INTO UNIVERSO
VALUES ('MARVEL','ES UN LUGAR MARAVILLOSO') 

INSERT INTO PODER 
VALUES ('ARACNIDO','ADQUIRIDO')

INSERT INTO PODER 
VALUES ('VOLAR','NACIMIENTO'),
       ('SUPER FUERZA','NACIMIENTO'),
	   ('ALIENTO CONGELANTE','NACIMIENTO'),
	   ('VISION RAYOS X','NACIMIENTO'),
	   ('VISION RAYOS LACER','NACIMIENTO');

INSERT INTO LUGAR_DEFENSA
VALUES ('NEW YORK'),
       ('METROPOLIS'),
	   ('CD GOTICA'),
	   ('EL MUNDO'),
	   ('SATR CITY');

INSERT INTO TRAJE(TRA_ID,TRA_COLOR,TRA_MATERIAL)
VALUES (1,'ROJO/AZUL','LICRA'); 

INSERT INTO HEROE
(HER_NOMBRE, HER_ALIAS,LUG_ID,UNI_ID,TRA_ID,HER_EDAD,HER_ESTRELLAS)
VALUES ('PETER PARKER','SPIDERMAN',1,2,1,18,1000);

