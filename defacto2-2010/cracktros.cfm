<!--- 
File: cracktros.cfm
Version: 2
Author: Ben Garrett
Date: 14th July 2006

Displays and sorts through the large collection of cracktros, intros, loaders etc.
--->

<cfparam name="url.mode" default="listgroup">
		<!--- tempary fix for TRSI group list problem --->
		<cfif IsDefined("url.value") AND urldecode(cgi.query_string) CONTAINS 'value=Tristar & Red Sector Inc'>
			<cfset value="Tristar & Red Sector Inc">
		<cfelse>
			<cfparam name="url.value" default="">
		</cfif>
		<!---  --->
<cfparam name="url.value" default="">
<cfparam name="url.page" default="1">
<cfparam name="url.id" default="">

<cfif IsNumeric(url.id)>
	<!--- Download a file --->
	<cfinvoke component="cfcs.cracktros" method="download" id="#url.id#">
</cfif>

<cfif NOT IsDefined("cookie.cracktroRecordsAtOnce") AND NOT IsDefined("url.recordsAtOnce")>
	<cfparam name="url.recordsAtOnce" default="25">
<cfelseif NOT IsDefined("url.recordsAtOnce") AND IsDefined("cookie.cracktroRecordsAtOnce")>
	<cfparam name="url.recordsAtOnce" default="#cookie.cracktroRecordsAtOnce#">	
</cfif>
<cfif IsDefined("url.recordsAtOnce") AND url.recordsAtOnce GTE 1 AND url.recordsAtOnce LTE 25>
	<cfcookie name="cracktroRecordsAtOnce" value="#url.recordsAtOnce#" expires="never">
</cfif>

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - 
		<cfswitch expression="#mode#">
			<cfcase value="listauthor">Cracktros - Author Listing</cfcase>
			<cfcase value="listgroup">Cracktros - Group Listing</cfcase>
			<cfcase value="group,author">#value#'s Cracktros</cfcase>
			<cfcase value="year">Cracktros from #value#</cfcase>
			<cfcase value="file">Cracktros : #value#</cfcase>
			<cfcase value="installer">Cracktros - Listing Installers</cfcase>
			<cfcase value="listfile">Cracktros - A-Z</cfcase>
			<cfcase value="all">Cracktros - Listing All</cfcase>
			<cfcase value="listyear">Cracktros - By Year</cfcase>
			<cfcase value="popular">Cracktros - Most Popular</cfcase>
			<cfcase value="winonly">Cracktros - Windows</cfcase>
			<cfcase value="dosonly">Cracktros - DOS</cfcase>
			<cfcase value="youtube">Cracktros - YouTube</cfcase>
		</cfswitch>
	</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td><cfinvoke component="cfcs.logos" method="sceneArchive">
				<div class="menuNavigation">&nbsp; <a href="index.cfm">The Scene Archive</a> \ Cracktros<span style="text-decoration:blink;">_</span></div>
				<cfif mode CONTAINS "list">
					<cfinvoke component="cfcs.cracktros" method="randomCapture">
					<div class="left">
						A crack intro, also known as either a cracktro, loader, or just an intro, is a small introduction sequence added to cracked software, designed to inform the user which "cracking crew" or individual cracker was responsible for removing the software's copy prevention and distributing the crack.
						<p></p>
						These first appeared on Apple II and Commodore 64 games that were distributed around the world via Bulletin Board Systems (BBSes) and floppy disk copying.
						Initially the intros consisted of simple messages, but they grew progressively more complex as (the programmers from) each cracking crew attempted to show off how much more talented they were than (other programmers in) other groups.
						<p></p>
						As a result, crack intros began to feature big colourful effects, music, and scrollers.
						Cracking groups would use the intros not just to gain credit for cracking, but to advertise their BBSes, greet friends, and to give themselves recognition.
						Messages were frequently of a vulgar nature, and on some occasions made threats of violence against software companies.
						<p></p>
						Cracktro programming eventually became an art form in its own right, and people started coding intros without attaching them to a crack just to show off how well they could program.
						This evolved into the demoscene. <a href="http://en.wikipedia.org/wiki/Crack_intros" class="italic">Quoted from Wikipedia</a>
					</div>
					<!---<div style="margin-top:10px;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="horizontal"></div>--->
					<cfinvoke component="cfcs.cracktros" method="filter" mode="#url.mode#">
					<div style="border-bottom:1px solid ##CCCCCC; margin-bottom:12px;">
						<cfinvoke component="cfcs.cracktros" method="list" mode="#url.mode#" value="#url.value#">
					</div>
					<cfinvoke component="cfcs.cracktros" method="packs">
				<cfelse>
					<cfinvoke component="cfcs.cracktros" method="filter" mode="#url.mode#" value="#url.value#">
					<cfinvoke component="cfcs.cracktros" method="details" mode="#url.mode#" value="#url.value#" recordsAtOnce="#url.recordsAtOnce#" page="#url.page#">
				</cfif>			
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>