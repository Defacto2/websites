<!--- 
File: 		bbs.cfm
Version: 	2
Author: 	Ben Garrett
Date:		17th July 2003
			24 Jan 05 : Added more information to each BBS such as siteop, affils etc.
			31 Mar 06 : Merged all the bbs-captures-???.cfm files into this one application.
			23 Jun 06 : New code
Displays various BBS screen captures
okay 1
 --->
 
<cfparam name="url.title" default="">

<cfif url.title EQ "">
	<cfquery name="filePackA" datasource="#application.dataSource#" cachedwithin="#application.standardTimeOut#">
		SELECT * FROM filepacks WHERE id = 3
	</cfquery>
	<cfquery name="filePackB" datasource="#application.dataSource#" cachedwithin="#application.standardTimeOut#">
		SELECT * FROM filepacks WHERE id = 4
	</cfquery>
	
	<cfoutput>
	<!--- Page timer initialisation --->
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
	<!--- HTML code --->
	<cfinvoke component="cfcs.meta" method="docType">
	<head>
		<!--- Document title --->
		<title>Defacto2 - Bulletin Board Systems</title>
		<cfinvoke component="cfcs.meta" method="head">
	</head>
	<body id="DF2Body">
		<cfinvoke component="cfcs.logos" method="siteLogo">
		<table cellpadding="0" cellspacing="0" class="box01">
			<tr><td>
			<table cellpadding="0" cellspacing="0" class="box02">
				<tr><td><cfinvoke component="cfcs.logos" method="sceneArchive"></td></tr>
				<tr><td>
				<div class="menuNavigation"><a href="index.cfm">The Scene Archive</a> \ Bulletin board systems<span style="text-decoration:blink;">_</span></div>
				<div class="left">A bulletin board system or BBS is a computer system running software that allows users to dial into the system over a phone line and, using a terminal program, perform functions such as downloading software and data, uploading data, reading news, and exchanging messages with other users. During their heyday (from the late 1970s to the late 1990s), many BBSes were run as a hobby free of charge by the "SysOp" (system operator), while other BBSes charged their users a subscription fee for access.
				<p></p>Bulletin board systems were in many ways a precursor to the modern form of the World Wide Web and other aspects of the Internet. BBSes were a highly social phenomenon and were used for meeting people and having discussions in message boards as well as for publishing articles, downloading software, playing games and many more things using a single application. The BBS was also a local phenomenon, as one had to dial into a BBS with a phone line and would have to pay long distance charges for a BBS out of the local area. Thus, many users of a BBS lived in the same area and it was common for them to hold a BBS Meet, where everyone from the same board would gather and meet face to face.
				<p></p>Some BBSes, called elite boards, were exclusively used for distributing pirated software. These BBSes often had multiple modems and phone lines, allowing several users to upload and download files at once. Most elite BBSes used some form of new user verification, where new users would have to apply for membership and attempt to prove that they weren't a law enforcement officer or a lamer. The largest elite boards accepted users by invitation only.
				<a href="http://en.wikipedia.org/wiki/Bulletin_board_system" class="italic">Quoted from Wikipedia</a></div>
				<cfloop query="filePackA">
					<cfif nolocal EQ TRUE>
						<cfset downloadAttr="downloads;#filename#;#filesize#;nolocal;#fulltitle#">
					<cfelse>
						<cfset downloadAttr="downloads;#filename#;#filesize#;#fulltitle#">
					</cfif>
					<table class="boxBBS01">
					<tr><td>
						<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="#downloadAttr#" returnvariable="encryptedDAttr">
						<a href='download.cfm?#encryptedDAttr#' class="bbsPackHeader blackLink" title="Download #fulltitle#">#fulltitle#</a>
						<div class="bbsPackText">
							#summarydes#<br />
							Last revised on #dateFormat(lastrevised,"d-mmmm, yyyy")#<br />
							Compressed at #numberformat(filesize/1024,"_____._")# MB<br />
						</div>										
					</td><td style="width:164px;"><img src="images/bbs-scenes/sw.gif" alt="Southern Wastelands" class="bbsPackCapture" />
					</td><td style="width:164px;"><img src="images/bbs-scenes/sep.gif" alt="Sepultura" class="bbsPackCapture" />
					</td></tr></table>
				</cfloop>
				<cfloop query="filePackB">
					<cfif nolocal EQ TRUE>
						<cfset downloadAttr="downloads;#filename#;#filesize#;nolocal;#fulltitle#">
					<cfelse>
						<cfset downloadAttr="downloads;#filename#;#filesize#;#fulltitle#">
					</cfif>
					<table class="boxBBS01">
					<tr><td>
						<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="#downloadAttr#" returnvariable="encryptedDAttr">
						<a href='download.cfm?#encryptedDAttr#' class="bbsPackHeader blackLink" title="Download #fulltitle#">#fulltitle#</a>
						<div class="bbsPackText">
							#summarydes#<br />
							Last revised on #dateFormat(lastrevised,"d-mmmm, yyyy")#<br />
							Compressed at #numberformat(filesize/1024,"_____._")# MB<br />
						</div>										
					</td><td style="width:164px;"><img src="images/bbs-scenes/akiratop.gif" alt="Akira Top Users" class="bbsPackCapture" />
					</td><td style="width:164px;"><img src="images/bbs-scenes/akiralogo.gif" alt="Akira Logo" class="bbsPackCapture" />
					</td></tr></table>
				</cfloop>	
				<table class="boxBBS01">
				<tr><td>
					<a href='http://www.roysac.com/bbs.asp' class="bbsPackHeader blackLink" title="Visit the Closed Society BBS web site">Closed Society BBS</a>
					<div class="bbsPackText">
						Roy/SAC of <a href="http://www.roysac.com">roysac.com</a> recalls his experiences of running his German based elite BBS, Closed Society. The board ran for 4 years and at one stage was raided by the state police. Also check out the video where Roy logs into a skeleton, temporary revived copy of his board and navigates around with chip tune as the background music.
					</div>										
				</td><td style="width:164px;"><img src="images/bbs-scenes/closedsociety1.png" alt="Closed Society BBS" class="bbsPackCapture" />
				</td><td style="width:164px;"><img src="images/bbs-scenes/closedsociety2.png" alt="Closed Society BBS" class="bbsPackCapture" />
				</td></tr></table>			
				<table class="boxBBS01">
				<tr><td>
					<a href='http://entropybbs.co.nz' class="bbsPackHeader blackLink" title="Visit the Entropy BBS web site">Entropy BBS live!</a>
					<div class="bbsPackText">
						Ever curious what a real BBS looked or operated like?
						Well thanks to deathr0w you can access his elite old school BBS online.
						While all the illegal files and message flaming are long gone you can still see what it was like before the days of the www.
					</div>										
				</td><td style="width:164px;"><img src="images/bbs-scenes/entropy/entropybbs.jpg" alt="Entropy BBS" class="bbsPackCapture" />
				</td><td style="width:164px;"><img src="images/bbs-scenes/entropy/04.gif" alt="Entropy BBS" class="bbsPackCapture" />
				</td></tr></table>
				<div style="text-align:justify;" class="boxBBS02"><a href="bbs.cfm?title=phonedirectory" title="Goto the Telephone Area Codes page" class="purpleLink boxBBS02Header">Area Codes:</a> We mainly have this list as a convenience. So when you are browsing through old NFO and documents, you can quickly decode the location mentioned. As generally in the old BBS scene people used the area code to describe an area or location rather then stating the city or country.</div>
				<table cellpadding="0" cellspacing="0" style="width:100%; margin-top:22px;">
					<tr>
						<td style="width:50%; padding-right:2px; vertical-align:top;">
							<cfinvoke component="cfcs.bbs" method="link2Akira">
							<cfinvoke component="cfcs.bbs" method="link2COC">
							<cfinvoke component="cfcs.bbs" method="link2Dimxxx">
							<cfinvoke component="cfcs.bbs" method="link2Godsrealm">
							<cfinvoke component="cfcs.bbs" method="link2Entropy">
						</td>
						<td style="width:50%; padding-left:2px; vertical-align:top;">
							<cfinvoke component="cfcs.bbs" method="link2Parkcentral">
							<cfinvoke component="cfcs.bbs" method="link2Streets">
							<cfinvoke component="cfcs.bbs" method="link2Suburbia">
							<cfinvoke component="cfcs.bbs" method="link2TOS">
							<cfinvoke component="cfcs.bbs" method="link2Thewall">
							<cfinvoke component="cfcs.bbs" method="link22112">
						</td>
					</tr>
				</table>
				
				</td></tr></table>
			</td></tr>
		</table>
		<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
		<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
	</body>
	</html>
	</cfoutput>

