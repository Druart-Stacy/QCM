-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 28 juin 2024 à 08:47
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `qcmprogramation`
--

-- --------------------------------------------------------

--
-- Structure de la table `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `correct_answer` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `questions`
--

INSERT INTO `questions` (`id`, `question`, `correct_answer`) VALUES
(1, 'Q1: Qu’ est-ce que JavaScript?', ''),
(2, 'Q2: Qu’ est-ce que Java?', ''),
(3, 'Q3: Comment déclarer-on une variable en JavasScript?', ''),
(4, 'Q4: Quelle est la difference entre LET et CONST?', ''),
(5, 'Q5: Comment utiliser des commentaire en js?', ''),
(6, 'Q6: Comment effectuer une boucle while en js?', ''),
(7, 'Q7: Quelle framework n’est pas un framework js?', ''),
(8, 'Q8: Que veut dire language de haut niveau?', ''),
(9, 'Q9: Que veut dire language de bas niveau? ', ''),
(10, 'Q10: Quelle sont les language de haut niveau parmis ceux-là?', ''),
(11, 'Q11: Que veux dire include en PHP?', ''),
(12, 'Q12: Quel est la différence entre HTML CSS et JavaScript?', ''),
(13, 'Q13: Le quel de ces language est Backend?', ''),
(14, 'Q14: ', ''),
(15, 'Q15: ', ''),
(16, 'Q16: ', ''),
(17, 'Q17: ', ''),
(18, 'Q18: Que veut dire HTML ?', ''),
(19, 'Q19: *** ?', ''),
(20, 'Q19: Que veut dire POO?', ''),
(21, 'Q20:  Question 2: Qu est-ce que PHP ‘PEAR?', ''),
(22, 'Q21: Pourquoi utilise-t-on le langage PHP ?', ''),
(23, 'Q22: quelle sont les types d erreur en PHP ?', ''),
(24, 'Q23: Quelle est la différence entre «==» et «===» en php ?', ''),
(25, 'Q19: Que veut dire POO?', ''),
(26, 'Q20:  Question 2: Qu est-ce que PHP ‘PEAR?', ''),
(27, 'Q21: Pourquoi utilise-t-on le langage PHP ?', ''),
(28, 'Q22: quelle sont les types d erreur en PHP ?', ''),
(29, 'Q23: Quelle est la différence entre «==» et «===» en php ?', ''),
(30, 'Q19: Que veut dire POO?', ''),
(31, 'Q20:  Question 2: Qu est-ce que PHP ‘PEAR?', ''),
(32, 'Q21: Pourquoi utilise-t-on le langage PHP ?', ''),
(33, 'Q22: quelle sont les types d erreur en PHP ?', ''),
(34, 'Q23: Quelle est la différence entre «==» et «===» en php ?', ''),
(35, 'Q19: Que veut dire POO?', ''),
(36, 'Q20:  Question 2: Qu est-ce que PHP ‘PEAR?', ''),
(37, 'Q21: Pourquoi utilise-t-on le langage PHP ?', ''),
(38, 'Q22: quelle sont les types d erreur en PHP ?', ''),
(39, 'Q23: Quelle est la différence entre «==» et «===» en php ?', ''),
(40, 'Q19: Que veut dire POO?', ''),
(41, 'Q20:  Question 2: Qu est-ce que PHP ‘PEAR?', ''),
(42, 'Q21: Pourquoi utilise-t-on le langage PHP ?', ''),
(43, 'Q22: quelle sont les types d erreur en PHP ?', ''),
(44, 'Q23: Quelle est la différence entre «==» et «===» en php ?', '');

-- --------------------------------------------------------

--
-- Structure de la table `reponses`
--

DROP TABLE IF EXISTS `reponses`;
CREATE TABLE IF NOT EXISTS `reponses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_question` int NOT NULL,
  `reponse` text NOT NULL,
  `est_correcte` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id_question` (`id_question`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `reponses`
--

INSERT INTO `reponses` (`id`, `id_question`, `reponse`, `est_correcte`) VALUES
(1, 1, 'A. Un language de programation', 1),
(2, 1, 'B. Une marque de gsm', 0),
(3, 1, 'C. Une ville', 0),
(4, 2, 'A. Une marque de café', 1),
(5, 2, 'B. Un language de programation', 1),
(6, 2, 'C. La réponse C', 0),
(7, 3, 'A. Nom de la variable', 0),
(8, 3, 'B. Avec le symbole $', 0),
(9, 3, 'C. “let” ou “const”', 1),
(10, 4, 'A. “let” est utilisé pour déclarer une variable locale à un bloc d’instructions. “const” est utilisé pour déclarer une variable constante qui ne peut pas être réaffectée.', 1),
(11, 4, 'B. “const” est utilisé pour déclarer une variable locale à un bloc d’instructions. “let” est utilisé pour déclarer une variable constante qui ne peut pas être réaffectée.', 0),
(12, 4, 'C. Aucune différence entre les 2', 0),
(13, 5, 'A. /**/', 0),
(14, 5, 'B. //', 1),
(15, 5, 'C. --', 0),
(16, 6, 'A. while (condition)\r\n 	//instruction', 0),
(17, 6, 'B. while (condition) {\r\n    // instructions à répéter\r\n}', 1),
(18, 6, 'C.while(condition){\r\n 	//instruction', 0),
(19, 7, 'A.Angular', 0),
(20, 7, 'B.Laravel', 1),
(21, 7, 'C.ReactJS,', 0),
(22, 8, 'A. Sa veux dire que c’est un language plus près du language humain', 1),
(23, 8, 'B. Sa veux dire que c’est un language difficile à aprendre', 0),
(24, 8, 'C. Sa veux dire que c’est un language plus loin du language humain', 0),
(25, 9, 'A. Sa veux dire que c’est un language difficile à aprendre', 0),
(26, 9, 'B. Sa veux dire que c’est un language plus loin du language humain', 1),
(27, 9, 'C. Sa veux dire que c’est un language plus près du language humain', 0),
(28, 10, 'A. Phyton', 1),
(29, 10, 'B. Ruby', 1),
(30, 10, 'C. Assembly', 0),
(31, 11, 'A. Importer le contenu d’un fichier dans un script courant', 1),
(32, 11, 'B. Exporter le contenu d’un fichier dans un script courant', 0),
(33, 11, 'C.C’est une balise HTML ', 0),
(34, 12, 'A.HTML et JavaScript sont des language de balisage tanti que CSS un language de programation ', 0),
(35, 12, 'B.JavaScript et CSS sont des language de balisage tanti que HTML un language de programation', 0),
(36, 12, 'C.HTML et CSS sont des language de balisage tanti que Javascript un language de programation ', 1),
(37, 13, 'A. Java', 1),
(38, 13, 'B. JavaScript ', 0),
(39, 13, 'C. CSS', 0),
(40, 14, 'A. ***', 1),
(41, 14, 'B. ***', 1),
(42, 14, 'C. ***', 0),
(43, 15, 'A. ***', 1),
(44, 15, 'B. ***', 1),
(45, 15, 'C. ***', 0),
(46, 16, 'A. ***', 1),
(47, 16, 'B. ***', 1),
(48, 16, 'C. ***', 0),
(49, 17, 'A.***', 1),
(50, 17, 'B. ***', 1),
(51, 17, 'C. ***', 0),
(52, 18, 'A. HyperText Markup Language', 1),
(53, 18, 'B. HyperText Marketing Language', 0),
(54, 18, 'C. sa veux rien dire', 0),
(55, 19, 'A. programmation objet obsolete', 0),
(56, 19, 'B. programmation orientée objet', 1),
(57, 19, 'C. programme orientée objet', 0),
(58, 20, 'A. la réponse A', 0),
(59, 20, 'B. Poire', 0),
(60, 20, 'C. C est une extension du langage PHP lui-même.«Extension PHP et référentiel d applications».', 1),
(61, 21, 'A. Pour te faire parler ,sa a fonctionner', 0),
(62, 21, 'B. Créer, écrire,chiffrer des données', 1),
(63, 22, 'A. les exceptions et les erreurs d exécution', 0),
(64, 22, 'B. les erreurs de syntaxe et les erreurs de logique', 0),
(65, 22, 'C. les avis, les avertissements et les erreurs fatales', 1),
(66, 23, 'A. «==» compare uniquement les valeurs, tandis que «===» compare les valeurs et les types', 1),
(67, 23, 'B. «==» compare les valeurs et les types, tandis que «===» compare uniquement les valeurs', 0),
(68, 23, 'C. «==» compare les références des objets, tandis que «===» compare les valeurs des objets', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
