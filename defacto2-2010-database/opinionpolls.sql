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
-- Table structure for table `opinionpolls`
--

CREATE TABLE IF NOT EXISTS `opinionpolls` (
  `topicNumber` int(10) NOT NULL auto_increment,
  `question` longtext,
  `status` varchar(6) default NULL,
  `option1` varchar(255) default NULL,
  `option1desc` varchar(255) default NULL,
  `option2` varchar(255) default NULL,
  `option2desc` varchar(255) default NULL,
  `option3` varchar(255) default NULL,
  `option3desc` varchar(255) default NULL,
  `option4` varchar(255) default NULL,
  `option4desc` varchar(255) default NULL,
  `option5` varchar(255) default NULL,
  `option5desc` varchar(255) default NULL,
  `option6` varchar(255) default NULL,
  `option6desc` varchar(255) default NULL,
  `option7` varchar(255) default NULL,
  `option7desc` varchar(255) default NULL,
  `option8` varchar(255) default NULL,
  `option8desc` varchar(255) default NULL,
  `option9` varchar(255) default NULL,
  `option9desc` varchar(255) default NULL,
  PRIMARY KEY  (`topicNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `opinionpolls`
--

INSERT INTO `opinionpolls` (`topicNumber`, `question`, `status`, `option1`, `option1desc`, `option2`, `option2desc`, `option3`, `option3desc`, `option4`, `option4desc`, `option5`, `option5desc`, `option6`, `option6desc`, `option7`, `option7desc`, `option8`, `option8desc`, `option9`, `option9desc`) VALUES
(1, 'During their time on the scene which cd-rip group had the biggest impact', 'close', 'Hybrid', 'The guys who pioneered the professional rip', 'TDU-Jam', 'Dominated the new rip scene, then quit while ontop', 'Razor', 'The most famous scene brand of all time', 'Paradigm', 'Before they merged, they were one of the few groups who were able to bring the fight upto Class', 'Prestige', 'An Amiga group who rose to become number in 1996, but the bust of their founder bought them crashing down by the years end', 'Class', '1,234 releases over 7 years', 'Divine', 'The oldest surviving brand that’s still active today, eight years and still going strong', 'Myth', 'Take one new millennium, add one part Paradigm and one part Origin, mix and bake.', NULL, NULL),
(2, 'What was your all time favourite scene magazine', 'close', 'The Netmonkey Weekly Report', 'While issues varied in quality this courier magazine did last for nearly 80 issues', 'Reality Check Network', 'At their peak they commanded as much influence as any top scene group', 'The Naked Truth Magazine', 'A very under-rated magazine that scored some excellent interviews', 'Inquisition', 'The unofficial DOD and Razor magazine that fought RCN and lost', 'Defacto2', 'This was our magazine from nearly 10 years ago. Lots of great interviews from the era', 'Scenelink', 'The scene''s first and only ever web based magazine, that also covered all the scenes united', 'Insanity', 'Probably the classiest magazine from the early 1990s PC scene', 'Affinity', 'Often late, but always presented with style', 'Adrenalin', 'Probably the best magazine from the pre-1995 era'),
(3, 'What was your favourite scene game review publication.', 'close', 'The Gamers Edge', 'In 1997 publication that had multiple indepth reviews in every issue.', 'The Review Guild', 'In the late 90''s these guys used to compile each individual game review as a separate magazine.', 'www.game-over.net', 'Now a legit site after it''s founder was busted for scene related activities. Originally this was the first web based scene game review publication.', 'The Game Review by Ionizer', 'The guy did 60 issues over a near 3 year period. Was the most well known review during its time.', 'Galatic Review', 'An old very early 1990s coded review magazine. Would later turn up in issues of Lancelot 2.', 'I never read scene game review magazines.', 'Professional publications did a better job..', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Which would have been the best PC scene to be apart of during their heyday', 'close', 'The Innocent Years (pre-1990)', 'The scene was small, fragmented and casual. Groups and BBS used to take requests instead of releasing everything as 0 day but it was also a lot friendlier and laidback.', 'The BBS era (1990-95)', 'The scene was now professional with groups spending big money to compete with each other but it still remained very obscure and elitist.', 'The RIP period (1996-1999)', 'BBSes die and the internet takes over. The scene is now one big collective with lots of public fighting and is a lot more open. Think public IRC channels, magazines, group websites, web forums …', 'The ISO emergence (1999-2002)', 'P2P exposed the scene more then ever to the mainstream. The PC pirate scene loses its dominance as the premier scene but at least now you can download complete (non-ripped) games again.', 'Post busts (2003-)', 'Major groups are taken down in numerous busts causing the scene to eventually go back to its secretive underground roots. Cracking starts to lose favour to cloning.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'What is your favorite retro early 80s computer', 'close', 'Apple II', 'Before the Mac, before GUI, before well lots of things there was this green screen little monster.', 'Commodore 64', 'The most popular computer of all time!', 'Spectrum ZX', 'From a quirky UK inventor who made computers affordable.', 'Amstrad CPC', 'The graphics on this always reminded me of a NES, except blockier.', 'IBM Jr/Tandy 1000', 'It was based on a PC, yet had a lot better graphics and sound.', 'IBM 8088 XT', 'One channel beeping sound, 4 colour graphics and cost a bomb. But they were modular and expandable.', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'How often do you visit Defacto2.net', 'close', 'Once a day', 'I need to make sure I am always upto date with any changes or news.', 'Once a week', 'Defacto2 isn''t updated enough for me to frequent it more often.', 'Once a month', 'I am a casual visitor.', 'Once every few months', 'I am a very casual visitor.', 'Once a year or less', 'I keep on forgetting about it.', 'This is my first visit.', 'I am a newbie.', 'I used the web feeds.', 'I don''t regularly visit, but I use the RSS/Atom web feeds to keep upto date.', NULL, NULL, NULL, NULL),
(7, 'What is your favourite aspect of Defacto2', 'close', 'The Scene News', NULL, 'The Scene Portal', NULL, 'Cracktros', 'The cracktros and the cracktro packs', 'BBS', 'The BBS section and the BBS files', 'NFO', 'The NFO packs and online collection of 6000 files', 'Mags', 'The magazine collections; coded, text and web based', 'Groups', 'The group repository', 'Documents', 'The document section', 'ISO', 'The irregular released Defacto2 ISO image'),
(8, 'What would you class your status in the scene', 'close', 'Active', 'I participate in day to day runnings or in day to day leaching', 'Idle', 'Im still always around, though not doing the leg work', 'Retired Observer', 'Im not in the scene anymore but I keep in the know with whats happening', 'Retired', 'I once was in the scene but now have nothing to do with it', 'Long Since Retired', 'We used floppy discs in our day', 'Whats The Scene?', 'I just stumbled onto this web site', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'What was your favourite retro late 80s computer', 'close', 'Commodore Amiga', 'Custom graphics chips, digital audio and a GUI OS made this machine a multimedia fest long before the term became cliche.', 'Atari ST', 'Arch rival to the Amiga, it was cheaper and included a built-in MIDI interface. Making it a favorite for musicians.', 'IBM PC (or compatible) 286 processor with a EGA graphics', 'Most popular in the US, PCs were slower, less pretty (graphics wise) and more expensive then other 16-bit machines. But they were very easy to expand and upgrade.', 'Tandy 1000', 'These were basically PC-Jr computers that eventually became a standard in themselves. Supporting 3 channel sound (as oppose to the PC''s 1) and low resolution EGA graphics these were a popular and compatible gaming alternative to the PC.', 'Apple Macintosh', 'This little machine broke new grounds in design and also introduced it''s borrowed GUI to the mainstream computering public. Unfortunately it had a tiny screen, was expensive and only supported monochrome (b/w) graphics.', 'Commodore C64', 'This little machine while dated, was extremely cheap by this period. It is afterall the highest selling computer of all time.', 'Acorn Archimedes', 'Probably the most powerful home computer on release. It really didn''t have any success outside the UK, Australisia and Ireland.', NULL, NULL, NULL, NULL),
(10, 'If Defacto2 introduced a login/password registration system for the allowing of user comments & ratings for the cracktros/magazines/etc and also introduced a site forum, would you use it', 'close', 'Yes', NULL, 'No, it''s not my thing', NULL, 'No, im very conscious about my privacy', NULL, 'Maybe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'What is the least acceptable element of the computer underground counterculture?', 'close', 'Hackers', 'People who break into systems with malicious intentions.', 'Warez', 'People who pirate digital media because they choose not to pay for it.', 'Virii', 'People who create and spread programs with a malicious intent.', 'Anarchists', 'People who are in real life social anarchists and criminals and their online underground activities are just an extension of those.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'What do you class as the underground oldskool scene', 'open', 'A few years', 'Anything from the mid-naughties or earlier', 'Pre-millennium', 'Prior 2000, the early ISO or the mature rip scene', '1997 or earlier', 'Back when groups like Class, Razor and Paradigm ripped the scene', '1995 or earlier', 'The ripping scene was brand new and the floppy were on it''s last legs', '1993 or earlier', 'Fairlight, TRSI, Public Enemy, The Humble Guys, The Dream Team and Razor floppy days', '1991 or earlier', 'The infamous International Network of Crackers and Humble Guys wars', '1989 or earlier', 'Back when The Firm and others ruled, Aces of ANSI Art and the PC art scene were founded', NULL, NULL, NULL, NULL);
