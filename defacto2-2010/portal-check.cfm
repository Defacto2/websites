<!--- 
File: 		portal-check.cfm
Version: 	2
Author: 	Ben Garrett
Date: 		1 May 2006
Checks HTML headers of web pages contained in the scene portal and saves the results to a database
 --->
 
<cfparam name="url.mode" default="scan">
<cfparam name="url.start" default="1">
<cfparam name="url.count" default="50">

<cfif url.mode eq "scan">
	<!--- scan html headers of the portal entries --->
	<cfset number=url.start>
	
	<cfquery name="PC" datasource="#application.portalSource#" cachedwithin="#CreateTimeSpan(0,0,60,0)#">
		SELECT * FROM thesceneportal ORDER BY id
	</cfquery>
	
	<cfoutput query="PC" startrow="#url.start#" maxrows="#url.count#">
	<cfif PC.Disable NEQ "1" AND left(PC.URL,4) EQ "http">
		<cfhttp url="#PC.URL#" method="HEAD" timeout="10" resolveurl="no" throwonerror="no" redirect="no"  ></cfhttp>
		<cfif IsDefined("cfhttp.StatusCode")>
			<cflock name="TSPStatUp" timeout="20" type="exclusive">
			<cfquery datasource="#application.portalSource#">
			UPDATE thesceneportal SET Status='#cfhttp.StatusCode#<cfif IsDefined("cfhttp.responseHeader.Location")> - <a href="#cfhttp.responseHeader.Location#">#cfhttp.responseHeader.Location#</a></cfif>'
			WHERE ID=#PC.ID#
			</cfquery>
			</cflock>
		</cfif>
		<cfflush>
	</cfif>
	#PC.ID#<br />
	</cfoutput>
	<cflock name="TSPStatUp" timeout="20" type="exclusive">
	<cfquery datasource="#application.portalSource#">
		UPDATE thesceneportalstatuscheck SET lastStatusCheck=#now()# WHERE ID=1
	</cfquery>
	</cflock>
	END
	<cfelse>
	<!--- initialise timed scan --->
	<cfschedule
	action="UPDATE"
	task="Update portal URLs 1-50"
	operation="HTTPRequest"
	url="http://www.defacto2.net/portal-check.cfm?start=1&count=50"
	startdate="04/01/2006"
	starttime="09:00 am"
	interval="21600"
	>
	<cfschedule
	action="UPDATE"
	task="Update portal URLs 51-100"
	operation="HTTPRequest"
	url="http://www.defacto2.net/portal-check.cfm?start=51&count=50"
	startdate="04/01/2006"
	starttime="09:02 am"
	interval="21600"
	>
	<cfschedule
	action="UPDATE"
	task="Update portal URLs 101-150"
	operation="HTTPRequest"
	url="http://www.defacto2.net/portal-check.cfm?start=101&count=50"
	startdate="04/01/2006"
	starttime="09:04 am"
	interval="21600"
	>
	<cfschedule
	action="UPDATE"
	task="Update portal URLs 151-200"
	operation="HTTPRequest"
	url="http://www.defacto2.net/portal-check.cfm?start=151&count=50"
	startdate="04/01/2006"
	starttime="09:06 am"
	interval="21600"
	>
	<cfschedule
	action="UPDATE"
	task="Update portal URLs 201-250"
	operation="HTTPRequest"
	url="http://www.defacto2.net/portal-check.cfm?start=201&count=50"
	startdate="04/01/2006"
	starttime="09:08 am"
	interval="21600"
	>
</cfif>