-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 27, 2015 at 09:34 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bddgapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `appsession`
--

CREATE TABLE IF NOT EXISTS `appsession` (
  `IdAPP` int(15) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `StartDate` varchar(20) NOT NULL,
  `EndDate` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appsession`
--

INSERT INTO `appsession` (`IdAPP`, `Type`, `StartDate`, `EndDate`) VALUES
(1, 'testAPP', '26/12/1993', '26/12/1015');

-- --------------------------------------------------------

--
-- Table structure for table `app_competencies`
--

CREATE TABLE IF NOT EXISTS `app_competencies` (
  `IdAPP` varchar(15) NOT NULL,
  `idCompetencies` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auto_evaluation`
--

CREATE TABLE IF NOT EXISTS `auto_evaluation` (
  `ID_evaluation` varchar(15) NOT NULL,
  `ID_competence` varchar(50) NOT NULL,
  `Mark` int(11) NOT NULL,
  `ID_user_evaluator` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `ID_category` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `competencies`
--

CREATE TABLE IF NOT EXISTS `competencies` (
  `IdComp` int(15) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `IsNecessary` varchar(5) NOT NULL,
  `Category` varchar(25) NOT NULL,
  `idMother` varchar(15) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `competencies`
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
-- Table structure for table `cross_evaluation`
--

CREATE TABLE IF NOT EXISTS `cross_evaluation` (
  `ID` varchar(15) DEFAULT NULL,
  `Name` varchar(50) NOT NULL,
  `Reference` varchar(50) NOT NULL,
  `ID_team` int(11) NOT NULL,
  `Date` date NOT NULL,
  `Comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cross_evaluation`
--

INSERT INTO `cross_evaluation` (`ID`, `Name`, `Reference`, `ID_team`, `Date`, `Comment`) VALUES
('0001', 'Evaluation1', '', 1, '2015-05-12', ''),
('0002', 'Evaluation2', '', 2, '2015-05-11', '');

-- --------------------------------------------------------

--
-- Table structure for table `cross_evaluation_mark`
--

CREATE TABLE IF NOT EXISTS `cross_evaluation_mark` (
  `ID_evaluation` varchar(15) NOT NULL,
  `ID_user_evaluator` varchar(15) NOT NULL,
  `ID_user_evaluated` int(11) NOT NULL,
  `Mark` int(11) NOT NULL,
  `ID_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cross_evaluation_mark`
--

INSERT INTO `cross_evaluation_mark` (`ID_evaluation`, `ID_user_evaluator`, `ID_user_evaluated`, `Mark`, `ID_category`) VALUES
('0001', '4240', 0, 0, 0),
('0001', '4241', 0, 0, 0),
('0001', '4242', 0, 0, 0),
('0002', '4243', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `evaluation`
--

CREATE TABLE IF NOT EXISTS `evaluation` (
  `ID_evaluation` varchar(15) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `IdMedia` varchar(15) NOT NULL,
  `name` varchar(50) NOT NULL,
  `url` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `IdTeam` int(11) NOT NULL,
  `IdAPP` varchar(15) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `CreationDate` varchar(20) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`IdTeam`, `IdAPP`, `Name`, `CreationDate`) VALUES
(1, '1', 'Team1', NULL),
(2, '2', 'Team2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `team_media`
--

CREATE TABLE IF NOT EXISTS `team_media` (
  `IdTeam` varchar(15) NOT NULL,
  `idMedia` varchar(15) NOT NULL,
  `for` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

CREATE TABLE IF NOT EXISTS `team_user` (
  `iduser` int(11) NOT NULL,
  `idteam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team_user`
--

INSERT INTO `team_user` (`iduser`, `idteam`) VALUES
(4240, 1),
(4241, 1),
(4242, 1),
(4243, 1),
(4244, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user`
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
-- Dumping data for table `user`
--

INSERT INTO `user` (`IdUtilisateur`, `Nom`, `Prenom`, `Email`, `Actif`, `IsStudent`, `IsTutor`, `IsModuleManager`, `IsAdmin`) VALUES
('4240', 'tata', 'tutu', 'toto.tutu@isep.fr', 1, 0, 1, 0, 0),
('4241', 'tata', 'tutu', 'toto.tutu@isep.fr', 1, 0, 1, 0, 0),
('4242', 'tata', 'tutu', 'toto.tutu@isep.fr', 1, 1, 0, 0, 0),
('4243', 'tata', 'tutu', 'toto.tutu@isep.fr', 1, 1, 0, 0, 0),
('4245', 'tata', 'tutu', 'toto.tutu@isep.fr', 1, 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_appsession`
--

CREATE TABLE IF NOT EXISTS `user_appsession` (
  `IdAPP` varchar(15) NOT NULL,
  `IdUtilisateur` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_media`
--

CREATE TABLE IF NOT EXISTS `user_media` (
  `idUser` varchar(15) NOT NULL,
  `idMedia` varchar(15) NOT NULL,
  `for` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appsession`
--
ALTER TABLE `appsession`
  ADD PRIMARY KEY (`IdAPP`),
  ADD UNIQUE KEY `IdAPP` (`IdAPP`);

--
-- Indexes for table `competencies`
--
ALTER TABLE `competencies`
  ADD PRIMARY KEY (`IdComp`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`IdTeam`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`IdUtilisateur`),
  ADD UNIQUE KEY `IdUtilisateur` (`IdUtilisateur`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appsession`
--
ALTER TABLE `appsession`
  MODIFY `IdAPP` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `competencies`
--
ALTER TABLE `competencies`
  MODIFY `IdComp` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `IdTeam` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
