-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Mar 23 Juin 2015 à 13:53
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

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
-- Structure de la table `auto_evaluation`
--

CREATE TABLE IF NOT EXISTS `auto_evaluation` (
  `ID_evaluation` varchar(15) NOT NULL,
  `ID_competence` varchar(50) NOT NULL,
  `Mark` int(11) NOT NULL,
  `ID_user_evaluator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `ID_category` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `cross_evaluation`
--

CREATE TABLE IF NOT EXISTS `cross_evaluation` (
  `ID` varchar(15) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Reference` varchar(50) NOT NULL,
  `ID_team` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cross_evaluation_mark`
--

CREATE TABLE IF NOT EXISTS `cross_evaluation_mark` (
  `ID_evaluation` varchar(15) NOT NULL,
  `ID_user_evaluator` varchar(15) NOT NULL,
  `ID_user_evaluated` int(11) NOT NULL,
  `Mark` int(11) NOT NULL,
  `ID_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE IF NOT EXISTS `evaluation` (
  `ID_evaluation` varchar(15) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Date` date NOT NULL
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
  `IdTeam` int(11) NOT NULL AUTO_INCREMENT,
  `IdAPP` varchar(15) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `CreationDate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdTeam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
('4240', 'Admin', 'tutu', 'toto.tutu@isep.fr', 1, 0, 1, 0, 1),
('4241', 'Module Manager', 'tutu', 'toto.tutu@isep.fr', 1, 1, 0, 1, 0),
('4242', 'Tutor', 'tutu', 'toto.tutu@isep.fr', 1, 0, 1, 0, 0),
('4243', 'Student', 'tutu', 'toto.tutu@isep.fr', 1, 1, 0, 0, 0),
('4244', 'TestAffect', 'tutu', 'toto.tutu@isep.fr', 1, 0, 0, 0, 0);

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
