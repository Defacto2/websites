<!--- 
File: site-errorexcepvalidation.cfm
Version: 2
Author: Ben Garrett
Date: 11th July 2006

Hides the default Coldfusion error messages with themed site templates
--->

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
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
			<tr><td><cfinvoke component="cfcs.logos" method="sceneArchive">
				<p class="bold">Form Validation Request</p>
				<span class="italic">An unexpected form error has occurred. Please retry what you were attempting to do. If this error re-occurs we apologise in advance.</span>
				<p class="bold">Technical Information</p>
				<p>Error type: <span class="red">Form Validation</span></p>
				<span class="blue">#error.validationHeader#</span><br />
				<p>#error.invalidFields#</p>
				<span class="blue">#error.validationFooter#</span><br />
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>