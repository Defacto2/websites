<!--- 
File: 		site-map.cfm
Version: 	2
Author: 	Ben Garrett
Date: 		5 August 2005
			15 Jun 06 : New Code
A text based site-map to help users with quick and easy navigation
 --->
 
<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - Site Map</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td class="left">
			<div class="functionHeader">Site Map</div>
			
			<span class="mapHeader"><img src="images/siteinfo/df2-fulldspy.png" alt="Defacto2 capture" title="A capture of the Defacto2 webpage" class="boxMap01" />General Information</span>
			<ul class="mapList">
				<li><a href="site-info.cfm?mode=aboutdf2">What is Defacto2 about &amp; our history?</a></li>
				<li><a href="site-info.cfm?mode=credits">Thanks and contributors</a></li>
			</ul>
			<span class="mapHeader">Contact Us</span>
			<ul class="mapList">
				<li><a href="site-upload.cfm">Wanted Files</a></li>
				<li><a href="site-upload.cfm">User File Submissions</a></li>
			</ul><ul class="mapList">
				<li><a href="contact.cfm?mode=contact&amp;format=flash">Using our Flash forms</a></li>
				<li><a href="contact.cfm?mode=contact&amp;format=html">Using our HTML forms</a></li>
			</ul><ul class="mapList">
				<li><a href="contact.cfm?mode=portal&amp;format=flash">Add or update a Scene Portal entry using our Flash form</a></li>
				<li><a href="contact.cfm?mode=portal&amp;format=html">Add or update a Scene Portal entry using our HTML form</a></li>
			</ul><!---<ul class="mapList">
				<li><a href="https://www.paypal.com/xclick/#urlEncodedFormat('business=donations%40defacto2.net&item_name=Defacto2&no_shipping=1&no_note=1&tax=0&currency_code=USD')#">Send us a donation</a></li>
			</ul>--->
			<span class="mapHeader">Search</span>
			<ul class="mapList">
				<li><a href="search.cfm">Search the site using Google search</a></li>
			</ul><ul class="mapList">
				<li><a href="site-info.cfm?mode=updates">Site updates (all changes)</a></li>
				<li><a href="site-info.cfm?mode=updates&amp;type=new&amp;display=displayboth">Site updates (new files and additions)</a></li>
				<li><a href="site-info.cfm?mode=updates&amp;type=new&amp;display=files">Site updates (new files)</a></li>
			</ul><ul class="mapList">
				<li><a href="site-map.cfm">Site map</a></li>
			</ul>
			<span class="mapHeader">Web Feeds</span>
			<ul class="mapList">
				<li><a href="feed.cfm?list=introduction">Information on our Atom and RSS web feeds</a></li>
			</ul>
			<span class="mapHeader">The Scene News</span>
			<ul class="mapList">
				<li><a href="index.cfm">Display all news items</a></li>
			</ul>
			<span class="mapHeader">The Scene Portal</span>
			<ul class="mapList">
				<li>Art and Demo Scenes <span class="mapSmallLinks">(<a href="portal.cfm?portalimg=yes&amp;Category=art&amp;Sort=name">captures</a>) (<a href="portal.cfm?portalimg=no&amp;Category=art&amp;Sort=name">text</a>)</span></li>
				<li>Computer/Console Emulation <span class="mapSmallLinks">(<a href="portal.cfm?portalimg=yes&amp;Category=Emulation&amp;Sort=name">captures</a>) (<a href="portal.cfm?portalimg=no&amp;Category=Emulation&amp;Sort=name">text</a>)</span></li>
				<li>Old School Scenes <span class="mapSmallLinks">(<a href="portal.cfm?portalimg=yes&amp;Category=Old%20School&amp;Sort=name">captures</a>) (<a href="portal.cfm?portalimg=no&amp;Category=Old%20School&amp;Sort=name">text</a>)</span></li>
				<li>General Gaming <span class="mapSmallLinks">(<a href="portal.cfm?portalimg=yes&amp;Category=Gaming&amp;Sort=name">captures</a>) (<a href="portal.cfm?portalimg=no&amp;Category=Gaming&amp;Sort=name">text</a>)</span></li>
				<li>Computer Music Scene <span class="mapSmallLinks">(<a href="portal.cfm?portalimg=yes&amp;Category=Music&amp;Sort=name">captures</a>) (<a href="portal.cfm?portalimg=no&amp;Category=Music&amp;Sort=name">text</a>)</span></li>
        <li>Legal Scene Torrents <span class="mapSmallLinks">(<a href="portal.cfm?portalimg=yes&amp;Category=Torrent&amp;Sort=name">captures</a>) (<a href="portal.cfm?portalimg=no&amp;Category=Torrent&amp;Sort=name">text</a>)</span></li>
			</ul>
			<span class="mapHeader">The Scene Archives</span>
			<ul class="mapList">
				<li><a href="help.cfm?mode=dos">Help for running old DOS programs on modern Windows</a></li>
				<li><a href="help.cfm?mode=error">Deciphering application error messages</a></li>
			</ul><ul class="mapList">
				<li><a href="site-upload.cfm">File submission</a></li>
			</ul><ul class="mapList">
				<li><a href="groups.cfm">Group repository</a></li>
			</ul><ul class="mapList">
				<li><a href="timeline.cfm">Scene timeline</a></li>
			</ul><ul class="mapList">
				<li><a href="cracktros.cfm">Crack-intros sorted by group</a></li>
				<li><a href="cracktros.cfm?mode=listauthor">Crack-intros sorted by authors</a></li>
				<li><a href="cracktros.cfm?mode=listfile">Crack-intros sorted by file name</a></li>
				<li><a href="cracktros.cfm?mode=listyear">Crack-intros sorted by the year of release</a></li>
				<li><a href="cracktros.cfm?mode=youtube">Crack-intros with YouTube videos</a></li>
				<li><a href="cracktros.cfm?mode=all">Crack-intros sorted by the date they were added to the site</a></li>
			</ul><ul class="mapList">
				<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;SceneFantasy-Beta.zip;1089;local;Scene Fantasy Legend Beta" returnvariable="SFLDL">
				<li><a href="download.cfm?#SFLDL#">Scene Fantasy Legend (beta) download</a></li>
				<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;SceneFantasyDemo-CLASS.zip;174;local;Scene Fantasy Legend Demo" returnvariable="SFLDL">
				<li><a href="download.cfm?#SFLDL#">Scene Fantasy Legend (preview) download</a></li>
			</ul><ul class="mapList">
				<li><a href="bbs.cfm">Bulletin Board System captures</a></li>
				<li><a href="bbs.cfm?title=phonedirectory">BBS area codes</a></li>
			</ul><ul class="mapList">
				<li><a href="documents.cfm">Documents and text files</a></li>
				<li><a href="groups.cfm?mode=banners">Web site advertising banners</a></li>
				<li><a href="nfo-browser.cfm">NFO files, online browsing</a></li>
				<li><a href="nfo-files.cfm">NFO creation tools and viewing applications</a></li>
			</ul><ul class="mapList">
				<li><a href="magazines.cfm?mode=code">Coded magazines</a></li>
				<li><a href="magazines.cfm?mode=text">Text magazines and reports</a></li>
				<li><a href="magazines.cfm?mode=web">Internet web magazines</a></li>
				<li><a href="magazines.cfm?mode=codes">Magazine codes and hacks</a></li>
				<li><a href="timeline.cfm?startMonth=1&startYear=1980&endMonth=10&endYear=2006&events=true&magazines=true&display=Submit">Magazine release timeline</a></li>
			</ul>
			<div class="mapHeader">File Packs</div>
			<div class="mapList fs14" style="margin-left:30px;">
				<cfinvoke component="cfcs.filepacks" method="list" fontAdjust="10px" margin="6px">
			</div>
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>			