<!--- 
File: 		timeline.cfm
Version: 	0.1
Author: 	Ben Garrett
Date: 		12th Sep 2006
A site wide file based time line
 --->
<cfparam name="url.mode" default="">

<cfif CGI.QUERY_STRING EQ "">
<cfparam name="url.startMonth" default="1">
<cfparam name="url.startYear" default="1980">
<cfparam name="url.endMonth" default="#dateformat(now(),'m')#">
<cfparam name="url.endYear" default="#dateformat(now(),'yyyy')#">
<cfparam name="url.events" default="true">
<cfparam name="url.documents" default="true">
<cfparam name="url.nfo" default="true">
<cfparam name="url.docText" default="true">
<cfparam name="url.magazines" default="">
<cfparam name="url.docNonPC" default="">
<cfparam name="url.docArt" default="">
<cfparam name="url.docMisc" default="">
</cfif>

<!--- SQL Injection protection --->
<cfif 
	not IsValid('integer',url.startMonth) or
	not IsValid('integer',url.startYear) or
	not IsValid('integer',url.endMonth) or
	not IsValid('integer',url.endYear)
	>
	<cfabort>
</cfif>

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - 
		<cfif url.mode EQ "">Scene Timeline
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
				<div class="menuNavigation"><a href="index.cfm">The Scene Archive</a> \ Scene timeline<span style="text-decoration:blink;">_</span></div>
				<form action="timeline.cfm" method="get" name="timelineFilter">
				<table style="text-align:left; border:1px solid ##333333; margin-left:auto; margin-right:auto;">
					<tr>
						<td colspan="2">
						Display between 
						<select name="startMonth"><cfinvoke component="cfcs.timeline" method="numberList" selected="#url.startMonth#"></select>
						<select name="startYear"><cfinvoke component="cfcs.timeline" method="numberList" start="1980" end="#dateformat(now(),'yyyy')#" selected="#url.startYear#"></select>
						and
						<select name="endMonth"><cfinvoke component="cfcs.timeline" method="numberList" selected="#url.endMonth#"></select>
						<select name="endYear"><cfinvoke component="cfcs.timeline" method="numberList" start="1980" end="#dateformat(now(),'yyyy')#" selected="#url.endYear#"></select>
						</td>
					</tr>
					<tr>
						<td style="vertical-align:top;">
							<input name="events" type="checkbox" value="true"<cfif IsDefined("url.events") AND url.events EQ 'true'> checked="checked"</cfif>> Show scene events<br />
							<input name="nfo" type="checkbox" value="true"<cfif IsDefined("url.nfo") AND url.nfo EQ 'true'> checked="checked"</cfif>> Show NFOs*<br />
							<input name="magazines" type="checkbox" value="true"<cfif IsDefined("url.magazines") AND url.magazines EQ 'true'> checked="checked"</cfif>> Show magazines
							<div style="text-align:center; padding-top:5px;"><input name="display" type="submit"></div>
						</td>
						<td>
							<fieldset style="border:1px solid ##666666; font-size:11px; width:150px;">
								<legend style="font-size:12px;">Show Documents</legend>
								<input name="docText" type="checkbox" value="true"<cfif IsDefined("url.docText") AND url.docText EQ 'true'> checked="checked"</cfif>> Text files<br />
								<input name="docNonPC" type="checkbox" value="true"<cfif IsDefined("url.docNonPC") AND url.docNonPC EQ 'true'> checked="checked"</cfif>> non-PC scene files<br />
								<input name="docArt" type="checkbox" value="true"<cfif IsDefined("url.docArt") AND url.docArt EQ 'true'> checked="checked"</cfif>> Art files
							</fieldset>
						</td>
					</tr>
				</table>
				<div class="fs10">* Can cause timeouts when used with large year ranges</div>
				</form>
				<div><cfinvoke component="cfcs.timeline" method="display" urlString="#CGI.QUERY_STRING#"></div>
			</td></tr>
			</table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>