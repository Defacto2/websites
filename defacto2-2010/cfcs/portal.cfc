<cfcomponent>

	<cffunction name="buttonAd" access="public" returntype="string" hint="Displays a site's button/banner advert">
		<cfargument name="id" required="yes" type="numeric">
		<cfargument name="title" required="no" default="Entry">
		<cfoutput>
		<cfif FileExists(ExpandPath("images/portal-banners/#id#.png")) IS "Yes">
			<div style="margin-bottom:4px;"><img src="images/portal-banners/#id#.png" alt="#title# button advert" title="#title# button advert" /></div>
		<cfelseif FileExists(ExpandPath("images/portal-banners/#id#.jpg")) IS "Yes">
			<div style="margin-bottom:4px;"><img src="images/portal-banners/#id#.jpg" alt="#title# button advert" title="#title# button advert" /></div>
		<cfelseif FileExists(ExpandPath("images/portal-banners/#id#.gif")) IS "Yes">
			<div style="margin-bottom:4px;"><img src="images/portal-banners/#id#.gif" alt="#title# button advert" title="#title# button advert" /></div>												
		</cfif>		
		</cfoutput>
	</cffunction>
	
	<cffunction name="capture" access="public" returntype="string" hint="Displays a image capture of the site">
		<cfargument name="id" required="yes" type="numeric">
		<cfargument name="title" required="no" default="Entry">
		<cfoutput>
		<cfif FileExists(ExpandPath("images/portal-scenes/#id#.png")) IS "Yes">
			<img src="images/portal-scenes/#id#.png" alt="#title# capture" title="#title# capture" style="border: 1px solid ##CCCCCC;" />
		<cfelseif FileExists(ExpandPath("images/portal-scenes/#id#.jpg")) IS "Yes">
			<img src="images/portal-scenes/#id#.jpg" alt="#title# capture" title="#title# capture" style="border: 1px solid ##CCCCCC;" />
		<cfelseif FileExists(ExpandPath("images/portal-scenes/#id#.gif")) IS "Yes">
			<img src="images/portal-scenes/#id#.gif" alt="#title# capture" title="#title# capture" style="border: 1px solid ##CCCCCC;" />										
		</cfif>		
		</cfoutput>
	</cffunction>
	
	<cffunction name="category" access="public" returntype="query" hint="Displays a detailed description about the current category">
		<cfargument name="group" required="yes">
		<cfquery name="RS1" datasource="#application.portalSource#" cachedwithin="#application.portalTimeOut#">
			SELECT Cat301,CatDesc,CatName,CatURL FROM thesceneportalcategories WHERE '#group#' IN (CatURL,Cat301)
		</cfquery>
		<cfset returnValue=RS1>
		<cfreturn returnValue>
	</cffunction>
	
	<cffunction name="lastStatusCheck" access="public" returntype="string" hint="Returns the last time the site's HTML headers were checked">
		<cfquery name="RS1" datasource="#application.portalSource#" cachedwithin="#createTimeSpan(0,0,0,0)#">
			SELECT * FROM thesceneportalstatuscheck WHERE id=1
		</cfquery>
		<cfset returnValue=RS1.lastStatusCheck>
		<cfreturn returnValue>
	</cffunction>
	
	<cffunction name="recordClick" access="public" returntype="string" hint="Records to the DB when a link has been clicked">
		<cfargument name="recordID" type="numeric" required="true">
			<cfquery name="RS1" datasource="#application.portalSource#">
				SELECT * FROM thesceneportal WHERE id = #recordID#
			</cfquery>
			<cfoutput>
			<!--- checks to make sure all the url variables are correct --->
			<cfif IsDefined("RS1.id") AND RS1.id NEQ "">
				<cfquery datasource="#application.portalSource#">
					<cflock scope="application" type="exclusive" timeout="5">
						<cfif RS1.Clicks EQ "">
							<!--- if the current id has no views, then start with 1 --->
							UPDATE thesceneportal SET Clicks=1 WHERE id=#recordID#
						<cfelse>
							<!--- If the current id is an integer, then increase it --->
							UPDATE thesceneportal SET Clicks=#IncrementValue(RS1.Clicks)# WHERE id=#recordID#
						</cfif>
					</cflock>
				</cfquery>
				<cflocation addtoken="no" url="#RS1.URL#">
			<cfelse>
				There is an error in the url supplied.<br />
				<cflocation addtoken="no" url="portal.cfm">
			</cfif>
			</cfoutput>			
	</cffunction>

	<cffunction name="siteRating" access="public" returntype="string" hint="Displays the images of stars for use with the site's review">
		<cfargument name="rating" required="no" default="0">
		<cfargument name="type" required="no" default="website">
		<cfif type EQ "website">
			<cfset image='star'>
		<cfelse>
			<cfset image='star-o'>
		</cfif>
		<cfif rating GT 0>
			<cfset count=0>
			<cfoutput><cfloop index="index" from="1" to="#rating#"><cfset count=IncrementValue(count)><img src="images/#image#.gif" alt="Star" title="#rating# star rating" style="margin-bottom:1px;" /><br /></cfloop></cfoutput>
		<cfelse>
			&nbsp;
		</cfif>
	</cffunction>
	
</cfcomponent>