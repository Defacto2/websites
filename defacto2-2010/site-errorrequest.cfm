<!--- 
File: site-errorexcepvalidation.cfm
Version: 2
Author: Ben Garrett
Date: 11th July 2006

Hides the default Coldfusion error messages with themed site templates
--->

<cfoutput>
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Error Validation: #error.Message#</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td>
				<p class="bold">Error Request (#error.Message#)</p>
				<p class="italic">An unexpected error has occurred. Please retry what you were attempting to do. If this error re-occurs we apologise in advance, an e-mail will be automatically sent to our web site administrator.</p>
				<p class="bold">Technical Information</p>
				<p>Error type: <span class="red">Request (<span class="italic">#error.Message#</span>)</span></p>
				Time of occurrence: <span class="blue">#error.DateTime#</span><br />
				Web page source: <span class="blue">#error.Template#</span><br />
				Web page string: <span class="blue">#error.QueryString#</span><br />
				Web page referral: <span class="blue">#error.HTTPReferer#</span>
				Your IP address: <span class="blue">#error.remoteAddress#</span><br />
				Your browser: <span class="blue">#error.Browser#</span>
				<p>#error.Diagnostics#</p>
				<cfif 
					error.Message DOES NOT CONTAIN "The request has exceeded the allowable time limit Tag:"
				>
					<!--- write error to text file --->
					<cfset erroroutput="Request Error with #error.Template#?#error.QueryString#" & chr(13) & chr(10)>
					<cfset erroroutput="#erroroutput#Occured on #error.DateTime# by #error.remoteAddress#" & chr(13) & chr(10)>
					<cfset erroroutput="#erroroutput##error.Message#">
					<cfset erroroutput="#erroroutput#" & chr(13) & chr(10)>
					<cfset errorfile="c:\websites\urk7tb\errors.txt">
					<cfif FileExists("#errorfile#") IS TRUE>
						<cffile action="append" file="#errorfile#" output="#erroroutput#" addnewline="yes">
					<cfelse>
						<cffile action="write" file="#errorfile#" output="#erroroutput#" addnewline="yes">
					</cfif>
				</cfif>
			</td></tr></table>
		</td></tr>
	</table>
</body>
</html>
</cfoutput>