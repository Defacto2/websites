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
-- Table structure for table `documentstypes`
--

CREATE TABLE IF NOT EXISTS `documentstypes` (
  `Type` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`Type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `documentstypes`
--

INSERT INTO `documentstypes` (`Type`) VALUES
('EXE'),
('Html'),
('Link'),
('PDF'),
('Text'),
('XML');
