<!--- 
File: 		shop.cfm
Version: 	1.5
Author: 	Ben Garrett
Date: 		17 January 2006
			15 Jun 06 : New Code
			18 Feb 10 : Updated links, as some sites have been infected with malware.
Links to Amazon and other items
okay 1
 --->

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - Scene Shopping</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td>
			<div class="geneva fs26 center"><img src="images/scene-shop.png" style="padding-top:6px; padding-bottom:6px;" alt="The Scene Shop" /></div>
			
			<!--- Introduction --->
			<div class="sceneShopIntro">
				Let us start off by stating that we are NOT selling any of the items listed below.
				This page is simply a list of goods for sale online that in some way or another relate to the scene.
				So we have decided to review and list these products on this our new page, Scene<span class="italic">Shop</span>.
				<p></p>
				You might ask, why pay for something that I could probably find online for free?
				Well because sometimes viewing a DVD in the comfort of your own lounge room is a lot easier and more convenient then spending weeks searching and downloading online.
				Others, myself included, simply prefer reading printed text on paper rather than the harsh low resolution computer fonts used on web sites.
				Either way, often non-computer mediums are just a better way of relaying information or displaying media.
				Let's not forget to mention that many of the items listed below delve into topics that are often only covered to a limited degree online.
                <p>Updated: 
                  <!-- ##BeginDate format:Am1 -->February 18, 2010<!-- ##EndDate -->
                </p>
			</div>
