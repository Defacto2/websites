<!--- 
File: 		text2png.cfm
Version: 	2
Author: 	Ben Garrett
Date: 		15 April 2005
			15 Jun 06 : New Code
This application displays text documents that have been convered to PNG images
All 6 ID's are required in the URL
 --->
<!--- D1 = File Directory ; D2 = File Name ; D3 = Document Title ; D4 = Subheading ; D5 = Author ; D6 = Date --->
<cfinvoke component="cfcs.download" method="decipherURL" section="1" url="#cgi.query_string#" returnvariable="D1">
<cfinvoke component="cfcs.download" method="decipherURL" section="2" url="#cgi.query_string#" returnvariable="D2">
<cfinvoke component="cfcs.download" method="decipherURL" section="3" url="#cgi.query_string#" returnvariable="D3">
<cfinvoke component="cfcs.download" method="decipherURL" section="4" url="#cgi.query_string#" returnvariable="D4">
<cfinvoke component="cfcs.download" method="decipherURL" section="5" url="#cgi.query_string#" returnvariable="D5">
<cfinvoke component="cfcs.download" method="decipherURL" section="6" url="#cgi.query_string#" returnvariable="D6">

<!--- Define file's URL --->
<cfif #D1# EQ "n/a">
	<cfset fullPath="#urlDecode(D2)#">
<cfelse>
	<cfset fullPath="#D1##D2#">
</cfif>
<!--- Error check for valid file --->
<cfif NOT fileExists(expandPath(#FullPath#))>
	Error, this text file was unable to be converted to a PNG image
	<cfabort>
</cfif>

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - #D3# - PNG Version</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td><cfinvoke component="cfcs.logos" method="sceneArchive">
				<div class="boxText2A">
					<span class="bold">#D3#</span> <span class="fs10 grey">-/-</span> '#D4#' <span class="fs10 grey">-/-</span> <cfif D4 EQ "n/a">#D5#<cfelse>#D6#</cfif>
				</div>
				<cfif CGI.HTTP_USER_AGENT CONTAINS "Opera">
				<div class="center red fs14" style="padding-bottom:10px;">Please note that some editions of Opera have a bug that do not seem to render large (long) images properly</div>
				</cfif>
				<div class="boxText2B">
					<!--- Display PNG image of converted text --->
					<img src="#application.MagazinesPNG##D2#" alt="Converted issue of #D4#" border="1" />
				</div>
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>