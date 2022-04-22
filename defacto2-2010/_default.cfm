<!--- 
File: default.cfm
Version: 1
Author: Ben Garrett
Date: 4th July 2006

Groups ..
--->

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>CHANGE</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td><cfinvoke component="cfcs.logos" method="sceneArchive">



			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>