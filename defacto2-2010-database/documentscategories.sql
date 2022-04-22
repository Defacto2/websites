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
-- Table structure for table `documentscategories`
--

CREATE TABLE IF NOT EXISTS `documentscategories` (
  `Category` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`Category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `documentscategories`
--

INSERT INTO `documentscategories` (`Category`) VALUES
('Amiga'),
('Apple II'),
('Arrests and Busts'),
('Atari ST'),
('BBS File Lists'),
('Cheating'),
('General Websites'),
('Group Applications'),
('Miscellaneous'),
('Newbies'),
('Personal File Lists'),
('Published Articles'),
('Retirements'),
('Rules');
