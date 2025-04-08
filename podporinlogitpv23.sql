-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Aprill 08, 2025 kell 01:39 PL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `podporinlogitpv23`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `auto`
--

CREATE TABLE `auto` (
  `autoID` int(11) NOT NULL,
  `autoNR` varchar(50) DEFAULT NULL,
  `mudell` varchar(50) DEFAULT NULL,
  `mark` varchar(50) DEFAULT NULL,
  `v_aasta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `auto`
--

INSERT INTO `auto` (`autoID`, `autoNR`, `mudell`, `mark`, `v_aasta`) VALUES
(1, '241fjn', 'M5', 'BMW', '0000-00-00'),
(2, '587jkl', 'E350', 'MERS', '0000-00-00');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `elukoht`
--

CREATE TABLE `elukoht` (
  `elukohtID` int(11) NOT NULL,
  `elukoht` varchar(50) DEFAULT NULL,
  `maakond` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `elukoht`
--

INSERT INTO `elukoht` (`elukohtID`, `elukoht`, `maakond`) VALUES
(1, 'Tartuma', 'Harjumaa'),
(2, 'Parnu', 'Harjumaa');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `inimene`
--

CREATE TABLE `inimene` (
  `inineneID` int(11) NOT NULL,
  `nimi` varchar(50) DEFAULT NULL,
  `synniag` date DEFAULT NULL,
  `telefon` char(12) DEFAULT NULL,
  `pikkus` decimal(5,2) DEFAULT NULL,
  `opilaskodu` bit(1) DEFAULT NULL,
  `elukohtID` int(11) DEFAULT NULL,
  `autoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `inimene`
--

INSERT INTO `inimene` (`inineneID`, `nimi`, `synniag`, `telefon`, `pikkus`, `opilaskodu`, `elukohtID`, `autoID`) VALUES
(1, 'Mati Kaskkk', '2041-12-30', '1261536', 94.50, b'0', NULL, NULL),
(3, 'Mati Kask', '2041-12-30', '1261536', 94.50, b'0', NULL, 2);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `loom`
--

CREATE TABLE `loom` (
  `loomID` int(11) NOT NULL,
  `nimi` varchar(50) DEFAULT NULL,
  `tyypID` int(11) DEFAULT NULL,
  `kaal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `loom`
--

INSERT INTO `loom` (`loomID`, `nimi`, `tyypID`, `kaal`) VALUES
(1, 'Kiru', NULL, 15),
(2, 'Huki', NULL, 12);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tyyp`
--

CREATE TABLE `tyyp` (
  `tyypID` int(11) NOT NULL,
  `tyyp` varchar(50) DEFAULT NULL,
  `kirjeldus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `tyyp`
--

INSERT INTO `tyyp` (`tyypID`, `tyyp`, `kirjeldus`) VALUES
(1, 'koer', 'ilus'),
(2, 'janes', 'pehme');

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`autoID`),
  ADD UNIQUE KEY `autoNR` (`autoNR`);

--
-- Indeksid tabelile `elukoht`
--
ALTER TABLE `elukoht`
  ADD PRIMARY KEY (`elukohtID`),
  ADD UNIQUE KEY `elukoht` (`elukoht`);

--
-- Indeksid tabelile `inimene`
--
ALTER TABLE `inimene`
  ADD PRIMARY KEY (`inineneID`),
  ADD UNIQUE KEY `nimi` (`nimi`),
  ADD KEY `fk_elukoht` (`elukohtID`),
  ADD KEY `fk_auto` (`autoID`);

--
-- Indeksid tabelile `loom`
--
ALTER TABLE `loom`
  ADD PRIMARY KEY (`loomID`),
  ADD UNIQUE KEY `nimi` (`nimi`);

--
-- Indeksid tabelile `tyyp`
--
ALTER TABLE `tyyp`
  ADD PRIMARY KEY (`tyypID`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `auto`
--
ALTER TABLE `auto`
  MODIFY `autoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabelile `elukoht`
--
ALTER TABLE `elukoht`
  MODIFY `elukohtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabelile `inimene`
--
ALTER TABLE `inimene`
  MODIFY `inineneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT tabelile `loom`
--
ALTER TABLE `loom`
  MODIFY `loomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT tabelile `tyyp`
--
ALTER TABLE `tyyp`
  MODIFY `tyypID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `inimene`
--
ALTER TABLE `inimene`
  ADD CONSTRAINT `fk_auto` FOREIGN KEY (`autoID`) REFERENCES `auto` (`autoID`),
  ADD CONSTRAINT `fk_elukoht` FOREIGN KEY (`elukohtID`) REFERENCES `elukoht` (`elukohtID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
