-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Lun 27 Avril 2015 à 14:23
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `bddgapp`
--
CREATE DATABASE IF NOT EXISTS `bddgapp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bddgapp`;

-- --------------------------------------------------------

--
-- Structure de la table `appsession`
--

CREATE TABLE IF NOT EXISTS `appsession` (
  `IdAPP` int(15) NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) NOT NULL,
  `StartDate` varchar(20) NOT NULL,
  `EndDate` varchar(20) NOT NULL,
  PRIMARY KEY (`IdAPP`),
  UNIQUE KEY `IdAPP` (`IdAPP`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `appsession`
--

INSERT INTO `appsession` (`IdAPP`, `Type`, `StartDate`, `EndDate`) VALUES
(1, 'testAPP', '26/12/1993', '26/12/1015');

-- --------------------------------------------------------

--
-- Structure de la table `app_competencies`
--

CREATE TABLE IF NOT EXISTS `app_competencies` (
  `IdAPP` varchar(15) NOT NULL,
  `idCompetencies` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `competencies`
--

CREATE TABLE IF NOT EXISTS `competencies` (
  `IdComp` int(15) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `IsNecessary` varchar(5) NOT NULL,
  `Category` varchar(25) NOT NULL,
  `idMother` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`IdComp`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Contenu de la table `competencies`
--

INSERT INTO `competencies` (`IdComp`, `Name`, `Description`, `IsNecessary`, `Category`, `idMother`) VALUES
(32, 'test45', 'null', 'false', '', 'none'),
(33, 'test45', 'null', 'false', '', 'none'),
(34, 'esy', 'null', 'false', '', '33'),
(35, 'eflkh', 'null', 'false', '', 'none'),
(38, 'eflkh', 'null', 'false', '', 'none'),
(39, 'trololo', 'null', 'false', '', '32'),
(40, 'trololo2', 'null', 'false', '', '32'),
(41, 'rty', 'null', 'false', '', 'none'),
(42, 'titi', 'null', 'true', '', '41'),
(43, 'testpres', 'null', 'true', '', '41'),
(44, 'testCategory', 'null', 'true', 'Project managment', '32');

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `IdMedia` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `IdTeam` varchar(15) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `CreationDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `team_media`
--

CREATE TABLE IF NOT EXISTS `team_media` (
  `IdTeam` varchar(15) NOT NULL,
  `idMedia` varchar(15) NOT NULL,
  `for` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `team_user`
--

CREATE TABLE IF NOT EXISTS `team_user` (
  `iduser` int(11) NOT NULL,
  `idteam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `IdUtilisateur` varchar(15) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Email` varchar(75) NOT NULL,
  `Actif` tinyint(1) NOT NULL,
  `IsStudent` tinyint(1) NOT NULL,
  `IsTutor` tinyint(1) NOT NULL,
  `IsModuleManager` tinyint(1) NOT NULL,
  `IsAdmin` tinyint(1) NOT NULL,
  PRIMARY KEY (`IdUtilisateur`),
  UNIQUE KEY `IdUtilisateur` (`IdUtilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`IdUtilisateur`, `Nom`, `Prenom`, `Email`, `Actif`, `IsStudent`, `IsTutor`, `IsModuleManager`, `IsAdmin`) VALUES
('4242', 'Admin', 'Admin', '', 1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `user_appsession`
--

CREATE TABLE IF NOT EXISTS `user_appsession` (
  `IdAPP` varchar(15) NOT NULL,
  `IdUtilisateur` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `user_media`
--

CREATE TABLE IF NOT EXISTS `user_media` (
  `idUser` varchar(15) NOT NULL,
  `idMedia` varchar(15) NOT NULL,
  `for` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
