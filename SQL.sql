--kommentaar 
--SQL SERVER Managment Stuudio
--Server Name: (localdb)\mssqllocaldb
--Authentification 2 tüüpi:
--1. Windows Aunt - localdb admini õigused
--2. SQL Server Auth - kontrollida varem tehtu


CREATE DATABASE PodporinLOGITpv23;
USE PodporinLOGITpv23;

--tabeli loomine 
CREATE TABLE inimene(
inineneID int Primary Key identity(1,1), 
nimi varchar(50) unique, 
synniag date,
telefon char (12),
pikkus decimal(5,2),
opilaskodu bit 
);

SELECT * FROM inimene;

--table kustutamine
DROP table inimene;
