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
-- Table structure for table `theweekin`
--

CREATE TABLE IF NOT EXISTS `theweekin` (
  `ID` int(10) NOT NULL auto_increment,
  `Year` int(10) default NULL,
  `Month` int(10) default NULL,
  `Day` int(10) default NULL,
  `Snippet` longtext,
  PRIMARY KEY  (`ID`),
  KEY `Index_2` (`Year`,`Month`,`Day`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=88 ;

--
-- Dumping data for table `theweekin`
--

INSERT INTO `theweekin` (`ID`, `Year`, `Month`, `Day`, `Snippet`) VALUES
(1, 1991, 11, 25, 'The first issue of Advanced Pirate Technology was published.'),
(2, 1996, 7, 26, 'The first issue of Affinity was published. Affinity was a low key warez magazine that survived for 18 months during the famed warez magazine wars of the mid-90s.'),
(3, 1998, 1, 11, 'The final issue of Affinity was published. Affinity was a low key warez magazine that survived for 18 months during the famed warez magazine wars of the mid-90s.'),
(4, 1990, 1, 1, 'Buckaroo Banzai of NEUA publishes his popular ''Cracking 101'' text documents for the scene.'),
(5, 1996, 4, 23, 'The first public issue of Defacto was published. This is the first ever product from the Defacto group, which would later evolve into this website you are reading today.'),
(6, 1995, 10, 2, 'The first issue of Inquisition was published. Inquisition started out as The Week In Warez with a different name. Though over time Inquisition evolved, developing it''s own style away from it''s deflunked predecessor.'),
(7, 1996, 10, 20, 'The last issue of Inquisition was published. Inquisition started out as The Week In Warez with a different name. Though over time Inquisition evolved, developing it''s own style away from it''s defunct predecessor.'),
(8, 1989, 6, 1, 'The first issue of Pirate was published. Pirate is the earliest known magazine dedicated to the PC scene.'),
(9, 1995, 11, 18, 'The first issue of Reality Check Network was published. At it''s peak RCN was the most popular and well known non-hacking underground publication.'),
(10, 1997, 7, 13, 'The final issue of Reality Check Network was published after 37 previous issues contained in 3 different volumes.'),
(11, 1990, 11, 24, 'The first issue of Software Chronicles Digest was published. SCD was the first frequently released magazine for the PC cracking scene, lasting for over two years.'),
(12, 1992, 12, 2, 'After two years and fourteen previous issues the Software Chronicles Digest publishes it''s last issue.'),
(13, 1997, 8, 10, '<a href="http://www.defacto2.net/web-magazines/scenelink/index.html">Scenelink</a> goes on line. It was the first and last web page that successfully supported and link all the various underground scenes together. It was well received and used by many groups in a number of varied scenes.'),
(14, 1997, 8, 1, 'The Scene Archives goes live using the web address, www.defacto2.org.'),
(15, 1997, 7, 1, 'Forbes Magazine publishes an article entitled ''Where do you want to pirate today?''.'),
(16, 1997, 12, 16, 'In the USA the No Electronic Theft (NET) act is signed into law by President Clinton. The key element of this act was the closure of the LaMacchia loophole by allowing the government to redefine "financial gain" as the "receipt of anything of value, including the receipt of other copyrighted works".'),
(17, 1997, 10, 19, 'The Scene News goes live using the web address, www.defacto2.org/scene-news/. Today we call them blogs, but back then it was described as a scene news report.'),
(18, 1997, 12, 5, 'RazorISO, a sub-division of of Razor 1911 is created. It would eventually merge back together with the main group after the RIP scene starts to flounder.'),
(20, 1998, 4, 15, 'We moved from our original web address of www.defacto2.org to www.defacto2.net.'),
(21, 1998, 5, 18, 'PWA releases Microsoft''s Windows 98 just three days after it went to manufacturing, and over a month before it''s official store release date.'),
(22, 1998, 5, 18, 'Game Over Online Magazine (www.game-over.net) goes online. It is a result of the merging of The Review Guild and The Gamers Edge, two popular cracking game magazines of the time.'),
(23, 1998, 5, 22, 'Class releases the heavily hyped Unreal by Epic. The game comes in at over 120 separate discs highlighting the advantages of using the new ISO scene over the established ripping techniques.'),
(24, 1998, 6, 29, 'The scene gets plagued by the Taiwanese computer virus simply known as Win95.CIH.1019. A number of releases from various groups are unknowingly released contaminated.'),
(25, 1998, 8, 1, 'In a sign that the RIP scene rules are completely redundant. Paradigm are forced to remove various race tracks from a driving game release so it can adhere to the rules. This means to get the complete working game a track addon pack download is required, ludicrous!'),
(26, 1998, 10, 3, 'The siteop to Activation is charged by the FBI for minor child pornography possession. This starts a chain of events that leads to the siteop''s unfortunate suicide a week later.'),
(27, 1998, 10, 10, 'The SPA (Software Pirates Association) increases the RIP disk limit for a third time to 90 discs (1.44mb files). Everyone agrees to the changes except for Class and Origin.'),
(28, 1998, 10, 18, 'After the uproar that is created from the SPA''s (Software Pirates Association) increased disc limits, the organisation is disbanded. A new governance known simply as ''The Faction'' is created as a replacement. It supports new rules and a 50 x 2.88mb release size limit.'),
(29, 1998, 11, 3, 'The www.defacto2.net domain was hacked, the url forwards the address to a phoney site.'),
(30, 1998, 11, 12, 'Game-over.net publishes an comprehensive article entitled ''The Newbies Guild To The Games Scene''. Due to the uproar it creates it is promptly removed.'),
(31, 1999, 5, 25, 'News site ISONews.com receive legal threats by lawyers representing Lucasfilm Ltd after publishing the NFO file related to the Star Wars: Episode I - The Phantom Menace VCD.'),
(32, 1999, 6, 20, 'After four years the util/app group Siege calls it quits while still being on top.'),
(33, 1999, 7, 30, 'The web masters of Dupecheck.com and ISONews.com are discovered to have done an interview for a New York Times. People claim they have sold out in a bid to get their 15 minutes of fame, but they deny this.'),
(34, 1991, 11, 15, 'Razor 1911 is forced to merge into International Network of Crackers for a brief time because two key members betrayed the group and jumped ship to a competing group The Dream Team.'),
(35, 1992, 1, 25, 'Two very prominent scene members (The Not so Humble Babe and The Grim Reaper) are arrested by the FBI for carding, phreaking, forgery and other charges. The busts create a domino effect causing numerous boards to close down or go legal, and a number scene members to retire.'),
(36, 1994, 3, 24, 'The Foreman, siteop to the well respected 206 BBS ''Predatory Nature'' is accused of being an FBI agent undercover. He and the BBS promptly vanishes from the scene, never to be heard from again.'),
(37, 1994, 4, 1, 'The pop culture technology magazine Wired publishes an article by David McCandless entitled ''Warez Wars''. While it does create some alarmism, no one worries too much. It was a poorly researched work that didn''t delve deep enough into the cracking culture to be of concern.'),
(38, 1997, 1, 15, 'FBI agents at 9am do coordinated raids on four different BBS''s in a procedure known as Operation Cyberstrike. Malevolence, Purgatory, Zions Hideout and Tower of Sorcery (all world or US headquarters to major groups) go down and signal the death kneel of the BBS scene.'),
(39, 2000, 5, 4, 'Twelve PWA members and five Intel employees are indicted for copyright infringement of over 5,000 computer programs. The leader is eventually sentenced to eighteen months, with other members serving lesser terms. The eight year old group is disbanded after it is realised two active members of the group were the ones helping the FBI months prior to the arrests.'),
(40, 1984, 5, 16, 'Thomas G. Tcimpidis, Sysop of the MOG-UR BBS, has his personal computer and data storage seized by the Los Angeles Police when Pacific Tel determines that a message on one of his boards contains a stolen Calling Card number. He at the time did not monitor or read all the notes in all the conferences, so he did not realise that some people were exchanging stolen long-distance telephone credit-card numbers on his BBS.'),
(41, 1985, 10, 15, 'Three hackers from Norway, Doctor No, Insane TTM and Sector9 create a Commodore 64 demo group known as RAZOR 2992. Though it is soon renamed to the now famous RAZOR 1911. The 1911 translates to $777 in hexadecimal, a counter reaction to the 666 numeric popularised by groups of the time.'),
(42, 1986, 3, 6, 'Local law enforcement officials in Fremont, CA setup a sting BBS known as the ''Phoenix Fortress'' to catch pirates and hackers. It manages to catch seven suspects, six of which are underage minors.'),
(43, 1993, 1, 30, 'The 124 node mega BBS ''Rusty & Edie''s'' is shutdown down by FBI agents for distributing copyrighted computer programs. The investigation was initiated by a small time BBS author who discovered the site''s advert in an illegal copy of one of his programs.'),
(44, 1993, 8, 3, 'The Fear and Loathing BBS (The Dream Team & ECR) out of Birmingham, Alabama is busted by the FBI for piracy of Novell and Quarterdeck products.'),
(45, 1995, 3, 10, 'Richard D. Kenadek of Millbury, MA, sysop of The Davy Jones Locker BBS is finally sentenced to six months of home detention for software copyright violations. Nearly 3 years after he and his BBS were initially busted.'),
(46, 1995, 4, 12, 'Royal Canadian Mounted Police take down seventeen(!) BBS''s in a large scale raid that involves the seizure of $200,000 worth of computer equipment and 15 arrests.'),
(47, 1995, 4, 19, 'US Marshals with investigators from Novell and Microsoft take down The Assassin''s Guild, current world headquarters to both Razor 1911 and Pirates With Attitude.'),
(48, 2000, 3, 26, 'Class, Myth & Divine form a consortium in the vain of the old SPA and The Faction to again set new rules for the RIP scene. The new disc (file) limit is set at 65 x 2.88megs and an additional 15 rules are agreed to.'),
(49, 2001, 12, 11, '''Three separate federal law enforcement actions federal agents executed approximately 100 search warrants worldwide against virtually every level of criminal organizations engaged in illegal software piracy over the Internet. The three Operations, codenamed "Buccaneer," "Bandwidth" and "Digital Piratez," struck at all aspects of the illegal software, game and movie trade, often referred to as "warez scene."'' The well publicised busts lead to the downfall of the well known group Drink or Die and the closure of numerous sites.'),
(50, 2003, 6, 6, 'Former Razor 1911 leader Pitbull is sentenced to 18 months in a federal prison. He was originally netted in the infamous Operation Buccaneer that occurred 18 months earlier.'),
(51, 2002, 12, 18, 'Krazy8 the webmaster of iSONews.com is arrested and pleads guilty to violating the Digital Millennium Copyright Act. While the website itself is dedicated to piracy and hosts a large message board. Krazy8''s actual DMCA violation arises from the sale of $28,000 worth of illegal X-Box mod chips, imported from the UK.'),
(52, 1996, 10, 8, 'Zeus a one time major supplier for Prestige, leaves the group and goes independent. Then not long after teams up with the German group, Dynasty as well as a few former RomLight (Fairlight) members to create Paradigm, a group that would turn into a powerhouse of the scene and eventually become Myth.'),
(53, 1995, 10, 24, 'The Pieman''s home is raided by U.S. Marshals and representatives of Novell Corporation. His BBS, ''The Pits'' was the world headquarters for The Humble Guys for nearly a decade. The board vanishes, never to return after the Marshals confiscated all it''s hardware.'),
(54, 1995, 12, 7, 'Fanfan la Tulipe leader of the well respected CD group TDU-Jam and sysop of The Digital Underground calls it quits, along with the group. They go out with a final bang releasing the much anticipated Blizzard game, War Craft 2.'),
(55, 1996, 1, 1, 'Tyranny the last active floppy disc release group is dead, and while they do try to make a come back months later, it is unsuccessful. 1995 marked the end of the floppy disc game release and thus the floppy scene.'),
(56, 1993, 1, 1, 'Jimmy Jamez establishes the infamous util/app group known as Drink Or Die with the tag line ''Warez Bearz from Russia''. Eight years later the group was taken down in the highly publicised Operation Buccaneer.'),
(58, 1994, 3, 1, 'Tristar Red Sector Inc loses it''s USA division who leave to create a new group called Phoenix (who later become Tyranny). While a month later it''s UK division leaves to form Legend. Both departures signal the end of the group in the PC scene.'),
(59, 1992, 4, 15, 'Bar Manager and Orion get together and form Pirates with Attitude .. ''We started PWA when alot of us old pirates got tired of the blood thirsty competition of the warez scene. NTA was ruling the Utils scene so we decided to throw our gauntlets into that ring and see what happens.'''),
(60, 1995, 6, 4, 'Hybrid releases their first ever CD-Rip, Virtual Pool from Interplay. While they are not the first to rip CD''s, they become the first group to take ripping seriously and professionally. They decide to start cracking CD titles instead of just using CD emulation software, they remove unnecessary items such as intro screens and include custom installers for the games.'),
(61, 1992, 11, 10, 'After being around in one form or another since 1985 the famed group International Network of Crackers is dead. It''s death is caused by the slow but steady and constant decline of members who either jumped ship or retire from the scene.'),
(62, 1992, 11, 15, 'Did you know that some warez groups also dabbled in the HPAV scene? It was around this time that both Fairlight and then The Dream Team start their own hacking and phreaking divisions.'),
(63, 1996, 8, 13, 'The first ever MP3 group, Compress Da Audio is founded by Netfrack. Home computers back in these days were too slow to compress music. A 4 minute song would take over an hour to convert at near CD quality. So only selective and popular singles were chosen for release. The first song ever released onto the scene was ''Until It Sleeps'' by Metallica.'),
(64, 1996, 8, 27, 'Following the lead from Compress Da Audio (the first 0-day release MP3 group), Digital Audio Crew arrives less then 3 weeks after CDA''s initial formation. While CDA only did requests and singles. DCA set out to release albums the day they hit the store shelves, becoming the first contemporary mp3 group.'),
(65, 1996, 9, 1, 'The first ever all female release group GLOW (Gorgeous Ladies of Warez) is founded. They are best known for their imaginative NFO tagline ''We release more then just eggs''.'),
(66, 1995, 11, 15, '#Fatefiles is mention for the first time in RCN. As the first IRC 0-day warez trading channel it is first look at as a curiosity by the scene, before quickly being frowned upon for being too open and popular. It is eventually disowned by it''s original creators ''Fast Action Trading Elite'' when the channel becomes a haven for lamer leechers.'),
(67, 1996, 1, 7, 'The magazine Reality Check Network releases issue number 8 which has contains interview that they did with an FBI agent who worked in the computer crimes division.'),
(68, 1996, 1, 12, 'Scott Morris, the siteop of The Assassin''s Guild the former HQ of both Razor 1911 and Pirates With Additude, reaches a legal settlement with both Microsoft and Novell. He agrees to pay $70,300 in fines, hands over $40,000 worth of computer equipment and helps assist the companies in future BBS piracy investigations.'),
(69, 1996, 1, 25, 'Anarchist, a member of Legacy and Demolition is arrested for offering 2 gigabytes of worth of child pornography using his BBS. He was also later charged with possession and distribution of copyrighted software.'),
(70, 1996, 10, 17, 'Park Central, the last great pirate BBS closes down. The system operator Silver V thought the time was right, though others believed it was more of an ego issue due to the decline of BBS''ing in general.'),
(71, 1996, 9, 20, 'Finnish police shutdown the very popular free anonymous re-mailing service anon.penet.fi due to complaints from the Church of Scientology involving copyright violations. The service was popular with scene members in the earlier days of the internet but it was never to return.'),
(72, 1996, 6, 20, 'One of the most notorious groups in the scene ever Released On Rampage, releases the most anticipated game of the time, Quake by ID software. Unfortunately they only obtained the final beta.<p></p>Not to let that stop them they brazenly combined the finalised levels from the beta with the code base from the official demo and release it as a pseudo-final release. It would become one of the most audacious stuff ups ever and it forever cemented ROR''s atrocious reputation. Razor 1911 released the final store version a month later.'),
(73, 2004, 1, 9, 'After exactly 1234 continuous RIP and ISO releases, CLASS decides to call it quits. Seven years after they spun off from their predecessor Prestige.'),
(74, 1998, 11, 25, 'The infamous courier group Millennium has it''s IRC channel #millennium taken over by some Y2K doomsday cultists!'),
(75, 1999, 1, 20, 'Origin release Maxis''s Simcity 3000 long before it''s store date. Unfortunately for Origin, when you bought up the game''s version information it clearly stated that it was beta. Class then release what they claimed was the final, except for their file dates are actually earlier then Origin''s. In the end it was concluded that Class''s release was the correct release when it was eventually matched with the version shipping to retailers.'),
(76, 2000, 12, 26, 'The Renegade Chemist''s group Origin and Zeus''s group Paradigm merge to form Myth who then dabble in both the RIP scene and the ISO scenes.'),
(77, 1995, 5, 9, 'ROM 1911 is founded as an unofficial off-shot of Razor 1911 to release purely CD games. Not soon after though, the floppy scene runs dry of potential releases so after some internal fighting Razor absorbs ROM 1911 to then form RazorCD.'),
(78, 2005, 10, 9, 'Myth who''s lineage goes back to early CD rip scene, calls it quits after 5 years. They were one of the last great ripping groups and claimed to be pioneers of the DVD-Rip.'),
(79, 1998, 1, 15, 'CIFE, RiSCiSO, and RAZOR ISO team up to release an official ISO code of conduct that they and other groups should adhere to. The first rule is ''Starting February 1st, nothing older than one month will be released. Requests for older software is independent.'' This shows how behind the ball the ISO scene was back during these early days.'),
(81, 2004, 5, 14, 'After taking a lethal blow during Operation Fastlink, Fairlight decides to discontinue any public activities that are deemed illegal. 17 years after they were founded, as a cracking group on the Commodore 64.'),
(82, 1989, 11, 1, 'The well respected PTL Club teams up with a number of other well known but small groups ($print, UGC, Sam Brown) to form Triad.'),
(83, 1990, 1, 22, 'The Humble Guys public release their first game and later would introduce the first text file that used a ''nfo'' naming convention. These guys would eventually shake the scene to its foundation, making it professional, fast and expensive to participate in.'),
(84, 1987, 4, 17, 'The legendary Fairlight is created by Strider and Black Shadow during a train trip in Sweden. It initially was a Swedish based group that focused on the Commodore 64, before moving to the Amiga and eventually to to the PC.'),
(87, 1990, 2, 7, 'The scene''s first ever NFO file is used, being included in Bubble Bubble released by The Humble Guys. While it is not the first information file to be included in a release, it is the first to use the now standard .NFO file extension.');