<!--- 			<div class="GoogleAds">
				<!--- Amazon Ad --->
				<!---<cfinvoke component="cfcs.advertising" method="AmazonOmakase">--->
				<iframe src="http://astore.amazon.com/defacto2" width="578" height="660" style="border:1px solid ##CCCCCC; margin-bottom:10px;" frameborder="0" scrolling="no"></iframe>
			</div> --->
			<div class="GoogleAds">
				<!--- Google Ad --->
				<cfinvoke component="cfcs.advertising" method="GoogleAdSense" color="sceneshop">
			</div>				
			<!--- Freax --->
			<table cellpadding="0" cellspacing="0" class="boxSceneShop"><tr><td>
				<img src="images/amazon/freax.jpg" alt="Freax book cover" class="sceneShopItemIMG" />
				<h1 class="sceneShopTitle">Freax - The brief history of the demoscene</h1>
				<h2 class="sceneShopSubTitle">Volume 1. by Tamr Polgr</h2>
				Hardcover. 224 pages<br />
				Publisher. CSW-Verlag (August 1, 2005)<br />
				ISBN. 3981049403
				<div class="sceneShopReview">
					<span class="sceneShopOR">Our Review:</span> 8.5
				</div>
				<span class="sceneShopBody">
				Freax is the labor of love of one Tamas Polgar who had been working on this book since the mid 1990s.
				For Tamas, this book is only the first half of a two part series that covers his fondest topic, The Scene.
				</span>
				<p class="sceneShopBody">
				This first book begins by covering the history of computer graphics, demonstrations and their relation to the scene today, including the history of Commodore, their legendary computer the C-64 and the underground pirate scene that ensues from its creation..
				Before the transformation of pirates into artists and then the fragmentation of the old C-64 scene as the new multimedia super-computer, the Commodore Amiga arrives.
				After the Amiga it follows peoples experiences through the downfall of Commodore with the heartbreak of its users, and the realization that standards and commodities have taken over from efficiency and personalities in the computing age.
				</p>
				<p class="sceneShopBody">
				So why would someone interested in the PC scene care about this book? Well many things in today's and yesteryears PC cracking and demo scenes can be traced to the Commodore, specifically the C-64. Topics such as the first ever cracktro, the first ever cracking group, the origins of the couriers and the reasons behind elite speak, and much more is all covered here. Terms such as cracking, training, 0-day warez, suppliers, demo groups are all defined in relation to the earliest cracking scene with why or how these originated.
				</p><p class="sceneShopBody">
				The book is well presented and detailed. Printed on a high quality glossy paper contained within a solid and durable cover  it does not feel cheap or rough, though the page bindings do look a little weak. There is good number of well sized photos and images contained within the book that are always appropriate, never seeming as token space filters or eye-candy. It is a shame that the book is written by an author for whom English is clearly a second language. At times it can be hard to read, requiring some mental adjustment to get through it all, and unfortunately the later chapters seem a bit dry with a seemingly endless index of chronicled events.
				</p>
				<p class="sceneShopBody">
				Fortunately there is so much content and history contained within the pages that you are often willing to forgive these short comings. Even though Freax does seem a little expensive, one must remember that it is a <span class="italic">self published</span> full color/glossy hardcover, 200 plus page book. For anyone who doesn't mind spending a little money initially, this is a book which covers a lot of in-depth information that simply cannot be found online.
				</p>
				<p>
                <ul>
                	<li><a href="http://www.amazon.co.uk/Freax-Brief-History-Computer-Demoscene/dp/3981049403">Amazon.co.uk</a> (United Kingdom) - Sell the book from 21.00 GBP. They also sell <a href="http://www.amazon.co.uk/Freax-Art-Album-Polg%C3%A1r-Tam%C3%A1s/dp/3981049411/ref=sr_1_2?ie=UTF8&s=books&qid=1266497893&sr=1-2">FREAX - The Art Album</a> for 25.10 GBP.</li>
                	<li><a href="http://www.maz-sound.de/goto_product_20">Maz Sound Tools</a> (Germany) - Sell the book from 24.95 EUR. They also sell <a href="http://www.maz-sound.de/goto_product_29">FREAX - The Art Album</a> from 29.95 EUR.</li>
                    <li><a href="http://www.go64.de/shop/product_info.php/info/p2_Freax.html">CSW Verlag</a> (Germany) - Sell the book from 24.95 EUR. They also sell <a href="http://www.go64.de/shop/product_info.php/info/p87_Freax-The-Art-Album.html">FREAX - The Art Album</a> from 29.95 EUR.</li>
                    <li><a href="http://www.amazon.com/exec/obidos/redirect?path=ASIN/3981049403&amp;link_code=as2&amp;camp=1789&amp;tag=defacto2&amp;creative=9325">Amazon.com</a> (USA) - List resellers and 2nd hand sellers of the book.
                    <li><del datetime="February 18, 2010 12:16 PM"><!--<a href="http://www.freaxbook.com">-->Acid Productions<!--</a>--> (USA) - Are selling the book with shipping for 42.46 USD within North America, 55.44 USD without.</del><ins>The Acid server is infected with Malware and so we have removed this link to it.</ins></li>
                    <li><del datetime="February 18, 2010 12:16 PM"><a href="http://www.freax.hu/">Official Freax web site</a> (Hungary) - Has a list of European distributors.</del></li>
                </ul>			
				</p>
			</td></tr></table>
			<!--- BBS Documentary --->
			<table cellpadding="0" cellspacing="0" class="boxSceneShop"><tr><td>
				<img src="images/amazon/bbs.jpg" alt="BBS DVD cover" class="sceneShopItemIMG" />	
				<h1 class="sceneShopTitle">BBS - The Documentary</h1>
				<h2 class="sceneShopSubTitle">by Jason Scott</h2>
				All Region DVD (Color, Director's Cut, Full Screen, Special Edition, Subtitled, NTSC)<br />
				Running Time. 330 minutes<br />
				Studio. Bovine Ignition Systems (May 1, 2005)<br />
				ASIN. B0009NN6EA<br />
                <a href="http://www.bbsdocumentary.com">bbsdocumentary.com</a>, <a href="http://www.imdb.com/title/tt0460402/"><acronym title="Internet Movie Database">IMDB</acronym> entry</a>
				<div class="sceneShopReview">
					<span class="sceneShopOR">Our Review:</span> 9.0
				</div>
				<span class="sceneShopBody">
				The objective of a documentary is to cover a specific topic, and it must be able to communicate the subject to people who may have no prior knowledge or have never even heard of it. Further, it also needs to provide explanations in a matter that is entertaining and interesting, and on both counts this documentary manages to succeed.
				</span>
				<p class="sceneShopBody">
				BBS avoids the trap of sounding like a typical technobabble IT video by staying clear of the dry technical sides of the old bulletin board systems. Rather, it covers the people, personalities, communities, and politics that evolved from this new technical social medium, making it much more palatable and enjoyable viewing.
				</p>
				<p class="sceneShopBody">
				Interestingly though this is an independently financed and produced production by first time director, Jason Scott of www.textfiles.com fame. While normally I would be wary of such a production, Jason has managed to maintain a certain level quality and professionalism, so that the documentary wouldn't look out of place as a series on a documentary cable channel.
				</p><p class="sceneShopBody">
				The DVD itself is also finely constructed and could put a few Hollywood studio releases to shame. The three disc DVD set comes in a 4 page plastic fold out holder with a slip on cover. Each of the covers has appropriate photos, glossy graphics or text, which reveals that it was not done on the cheap.
				</p>
				<p class="sceneShopBody">
				Now for all the praises I have labeled on this DVD there are also a couple of bad points. Firstly it can drag on a bit, and while we know there is a huge amount of information on this topic to cover, sometimes I found myself wanting to reach for the skip button on my remote. The other problem is purely a superficial one; a number of the people interviewed are just plain butt ugly. Maybe that is part of the reason these people were attracted to BBSing in the first place. Now I know this might seem a minor point to pick on, but when you have to watch 5 and a half hours of documentary some of these can start to wear on you a bit. You've been warned.
				</p>
				<p>
                <ul>
                	<li><a href="http://www.archive.org/details/BBS.The.Documentary">The Internet Archive</a> (Online) - Allow you to legally download the entire documentary. They also have <a href="http://www.archive.org/details/bbs_documentary">extra footage and interviews</a>.</li>
                    <li><a href="http://video.google.com/videosearch?q=%22BBS:+The+Documentary%22##emb=0&q=%22BBS%3A+The+Documentary+Episode%22&view=3">Google Video</a> (Online) - Allow you to legally watch the entire documentary online.</li>
                	<li><a href="http://www.bbsdocumentary.com/order/">BBS Documentary web site</a> (USA) - Producer Jason Scott has an official documentary website that also sells the DVD for 45 USD including shipping.</li>
                    <li><a href="https://order.kagi.com/?6FaCq">Kagi</a> (USA) - Sell it for 40 USD plus 4 USD shipping within North America, 8 USD from without.
                    <li><a href="http://www.amazon.com/exec/obidos/tg/detail/-/B0009NN6EA">Amazon.com</a> (USA) - List resellers and 2nd hand sellers of the DVD.</li>          
                    
                </ul>
				</p>				
			</td></tr></table>				
			<!--- Mind Candy --->
			<table cellpadding="0" cellspacing="0" class="boxSceneShop"><tr><td>
				<img src="images/amazon/mindcandy1.jpg" alt="Mind Candy DVD" class="sceneShopItemIMG" />
				<h1 class="sceneShopTitle">MindCandy Volume 1: PC Demos</h1>
				<h2 class="sceneShopSubTitle">by Peter Hajba, Jim Leonard</h2>
				All Region DVD (Animated, Colour, Dolby, Full Screen, NTSC)<br />
				Running Time. 230 minutes<br />
				Studio. Microcinema (January 14, 2003)<br />
				ASIN. B00007M4IB<br />
                <a href="http://www.mindcandydvd.com/1">mindcandydvd.com</a>, <a href="http://us.imdb.com/title/tt0359695/combined"><acronym title="Internet Movie Database">IMDB</acronym> entry</a>
				<div class="sceneShopReview">
					<span class="sceneShopOR">Our Review:</span> 9.0
				</div>
				<span class="sceneShopBody">
				Mind Candy is a collection of 42 PC demos that have been painstakingly recorded for prosperity using DVD video. This DVD comes with a single double-sided disc that is divided into two sections. The first section on side A covers more modern demos from 1998 to 2001. While the second side and my favorite, covers oldskool, with demos going right back to the early days of the PC scene including one from 1990 as well as Future Crew's famous 2nd Reality.
				</span>
				<p class="sceneShopBody">
				Now you can actually go and download and then run all these demos yourself on your own home computer. However besides spending an awful lot of time trying to configure every demo to work properly using old and redundant operating systems, you would also miss out on a number of extras that you can not find anywhere except on this DVD.
				</p><p class="sceneShopBody">
				DVD features include:<br />
				A 16 minute featurette on Demos.<br />
				Audio commentary for every one of the demos.<br />
				A 12 page glossy colour booklet briefing every demo on the discs.
				</p><p class="sceneShopBody">
				Overall this is a great package for an excellent price and deserves to be in everyone's DVD collection. Also lookout for the excellent sequal, <a href="http://www.mindcandydvd.com/1">MindCandy Volume 2: Amiga Demos</a> as well as <a href="http://www.mindcandydvd.com/3">MindCandy Volume 3: PC Demos 2003-09</a> which is due out in 2010.
				</p>
                <p>
                <ul>
                	<li><a href="http://www.mindcandydvd.com/order##orderhere">MindCandy website</a> (USA) - Sell it from 12.00 USD. They list a large number of world-wide distributors.</li>
                	<li><a href="http://www.amazon.com/exec/obidos/redirect?path=ASIN/B00007M4IB&amp;link_code=as2&amp;camp=1789&amp;tag=defacto2&amp;creative=9325">Amazon.com</a> (USA) - Sell it from 17.99 USD.</li>
                    <li><a href="http://www.maz-sound.de/goto_product_17">Maz Sound Tools</a> (Germany) - Sell the it from 15.00 EUR. They also sell <a href="http://www.maz-sound.de/goto_product_32">MindCandy Volume 2: Amiga Demos</a> from 15.00 EUR.</li>
                    <li><a href="http://www.go64.de/shop/product_info.php/info/p5_MINDCANDY--Volume-1--PC-Demos.html">CSW Verlag</a> (Germany) - Sell it from 15.37 EUR. They also sell <a href="http://www.go64.de/shop/product_info.php/info/p92_MINDCANDY--Volume-2--Amiga-Demos.html">MindCandy Volume 2: Amiga Demos</a> from 15.37 EUR.</li>
                </ul>
                </p>
			</td></tr></table>			
			<!--- Demo Artscene --->
			<table cellpadding="0" cellspacing="0" class="boxSceneShop"><tr><td>
				<img src="images/amazon/demo.jpg" alt="Demoscene The Art of Real-time book cover" class="sceneShopItemIMG" />
				<h1 class="sceneShopTitle">Demoscene: The Art of Real-Time</h1>
				<h2 class="sceneShopSubTitle">by Lassi Tasajrvi</h2>
				Paperback. 72 pages<br />
				Publisher. Even Lake Studios (June 1, 2004)<br />
				ISBN. 952917022X<br />
                <a href="http://www.demoscenebook.com/">demoscenebook.com</a>
				<div class="sceneShopReview">
					<span class="sceneShopOR">Our Review:</span> 7.5
				</div>
				<span class="sceneShopBody">
				This booklet is a small primer to the demo scene and its glorious and in depth history. While it is professionally produced and quite readable, one gets the feeling that it is just too short, and to be honest it is.
				</span><p class="sceneShopBody">
				To sum it up, the production has sacrificed style over substance. Just like a lot of the demo scene, except unlike most demo scene productions, this booklet costs money, quite a lot of money in fact if you buy it from Amazon, but if that doesn't bother you, then I do recommend this. After all it makes a unique coffee table book and a good conversation piece for your unenlightened friends.
				</p>
                <p>
                <ul>
                	<li><a href="http://www.demoscenebook.com/buythebook.html">EvenLake Studios</a> (Finland) - Sells the PDF eBook edition for 9.95 EUR.</li>
                    <li><a href="http://www.amazon.com/gp/product/952917022X">Amazon.com</a> (USA) - "Out of Print--Limited Availability."</li>
                    <li><a href="http://www.fusecon.com/products/demobooks/">Fusecon</a> (USA) - "I'm all SOLD OUT of this product. I do not expect to get additional stock."</li>
                </ul>
                </p>
			</td></tr></table>
			<!--- Dark Domain --->
			<table cellpadding="0" cellspacing="0" class="boxSceneShop"><tr><td>
				<img src="images/amazon/dd.jpg" alt="Dark Domain DVD cover" class="sceneShopItemIMG" />			
				<h1 class="sceneShopTitle">Dark Domain: The Artpacks.acid.org Collection</h1>
				<h2 class="sceneShopSubTitle">by ACiD Productions</h2>
				DVD Rom<br />
				Studio. ACiD Productions, LLC (January 1, 2004)<br />
				ISBN. 0974653705<br />
                <del><a href="http://www.acid.org/darkdomain/">Acid Productions</a></del>
				<div class="sceneShopReview">
					<span class="sceneShopOR">Our Review:</span> n/a
				</div><span class="sceneShopBody">
				We don't actually have a copy of this product so there is no review, but this DVD-Rom is a file archive of the once popular artpacks.acid.org. A massive archive that covered the demo, art (and occasionally cracking) scenes with a wide variety of packs, magazines and miscellaneous files.
				</span><p class="sceneShopBody">
				Due to bandwidth usage and the costs associated this service, it was eventually taken off-line, but you can still get the collection as it was until 2003 on this great DVD. While the collection these days is maintained by Jason Scott at <a href="http://artscene.textfiles.com/">artscene.textfiles.com</a>, it could take you a long time to download it all with tens of gigabytes worth of files on offer.
				</p>
                <p>
                	<ul>
                    <li><a href="http://artscene.textfiles.com/">artpacks.textfiles.com</a> (USA) - Offers the entire collection online, free to download via a web interface.</li>
                    <li><a href="http://cd.textfiles.com/darkdomain/">cd.textfiles.com</a> (USA) - Offers the entire collection online, free to download without a web interface.</li>
                    <li><a href="http://www.bbsdocumentary.com/order/">BBS Documentary web site</a> (USA) - Sell it for 15 USD.</li>
                    <li><del><a href="http://www.acid.org/darkdomain/">Acid Productions</a> (USA) - Sell it 17.54 USD within North America, 21.54 without.</del></li>
                    </ul>
                </p>
			</td></tr></table>				
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>