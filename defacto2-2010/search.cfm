<!--- 
File: default.cfm
Version: 1
Author: Ben Garrett
Date: 4th July 2006

Groups ..
--->

<cfparam name="url.q" default="">
<cfparam name="url.sitesearch" default="">

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - Search</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td>
			</cfoutput>
				<form method="get" action="http://www.defacto2.net/search.cfm" target="_top" style="margin-bottom:2px;padding:0px;">
					<fieldset style="border:0px; padding:0px; margin:0px; font-size:11px;">
					<input type="hidden" name="domains" value="www.defacto2.net" />
					<input type="hidden" name="client" value="pub-REMOVED" />
					<input type="hidden" name="forid" value="1" />
					<input type="hidden" name="ie" value="UTF-8"></input>
					<input type="hidden" name="oe" value="UTF-8"></input>
					<input type="hidden" name="cof" value="GALT:#008000;GL:1;DIV:#336699;VLC:663399;AH:center;BGC:FFFFFF;LBGC:FFFFFF;ALC:0000FF;LC:0000FF;T:000000;GFNT:0000FF;GIMP:0000FF;LH:50;LW:597;L:http://www.defacto2.net/images/df21.gif;S:http://www.defacto2.net;FORID:11"></input>
					<input type="hidden" name="hl" value="en" />
					<!---
					<input type="hidden" name="sitesearch" value="www.defacto2.net" />
					--->
					<input type="hidden" name="flav" value="0000"></input>
					<input type="hidden" name="sig" value="FwAbdqulm2v1f982"></input>
			<cfoutput>
					<cfif url.q NEQ "">
					<input type="text" name="q" size="40" maxlength="255" value="#HTMLEditFormat(url.q)#" />
					<cfelse>
					<input type="text" name="q" size="40" maxlength="255" value="" />
					</cfif>
					<input type="submit" name="sa" value="Search" title="Search our site using Google Search" /> &nbsp; 
					<cfif url.sitesearch EQ "www.defacto2.net">
					<input type="radio" name="sitesearch" value="www.defacto2.net" checked="checked"></input> Site &nbsp; 
					<input type="radio" name="sitesearch" value=""></input> Web
					<cfelse>
					<input type="radio" name="sitesearch" value="www.defacto2.net"></input> Site &nbsp; 
					<input type="radio" name="sitesearch" value="" checked="checked"></input> Web
					</cfif>
				</fieldset>
				</form>
				<!-- Google Search Result Snippet Begins -->
				<div id="googleSearchUnitIframe" style="height:1300px;"></div>
				<script type="text/javascript">
				   var googleSearchIframeName = 'googleSearchUnitIframe';
				   var googleSearchFrameWidth = 740;
				   var googleSearchFrameborder = 0 ;
				   var googleSearchDomain = 'www.google.com';
				</script>
				<script type="text/javascript" src="http://www.google.com/afsonline/show_afs_search.js"></script>
				<!-- Google Search Result Snippet Ends -->
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>