<cfelse>

	<cfoutput>
	<!--- Page timer initialisation --->
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
	<!--- HTML code --->
	<cfinvoke component="cfcs.meta" method="docType">
	<head>
		<!--- Document title --->
		<cfinvoke component="cfcs.bbs" method="title" title="#url.title#" returnvariable="HTMLTitle">
		<title>#HTMLTitle#</title>
		<cfinvoke component="cfcs.meta" method="head">
	</head>
	<body id="DF2Body">
		<cfinvoke component="cfcs.logos" method="siteLogo">
		<table cellpadding="0" cellspacing="0" class="box01">
			<tr><td>
			<table cellpadding="0" cellspacing="0" class="box02">
				<tr><td><cfinvoke component="cfcs.logos" method="sceneArchive"></td></tr>
				<tr><td>
					<cfif url.title EQ "phonedirectory">
						<cfinvoke component="cfcs.bbs" method="phonedirectory">
					<cfelseif url.title EQ "akira">
						<cfinvoke component="cfcs.bbs" method="akira">
					<cfelseif url.title EQ "coc">
						<cfinvoke component="cfcs.bbs" method="coc">
					<cfelseif url.title EQ "2112">
						<cfinvoke component="cfcs.bbs" method="twoeleventtwo">
					<cfelseif url.title EQ "dimxxx">
						<cfinvoke component="cfcs.bbs" method="dimxxx">
					<cfelseif url.title EQ "godsrealm">
						<cfinvoke component="cfcs.bbs" method="godsrealm">
					<cfelseif url.title EQ "entropy">
						<cfinvoke component="cfcs.bbs" method="entropy">
					<cfelseif url.title EQ "parkcentral">
						<cfinvoke component="cfcs.bbs" method="parkcentral">
					<cfelseif url.title EQ "streets">
						<cfinvoke component="cfcs.bbs" method="streets">
					<cfelseif url.title EQ "suburbia">
						<cfinvoke component="cfcs.bbs" method="suburbia">
					<cfelseif url.title EQ "tos">
						<cfinvoke component="cfcs.bbs" method="tos">
					<cfelseif url.title EQ "thewall">
						<cfinvoke component="cfcs.bbs" method="thewall">															
					</cfif>
				</td></tr></table>
			</td></tr>
		</table>
		<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
		<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
	</body>
	</html>
	</cfoutput>
</cfif>