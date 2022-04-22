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
-- Table structure for table `statisticsmaximumvisits`
--

CREATE TABLE IF NOT EXISTS `statisticsmaximumvisits` (
  `id` int(10) NOT NULL default '0',
  `maxVisits` int(10) default NULL,
  `maxVisitsDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statisticsmaximumvisits`
--

INSERT INTO `statisticsmaximumvisits` (`id`, `maxVisits`, `maxVisitsDate`) VALUES
(1, 878, '2006-11-30 08:07:33');
