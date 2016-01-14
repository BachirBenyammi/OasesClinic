# phpMyAdmin SQL Dump
# version 2.5.3
# http://www.phpmyadmin.net
#
# ������: localhost
# ���� ��: 29 ������ 2006 ������ 03:02
# ������ ������: 4.0.15
#  PHP ������: 4.3.3
# 
# ����� �������� : `clinique_base`
# 
CREATE DATABASE `clinique_base`;
USE clinique_base;

# --------------------------------------------------------

#
# ���� ������ `contacts`
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
# ����� �� ������� ������ ������ `contacts`
#

INSERT INTO `contacts` VALUES (1, 'teste', 'Ceci est un teste', 'benbac20@hotmail.com', '2006-08-31 09:08:28');

# --------------------------------------------------------

#
# ���� ������ `news`
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
# ����� �� ������� ������ ������ `news`
#

INSERT INTO `news` VALUES (1, 'Visite du pr�sident', 'le pr�sident de la r�publique M. ABDELAZIZ Boutaflika � fait une visite au Clinique des Oasis de Diagnostic et Soins de Ghardaia.', 'VISITE.JPG', 'Clinique des Oasi', 'contact@cliniquedesoasis.com', '2006-08-31 09:13:17');
INSERT INTO `news` VALUES (2, 'Inauguration de la clinique', 'La Clinique des Oasis sise � proximit� de Moustajeb (Bouhraoua) Gharda�a a �t� inaugur� par le Ministre de la sant� en pr�sence des autorit�s de la ville, des personnalit�s religieuses et civiles de la W de Gharda�a et de la r�gion, le 6 Mai 2002.', 'INUG.JPG', 'Clinique des Oasis', 'contact@cliniquedesoasis.com', '2006-08-31 09:14:23');
INSERT INTO `news` VALUES (3, 'Le site web de la Clinique des Oasis', 'Le site de clinique des oasis �tait, � l\'origine, un projet de fin d\'�tude pour l\'obtention d\'un DEUA (Dipl�me des Etudes Universitaires Appliqu�es) en Informatique, Option : syst�me d\'information, session Juin 2004.\r\nCet projet �tait encadr� par : M. BOUKHALFA Kamel, et r�alis� par BENYAMMI Bachir et BAKLI Mustapha', 'SITE.JPG', 'Clinique des Oasis', 'contact@cliniquedesoasis.com', '2006-08-31 09:15:43');

# --------------------------------------------------------

#
# ���� ������ `specialites`
#

CREATE TABLE `specialites` (
  `Nu_Specialite` int(11) NOT NULL auto_increment,
  `Intituler` varchar(50) NOT NULL default '',
  `Photo` varchar(50) NOT NULL default '',
  `Details` text NOT NULL,
  KEY `Nu_Specialite` (`Nu_Specialite`)
) TYPE=MyISAM AUTO_INCREMENT=31 ;

#
# ����� �� ������� ������ ������ `specialites`
#

