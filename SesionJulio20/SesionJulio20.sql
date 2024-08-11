---Crear BD---

CREATE DATABASE DBREGISTRO;
GO;

USE DBREGISTRO;

--CRAR TABLAS CIUDADES----

CREATE TABLE CIUDADES (
ID INT PRIMARY KEY IDENTITY(1, 1)
, NOMBRE NVARCHAR(60) NOT NULL
, ESTADO BIT DEFAULT 1
);

GO;

CREATE TABLE PERSONAS(
    ID INT PRIMARY KEY IDENTITY(1, 1),
    NOMBRES NVARCHAR(40) NOT NULL,
    APELLIDOS NVARCHAR(40) NOT NULL,
    CIUDAD_ID INT NOT NULL FOREIGN KEY REFERENCES CIUDADES(ID),
    ACTIVO BIT DEFAULT 1
);

go
 
 /*Consultas de insertar*/

 insert into CIUDADES(NOMBRE) values ('Masaya'),
 ('Granada'),
 ('Jinotega'),
 ('Managua'),
 ('Leon');

 insert into PERSONAS(NOMBRES, APELLIDOS, CIUDAD_ID)
 values('Belen', 'Acuña', 4),
 ('Erick', 'Martinez', 4),
 ('Sergio', 'Rivas', 1),
 ('Elmer', 'Martinez', 3),
 ('Cesar', 'Gallardo', 5);

 select * from PERSONAS;
  select * from CIUDADES;


DBCC CHECKIDENT ('PERSONAS', RESEED, 0);

select id as 'Codigo', NOMBRE as 'Ciudad', estado as 'Est' from CIUDADES;

select PERSONAS.ID as Codigo, PERSONAS.NOMBRES + '' + PERSONAS.APELLIDOS
as 'Nombre Completo', CIUDADES.NOMBRE as Ciudad from PERSONAS inner join CIUDADES
on PERSONAS.CIUDAD_ID = CIUDADES.ID;

/*variables*/

declare @nombre nvarchar(40)
set @nombre = '%k%'

select * from PERSONAS where NOMBRES like @nombre

