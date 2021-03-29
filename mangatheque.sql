-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 26 mars 2021 à 15:01
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mangatheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `auteur`
--

INSERT INTO `auteur` (`id`, `nom`) VALUES
(1, 'Masashi Kishimoto'),
(2, 'Haruichi Furudate'),
(3, 'Takeshi Hinata'),
(4, 'Tadatoshi Fujimaki'),
(5, 'Tite Kubo'),
(6, 'Yūki Tabata'),
(7, 'Akira Toriyama'),
(8, 'Kōhei Horikoshi');

-- --------------------------------------------------------

--
-- Structure de la table `cathegorie`
--

DROP TABLE IF EXISTS `cathegorie`;
CREATE TABLE IF NOT EXISTS `cathegorie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
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
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `editeur`
--

INSERT INTO `editeur` (`id`, `nom`) VALUES
(1, 'Kana'),
(2, 'Glenat'),
(3, 'Ki-oon'),
(4, 'Kaze');

-- --------------------------------------------------------

--
-- Structure de la table `manga`
--

DROP TABLE IF EXISTS `manga`;
CREATE TABLE IF NOT EXISTS `manga` (
  `id` int NOT NULL AUTO_INCREMENT,
  `serie_id` int DEFAULT NULL,
  `auteur_id` int NOT NULL,
  `nb_page` int NOT NULL,
  `prix_manga` decimal(5,2) NOT NULL,
  `desc_manga` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `chemin_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tome` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_765A9E03D94388BD` (`serie_id`),
  KEY `IDX_765A9E0360BB6FE6` (`auteur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `manga`
--

INSERT INTO `manga` (`id`, `serie_id`, `auteur_id`, `nb_page`, `prix_manga`, `desc_manga`, `chemin_image`, `tome`, `date`) VALUES
(1, 1, 1, 196, '5.00', '<div><a href=\"https://fr.wikipedia.org/wiki/Naruto_Uzumaki\"><strong>Naruto</strong></a> est un jeune orphelin du village de<strong> </strong><a href=\"https://fr.wikipedia.org/wiki/G%C3%A9opolitique_du_monde_de_Naruto#Konoha\"><strong>Konoha</strong></a>. Possédant en lui le démon renard <a href=\"https://fr.wikipedia.org/wiki/D%C3%A9mons_%C3%A0_queues#Ky%C3%BBbi\"><strong>Kyûbi</strong></a> qui a ravagé le village au moment de sa naissance et a été scellé en lui, il est rejeté par les autres villageois, et fait de nombreuses frasques pour tenter de se faire remarquer. Il étudie les <a href=\"https://fr.wikipedia.org/wiki/Univers_de_Naruto#Jutsu\">arts ninjas</a> à l’<a href=\"https://fr.wikipedia.org/wiki/Univers_de_Naruto#Acad%C3%A9mie_militaire\">académie du village</a>, mais est le seul élève qui ne parvient pas à obtenir le grade de <a href=\"https://fr.wikipedia.org/wiki/Univers_de_Naruto#Genin\"><em>genin</em></a>. Un de ses professeurs, <a href=\"https://fr.wikipedia.org/wiki/Personnages_secondaires_du_Pays_du_Feu#Mizuki_T%C3%B4ji\">Mizuki</a> décide alors de profiter de son ressentiment pour lui faire voler le rouleau des <a href=\"https://fr.wikipedia.org/wiki/Univers_de_Naruto#Kinjutsu\">techniques interdites</a> conservé dans le bureau du chef du village, le <a href=\"https://fr.wikipedia.org/wiki/Personnages_secondaires_du_Pays_du_Feu#Hokage\"><em>Hokage</em></a>. Parti seul dans la forêt, il parvient à apprendre la première technique du rouleau, le « <a href=\"https://fr.wikipedia.org/wiki/Naruto_Uzumaki#Techniques\">Multi clonage</a> ». Son autre professeur, <a href=\"https://fr.wikipedia.org/wiki/Personnages_secondaires_du_Pays_du_Feu#Iruka_Umino\">Iruka</a> le retrouve, mais ils sont attaqués par Mizuki. Mizuki dévoile à Naruto qu’il est possédé par le démon renard et que c\'est pour ça qu’il est rejeté, mais lorsque Naruto comprend qu’Iruka ne le rejette pas et reconnaît sa valeur, il défait Mizuki avec sa nouvelle technique et reçoit son <a href=\"https://fr.wikipedia.org/wiki/Univers_de_Naruto#La_panoplie_du_ninja\">bandeau frontal</a>, signe qu’il est un ninja à part entière.</div><div>Lors de sa première journée en tant que <em>genin</em>, il est mis dans une équipe de trois avec <a href=\"https://fr.wikipedia.org/wiki/Sasuke_Uchiwa\">Sasuke</a>, le petit génie de la promotion, et <a href=\"https://fr.wikipedia.org/wiki/Sakura_Haruno\">Sakura</a>, une fille dont il est amoureux, mais qui n’a d’yeux que pour Sasuke et méprise Naruto. Ils sont pris en charge par <a href=\"https://fr.wikipedia.org/wiki/Kakashi_Hatake\">Kakashi</a>, un <a href=\"https://fr.wikipedia.org/wiki/Univers_de_Naruto#J%C5%8Dnin\"><em>jōnin</em></a> qui leur fait passer un test pour leur apprendre la valeur du travail en équipe…</div>', 'Naruto-Tome-1-avec-Sticker-euro.jpg', 1, '2002-03-09 00:00:00'),
(7, 1, 1, 208, '3.00', '<div>&nbsp;Après quelques missions de base consistant à aider les villageois, l’équipe de Naruto est envoyée au <a href=\"https://fr.wikipedia.org/wiki/G%C3%A9opolitique_du_monde_de_Naruto#Pays_des_Vagues\">Pays des Vagues</a> en tant qu’escorte du constructeur de pont Tazuna. Rapidement, la mission s’avère bien plus dangereuse que ce qu’elle semblait être, Tazuna ayant caché qu’un personnage puissant, Gatô était décidé à le supprimer. Après avoir essuyé une première attaque de ninjas peu puissants, ils sont abordés par <a href=\"https://fr.wikipedia.org/wiki/Zabuza_Momochi\">Zabuza Momochi</a>, ninja déserteur de niveau supérieur engagé par Gatô, qu’ils finiront par vaincre grâce à un travail d\'équipe. Au moment de l’achever, un mystérieux enfant masqué, <a href=\"https://fr.wikipedia.org/wiki/Haku_(Naruto)\">Haku</a>, le transperce au cou de <a href=\"https://fr.wikipedia.org/wiki/Senbon\">senbons</a>, avant d\'emmener son corps.<br>Finalement arrivés à destination, ils profitent du repos imposé à Kakashi à la suite du combat pour commencer un entraînement intensif de maîtrise de leur énergie (<a href=\"https://fr.wikipedia.org/wiki/Univers_de_Naruto#Chakra\"><em>chakra</em></a>). S’étant rendu compte que Zabuza n’était pas mort, ils se préparent à une nouvelle confrontation. Ils rencontrent le petit-fils de Tazuna, Inari, dont le père adoptif a été tué par Gatô.&nbsp;</div>', 'naruto_tome_2.jpg', 2, '2002-04-13 00:00:00'),
(8, 1, 1, 208, '3.00', '<div><a href=\"https://fr.wikipedia.org/wiki/Kakashi_Hatake\">Kakashi</a> décide de mettre sa période de convalescence à profit pour proposer un entraînement de maîtrise du <a href=\"https://fr.wikipedia.org/wiki/Univers_de_Naruto#Chakra\"><em>chakra</em></a> à son équipe, consistant à marcher sur un tronc, perpendiculaire à celui-ci, chose à laquelle <a href=\"https://fr.wikipedia.org/wiki/Sakura_Haruno\">Sakura</a> se révèle meilleure que ses camarades. Pendant qu’elle surveille le pont, <a href=\"https://fr.wikipedia.org/wiki/Naruto_Uzumaki\">Naruto</a> et <a href=\"https://fr.wikipedia.org/wiki/Sasuke_Uchiwa\">Sasuke</a> s’entraînent dur pour chacun surpasser l’autre. Tazuna leur raconte pourquoi le <a href=\"https://fr.wikipedia.org/wiki/G%C3%A9opolitique_du_monde_de_Naruto#Pays_des_Vagues\">Pays des Vagues</a> est devenu pauvre sous la férule de Gatô, et comment le père adoptif d’Inari est mort en s’opposant au tyran. À la suite de ces révélations, Naruto veut démontrer à Inari que les héros existent ; il reprend son entraînement et s’y épuise au point de s’endormir dans la forêt où il rencontre sans le reconnaître <a href=\"https://fr.wikipedia.org/wiki/Haku_(Naruto)\">Haku</a> qu’il prend pour une fille et avec lequel il discute des raisons de vouloir devenir fort.<br>Sasuke et Naruto ayant terminé leur entraînement et Kakashi étant à nouveau valide, ils reprennent la protection de la construction du pont. Tandis que Naruto est resté dormir épuisé, Zabuza, accompagné de Haku, attaque Sakura, Sasuke et Kakashi. À son réveil, furieux d’avoir été laissé à part, Naruto se précipite vers le pont, mais remarque des traces de passage des hommes de Gatô sur le chemin ; faisant demi-tour, il sauve la mère d’Inari d’une prise d’otage et repart vers le pont où Sasuke et Haku s’affrontent. Haku perd en duel de vitesse face à Sasuke, mais grâce à ses <a href=\"https://fr.wikipedia.org/w/index.php?title=Kekkei_genkai&amp;action=edit&amp;redlink=1\">techniques héréditaires lui permettant de manipuler la glace</a>, il coince ce dernier sous un dôme de miroirs de glace. Naruto intervient et rentre également sous le dôme, tandis que Kakashi se retrouve bloqué face à <a href=\"https://fr.wikipedia.org/wiki/Zabuza_Momochi\">Zabuza</a> qui utilise du brouillard pour éviter le Sharingan. Éveillant son <a href=\"https://fr.wikipedia.org/w/index.php?title=Kekkei_genkai&amp;action=edit&amp;redlink=1\"><em>Sharingan</em></a>, Sasuke commence à rivaliser avec la vitesse de la technique de Haku ; ce dernier lui tend un piège en visant Naruto, et Sasuke est percé de part en part de multiples <a href=\"https://fr.wikipedia.org/wiki/Senbon\">senbons</a> en tentant de protéger ce dernier…</div>', 'naruto_tome_3.jpg', 3, '2002-07-06 00:00:00'),
(9, 16, 2, 192, '6.00', '<div>Malgré son pauvre 1m63, Shôyô se donne à fond dans le sport qu\'il aime : le volley-ball ! Son secret pour compenser sa petite taille : une détente phénoménale ! En intégrant la section volley du lycée Karasuno, notre rookie est déterminé à prendre sa revanche sur Tobio, un passeur aussi arrogant que talentueux qui l\'avait humilié au collège. Mais, en ouvrant les portes du gymnase, il découvre que son ennemi juré est son futur coéquipier ! Les deux jeunes recrues devront néanmoins jouer en combinaison pour espérer redorer le blason d\'un club de légende, déchu de son rang de champion...</div>', 'Haikyu_tome_1.jpg', 1, '2014-01-02 00:00:00'),
(10, 15, 3, 192, '6.00', '<div>Complexé par sa petite taille, Sora est passionné de basket. Lorsqu\'il entre en seconde, il décide naturellement d\'intégrer l’équipe du lycée, mais découvre vite que le club est le repaire des pires voyous de l\'école et qu\'ils n\'ont aucune intention de s\'entraîner. L\'enthousiasme sans limite de Sora pour le basket, déterminé à prouver que son talent dépasse son physique chétif, lui crée bientôt autant d\'amis que d\'ennemis...</div>', 'ahiru_no_sora_tome_1.jpg', 1, '2011-07-20 00:00:00'),
(11, 14, 4, 192, '7.00', '<div>C\'est la rentrée au club de basket-ball du lycée Seirin et cette année, deux rookies se démarquent… D\'un côté, le volcanique Taiga Kagami, fraîchement revenu des États-Unis où il a fait ses armes sous les arceaux. De l\'autre, le chétif et très effacé Tetsuya Kuroko dont on murmure qu\'il aurait fait partie de l\'équipe de basket du collège Teikô, la légendaire “Génération Miracle” ! Et si ces deux joueurs que tout oppose étaient amenés à se compléter à merveille sur le terrain ?</div>', 'Kuroko-s-Basket_tome_1.jpg', 1, '2012-01-18 00:00:00'),
(12, 13, 5, 198, '3.00', '<div>Ichigo Kurosaki a toujours été capable de voir les fantômes, mais son don n\'a jamais eu d\'impact sur sa vie avant l\'arrivée de Rukia Kuchiki, une Shinigami membre de la mystérieuse Soul Society. Tandis qu\'il combat un Hollow, un esprit maléfique qui chasse les humains à forte énergie psychique, Rukia tente de donner à Ichigo un peu de ses pouvoirs, afin qu\'il puisse sauver sa famille du danger ; mais à sa grande surprise, Ichigo absorbe toute son énergie. Devenu un Shinigami à part entière, Ichigo découvre que le monde qui l\'entoure est rempli de dangereux esprits et, avec la complicité de Rukia - qui recouvre doucement ses pouvoirs - accepte son nouveau boulot qui consiste à protéger les bons esprits des Hollows, et de les aider à trouver la paix.</div>', 'bleach_tome_1.jpg', 1, '2003-05-19 00:00:00'),
(13, 12, 6, 192, '7.00', '<div>Yuno et Asta ont tous deux été élevés dans le dessein de devenir empereur-mage du royaume de Clover. Mais alors que le premier excelle en magie, le second n\'y entend rien. A l\'issue de leur formation, Yuno reçoit le légendaire grimoire à quatre trèfles, tandis qu\'Asta repart les mains vides. Plus tard, ce dernier reçoit un mystérieux ouvrage noir qui s\'avère être un grimoire d\'anti-magie</div>', 'black_clover_tome_1.jpg', 1, '2016-09-07 00:00:00'),
(14, 17, 7, 192, '7.00', '<div>Les dragon balls sont des boules de cristal magiques. Celui qui les réunit invoque un dragon qui réalisera ses voeux. Sangoku, Dendé, Végéta et tous les protagonistes de cette grande saga tentent de trouver les sept dragon balls qui, une fois le voeu exaucé, s\'éparpilleront à nouveau dans l\'univers.</div>', 'dragon_ball_toma_1.jpg', 1, '2003-06-10 00:00:00'),
(15, 18, 8, 288, '6.00', '<div>Les humains possèdent désormais des pouvoirs spéciaux appelés <em>Alters</em>. Certains les utilisent au service du crime et pour les combattre, les Héros sont là. Izuku Midoriya est un jeune adolescent qui rêve de devenir un Héros. Mais malheureusement, il n\'a pas d\'Alter, comme 20 % de la population mondiale. Cependant, il espère intégrer le lycée Yûei, une académie d\'élite qui forme les futurs héros à l\'instar de Katsuki Bakugo, son camarade de classe très fort et qui le malmène depuis toujours. Mais Izuku pourra compter sur un soutien de taille : All Might, son idole, le plus puissant des Héros, va l\'aider à réaliser son rêve…</div>', 'Myheroacademia.jpg', 1, '2016-04-14 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `serie`
--

DROP TABLE IF EXISTS `serie`;
CREATE TABLE IF NOT EXISTS `serie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `serie_editeur_id` int DEFAULT NULL,
  `serie_cathegorie_id` int DEFAULT NULL,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `etat` tinyint(1) NOT NULL,
  `nombres_de_tomes` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AA3A93346283F725` (`serie_editeur_id`),
  KEY `IDX_AA3A93342C241E0B` (`serie_cathegorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `serie`
--

INSERT INTO `serie` (`id`, `serie_editeur_id`, `serie_cathegorie_id`, `nom`, `etat`, `nombres_de_tomes`) VALUES
(1, 1, 1, 'Naruto', 1, 50),
(12, 4, 1, 'Black Clover', 0, 27),
(13, 2, 1, 'Bleach', 1, 74),
(14, 4, 1, 'Kuroko\'s no Basket', 1, 30),
(15, 2, 1, 'Ahiru No Sora', 0, 51),
(16, 4, 1, 'Haikyuu', 0, 45),
(17, 2, 1, 'Dragon Ball', 1, 42),
(18, 3, 1, 'My Hero Academia', 0, 29);

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
