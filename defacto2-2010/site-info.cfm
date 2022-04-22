<cfprocessingdirective suppressWhiteSpace="true"><cfsilent>
<!--- 
File: 		site-info.cfm
Version: 	2.0
Author: 	Ben Garrett
Date: 		16th July 2003
			23 Jun 2006 : New code
Lists the people who have helped contribute to the modern Defacto2 website
Information on what Defacto2 is about
Site updates, modification of database entries and new files
 --->
<cfparam name="url.mode" default="credits">
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
</cfsilent><cfoutput><cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - 
		<cfif url.mode EQ "credits">Thanks and Contributors
		<cfelseif url.mode EQ "aboutdf2">What Is Defacto2 About?
		<cfelseif url.mode EQ "updates">Site Updates and New Additions
		</cfif>
	</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<cfif url.mode EQ "updates">
			<tr><td>
				<div class="functionHeader">Site Updates and New Additions</div>
				<div><cfinvoke component="cfcs.statistics" method="newestUpdates" limit="500"></div>		
			<cfelseif url.mode EQ "credits">
			<tr><td><cfinvoke component="cfcs.logos" method="sceneArchive">
				<div class="functionHeader">Thanks and Contributors</div>
				Defacto2 would like to thank everyone who has helped contribute to this web site in one way or another over the years.
				If you wish to contribute some files yourself you can use our <a href="site-upload.cfm">web based file uploader</a>.
				<p class="sitecreditHeading">Recent contributors</p>
				<div class="sitecreditList"><span class="sitecreditName">Fabulous Furlough</span> - Revising our early knowledge of scene history from the 1990-1992 period</div>
				<div class="sitecreditList"><span class="sitecreditName">Duranged</span> - Supplying around 170 issues of Courier Weekly Scorecard</div>
				<div class="sitecreditList"><span class="sitecreditName">King Kaos</span> - Supplying a number of Kaos installers</div>
				<div class="sitecreditList"><span class="sitecreditName">Rigodon</span> - Supplying a couple of installers</div>
				<div class="sitecreditList"><span class="sitecreditName">Bane Mind</span> - Letting us attack his massive collection of old floppy scene original releases which intern gave us nearly 50 new cracktros and a heap of new files for the repository</div>
				<div class="sitecreditList"><span class="sitecreditName">Irokos (TiTAN)</span> - Donating around 60 new installers and a number of cracktros</div>
				<div class="sitecreditList"><span class="sitecreditName">Zammis Clar</span> - Giving us some Oxygen related files</div>
				<div class="sitecreditList"><span class="sitecreditName">Aleksander Soleim</span> - Supplying a number of installers </div>
				<div class="sitecreditList"><span class="sitecreditName">Warpy aka MuadDib</span> - Supplying a couple of cracktros; completing our Relativity archive; supplying a number of magazines; general helping out</div>
				<div class="sitecreditList"><span class="sitecreditName">Matthew Groulx</span> - Supplying a number of cracktros</div>
				<div class="sitecreditList"><span class="sitecreditName">Gaetano</span> - Supplying two cracktros</div>
				<div class="sitecreditList"><span class="sitecreditName">GridPoint</span> - Giving us Scooby Snack Magazine issues 1 &amp; 2</div>
				<div class="sitecreditList"><span class="sitecreditName">Hitchhikr</span> - Supplying a number of cracktros</div>
				<p class="sitecreditHeading">Original contributors</p>
				Bk, Cybacolt, Devotion, Ek, Mead, Neofish, Strooper, Pst, Saint Tok, Skateguy, Radman, Aldog, ATM and Toast
				<p class="sitecreditHeading">Web sites</p>
				<div class="sitecreditList"><a href="http://www.theisonews.com/">ISO News</a> - Providing us with a number of newer NFO's from 1999 onwards</div>
				<div class="sitecreditList"><a href="http://www.pouet.net">Pouet</a> - Providing us with cracktros, especially from the recent few years</div>
				<div class="sitecreditList"><a href="http://www.textfiles.com">Textfiles.com</a> - Supplying a number of the text files used for 'The Reports' section</div>
				<!--- Discontinued websites --->
				<div class="sitecreditList"><!---<a href="http://members.easyspace.com/erekose/index.html">---><span class="sitecreditName">Erekose's Intro Zone PC</span> - Supplying, documenting and screen capturing many cracktros</div>
				<div class="sitecreditList"><!---<a href="http://nfotemple.cjb.net/">---><span class="sitecreditName">NFO Temple</span> - Also continuing and updating Toast's initial pack up until 2004</div>
				<div class="sitecreditList"><span class="sitecreditName">Toast's Web Page</span> - For starting the initial NFO pack and the screen captures for the BBS section</div>
				<div class="sitecreditList"><span class="sitecreditName">Weaver's NFO Archive</span> - For continuing, expanding and sorting Toast's initial pack</div>
			</td></tr>
			<cfelseif url.mode EQ "aboutdf2">
				<tr><td>
				<div class="functionHeader">What is <img src="images/siteinfo/df2-small.gif" alt="Defacto2" style="vertical-align:middle;" /> about?</div>
				<a href="images/siteinfo/ml-sanct.png"><img src="images/siteinfo/thumb_ml-sanct.png" alt="Sanctuary by Marshal Law" title="Sanctuary by Marshal Law" style="float:right; border: 1px solid ##000000; padding:1px; margin-left:5px; width:200px; height:1685px;" /></a>
				<div class="left" style="margin-bottom:12px;">
					To summarise in a single sentence
					<p class="brown">&quot;Defacto2 is a web site that is dedicated to the preservation of the computer underground counterculture, with a focus on the PC cracking scene.&quot;</p>
					<p class="infoHeader">So what is the <span class="italic">computer underground counterculture</span>?</p>
					The computer underground counterculture is what is generally known as 'the scene'. The scene is comprised of many different elements that are loosely banded together. These elements are often comprised of the following..
					<p class="infoHeader">Art</p>
					The creation of computer-based artwork using different media and techniques such as the example on the right from ICE circa 1992. It is using computer ANSI characters to give the illusion of an image. <a href="http://en.wikipedia.org/wiki/Computer_art_scene" class="fs11">[extra info]</a>
					
					<p></p>
					
					<p class="infoHeader">Cracking</p>
					The art of modifying software. This can vary greatly from something simple as creating a <a href="http://en.wikipedia.org/wiki/Trainer_%28games%29">trainer</a>, enabling cheating within a game. To complex solutions such as removing software, <a href="http://en.wikipedia.org/wiki/CD/DVD_copy_protection">CD or DVD copy protection</a>. In most countries the act of cracking itself is not illegal. It's only when you apply the cracks on an item to <a href="http://en.wikipedia.org/wiki/Software_pirate">render it free and stolen</a> that it becomes illegal. This distributed cracked software is then referred to as <a href="http://en.wikipedia.org/wiki/Warez">warez</a>.
					<p class="infoHeader">Demos</p>
					The combination of art, music and programming trickery to create a visually appealing non-interactive computer program. <a href="http://en.wikipedia.org/wiki/Demoscene" class="fs11">[extra info]</a>
					<p class="infoHeader">Emulation</p>
					The duplication of functionality of one system within another. An example would be a Nintendo Gameboy emulator that enables you to run Gameboy games on your Windows PC. <a href="http://en.wikipedia.org/wiki/Emulation" class="fs11">[extra info]</a>
					<p class="infoHeader">Hacking</p>
					The unorthodox manipulation or exploration of anything computer related. <a href="http://en.wikipedia.org/wiki/Hacker" class="fs11">[extra info]</a>
					<p class="infoHeader">Music</p>
					The creation of computer generated music using tracker modules. <a href="http://en.wikipedia.org/wiki/Module_file" class="fs11">[extra info]</a>
					<p class="infoHeader">Phreaking</p>
					The now redundant art of the exploitation of telephone systems to obtain free phone calls. Often used back in the old <a href="http://en.wikipedia.org/wiki/Bbs">BBS</a> days when calling boards over long distances was prohibitively expensive. <a href="http://en.wikipedia.org/wiki/Phreaking" class="fs11">[extra info]</a>
					<p class="infoHeader">Warez</p>
					The releasing of copyrighted and often cracked software, movies and music to make available to the general public at no financial cost. <a href="http://en.wikipedia.org/wiki/Warez" class="fs11">[extra info]</a>
					<p></p>
					This loose grouping comes from the fact that most of these scenes originate from a similar lineage.
					Back in the old days before the internet was accessible to the general public, BBS systems were the main means for savvy computer users to communicate.
					While we won't go into detail about <a href="http://en.wikipedia.org/wiki/Bbs">Bulletin Board Systems</a>.
					It is fair to say that BBSes often wanted to value add their services, to encourage people to call their boards.
					So unlike many web sites of today that are very specific and often niche,
					BBSes systems commonly covered a variety of topics and offered numerous files. Which in turn helped to create small localized BBS communities with a broad appeal.
					This convergence of the intertwined, overlapping scenes means they often got grouped together and referred to as <span class="italic">the computer underground</span>.
					<p></p>
					I might also add that the legality of some of these elements can be questionable.
					Of cause that's not to say that they all are. 
					It is just if you were to categorize the elements the results would vary.
					<p></p>
					Phreaking and Warez are definitely illegal, and do attract the attention of law enforcement agencies.
					<p></p>
					Hacking, Emulation and Cracking are considered grey areas, dependant on their use and implementation.
					<p></p>
					Art, Music and Demos are perfectly legal and often the people involved eventually work in related commercial industries.
					<p></p>
					<p class="infoHeader">So back to Defacto2 and how does this all relate to us?</p>
					'Dedication to the preservation of the computer underground counterculture, with a focus on the PC cracking scene'.
					Well firstly lets clarify that PC means a personal computer that runs a version of Microsoft Windows.
					Or before Windows was popularized, it meant a computer that was <a href="http://en.wikipedia.org/wiki/IBM_PC_Compatible">IBM-PC compatible</a> that ran <a href="http://en.wikipedia.org/wiki/MS-DOS">MS-DOS</a> (or something similar).
					<p></p>
					So to summarise Defacto2 documents and hosts the legal off-shoots that are derived from the PC cracking and warez scenes.
					This means all the text files, demos, music, art, magazines and products that are cracking related but are not illegal in themselves will be hosted and discussed here.
					<p class="infoHeader">Why cover this area specifically?</p>
					To be honest, because no one else has  and then eventually this element of the computer underground will  be lost and forgotten.
					All the other scenes have plenty of available information and dedicated web sites.
					But due to the nature of the robin-hood cracking with it's high churn rate for participants, this is a scene that is not well documented nor understood.
					<p></p>
					As a side note, we ourselves do not actually participate in or support software piracy.
					We actually do believe in supporting software developers and can honestly say that all the tools used to create this site were done with either purchased software, <a href="http://en.wikipedia.org/wiki/Shareware">registered shareware</a> or <a href="http://en.wikipedia.org/wiki/Open-source_software">open-source programs</a>.
					<p class="infoHeader">Further reading ..</p>
					<p class="infoHeaderLink"><a href="http://www.cow.net/conned/notacon/artscene/">Jason Scott and RaD Man: 100 Years of the Computer Art Scene</a></p>
					<p>Jason Scott is the producer of the excellent and well received <a href="http://www.amazon.com/exec/obidos/redirect?path=ASIN/B0009NN6EA&amp;link_code=as2&amp;camp=1789&amp;tag=defacto2&amp;creative=9325">BBS Documentary</a> and Rad Man is the founder of the most well known art scene group of all time, Acid. Together they teamed up at the Notacon Conference in Cleveland during late April of 2004 to give a 50 minute presentation on the topic.</p>
					<p>The presentation itself was recorded and can be downloaded and listened to in MP3 format, plus there is a text transcript available. The site itself also has some excellent examples of early computer artwork, from early main frame printouts to massive modern ANSI (such as the one above).</p>
					<p class="infoHeaderLink"><a href="http://www.demoscene.tv"><img src="images/siteinfo/dtv.png" alt="Demoscene TV" style="border:0px; float : right; margin-bottom : 15px; margin-left : 5px;" />Demoscene.TV</a></p>
					<p>Three TV channels broadcasting 24 hours a day over the web of purely demos. We recommend you check out the oldskool channel to get a feeling of the old demo scene. It does require Winamp/AOL&copy; video module plug in and a broadband connection.</p>
					<p class="infoHeaderLink"><a href="http://www.amazon.com/exec/obidos/redirect?path=ASIN/3981049403&amp;link_code=as2&amp;camp=1789&amp;tag=defacto2&amp;creative=9325">Freax Volume 1.</a></p>
					This is a 220 page hardback book is a in depth look at both the Commodore 64 and Amiga demo and cracking scenes. Their history, dominance and their influence. The book contains a lot of text as well as many photos and is the best primer available for anyone interested in the scene in general. As the Commodore 64 was the pioneering scene that introduced many of the concepts that are taken for granted today. While the Amiga evolved those notions and produced an even more professional and competitive outlet.
					<p class="infoHeaderLink"><a href="http://www.cumbrowski.com/RoySAC/">Roy of SAC Official Homepage</a></p>
					<p>A great tutorial and summary on ascii art scene by Roy of SAC. The now legendary artist who has been commissioned by numerous famous and respected groups over the years including Razor 1911, Drink or Die, RISC, TRSI, Deviance, Origin and The Humble Guys. For further reading the site also has a large number of links to more detailed web pages that cover the subject of ascii and ansi art in more depth.</p>
					<div class="GoogleAds" style="margin-top:20px;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" color="pink"></div>
					<p class="infoHeaderLink"><a href="http://artpacks.scene.org/www/html/intro.html">Artpacks.acid.org - Intro</a></p>
					"Ever since the days of the IBM PC 8088 and C64, personal computers have been used for much more than word processing and data entry. Artists around the world have found computer art to be less expensive and much less restrictive than traditional paint and canvas. These artists have pioneered many different electronic art mediums over the years, the most popular of course being High-Resolution images and Three-Dimensional Renderings. Primitive mediums such as ASCII and ANSI text, and RIPscrip are still popular, but have moved far away from the mainstream and into this little niche we call the digital 'ArtScene'.."					
				</div>
				<div class="functionHeader">The history of <img src="images/siteinfo/df2-small.gif" alt="Defacto2" style="vertical-align:middle;" /></div>
				<div class="left">
					<a href="magazines.cfm?mode=detail&amp;title=Defacto">Defacto</a> was founded in late February or early March of 1996 as an underground electronic magazine.
					The original intention was to fill the gap left by a former leading magazine <a href="magazines.cfm?mode=detail&amp;title=Reality%20Check%20Network">Reality Check Network</a> after their initial closing.
					While our magazine never gained the following that RCN commanded, it was generally considered a decent alternative.
					After eight public issues the magazine vanished, only to later return with a new format and a new name Defacto 2.
					<p>
					<a href="magazines.cfm?mode=detail&amp;title=Defacto2">Defacto 2</a> was a monthly text based magazine that was eventually meant to evolve into coded and html issues.
					The magazine unfortunately only lasted three issues but these issues at the time were packed to the brim with scene related articles and interviews.
					</p><p>
					While the name lasted, the magazine didn't and in late 1997 we became a moderately successful art group.
					Initially lead by Ipggi and later by Seffren the group was unique in the fact that it didn't demand membership exclusivity.
					So many of our members were also co-members with other popular groups of the time such as X-Pression and SAC.
					</p><p>
					While obviously you can find some of our work below, many of our members also did a number of side projects that would be familiar to the scene.
					For example Antibody's ascii header for <a href="groups.cfm?mode=detail&amp;org=class">Class</a> (one of the most predominate groups of all time) can be seen in every one of their NFOs since 1998 till their retirement six years later.
					So if you ever see the tag [df2] in an old NFO or release package, it most probably was done by one of our art members during this period.
					</p><p>
					Unfortunately after three years and a few sporadic releases the group was put to rest.
					Seffren, the leader had decided it was time to move on from the scene and try some new things in life.
					So at the end of the millennium the final release, Art Pack 5 was made public.
					</p>
				</div>
				<table cellpadding="0" cellspacing="0" class="boxInfo02">
				<tr><td style="vertical-align:top;">
				<div class="boxInfo01">
					<img src="images/siteinfo/creat-pack1-1.jpg" alt="Artpack Preview" class="infoImage" /><img src="images/siteinfo/creat-pack1-2.jpg" alt="Artpack Preview" class="infoImage" /><img src="images/siteinfo/creat-pack1-3.jpg" alt="Artpack Preview" class="infoImage" />
					<br />
					<span class="bold">Art Pack Issue One</span> - 'Beginning'<br />
					Published on the 10th of January 1998<br />
					1.2 MB in size<br />
					<a href="#application.SceneORG#df2pack01.zip#application.SceneORGEndVar#" title="Download Art Pack 1">Download from Scene.org</a>
				</div>
				<div class="boxInfo01">
					<img src="images/siteinfo/creat-pack3-1.jpg" alt="Artpack Preview" class="infoImage" /><img src="images/siteinfo/creat-pack3-2.jpg" alt="Artpack Preview" class="infoImage" /><img src="images/siteinfo/creat-pack3-3.jpg" alt="Artpack Preview" class="infoImage" />
					<br />
					<span class="bold">Art Pack Issue Three</span> - 'Heaven'<br />
					Published on the 2nd of July 1999<br />
					776 KB in size<br />
					<a href="#application.SceneORG#df2pack3.zip#application.SceneORGEndVar#" title="Download Art Pack 2">Download from Scene.org</a>
				</div>
				<div class="boxInfo01">
					<img src="images/siteinfo/creat-pack5-1.jpg" alt="Artpack Preview" class="infoImage" /><img src="images/siteinfo/creat-pack5-2.jpg" alt="Artpack Preview" class="infoImage" /><img src="images/siteinfo/creat-pack5-3.gif" alt="Artpack Preview" class="infoImage" />
					<br />
					<span class="bold">Art Pack Issue Five</span> - 'DF2000'<br />
					Published on the 31st of December 1999<br />
					1.8 MB in size<br />
					<a href="#application.SceneORG#df2000.zip#application.SceneORGEndVar#" title="Download Art Pack 5">Download from Scene.org</a>
				</div>
				<div class="boxInfo01">
					<span class="bold">Defacto2 Design Music</span><br />
					<a href="#application.SceneORGRoot#music/" title="Goto Defacto2 Design's Scene.org page">Tracker</a> and <a href="#application.SceneORGRoot#zalza/" title="Goto Defacto2 Design's Scene.org page">Chip</a>
				</div>	
				</td><td>
				<div class="boxInfo01">
					<img src="images/siteinfo/creat-pack2-1.gif" alt="Artpack Preview" class="infoImage" /><img src="images/siteinfo/creat-pack2-2.jpg" alt="Artpack Preview" class="infoImage" /><img src="images/siteinfo/creat-pack2-3.jpg" alt="Artpack Preview" class="infoImage" />
					<br />
					<span class="bold">Art Pack Issue Two</span> - '01001'<br />
					Published on the 1st of May 1998<br />
					1.1 MB in size<br />
					<a href="#application.SceneORG#df2pack02.zip#application.SceneORGEndVar#" title="Download Art Pack 2">Download from Scene.org</a>
				</div>
				<div class="boxInfo01">
					<img src="images/siteinfo/creat-pack4-1.jpg" alt="Artpack Preview" class="infoImage" /><img src="images/siteinfo/creat-pack4-2.jpg" alt="Artpack Preview" class="infoImage" /><img src="images/siteinfo/creat-pack4-3.jpg" alt="Artpack Preview" class="infoImage" />
					<br />
					<span class="bold">Art Pack Issue Four</span> - 'Bird'<br />
					Published on the 14th of October 1999<br />
					1.2 MB in size<br />
					<a href="#application.SceneORG#df2pack04.zip#application.SceneORGEndVar#" title="Download Art Pack 4">Download from Scene.org</a>
				</div>
				<div class="boxInfo01">
					<img src="images/cracktro-scenes/df2intro.png" alt="Defacto2 Design" class="infoImage" /><img src="images/cracktro-scenes/df2.png" alt="Defacto2 Design" class="infoImage" />
					<br />
					<span class="bold">Defacto2 Design Intros</span><br />
					<a href="#application.SceneORGRoot#intros/" title="Goto the Defacto2 Design's intro page on Scene.org">Download from Scene.org</a><br />
					<a href="cracktros.cfm?mode=group&amp;value=Defacto2" title="Goto the Defacto2 intro collection in The Scene Archives">View the Defacto2 intros</a>
				</div>
				<div class="boxInfo01">
					<img src="images/magazine-scenes/defacto4.gif" alt="Defacto Magazine" class="infoImage" /><img src="images/magazine-scenes/defacto8.gif" alt="Defacto2 Magazine" class="infoImage" /><img src="images/magazine-scenes/defacto9.gif" alt="Defacto2 Magazine" class="infoImage" />
					<br />
					<span class="bold">The Magazines</span><br />
					<a href="magazines.cfm?mode=detail&amp;title=Defacto" title="Goto the Defacto magazine collection">Defacto</a> and <a href="magazines.cfm?mode=detail&amp;title=Defacto2" title="Goto the Defacto2 magazine collection">Defacto2</a><br />
				</div>										
				</td></tr></table>
				</td></tr></cfif>
			
			</table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>
</cfprocessingdirective>