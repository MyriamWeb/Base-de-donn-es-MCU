-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 27 juil. 2021 à 14:07
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bdd mcu`
--

-- --------------------------------------------------------

--
-- Structure de la table `actors`
--

DROP TABLE IF EXISTS `actors`;
CREATE TABLE IF NOT EXISTS `actors` (
  `id_actor` int(11) NOT NULL,
  `last_name` tinytext NOT NULL,
  `first_name` tinytext NOT NULL,
  `date_Birth` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_actor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `actors`
--

INSERT INTO `actors` (`id_actor`, `last_name`, `first_name`, `date_Birth`, `created_at`, `updated_at`) VALUES
(1, 'Downey_Jr.', 'Robert', '1965-04-04', '2021-07-26 11:56:01', '2021-07-26 13:56:01'),
(2, 'Hemsworth', 'Chris', '1983-08-11', '2021-07-26 11:56:01', '2021-07-26 13:56:01'),
(3, 'Pratt', 'Christopher Michael', '1979-06-21', '2021-07-26 11:56:01', '2021-07-26 13:56:01'),
(4, 'Rudd', 'Paul Stephen', '1969-04-06', '2021-07-26 11:56:01', '2021-07-26 13:56:01'),
(5, 'Cumberbatch', 'Benedict', '1976-06-19', '2021-07-26 11:56:01', '2021-07-26 13:56:01'),
(6, 'Larson', 'Brie', '1989-10-01', '2021-07-26 11:56:01', '2021-07-26 13:56:01');

-- --------------------------------------------------------

--
-- Structure de la table `intermediaries`
--

DROP TABLE IF EXISTS `intermediaries`;
CREATE TABLE IF NOT EXISTS `intermediaries` (
  `id_actor` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL,
  KEY `Id_actors` (`id_actor`),
  KEY `Id_movie` (`id_movie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `intermediaries`
--

INSERT INTO `intermediaries` (`id_actor`, `id_movie`) VALUES
(6, 6),
(5, 5),
(4, 4),
(3, 1),
(2, 2),
(1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `movies`
--

DROP TABLE IF EXISTS `movies`;
CREATE TABLE IF NOT EXISTS `movies` (
  `id_movie` int(11) NOT NULL,
  `title` tinytext NOT NULL,
  `director` tinytext NOT NULL,
  `release_date` tinytext NOT NULL,
  `duration` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_movie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `movies`
--

INSERT INTO `movies` (`id_movie`, `title`, `director`, `release_date`, `duration`, `created_at`, `updated_at`) VALUES
(1, 'Guardians_of_the_Galaxy', 'James Gunn', '2014', 122, '2021-07-26 11:55:37', '2021-07-26 13:55:37'),
(2, 'Thor', 'Kenneth Branagh', '2011', 120, '2021-07-26 11:55:37', '2021-07-27 15:34:57'),
(3, 'Iron_man', 'Jon Favreau', '2008', 126, '2021-07-26 11:55:37', '2021-07-26 13:55:37'),
(4, 'Ant_man', 'Peyton Reed', '2015', 117, '2021-07-26 11:55:37', '2021-07-26 13:55:37'),
(5, 'Doctor_Strange', 'Scott Derrickson', '2016', 115, '2021-07-26 11:55:37', '2021-07-26 13:55:37'),
(6, 'Captain_Marvel', 'Anna Boden and Ryan Fleck', '2019', 124, '2021-07-26 11:55:37', '2021-07-26 13:55:37'),
(100, 'The Marvels', 'Nia DaCosta', '2022-11-09', 130, '2021-07-27 13:14:21', '2021-07-27 15:14:21');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `intermediaries`
--
ALTER TABLE `intermediaries`
  ADD CONSTRAINT `Id_actors` FOREIGN KEY (`id_actor`) REFERENCES `actors` (`id_actor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Id_movie` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`id_movie`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
