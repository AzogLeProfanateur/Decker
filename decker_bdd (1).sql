-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-decker.alwaysdata.net
-- Generation Time: Jun 06, 2024 at 04:54 PM
-- Server version: 10.6.16-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `decker_bdd`
--

-- --------------------------------------------------------

--
-- Table structure for table `Appartenir`
--

CREATE TABLE `Appartenir` (
  `NumForm` int(11) NOT NULL,
  `IdSujet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Article`
--

CREATE TABLE `Article` (
  `IdArticle` int(11) NOT NULL,
  `NomArticle` varchar(50) DEFAULT NULL,
  `ContenuArticle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Article`
--

INSERT INTO `Article` (`IdArticle`, `NomArticle`, `ContenuArticle`) VALUES
(1, 'sql', 'Pour insérer des données en base de donnée on utilise la clause sql INSERT INTO. Celle ci s\'utilise avec la syntaxe suivante : insert into table values(champ1,chammp2)');

-- --------------------------------------------------------

--
-- Table structure for table `Carte`
--

CREATE TABLE `Carte` (
  `IdCarte` int(11) NOT NULL,
  `MatriculeEmploye` varchar(50) DEFAULT NULL,
  `IdSujet` int(11) NOT NULL,
  `LibelCarte` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Carte`
--

INSERT INTO `Carte` (`IdCarte`, `MatriculeEmploye`, `IdSujet`, `LibelCarte`) VALUES
(3, 'EMP001', 1, 'SELECT'),
(4, 'EMP001', 1, 'INSERT INTO'),
(5, 'EMP001', 1, 'UPDATE'),
(6, 'EMP002', 2, 'Question 1');

-- --------------------------------------------------------

--
-- Table structure for table `Concerner`
--

CREATE TABLE `Concerner` (
  `IdArticle` int(11) NOT NULL,
  `IdSujet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Deck`
--

CREATE TABLE `Deck` (
  `IdDeck` int(11) NOT NULL,
  `NomDeck` varchar(50) DEFAULT NULL,
  `MatriculeEmploye` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Deck`
--

INSERT INTO `Deck` (`IdDeck`, `NomDeck`, `MatriculeEmploye`) VALUES
(8, 'SQL', 'EMP001'),
(10, 'Les bases du PHP', 'EMP002'),
(40, 'JAVA', 'EMP001');

-- --------------------------------------------------------

--
-- Table structure for table `Employe`
--

CREATE TABLE `Employe` (
  `MatriculeEmploye` varchar(50) NOT NULL,
  `Nom` varchar(50) DEFAULT NULL,
  `Prenom` varchar(50) DEFAULT NULL,
  `DateNaiss` date DEFAULT NULL,
  `Sexe` varchar(10) DEFAULT NULL,
  `Mdp` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Employe`
--

INSERT INTO `Employe` (`MatriculeEmploye`, `Nom`, `Prenom`, `DateNaiss`, `Sexe`, `Mdp`) VALUES
('EMP001', 'Perez', 'Edouard', '2004-09-23', 'Masculin', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'),
('EMP002', 'Leperre', 'Tristan', '2002-10-31', 'Masculin', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3');

-- --------------------------------------------------------

--
-- Table structure for table `Entrainer`
--

CREATE TABLE `Entrainer` (
  `MatriculeEmploye` varchar(50) NOT NULL,
  `IdDeck` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Formation`
--

CREATE TABLE `Formation` (
  `NumForm` int(11) NOT NULL,
  `LibelForm` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Posseder`
--

CREATE TABLE `Posseder` (
  `IdDeck` int(11) NOT NULL,
  `IdCarte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Posseder`
--

INSERT INTO `Posseder` (`IdDeck`, `IdCarte`) VALUES
(8, 3),
(8, 4),
(10, 5),
(10, 6);

-- --------------------------------------------------------

--
-- Table structure for table `Produire`
--

CREATE TABLE `Produire` (
  `MatriculeEmploye` varchar(50) DEFAULT NULL,
  `IdArticle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Suivre`
--

CREATE TABLE `Suivre` (
  `MatriculeEmploye` varchar(50) NOT NULL,
  `NumForm` int(11) NOT NULL,
  `DateFormation` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Sujet`
--

CREATE TABLE `Sujet` (
  `IdSujet` int(11) NOT NULL,
  `LibelSujet` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Sujet`
--

INSERT INTO `Sujet` (`IdSujet`, `LibelSujet`) VALUES
(1, 'Base de données'),
(2, 'PHP');

-- --------------------------------------------------------

--
-- Table structure for table `Texte`
--

CREATE TABLE `Texte` (
  `IdTexte` int(11) NOT NULL,
  `IdCarte` int(11) NOT NULL,
  `Partie_Texte` varchar(255) DEFAULT NULL,
  `Numero_Ordre` int(11) NOT NULL,
  `Devine` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Texte`
--

INSERT INTO `Texte` (`IdTexte`, `IdCarte`, `Partie_Texte`, `Numero_Ordre`, `Devine`) VALUES
(1, 3, 'Pour sélectionner un champ on utilise le', 1, 0),
(2, 3, 'select', 2, 1),
(3, 5, 'Pour modifier un champ on utilise le', 1, 0),
(4, 5, 'update', 2, 1),
(9, 4, 'Pour insérer une nouvelle ligne en base de données on utilise le', 1, 0),
(10, 4, 'insert into', 2, 1),
(11, 6, 'On utilise le ', 1, 0),
(12, 6, '$', 2, 1),
(13, 6, ' pour déclarer une variable en PHP', 3, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Appartenir`
--
ALTER TABLE `Appartenir`
  ADD KEY `NumForm` (`NumForm`),
  ADD KEY `IdSujet` (`IdSujet`);

--
-- Indexes for table `Article`
--
ALTER TABLE `Article`
  ADD PRIMARY KEY (`IdArticle`);

--
-- Indexes for table `Carte`
--
ALTER TABLE `Carte`
  ADD PRIMARY KEY (`IdCarte`),
  ADD KEY `IdSujet` (`IdSujet`),
  ADD KEY `MatriculeEmploye` (`MatriculeEmploye`);

--
-- Indexes for table `Concerner`
--
ALTER TABLE `Concerner`
  ADD PRIMARY KEY (`IdArticle`,`IdSujet`),
  ADD KEY `IdSujet` (`IdSujet`);

--
-- Indexes for table `Deck`
--
ALTER TABLE `Deck`
  ADD PRIMARY KEY (`IdDeck`),
  ADD KEY `MatriculeEmploye` (`MatriculeEmploye`);

--
-- Indexes for table `Employe`
--
ALTER TABLE `Employe`
  ADD PRIMARY KEY (`MatriculeEmploye`);

--
-- Indexes for table `Entrainer`
--
ALTER TABLE `Entrainer`
  ADD PRIMARY KEY (`MatriculeEmploye`,`IdDeck`),
  ADD KEY `IdDeck` (`IdDeck`);

--
-- Indexes for table `Formation`
--
ALTER TABLE `Formation`
  ADD PRIMARY KEY (`NumForm`);

--
-- Indexes for table `Posseder`
--
ALTER TABLE `Posseder`
  ADD PRIMARY KEY (`IdDeck`,`IdCarte`),
  ADD KEY `IdCarte` (`IdCarte`);

--
-- Indexes for table `Produire`
--
ALTER TABLE `Produire`
  ADD KEY `MatriculeEmploye` (`MatriculeEmploye`),
  ADD KEY `IdArticle` (`IdArticle`);

--
-- Indexes for table `Suivre`
--
ALTER TABLE `Suivre`
  ADD PRIMARY KEY (`MatriculeEmploye`,`NumForm`),
  ADD KEY `NumForm` (`NumForm`);

--
-- Indexes for table `Sujet`
--
ALTER TABLE `Sujet`
  ADD PRIMARY KEY (`IdSujet`);

--
-- Indexes for table `Texte`
--
ALTER TABLE `Texte`
  ADD PRIMARY KEY (`IdTexte`),
  ADD KEY `IdCarte` (`IdCarte`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Article`
--
ALTER TABLE `Article`
  MODIFY `IdArticle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Carte`
--
ALTER TABLE `Carte`
  MODIFY `IdCarte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Deck`
--
ALTER TABLE `Deck`
  MODIFY `IdDeck` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `Formation`
--
ALTER TABLE `Formation`
  MODIFY `NumForm` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Sujet`
--
ALTER TABLE `Sujet`
  MODIFY `IdSujet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Texte`
--
ALTER TABLE `Texte`
  MODIFY `IdTexte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Appartenir`
--
ALTER TABLE `Appartenir`
  ADD CONSTRAINT `Appartenir_ibfk_1` FOREIGN KEY (`NumForm`) REFERENCES `Formation` (`NumForm`),
  ADD CONSTRAINT `Appartenir_ibfk_2` FOREIGN KEY (`IdSujet`) REFERENCES `Sujet` (`IdSujet`);

--
-- Constraints for table `Carte`
--
ALTER TABLE `Carte`
  ADD CONSTRAINT `Carte_ibfk_1` FOREIGN KEY (`IdSujet`) REFERENCES `Sujet` (`IdSujet`),
  ADD CONSTRAINT `Carte_ibfk_2` FOREIGN KEY (`MatriculeEmploye`) REFERENCES `Employe` (`MatriculeEmploye`);

--
-- Constraints for table `Concerner`
--
ALTER TABLE `Concerner`
  ADD CONSTRAINT `Concerner_ibfk_1` FOREIGN KEY (`IdArticle`) REFERENCES `Article` (`IdArticle`),
  ADD CONSTRAINT `Concerner_ibfk_2` FOREIGN KEY (`IdSujet`) REFERENCES `Sujet` (`IdSujet`);

--
-- Constraints for table `Deck`
--
ALTER TABLE `Deck`
  ADD CONSTRAINT `Deck_ibfk_1` FOREIGN KEY (`MatriculeEmploye`) REFERENCES `Employe` (`MatriculeEmploye`);

--
-- Constraints for table `Entrainer`
--
ALTER TABLE `Entrainer`
  ADD CONSTRAINT `Entrainer_ibfk_1` FOREIGN KEY (`MatriculeEmploye`) REFERENCES `Employe` (`MatriculeEmploye`),
  ADD CONSTRAINT `Entrainer_ibfk_2` FOREIGN KEY (`IdDeck`) REFERENCES `Deck` (`IdDeck`);

--
-- Constraints for table `Posseder`
--
ALTER TABLE `Posseder`
  ADD CONSTRAINT `Posseder_ibfk_1` FOREIGN KEY (`IdDeck`) REFERENCES `Deck` (`IdDeck`),
  ADD CONSTRAINT `Posseder_ibfk_2` FOREIGN KEY (`IdCarte`) REFERENCES `Carte` (`IdCarte`);

--
-- Constraints for table `Produire`
--
ALTER TABLE `Produire`
  ADD CONSTRAINT `Produire_ibfk_1` FOREIGN KEY (`MatriculeEmploye`) REFERENCES `Employe` (`MatriculeEmploye`),
  ADD CONSTRAINT `Produire_ibfk_2` FOREIGN KEY (`IdArticle`) REFERENCES `Article` (`IdArticle`);

--
-- Constraints for table `Suivre`
--
ALTER TABLE `Suivre`
  ADD CONSTRAINT `Suivre_ibfk_1` FOREIGN KEY (`MatriculeEmploye`) REFERENCES `Employe` (`MatriculeEmploye`),
  ADD CONSTRAINT `Suivre_ibfk_2` FOREIGN KEY (`NumForm`) REFERENCES `Formation` (`NumForm`);

--
-- Constraints for table `Texte`
--
ALTER TABLE `Texte`
  ADD CONSTRAINT `Texte_ibfk_1` FOREIGN KEY (`IdCarte`) REFERENCES `Carte` (`IdCarte`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
