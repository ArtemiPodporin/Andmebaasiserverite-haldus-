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



--andnete lisamine
--DDL - date definition language
--DML - date maniplation language

INSERT INTO inimene (nimi, synniag, telefon, pikkus, opilaskodu)
VALUES
('Mati Kaskkk', '2041-12-30', '1261536', 94.5, 0),
('Mati Kaskkkkk', '2031-12-30', '1263546', 92.5, 0),
('Mati Kaskkkkkkk', '2051-12-30', '1361546', 91.5, 0),
('Mati Kaskkkkkkkkk', '2061-12-30', '1261346', 96.5, 0)

select * from inimene;
delete from inimene

where inimeneID=3;
