# phpMyAdmin SQL Dump
# version 2.5.3
# http://www.phpmyadmin.net
#
# «·„“Êœ: localhost
# √‰‘∆ ›Ì: 29 œÌ”„»— 2006 «·”«⁄… 03:02
# ≈’œ«—… «·„“Êœ: 4.0.15
#  PHP ≈’œ«—…: 4.3.3
# 
# ﬁ«⁄œ… «·»Ì«‰«  : `clinique_base`
# 
CREATE DATABASE `clinique_base`;
USE clinique_base;

# --------------------------------------------------------

#
# »‰Ì… «·ÃœÊ· `contacts`
#

CREATE TABLE `contacts` (
  `Nu_Contact` int(11) NOT NULL auto_increment,
  `Sujet` varchar(100) NOT NULL default '',
  `Message` text NOT NULL,
  `Email` varchar(100) NOT NULL default '',
  `Date_Heure` datetime NOT NULL default '0000-00-00 00:00:00',
  KEY `Nu_Contact` (`Nu_Contact`)
) TYPE=MyISAM AUTO_INCREMENT=2 ;

#
# ≈—Ã«⁄ √Ê ≈” Ì—«œ »Ì«‰«  «·ÃœÊ· `contacts`
#

INSERT INTO `contacts` VALUES (1, 'teste', 'Ceci est un teste', 'benbac20@hotmail.com', '2006-08-31 09:08:28');

# --------------------------------------------------------

#
# »‰Ì… «·ÃœÊ· `news`
#

CREATE TABLE `news` (
  `Nu_News` int(11) NOT NULL auto_increment,
  `Titre` varchar(50) NOT NULL default '',
  `Details` text NOT NULL,
  `Photo` varchar(50) NOT NULL default '',
  `Redacteur` varchar(50) NOT NULL default '',
  `Email` varchar(50) NOT NULL default '',
  `Date_Heure` datetime NOT NULL default '0000-00-00 00:00:00',
  KEY `Nu_News` (`Nu_News`)
) TYPE=MyISAM AUTO_INCREMENT=4 ;

#
# ≈—Ã«⁄ √Ê ≈” Ì—«œ »Ì«‰«  «·ÃœÊ· `news`
#

INSERT INTO `news` VALUES (1, 'Visite du prÈsident', 'le prÈsident de la rÈpublique M. ABDELAZIZ Boutaflika ‡ fait une visite au Clinique des Oasis de Diagnostic et Soins de Ghardaia.', 'VISITE.JPG', 'Clinique des Oasi', 'contact@cliniquedesoasis.com', '2006-08-31 09:13:17');
INSERT INTO `news` VALUES (2, 'Inauguration de la clinique', 'La Clinique des Oasis sise ‡ proximitÈ de Moustajeb (Bouhraoua) GhardaÔa a ÈtÈ inaugurÈ par le Ministre de la santÈ en prÈsence des autoritÈs de la ville, des personnalitÈs religieuses et civiles de la W de GhardaÔa et de la rÈgion, le 6 Mai 2002.', 'INUG.JPG', 'Clinique des Oasis', 'contact@cliniquedesoasis.com', '2006-08-31 09:14:23');
INSERT INTO `news` VALUES (3, 'Le site web de la Clinique des Oasis', 'Le site de clinique des oasis Ètait, ‡ l\'origine, un projet de fin d\'Ètude pour l\'obtention d\'un DEUA (DiplÙme des Etudes Universitaires AppliquÈes) en Informatique, Option : systËme d\'information, session Juin 2004.\r\nCet projet Ètait encadrÈ par : M. BOUKHALFA Kamel, et rÈalisÈ par BENYAMMI Bachir et BAKLI Mustapha', 'SITE.JPG', 'Clinique des Oasis', 'contact@cliniquedesoasis.com', '2006-08-31 09:15:43');

# --------------------------------------------------------

#
# »‰Ì… «·ÃœÊ· `specialites`
#

CREATE TABLE `specialites` (
  `Nu_Specialite` int(11) NOT NULL auto_increment,
  `Intituler` varchar(50) NOT NULL default '',
  `Photo` varchar(50) NOT NULL default '',
  `Details` text NOT NULL,
  KEY `Nu_Specialite` (`Nu_Specialite`)
) TYPE=MyISAM AUTO_INCREMENT=31 ;

#
# ≈—Ã«⁄ √Ê ≈” Ì—«œ »Ì«‰«  «·ÃœÊ· `specialites`
#

