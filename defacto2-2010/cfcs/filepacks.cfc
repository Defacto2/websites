<cfcomponent>
	<cffunction name="link" access="public" returntype="string" hint="Creates a valid download link after a valid file pack ID is provided">
		<cfargument name="id" required="yes" type="numeric">
		<cfquery name="RS1" datasource="#application.dataSource#" cachedwithin="#application.dailyTimeOut#">
			SELECT * FROM filepacks WHERE id=#id#
		</cfquery>
		<cfif RS1.nolocal EQ TRUE>
			<cfset downloadAttr="downloads;#RS1.filename#;#RS1.filesize#;nolocal;#RS1.fulltitle#">
		<cfelse>
			<cfset downloadAttr="downloads;#RS1.filename#;#RS1.filesize#;#RS1.fulltitle#">
		</cfif>
		<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="#downloadAttr#" returnvariable="encryptedDAttr">
		<cfset returnValue="#encryptedDAttr#">
		<cfreturn returnValue>
	</cffunction>

	<cffunction name="list" access="public" returntype="string" hint="Displays a listing of all the file packs on offer with download links">
		<cfargument name="margin" required="no" default="40px">
		<cfargument name="fontAdjust" required="no" default="10px">
		<cfargument name="id" required="no" default="0" type="numeric">
		<cfif id GT 0 AND id LTE 5>
			<!--- Request individual file pack --->
			<cflock name="listfpack" timeout="20" type="readonly">
			<cfquery name="filepacks" datasource="#application.dataSource#" cachedwithin="#application.dailyTimeOut#">
				SELECT * FROM filepacks WHERE id=#id#
			</cfquery>
			</cflock>
			<cfoutput query="filepacks">
				<!--- file information to be sent encrypted --->
				<cfif nolocal EQ TRUE>
					<cfset downloadAttr="downloads;#filepacks.filename#;#filepacks.filesize#;nolocal;#filepacks.fulltitle#">
				<cfelse>
					<cfset downloadAttr="downloads;#filepacks.filename#;#filepacks.filesize#;#filepacks.fulltitle#">
				</cfif>
				<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="#downloadAttr#" returnvariable="encryptedDAttr">
				<cfset returnValue="<a href='download.cfm?#encryptedDAttr#'>#filepacks.fulltitle#</a>">
				<cfreturn returnValue>
			</cfoutput>		
		<cfelse>
			<!--- Display all file packs --->
			<cflock name="allfpacks" timeout="10" type="readonly">
			<cfquery name="filepacks" datasource="#application.dataSource#" cachedwithin="#application.dailyTimeOut#">
				SELECT * FROM filepacks ORDER BY lastrevised DESC
			</cfquery>
			</cflock>
			<cfoutput query="filepacks">
				<!--- file information to be sent encrypted --->
				<cfif nolocal EQ TRUE>
					<cfset downloadAttr="downloads;#filepacks.filename#;#filepacks.filesize#;nolocal;#filepacks.fulltitle#">
				<cfelse>
					<cfset downloadAttr="downloads;#filepacks.filename#;#filepacks.filesize#;#filepacks.fulltitle#">
				</cfif>
				<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="#downloadAttr#" returnvariable="encryptedDAttr">
				<cfif highlight EQ TRUE><span class="bold"></cfif><a href='download.cfm?#encryptedDAttr#' title="Download #filepacks.fulltitle#">#filepacks.fulltitle#</a><cfif highlight EQ TRUE></span></cfif>
				<div style="font-size:#fontAdjust#; margin-bottom:#margin#;">
				<cfif (filepacks.filesize) GTE 1024>
					#numberformat(filepacks.filesize/1024,"_____._")# MB
				<cfelse>
					#CommaFormat(filepacks.filesize)# KB</cfif> - #LSDateFormat(filepacks.lastrevised,'DD MMMM YYYY')# <span style="color:##999999;">(<cfif filepacks.downloads NEQ "">#filepacks.downloads#<cfelse>0</cfif>)</span><br />
				</div>
			</cfoutput>
		</cfif>
	</cffunction>
	
</cfcomponent>