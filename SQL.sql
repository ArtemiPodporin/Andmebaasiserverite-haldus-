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




--tabel elukoht 

CREATE TABLE elukoht(
elukohtID int primary key identity(1,1),
elukoht varchar(50) unique,
maakond varchar(50)
);

select * from elukoht;

insert into elukoht(elukoht, maakond)
values ('Tartuma', 'Harjumaa'),
('Parnu', 'Harjumaa');



ter table inimene add elukohtID int;
select * from inimene;

Alter table inimene add constraint fk_elukoht
foreign key (elukohtID) references elukoht (elukohtID);

select * from elukoht;
 select * from inimene;


CREATE TABLE auto(
autoID int primary key identity(1,1),
autoNR varchar(50) unique,
mudell varchar(50),
mark varchar(50),
v_aasta date
);

select * from auto;

INSERT INTO auto ( autoNR, mudell, mark, v_aasta)
VALUES ('241fjn',  'M5', 'BMW','2014'), ('587jkl', 'E350', 'MERS','2006');

DROP table auto;


select * from inimene;
select * from auto;

alter table inimene add autoID int;

Alter table inimene add constraint fk_auto
foreign key (autoID) references auto (autoID);


INSERT INTO inimene (nimi, synniag, telefon, pikkus, opilaskodu, autoID)
VALUES
('Mati Kaskkk', '2041-12-30', '1261536', 94.5, 0, 2);
