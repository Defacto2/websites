<!--- 
File: download.cfm
Version: 2
Author: Ben Garrett
Date: 11th July 2006

User download interface.

Token ID's
1:	file directory ie "downloads"
2:	file name including extention ie "file.zip"
3:	file size in kb ie 50000 = 50 megs
4:	is file stored on defacto2.net? "nolocal" (optional)
5:	file display name (optional)

okay 1
--->

<cfparam name="url.file" default="">
<cfparam name="url.server" default="">

<cfif url.file NEQ "">
	<cfinvoke component="cfcs.download" method="downloadFile" file="#url.file#" server="#url.server#">
</cfif>

<cfinvoke component="cfcs.download" method="decipherURL" section="1" url="#cgi.query_string#" returnvariable="DI1">
<cfinvoke component="cfcs.download" method="decipherURL" section="2" url="#cgi.query_string#" returnvariable="DI2">
<cfinvoke component="cfcs.download" method="decipherURL" section="3" url="#cgi.query_string#" returnvariable="DI3">
<cfinvoke component="cfcs.download" method="decipherURL" section="4" url="#cgi.query_string#" returnvariable="DI4">
<cfinvoke component="cfcs.download" method="decipherURL" section="5" url="#cgi.query_string#" returnvariable="DI5">

<cfoutput>

<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - <cfif DI5 NEQ "">#DI5#<cfelse>#DI2#</cfif> : Download</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td><cfinvoke component="cfcs.logos" method="sceneArchive">
      <!--- Google Adsense --->
      <table cellpadding="0" cellspacing="0" align="center">
      <tr><td><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="download">
      </td><td><div style="width:100px;"></div>
      </td><td><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="download">
      </td></td></table>
			<!---<cfinvoke component="cfcs.download" method="donations">--->
			<cfinvoke component="cfcs.utilities" method="byteConversion" value="#(DI3*1024)#" returnvariable="size">
			<cfinvoke component="cfcs.utilities" method="downloadTime" size="#(DI3*1024)#" speed="56" returnvariable="modemspeed">
			<cfinvoke component="cfcs.utilities" method="downloadTime" size="#(DI3*1024)#" speed="1038" returnvariable="T1">
			<table cellpadding="0" cellspacing="0" class="boxDownload01">
			<tr><td colspan="2"><cfinvoke component="cfcs.download" method="readme" file_name="#DI2#"><div class="boxDownload02"><cfif DI5 NEQ "">#DI5#<cfelse>#DI4#</cfif></div></td></tr>
			<tr><td colspan="2">
				<cfif DI4 EQ "nolocal">
        	<div class="boxDownload09">
          <a href="download.cfm?file=#DI2#&amp;server=cpi" title="Download #DI2#">Download Now</a> - Canadian Pirates Inc. Mirror<br />
          <a href="download.cfm?file=#DI2#" title="Download #DI2#">Download Now</a> - Defacto2 Hosting
          </div>
					<!--- <div class="boxDownload09"><a href="http://www.untergrund.net" title="This file is kindly hosted by the untergrund network"><img src="http://www.untergrund.net/banners/88x31.gif" alt="untergrund.net" style="border:0px; vertical-align:middle;" /></a><span class="boxDownload10"><a href="download.cfm?file=#DI2#&amp;server=Untergrund" title="Download #DI2#">Download Now</a></span></div> --->
        <cfelse>
        <div class="boxDownload03"><a href="download.cfm?file=#DI2#" title="Download #DI2#">Download Now</a></div>
				</cfif>
			</td></tr>
			<tr>
				<td class="boxDownload04"><div class="boxDownload05">File Name:</div><div class="boxDownload06">#DI2#</div></td><td class="boxDownload08"><div class="boxDownload05">Size:</div><div class="boxDownload06">#size#</div></td>
			</tr>
			<tr>
				<td class="boxDownload04"><div class="boxDownload05">Modem:</div><div class="boxDownload06">around #modemspeed#</div></td><td class="boxDownload08"><div class="boxDownload05">T1/DSL1500:</div><div class="boxDownload06">around #T1#</div></td>
			</tr>
			<cfif right(DI2,3) EQ ".7z">
				<tr><td colspan="2"><div class="boxDownload07 red"><a href="http://www.7-zip.org/" title="Goto the official 7-Zip web site"><img src="images\7z.png" alt="7-Zip button" title="Goto the 7-Zip website" style="border:0px; vertical-align:middle;" /></a> Please note that this archive is compressed using the open source <a href="http://www.7-zip.org/" title="Goto the official 7-Zip web site">7-Zip archive format</a></div></td></tr>
			</cfif>
			</table>
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>