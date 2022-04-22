-- phpMyAdmin SQL Dump
-- version 2.11.1
-- http://www.phpmyadmin.net
--
-- Host: thompson.safesecureweb.com
-- Generation Time: May 27, 2009 at 06:28 AM
-- Server version: 4.1.18
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `defacto2net`
--

-- --------------------------------------------------------

--
-- Table structure for table `thesceneportalstatuscheck`
--

CREATE TABLE IF NOT EXISTS `thesceneportalstatuscheck` (
  `id` int(10) NOT NULL default '0',
  `lastStatusCheck` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thesceneportalstatuscheck`
--

INSERT INTO `thesceneportalstatuscheck` (`id`, `lastStatusCheck`) VALUES
(1, '2008-07-28 15:02:18');
