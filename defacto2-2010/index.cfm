<!--- 
File: index.cfm
Version: 2
Author: Ben Garrett
Date: 22 June 2006

Main template for the whole website
--->
<cfparam name="url.page" default="1">

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - Your source for the underground</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td><cfinvoke component="cfcs.index" method="header">

				<table cellpadding="0" cellspacing="0" class="boxIndex01">
					<tr>
						<td class="boxIndex02">
							<cftry><cfinvoke component="cfcs.news" method="list" page="#url.page#"><cfcatch>Error retrieving The Scene News</cfcatch></cftry>
						</td>
						<td class="boxIndex03">
							<cftry><cfinvoke component="cfcs.index" method="newestFiles"><cfcatch>Error retrieving file lists</cfcatch></cftry>
							<cftry><cfinvoke component="cfcs.index" method="thisWeekInTheScene"><cfcatch>Error retrieving TWINS</cfcatch></cftry>
							<!--- <img src="images/index/poll.png" alt="Option poll" title="Option poll" class="indexLogos" />	
							<div class="boxIndex10"><cftry><cfinvoke component="cfcs.polls" method="questions"><cfcatch>Error retrieving polls</cfcatch></cftry></div> --->
              <div style="margin-top:20px;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="square-upper"></div>
							<cftry><cfinvoke component="cfcs.index" method="thesceneportal"><cfcatch>Error retrieving The Scene Portal links</cfcatch></cftry>
							<cftry><cfinvoke component="cfcs.index" method="theSceneArchive"><cfcatch>Error retrieving The Scene Archive links</cfcatch></cftry>
              <div style="margin-top:20px;"><!--- 19/Feb/10 : Disabled underperforming advert. <cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="square-lower">---></div>
							<img src="images/index/packs.png" alt="File packs" title="File packs" class="indexLogos" />	
							<div class="boxIndex11"><cftry><cfinvoke component="cfcs.filepacks" method="list" margin="2px"><cfcatch>Error retrieving file pack links</cfcatch></cftry></div>
							<img src="images/index/stats.png" alt="Site statistics" title="Site statistics" class="indexLogos" />
							<div class="boxIndex14"><cftry><cfinvoke component="cfcs.statistics" method="usersActive"><cfcatch>Error retrieving active statistics</cfcatch></cftry></div>
							<!--- <div class="boxIndex12 indexStats"><cfinvoke component="cfcs.statistics" method="display"></div> --->
							<div class="boxIndex13 indexStats" style="margin-top:10px;"><cftry><cfinvoke component="cfcs.statistics" method="popularDownloads" limit="9"><cfcatch>Error retrieving top9 downloads</cfcatch></cftry></div>
							<div class="boxIndex13 indexStats" style="margin-top:10px;"><cftry><cfinvoke component="cfcs.statistics" method="popularLinks" limit="9"><cfcatch>Error retrieving top9 links</cfcatch></cftry></div>
							<cfinvoke component="cfcs.index" method="DF2Button">
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