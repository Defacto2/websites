-- phpMyAdmin SQL Dump
-- version 2.11.1
-- http://www.phpmyadmin.net
--
-- Host: thompson.safesecureweb.com
-- Generation Time: May 27, 2009 at 06:23 AM
-- Server version: 4.1.18
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `defacto2net`
--

-- --------------------------------------------------------

--
-- Table structure for table `magazinesecretcodes`
--

CREATE TABLE IF NOT EXISTS `magazinesecretcodes` (
  `id` int(10) NOT NULL auto_increment,
  `magazine` varchar(255) default NULL,
  `code` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `magazinesecretcodes`
--

INSERT INTO `magazinesecretcodes` (`id`, `magazine`, `code`) VALUES
(1, 'Affinity Issue 9', 'Type ''bill gates'' on the main menu'),
(2, 'Affinity Issue 10', 'Type ''unabomber'' on the main menu'),
(3, 'Reality Check Network 14', 'TKRP'),
(4, 'Reality Check Network 15', 'HITAX'),
(5, 'Reality Check Network 16', 'DEFACTOE'),
(6, 'Reality Check Network 17', 'DEXTROMETHORPHAN'),
(7, 'Reality Check Network 18', 'EMILY'),
(8, 'Reality Check Network 19', '504-3066'),
(9, 'Reality Check Network 20', 'COREFART'),
(10, 'Reality Check Network 21', 'ENTROPHY'),
(11, 'Reality Check Network 22', 'HEATHER'),
(12, 'Reality Check Network 23', 'MK3'),
(13, 'Reality Check Network 24', 'PRESBUDGET'),
(14, 'Reality Check Network 25', 'RISC'),
(15, 'Reality Check Network 26', 'FOX'),
(16, 'Reality Check Network 27', 'CAT'),
(17, 'Reality Check Network 28', 'MOJO'),
(18, 'Reality Check Network 29', 'ARCH-VILE'),
(19, 'Reality Check Network 30', 'KIKI'),
(20, 'Reality Check Network 31', 'RCN'),
(21, 'Reality Check Network 33', 'ACE'),
(22, 'Reality Check Network 35', 'BLUEPHUZ'),
(23, 'Reality Check Network 36', 'RCN4EVER'),
(24, 'Reality Check Network 37', 'RBLC_IN_HK');
