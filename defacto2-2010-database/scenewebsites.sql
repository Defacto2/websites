-- phpMyAdmin SQL Dump
-- version 2.11.1
-- http://www.phpmyadmin.net
--
-- Host: thompson.safesecureweb.com
-- Generation Time: May 27, 2009 at 06:26 AM
-- Server version: 4.1.18
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `defacto2net`
--

-- --------------------------------------------------------

--
-- Table structure for table `scenewebsites`
--

CREATE TABLE IF NOT EXISTS `scenewebsites` (
  `UniqueID` int(10) NOT NULL auto_increment,
  `File` longtext,
  `Author` varchar(255) default NULL,
  `Year` varchar(255) default NULL,
  `Month` varchar(255) default NULL,
  `Date` varchar(255) default NULL,
  `Description` longtext,
  `InDetail` longtext,
  `Link` varchar(255) default NULL,
  `Clicks` int(10) default NULL,
  `DateAdded` datetime default NULL,
  `DateRevised` datetime default NULL,
  PRIMARY KEY  (`UniqueID`),
  KEY `Index_2` (`Year`,`Month`,`Date`,`DateAdded`,`DateRevised`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=239 ;

--
-- Dumping data for table `scenewebsites`
--

INSERT INTO `scenewebsites` (`UniqueID`, `File`, `Author`, `Year`, `Month`, `Date`, `Description`, `InDetail`, `Link`, `Clicks`, `DateAdded`, `DateRevised`) VALUES
(165, 'includes/documentsweb/nrg2000/index.html', 'Werner & Tardy', '1997', NULL, NULL, 'Werner''s Dupe Check', 'Werner & Tardy''s dupe check was quite popular during it''s time. Operated by Werner & Tardy who were also famous for leading the legendary TDU-Jam, Pentagram and Genesis.', NULL, NULL, NULL, '2006-09-19 01:24:27'),
(166, 'includes/documentsweb/hybrid/index.html', 'Hybrid', '1997', '12', '26', 'Hybrid', 'Hybrid were one of the earlier groups to create a website, though it was often bare of any information. This copy unfortunately lacks graphics.', 'groups.cfm?mode=detail&org=hybrid', NULL, NULL, '2006-09-19 01:12:03'),
(167, 'includes/documentsweb/level4.1/', 'Level4', '1998', NULL, NULL, 'Level4', 'Level 4 was a lesser known utility group founded by Madboy that was around during the 1997-1998 period.', NULL, NULL, NULL, '2006-09-19 01:02:33'),
(169, 'includes/documentsweb/sodom.1/', 'SodOM Advertising Division', '1998', '1', '5', 'Sodom', 'Sodom was a small time utility group that was well known for releasing Novell titles and creating the Defacto electronic magazine.', 'groups.cfm?mode=detail&org=sodom', NULL, NULL, '2006-09-19 01:25:50'),
(171, 'includes/documentsweb/motiv8/index.html', 'Phoenix', '1998', '8', '16', 'Motiv8', 'Motiv8 was a training ground for many an early courier.', 'groups.cfm?mode=detail&org=motiv8', NULL, NULL, '2006-09-19 01:13:06'),
(172, 'includes/documentsweb/defacto2.hacked.04-11-98/', 'luv2blds97@aol.com', '1998', '11', '4', 'Defacto2', 'Our web site was hacked once during it''s earlier days. We never found out who did it or why. Other then it seemed to be some disgruntled kid who couldn''t get access to the scene.', 'http://www.defacto2.net', NULL, NULL, '2006-09-19 01:12:11'),
(173, 'includes/documentsweb/justthefacts/index.html', 'Just the Facts', '1999', '4', '1', 'Just The Facts', 'Just The Facts was a chart magazine from Class. Coded by their famous Windows coder ATM, the magazine used this webpage as a primary means of distribution.', 'magazines.cfm?mode=detail&title=Just%20The%20Facts', NULL, NULL, '2006-09-19 01:11:48'),
(174, 'includes/documentsweb/shock/index.html', 'Shock', '2000', NULL, NULL, 'Shock', 'Shock is a very well known application and utility group that during it''s earlier days used to run a popular web site.', 'groups.cfm?mode=detail&org=shock', NULL, NULL, '2006-09-19 01:27:03'),
(175, 'includes/documentsweb/rebels/index.html', 'Rebels', '2001', '1', '31', 'Rebels', 'Rebels had a few web sites online during their time thanks to the numerous areas and computer formats the brand worked on. This edition was easily the most popular though.', 'groups.cfm?mode=detail&org=rebels', NULL, NULL, '2006-09-19 01:17:05'),
(177, 'includes/documentsweb/razor1911site1.htm', 'Root88/iCE', '2002', '7', '1', 'Razor 1911', 'Razor 1911 were one of the first groups on the scene to launch a web site. Though this version is one of their later web publications.', 'groups.cfm?mode=detail&org=razor1911', NULL, NULL, '2006-09-19 01:18:33'),
(229, 'includes/documentsweb/cws/Index.htm', '_tech_', '1998', '4', '1', 'Couriers Weekly Scorecard', 'Courier weekly report card aka CWS was a long running courier chart magazine from the late 1990s. This website was created in the early days of the magazine''s life.', 'magazines.cfm?mode=detail&title=Courier%20Weektop%20Scorecard', NULL, NULL, '2006-09-19 01:12:27'),
(230, 'includes/documentsweb/rev-muad/index.html', 'MuadDIb', '1998', '3', '27', 'Muad''s WHQ', 'This is MuadDlb''s personal page. Mainly rambles on about his magazine Relativity and the universal electronic magazine api he created for the scene.', 'magazines.cfm?mode=detail&title=Relativity', NULL, NULL, '2006-09-19 01:11:24'),
(231, 'includes/documentsweb/rev-enk/index.html', 'Relativity Productions', '1998', '1', '3', 'Relativity', 'The main Relativity magazine web site. No awards for art design here!', 'magazines.cfm?mode=detail&title=Relativity', NULL, NULL, '2006-09-19 01:29:42'),
(232, 'includes/documentsweb/rev-zed/INDEX~1.HTM', 'Zeddicus', '1997', '4', '20', 'Relativity World', 'A very early web site for the Relativity electronic magazine.', 'magazines.cfm?mode=detail&title=Relativity', NULL, NULL, '2006-09-19 01:28:18'),
(234, 'includes/documentsweb/df2web31/', 'Defacto2', '1998', '9', '8', 'Defacto2', 'This is an early version of our web site when we also operated a scene news service, a small scene archives and an art group.', 'http://www.defacto2.net', 0, '2006-09-19 01:52:24', NULL),
(235, 'includes/documentsweb/df2web99/index.html', 'Defacto2', '1999', '9', '26', 'Defacto2', 'Now Defacto2 has split up into three groups. The front page is pretty ugly and is nothing more then a web host for the groups and various other pages.', 'http://www.defacto2.net', 0, '2006-09-19 02:02:09', '2007-01-10 10:29:14'),
(236, 'includes/documentsweb/df2web1a/', 'Defacto2', '2000', '7', '11', 'Defacto2', 'Again a very bland front page that hosts various web sites dedicated to various different projects.', 'http://www.defacto2.net', 0, '2006-09-19 02:21:39', NULL),
(237, 'includes/documentsweb/fairlight/index.html', 'Defacto2', '1999', '9', '3', 'Fairlight', 'This was a web page created for Fairlight by our former Design Division. Unfortunately at the last moment the project was canned by the Fairlight leadership and it was never put into use.', NULL, 0, '2006-09-24 20:33:44', NULL),
(238, 'includes/documentsweb/~iceflame.htm', NULL, '2001', '3', '17', 'Ice Flame', 'Some people have always had bad reputations on the scene. Some of them even spawn their own legion of haters. And in this case, Ice (of Origin/Myth fame) even had a website dedicated to him.', NULL, 0, '2006-09-24 20:44:07', NULL);
