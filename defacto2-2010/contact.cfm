<!--- 
File: contact.cfm
Version: 5.0
Author: Ben Garrett
Date: 19 June 2006
Revised:
18/Feb/2010 - Removed the 'TO' pull-down menu in the contact form.
This is the contact base template. Supports html & flash form (expandable) and allows multiple modes, currently it's used for ..
The Scene Portal submissions, Contact Us
Okay 1
 --->
<cfparam name="url.mode" default="contact">
<cfparam name="url.format" default="flash">

<cfif url.mode EQ "portal" OR (IsDefined("form.mode") AND form.mode EQ "portal")>
	<cfset title="Scene Portal Submission">
	<cfquery name="RSdf2Category" datasource="#application.portalSource#">
		SELECT CatName FROM thesceneportalcategories
	</cfquery>
<cfelse>
	<cfset title="Contact Us">
</cfif>

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - #title#</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table border="0" cellpadding="0" cellspacing="0" class="box02">
			<tr><td class="left">
			<div class="functionHeader">#title#</div>
			<div class="fs15 center italic" style="margin-bottom:12px;">Please make sure you use a valid e-mail address if you expect a reply</div>
			<cfif IsDefined("FORM.mode") AND FORM.mode EQ "portal">
				<cfinvoke component="cfcs.contact" method="portalSend">
			<cfelseif IsDefined("FORM.mode") AND FORM.mode EQ "contact">
				<cfinvoke component="cfcs.contact" method="contactSend">
			<cfelseif url.mode EQ "portal" AND url.format EQ "flash" and not FindNoCase('KHTML', CGI.HTTP_USER_AGENT, 1)>
				<cfinvoke component="cfcs.contact" method="portalFlash">
			<cfelseif url.mode EQ "portal" AND (url.format EQ "html" or FindNoCase('KHTML', CGI.HTTP_USER_AGENT, 1))>
				<cfinvoke component="cfcs.contact" method="portalHTML">
			<cfelseif url.mode EQ "contact" AND url.format EQ "flash" and not FindNoCase('KHTML', CGI.HTTP_USER_AGENT, 1)>
				<cfinvoke component="cfcs.contact" method="contactFlash">
			<cfelseif url.mode EQ "contact" AND  (url.format EQ "html" or FindNoCase('KHTML', CGI.HTTP_USER_AGENT, 1))>
				<cfinvoke component="cfcs.contact" method="contactHTML">
			</cfif>
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>