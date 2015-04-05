-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Dim 05 Avril 2015 à 14:09
-- Version du serveur: 5.6.12-log
-- Version de PHP: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `BDDGAPP`
--
CREATE DATABASE IF NOT EXISTS `BDDGAPP` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `BDDGAPP`;

-- --------------------------------------------------------

--
-- Structure de la table `appsession`
--

CREATE TABLE IF NOT EXISTS `appsession` (
  `IdAPP` varchar(15) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `IsAdmin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
