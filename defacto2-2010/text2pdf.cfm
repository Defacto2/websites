<!--- 
File: 		text2pdf.cfm
Version: 	2
Author: 	Ben Garrett
Date: 		30 March 2005
			15 Jun 06 : New Code
Using features introduced in CFML 7, this application takes text documents and converts them to PDF files
All 6 ID's are required in the URL
 --->
<!--- D1 = File Directory ; D2 = File Name ; D3 = Document Title ; D4 = Subheading ; D5 = Author ; D6 = Date --->
This feature has been aborted!
<cfabort>

<cfinvoke component="cfcs.download" method="decipherURL" section="1" url="#cgi.query_string#" returnvariable="D1">
<cfinvoke component="cfcs.download" method="decipherURL" section="2" url="#cgi.query_string#" returnvariable="D2">
<cfinvoke component="cfcs.download" method="decipherURL" section="3" url="#cgi.query_string#" returnvariable="D3">
<cfinvoke component="cfcs.download" method="decipherURL" section="4" url="#cgi.query_string#" returnvariable="D4">
<cfinvoke component="cfcs.download" method="decipherURL" section="5" url="#cgi.query_string#" returnvariable="D5">
<cfinvoke component="cfcs.download" method="decipherURL" section="6" url="#cgi.query_string#" returnvariable="D6">
<!--- Define file's URL --->
<cfif #D1# EQ "n/a">
	<cfset FullPath="#urlDecode(D2)#">
<cfelse>
	<cfset FullPath="#D1##D2#">
</cfif>

<!--- Error check for valid file --->
<cfif NOT fileExists(ExpandPath(#FullPath#))>
	Error, the text file requested is missing or the path given is invalid
	<cfabort>
</cfif>

<!--- HTML Code Starts --->
<cfdocument format="pdf" fontembed="no">
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
<body>
	<!--- Note: Coldfusion HTML to PDF does not support CSS --->
	<!--- PDF header --->
	<cfdocumentitem type="header">
	<table width="100%"  border="0" cellspacing="0" cellpadding="2"><tr>
		<!--- Display document title --->
		<td width="33%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="12pt" color="##000000">#D3#</font></div></td>
		<!--- Sub-heading --->
		<td width="33%"><div align="center"><font face="Arial, Helvetica, sans-serif" size="12pt" color="##000000"><em>"#D4#"</em></font></div></td>
		<!--- Author --->
		<td width="33%"><div align="right"><font face="Arial, Helvetica, sans-serif" size="12pt" color="##000000">#D5#</font></div></td>
	</tr></table>
	</cfdocumentitem >
	<!--- PDF footer --->
	<cfdocumentitem type="footer"> 
		<table width="100%"  border="0" cellspacing="0" cellpadding="2"><tr>
			<!--- Published date --->
			<td width="20%"><div align="left"><font face="Arial, Helvetica, sans-serif" size="12pt">#D6#</font></div></td>
			<!--- Link to original text file (ie the non-PDF file) --->
			<td width="80%"><div align="right"><font color="navy" face="Tahoma" size="9pt">http://www.defacto2.net/#FullPath#</font></div></td>
		</tr></table>
	</cfdocumentitem>
<!--- PDF body --->
</cfoutput>
<cfoutput>
<pre>
<cfinclude template="#fullPath#">
</pre>
</cfoutput>
</body>
</html>
</cfdocument>