-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  mer. 24 mars 2021 à 15:14
-- Version du serveur :  5.7.28
-- Version de PHP :  7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mangatheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_880E0D76F85E0677` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id`, `username`, `roles`, `password`) VALUES
(1, 'teetjy', '{\"role\": \"ROLE_ADMIN\"}', '$argon2id$v=19$m=65536,t=4,p=1$TThwNU1wNHdkaDFOU2tGRw$TObMd6qToxnaA5wWgOB/ZSgYUvqZn6eRlwYx0IVwFWQ');

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

DROP TABLE IF EXISTS `auteur`;
CREATE TABLE IF NOT EXISTS `auteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`id`, `nom`) VALUES
(1, 'Masashi Kishimoto');

-- --------------------------------------------------------

--
-- Structure de la table `cathegorie`
--

DROP TABLE IF EXISTS `cathegorie`;
CREATE TABLE IF NOT EXISTS `cathegorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cathegorie`
--

INSERT INTO `cathegorie` (`id`, `nom`) VALUES
(1, 'Shônen');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210319131031', '2021-03-19 13:10:35', 3437),
('DoctrineMigrations\\Version20210319134006', '2021-03-19 13:40:09', 569),
('DoctrineMigrations\\Version20210324141437', '2021-03-24 14:14:54', 680),
('DoctrineMigrations\\Version20210324151312', '2021-03-24 15:13:16', 457);

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

DROP TABLE IF EXISTS `editeur`;
CREATE TABLE IF NOT EXISTS `editeur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `editeur`
--

INSERT INTO `editeur` (`id`, `nom`) VALUES
(1, 'Kana');

-- --------------------------------------------------------

--
-- Structure de la table `manga`
--

DROP TABLE IF EXISTS `manga`;
CREATE TABLE IF NOT EXISTS `manga` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serie_id` int(11) DEFAULT NULL,
  `auteur_id` int(11) NOT NULL,
  `nb_page` int(11) NOT NULL,
  `prix_manga` decimal(5,2) NOT NULL,
  `desc_manga` mediumtext COLLATE utf8mb4_unicode_ci,
  `chemin_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tome` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_765A9E03D94388BD` (`serie_id`),
  KEY `IDX_765A9E0360BB6FE6` (`auteur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `manga`
--

INSERT INTO `manga` (`id`, `serie_id`, `auteur_id`, `nb_page`, `prix_manga`, `desc_manga`, `chemin_image`, `tome`, `date`) VALUES
(1, 1, 1, 196, '3.00', '<div>test test test</div>', 'Naruto-Tome-1-avec-Sticker-euro.jpg', 1, NULL),
(3, 2, 1, 65, '58.00', '<div>fg</div>', 'Myheroacademia.jpg', 0, NULL),
(4, 3, 1, 24, '6.00', '<div>213</div>', 'Naruto-Tome-1-avec-Sticker-euro.jpg', 0, NULL),
(5, 4, 1, 45, '6.00', '<div>54</div>', 'Naruto-Tome-1-avec-Sticker-euro.jpg', 0, NULL),
(6, 5, 1, 45, '0.00', '<div>fgh</div>', 'Naruto-Tome-1-avec-Sticker-euro.jpg', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `serie`
--

DROP TABLE IF EXISTS `serie`;
CREATE TABLE IF NOT EXISTS `serie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serie_editeur_id` int(11) DEFAULT NULL,
  `serie_cathegorie_id` int(11) DEFAULT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etat` tinyint(1) NOT NULL,
  `nombres_de_tomes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AA3A93346283F725` (`serie_editeur_id`),
  KEY `IDX_AA3A93342C241E0B` (`serie_cathegorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `serie`
--

INSERT INTO `serie` (`id`, `serie_editeur_id`, `serie_cathegorie_id`, `nom`, `etat`, `nombres_de_tomes`) VALUES
(1, 1, 1, 'Naruto', 1, 50),
(2, 1, 1, 'test', 1, 65),
(3, 1, 1, 'test2', 0, 645),
(4, 1, 1, 'test3', 0, 654),
(5, 1, 1, 'test4', 0, 65),
(6, 1, 1, 'test5', 0, 32),
(7, 1, 1, 'test6', 1, 54),
(8, 1, 1, 'test7', 1, 65),
(9, 1, 1, 'test8', 0, 65),
(10, 1, 1, 'test9', 0, 65),
(11, 1, 1, 'test10', 0, 654);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `manga`
--
ALTER TABLE `manga`
  ADD CONSTRAINT `FK_765A9E0360BB6FE6` FOREIGN KEY (`auteur_id`) REFERENCES `auteur` (`id`),
  ADD CONSTRAINT `FK_765A9E03D94388BD` FOREIGN KEY (`serie_id`) REFERENCES `serie` (`id`);

--
-- Contraintes pour la table `serie`
--
ALTER TABLE `serie`
  ADD CONSTRAINT `FK_AA3A93342C241E0B` FOREIGN KEY (`serie_cathegorie_id`) REFERENCES `cathegorie` (`id`),
  ADD CONSTRAINT `FK_AA3A93346283F725` FOREIGN KEY (`serie_editeur_id`) REFERENCES `editeur` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
