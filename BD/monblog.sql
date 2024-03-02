-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2024 at 02:25 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `monblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_auteur`
--

CREATE TABLE `t_auteur` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_bin NOT NULL,
  `prenom` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `passw` varchar(255) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `t_auteur`
--

INSERT INTO `t_auteur` (`id`, `nom`, `prenom`, `email`, `passw`) VALUES
(7, 'Zbair', 'Youness', 'anayouness52@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055'),
(8, 'zbair', 'jonas', 'admin01@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055'),
(11, 'Zbair', 'Youness', 'youzbair@outlook.com', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Table structure for table `t_billet`
--

CREATE TABLE `t_billet` (
  `BIL_ID` int(11) NOT NULL,
  `BIL_DATE` datetime NOT NULL,
  `BIL_TITRE` varchar(100) NOT NULL,
  `BIL_CONTENU` text NOT NULL,
  `auteurId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_billet`
--

INSERT INTO `t_billet` (`BIL_ID`, `BIL_DATE`, `BIL_TITRE`, `BIL_CONTENU`, `auteurId`) VALUES
(1, '2024-02-18 17:53:40', 'Premier billet', 'Bonjour monde ! Ceci est le premier billet sur mon blog.', 7),
(2, '2024-02-18 17:53:40', 'Au travail', 'Il faut enrichir ce blog dès maintenant.', 7),
(10, '2024-03-02 14:16:58', 'srjhsr', 'fvsdfgsdfgv', 11),
(11, '2024-03-02 14:23:21', 'aeahetht', 'ethjaetj', 11);

-- --------------------------------------------------------

--
-- Table structure for table `t_commentaire`
--

CREATE TABLE `t_commentaire` (
  `COM_ID` int(11) NOT NULL,
  `COM_DATE` datetime NOT NULL,
  `COM_AUTEUR` varchar(100) NOT NULL,
  `COM_CONTENU` varchar(200) NOT NULL,
  `BIL_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `t_commentaire`
--

INSERT INTO `t_commentaire` (`COM_ID`, `COM_DATE`, `COM_AUTEUR`, `COM_CONTENU`, `BIL_ID`) VALUES
(1, '2024-02-18 17:53:40', 'A. Nonyme', 'Bravo pour ce début', 1),
(2, '2024-02-18 17:53:40', 'Moi', 'Merci ! Je vais continuer sur ma lancée', 1),
(8, '2024-03-02 12:44:46', 'dfd', 'dfgdgedg', 2),
(9, '2024-03-02 12:54:16', '15', 'ghedh', 2),
(10, '2024-03-02 13:55:32', 'fgsfgs', 'dfasdfsdf', 2),
(11, '2024-03-02 13:58:38', 'youzbair@outlook.com', 'dcfscf', 1),
(12, '2024-03-02 14:23:11', 'youzbair@outlook.com', 'nrgzhrg', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_auteur`
--
ALTER TABLE `t_auteur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_billet`
--
ALTER TABLE `t_billet`
  ADD PRIMARY KEY (`BIL_ID`),
  ADD KEY `auteurId` (`auteurId`);

--
-- Indexes for table `t_commentaire`
--
ALTER TABLE `t_commentaire`
  ADD PRIMARY KEY (`COM_ID`),
  ADD KEY `fk_com_bil` (`BIL_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_auteur`
--
ALTER TABLE `t_auteur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `t_billet`
--
ALTER TABLE `t_billet`
  MODIFY `BIL_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `t_commentaire`
--
ALTER TABLE `t_commentaire`
  MODIFY `COM_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_billet`
--
ALTER TABLE `t_billet`
  ADD CONSTRAINT `t_billet_ibfk_1` FOREIGN KEY (`auteurId`) REFERENCES `t_auteur` (`id`);

--
-- Constraints for table `t_commentaire`
--
ALTER TABLE `t_commentaire`
  ADD CONSTRAINT `fk_com_bil` FOREIGN KEY (`BIL_ID`) REFERENCES `t_billet` (`BIL_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
