
<!--- 
File: 		nfo-browser.cfm
Version: 	5.0
Author: 	Ben Garrett
Date: 		4 July 2003
			20 Jun 2006 : Major revision
This application browses files and directories using stored in the /NFO/ directory on the server.
okay 1
--->
<!---
<cfparam name="form.filter" default="">
<cfif FORM.filter EQ "" AND CGI.HTTP_USER_AGENT CONTAINS "MSIE 6" AND NOT CGI.HTTP_USER_AGENT CONTAINS "Opera">
	<cfset forceIE=true>
	<cfcache timespan="30" action="cache" directory="c:/websites/urk7tb/cacheIE/">
<cfelseif FORM.filter EQ "">
	<cfset forceIE=false>
	<cfcache timespan="30" action="cache" directory="c:/websites/urk7tb/cache/">
</cfif>
--->
<cfinvoke component="cfcs.meta" method="docType">
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - NFO Browser</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
<div style="margin:10px; text-align:center;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="documents"></div>
<div style="padding:140px; text-align:center; font-size:16px; font-weight:bold; color:#FFF; font-family:Arial, Helvetica, sans-serif;">Due to performance issues, this feature has been disabled, <a href="index.cfm" style="color:#09C;">please return to Defacto2</a></div>
<div style="margin:10px; text-align:center;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="documents"></div>
</body></html>
<cfabort>


<cfset forceIE=false>
<cfparam name="url.file" default="">
<!--- UPDATE nfo view statistic --->
<cfinvoke component="cfcs.nfobrowser" method="countClick" file="#url.file#">

<cfparam name="url.count" default="yes">
<cfset rootURLPath="#cgi.http_host#">
<cfset currentPage=GetFileFromPath(GetTemplatePath())>
<cfset totalFilesCount=0>
<!--- Defines a default starting directory if none exists --->
<cfif NOT IsDefined("url.Directory")>
	<cfset directory=application.nfoRootDir>
<cfelse>
	<cfset directory=application.nfoRootDir&url.directory>
</cfif>
<cfset fullDirectory=directory>
<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - NFO Browser</title>
	<link href="boxBrowse\box-Browse.css" rel="stylesheet" type="text/css" />
	<cfinvoke component="cfcs.meta" method="head" forceIE="#forceIE#">
</head>

<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td><cfinvoke component="cfcs.logos" method="sceneArchive" forceIE="#forceIE#">
			<div class="menuNavigation"><a href="index.cfm">The Scene Archive</a> \ <a href="documents.cfm">NFO files</a> \ NFO browser<span style="text-decoration:blink;">_</span></div>
			<div style="text-align:left;"><cfmodule template="boxBrowse\box-Browse.cfm"
			iconFolder="boxBrowse\icons"
			cryptionKey="#application.urlEncryptionKey#"
			id="df2nfobrowse"
			folderRoot="c:\websites\urk7tb\NFOoriginals"
			folderRootMask="NFO files"
			fileRemoteLinkage="no"
			showIcons="yes"
			showSize="yes"
			showType="no"
			showDate="yes"
			showExtra="no"
			showStatistics="yes"
			debug="none"
			tableWidth="700"
			doctype="none"></div>
				
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>