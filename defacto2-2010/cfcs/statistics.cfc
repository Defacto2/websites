<cfcomponent output="false" displayname="Statistics" hint="Contains all the methods related to calculating statistics for the site">

	<cffunction name="newestFiles" access="public" output="true" returntype="string" hint="Displays a list of the most recent file additions">
		<cfargument name="outputmode" default="display" hint="either DISPLAY, FEED, TABLE">
		<cfargument name="limit" default="10" type="numeric" hint="number of records to return">
		<cfset var temp="">
		<cfset var newRow="">
		<cfset var newRowCount=""><cfsilent>
		<!--- obtain the more recent file additions from all the site wide databases --->
		<cflock name="newestFiles1" timeout="10" type="readonly">
		<cfquery name="RS1" datasource="#application.docSource#" maxrows="#limit#" cachedwithin="#application.standardTimeOut#">
			SELECT * FROM documents WHERE DateAdded IS NOT NULL ORDER BY DateAdded DESC
		</cfquery>
		</cflock>
		<cflock name="newestFiles2" timeout="10" type="readonly">
		<cfquery name="RS2" datasource="#application.crackSource#" maxrows="#limit#" cachedwithin="#application.standardTimeOut#">
			SELECT * FROM cracktros WHERE DateAdded IS NOT NULL ORDER BY DateAdded DESC
		</cfquery>
		</cflock>
		<cflock name="newestFiles3" timeout="10" type="readonly">
		<cfquery name="RS3" datasource="#application.magSource#" maxrows="#limit#" cachedwithin="#application.standardTimeOut#">
			SELECT * FROM magazineissues WHERE DateAdded IS NOT NULL ORDER BY DateAdded DESC
		</cfquery>
		</cflock>
		<cflock name="newestFiles4" timeout="10" type="readonly">
		<cfquery name="RS4" datasource="#application.groupSource#" maxrows="#limit#" cachedwithin="#application.standardTimeOut#">
			SELECT * FROM repositoryfiles WHERE DateAdded IS NOT NULL ORDER BY DateAdded DESC
		</cfquery>
		</cflock>
		<!--- create a new local database --->
		<cfif outputmode EQ 'display' or outputmode eq 'table'>
			<cfset application.RSCombined=QueryNew("fileType, dateAdded, id, linkText, bracketText, Clicks","VarChar, Date, VarChar, VarChar, VarChar, Integer")>
		<cfelseif outputmode EQ 'feed'>
			<cfset application.RSCombined=QueryNew("fileType, dateAdded, id, linkText, bracketText, Clicks, feedText, feedLink","VarChar, Date, VarChar, VarChar, VarChar, Integer, VarChar, VarChar")>
		</cfif>
		<cfset newRowCount=0>
		<!--- add information from all the site's databases into the local database --->
		<cfloop query="RS1">
			<cfset newRow = QueryAddRow(application.RSCombined, 1)>
			<cfset newRowCount=IncrementValue(newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "fileType", "doc", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "dateAdded", "#dateAdded#", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "id", "#uniqueID#", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "linkText", "#description#", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "bracketText", "", newRowCount)>
      <cftry>
				<cfset temp = QuerySetCell(application.RSCombined, "Clicks", "#Clicks#", newRowCount)>
      <cfcatch>
      	<cfset temp = QuerySetCell(application.RSCombined, "Clicks", "", newRowCount)>
      </cfcatch>
      </cftry>
			<cfif outputmode EQ 'feed'>
				<cfset temp = QuerySetCell(application.RSCombined, "feedText", "New document:<br />#category#<br />#author#<br />#date#/#month#/#year#<br />#description#<br />#indetail#", newRowCount)>
				<cfset temp = QuerySetCell(application.RSCombined, "feedLink", "http://www.defacto2.net/documents.cfm?id=#uniqueID#", newRowCount)>
			</cfif>
		</cfloop>
		<cfloop query="RS2">
			<cfset newRow = QueryAddRow(application.RSCombined, 1)>
			<cfset newRowCount=IncrementValue(newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "fileType", "crk", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "dateAdded", "#dateAdded#", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "id", "#filename#", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "bracketText", "#filename#", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "Clicks", "#Clicks#", newRowCount)>
			<cfif outputmode EQ 'feed'>
				<cfset temp = QuerySetCell(application.RSCombined, "linkText", "#CreatedFor# Cracktro", newRowCount)>
				<cfset temp = QuerySetCell(application.RSCombined, "feedText", "New #CreatedFor# cracktro:<br />#filename#<br />From #year#<br /><img src='http://www.defacto2.net/images/cracktro-scenes/#filename#.png' alt='#filename# Screenshot' title='#filename# Screenshot' />", newRowCount)>
				<cfset temp = QuerySetCell(application.RSCombined, "feedLink", "http://www.defacto2.net/cracktros.cfm?mode=file&amp;value=#id#", newRowCount)>
			<cfelse>
				<cfset temp = QuerySetCell(application.RSCombined, "linkText", "#CreatedFor#", newRowCount)>
			</cfif>
		</cfloop>
		<cfloop query="RS3">
			<cfset newRow = QueryAddRow(application.RSCombined, 1)>
			<cfset newRowCount=IncrementValue(newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "fileType", "mag", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "dateAdded", "#dateAdded#", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "id", "#magID#", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "linkText", "#magTitle# #magIssue#", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "bracketText", "", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "Clicks", "#Clicks#", newRowCount)>
			<cfif outputmode EQ 'feed'>
				<cfset temp = QuerySetCell(application.RSCombined, "feedText", "New magazine issue:<br />#magTitle# #magIssue#<br />#magheadline#", newRowCount)>
				<cfset temp = QuerySetCell(application.RSCombined, "feedLink", "http://www.defacto2.net/magazines.cfm?id=#magID#&amp;reader=raw", newRowCount)>
			</cfif>
		</cfloop>
		<cfloop query="RS4">
			<cfquery name="RS4A" datasource="#application.groupSource#" cachedwithin="#application.standardTimeOut#">
				SELECT idName,completeName FROM repositorygroupdetail WHERE idName = '#org#'
			</cfquery>
			<cfset newRow = QueryAddRow(application.RSCombined, 1)>
			<cfset newRowCount=IncrementValue(newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "fileType", "grp", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "dateAdded", "#dateAdded#", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "id", "#ID#", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "linkText", "#RS4A.completeName# #type#", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "bracketText", "#fileName#", newRowCount)>
			<cfset temp = QuerySetCell(application.RSCombined, "Clicks", "#Clicks#", newRowCount)>
			<cfif outputmode EQ 'feed'>
				<cfset temp = QuerySetCell(application.RSCombined, "feedText", "New group file:<br />#RS4A.completeName# #type#<br />(#fileName#)<br />#dateday#/#datemonth#/#dateyear#<br />#description#", newRowCount)>
				<cfset temp = QuerySetCell(application.RSCombined, "feedLink", "http://www.defacto2.net/groups.cfm?mode=#id#", newRowCount)>
			</cfif>
		</cfloop>
		<!--- display the most recent additions from the local database --->
		<cfquery dbtype="query" name="RSZ" maxrows="#limit#">
			SELECT * FROM application.RSCombined ORDER BY dateAdded DESC
		</cfquery></cfsilent>
		<cfif outputmode EQ 'display'>
			<cfloop query="RSZ">
				#fileType#) 
				<cfif fileType EQ "doc">
				<a href="documents.cfm?id=#id#">#dateFormat(dateAdded,'dd-mmm')#  #linkText#</a>
				<cfelseif fileType EQ "crk">
				<a href="cracktros.cfm?mode=file&amp;value=#id#">#dateFormat(dateAdded,'dd-mmm')#  #linkText#</a>
				<cfelseif fileType EQ "mag">
				<a href="magazines.cfm?id=#id#&amp;reader=raw">#dateFormat(dateAdded,'dd-mmm')#  #linkText#</a>
				<cfelseif fileType EQ "grp">
				<a href="groups.cfm?mode=#id#">#dateFormat(dateAdded,'dd-mmm')# #linkText#</a>
				</cfif>
				<cfif bracketText NEQ ""> (#bracketText#)</cfif><br />
			</cfloop>
		<cfelseif outputmode EQ 'table'>
			<cfloop query="RSZ">
			<div class="boxIndex13 indexStats" style="letter-spacing: -1px;">
			<span style="font-size:smaller; float:right;"> (#Clicks# dls)</span>
			<span style="font-size:smaller;">#dateFormat(dateAdded,'dd-mmm')#. </span>
				<cfif fileType EQ "doc">
				<a href="documents.cfm?id=#id#">#linkText#</a>
				<cfelseif fileType EQ "crk">
				<a href="cracktros.cfm?mode=file&amp;value=#id#">#linkText# cracktro</a>
				<cfelseif fileType EQ "mag">
				<a href="magazines.cfm?id=#id#&amp;reader=raw">#linkText#</a>
				<cfelseif fileType EQ "grp">
				<a href="groups.cfm?mode=#id#">#linkText# file</a>
				</cfif>
			</div>
			</cfloop>
		</cfif>
	</cffunction>
	
	<cffunction name="newestUpdates" access="public" output="true" returntype="string" hint="Displays a list of the most recent site wide changes">
		<cfargument name="limit" default="500" type="numeric">
		<cfset var marginTop=2>
		<cfset var marginBottom=0>
		<cfset var dateComp=""><cfsilent>
		<cfparam name="url.type" default="typeboth">
		<cfparam name="url.display" default="displayboth">
		<!--- create local database --->
		<cfset RSCombined = QueryNew("fileType, rscDate, mode, id, linkText, bracketText","VarChar, Date, VarChar, VarChar, VarChar, VarChar")>
		<cfset newRowCount=0>
		<!--- site specific --->
		<cfif url.display EQ "site" OR url.display EQ "displayboth">
			<!--- new site specific additions --->
			<cfif url.type EQ "new" OR url.type EQ "typeboth">
				<cfquery name="RSX1" datasource="#application.groupSource#">
					SELECT * FROM repositorygroupdetail WHERE DateAdded IS NOT NULL ORDER BY DateAdded DESC
				</cfquery>
				<cfquery name="RSX2" datasource="#application.magSource#">
					SELECT * FROM magazinedetail WHERE DateAdded IS NOT NULL ORDER BY DateAdded DESC
				</cfquery>
				<cfloop query="RSX1">
					<cfset newRow = QueryAddRow(RSCombined, 1)>
					<cfset newRowCount=IncrementValue(newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "fileType", "group", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "rscDate", "#dateAdded#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "mode", "add", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "id", "#idname#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "linkText", "#completeName#", newRowCount)>
					<cfif yearDisbanded GT yearFounded>
						<cfset temp = QuerySetCell(RSCombined, "bracketText", "#yearFounded#-#yearDisbanded#", newRowCount)>
					<cfelse>
						<cfset temp = QuerySetCell(RSCombined, "bracketText", "#yearFounded#", newRowCount)>
					</cfif>
				</cfloop>
				<cfloop query="RSX2">
					<cfset newRow = QueryAddRow(RSCombined, 1)>
					<cfset newRowCount=IncrementValue(newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "fileType", "information", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "rscDate", "#dateAdded#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "mode", "add", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "id", "#magPrimName#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "linkText", "#magPrimName#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "bracketText", "", newRowCount)>
				</cfloop>
			</cfif>
			<!--- update to specific site specifics --->
			<cfif url.type EQ "updates" OR url.type EQ "typeboth">
				<cfquery name="RSX51" datasource="#application.groupSource#">
					SELECT * FROM repositorygroupdetail WHERE dateRevised IS NOT NULL ORDER BY dateRevised DESC
				</cfquery>
				<cfquery name="RSX52" datasource="#application.magSource#">
					SELECT * FROM magazinedetail WHERE dateRevised IS NOT NULL ORDER BY dateRevised DESC
				</cfquery>
				<cfloop query="RSX51">
					<cfset newRow = QueryAddRow(RSCombined, 1)>
					<cfset newRowCount=IncrementValue(newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "fileType", "group", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "rscDate", "#dateRevised#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "mode", "update", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "id", "#idname#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "linkText", "#completeName#", newRowCount)>
					<cfif yearDisbanded GT yearFounded>
						<cfset temp = QuerySetCell(RSCombined, "bracketText", "#yearFounded#-#yearDisbanded#", newRowCount)>
					<cfelse>
						<cfset temp = QuerySetCell(RSCombined, "bracketText", "#yearFounded#", newRowCount)>
					</cfif>
				</cfloop>
				<cfloop query="RSX52">
					<cfset newRow = QueryAddRow(RSCombined, 1)>
					<cfset newRowCount=IncrementValue(newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "fileType", "information", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "rscDate", "#dateRevised#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "mode", "update", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "id", "#magPrimName#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "linkText", "#magPrimName#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "bracketText", "", newRowCount)>
				</cfloop>
			</cfif>
		</cfif>
		<!--- file specifics --->
		<cfif url.display EQ "files" OR url.display EQ "displayboth">
			<!--- new files --->
			<cfif url.type EQ "new" OR url.type EQ "typeboth">
				<cfquery name="RS1" datasource="#application.docSource#">
					SELECT * FROM documents WHERE DateAdded IS NOT NULL ORDER BY DateAdded DESC
				</cfquery>
				<cfquery name="RS2" datasource="#application.crackSource#">
					SELECT * FROM cracktros WHERE DateAdded IS NOT NULL ORDER BY DateAdded DESC
				</cfquery>
				<cfquery name="RS3" datasource="#application.magSource#">
					SELECT * FROM magazineissues WHERE DateAdded IS NOT NULL ORDER BY DateAdded DESC
				</cfquery>
				<cfquery name="RS4" datasource="#application.groupSource#">
					SELECT * FROM repositoryfiles WHERE DateAdded IS NOT NULL ORDER BY DateAdded DESC
				</cfquery>
				<cfquery name="RS6" datasource="#application.groupSource#">
					SELECT * FROM scenewebsites WHERE DateAdded IS NOT NULL ORDER BY DateAdded DESC
				</cfquery>
				<cfloop query="RS1">
					<cfset newRow = QueryAddRow(RSCombined, 1)>
					<cfset newRowCount=IncrementValue(newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "fileType", "document", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "rscDate", "#dateAdded#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "mode", "add", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "id", "#uniqueID#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "linkText", "#description#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "bracketText", "", newRowCount)>
				</cfloop>
				<cfloop query="RS2">
					<cfset newRow = QueryAddRow(RSCombined, 1)>
					<cfset newRowCount=IncrementValue(newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "fileType", "cracktro", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "rscDate", "#dateAdded#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "mode", "add", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "id", "#filename#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "linkText", "#CreatedFor#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "bracketText", "#filename#", newRowCount)>
				</cfloop>
				<cfloop query="RS3">
					<cfset newRow = QueryAddRow(RSCombined, 1)>
					<cfset newRowCount=IncrementValue(newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "fileType", "magazine", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "rscDate", "#dateAdded#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "mode", "add", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "id", "#magID#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "linkText", "#magTitle# #magIssue#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "bracketText", "", newRowCount)>
				</cfloop>
				<cfloop query="RS4">
					<cfquery name="RS4A" datasource="#application.groupSource#">
						SELECT idName,completeName FROM repositorygroupdetail WHERE idName = '#org#'
					</cfquery>
					<cfset newRow = QueryAddRow(RSCombined, 1)>
					<cfset newRowCount=IncrementValue(newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "fileType", "group file", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "rscDate", "#dateAdded#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "mode", "add", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "id", "#ID#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "linkText", "#RS4A.completeName# #type#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "bracketText", "#fileName#", newRowCount)>
				</cfloop>
				<cfloop query="RS6">
					<cfset newRow = QueryAddRow(RSCombined, 1)>
					<cfset newRowCount=IncrementValue(newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "fileType", "web site", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "rscDate", "#dateAdded#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "mode", "add", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "id", "#UniqueID#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "linkText", "#description#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "bracketText", "#year#", newRowCount)>
				</cfloop>
			</cfif>
			<!--- updated files --->
			<cfif url.type EQ "updates" OR url.type EQ "typeboth">
				<cfquery name="RS51" datasource="#application.docSource#">
					SELECT * FROM documents WHERE DateRevised IS NOT NULL ORDER BY DateRevised DESC
				</cfquery>
				<cfquery name="RS52" datasource="#application.crackSource#">
					SELECT * FROM cracktros WHERE DateRevised IS NOT NULL ORDER BY DateRevised DESC
				</cfquery>
				<cfquery name="RS53" datasource="#application.magSource#">
					SELECT * FROM magazineissues WHERE DateRevised IS NOT NULL ORDER BY DateRevised DESC
				</cfquery>
				<cfquery name="RS54" datasource="#application.groupSource#">
					SELECT * FROM repositoryfiles WHERE DateRevised IS NOT NULL ORDER BY DateRevised DESC
				</cfquery>
				<cfquery name="RS55" datasource="#application.dataSource#">
					SELECT * FROM filepacks ORDER BY LastRevised DESC
				</cfquery>
				<cfquery name="RS56" datasource="#application.groupSource#">
					SELECT * FROM scenewebsites WHERE DateRevised IS NOT NULL ORDER BY DateRevised DESC
				</cfquery>
				<cfloop query="RS51">
					<cfset newRow = QueryAddRow(RSCombined, 1)>
					<cfset newRowCount=IncrementValue(newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "fileType", "document", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "rscDate", "#dateRevised#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "mode", "update", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "id", "#uniqueID#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "linkText", "#description#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "bracketText", "", newRowCount)>
				</cfloop>
				<cfloop query="RS52">
					<cfset newRow = QueryAddRow(RSCombined, 1)>
					<cfset newRowCount=IncrementValue(newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "fileType", "cracktro", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "rscDate", "#dateRevised#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "mode", "update", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "id", "#filename#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "linkText", "#CreatedFor#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "bracketText", "#filename#", newRowCount)>
				</cfloop>
				<cfloop query="RS53">
					<cfset newRow = QueryAddRow(RSCombined, 1)>
					<cfset newRowCount=IncrementValue(newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "fileType", "magazine", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "rscDate", "#dateRevised#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "mode", "update", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "id", "#magID#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "linkText", "#magTitle# #magIssue#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "bracketText", "", newRowCount)>
				</cfloop>
				<cfloop query="RS54">
					<cfquery name="RS54A" datasource="#application.groupSource#">
						SELECT idName,completeName FROM repositorygroupdetail WHERE idName = '#org#'
					</cfquery>
					<cfset newRow = QueryAddRow(RSCombined, 1)>
					<cfset newRowCount=IncrementValue(newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "fileType", "group file", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "rscDate", "#dateRevised#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "mode", "update", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "id", "#ID#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "linkText", "#RS54A.completeName# #type#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "bracketText", "#fileName#", newRowCount)>
				</cfloop>
				<cfloop query="RS55">
					<cfset newRow = QueryAddRow(RSCombined, 1)>
					<cfset newRowCount=IncrementValue(newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "fileType", "file pack", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "rscDate", "#lastRevised#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "mode", "update", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "id", "#id#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "linkText", "#fulltitle#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "bracketText", "", newRowCount)>
				</cfloop>
				<cfloop query="RS56">
					<cfset newRow = QueryAddRow(RSCombined, 1)>
					<cfset newRowCount=IncrementValue(newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "fileType", "web site", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "rscDate", "#dateRevised#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "mode", "update", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "id", "#UniqueID#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "linkText", "#description#", newRowCount)>
					<cfset temp = QuerySetCell(RSCombined, "bracketText", "#year#", newRowCount)>
				</cfloop>
			</cfif>
		</cfif>
		<!--- query the local database --->
		<cfquery dbtype="query" name="RSZ" maxrows="#limit#">
			SELECT * FROM RSCombined ORDER BY rscDate DESC
		</cfquery>	
		<!--- form table that displays local time and filter options --->
		</cfsilent><table cellpadding="0" cellspacing="0" class="boxDoc03"><tr>
			<td style="width:50%;"><div class="boxDoc04">Current Server Time: #DateFormat(now(),'d-mmm')# #TimeFormat(now(),'HH:MM')#</div></td>
			<td style="background-color:##C7C8FC">
				<div class="boxDoc04 boxDoc05">
					<form action="site-info.cfm" method="get" id="sort" style="margin:0px;">
					<fieldset style="border:0px; margin:0px; padding:0px;">
					Display 
					<select name="type" size="1">
						<option value="new" <cfif url.type eq "new"> selected="selected"</cfif>>new</option>
						<option value="updates" <cfif url.type eq "updates"> selected="selected"</cfif>>updates</option>
						<option value="typeboth" <cfif url.type eq "typeboth"> selected="selected"</cfif>>both</option>
					</select>
					<select name="display" size="1">
						<option value="files" <cfif url.display eq "files"> selected="selected"</cfif>>files</option>
						<option value="site" <cfif url.display eq "site"> selected="selected"</cfif>>site</option>
						<option value="displayboth" <cfif url.display eq "displayboth"> selected="selected"</cfif>>both</option>
					</select>
					<input type="submit" name="List" value="submit" />
					<input name="mode" value="updates" type="hidden" />
					</fieldset>
					</form>
				</div>
			</td></tr>
		</table>
		<!--- local database display output --->
		<table cellpadding="0" cellspacing="0" class="boxMag06">
			<cfset lastDate="">
			<cfloop query="RSZ">
				<!--- cell spacing --->
				<cfif RSZ.currentrow EQ 1><cfset marginTop=16><cfelseif DateFormat(rscDate,'dd-mmm') NEQ lastDate><cfset marginTop=12><cfelse><cfset marginTop=1></cfif>
				<cfif RSZ.currentrow EQ RSZ.recordcount><cfset marginBottom=16><cfelse><cfset marginBottom=1></cfif>
				<!--- output --->
				<tr><td class="magTimeLineDate" style="width:160px; padding:0px; padding-top:#marginTop#px; padding-bottom:#marginBottom#px; padding-right:10px;">
				#NumberFormat((RSZ.recordcount-RSZ.currentrow)+1,'000000')# 
				<cfif DateDiff('ww', rscDate, now()) GTE 26>
				#DateFormat(rscDate,'dd-mmm yyyy')#
				<cfelse>
				#DateFormat(rscDate,'dd-mmm')# #TimeFormat(rscDate,'HH:mm')#
				</cfif>
				</td><td style="width:120px; text-align:center; font-size:12px; padding-top:#marginTop#px; padding-bottom:#marginBottom#px;">
				<cfif mode eq "update"><span style="color:##005100;">updated #fileType#</span><cfelseif mode eq "add"><span style="color:##753A00;">added #fileType#</span><cfelse>error</cfif>
				</td>
				<td style="padding:0px; padding-top:#marginTop#px; padding-bottom:#marginBottom#px; font-size:13px;">
				<!--- generate link to file/item --->
				<cfif fileType EQ "document">
				<a href="documents.cfm?id=#id#">#linkText#</a>
				<cfelseif fileType EQ "cracktro">
				<a href="cracktros.cfm?mode=file&amp;value=#id#">#linkText#</a>
				<cfelseif fileType EQ "magazine">
				<a href="magazines.cfm?id=#id#&amp;reader=raw">#linkText#</a>
				<cfelseif fileType EQ "information">
				<a href="magazines.cfm?mode=detail&amp;title=#id#">#linkText#</a>
				<cfelseif fileType EQ "group file">
				<a href="groups.cfm?mode=#id#">#linkText#</a>
				<cfelseif fileType EQ "group">
				<a href="groups.cfm?mode=detail&org=#id#" class="bold">#linkText#</a>
				<cfelseif fileType EQ "file pack">
				<cfinvoke component="filepacks" method="link" id="#id#" returnvariable="filepackURL">
				<a href="download.cfm?#filepackURL#">#linkText#</a>
				<cfelseif fileType EQ "web site">
				#linkText#
				</cfif>
				<cfif bracketText NEQ ""> (#bracketText#)</cfif>
				</td></tr>
				<cfset lastDate=DateFormat(rscDate,'dd-mmm')>
			</cfloop>
		</table>
	</cffunction>
	<cffunction name="display" access="public" output="true" returntype="string" hint="Displays all the statistics">
		<cfsilent>
		<cfinvoke component="statistics" method="newsPosts" returnvariable="RCnewsPosts">
		<cfinvoke component="statistics" method="newsPosts" mode="date" returnvariable="DATEnewsPosts">
		<cfinvoke component="statistics" method="portalLinks" returnvariable="RCportalLinks">
		<cfinvoke component="statistics" method="documents" returnvariable="STATdocuments">
		<cfinvoke component="statistics" method="repositoryGroups" returnvariable="STATrepositoryGroups">
		<cfinvoke component="statistics" method="repositoryDocs" returnvariable="RCrepositoryDocs">
		<cfinvoke component="statistics" method="repositoryFiles" returnvariable="RCrepositoryFiles">
		<cfinvoke component="statistics" method="magazineIssuesCode" returnvariable="RCmagazineIssuesCode">
		<cfinvoke component="statistics" method="magazinesCode" returnvariable="RCmagazinesCode">
		<cfinvoke component="statistics" method="magazineIssuesText" returnvariable="RCmagazineIssuesText">
		<cfinvoke component="statistics" method="magazinesText" returnvariable="RCmagazinesText">
		<cfinvoke component="statistics" method="cracktros" returnvariable="RCcracktros">
		<cfinvoke component="statistics" method="installers" returnvariable="RCinstallers">
		<cfinvoke component="statistics" method="cracktroGroups" returnvariable="RCcracktroGroups">
		<cfinvoke component="statistics" method="cracktroAuthors" returnvariable="RCcracktroAuthors">
		<cfinvoke component="statistics" method="filesServed" returnvariable="filesServed">
		<cfinvoke component="statistics" method="filesTotal" returnvariable="filesTotal">
		<cfinvoke component="utilities" method="numberConvert" number="#filesTotal#" format="comma" returnvariable="filesTotal">
		<cfinvoke component="utilities" method="numberConvert" number="#filesServed#" format="comma" returnvariable="filesServed">
		</cfsilent><p class="miniStats"></p>
			#RCnewsPosts# news posts since #dateFormat(DATEnewsPosts,"dd mmmm yyyy")#<br />
			#RCportalLinks# portal links covering 5 scene topics
		<p class="miniStats"></p>
			#STATrepositoryGroups# different groups in the Scene Repository<br />
			#(STATdocuments+RCrepositoryDocs)# repository documents<br />
			#RCmagazineIssuesCode# magazines with #RCmagazinesCode# issues<br />
			#RCmagazineIssuesText# reports with #RCmagazinesText# issues<br />
			6,200 release information files viewable
		<p class="miniStats"></p>
			#RCcracktros# cracktros plus #RCinstallers# installers<br />
			#RCcracktroGroups# groups have a cracktro or installer<br />
			Created by #RCcracktroAuthors# listed authors
		<p class="miniStats"></p>
			Over <span class="bold">#filesTotal#</span> files on offer<br />
			Serving #filesServed# downloads since April 2006<span class="blink bold">|</span>
		<p class="miniStats"></p>
	</cffunction>
	
	<cffunction name="popularDownloads" access="public" output="true" returntype="string" hint="Displays a list of the top downloads">
		<cfargument name="limit" default="10" type="numeric">
		<cfset var j="">
		<cfset var i="">
		<cfset var popDL=""><cfsilent>
		<cflock name="popDL1" timeout="5" type="readonly">
		<cfquery name="RS1" datasource="#application.dataSource#" cachedwithin="#application.standardTimeOut#">
			SELECT downloads,filesize,fulltitle,nolocal,filename FROM filepacks ORDER BY Downloads DESC
		</cfquery>
		</cflock>
		<cflock name="popDL2" timeout="5" type="readonly">
		<cfquery name="RS2" datasource="#application.magSource#" cachedwithin="#application.standardTimeOut#">
			SELECT clicks,magTitle,magIssue FROM magazineissues ORDER BY Clicks DESC
		</cfquery>
		</cflock>
		<cflock name="popDL3" timeout="5" type="readonly">
		<cfquery name="RS3" datasource="#application.docSource#" cachedwithin="#application.standardTimeOut#">
			SELECT clicks,description,uniqueID FROM documents ORDER BY Clicks DESC
		</cfquery>
		</cflock>
		<cflock name="popDL4" timeout="5" type="readonly">
		<cfquery name="RS4" datasource="#application.crackSource#" cachedwithin="#application.standardTimeOut#">
			SELECT clicks,CreatedFor,filename FROM cracktros ORDER BY Clicks DESC
		</cfquery>
		</cflock></cfsilent>
		<span class="bold">Top #limit# Files</span> <span class="fs8">(since April 2006)</span>
		<cfsilent>
		<cfset popDL=ArrayNew(2)>
		<cfloop query="RS1" endrow="#limit#">
			<cfset CurArray=ArrayLen(popDL)+1>
			<cfif IsDefined("RS1.downloads") AND RS1.downloads EQ ""><cfset RS1.Downloads=0></cfif>
			<cfif nolocal eq true>
				<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="downloads;#RS1.filename#;#RS1.filesize#;nolocal;#RS1.fulltitle#" returnvariable="downloadAttr">
			<cfelse>
				<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="downloads;#RS1.filename#;#RS1.filesize#;#RS1.fulltitle#" returnvariable="downloadAttr">
			</cfif>
			<cfset popDL[CurArray][1]="#Downloads#">
			<cfset popDL[CurArray][2]="#fulltitle#">
			<cfset popDL[CurArray][3]="download.cfm?#downloadAttr#">
		</cfloop>
		<cfloop query="RS2" endrow="#limit#">
			<cfset CurArray=ArrayLen(popDL)+1>
			<cfif IsDefined("RS2.Clicks") AND RS2.Clicks EQ ""><cfset RS2.Clicks=0></cfif>
			<cfset popDL[CurArray][1]="#Clicks#">
			<cfset popDL[CurArray][2]="#magTitle# #magIssue#">
			<cfset popDL[CurArray][3]="magazines.cfm?title=#RS2.magTitle#">											
		</cfloop>
		<cfloop query="RS3" endrow="#limit#">
			<cfset CurArray=ArrayLen(popDL)+1>
			<cfif IsDefined("RS3.Clicks") AND RS3.Clicks EQ ""><cfset RS3.Clicks=0></cfif>
			<cfset popDL[CurArray][1]="#Clicks#">
			<cfset popDL[CurArray][2]="#Description#">
			<cfset popDL[CurArray][3]="documents.cfm?id=#RS3.UniqueID#">																
		</cfloop>
		<cfloop query="RS4" endrow="#limit#">
			<cfset CurArray=ArrayLen(popDL)+1>
			<cfif IsDefined("RS4.Clicks") AND RS4.Clicks EQ ""><cfset RS4.Clicks=0></cfif>
			<cfset popDL[CurArray][1]="#Clicks#">
			<cfset popDL[CurArray][2]="#CreatedFor# #Filename#.zip">
			<cfset popDL[CurArray][3]="cracktros.cfm?mode=file&value=#filename#">							
		</cfloop>
		<cfset j=0>
		<cfloop condition="j LESS THAN OR EQUAL TO 1">
			<cfset j=2>
			<cfset i=1>
			<cfloop condition="i LESS THAN OR EQUAL TO #ArrayLen(popDL)#">
				<cfif NOT i EQ #ArrayLen(popDL)#>
					<cfif popDL[i+1][1] EQ popDL[i][1]>
						<cfset temp1=ArrayDeleteAt(popDL,i+1)>
						<cfset i=i-1>
						<cfset j=0>
					<!--- GT = desc : LT = asc --->
					<cfelseif popDL[i+1][1] GT popDL[i][1]>
						<cfset temp2=ArraySwap(popDL, i, i+1)>
						<cfset i=i-1>
						<cfset j=0>
					</cfif>
				</cfif>
				<cfset i=i+1>
			</cfloop>
		</cfloop></cfsilent>
		<cfloop from="1" to="#limit#" index="i">
			<br /><div class="boxPortal08">#popDL["#i#"][1]#</div>#i#. <a href="#popDL["#i#"][3]#" title="Download or view #popDL["#i#"][2]#">#left(popDL["#i#"][2],34)#<cfif len(popDL["#i#"][2]) GTE 35>..</cfif></a>
		</cfloop>
	</cffunction>

	<cffunction name="popularLinks" access="public" output="true" returntype="string" hint="Displays a list of the top portal links">
		<cfargument name="limit" default="10" type="numeric"><cfsilent>
		<cflock name="pLinks" timeout="5" type="readonly">
		<cfquery name="RS1" datasource="#application.portalSource#" cachedwithin="#application.dailyTimeOut#">
			SELECT id,name,url,clicks FROM thesceneportal ORDER BY clicks desc
		</cfquery></cflock></cfsilent>
		<span class="bold">Top #limit# Links</span> <span class="fs8">(since April 2006)</span>
		<cfloop query="RS1" endrow="#limit#">
			<br /><div class="boxPortal08">#RS1.clicks#</div>#RS1.currentrow#. <a href="portal.cfm?id=#RS1.id#" title="Goto #RS1.name#">#left(RS1.name,34)#<cfif len(RS1.name) GTE 35>..</cfif></a>
		</cfloop>
	</cffunction>
	
	<cffunction name="cracktros" access="public" returntype="string" hint="Number of cracktos less installers/ingameloaders">
		<cfquery name="RS1" datasource="#application.crackSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT Count(Installer) AS sum FROM cracktros WHERE Installer = 0 AND InGameLoader = 0
		</cfquery>
		<cfset result=RS1.sum>
		<cfreturn result>
	</cffunction>
	
	<cffunction name="cracktroAuthors" access="public" returntype="string" hint="Authors in our cracktro database">
		<cftry>
		<cfquery name="RS1" datasource="#application.crackSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT Count(DISTINCT Author) AS sum FROM cracktrosauthors
		</cfquery>
		<cfcatch type="database">
			<cfset result=0>
			<cfreturn result>
		</cfcatch>
		</cftry>
		<cfset result=RS1.sum>
		<cfreturn result>
	</cffunction>	
		
	<cffunction name="cracktroGroups" access="public" returntype="string" hint="Groups who have a cracktro">
		<cfquery name="RS1" datasource="#application.crackSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT Count(DISTINCT CreatedFor) AS sum FROM cracktros
		</cfquery>
		<cfset result=RS1.sum>
		<cfreturn result>
	</cffunction>

	<cffunction name="cracktrosDL" access="public" returntype="numeric" hint="Cracktros downloaded">
		<cfquery name="RS1" datasource="#application.crackSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT SUM(Clicks) AS cracktotal FROM cracktros
		</cfquery>
		<cfset result=RS1.cracktotal>
		<cfreturn result>
	</cffunction>
	
	<cffunction name="documents" access="public" returntype="string" hint="Number of scene archive documents (in the documents section)">
		<cfquery name="RS1" datasource="#application.docSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT Count(Type) AS sum FROM documents WHERE Type = 'Text' OR Type = 'PDF' OR Type = 'Html'
		</cfquery>
		<cfset result=RS1.sum>
		<cfreturn result>
	</cffunction>	
	
	<cffunction name="documentsDL" access="public" returntype="numeric" hint="Documents downloaded">
		<cfquery name="RS1" datasource="#application.docSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT SUM(Clicks) AS doctotal FROM documents
		</cfquery>
		<cfset result=RS1.doctotal>
		<cfreturn result>
	</cffunction>	
	
	<cffunction name="filepacksDL" access="public" returntype="numeric" hint="File packs downloaded">
		<cfquery name="RS1" datasource="#application.dataSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT SUM(downloads) AS packstotal FROM filepacks
		</cfquery>
		<cfset result=RS1.packstotal>
		<cfreturn result>
	</cffunction>
	
	<cffunction name="filesServed" access="public" returntype="numeric" hint="Total number of files downloaded">
		<cfinvoke component="statistics" method="cracktrosDL" returnvariable="NumcracktrosDL">
		<cfinvoke component="statistics" method="documentsDL" returnvariable="NumdocumentsDL">
		<cfinvoke component="statistics" method="filepacksDL" returnvariable="NumfilepacksDL">
		<cfinvoke component="statistics" method="magazineDL" returnvariable="NummagazineDL">
		<cfinvoke component="statistics" method="groupfilesDL" returnvariable="NumgroupfilesDL">
		<cfinvoke component="statistics" method="nfoDL" returnvariable="NumnfoDL">
		<cfset result=NumcracktrosDL+NumdocumentsDL+NumfilepacksDL+NummagazineDL+NumgroupfilesDL+NumnfoDL>
		<cfreturn result>
	</cffunction>

	<cffunction name="filesTotal" access="public" returntype="numeric" hint="Total number of files offered for download">
		<cfinvoke component="statistics" method="newsPosts" returnvariable="RCnewsPosts">
		<cfinvoke component="statistics" method="portalLinks" returnvariable="RCportalLinks">
		<cfinvoke component="statistics" method="documents" returnvariable="STATdocuments">
		<cfinvoke component="statistics" method="repositoryFiles" returnvariable="RCrepositoryFiles">
		<cfinvoke component="statistics" method="magazinesCode" returnvariable="RCmagazinesCode">
		<cfinvoke component="statistics" method="magazinesText" returnvariable="RCmagazinesText">
		<cfinvoke component="statistics" method="cracktros" returnvariable="RCcracktros">
		<cfinvoke component="statistics" method="installers" returnvariable="RCinstallers">
		<cfinvoke component="statistics" method="cracktroGroups" returnvariable="RCcracktroGroups">
		<!--- 6200 = number of NFO files --->
		<cfset result=RCnewsPosts+RCportalLinks+STATdocuments+RCrepositoryFiles+RCmagazinesCode+RCmagazinesText+RCcracktros+RCinstallers+RCcracktroGroups+6200>
		<cfreturn result>
	</cffunction>
	
	<cffunction name="groupfilesDL" access="public" returntype="numeric" hint="Group repository total downloads">
		<cfquery name="RS1" datasource="#application.groupSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT SUM(Clicks) AS groupstotal FROM repositoryfiles
		</cfquery>
		<cfset result=RS1.groupstotal>
		<cfreturn result>
	</cffunction>
		
	<cffunction name="installers" access="public" returntype="string" hint="Number of installers">
		<cfquery name="RS1" datasource="#application.crackSource#" timeout="5">
			SELECT Count(Installer) AS sum FROM cracktros WHERE Installer != 0 AND InGameLoader = 0
		</cfquery>
		<cfset result=RS1.sum>
		<cfreturn result>
	</cffunction>
		
	<cffunction name="magazinesCode" access="public" returntype="string" hint="Total number of coded magazine issues">
		<cfquery name="RS1" datasource="#application.magSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT Count(magSize) AS sum FROM magazineissues WHERE magazineissues.magSize <> '0' 
			AND magazineissues.magTitle = (SELECT magazinedetail.magPrimName FROM magazinedetail WHERE magazinedetail.magPrimText = 0 AND magazinedetail.magPrimName = magazineissues.magTitle)
		</cfquery>
		<cfset result=RS1.sum>
		<cfreturn result>
	</cffunction>	
	
	<cffunction name="magazineDL" access="public" returntype="numeric" hint="Magazine downloads">
		<cfquery name="RS1" datasource="#application.magSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT SUM(Clicks) AS magstotal FROM magazineissues
		</cfquery>
		<cfset result=RS1.magstotal>
		<cfreturn result>
	</cffunction>		
	
	<cffunction name="magazineIssuesCode" access="public" returntype="string" hint="Number of different coded magazines">
		<cfquery name="RS1" datasource="#application.magSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT Count(magPrimText) AS sum FROM magazinedetail WHERE magPrimText = 0
		</cfquery>
		<cfset result=RS1.sum>
		<cfreturn result>
	</cffunction>
		
	<cffunction name="magazineIssuesText" access="public" returntype="string" hint="Number of different text magazines">
		<cftry>
		<cfquery name="RS1" datasource="#application.magSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT Count(magPrimText) AS sum FROM magazinedetail WHERE magPrimText != 0
		</cfquery>
			<cfcatch type="database">
				<cfset result=0>
				<cfreturn result>
			</cfcatch>
		</cftry>
		<cfset result=RS1.sum>
		<cfreturn result>
	</cffunction>
	
	<cffunction name="magazinesText" access="public" returntype="string" hint="Number of text magazine issues">
		<cftry>
		<cfquery name="RS1" datasource="#application.magSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT Count(magSize) AS sum FROM magazineissues WHERE magazineissues.magSize <> '0' 
			AND magazineissues.magTitle = (SELECT magazinedetail.magPrimName FROM magazinedetail WHERE magazinedetail.magPrimText != 0 AND magazinedetail.magPrimName = magazineissues.magTitle)
		</cfquery>
		<cfcatch type="database">
			<cfset result=0>
			<cfreturn result>
		</cfcatch>
		</cftry>
		<cfset result=RS1.sum>
		<cfreturn result>
	</cffunction>
	
	<cffunction name="newsPosts" access="public" returntype="string" hint="News posts / or display the date of the first news post">
		<cfargument name="mode" type="string" required="no" default="count">
		<cfquery name="RS1" datasource="#application.newsSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT id,Date FROM thescenenews
		</cfquery>
		<cfif mode EQ "count">
			<cfset result=RS1.recordcount>
		<cfelse>
			<cfset result=RS1.date>
		</cfif>
		<cfreturn result>
	</cffunction>
	
	<cffunction name="nfoDL" access="public" returntype="numeric" hint="NFOs in NFOBrowser, total downloads">
		<cfquery name="RS1" datasource="#application.dataSource#" timeout="5">
			SELECT id,clicks FROM statistics WHERE id='nfo'
		</cfquery>
		<cfif RS1.Clicks EQ ""><cfset result=0><cfelse><cfset result=RS1.clicks></cfif>	
		<cfreturn result>
	</cffunction>	
	
	<cffunction name="portalLinks" access="public" returntype="string" hint="Links in the scene portal">
		<cfquery name="RS1" datasource="#application.portalSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT Count(disable) AS sum FROM thesceneportal WHERE disable = 0
		</cfquery>
		<cfset result=RS1.sum>
		<cfreturn result>
	</cffunction>

	<cffunction name="repositoryDocs" access="public" returntype="string" hint="Documents hosted by the repository">
		<cfquery name="RS1" datasource="#application.groupSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT Count(type) AS sum FROM repositoryfiles WHERE type <> 'Video' AND type <> 'Logo' AND type <> 'Image'
		</cfquery>
		<cfset result=RS1.sum>
		<cfreturn result>
	</cffunction>	
		
	<cffunction name="repositoryFiles" access="public" returntype="string" hint="Files hosted by the repository">
		<cfquery name="RS1" datasource="#application.groupSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT Count(id) AS sum FROM repositoryfiles
		</cfquery>
		<cfset result=RS1.sum>
		<cfreturn result>
	</cffunction>	
		
	<cffunction name="repositoryGroups" access="public" returntype="string" hint="Groups in the repository">
		<cftry>
		<cfquery name="RS1" datasource="#application.groupSource#" cachedwithin="#application.dailyTimeOut#" timeout="5">
			SELECT Count(idName) AS sum FROM repositorygroupdetail
		</cfquery>
			<cfcatch type="database">
				<cfset result=0>
				<cfreturn result>
			</cfcatch>
		</cftry>
		<cfset result=RS1.sum>
		<cfreturn result>
	</cffunction>
	
	<cffunction name="usersCounting" access="public" returntype="string" hint="Creates and saves a unique ID for each visitor and also adjusts visitor statistics">
		<cfif NOT IsDefined("session.id")>
			<!--- if user doesn't have a server session, create one using a uniquie ID --->
			<cfset session.id=#CreateUUID()#>
		</cfif>
		<!--- create the users session --->
		<cfset application.usersCounting[session.id]=StructNew()>
		<cfset application.usersCounting[session.id].time=now()>
		<cftry><cfset application.usersCounting[session.id].entrypage="#NoPath(GetBaseTemplatePath())#"><cfcatch></cfcatch></cftry>
		<cftry><cfset application.usersCounting[session.id].entrypagestring=CGI.QUERY_STRING><cfcatch></cfcatch></cftry>
		<cftry><cfset application.usersCounting[session.id].refer=CGI.HTTP_REFERER><cfcatch></cfcatch></cftry>
		<cftry><cfset application.usersCounting[session.id].browse=CGI.HTTP_USER_AGENT><cfcatch></cfcatch></cftry>
		<cftry><cfset application.usersCounting[session.id].host=CGI.REMOTE_HOST><cfcatch></cfcatch></cftry>
		<cftry><cfset application.usersCounting[session.id].ip=CGI.REMOTE_ADDR><cfcatch></cfcatch></cftry>
		<cftry><cfset application.usersCounting[session.id].hits=Client.HitCount><cfcatch></cfcatch></cftry>
		<cftry><cfset application.usersCounting[session.id].lastvisit=Client.LastVisit><cfcatch></cfcatch></cftry>
		<!--- if applicable, delete existing expired sessions --->
		<cfloop collection="#application.usersCounting#" item="id">
			<cfif evaluate(DateDiff("n", StructFind(application.usersCounting,id).time, now())) GT 5>
				<cflock timeout=20 scope="Session" type="Exclusive">
					<cfset StructDelete(application.usersCounting, id)>
				</cflock>
			</cfif>
		</cfloop>
		<!--- obtain the site statistics for the highest number of visits at any one time --->
		<cfquery name="RS1" datasource="#application.dataSource#" cachedwithin="#application.dailyTimeOut#">
			SELECT * FROM statisticsmaximumvisits WHERE id = 1
		</cfquery>
		<!--- if the current number of site visitors is greater then the recorded peak number, update the records --->
		<cfif IsDefined("RS1.maxVisits") AND (RS1.maxVisits EQ "" OR RS1.maxVisits EQ 0)>
			<cflock scope="session" timeout="5" type="exclusive">
			<cfquery datasource="#application.dataSource#">
				UPDATE statisticsmaximumvisits SET maxVisits=1, maxVisitsDate=#CreateODBCDateTime(now())#
				WHERE id=1
			</cfquery>
			</cflock>
		<cfelseif IsDefined("RS1.maxVisits") AND RS1.maxVisits LT StructCount(application.usersCounting)>
			<cflock scope="session" timeout="5" type="exclusive">
			<cfquery datasource="#application.dataSource#">
				UPDATE statisticsmaximumvisits SET maxVisits=#IncrementValue(StructCount(application.usersCounting))#, maxVisitsDate=#CreateODBCDateTime(now())#
				WHERE id=1
			</cfquery>
			</cflock>
		</cfif>
	</cffunction>

	<cffunction name="usersActive" access="public" output="true" returntype="string" hint="Displays the number of current visitors to the site">
		<cfset var tmp="">
		<cfinvoke component="cfcs.statistics" method="usersCounting">
		<cflock name="usersActive" timeout="5" type="readonly">
<!--- 		<cfquery name="RS1" datasource="#application.dataSource#">
			SELECT * FROM statisticsmaximumvisits WHERE id = 1
		</cfquery> --->
		</cflock>
		<cfoutput>
			<cfif IsDefined("application.usersCounting")>
				<cfset tmp = StructCount(application.usersCounting)>
				Computers viewing the site : <cfif tmp gt 1>#tmp#<cfelse>just you</cfif><!--- <span title="Occured on #dateFormat(RS1.maxVisitsDate,'d mmmm yyyy')#">(max #RS1.maxVisits#)</span> ---><br />
			</cfif>
			<cfif IsDefined("application.usersonline")>
			<cfset tmp=ArrayLen(application.usersonline)>
			<cfloop from="1" to="#tmp#" index="i">
				<cfif application.usersonline[i].date eq DateFormat(Now(),'ddmmmyyyy')>
					Total visits today : #application.usersonline[tmp].people# people &amp; #application.usersonline[tmp].robots# bots
					<cfif tmp gt 1>
					<br />Total visits yesterday : #application.usersonline[(tmp-1)].people# people &amp; #application.usersonline[(tmp-1)].robots# bots
					</cfif>
					<cfbreak>
				</cfif>
			</cfloop>
			</cfif>
		</cfoutput>
	</cffunction>

</cfcomponent>