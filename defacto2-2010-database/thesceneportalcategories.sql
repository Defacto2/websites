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
-- Table structure for table `thesceneportalcategories`
--

CREATE TABLE IF NOT EXISTS `thesceneportalcategories` (
  `CatName` varchar(50) NOT NULL default '',
  `CatDesc` longtext,
  PRIMARY KEY  (`CatName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `thesceneportalcategories`
--

INSERT INTO `thesceneportalcategories` (`CatName`, `CatDesc`) VALUES
('Art', 'The phrase computer art scene or artscene for short refers to a community of individuals and groups who are interested and active in the creation of computer-based artwork.\r\n<p></p>\r\nThe demoscene is a computer sub-culture that came to prominence during the rise of the 16 bit micros (the Atari ST and the Amiga), but demos first appeared during the 8-bit era on computers such as C64 and ZX Spectrum.\r\n<p></p>\r\nDemos began as software cracker''s ''signatures''. When a cracked program was started, the cracker or his team would take credit via an increasingly impressive-looking graphical introduction called a "cracktro". The first time this appeared was on the Apple II computers in the late 1970s and early 1980s. Later, these intros evolved into their own subculture independent of cracking software. These were not initially called demos but rather letter, message, et cetera.\r\n<p></p>\r\n<a href="http://en.wikipedia.org/wiki/Demoscene">Taken from Wikipedia</a>'),
('Emulation', 'An emulator, in the most general sense, duplicates (provide an emulation of) the functions of one system with a different system, so that the second system appears to behave like the first system.\r\n<p></p>\r\nMost emulators just emulate a hardware architecture — if a specific operating system is required for the desired software, it must be provided as well (and may itself be emulated). Both the OS and the software will then be interpreted by the emulator, rather than being run by native hardware. Apart from this interpreter for the emulated machine''s language, some other hardware (such as input or output devices) must be provided in virtual form as well: if writing to a specific memory location should influence the screen, for example, this will have to be emulated as well.\r\n<p></p>\r\nA popular use of emulators is to run software and games, often referred to as ROMs, written for hardware that is no longer sold or readily available, such as the Commodore 64 or early Amiga models. Emulating these on modern desktop computers is usually less cumbersome than relying on the original machine, which may be inoperational. However, software licensing issues may require emulator authors to write original software that duplicates the functionality of the original computer''s bootstrap ROM and BIOS, often through high-level emulation.\r\n<p></p>\r\n &nbsp; <a href="http://en.wikipedia.org/wiki/Emulation">Taken from Wikipedia</a>'),
('Gaming', 'Formally, a computer game is a game composed of a computer-controlled virtual universe that players may interact with in order to achieve a goal (or set of goals). A video game is a computer game where a video display is the primary feedback device.\r\n<p></p>\r\nHowever, in common usage "computer game" refers to games played on a personal computer, while "video game" (or "videogame") refers to games played on a video game console. Both "computer games" and "video games" are frequently used as umbrella terms for interactive game software. To avoid ambiguity, this game software is referred to as "computer and video games".\r\n<p></p>\r\n &nbsp; <a href="http://en.wikipedia.org/wiki/Computer_and_video_games">Taken from Wikipedia</a>'),
('Music', 'Modules are digital music files, made up of a set of samples (the instruments) and sequencing information, telling a mod player when to play which sample on which track at what pitch, optionally performing an effect like vibrato, for example. Thus mods are different from pure sample files such as WAV or AU, which contain no sequencing information, and MIDI files, which do not include any custom samples/instruments. Mods are extremely popular in the demo world and offer a way of making music of an acceptable level of quality rather cheaply. With the advent of high-quality sound hardware, new generations of mods may even rise to a sound quality nearing that of professional equipment.'),
('Old School', 'Old School is a slang term referring to old ways of thinking or acting, and to old objects in general within the context of popular culture of the 1970s, 1980s and 1990s (while it refers to vinyl, it is not generally used to describe wax cylinders). It generally does not have a negative connotation (cf. obsolete or out dated). The border for old school for computer games is often drawn at 3D and 32-bit games.<p></p> &nbsp; <a href="http://en.wikipedia.org/wiki/Old_school">Taken from Wikipedia</a>'),
('Torrent', 'Wikipedia states that BitTorrent is a peer-to-peer file sharing protocol used to distribute large amounts of data. BitTorrent is one of the most common protocols for transferring large files, and by some estimates it accounts for about 35% of all traffic on the entire Internet. The initial distributor of the complete file or collection acts as the first seed. Each peer who downloads the data also uploads it to other peers. Because of this, BitTorrent is extremely efficient. One seed is needed to begin spreading files between many users (peers). The additions of more seeds increases the likelihood of a successful connection exponentially. Relative to standard Internet hosting, this provides a significant reduction in the original distributor''s hardware and bandwidth resource costs. It also provides redundancy against system problems and reduces dependence on the original distributor.\r\n<p>Here we will list legal, scene related torrents.</p>');
