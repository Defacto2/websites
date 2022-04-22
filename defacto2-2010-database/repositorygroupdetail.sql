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
-- Table structure for table `repositorygroupdetail`
--

CREATE TABLE IF NOT EXISTS `repositorygroupdetail` (
  `idName` varchar(255) NOT NULL default '',
  `completeName` varchar(255) default NULL,
  `otherName` varchar(255) default NULL,
  `yearFounded` varchar(255) default NULL,
  `yearDisbanded` varchar(255) default NULL,
  `yearAdditional` varchar(255) default NULL,
  `acronym` varchar(255) default NULL,
  `groupType` varchar(255) default NULL,
  `archivedWebpageURL` varchar(255) default NULL,
  `currentWebpageURL` varchar(255) default NULL,
  `cracktroLink` varchar(255) default NULL,
  `wikipediaLink` varchar(255) default NULL,
  `isonewsLink` varchar(255) default NULL,
  `nforceLink` varchar(255) default NULL,
  `clicks` int(10) default NULL,
  `dateAdded` datetime default NULL,
  `dateRevised` datetime default NULL,
  PRIMARY KEY  (`idName`),
  UNIQUE KEY `completeName` (`completeName`),
  KEY `Index_3` (`acronym`,`yearFounded`,`dateRevised`,`dateAdded`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `repositorygroupdetail`
--

INSERT INTO `repositorygroupdetail` (`idName`, `completeName`, `otherName`, `yearFounded`, `yearDisbanded`, `yearAdditional`, `acronym`, `groupType`, `archivedWebpageURL`, `currentWebpageURL`, `cracktroLink`, `wikipediaLink`, `isonewsLink`, `nforceLink`, `clicks`, `dateAdded`, `dateRevised`) VALUES
('2000ad', '2000 AD', NULL, '1994', '2000', NULL, '2kAD', 'utility, application', NULL, NULL, '2000 AD', NULL, NULL, NULL, 2390, NULL, '2007-01-10 10:43:04'),
('backlash', 'Backlash', NULL, '1996', '2004', NULL, 'blh', 'rip games', NULL, NULL, 'Backlash', NULL, 'http://www.theisonews.com/search-process.php?releasegroupS=Backlash', 'http://www.nforce.nl/index.php?menu=quicknav&item=search&search=true&group=backlash', 3961, NULL, NULL),
('bcc', 'Boys from Company C', NULL, '1987', '1988', NULL, 'bcc', 'floppy games', NULL, NULL, 'Boys from Company C', NULL, NULL, NULL, 2295, NULL, '2007-01-12 04:51:47'),
('bsp', 'Bentley Sidwell Productions', NULL, '1988', '1989', NULL, 'bsp', 'floppy games', NULL, NULL, 'Bentley Sidwell Productions', NULL, NULL, NULL, 3844, NULL, '2008-09-30 17:00:14'),
('cia', 'Crackers In Action', NULL, '1988', '1988', NULL, 'cia', 'floppy games', NULL, NULL, 'Crackers In Action', NULL, NULL, NULL, 2298, NULL, '2006-10-04 03:51:37'),
('cife', 'CD Images For the Elite', NULL, '1997', '2000', NULL, 'cife', 'iso games, iso application', NULL, NULL, NULL, NULL, 'http://www.theisonews.com/search-process.php?releasegroupS=cife', 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=cife', 1738, '2006-08-27 20:05:04', '2008-01-08 05:45:06'),
('class', 'Class', NULL, '1997', '2004', NULL, 'cls', 'rip games', NULL, NULL, 'Class', 'http://en.wikipedia.org/wiki/Class_%28warez%29', 'http://www.theisonews.com/search.php', 'http://www.nforce.nl/index.php?menu=quicknav&item=search&search=true&group=CLASS', 7531, NULL, NULL),
('core', 'CORE', 'CoreISO, CoreUtil, Challenge of Reverse Engineering', '1997', '2005', NULL, 'CORE', 'utility, games', NULL, NULL, NULL, 'http://en.wikipedia.org/wiki/Challenge_of_Reverse_Engineering', 'http://www.theisonews.com/search.php', 'http://www.nforce.nl/index.php?menu=quicknav&item=search&offset=0', 5614, '2006-08-21 03:22:19', NULL),
('cpc2001', 'Corporation for Public Cybercasting 2001', NULL, '1989', '1989', NULL, 'cpc2001', 'floppy games', NULL, NULL, 'cpc2001', NULL, NULL, NULL, 1523, NULL, NULL),
('cpi', 'Canadian Pirates Inc', NULL, '1985', '1991', NULL, 'CPI', 'floppy games, utility', NULL, 'http://www.canadianpiratesinc.com', 'Canadian Pirates Inc', NULL, NULL, NULL, 4711, NULL, '2008-09-26 10:39:36'),
('crue', 'Cheat Requests for Underground Elite', NULL, '1991', '1991', NULL, 'crue', 'floppy games', NULL, NULL, NULL, NULL, NULL, NULL, 1994, NULL, NULL),
('dd', 'Demented Dimensions', 'Demented Dimensions BBS Presents', '1996', '2000', NULL, 'DD', 'rip games', NULL, NULL, NULL, NULL, NULL, NULL, 1550, '2006-08-27 20:38:47', NULL),
('detonation', 'Detonation', NULL, '2006', '2008', NULL, 'dtn', 'games', NULL, NULL, NULL, NULL, NULL, NULL, 1244, '2008-01-08 07:48:01', NULL),
('deviance', 'Deviance', 'DVN-ISO, Deviance-ISO', '1999', '2006', NULL, 'DEVIANCE', 'iso games, iso application', NULL, NULL, 'Deviance', 'http://en.wikipedia.org/wiki/DEViANCE', NULL, 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=DEVIANCE', 13345, '2006-08-22 03:42:27', NULL),
('dnx', 'Dynamix', NULL, '1994', '1996', NULL, 'dnx', 'rip games', NULL, NULL, 'Dynamix', NULL, NULL, NULL, 2085, NULL, NULL),
('dod', 'Drink or Die', 'DODISO', '1993', '2001', NULL, 'dod', 'utility, application, iso', NULL, NULL, 'Drink or Die', 'http://en.wikipedia.org/wiki/Drink_or_Die', 'http://www.theisonews.com/search-process.php?releasegroupS=DOD', NULL, 22234, NULL, '2007-02-26 04:36:31'),
('dvn', 'Divine', 'DivineISO, DVNISO', '1997', '2006', NULL, 'dvn', 'iso games', NULL, NULL, 'divine', NULL, NULL, 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=DIVINE', 3942, '2006-08-21 04:23:33', NULL),
('ecl', 'Eclipse', NULL, '1994', '1995', NULL, 'ecl', 'floppy games', NULL, NULL, 'Eclipse', NULL, NULL, NULL, 2934, NULL, NULL),
('esp', 'ESP', NULL, '1986', '1988', NULL, 'esp', 'floppy games', NULL, NULL, 'esp', NULL, NULL, NULL, 2464, NULL, '2007-01-26 08:36:57'),
('fate', 'Fast Action Trading Elite', NULL, '1995', '1999', NULL, 'fate', 'courier', NULL, NULL, NULL, NULL, NULL, NULL, 2135, '2006-08-23 11:13:33', NULL),
('fcc', 'Federal Cracking Consortium', NULL, '1991', '1992', NULL, 'fcc', 'floppy games', NULL, NULL, 'Federal Cracking Consortium', NULL, NULL, NULL, 2042, NULL, '2006-10-04 03:55:11'),
('ffa', 'FFA', NULL, '1989', '1990', NULL, 'ffa', 'Games', NULL, NULL, NULL, NULL, NULL, NULL, 1851, NULL, '2006-10-04 03:55:26'),
('firm', 'The FiRM', 'originally known as BCC/Five O', '1989', '1990', '1992 & 1994', 'FiRM', 'floppy games', NULL, NULL, 'The Firm', NULL, NULL, NULL, 4644, NULL, '2006-10-04 03:56:43'),
('five-O', 'Five O', NULL, '1986', '1988', NULL, '5-O', 'floppy games', NULL, NULL, 'Five 0', NULL, NULL, NULL, 1337, NULL, '2006-10-04 03:55:55'),
('flt', 'Fairlight', NULL, '1991', '1994', '1998-2007', 'flt', 'floppy games, iso games', NULL, 'http://www.fairlight.fi', 'Fairlight', 'http://en.wikipedia.org/wiki/Fairlight_%28group%29', NULL, 'http://www.nforce.nl/index.php?menu=quicknav&item=search&search=true&group=fairlight', 12900, NULL, '2007-04-14 20:37:38'),
('glow', 'Gorgeous Ladies of Warez', NULL, '1996', '2000', NULL, 'GLOW', 'utility', NULL, NULL, NULL, NULL, 'http://www.theisonews.com/search-process.php?releasegroupS=glow', 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=glow', 2283, '2006-08-27 21:51:12', NULL),
('gns', 'Genesis', NULL, '1994', '1995', NULL, 'gns', 'floppy games', NULL, NULL, 'Genesis', NULL, NULL, NULL, 3042, NULL, '2007-05-18 00:10:59'),
('hatred', 'Hatred', NULL, '2006', '2007', NULL, 'htd', 'games', NULL, NULL, 'hatred', NULL, 'http://www.theisonews.com/search-process.php?releasegroupS=hatred', NULL, 3577, '2007-02-23 08:01:18', '2007-04-14 23:33:32'),
('hoodlum', 'Hoodlum', NULL, '1995', '1996', '2004-2005', 'hlm', 'floppy games, iso games', NULL, 'http://www.hlmdemo.org', 'hoodlum', NULL, NULL, 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=HOODLUM', 9692, '2006-08-21 21:49:09', '2006-09-29 20:39:29'),
('hv', 'High Voltage', NULL, '1993', '1994', NULL, 'HV', 'utility', NULL, NULL, NULL, NULL, NULL, NULL, 2389, '2006-08-22 00:55:18', '2009-03-12 06:42:41'),
('hybrid', 'Hybrid', NULL, '1993', '1998', NULL, 'hbd', 'rip games', 'includes/documentsweb/hybrid/index.html', NULL, 'Hybrid', NULL, NULL, NULL, 3506, NULL, '2007-01-14 23:15:16'),
('immersion', 'Immersion', NULL, '2001', '2004', NULL, 'Immersion', 'iso games', NULL, NULL, NULL, NULL, 'http://www.theisonews.com/search-process.php?releasegroupS=Immersion', 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=Immersion', 2037, '2006-09-22 05:07:49', NULL),
('inc', 'International Network of Crackers', 'previously known as Miami Cracking Machine (1986-89)', '1989', '1993', NULL, 'inc', 'floppy games', NULL, NULL, 'International Network of Crackers', 'http://en.wikipedia.org/wiki/International_Network_of_Crackers', NULL, NULL, 6969, NULL, '2006-10-04 03:59:10'),
('iso', 'Isolation', NULL, '1998', '2002', NULL, 'ISO', 'iso games', NULL, NULL, NULL, NULL, 'http://www.theisonews.com/search-process.php?releasegroupS=ISOLATION', 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=ISOLATION', 1704, '2006-08-27 23:06:26', NULL),
('kgb', 'KGB', NULL, '1988', '1988', NULL, 'KGB', 'floppy games', NULL, NULL, 'kgb', NULL, NULL, NULL, 1154, '2006-08-31 19:04:55', '2006-10-04 03:59:54'),
('lgd', 'Legend', NULL, '1994', '1994', NULL, 'lgd', 'floppy games', NULL, 'http://www.legend64.com', 'Legend', NULL, NULL, NULL, 1886, NULL, NULL),
('malice', 'Malice', NULL, '1992', '1999', NULL, 'mal', 'courier', NULL, NULL, NULL, NULL, NULL, NULL, 2504, '2006-08-24 19:13:24', '2006-09-29 01:34:09'),
('motiv8', 'Motiv8', NULL, '1994', '2006', NULL, 'MV8', 'courier', NULL, 'http://www.motiv8.org/', NULL, NULL, NULL, NULL, 2145, '2006-08-23 21:49:34', NULL),
('myth', 'Myth', 'Myth PC, Myth Rip', '2000', '2005', NULL, 'myth', 'rip games', NULL, NULL, 'myth', NULL, NULL, 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=MYTH', 8470, '2006-08-23 10:05:04', NULL),
('nap-pa', 'North American Pirate/Phreak Association', NULL, '1987', '1990', NULL, 'nap/pa', 'floppy games, courier, utility', NULL, NULL, NULL, NULL, NULL, NULL, 1438, NULL, '2007-01-12 05:13:44'),
('neua', 'National Elite Underground Alliance', 'originally known as the North Eastern Underground Alliance', '1989', '1991', NULL, 'neua', 'Games', NULL, NULL, 'NEUA', NULL, NULL, NULL, 2863, NULL, '2007-01-12 06:14:54'),
('nexus', 'Nexus', NULL, '1993', '1994', NULL, 'nxs', 'floppy games', NULL, NULL, 'Nexus', NULL, NULL, NULL, 1812, NULL, '2007-01-12 06:14:18'),
('npm', 'Napalm', NULL, '1996', '1996', NULL, 'npm', 'rip games', NULL, NULL, 'Napalm', NULL, NULL, NULL, 2730, NULL, NULL),
('nta', 'Nokturnal Trading Alliance', NULL, '1990', '1995', NULL, 'NTA', 'utility, floppy games', NULL, NULL, NULL, NULL, NULL, NULL, 1911, '2006-08-21 23:30:41', '2007-01-16 03:11:29'),
('nyc', 'New York Crackers', NULL, '1987', '1989', NULL, 'nyc', 'floppy games', NULL, NULL, 'New York Crackers', NULL, NULL, NULL, 1823, NULL, '2007-01-14 21:06:49'),
('ogn', 'Origin', NULL, '1997', '2000', NULL, 'OGN', 'rip games', NULL, NULL, 'Origin', NULL, NULL, 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=ORIGIN', 2618, '2006-08-22 01:42:11', NULL),
('orion', 'Orion', NULL, '1999', '2005', NULL, 'ORN', 'cracking', NULL, NULL, 'orion', NULL, 'http://www.theisonews.com/search-process.php?releasegroupS=orion', 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=orion', 3805, '2006-08-23 23:57:03', NULL),
('paradox', 'Paradox', NULL, '1993', '1994', '2004', 'pdx', 'floppy games', NULL, 'http://www.paradogs.com', 'paradox', NULL, NULL, 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=yes&group=PARADOX', 3395, '2006-08-22 00:17:39', NULL),
('PC', 'Phrozen Crew', NULL, '1993', '2005', NULL, 'PC', 'cracking', 'http://members.fortunecity.co.uk/phrozen/index.html', 'http://www.phrozencrew.net/', 'Phrozen Crew', 'http://en.wikipedia.org/wiki/Phrozen_Crew', NULL, NULL, 5582, '2006-08-27 22:13:29', NULL),
('pdm', 'Paradigm', NULL, '1996', '2000', NULL, 'pdm', 'rip games', NULL, NULL, 'Paradigm', NULL, 'http://www.theisonews.com/search-process.php?releasegroupS=Paradigm', 'http://www.nforce.nl/index.php?menu=quicknav&item=search&search=true&group=paradigm', 3442, NULL, NULL),
('pe', 'Public Enemy', 'originally co-released with Red Sector Inc.', '1990', '1993', NULL, 'pe', 'floppy games', NULL, NULL, 'Public Enemy', NULL, NULL, NULL, 3684, NULL, '2007-01-12 06:59:40'),
('pe-trsi-defjam-tdt', 'Public Enemy/Tristar & Red Sector Inc/Defjam/The Dream Team', 'Public Enemy/TRSi/Defjam, Public Enemy/TRSi/The Dream Team', '1990', '1990', NULL, 'pe/trsi/tdt', 'floppy games', NULL, NULL, 'Public Enemy, Red Sector Inc, Tristar, Defjam', NULL, NULL, NULL, 1708, NULL, '2007-01-12 07:02:20'),
('pil', 'Pirates In Legion', NULL, '1991', '1995', NULL, 'PIL', 'floppy games', NULL, NULL, NULL, NULL, NULL, NULL, 1619, '2006-08-21 23:44:18', '2007-02-04 01:32:58'),
('pst', 'Prestige', NULL, '1995', '1997', '1999-2000', 'psg', 'rip games, iso games', NULL, NULL, 'prestige', NULL, 'http://www.theisonews.com/search-process.php?releasegroupS=prestige', NULL, 2609, '2006-08-25 00:43:14', NULL),
('ptg', 'Pentagram', NULL, '1993', '1994', NULL, 'ptg', 'floppy games', NULL, NULL, 'Pentagram', NULL, NULL, NULL, 3010, NULL, NULL),
('ptl', 'PTL Club', NULL, '1987', '1989', NULL, 'ptl', 'floppy games', NULL, NULL, 'PTL Club', NULL, NULL, NULL, 3826, NULL, NULL),
('pwa', 'Pirates With Attitudes', NULL, '1992', '2000', NULL, 'PWA', 'application', NULL, NULL, NULL, 'http://en.wikipedia.org/wiki/Pirates_With_Attitude', NULL, NULL, 5117, '2006-08-21 02:55:27', '2006-09-29 19:38:49'),
('pyr', 'Pyradical', NULL, '1992', '1993', NULL, 'pyr', 'floppy games', NULL, NULL, 'Pyradical', NULL, NULL, NULL, 1647, NULL, '2007-02-04 01:42:07'),
('qtx', 'Quartex', NULL, '1995', '1998', '2006-2007', 'qtx', 'floppy games, iso games', NULL, 'http://www.quartex.org', 'Quartex', NULL, NULL, NULL, 2008, NULL, '2007-04-14 23:32:19'),
('rampage', 'Release on Rampage', NULL, '1995', '1996', NULL, 'ror', 'rip games', NULL, NULL, 'ROR', NULL, NULL, NULL, 2001, NULL, NULL),
('razor1911', 'Razor 1911', NULL, '1991', '2004', '2006-2007', 'rzr', 'floppy games, rip games, iso games', 'includes/documentsweb/razor1911site1.htm', 'http://www.laric.com/razor', 'Razor 1911', 'http://en.wikipedia.org/wiki/Razor_1911', 'http://www.theisonews.com/search.php', 'http://www.nforce.nl/index.php?menu=quicknav&item=search&search=true&group=razor1911', 23294, NULL, '2007-03-08 17:02:47'),
('rebels', 'Rebels', NULL, '1992', '2002', NULL, 'RBL', 'utility', 'includes/documentsweb/rebels/index.html', 'http://www.rebels.team.pro', 'rebels', NULL, NULL, NULL, 2430, '2006-08-24 20:47:11', '2007-02-04 03:21:47'),
('reloaded', 'Reloaded', NULL, '2004', '2007', NULL, 'rld', 'iso games', NULL, NULL, 'Reloaded', 'http://en.wikipedia.org/wiki/Reloaded', 'http://www.theisonews.com/search-process.php?releasegroupS=Reloaded', 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=Reloaded', 10382, '2006-09-22 04:32:30', '2007-04-15 04:08:51'),
('risc', 'Rise In Superior Couring', 'RISC, RISCISO', '1993', '2005', NULL, 'risc', 'courier, games iso, application iso', NULL, NULL, NULL, NULL, 'http://www.theisonews.com/search-process.php?releasegroupS=RISCISO', 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=RISCISO', 2494, '2006-08-24 21:27:53', NULL),
('rise', 'Rise', 'Really Into Spreading Elite, RiseISO', '1994', '2006', NULL, 'rise', 'courier, utility', NULL, NULL, NULL, NULL, 'http://www.theisonews.com/search-process.php?releasegroupS=rise', 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=rise', 2376, '2006-08-24 19:47:29', NULL),
('rlx', 'Reflux', NULL, '1996', '1998', NULL, 'rlx', 'rip games', NULL, NULL, NULL, NULL, NULL, NULL, 2218, '2006-08-25 03:12:24', NULL),
('rom', 'Rom Light', NULL, '1995', '1996', NULL, 'rom', 'rip games', NULL, NULL, 'Rom Light', NULL, NULL, NULL, 1890, NULL, NULL),
('scoopex', 'Scoopex', NULL, '1993', '1993', NULL, 'scx', 'floppy games', NULL, 'http://www.scoopex.org', 'Scoopex', NULL, NULL, NULL, 2086, NULL, NULL),
('scotch', 'Scotch', NULL, '1993', '1994', '2000-2004', 'scotch', 'floppy games, utility, iso application', NULL, NULL, NULL, NULL, 'http://www.theisonews.com/search-process.php?releasegroupS=scotch', 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=scotch', 1872, '2006-08-24 04:51:21', NULL),
('shock', 'Shock', 'ShockISO', '1996', '2006', NULL, 'shock', 'application', 'includes/documentsweb/shock/main.html', NULL, 'Shock', NULL, 'http://www.theisonews.com/search-process.php?releasegroupS=Shock', 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=SHOCK', 3142, '2006-08-23 03:42:59', NULL),
('skidrow', 'Skid Row', 'originally co-released with The Dream Team', '1991', '1991', '1993', 'skid', 'floppy games', NULL, 'http://www.skidrow.dk', 'Skidrow', NULL, NULL, NULL, 6871, NULL, '2007-08-14 09:14:35'),
('skillion', 'Skillion', NULL, '1991', '1993', NULL, 'skill', 'floppy games', NULL, NULL, 'Skillion', NULL, NULL, NULL, 2058, NULL, NULL),
('sodom', 'Sodom', NULL, '1995', '1998', NULL, 'sdm', 'utility, application', 'includes/documentsweb/sodom.1/index.html', NULL, 'Sodom', NULL, NULL, NULL, 2844, NULL, NULL),
('spa', 'Software Piracy Association', NULL, '1996', '1998', NULL, 'SPA', 'rules', NULL, NULL, NULL, NULL, NULL, NULL, 1109, '2007-05-24 23:18:48', '2008-02-28 16:56:54'),
('sprint', '$print', 'also listed as Sprint', '1988', '1989', NULL, '$print', 'floppy games', NULL, NULL, NULL, NULL, NULL, NULL, 1628, NULL, '2007-01-12 05:16:22'),
('tarjan', 'Tarjan', NULL, '1991', '1991', NULL, 'Tarjan', 'floppy games', NULL, NULL, NULL, NULL, NULL, NULL, 1541, '2006-08-21 23:40:10', NULL),
('tdt', 'The Dream Team', NULL, '1989', '1994', '1995 & 1996', 'tdt', 'floppy games', NULL, NULL, 'The Dream Team', NULL, NULL, NULL, 4904, NULL, '2007-01-12 06:23:51'),
('tdt-trsi', 'The Dream Team / Tristar & Red Sector Inc.', NULL, '1991', '1991', NULL, 'tdt-trsi', 'floppy games', NULL, NULL, 'TDT and TRSi', NULL, NULL, NULL, 2340, NULL, NULL),
('tdu', 'TDU-Jam', NULL, '1994', '1995', NULL, 'tdu', 'rip games', NULL, NULL, 'TDU-Jam', NULL, NULL, NULL, 2590, '2006-08-25 08:58:56', NULL),
('tgc', 'The Grand Council', NULL, '1988', '1988', NULL, 'tgc', 'floppy games', NULL, NULL, 'The Grand Council', NULL, NULL, NULL, 2036, NULL, '2007-01-12 05:41:48'),
('thefaction', 'The Faction', NULL, '1998', '2000', NULL, 'TF', 'rules', NULL, NULL, NULL, NULL, NULL, NULL, 1247, '2007-06-25 20:10:29', NULL),
('thg', 'The Humble Guys', NULL, '1989', '1995', NULL, 'thg', 'floppy games', NULL, NULL, 'The Humble Guys', 'http://en.wikipedia.org/wiki/The_Humble_Guys', NULL, NULL, 5601, NULL, '2007-06-05 19:26:03'),
('tnt', 'The Nova Team', NULL, '1998', '2008', NULL, 'tnt', 'miscellaneous', NULL, NULL, NULL, NULL, NULL, NULL, 1082, '2008-01-08 07:26:15', '2008-01-08 07:41:59'),
('tnwc', 'The North West Connection', NULL, '1988', '1988', NULL, 'tnwc', 'floppy games', NULL, NULL, NULL, NULL, NULL, NULL, 2020, NULL, '2007-01-12 06:07:58'),
('triad', 'Triad', NULL, '1989', '1990', NULL, 'triad', 'Games', NULL, NULL, NULL, NULL, NULL, NULL, 2210, NULL, '2007-01-12 06:48:24'),
('trn', 'Tyranny', NULL, '1994', '1996', NULL, 'trn', 'floppy games', NULL, NULL, 'Tyranny', NULL, NULL, NULL, 1442, NULL, '2007-05-24 22:12:35'),
('trsi', 'Tristar &amp; Red Sector Inc.', NULL, '1991', '1995', NULL, 'trsi', 'floppy games', NULL, 'http://www.trsi.org', 'Tristar & Red Sector Inc', NULL, NULL, NULL, 4728, NULL, NULL),
('tsan', 'The Sysops Association Network', NULL, '1984', '1992', NULL, 'tsan', 'floppy games', NULL, NULL, NULL, NULL, NULL, NULL, 2859, NULL, '2007-01-14 21:01:18'),
('ucf', 'United Cracking Force', 'UCF2000', '1994', '2005', NULL, 'ucf', 'cracking', NULL, NULL, 'United Cracking Force', 'http://en.wikipedia.org/wiki/UNITED_cRACKING_fORCE', NULL, 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=UCF', 4190, '2006-08-23 01:07:10', NULL),
('ugc', 'Underground Council', NULL, '1989', '1989', NULL, 'ugc', 'floppy games', NULL, NULL, NULL, NULL, NULL, NULL, 1684, NULL, '2007-01-12 06:50:00'),
('unt', 'The Untouchables', NULL, '1993', '1993', NULL, 'unt', 'floppy games', NULL, NULL, 'The Untouchables', NULL, NULL, NULL, 1926, NULL, NULL),
('usa', 'United Software Association/Fairlight', NULL, '1991', '1992', NULL, 'usa/flt', 'floppy games', NULL, NULL, 'USA and Fairlight', 'http://en.wikipedia.org/wiki/United_Software_Association', NULL, NULL, 4320, NULL, '2007-02-04 01:36:22'),
('velcouriers', 'Velocity Couriers', NULL, '1992', '1998', NULL, 'VC', 'courier, iso games, application', NULL, NULL, NULL, NULL, NULL, NULL, 1916, '2006-08-23 00:18:47', NULL),
('vgc', 'Vengeance', NULL, '2004', '2005', NULL, 'vgc', 'iso games', NULL, NULL, NULL, NULL, 'http://www.theisonews.com/search-process.php?releasegroupS=Vengeance', 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=Vengeance', 4045, '2006-08-24 04:29:50', '2007-04-15 02:52:31'),
('vitality', 'Vitality', NULL, '2005', '2007', NULL, 'vty', 'games', NULL, NULL, NULL, NULL, NULL, 'http://www.nforce.nl/index.php?switchto=nfos&menu=quicknav&item=search&search=true&group=VITALITY', 5283, '2007-01-27 19:52:44', '2007-06-25 19:56:18');
