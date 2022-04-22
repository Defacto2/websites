<cfcomponent output="false">
	<!--- site settings --->
	<cfset this.name="Defacto2">
	<cfset this.clientManagement=true>
	<cfset this.clientStorage="registry">
	<cfset this.loginStorage="session">
	<cfset this.sessionManagement=true>
	<cfset this.setClientCookies=true>
	<cfset this.setDomainCookies=false>
	<cfset this.scriptProtect=false>
	<cfset this.siteOffline=false>
	<cfset this.siteCFerrors=true>
	<cfset this.siteTimeOutsNull=false>
	<cfset this.siteDBType="mysql5">
	<cfset this.siteDebug=false>
	<!--- site timeouts --->
	<cfset this.applicationTimeout=createTimeSpan(14,0,0,0)>
	<cfset this.sessionTimeout=createTimeSpan(1,0,0,0)>
	<!--- site error templates --->
	<cfif this.siteCFerrors IS FALSE>
		<cferror type="validation" template="site-errorvalidation.cfm">
		<cferror type="exception" template="site-errorexception.cfm">
		<cferror type="request" template="site-errorrequest.cfm">
	</cfif>
	
	<cffunction name="onApplicationStart" returnType="boolean" output="false">
		<cfif this.siteOffline IS TRUE AND LEFT(CGI.REMOTE_HOST,7) NEQ "192.168">
			<div style="text-align:center; padding:50px; color:#FF0000; font-family:Arial, Helvetica, sans-serif; font-size:16px;">
			Sorry the site is currently down for upgrades, please come back in a few hours
			</div>
			<cfabort>
		</cfif>
		<!--- database name sources --->
		<cfset application.siteDBType=this.siteDBType>
		<cfif this.siteDBType eq "mysql5">
			<cfset application.dataSource="defacto2net">
			<cfset application.portalSource="defacto2net">
			<cfset application.docSource="defacto2net">
			<cfset application.crackSource="defacto2net">
			<cfset application.magSource="defacto2net">
			<cfset application.groupSource="defacto2net">
			<cfset application.newsSource="defacto2net">
			<cfset application.newsComments="defacto2net">
			<cfset application.poll="defacto2net">
		</cfif>

		<!--- cache timeouts --->
		<cfif this.siteTimeOutsNull IS TRUE>
			<cfset application.cracktroTimeOut=createTimeSpan(0,0,0,0)>
			<cfset application.docTimeOut=createTimeSpan(0,0,0,0)>
			<cfset application.groupsTimeOut=createTimeSpan(0,0,0,0)>
			<cfset application.magazinesTimeOut=createTimeSpan(0,0,0,0)>
			<cfset application.newsTimeOut=createTimeSpan(0,0,0,0)>
			<cfset application.pollsTimeOut=createTimeSpan(0,0,0,0)>
			<cfset application.portalTimeOut=createTimeSpan(0,0,0,0)>
			<cfset application.standardTimeOut=createTimeSpan(0,0,0,0)>
			<cfset application.dailyTimeOut=createTimeSpan(0,0,0,0)>
		<cfelse>
			<cfset application.cracktroTimeOut=createTimeSpan(0,0,30,0)>
			<cfset application.docTimeOut=createTimeSpan(0,0,30,0)>
			<cfset application.groupsTimeOut=createTimeSpan(0,0,30,0)>
			<cfset application.magazinesTimeOut=createTimeSpan(0,0,30,0)>
			<cfset application.newsTimeOut=createTimeSpan(0,0,0,0)>
			<cfset application.pollsTimeOut=createTimeSpan(0,0,0,0)>
			<cfset application.portalTimeOut=createTimeSpan(0,0,0,0)>
			<cfset application.standardTimeOut=createTimeSpan(0,0,30,0)>
			<cfset application.dailyTimeOut=createTimeSpan(0,0,30,0)>
		</cfif>
		<!--- days for a file to be considered new --->
		<cfset application.daysNew=31>
		<!--- encryption keys --->
		<cfset application.urlEncryptionKey="REMOVED">
		<!--- download paths and mirros --->
		<cfset application.SceneORG="http://www.scene.org/file.php?file=/demos/groups/defacto2/artpacks/">
		<cfset application.SceneORGRoot="http://www.scene.org/dir.php?dir=/demos/groups/defacto2/">
		<cfset application.SceneORGEndVar="#urlEncodedFormat('&amp;fileinfo')#">
		<cfset application.MagazinesPNG="includes/magazines/png.versions/">
		<cfset application.nfoRootDir="c:\websites\urk7tb\NFOOriginals">
		<cfset application.nfoRootWebPath="/NFOOriginals/">
		<!--- daily user count --->
<!--- 		<cfif not IsDefined("application.usersonline") or IsArray(application.usersonline) is false>
			<cflock scope="application" type="exclusive" timeout="5">
				<cfset application.usersonline=ArrayNew(1)>
				<cfset application.usersonline[1]=StructNew()>
				<cfset application.usersonline[1].date=DateFormat(Now(),'ddmmmyyyy')>
				<cfset application.usersonline[1].people=0>
				<cfset application.usersonline[1].robots=0>
			</cflock>
		</cfif> --->
		<cfreturn true>
	</cffunction>
	
	<cffunction name="onApplicationEnd" returnType="void" output="false">
		<cfargument name="applicationScope" required="true">
	</cffunction>
	
	<cffunction name="onRequestStart" returnType="boolean" output="false">
		<cfargument name="thePage" type="string" required="true">
		<cfreturn true>
	</cffunction>

	<cffunction name="onRequestEnd" returnType="void" output="false">
		<cfargument name="thePage" type="string" required="true">
	</cffunction>
		
	<cffunction name="onSessionStart" returnType="void" output="false">
<!--- 		<cfset var tmp="application.Date#DateFormat(Now(),'ddmmmyyyy')#">
		<cfset var cal="">
		<cfset var arrlen=ArrayLen(application.usersonline)> --->
		<!--- create unique user id and time on --->
		<cfset Session.started=now()>
		<cfset Session.id=CreateUUID()>
		<!--- add user's visit to daily total --->
<!--- 		<cfloop from="1" to="#arrlen#" index="i">
			<cfif application.usersonline[i].date eq DateFormat(Now(),'ddmmmyyyy')>
				<cfset tmp = i><cfbreak>
			</cfif>
		</cfloop>
		<cfif tmp neq "">
			<cfif ReFindNoCase('(robot|crawl|bot)', CGI.HTTP_USER_AGENT) gt 0>
				<cfset application.usersonline[tmp].robots=IncrementValue(application.usersonline[tmp].robots)>
			<cfelse>
				<cfset application.usersonline[tmp].people=IncrementValue(application.usersonline[tmp].people)>
			</cfif>
		<cfelse>
				<cfset arrlen=arrlen+1>
				<cfset application.usersonline[arrlen].date=DateFormat(Now(),'ddmmmyyyy')>
				<cfif ReFindNoCase('(robot|crawl|bot)', CGI.HTTP_USER_AGENT) gt 0>
					<cfset application.usersonline[arrlen].people=0>
					<cfset application.usersonline[arrlen].robots=1>
				<cfelse>
					<cfset application.usersonline[arrlen].people=1>
					<cfset application.usersonline[arrlen].robots=0>
				</cfif>
		</cfif> --->	
	</cffunction>
	
	<cffunction name="onSessionEnd" returnType="void" output="false">
		<cfargument name="sessionScope" type="struct" required="true">
		<cfargument name="appScope" type="struct" required="false">	
	</cffunction>
</cfcomponent>