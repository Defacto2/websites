<!--- 
File: grouups.cfm
Version: 2
Author: Ben Garrett
Date: 4th July 2006

This is the application for our group repository section.
Okay 1
--->
<cfparam name="url.sort" default="yearFounded">
<cfparam name="url.mode" default="list">
<cfparam name="url.org" default="">
<cfparam name="url.display" default="all">
<cfparam name="url.format" default="">

<cfif IsNumeric(url.mode)>
	<cfinvoke component="cfcs.groups" method="file" file="#url.mode#" format="#url.format#">
</cfif>

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - 
		<cfif url.mode EQ "list">Group Repository
		<cfelseif url.mode EQ "banners">Web Site Banners
		<cfelseif url.mode EQ "detail">
		<cfquery name="RS1" datasource="#application.groupSource#" cachedwithin="#application.groupsTimeOut#">
			SELECT idname, completeName, acronym FROM repositorygroupdetail WHERE idName = '#org#'
		</cfquery>
		<cfif RS1.completeName NEQ "">#RS1.completeName# <cfif RS1.acronym NEQ "">(#ucase(RS1.acronym)#) </cfif></cfif>Group Page
		</cfif>
	</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td><cfinvoke component="cfcs.logos" method="sceneArchive">
				<div class="menuNavigation"><a href="index.cfm">The Scene Archive</a> \ Group Repository<span style="text-decoration:blink;">_</span></div>
				<cfif url.mode EQ "list">
					<cfset randomNfoNum=randrange(1,10)>
          <div class="boxGroup01"><img src="images/group-ascii-logos/groups-#randomNfoNum#.png" alt="Random group ANSI" /></div>
          <div style="margin-bottom:20px;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="group-detail"></div>
					<div class="left">
					While the IBM PC computer system was released during the middle of 1981, it would be the Commodore and Apple pirate scenes which would introduce many of the standards that today we take as granted.
					During these times the PC scene was small and fragmented.
					There were the occasional small groups and often not individuals releasing and cracking.
					But these cracked programs usually only ever remained in the community local to person cracking them.
					<p></p>
					The national and then eventually international PC scene did not take off until 1987.
					This was when people started to trade software with cracks over longer distances, and overseas.
					This act eventually lead to the formation of the now old school PC Bulletin Board System scene.
					<p></p>
					Quoted from the article <a href="documents.cfm?id=183" class="italic">'Online Software Piracy of the Last Millennium'</a>
					</div>
					<cfinvoke component="cfcs.groups" method="orderForm">
					<cfinvoke component="cfcs.groups" method="list">
					<cfinvoke component="cfcs.groups" method="webpages">
				<cfelseif url.mode EQ "banners">
					<cfinvoke component="cfcs.groups" method="banners">
				<cfelseif url.mode EQ "detail" AND url.org NEQ "">
					<cfinvoke component="cfcs.groups" method="detail" group="#url.org#">
					<cfinvoke component="cfcs.groups" method="fileList" group="#url.org#" display="#url.display#">
				</cfif>
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>