INSERT INTO `specialites` VALUES (1, ' Urologie', 'clinique.jpg', ' Consultation\r\n<br>Endoscopie\r\n<br>Examens Urodynamiques\r\n<br>Lithotritie Extra Corporelle');
INSERT INTO `specialites` VALUES (2, ' R��ducation Fonctionnelle', 'clinique.jpg', ' Consultation M�decin R��ducateur\r<br>R��ducation sans Appareillage\r<br>R��ducation avec Appareillage');
INSERT INTO `specialites` VALUES (3, ' Remise en Forme', 'clinique.jpg', ' A�robie + Musculation\r<br>A�robie + Musculation + Jacuzzi\r<br>A�robie + Musculation +Piscine\r<br>Massages M�dicaux');
INSERT INTO `specialites` VALUES (4, ' Allergologie', 'clinique.jpg', ' Allergologie');
INSERT INTO `specialites` VALUES (5, ' Coeliochirurgie', 'clinique.jpg', ' Coeliochirurgie');
INSERT INTO `specialites` VALUES (6, ' Cardiologie et explorations cardiaques', 'clinique.jpg', ' Cardiologie et explorations cardiaques');
INSERT INTO `specialites` VALUES (7, ' Chirurgie g�n�rale', 'clinique.jpg', ' Chirurgie g�n�rale');
INSERT INTO `specialites` VALUES (8, ' Chirurgie g�n�rale conventionnelle', 'clinique.jpg', ' Chirurgie g�n�rale conventionnelle ');
INSERT INTO `specialites` VALUES (9, ' Chirurgie thoracique', 'clinique.jpg', ' Chirurgie thoracique');
INSERT INTO `specialites` VALUES (10, ' Chirurgie p�diatrique', 'clinique.jpg', ' Chirurgie p�diatrique');
INSERT INTO `specialites` VALUES (11, ' Chirurgie cardiaque', 'clinique.jpg', ' Chirurgie cardiaque');
INSERT INTO `specialites` VALUES (12, ' Chirurgie vasculaire et thoracique', 'clinique.jpg', ' Chirurgie vasculaire et thoracique');
INSERT INTO `specialites` VALUES (13, ' Chirurgie maxillo-facial', 'clinique.jpg', ' Chirurgie maxillo-facial ');
INSERT INTO `specialites` VALUES (14, ' Chirurgie orthop�dique adulte et p�diatrique', 'clinique.jpg', ' Chirurgie orthop�dique adulte et p�diatrique');
INSERT INTO `specialites` VALUES (15, ' Dermatologie', 'clinique.jpg', ' Dermatologie');
INSERT INTO `specialites` VALUES (16, ' Gyn�cologie conventionnelle et pelvicoelioscopie', 'clinique.jpg', ' Gyn�cologie conventionnelle et pelvicoelioscopie');
INSERT INTO `specialites` VALUES (17, ' Gastroent�rologie et endoscopie digestive', 'clinique.jpg', ' Gastroent�rologie et endoscopie digestive haute et basse');
INSERT INTO `specialites` VALUES (18, ' Lithotritie Extra Corporelle', 'clinique.jpg', ' Lithotritie Extra Corporelle');
INSERT INTO `specialites` VALUES (19, ' Laboratoire de biologie m�dicale', 'clinique.jpg', ' Laboratoire de biologie m�dicale');
INSERT INTO `specialites` VALUES (20, ' Laboratoire d�anatomie et cytologie pathologiques', 'clinique.jpg', ' Laboratoire d�anatomie et cytologie pathologiques');
INSERT INTO `specialites` VALUES (21, ' M�decine g�n�rale', 'clinique.jpg', ' M�decine g�n�rale');
INSERT INTO `specialites` VALUES (22, ' Neurochirurgie', 'clinique.jpg', ' Neurochirurgie');
INSERT INTO `specialites` VALUES (23, ' Neurologie et explorations neurologiques', 'clinique.jpg', ' Neurologie et explorations neurologiques');
INSERT INTO `specialites` VALUES (24, ' Orthop�die', 'clinique.jpg', ' Orthop�die');
INSERT INTO `specialites` VALUES (25, ' P�diatrie', 'clinique.jpg', ' P�diatrie');
INSERT INTO `specialites` VALUES (26, ' Rhumatologie', 'clinique.jpg', ' Rhumatologie');
INSERT INTO `specialites` VALUES (27, ' Traumatologie', 'clinique.jpg', ' Traumatologie');
INSERT INTO `specialites` VALUES (28, ' Urologie conventionnelle et endoscopique', 'clinique.jpg', ' Urologie conventionnelle et endoscopique');
INSERT INTO `specialites` VALUES (29, ' Urgences m�dicochirurgicales', 'clinique.jpg', ' Urgences m�dicochirurgicales');

# --------------------------------------------------------

#
# ���� ������ `visiteurs`
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
# ����� �� ������� ������ ������ `visiteurs`
#

INSERT INTO `visiteurs` VALUES (1, '/clinic/', 'Unknoun', 'ar-dz', '127.0.0.1', 'MSIE', '2006-08-31 09:04:19', 'Windows');
INSERT INTO `visiteurs` VALUES (2, '/clinic/admin/index.php', 'Unknoun', 'ar-dz', '127.0.0.1', 'MSIE', '2006-08-31 09:33:48', 'Windows');
INSERT INTO `visiteurs` VALUES (3, '/clinic/', 'Unknoun', 'ar-dz', '127.0.0.1', 'MSIE', '2006-08-31 09:36:03', 'Windows');
INSERT INTO `visiteurs` VALUES (4, '/clinique/', 'Unknoun', 'ar-dz', '127.0.0.1', 'MSIE', '2006-09-08 11:03:25', 'Windows');
