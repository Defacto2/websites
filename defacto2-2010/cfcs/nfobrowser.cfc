<cfcomponent>

	<cffunction name="clearDirectory" access="public" returntype="string" hint="Creates a variable that contains the current path">
		<cfargument name="fullDirectory" required="yes">
		<cfset countStart=1>
		<cfset countEnd=#listLen(fullDirectory, '\')#>
		<cfset tempDirectory="">
		<cfif fullDirectory CONTAINS "..">
			<!--- security messure to stop \.. root directory hack --->
			<cfabort>
		</cfif>
			<cfloop condition="countStart LE countEnd">
				<cfset tempDirectory=tempDirectory & #ListGetAt(fullDirectory, countStart, '\')# & '\'>
				<cfset safeDirectory=#mid(tempDirectory,1,len(tempDirectory) -1)#>
				<cfif countStart GTE #listLen(#application.nfoRootDir#, '\')#>
					<cfset clearDirectory=replace("#safeDirectory#","#application.nfoRootDir#","","one")>
				</cfif>
				<cfset countStart=countStart+1>
				<cfflush>
			</cfloop>
		<cfreturn clearDirectory>
	</cffunction>
	
	<cffunction name="countClick" access="public" returntype="string" hint="Records when a person has viewed a file">
		<cfargument name="file" required="no" default="">
		<cfif file NEQ "">
			<cfquery name="getNFOCount" datasource="#application.dataSource#">
				SELECT * FROM statistics
			</cfquery>
			<cfif getNFOCount.clicks EQ "">
				<cfset count=1>
			<cfelse>
				<cfset count=getNFOCount.clicks+1>
			</cfif>
			<cfquery name="incFile" datasource="#application.dataSource#">
				UPDATE statistics SET clicks=#count#
				WHERE ID='nfo'
			</cfquery>
			<cflocation addtoken="no" url="#file#">
		</cfif>		
	</cffunction>
	
	<cffunction name="fileExtension" access="public" returntype="string" hint="Displays an icon associated with the file's extension">
		<cfargument name="extension" required="yes">
		<cfswitch expression="#extension#">
			<!--- graphics --->
			<cfcase value="jpg">
				<img src="images/explorer/jpeg-icon.gif" alt="Jpeg graphic icon">
			</cfcase>
			<cfcase value="png">
				<img src="images/explorer/jpeg-icon.gif" alt="PNG graphic icon">
			</cfcase>
			<cfcase value="gif">
				<img src="images/explorer/gif-icon.gif" alt="GIF graphic icon">
			</cfcase>
			<!--- movies --->
			<cfcase value="m2v">
				<img src="images/explorer/music-icon.gif" alt="Movie icon">
			</cfcase>
			<cfcase value="avi">
				<img src="images/explorer/music-icon.gif" alt="Movie icon">
			</cfcase>
			<!--- compressed files --->
			<cfcase value="zip">
				<img src="images/explorer/compressed-icon.gif" alt="ZIP compressed file icon">
			</cfcase>
			<cfcase value="rar">
				<img src="images/explorer/compressed-icon.gif" alt="RAR compressed file icon">
			</cfcase>
			<cfcase value="7z">
				<img src="images/explorer/compressed-icon.gif" alt="7Zip compressed file icon">
			</cfcase>
			<cfcase value="ace">
				<img src="images/explorer/compressed-icon.gif" alt="ACE compressed file icon">
			</cfcase>
			<!--- execute --->
			<cfcase value="exe">
				<img src="images/explorer/exe-icon.gif" alt="Program file icon">
			</cfcase>
			<!--- HTML --->
			<cfcase value="htm">
				<img src="images/explorer/htm-icon.gif" alt="HTML file icon">
			</cfcase>
			<cfcase value="html">
				<img src="images/explorer/htm-icon.gif" alt="HTML file icon">
			</cfcase>
			<cfcase value="cfm">
				<img src="images/explorer/htm-icon.gif" alt="HTML file icon">
			</cfcase>
			<!--- documents --->
			<cfcase value="doc">
				<img src="images/explorer/doc-icon.gif" alt="Document icon">
			</cfcase>
			<cfcase value="txt">
				<img src="images/explorer/doc-icon.gif" alt="Text file icon">
			</cfcase>
			<cfcase value="nfo">
				<img src="images/explorer/doc-icon.gif" alt="NFO file icon">
			</cfcase>
			<cfcase value="diz">
				<img src="images/explorer/doc-icon.gif" alt="File_id.diz icon">
			</cfcase>
			<cfcase value="log">
				<img src="images/explorer/doc-icon.gif" alt="Log file icon">
			</cfcase>
			<cfcase value="pdf">
				<img src="images/explorer/pdf-icon.gif" alt="PDF document icon">
			</cfcase>
			<!--- If no icon is to be displayed, then list the file extention --->
			<cfdefaultcase>#getExtension(name)#</cfdefaultcase>
		</cfswitch>
	</cffunction>
	
	<cffunction name="fullPath" access="public" returntype="string" hint="Displays the full path of the active directory">
		<cfargument name="fullDirectory" required="yes">
		<cfargument name="currentPage" required="yes">
		<cfset countStart=1>
		<cfset countEnd=#listLen(fullDirectory, '\')#>
		<cfset tempDirectory="">
		<cfset displayDirectory="">
		<img src="images/explorer/folder.gif" alt="Folder" align="absmiddle">
		<cfoutput>
			<cfloop condition="countStart LE countEnd">
				<cfset tempDirectory=tempDirectory & #ListGetAt(fullDirectory, countStart, '\')# & '\'>
				<cfset safeDirectory=#mid(tempDirectory,1,len(tempDirectory) -1)#>
				<!--- Displays the directory path --->
				<cfif countStart GTE #listLen(application.nfoRootDir, '\')#>
					<!--- URL --->
					<cfset clearDirectory=replace("#safeDirectory#","#application.nfoRootDir#","","one")>
					<a href="#currentPage#?directory=#clearDirectory#" title="Revert back to the #listGetAt(fullDirectory, countStart, '\')# directory">#listGetAt(fullDirectory, countStart, '\')#</a>\
					<cfset displayDirectory=displayDirectory & '\' & listGetAt(fullDirectory, countStart, '\')>
				</cfif>
				<cfset countStart=countStart+1>
				<cfflush>
			</cfloop>
		</cfoutput>
		<cfreturn "#displayDirectory#">
	</cffunction>
	
	<cffunction name="randomASCII" access="public" returntype="string" hint="Displays a random ASCII logo">
		<img src="images/group-ascii-logos/<cfoutput>#randRange(1,27)#</cfoutput>.gif" alt="Retro group ASCII logo" />
	</cffunction>		
	
	<cffunction name="search" access="public" returntype="string" hint="Search dialog to find files">
		<cfargument name="action" required="yes">
			<form action="#action#" method="post" name="search" style="margin-bottom:0px;">
				<table cellpadding="0" cellspacing="0" class="boxNFOBrowser04"><tr><td>
					<input name="submit" type="submit" value="Search" title="Search this directory">
				</td><td>
					<input name="filter" type="text">
				</td><td>
					<input name="recurse" type="checkbox" checked="yes"><label for="recurse" class="fs10" style="vertical-align:middle;">search subfolders</label>
				</td></tr></table>
			</form>
	</cffunction>
	
</cfcomponent>