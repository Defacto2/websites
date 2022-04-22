<cfcomponent>

	<cffunction name="numberList" access="public" returntype="string">
		<cfargument name="includeZero" type="boolean" default="false">
		<cfargument name="selected" type="numeric" default="1">
		<cfargument name="start" type="numeric" default="1">
		<cfargument name="end" type="numeric" default="12">
		<cfoutput>
			<cfif includeZero IS TRUE AND selected EQ 0>
				<option value="0" selected="true">0</option>
			<cfelseif includeZero IS TRUE>
				<option value="0">0</option>
			</cfif>
			<cfloop index="index" from="#start#" to="#end#">
				<cfif selected EQ index>
					<option value="#index#" selected="true">#index#</option>
				<cfelse>
					<option value="#index#">#index#</option>
				</cfif>
			</cfloop>
		</cfoutput>
	</cffunction>

	<cffunction name="display" access="public" returntype="string" hint="Queries all the site wide databases to compile a scene time line">
		<cfargument name="urlString" required="yes" hint="">
		<cfset newRowCount=0>
		<!--- Create a new Query 'RSCombined' --->
		<cfset RSCombined = QueryNew("datasource, id, Rday, Rmonth, Ryear, description, filetype, group","VarChar, VarChar, Integer, Integer, Integer, VarChar, VarChar, VarChar")>
		<!--- Obtain records from This Week In The Scene --->
		<cfif urlString CONTAINS 'events=true'>
		<cfquery name="RSX" datasource="#application.dataSource#" cachedwithin="#application.dailyTimeOut#">
			SELECT * FROM theweekin WHERE  year >= #url.startYear# AND year <= #url.endYear#
		</cfquery>
		<cfoutput query="RSX">
			<cfset newRow = QueryAddRow(RSCombined, 1)>
			<cfset newRowCount=IncrementValue(newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "datasource", "RSX", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "id", "", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Rday", "#day#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Rmonth", "#month#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Ryear", "#year#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "description", "#Snippet#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "filetype", "", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "group", "", newRowCount)>
		</cfoutput>
		</cfif>
		<!--- Insert NFO records --->
		<cfif urlString CONTAINS 'nfo=true'>
		<cfquery name="RS1" datasource="#application.groupSource#" cachedwithin="#application.dailyTimeOut#">
			SELECT * FROM repositoryfiles WHERE dateYear <> 0 AND type = 'nfo' AND dateYear >= #url.startYear# AND dateYear <= #url.endYear#
		</cfquery>
		<!--- fill those blank records with the data from RS1 --->
		<cfoutput query="RS1">
			<!--- create x number of blank records in the new query --->
			<cfset newRow = QueryAddRow(RSCombined, RS1.recordcount)>
			<cfset newRowCount=IncrementValue(newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "datasource", "RS1", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "id", "#id#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Rday", "#dateDay#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Rmonth", "#dateMonth#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Ryear", "#dateYear#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "description", "#description#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "filetype", "#type#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "group", "#org#", newRowCount)>
		</cfoutput>
		</cfif>
		<!--- rs1 record insertion complete --->
		<!--- Insert Magazine records --->
		<cfif urlString CONTAINS 'magazines=true'>
		<cfquery name="RS3" datasource="#application.magSource#" cachedwithin="#application.dailyTimeOut#">
			SELECT magID,magReleaseDate,magHeadline,magTitle,magIssue FROM magazineissues WHERE magReleaseDate IS NOT NULL
		</cfquery>		
		<cfoutput query="RS3">
			<cfset newRow = QueryAddRow(RSCombined, 1)>
			<cfset newRowCount=IncrementValue(newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "datasource", "RS3", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "id", "#magID#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Rday", "#DateFormat(magReleaseDate,'d')#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Rmonth", "#DateFormat(magReleaseDate,'m')#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Ryear", "#DateFormat(magReleaseDate,'yyyy')#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "description", "#magHeadline#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "filetype", "", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "group", "#magTitle# #magIssue#", newRowCount)>
		</cfoutput>
		</cfif>
		<!--- Insert Text documents records --->
		<cfif urlString CONTAINS 'docText=true'>
		<cfquery name="RS5" datasource="#application.docSource#" cachedwithin="#application.dailyTimeOut#">
			SELECT UniqueID,date,month,year,description,type,author FROM documents WHERE category <> 'Amiga' AND category <> 'Apple II' AND category <> 'Atari ST' AND year >= '#url.startYear#' AND year <= '#url.endYear#'
		</cfquery>
		<cfoutput query="RS5">
			<cfset newRow = QueryAddRow(RSCombined, 1)>
			<cfset newRowCount=IncrementValue(newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "datasource", "RS5", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "id", "#UniqueID#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Rday", "#date#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Rmonth", "#month#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Ryear", "#year#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "description", "#description#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "filetype", "#type#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "group", "#author#", newRowCount)>
		</cfoutput>
		<cfquery name="RS4" datasource="#application.groupSource#" cachedwithin="#application.dailyTimeOut#">
			SELECT * FROM repositoryfiles WHERE dateYear <> 0 AND (type = 'Text' OR type = 'Interview' OR type = 'Newsletter') AND dateYear >= #url.startYear# AND dateYear <= #url.endYear#
		</cfquery>
		<cfoutput query="RS4">
			<cfset newRow = QueryAddRow(RSCombined, 1)>
			<cfset newRowCount=IncrementValue(newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "datasource", "RS4", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "id", "#id#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Rday", "#dateDay#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Rmonth", "#dateMonth#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Ryear", "#dateYear#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "description", "#description#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "filetype", "#type#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "group", "#org#", newRowCount)>
		</cfoutput>
		</cfif>
		<!--- Insert non-PC related documents records --->
		<cfif urlString CONTAINS 'docNonPC=true'>
		<cfquery name="RS6" datasource="#application.docSource#" cachedwithin="#application.dailyTimeOut#">
			SELECT UniqueID,date,month,year,description,type,author FROM documents WHERE (category = 'Amiga' OR category = 'Apple II' OR category = 'Atari ST') AND year IS NOT NULL AND year >= '#url.startYear#' AND year <= '#url.endYear#'
		</cfquery>
		<cfoutput query="RS6">
			<cfset newRow = QueryAddRow(RSCombined, 1)>
			<cfset newRowCount=IncrementValue(newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "datasource", "RS6", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "id", "#UniqueID#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Rday", "#date#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Rmonth", "#month#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Ryear", "#year#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "description", "#description#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "filetype", "#type#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "group", "#author#", newRowCount)>
		</cfoutput>
		</cfif>
		<!--- Insert art file records --->
		<cfif urlString CONTAINS 'docArt=true'>
		<cfquery name="RS7" datasource="#application.groupSource#" cachedwithin="#application.dailyTimeOut#">
			SELECT * FROM repositoryfiles WHERE dateYear <> 0 AND (type = 'Advert' OR type = 'ANSI Logo' OR type = 'ASCII Logo' OR type = 'BBS Advert' OR type = 'Image' OR type = 'Logo' OR type = 'Video') AND dateYear >= #url.startYear# AND dateYear <= #url.endYear#
		</cfquery>
		<cfoutput query="RS7">
			<cfset newRow = QueryAddRow(RSCombined, 1)>
			<cfset newRowCount=IncrementValue(newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "datasource", "RS7", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "id", "#id#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Rday", "#dateDay#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Rmonth", "#dateMonth#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "Ryear", "#dateYear#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "description", "#description#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "filetype", "#type#", newRowCount)>
			<cfset temp = QuerySetCell(RSCombined, "group", "#org#", newRowCount)>
		</cfoutput>
		</cfif>		
		<!--- Final combined query --->
		<cfquery dbtype="query" name="RSZ">
			SELECT * 
			FROM RSCombined 
			WHERE (
			datasource IS NOT NULL 
			AND Ryear >= #url.startYear#
			AND Ryear <= #url.endYear#
			AND Rmonth IS NOT NULL
			AND Rmonth <> 0
			)
			ORDER BY 5 asc, 4 asc, 3 asc
		</cfquery>
		
		<div>
		<cfoutput>
			<cfset previousYear="">
			<cfset previousMonth="">
			<table cellpadding="0" cellspacing="0" class="boxTime01" style="padding-top:20px;padding-bottom:20px;">
				<tr><td colspan="2"><div class="fs12 center verdana lightGrey">Displaying #RSZ.recordcount# records</div></td></tr>
				<cfloop query="RSZ">
					<cfif 
						((RYear EQ url.startYear AND RMonth GTE url.startMonth) OR RYear NEQ url.startYear)
						AND
						((RYear EQ url.endYear AND RMonth LTE url.endMonth) OR RYear NEQ url.endYear)
						>
						<cfif previousYear EQ "" OR Ryear NEQ previousYear>
							<cfset margin=2>
							<tr><td class="magTimeLineDate" style="width:30px; padding:0px; padding-top:#margin#px; padding-right:10px; vertical-align:top;">
								<div class="boxGroup03" style="border:0px; text-align:left;">#Ryear#</div>
							</td></tr>
							<tr><td class="magTimeLineDate" style="width:30px; padding:0px; padding-top:#margin#px; padding-right:10px; vertical-align:top;">
						<cfelseif previousMonth NEQ Rmonth>
							<cfset margin=18>
							<tr><td class="magTimeLineDate" style="width:30px; padding:0px; padding-top:#margin#px; padding-right:10px; vertical-align:top;">
						<cfelse>
							<cfset margin=2>
							<tr><td class="magTimeLineDate" style="width:30px; padding:0px; padding-top:#margin#px; padding-right:10px; vertical-align:top;">
						</cfif>
						<cfif Rday GT 0>#Rday#.</cfif><cfif Rmonth GT 0>#Rmonth#.</cfif>#Ryear#</td>
						<td style="width:260px; padding:0px; padding-top:#margin#px;">
							<cfif datasource EQ 'RSX'>
								<!--- scene history --->
								<div style="color:##666633; border-top:1px dotted ##CCCCCC; border-bottom:1px dotted ##CCCCCC; padding-top:4px; padding-bottom:4px;">#description#</div>
							<cfelseif datasource EQ 'RS5' OR datasource EQ 'RS6'>
								<!--- documents (documents.cfm) --->
								<a href="documents.cfm?id=#id#">#description#</a>
								<cfif group NEQ ""><div class="fs11">Written by #group#</div></cfif>
							<cfelseif datasource EQ 'RS4'>
								<!--- documents (groups.cfm) --->
								<a href="groups.cfm?mode=#id#">#description#</a>
								<cfif group NEQ ""><div class="fs11">Written by #group#</div></cfif>
							<cfelseif datasource EQ 'RS3'>
								<!--- magazines (magazines.cfm) --->
								<a href="magazines.cfm?id=#id#&reader=raw" class="bold italic fs13">#group#</a><cfif description NEQ ""> <span class="italic fs13">- #description#</span></cfif>
							<cfelse>
								<a href="groups.cfm?mode=#id#"><span class="upper">#group#</span> <span class="lower">#filetype#</span></a>
								<div class="fs11">#description#</div>
							</cfif>
						</td></tr>
						<cfset previousYear="#Ryear#">
						<cfset previousMonth="#Rmonth#">
					</cfif>
				</cfloop>
			</table>
		</div>
		</cfoutput>
	</cffunction>
</cfcomponent>