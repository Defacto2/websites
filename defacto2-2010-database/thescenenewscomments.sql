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
-- Table structure for table `thescenenewscomments`
--

CREATE TABLE IF NOT EXISTS `thescenenewscomments` (
  `id` int(10) NOT NULL auto_increment,
  `blogID` int(10) default NULL,
  `OBCTime` datetime default NULL,
  `nick` varchar(50) default NULL,
  `subject` varchar(255) default NULL,
  `comment` longtext,
  PRIMARY KEY  (`id`),
  KEY `Index_2` (`blogID`,`OBCTime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=144 ;

--
-- Dumping data for table `thescenenewscomments`
--

INSERT INTO `thescenenewscomments` (`id`, `blogID`, `OBCTime`, `nick`, `subject`, `comment`) VALUES
(53, 116, '2005-04-27 20:38:22', 'Ipggi', NULL, '[b]Hoorah![/b]'),
(54, 113, '2005-05-07 14:00:28', 'Anon', 'You mean Pirate ships?', 'either you are sick in the head or you appear to imply that some unknown "secret government" is trying to position people on effective pirate ships?\r\rin all jest, I think the american government would actually be stupid enough to try to pull that type of shit off...\r\rwant to take me along?'),
(55, 122, '2005-05-26 21:52:49', 'Ipggi', 'Favorate Cracktro', 'My favorate cracktro out of that bunch would have to be ''hlm_intro3''. Its a cracktro for Hoodlum created by Hitchhikr. It''s quite different from the usual clones and is one of the few that I have bothered to watch to the end! :P'),
(56, 121, '2005-06-07 14:47:18', 'somecunt', 'about other cunts', 'How can anyone just put numbers on that? Where do they get them from? Riiight pulled out the ass hey?  It''s all propaganda, these compagnies shouldn''t even exist.  Wake up ffs.  And no i don''t pirate applications or anything because,  1 i''m pretty happy with linux and all it''s free goodness.  2 the only other thing you would need a commercial os like windows is for games, and they don''t even intrest me in the slightest, if i want games i''ll go play football with my son.  But all this doesn''t mean that all this stupid propaganda is really starting to get on my frekkin nerves.  GET A REAL FUCKIN JOB ASSHOLES INSTEAD OF THRIVING ON GREY ZONE ACTIVITIES.  If you bring something to the market you''d better be able to handle your own protection instead of letting dodgy organisations handle it.  you can''t swim? too bad get out the frekkin pool or learn how to swim.\r\r*END RANT*'),
(57, 125, '2005-06-15 03:17:37', 'Ipggi', 'Slashdot', 'Here are some Slashdot comments about this topic.\r\r[a]http://yro.slashdot.org/yro/05/06/14/209207.shtml?tid=155&tid=185[/a]'),
(58, 127, '2005-07-01 04:54:53', 'Ipggi', 'More articles but different articles', '[a]http://www.macworld.com/news/2005/06/30/warezcrackdown/index.php[/a][br]\r[a]http://www.internetnews.com/bus-news/article.php/3517011[/a][br]\r[a]http://www.networkworld.com/news/2005/063005-fbi-warez.html[/a][br]\r[a]http://www.theinquirer.net/?article=24316[/a][br]\r[a]http://addict3d.org/index.php?page=viewarticle&type=news&ID=7980[/a][br]'),
(59, 127, '2005-07-05 06:53:27', 'Four Names Given', NULL, '"The persons arrested during this campaign are William Venya, aged 34, from Chatsworth; Chirayu Patel, aged 23, from Fremont; Nate Lovell, 22-years old, from Boulder, Colorado; and David Fish, aged 24, from Watertown, Conneticut. Each of them has been charged with copyright infringement and conspiracy to commit such acts. The four will be brought before a court of law in San Jose by July 14, 2005."\r\r[a]http://news.softpedia.com/news/The-FBI-Cracks-Down-on-Warez-Computers-4206.shtml[/a]'),
(60, 128, '2005-07-13 05:36:26', 'ahti0a11', 'Group repository', 'I''d like to see following groups added:\r\rTRSI\rFAIRLIGHT\rHOODLUM\rCRYSTAL\rRAZOR 1911\rHORIZON\rSKID ROW\rPARANOIMIA\rPARADOX\rAGILE\rANGELS\rENDLESS PIRACY\rLEGEND\rZENITH\r\r\rAnd many more......\r'),
(61, 127, '2005-07-15 22:31:02', 'test', 'test', 'test\r'),
(62, 128, '2005-07-16 22:29:38', 'Ipggi', NULL, 'We have a few of those suggested groups lined up.. problem is some of the big groups like Razor have alot of files that need sorting through, but we will get there.'),
(63, 132, '2005-07-30 04:06:04', 'Ipggi', 'DOJ''s Official Press Release', 'The official press release from the DOJ can be found here [a]http://www.usdoj.gov/opa/pr/2005/July/05_crm_395.htm[/a]\r[p][i]\rWASHINGTON, D.C. - Acting Assistant Attorney General John C. Richter of the Criminal Division; Gretchen C. F. Shappert, U.S. Attorney for the Western District of North Carolina; and Robert F. Clifford, FBI Acting Special Agent-in-Charge of the Charlotte Division, today announced that eight individuals were charged with criminal copyright infringement in Charlotte, North Carolina, as part of an ongoing federal crackdown against the organized piracy groups responsible for most of the illegal distribution of copyrighted movies, software, games and music on the Internet. These are the first federal indictments arising from the Charlotte-based FBI investigation that identified targets in both Operations FastLink and Site Down - the two largest and most aggressive international enforcement actions against criminal organizations involved in the illegal online distribution of copyrighted material.[/i]'),
(64, 131, '2005-08-01 09:14:52', 'ahti0a11', NULL, 'It does not work.....'),
(65, 131, '2005-08-01 18:12:43', 'nms', 'error', 'The exact error is "Error type: Exception (Element OTHERNAME is undefined in GROUPSRS.)".\r:)'),
(66, 131, '2005-08-01 22:18:14', 'Ipggi', 'Fixed error', 'Sorry guys, the problem has been fixed.'),
(67, 135, '2005-08-30 12:12:26', 'MuadDib/Warpy', 'hurray its released !!!', 'if you download relativity or its source, post something here in return.. aint that cheap :)\r\rcheers.'),
(68, 138, '2005-10-01 11:45:06', 'irokos/titan', NULL, '\\o/ enjoy!'),
(69, 141, '2005-10-13 18:38:58', 'affinity`', 'myth', 'sad that they are leaving :('),
(70, 141, '2005-10-13 22:51:33', 'Ipggi', NULL, 'It''s ashame but group can last for ever .. though I must commend them for continuing the Paradigm tradition of showcasing artistic talent through their installers. cracktros, and the like.\r[p]\r[a]http://www.defacto2.net/cracktros-detail.cfm?type=group&value=Myth[/a]'),
(71, 141, '2005-10-16 19:52:40', 'kpsp', ':(', 'I''m very sad that they''re leaving.. MYTH was one of the few groups you really could trust doing the job. And they''re right about what they''re writing in their last nfo about public sites (nforce etc), P2P, curriers, etc. The scene has imho died more and more the last years due to this. Too bad. Its not what it once was. And will never be again.'),
(72, 141, '2005-11-24 11:18:22', 'MOOSE', NULL, 'even my gran could download scene rips these days.  releases hit torrents sites within minutes of being pre''d\r\rv.sad'),
(73, 141, '2005-11-25 01:16:21', 'js92647', 'I might as well contribute', 'I have a lot of Myth (and Class, etc...) groups'' installers that Defacto2 doesn''t have.  Is there any way I can add these?\r\r\rSo sad to see Myth leaving :/.\r'),
(74, 141, '2005-11-28 07:18:58', 'Ipggi', 'Re: I might as well contribute', 'Just leave an email using the contact form (there is a link at the bottom of every page and at the top of the main page)'),
(75, 143, '2005-12-11 17:46:30', 'irokos/titan^acid', 'Poll Results', 'Cool thing :)'),
(76, 145, '2006-01-06 19:50:21', 'irokos/Titan.', NULL, 'I can host it for sure bro :)\rYou know how to contact me ;)'),
(77, 145, '2006-01-08 08:19:41', 'Wack0^[ZMC/ZAT]', 'ed2k share', 'If you want ed2k shares for the Defacto2 ISO Pack, I can help.\rAlso, I have some installers dotted around on different systems that you can have.'),
(78, 145, '2006-01-08 17:15:42', 'Ipggi', 'ed2k share', 'Wack0^ can you get in contact with me using the ''Contact Us'' form ..\r\rirokos : ill hunt you down then :P\r\rCheers\r\r'),
(79, 145, '2006-01-09 20:51:15', 'irokos/Titan', NULL, 'No problems brotha :)\rhehe :)'),
(80, 145, '2006-01-10 11:54:30', 'Wack0', NULL, 'I''m the same person who gave you the oxygen cracktro + nfo files...'),
(81, 146, '2006-01-12 20:29:33', 'h0bby1', NULL, 'no comment'),
(82, 145, '2006-01-17 00:42:11', 'Ipggi', 'Broken links', 'We know the links are currently broken, they will be fixed soon.'),
(83, 148, '2006-01-20 16:42:36', 'impact', 'Wow!', 'FBI sucks! Why they destroying the scene? Razor1911 was/is the BEST group ever!'),
(84, 153, '2006-02-02 20:41:58', 'Ipggi', 'You cant hide anywhere', 'This is the second Australian to face deportation to the US now. The ironic thing is, their apparent crimes are not considered illegal in Australia and hence they have not been charged in their own countries.\r\r[i]Mr Fitzpatrick said the group was not motivated by profit but created an online library for a restricted number of people to access[/i]\r\rThis statement says alot about the US in general, were corporation''s rights usually always supercsede individual rights. Then again I guess its the corporations who can afford to make the big political donations ..'),
(85, 153, '2006-02-02 23:55:12', 'Knives', NULL, 'Here in the U.S, people on trial and corporations on trial are treated vastly different. The normal person is automatically considered to have done it and don''t get very many breaks in trial, while the corporations have to be "investigated," and they can mess up all they want to in trial. Least that''s what I''ve seen from experience.'),
(86, 150, '2006-02-03 18:36:33', 'anon', 'hm', 'Sure he did not know that it was illegal, and i don''t see the point in making websites like these, why are the kids gonna care about it? Or even read anythin on that site? Kids do not think they''re gonna be the one getting caught, and they probably wont. And sceners who read stuff like this doesn''t care, once you get into the scene, you''re addicted. '),
(87, 150, '2006-02-03 18:54:33', 'Ipggi', NULL, 'Its probably more targeted towards an end user rather then an active scene participant.'),
(88, 150, '2006-02-03 19:40:55', 'none', NULL, 'yeh i were not only talking about sceners, when i said kids i mean ppl who''s involved with p2p and shit, for them warez is just a good way to save a buck without "doing any harm".'),
(89, 153, '2006-02-06 00:35:28', 'the sinthetiq duck', 'Unfortunate...', 'It''s unfortunate to see the government continue to exert a tremendous effort on shutting down the scene.  When in reality the scene to scale with the everyday piracy and infringement is so much more significant.'),
(90, 148, '2006-02-06 11:40:22', 'xxx', 'Wow, indeed', 'Why?  Isn''t it obvious?  The FBI is ignorant.  Their ignorance is a direct result of manipulation by the entertainment and software industries who have continuously failed for the past 30 years to understand the way the world truly works.\r\rThey will never stop piracy.  If they even want to try, they should start doing it in a place that makes a little bit of sense.  Start knocking out pirate DVD vendors on the streets, bust and bury mass pirate CD/DVD replication plants, stop China from pirating (hah!  good luck!) or perhaps anything more useful than illegally arresting and detaining hobbyists who aren''t making a cent from this.'),
(91, 148, '2006-02-16 02:28:33', 'paris hilton nude', 'paris hilton nude', '<a href="http://paris-hilton-video.50megs.com/">Paris Hilton Nude</a>pictures and clips featuring hot nude galleries of celeb Paris Hilton.Paris Hiltons nude boob breast boobs suck fuck pictures and find out many more on <ahref="http://paris-hilton-video.50megs.com/">paris-hilton-video.50megs.com</a>.\r'),
(92, 148, '2006-02-16 02:31:15', 'paris hilton nude', 'paris hilton nude', '<a href="http://paris-hilton-video.50megs.com/">Paris Hilton Nude</a>pictures and clips featuring hot nude galleries of celeb Paris Hilton.Paris Hiltons nude boob breast boobs suck fuck pictures and find out many more on <ahref="http://paris-hilton-video.50megs.com/">paris-hilton-video.50megs.com</a>.\r'),
(93, 148, '2006-02-16 16:53:23', 'Ipggi', NULL, 'Lol the whole reason I used flashforms was to stop automated anonymous spam like this :P\r\rOh well nice try mr spammer.'),
(94, 148, '2006-02-20 00:44:31', 'paris hilton sex tape', 'paris hilton sex tape', 'THEORIGINAL<ahref="http://parishilton-photo.spaziofree.net/">PARIS    HILTON SEX TAPE</a> - COME HERE TO WATCH IT ALL. You can finally stop fantasizing about seeing her. There''s a lot more to be seen on <ahref="http://parishilton-photo.spaziofree.net/">PARIS    HILTON SEX TAPE</a>.We got it just 4 you.Watch it out\r'),
(95, 155, '2006-03-01 07:01:15', 'Ipggi', 'US Attorney''s Office 45 Page Indictment Against RISCISO', 'You can read the complete 45 inditment here.\r\rIt is an interesting read that isn''t full of legal mumbojumbo. It''s scary to see how much information they managed to obtain off these guys. No wonder O''Toole went awol.\r\r[a]http://www.defacto2.net/web.pages/us_v_o_toole_et_al.pdf[/a]'),
(96, 150, '2006-03-02 16:14:50', 'Soccrmastr', 'They have to do it', 'This is found on their front page \r\r"If you would like for us to come to your school to present, (its all free, part of our court mandated community service) send us a email at info@netmonkey.info"\r\rsee court mandated'),
(97, 156, '2006-03-02 16:34:19', 'irokos/Titan', 'Scene.org', 'And don''t forget to come to Breakpoint!! where the scene.org awards will be held! See you there <3'),
(98, 128, '2006-03-17 20:15:58', 'Alas', 'Groups That I''d Like To See:', 'Centropy\rTNT!Crackers\rC.O.R.E\r\r'),
(99, 155, '2006-03-23 01:22:16', 'fellow_aussie_buccaneer', 'good for him', 'i hope he gets to sweden'),
(100, 160, '2006-04-23 08:39:41', 'irokos/Titan', 'Happy birthday!', 'Happy birthday you old farts. <3'),
(101, 160, '2006-04-23 09:52:55', 'Ipggi', NULL, 'Go back to kindie-garden :P'),
(102, 160, '2006-04-23 14:40:59', '*', 'Happy Bday Guys!', 'Happy bday guys!'),
(103, 160, '2006-04-23 21:39:05', 'reeky', 'grats!', 'grats mates! keep up the good job'),
(104, 160, '2006-04-25 13:58:17', 'JOE from GDI-Software', NULL, 'Happy bday guys!!!!!!!'),
(105, 160, '2006-04-28 06:27:32', 'r3t', NULL, 'Congratulations!!'),
(106, 160, '2006-04-29 15:17:06', 'bert/R', NULL, 'Congrats, i love the awesome work you guys have done!'),
(107, 160, '2006-05-08 16:03:31', 'jul', NULL, 'happy birthday !!'),
(108, 161, '2006-05-10 15:20:05', 'Knives', NULL, 'Yeah, even if the feds could bust every single site in the scene, there''s always going to be more that will pop up and fill the void.\r\rAnd the feds wonder why the scene is so attractive: buying movies retail has copy protection, ads, ect. while getting movies from the scene gives you the same movies with no protection or ads or anything of the like.'),
(109, 160, '2006-05-18 23:17:39', 'antibody - retired-df2.sac.class', NULL, 'I can''t believe this site is still alive. '),
(110, 162, '2006-05-18 23:21:03', 'antibody', 'the link doesn''t work.', '... i vote for class. :)'),
(111, 150, '2006-05-19 10:56:33', 'Ex-scener', NULL, '"I had to find out the hard way. Copyright infringement IS a big deal. No one told me what I was doing was wrong. I didnt think I was breaking the law." \r\rNow that''s bullshit, he ran a site for years, saw dozens of actual bust and never closed his site, the first time i downloaded a free game off the internet, i knew i was doing something illegal. \r\r'),
(112, 160, '2006-05-19 20:13:56', 'heyjoe', 'Happy birthday!!!', 'I was in Df2 Artgroup seven years ago, i love this site is still alive and kicking!! :-)'),
(113, 162, '2006-05-20 22:09:32', 'Ipggi', NULL, 'I created my own option, ''Club PTL'' .. go the retro! :P'),
(114, 161, '2006-05-20 22:11:42', 'Ipggi', NULL, 'Though, the real reason most people obtain scene products is simple .. it''s free. If you decide to have a moral change of code and legally buy all your goods, you really have no reason or need to remain active in the scene?\r\rThough I guess for a number of people they do get stuff earlier through the scene then through legal channels. Ie lots of people in the UK and Australia leech TV shows that havnt been broadcast in their own countries at the time.'),
(115, 161, '2006-05-21 16:24:08', 'crcx', NULL, 'because the scene is cool, and because it''s sexy. and because it''s secretive.'),
(116, 160, '2006-06-02 22:08:55', 'roken', NULL, 'Wow ten years.... keep her going well boys!'),
(117, 163, '2006-06-09 15:18:05', 'Dan', 'nobody talking?', 'Surprised nobody''s talking about this here. The p2p kiddy forums are awash with bullshit. :)'),
(118, 158, '2006-06-10 06:51:31', 'notbigrar', 'we''ll trade cudney for griffiths and a player to be named', 'No one has ever written an article on James Cudney''s involvement as the leader of DoD, and his eventual flip to ''states evidence'' which led to all of the drinkordie bother.  Let''s ship him off to the .au, and let Hew just come finish off his time.  Everyone else is done now, just let it go away at this point ....'),
(119, 163, '2006-06-10 19:26:04', 'Ipggi', NULL, 'Well this isnt a P2P kiddy forum is it ? :>'),
(120, 163, '2006-06-11 12:13:53', 'dan', NULL, 'indeed not, it''s a scene forum. And the events of 08 Jun affect the scene, and unfortunately not just colos this time.'),
(121, 163, '2006-06-12 16:11:20', '.', NULL, 'Still groups have''nt learned their lesson of stayin away from .us sites.'),
(122, 163, '2006-06-12 21:33:06', 'Dan', NULL, 'The problem was that one of the sites that was busted was on a .biz line - should have been as secure as it gets. Unfortunately, something went wrong (and i''m sure the details will come out in time) and they got busted.\r\rI agree now though, that rls grps shouldn''t affil .us sites unless they''re mental. Unfortunately, a lot still do. :('),
(123, 160, '2006-07-10 20:31:43', 'undinism', NULL, 'Happy birthday :)'),
(124, 154, '2006-07-22 02:40:02', 'Ipggi', 'Test', 'test number1'),
(125, 154, '2006-07-22 02:42:13', 'Ipggi', NULL, 'Test 2'),
(126, 154, '2006-07-22 03:12:17', 'Ipggi', NULL, 'Test3'),
(127, 154, '2006-07-22 03:13:54', 'Ipggi', NULL, 'test 4'),
(128, 154, '2006-07-22 03:16:30', 'Ipggi', NULL, 'Test5'),
(129, 154, '2006-07-22 03:17:18', 'Ipggi', NULL, 'Test 6'),
(130, 164, '2006-07-22 04:14:19', 'Ipggi', NULL, 'Another test comment'),
(131, 163, '2006-08-08 12:31:03', 'duranged', 'guess what', 'I narqed the scene'),
(132, 167, '2006-08-09 17:17:05', 'nerv', NULL, 'high level, esp. in 64k, nice amount of surprisingly good entries compared to what we were given to see at previous parties this year.'),
(133, 167, '2006-08-10 03:39:50', 'Ipggi', NULL, 'I agree, I thought the top three placed intros in the 64k cat. were all excellent. 64k intros have come along way from the old days were they used to be short, simple and silent examples of random coding routines.'),
(134, 168, '2006-08-22 17:29:27', 'irokos/Titan', NULL, 'That party will definitely kick ass. A lot of friends present there, i cant wait anymore ;)'),
(135, 168, '2006-08-22 20:45:27', 'Ipggi', NULL, 'irokos, if you pay for my airfare I''ll pay your entry fee. Deal? :P'),
(136, 168, '2006-08-25 09:33:37', '-', NULL, 'omg thought there would be only oldschoolers invited , anyway will be kind of funny to see a hand of youngbloods jumping around all those old suckers'),
(137, 171, '2006-09-15 03:11:16', 'ricochet', 'banned in the usa', 'i used to run a board in the 510, banned in the usa.  i was an INC and iCE site and among others.  \r\rdo you have anything for it at all?\r\rylounge510@yahoo.com\r'),
(138, 168, '2006-09-27 06:03:09', 'irokos/Titan', NULL, 'Ipggi word bro :D'),
(139, 169, '2006-10-02 04:26:48', '-= mAc =-', 'Freax Part2', 'I''m hoping the part2 will be out soon, Part1 is a really nice book.\rCongrats'),
(140, 171, '2006-10-09 23:15:22', 'Ipggi', NULL, 'Try using the site search.'),
(141, 195, '2008-12-26 19:28:10', 'med', NULL, 'no need to remove these files, i have not checked them myself. But probably the only reason why your antivirus is alerting is because the executables are packed with exe packers.\r\rM/Scene 2008++'),
(142, 195, '2009-01-04 07:23:57', 'widowmaker^electric druggies', 'False Positives', 'These files were probably packed with MEW or Kkrunchy etc and are 99.99% false alerts, probably nothing to worry about.'),
(143, 195, '2009-01-23 08:35:00', 'R4wz0r', NULL, 'how can an archive that old have a vundo inside? ');
