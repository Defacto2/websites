-- phpMyAdmin SQL Dump
-- version 2.11.1
-- http://www.phpmyadmin.net
--
-- Host: thompson.safesecureweb.com
-- Generation Time: May 27, 2009 at 06:22 AM
-- Server version: 4.1.18
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `defacto2net`
--

-- --------------------------------------------------------

--
-- Table structure for table `filepacks`
--

CREATE TABLE IF NOT EXISTS `filepacks` (
  `id` int(10) NOT NULL auto_increment,
  `filename` varchar(255) default NULL,
  `filesize` int(10) default NULL,
  `nolocal` tinyint(1) NOT NULL default '0',
  `highlight` tinyint(1) NOT NULL default '0',
  `fulltitle` varchar(255) default NULL,
  `summarydes` varchar(255) default NULL,
  `fulldes` longtext,
  `lastrevised` datetime default NULL,
  `downloads` int(10) default NULL,
  PRIMARY KEY  (`id`),
  KEY `Index_2` (`lastrevised`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `filepacks`
--

INSERT INTO `filepacks` (`id`, `filename`, `filesize`, `nolocal`, `highlight`, `fulltitle`, `summarydes`, `fulldes`, `lastrevised`, `downloads`) VALUES
(1, 'Defacto2_ISO_2007.7z', 412268, 1, 1, 'Defacto2 ISO Collection 2007', 'All our packs uncompressed and combined into a convenient CD image ready for you to burn', NULL, '2007-06-12 00:00:00', 2653),
(2, 'Defacto2_Cracktro_Pack-2007.7z', 121641, 1, 0, 'The Scene Archive Cracktros Pack', 'A collection of 630 PC crack-tros & installers', NULL, '2007-06-12 00:00:00', 2612),
(3, 'Defacto2_Elite_Sites_Pack.zip', 8848, 1, 0, 'Scene Site Pack', 'This pack is  a large collection of adverts for both PC elite scene Bulletin Board Systems and FTP Sites.', 'This pack is a large collection of adverts for both PC elite scene Bulletin Board Systems and FTP Sites. Included are over a thousand  BBS-intro, ANSI, ascii  nd image adverts for hundreds of worldwide sites from the nineteen nineties.', '2008-01-06 00:00:00', 3048),
(4, 'BBS-Capture-Toast-Pack.zip', 1750, 1, 0, 'The Capture Collection 4', '600+ PC BBS captures and other files', NULL, '1998-07-15 00:00:00', 1337),
(5, 'Defacto2_NFO_PACK-1.7z', 6300, 1, 0, 'Defacto2 NFO Pack 1', '7000 PC NFO files - including 800 that are not hosted', 'Because of the way our website is setup, we realise that some people might have difficulty creating a complete collection of the NFO files that we offer for download. So we have compiled this pack for our users as an easier method of mass-downloading the files.', '2005-02-28 00:00:00', 3769),
(6, 'Maktone_CracktrosAndInstaller_Pack.zip', 12800, 1, 0, 'Maktone''s Installers and Crackintros Pack', 'A collection of cracktros and installers which contain Maktones music (www.maktone.tk)', NULL, '2005-08-04 00:00:00', 1571),
(7, 'NFO-Toast-Pack-2.7z', 3400, 1, 0, 'Scene History Archive NFO Pack 2.2', '2500 PC NFO files collected by tOAST', 'The emphasis on this package is for GAME GROUPS, and in particular, for DECEAST groups. Since hybrid/prestige class/celebre/etc are still going, and/or died in late 1996, i did not emphasise to collect them.', '1998-07-15 00:00:00', 2977),
(8, 'Defacto2_Group_Logos.zip', 57581, 0, 0, 'Group Logos Pack', 'This is a collection of over 1,560 different scene logos and related images.', 'This is a collection of over 1,560 different scene logos and related images. The collection was originally compiled by Climbatiz and hosted on his website http://crackart.95mb.com. The site seems to have come online during mid-2004 and survived a few years before Climbatiz lost interest. He has since donated the collection to Defacto2 for hosting here.', '2009-04-16 11:54:30', 545);
