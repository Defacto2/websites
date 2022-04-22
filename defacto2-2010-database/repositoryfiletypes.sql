-- phpMyAdmin SQL Dump
-- version 2.11.1
-- http://www.phpmyadmin.net
--
-- Host: thompson.safesecureweb.com
-- Generation Time: May 27, 2009 at 06:24 AM
-- Server version: 4.1.18
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `defacto2net`
--

-- --------------------------------------------------------

--
-- Table structure for table `repositoryfiletypes`
--

CREATE TABLE IF NOT EXISTS `repositoryfiletypes` (
  `type` varchar(255) NOT NULL default '',
  `desc` longtext,
  PRIMARY KEY  (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `repositoryfiletypes`
--

INSERT INTO `repositoryfiletypes` (`type`, `desc`) VALUES
('Advert', NULL),
('ANSI Logo', NULL),
('ASCII Logo', NULL),
('BBS Advert', NULL),
('EXE NFO', NULL),
('Image', NULL),
('Interview', NULL),
('Logo', NULL),
('Newsletter', NULL),
('NFO', NULL),
('Text', NULL),
('Video', NULL);
