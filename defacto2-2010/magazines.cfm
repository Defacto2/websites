<!--- 
File: 		magazines.cfm
Version: 	2
Author: 	Ben Garrett
Date: 		16th July 2003
			18 Feb 2005 : Now displays a screenshot of the magazine
			20 Jun 2006	: Major update
Magazine's both text, web and coded, also includes a time line and a secret code listing.
okay 1
 --->
<cfparam name="url.mode" default="0">
<cfparam name="url.title" default="">
<cfparam name="url.id" default="">
<cfparam name="url.reader" default="">

<cfif IsNumeric(url.id)>
	<cfinvoke component="cfcs.magazines" method="download" id="#url.id#" reader="#url.reader#">
</cfif> 

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - <cfinvoke component="cfcs.magazines" method="title" mode="#url.mode#" title="#url.title#"></title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td>
			<cfinvoke component="cfcs.logos" method="sceneArchive">
			
			<cfif url.mode EQ "code" OR url.mode EQ "text">
				<!--- LIST coded magazines --->
				<div class="menuNavigation"><a href="index.cfm">The Scene Archive</a> \ <cfif IsDefined("url.mode") AND url.mode EQ 'no'>Magazine collection<cfelse>Text reports</cfif><span style="text-decoration:blink;">_</span></div>
				<cfif IsDefined("url.mode") AND url.mode EQ 'no'><cfinvoke component="cfcs.magazines" method="helpDialog"></cfif>
				<div class="left">
					<cfif IsDefined("url.mode") AND url.mode EQ 'code'>
						<!--- what is a diskmag? --->
						A diskmag is an electronic magazine that can be read using computers. The term "diskmag" is short for "diskette magazine". The traditional method of exchanging a diskmag with another person was either via the floppy disk itself, as the name would imply, or by dial-up BBS. Today's diskmags are distributed by any means possible, typically through the internet (FTP, WWW, IRC, etc.).
						<p></p>
						A unique and defining characteristic about a diskmag in contrast to a typical ASCII "zine" or "t-file" (or even "g-file") is that a diskmag usually comes housed as an executable program file that will only run on a specific hardware platform. A diskmag tends to have an aesthetically appealing and custom graphical user interface (or even interfaces), background music and other features that take advantage of the hardware platform the diskmag was coded for.
						<a href="http://en.wikipedia.org/wiki/Diskmag" class="italic">Quoted from Wikipedia</a>
					<cfelse>
						<!--- what is a text magazine --->
						An underground ezine is a publication without defined periodicity that discusses any subject which the publisher deems interesting or newsworthy.
						Most are distributed free and made by the ezine organizers. Some articles are contributed by other persons. The medium was supposedly created in 1984 by Cult of the Dead Cow.
						<a href="http://en.wikipedia.org/wiki/Underground_ezine" class="italic">Quoted from Wikipedia</a>
					</cfif>			
				</div>
				<div class="magListFeatures"><a href="timeline.cfm?startMonth=1&startYear=1980&endMonth=#dateFormat(now(),'m')#&endYear=#dateFormat(now(),'yyyy')#&events=true&magazines=true&display=Submit">Timeline</a> : See when your favourite <cfif IsDefined("url.mode") AND url.mode EQ 'no'>magazines<cfelse>text reports</cfif> were released and then compare to see what other <cfif IsDefined("url.mode") AND url.mode EQ 'no'>magazines <cfelse>reports </cfif>were published during the same period.		
					<cfif IsDefined("url.mode") AND url.mode EQ 'code'>
						<p style="margin:4px;"></p>
						<a href="magazines.cfm?mode=codes">Secret Codes</a> : The first magazine to introduce a secret section was Reality Check Network in issue ##14. It was a Space Invaders clone was imbedded into the magazine that would unlock secret articles if you reached past a specific high score.
					</cfif>
				</div>
        <div style="margin:10px;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="magazines"></div>
				<div>
					<cfif url.mode EQ "code"><cfset listMVar="0"><cfelse><cfset listMVar="-1"></cfif>
					<cfinvoke component="cfcs.magazines" method="listMagazines" type="#listMVar#">
				</div>
			<cfelseif url.mode EQ "detail">
				<!--- DISPLAY magazine details --->
				<div class="menuNavigation"><a href="index.cfm">The Scene Archive</a> \ Magazine collection<span style="text-decoration:blink;">_</span></div>
				<cfinvoke component="cfcs.magazines" method="checkMagExistance" magazine="#url.title#">
				<cfinvoke component="cfcs.magazines" method="details" magazine="#url.title#">
			<cfelseif url.mode EQ "codes">
				<!--- DISPLAY secret codes --->
				<cfinvoke component="cfcs.magazines" method="secretCodes">
			<cfelseif url.mode EQ "web">
				<div class="menuNavigation"><a href="index.cfm">The Scene Archive</a> \ Web magazines<span style="text-decoration:blink;">_</span></div>
				<cfinvoke component="cfcs.magazines" method="webMagazines">
			</cfif>
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>