INSERT INTO `specialites` VALUES (1, ' Urologie', 'clinique.jpg', ' Consultation\r\n<br>Endoscopie\r\n<br>Examens Urodynamiques\r\n<br>Lithotritie Extra Corporelle');
INSERT INTO `specialites` VALUES (2, ' RÈÈducation Fonctionnelle', 'clinique.jpg', ' Consultation MÈdecin RÈÈducateur\r<br>RÈÈducation sans Appareillage\r<br>RÈÈducation avec Appareillage');
INSERT INTO `specialites` VALUES (3, ' Remise en Forme', 'clinique.jpg', ' AÈrobie + Musculation\r<br>AÈrobie + Musculation + Jacuzzi\r<br>AÈrobie + Musculation +Piscine\r<br>Massages MÈdicaux');
INSERT INTO `specialites` VALUES (4, ' Allergologie', 'clinique.jpg', ' Allergologie');
INSERT INTO `specialites` VALUES (5, ' Coeliochirurgie', 'clinique.jpg', ' Coeliochirurgie');
INSERT INTO `specialites` VALUES (6, ' Cardiologie et explorations cardiaques', 'clinique.jpg', ' Cardiologie et explorations cardiaques');
INSERT INTO `specialites` VALUES (7, ' Chirurgie gÈnÈrale', 'clinique.jpg', ' Chirurgie gÈnÈrale');
INSERT INTO `specialites` VALUES (8, ' Chirurgie gÈnÈrale conventionnelle', 'clinique.jpg', ' Chirurgie gÈnÈrale conventionnelle ');
INSERT INTO `specialites` VALUES (9, ' Chirurgie thoracique', 'clinique.jpg', ' Chirurgie thoracique');
INSERT INTO `specialites` VALUES (10, ' Chirurgie pÈdiatrique', 'clinique.jpg', ' Chirurgie pÈdiatrique');
INSERT INTO `specialites` VALUES (11, ' Chirurgie cardiaque', 'clinique.jpg', ' Chirurgie cardiaque');
INSERT INTO `specialites` VALUES (12, ' Chirurgie vasculaire et thoracique', 'clinique.jpg', ' Chirurgie vasculaire et thoracique');
INSERT INTO `specialites` VALUES (13, ' Chirurgie maxillo-facial', 'clinique.jpg', ' Chirurgie maxillo-facial ');
INSERT INTO `specialites` VALUES (14, ' Chirurgie orthopÈdique adulte et pÈdiatrique', 'clinique.jpg', ' Chirurgie orthopÈdique adulte et pÈdiatrique');
INSERT INTO `specialites` VALUES (15, ' Dermatologie', 'clinique.jpg', ' Dermatologie');
INSERT INTO `specialites` VALUES (16, ' GynÈcologie conventionnelle et pelvicoelioscopie', 'clinique.jpg', ' GynÈcologie conventionnelle et pelvicoelioscopie');
INSERT INTO `specialites` VALUES (17, ' GastroentÈrologie et endoscopie digestive', 'clinique.jpg', ' GastroentÈrologie et endoscopie digestive haute et basse');
INSERT INTO `specialites` VALUES (18, ' Lithotritie Extra Corporelle', 'clinique.jpg', ' Lithotritie Extra Corporelle');
INSERT INTO `specialites` VALUES (19, ' Laboratoire de biologie mÈdicale', 'clinique.jpg', ' Laboratoire de biologie mÈdicale');
INSERT INTO `specialites` VALUES (20, ' Laboratoire díanatomie et cytologie pathologiques', 'clinique.jpg', ' Laboratoire díanatomie et cytologie pathologiques');
INSERT INTO `specialites` VALUES (21, ' MÈdecine gÈnÈrale', 'clinique.jpg', ' MÈdecine gÈnÈrale');
INSERT INTO `specialites` VALUES (22, ' Neurochirurgie', 'clinique.jpg', ' Neurochirurgie');
INSERT INTO `specialites` VALUES (23, ' Neurologie et explorations neurologiques', 'clinique.jpg', ' Neurologie et explorations neurologiques');
INSERT INTO `specialites` VALUES (24, ' OrthopÈdie', 'clinique.jpg', ' OrthopÈdie');
INSERT INTO `specialites` VALUES (25, ' PÈdiatrie', 'clinique.jpg', ' PÈdiatrie');
INSERT INTO `specialites` VALUES (26, ' Rhumatologie', 'clinique.jpg', ' Rhumatologie');
INSERT INTO `specialites` VALUES (27, ' Traumatologie', 'clinique.jpg', ' Traumatologie');
INSERT INTO `specialites` VALUES (28, ' Urologie conventionnelle et endoscopique', 'clinique.jpg', ' Urologie conventionnelle et endoscopique');
INSERT INTO `specialites` VALUES (29, ' Urgences mÈdicochirurgicales', 'clinique.jpg', ' Urgences mÈdicochirurgicales');

# --------------------------------------------------------

#
# »‰Ì… «·ÃœÊ· `visiteurs`
#

CREATE TABLE `visiteurs` (
  `Nu_Visiteur` int(11) NOT NULL auto_increment,
  `Page` varchar(100) NOT NULL default '',
  `Lien` varchar(100) NOT NULL default '',
  `Language` varchar(20) NOT NULL default '',
  `Ip_Adresse` varchar(20) NOT NULL default '',
  `Navigateur` varchar(20) NOT NULL default '',
  `Date_Heure` datetime NOT NULL default '0000-00-00 00:00:00',
  `os` varchar(100) NOT NULL default '',
  KEY `Nu_Visiteur` (`Nu_Visiteur`)
) TYPE=MyISAM AUTO_INCREMENT=5 ;

#
# ≈—Ã«⁄ √Ê ≈” Ì—«œ »Ì«‰«  «·ÃœÊ· `visiteurs`
#

INSERT INTO `visiteurs` VALUES (1, '/clinic/', 'Unknoun', 'ar-dz', '127.0.0.1', 'MSIE', '2006-08-31 09:04:19', 'Windows');
INSERT INTO `visiteurs` VALUES (2, '/clinic/admin/index.php', 'Unknoun', 'ar-dz', '127.0.0.1', 'MSIE', '2006-08-31 09:33:48', 'Windows');
INSERT INTO `visiteurs` VALUES (3, '/clinic/', 'Unknoun', 'ar-dz', '127.0.0.1', 'MSIE', '2006-08-31 09:36:03', 'Windows');
INSERT INTO `visiteurs` VALUES (4, '/clinique/', 'Unknoun', 'ar-dz', '127.0.0.1', 'MSIE', '2006-09-08 11:03:25', 'Windows');
