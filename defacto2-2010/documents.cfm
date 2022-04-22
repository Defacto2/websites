<!--- 
File: documents.cfm
Version: 3
Author: Ben Garrett
Date: 5th July 2006

Displays in detailed documents and webpages related to the scene
okay 1
--->
<cfparam name="url.category" default="Category">
<cfparam name="url.order" default="DESC">
<cfparam name="url.id" default="">
<cfparam name="url.reader" default="">
<!--- url params to change the display or order of the documents --->
<cfif IsDefined("url.category") AND IsDefined("url.Order")>
  <cfif URL.Category EQ "Category">
    <cfset documentsSelection = "Category">
    <cfelseif URL.Category EQ "Year">
    <cfset documentsSelection = "Year">
	<cfelseif URL.Category EQ "Type">
	<cfset documentsSelection = "Type">
  </cfif>
  <cfif URL.Order EQ "ASC">
    <cfset documentsSort = "ASC">
    <cfelseif URL.Order EQ "DESC">
    <cfset documentsSort = "DESC">
  </cfif>
</cfif>

<!--- Is the template accessing a specific document or displaying a list of all the documents --->
<cfif IsNumeric(url.id) IS TRUE>
	<cfinvoke component="cfcs.documents" method="countDownload" id="#url.id#" reader="#url.reader#">
</cfif>

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - Scene Documents, text and NFO files</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td><cfinvoke component="cfcs.logos" method="sceneArchive">
				<div class="menuNavigation"><a href="index.cfm">The Scene Archive</a> \ NFO files<span style="text-decoration:blink;">_</span></div>
				
				<table cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<div style="margin:0px 4px 4px 0px; border:1px solid ##000000; padding:1px; height:368px; margin-right:3px; margin-bottom:3px;">
								<img src="images/documents/nfo1.png" alt="Vanishing Point ANSI" title="Vanishing Point by Rooster circa 1993" />
							</div>
						</td>
						<td style="vertical-align:top;">
							<div class="left">
								NFO is short for the word information.
								It is now the term used when talking about the descriptive text file that groups include within their releases.
								Originally these text files only contained information about the cracking process of the program.
								But as time progressed other details were included such as information about the game, quick 'HOW-TO's and release credits.
								Eventually these text files became more formalized and were included as standard in every release by every group.
								<a href="http://en.wikipedia.org/wiki/.nfo">A Wikipedia description can be found here.</a>
								
								<p><a href="nfo-files.cfm" title="Goto the NFO utilities">We have collected 14 NFO viewers and editors</a>.
								All of which can be found at our NFO utilities page.
								If you are after a simple viewer for Windows, we recommend ACiD View.
								It's fast, doesn't require installation and displays both ANSI and ASCII files perfectly.
								</p>
								
								<div class="boxDoc09">
								<a href="nfo-browser.cfm" style="color:##FFFFFF;" class="nfoBrowserAd" title="Browse through our extensive online NFO collection">
								<img src="images/documents/nfo2.png" style="float:right; border:0px;" alt="NFO browser capture" />
								We have a collection of 6,200 different NFO files hosted online at Defacto2.
								Using our custom web based file navigation application you can easily navigate through our extensive selection.
								Our collection goes as far back to the earliest NFO files from 1989 right up until the demise of the CD-RIP scene in 2001.
								</a></div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2"><cfinvoke component="cfcs.documents" method="packs"></td>
					</tr>
				</table>	
        <div style="margin-top:10px;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="documents"></div>			
				<div class="menuNavigation boxDoc02"><a id="documentSection"></a><a href="index.cfm">The Scene Archive</a> \ Documents and text files<span style="text-decoration:blink;">_</span></div>
				<div class="left">
					An electronic document means any computer data (other than programs or system files) that are intended to be used in their computerized form, without being printed (although printing is usually possible).
					<p></p>
					Originally, any computer data were considered as something internal - the final data output was always on paper.
					However, the development of computer networks have resulted in that in most cases it is much more convenient to distribute electronic documents than printed ones.
					And the improvements in display technologies mean that in most cases it is possible to view documents on screen instead of printing them (thus saving paper and the room required to store the printed copies).
					<a href="http://en.wikipedia.org/wiki/Electronic_document"><span class="italic">Quoted from Wikipedia</span></a>
				</div>
				<cfinvoke component="cfcs.documents" method="filterMenu" documentsSelection="#documentsSelection#" documentsSort="#documentsSort#">
				<cfinvoke component="cfcs.documents" method="listDocuments" documentsSelection="#documentsSelection#" documentsSort="#documentsSort#">
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>