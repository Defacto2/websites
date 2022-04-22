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
-- Table structure for table `opinionpollscomments`
--

CREATE TABLE IF NOT EXISTS `opinionpollscomments` (
  `id` int(10) NOT NULL auto_increment,
  `topicNumber` int(10) default NULL,
  `obcTime` datetime default NULL,
  `nick` varchar(50) default NULL,
  `subject` varchar(255) default NULL,
  `comment` longtext,
  PRIMARY KEY  (`id`),
  KEY `Index_2` (`topicNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `opinionpollscomments`
--

INSERT INTO `opinionpollscomments` (`id`, `topicNumber`, `obcTime`, `nick`, `subject`, `comment`) VALUES
(1, 1, '2005-11-13 19:53:04', 'Anony', NULL, 'I guess a number of people are only voting for their favourite group, rather then what the question is asking. Maybe it is because they don''t know of the other groups as they are too new. Otherwise really how could you say that Myth had the greatest impact in the scene? When by the time it entered in 2000, the ripping scene was already in decline and was already loosing populatity and prestige (no pun intended) to the ISO scene.\r\rAt least when Paradigm, (early) Class, Prestige, Hybrid, TDU-Jam were at their peak, the RIP scene was ''THE'' scene. The floppy disc scene was dead and the ISO scene was just a lame unprofessional curiosity. The PC was the only computer left, and so there were no competiting scenes (other then consoles) plus the emergance of movies, p2p etc had not yet existed. So being at the top of the RIP scene meant being at the [u]top period[/u].'),
(2, 1, '2005-11-14 13:40:00', 'Someone', NULL, 'I think think the best rip group evr was MYTH. But  i give a vote to 1911 bcuz they are the best group ever in the scene......i dont wannt them to low in the voting\r'),
(3, 1, '2005-11-14 16:16:10', 'Homp', NULL, 'Like Anony wrote, I think that most people are voting for their favorite group instead of actually answering the "question". I''m not an exception, I voted for Divine. They were a pain in the ass for most groups and they are still around. '),
(4, NULL, NULL, NULL, NULL, NULL),
(5, 2, '2005-12-07 21:10:59', 'Ipggi', 'Mag Wars', 'Does anyone remember the old magazine wars of the mid-1990''s. Between RCN, Inquisition and then later with Affinity and Defacto? And then RCN and the rest of the scene in general :P .. You can still download the issues off this site and read the bitching for yourself..\r\rThough my favorite all time magazine was probably NTM, as it had some great interviews and leads that helped me a lot with researching for this site. My second (and obviously bias) would be our own old magazine, Defacto2. I am still proud of our first issue in that we magazine to interview at least one leader or council representitive from nearly every main group that was active at the end 1996.'),
(6, 2, '2005-12-24 02:10:50', 'path0s', 'You forgot one!', 'TGR! Otherwise known as The Game Review.. By yours truly and Ionizer. I''d say 60 issues is worthy of some respect, wouldn''t you? Especially when you consider that both me and ion were on 28.8 modems and had to leech every single game release and addon every week and review them all by sunday. That''s right fellas.. We rocked, and you didn''t.\r\rHell, most of that junk in this poll wasn''t even around for half that length of time!\rCheck out ion''s cheezy page for all the issues at:\rhttp://tgr.ionin.net\r\r-P\r\r\r'),
(7, 2, '2005-12-27 21:37:32', 'Ipggi', 'The Game Review', 'I didn''t forget TGR, it was intentionally left out. Though it probably shouldn''t have now I look back. I generally considered TGR as a game review mag rather then a scene mag reporting on the activites going on. Though now that I think about it TGR did use to comment on the quality of the releases and the quality of the groups releasing them.\r\rI remember when Ionizer used to review only DOS games and refused to install Windows95. So that left a number of releases he wouldn''t touch, though I guess thats when you came in wasn''t it path0s. You both must have had alot of time on your hands back then :>'),
(8, 2, '2005-12-28 08:39:47', 'path0s', 'Definitely..', 'Most definitely.. A lot of time on our hands :)\r\rHowever, due to all that spare time back then, I may have quite a bit of nfo''s and stuff to add around here. I''ll drop ya a line in the next few days about it.\r-P\r'),
(9, 2, '2005-12-28 08:50:38', 'Ionizer', 'TGR (The Game Review)', 'I am so insulted TGR was left off this list that I demand a poll for Game Review magazines as your next poll.\r\rsup ipggi, ltns'),
(10, 2, '2005-12-28 16:38:17', 'Ipggi', NULL, 'Consider it done. Saves me having to think up a new poll anyway :P\r\rpath0s: great i''ll hear from you soon then!\r\rionizer: indeed vltns .. and don''t take offense, wasn''t intended .. was just shortsightedness on my half.'),
(11, 3, '2006-01-20 08:38:17', '*', NULL, 'orgasming issue not listed? :o'),
(12, 3, '2006-01-20 17:36:26', 'Ipggi', NULL, 'Never heard of them, you got a url to the files?'),
(13, 3, '2006-01-23 03:44:40', 'eth0io', 'There can only be one', 'Give me a break, the 33% stat shows the current status of the so called scene. And the decay has gone fast. Groups releasing "stolen" titles with swiss cheese arguments and so on and so on...\r\rThe Game Review by Ionizer was the best Review ever done, he simply kicked ass..'),
(14, 3, '2006-01-27 21:54:18', 'Strobe', NULL, 'Yeah, but he refused to review anything that wasn''t DOS. Even though the gaming scene was moving over to Windows at the time.'),
(15, 3, '2006-02-05 14:05:46', 'Former Amiga User ;)', NULL, 'I voted for www.game-over.net by mistake, i never heard of any of them before so i was sure that those were links to those sites. They should be :-D'),
(16, 3, '2006-02-05 19:49:34', 'Ipggi', NULL, 'Well I thought it was quite obvious, your in the poll box. You click a link and it registers a vote. Oh well cant expect much from a former amiga user can you?? Jokes :P\r\rI will make it more clear next time lol Maybe stick a Vote 4 > www.game-over.net or soemthing..'),
(17, 4, '2006-03-01 07:04:49', 'Ipggi', NULL, 'How can people vote for todays scene. The quality and the fun is often gone these days. As is the prestige and the community. The only thing that has increased is the risk of ending up in jail.\r\rAnd don''t get me started on the lost art of cracking games ..'),
(18, 4, '2006-03-16 15:25:35', 'Knives', NULL, 'Rips FTW! :D\r\rShame that todays scene has gotten more dangerous and the fun has been for the most part lost.'),
(19, 5, '2006-03-31 07:55:01', 'Ipggi', 'First computer', 'My first computer was a Tandy 1000, it had an NEC 8088 processor, 16 colours, a 3 channel beep chip with a 3.5 inch floppy disc drive and 256k RAM expandable to 640k.\r\rIt was a blast playing those classic AGI Sierra games on it because of the extra music channels it would use and 16 colour graphics. Most PC''s of the time still used CGA 4 colour or Herc monocrome.'),
(20, 5, '2006-04-14 21:48:32', 'Martin', NULL, 'First computer was an amiga... I was 3 years old then... My father liked new technology :p'),
(21, 5, '2006-04-21 14:25:02', 'RunE', 'First computer', 'VIC= 20 ;-)'),
(22, 5, '2006-04-22 09:24:33', 'Vic', NULL, 'Vic-20, wasn''t that the C64''s older brother? :P'),
(23, 7, '2006-07-21 22:10:28', 'Ipggi', 'winner', 'I was surprised to see the NFO''s win'),
(24, 3, '2006-08-30 17:28:04', 'Ionizer', NULL, 'eth0io, thanks for the praise man..\r\rI am trying to write a wikipedia article on The Game Review so its history is preserved on the internet...\r\rI am submitting the article now, but would love when (hopefully) it gets approved if others could help write on it.'),
(25, 9, '2006-09-07 08:01:36', 'Ipggi', NULL, 'Well the Amiga seems to be killing it in the votes atm. I am surprised the Mac is getting as many votes as it is. It certainly wasn''t a demo or gamer''s machine in those days (or today actually) :P'),
(26, 2, '2006-09-18 22:33:32', 'Ryche', 'Hey Hey we''re the Netmonkeys', 'I heard Lester and Bud live together on a commune in California and write snail mail haiku poetry about xfrog and mgoh still to this day.. Their latest was along the lines of '' A CORP for my frog. Mgoh not goo. LND drips.'' \r\rIf anyone knows either of them, check Lesters wallet for a well-worn, and more than likely, crusty, honest to god picture of Jess and ChinaBlu tongue kissing in his wallet. It has and will always be his prized posession and I promise you, it *will* be how his body is identified in the end..\r\rNWR was written by the laziest, unorganized, scatterbrained, gossip hounding, rumor mongers ever to walk the face of the scene. If there was no news, make it up, or make up some news about some news that cant be revealed or make up some letters and throw a few asterisks in there for effect (*ss*E was overheard telling **** about X*T''s new anal script that trades out your ass auto), etc. Uncover shit, start shit, sling shit. Cheers, monkeys! \r\rI was feeling nostaligic so I had to unlurk..'),
(27, 10, '2006-12-01 17:05:28', 'eMole', 'Bug', 'Well, before creating an user managing/login system, make your search and other systems more secure :D\rEverybody is able to XSS the search bar :D\r<3 still love you...good work guys\r"><h1>PEACE</h1>'),
(28, 10, '2006-12-03 06:02:34', 'Ipggi', NULL, 'How can you XSS the search bar when it is submitted directly to Google Search?'),
(29, 10, '2006-12-05 15:56:26', 'me again', 'hm', 'just try \r\rhttp://www.defacto2.net/search.cfm?domains=www.defacto2.net&client=pub-3656270111312045&forid=1&ie=UTF-8&oe=UTF-8&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A50%3BLW%3A597%3BL%3Ahttp%3A%2F%2Fwww.defacto2.net%2Fimages%2Fdf21.gif%3BS%3Ahttp%3A%2F%2Fwww.defacto2.net%3BFORID%3A11&hl=en&sitesearch=www.defacto2.net&flav=0000&sig=FwAbdqulm2v1f982&q=%22%3E%3Cscript%3Ealert%28%27hi%27%29%3B%3C%2Fscript%3E&sa=Search\r\rand you will see what i mean :) How to fix? Well, just google for other search engines :P'),
(30, 10, '2006-12-11 16:00:22', 'yay', NULL, 'fixed :D'),
(31, 11, '2006-12-16 15:25:39', 'Wack0', NULL, 'Yeah, definitely viruses.'),
(32, 11, '2006-12-25 01:17:58', 'Cl@uDiY', NULL, 'Viruses :X'),
(33, 11, '2007-01-06 21:26:40', 'burndata', 'anarchists', 'you can scan and find a virii...  by the time you scan and find  your anarchist.... it is too late....  \r\r');
