-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 23 Juin 2015 à 19:15
-- Version du serveur :  5.6.24
-- Version de PHP :  5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `bddgapp`
--

-- --------------------------------------------------------

--
-- Structure de la table `appsession`
--

CREATE TABLE IF NOT EXISTS `appsession` (
  `IdAPP` int(15) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `StartDate` varchar(20) NOT NULL,
  `EndDate` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `iD_autoEvaluation` int(11) NOT NULL,
  `ID_evaluation` varchar(15) NOT NULL,
  `Id_User` int(11) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auto_evaluation_mark`
--

CREATE TABLE IF NOT EXISTS `auto_evaluation_mark` (
  `Id_auto_evaluation` varchar(15) NOT NULL,
  `ID_competence` varchar(15) NOT NULL,
  `Mark` varchar(15) NOT NULL,
  `ID_user_evaluator` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `ID_category` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `category`
--

INSERT INTO `category` (`ID_category`, `Name`) VALUES
(1, 'TeamWork'),
(2, 'Communication'),
(3, 'Project Management'),
(4, 'Design'),
(5, 'Profesionnal Skills');

-- --------------------------------------------------------

--
-- Structure de la table `competencies`
--

CREATE TABLE IF NOT EXISTS `competencies` (
  `IdComp` int(15) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `IsNecessary` varchar(5) NOT NULL,
  `Category` varchar(25) NOT NULL,
  `idMother` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `cross_evaluation`
--

CREATE TABLE IF NOT EXISTS `cross_evaluation` (
  `ID` int(15) NOT NULL,
  `id_evaluation` varchar(50) NOT NULL,
  `id_User` int(11) NOT NULL,
  `ID_team` varchar(11) NOT NULL,
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
  `IdMedia` int(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `IdTeam` int(11) NOT NULL,
  `IdAPP` varchar(15) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `CreationDate` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `team_media`
--

CREATE TABLE IF NOT EXISTS `team_media` (
  `IdTeam` varchar(15) NOT NULL,
  `idMedia` varchar(15) NOT NULL,
  `type` varchar(50) NOT NULL
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

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`IdUtilisateur`, `Nom`, `Prenom`, `Email`, `Actif`, `IsStudent`, `IsTutor`, `IsModuleManager`, `IsAdmin`) VALUES
('4240', 'Admin', 'tutu', 'toto.tutu@isep.fr', 1, 0, 1, 0, 1),
('4241', 'Module Manager', 'tutu', 'toto.tutu@isep.fr', 1, 0, 0, 1, 0),
('4242', 'Tutor', 'tutu', 'toto.tutu@isep.fr', 1, 0, 1, 0, 0),
('4243', 'Student', 'tutu', 'toto.tutu@isep.fr', 1, 1, 0, 0, 0),
('4244', 'TestAffect', 'tutu', 'toto.tutu@isep.fr', 1, 1, 0, 0, 0);

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

--
-- Index pour les tables exportées
--

--
-- Index pour la table `appsession`
--
ALTER TABLE `appsession`
  ADD PRIMARY KEY (`IdAPP`),
  ADD UNIQUE KEY `IdAPP` (`IdAPP`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ID_category`);

--
-- Index pour la table `competencies`
--
ALTER TABLE `competencies`
  ADD PRIMARY KEY (`IdComp`);

--
-- Index pour la table `cross_evaluation`
--
ALTER TABLE `cross_evaluation`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`IdMedia`);

--
-- Index pour la table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`IdTeam`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`IdUtilisateur`),
  ADD UNIQUE KEY `IdUtilisateur` (`IdUtilisateur`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `appsession`
--
ALTER TABLE `appsession`
  MODIFY `IdAPP` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `ID_category` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `competencies`
--
ALTER TABLE `competencies`
  MODIFY `IdComp` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `cross_evaluation`
--
ALTER TABLE `cross_evaluation`
  MODIFY `ID` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `media`
--
ALTER TABLE `media`
  MODIFY `IdMedia` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `team`
--
ALTER TABLE `team`
  MODIFY `IdTeam` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
