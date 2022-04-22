<cfcomponent>

	<cffunction name="details" access="public" returntype="string" hint="Displays indetail, listing of the productions">
		<cfargument name="mode" required="yes">
		<cfargument name="value" required="no" default="">
		<cfargument name="page" required="yes" hint="">
		<cfargument name="recordsAtOnce" required="yes" type="numeric" hint="">
		
		<cfset var currentPage=GetFileFromPath(GetTemplatePath())>
		<cfset var fileExtension="">
		<cfset var fileID="">
		<cfset var queryStart="">
		<cfset var numberOfProductions="">
    <cfset var i=0>
		<!--- tempary fix for TRSI group list problem --->
		<cfif IsDefined("url.value") AND urldecode(cgi.query_string) CONTAINS 'value=Tristar & Red Sector Inc'>
			<cfset value="Tristar & Red Sector Inc">
			<cfset urlValues="#currentPage#?mode=#mode#&amp;value=Tristar & Red Sector Inc&amp;page=#page#&amp;recordsAtOnce=#recordsAtOnce#">
		<cfelse>
			<cfset urlValues="#currentPage#?mode=#mode#&amp;value=#value#&amp;page=#page#&amp;recordsAtOnce=#recordsAtOnce#">
		</cfif>
    
		<!--- To change records at once values DONT forget to adjust this safe guard --->
		<cfif recordsAtOnce LT 1 OR recordsAtOnce GT 100><cfset recordsAtOnce=25></cfif>

		<cfif mode EQ 'author'>
			<cfquery name="RS1" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
				SELECT * FROM cracktrosties WHERE Authors = '#value#'
			</cfquery>
		</cfif>
		<cfif mode EQ 'year'>
			<cfquery name="RS2" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
				SELECT * FROM cracktros WHERE Year = #value# ORDER BY CreatedFor, filename ASC
			</cfquery>
		</cfif>
		<cfif mode EQ 'group'>
			<cfquery name="RS2" datasource="#application.crackSource#">
				SELECT * FROM cracktros WHERE CreatedFor='#value#' ORDER BY Year, Author ASC
			</cfquery>
		</cfif>
		<cfif mode EQ 'file' and IsNumeric(value)>
			<cfquery name="RS2" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
				SELECT * FROM cracktros WHERE id = '#value#' ORDER BY CreatedFor, filename ASC
			</cfquery>
		</cfif>
		<cfif mode EQ 'file' and not IsNumeric(value)>
			<cfquery name="RS2" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
				SELECT * FROM cracktros WHERE filename LIKE '#value#%' ORDER BY CreatedFor, filename ASC
			</cfquery>
		</cfif>
		<cfif mode EQ 'installer'>
			<cfquery name="RS2" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
				SELECT * FROM cracktros WHERE Installer != 0 ORDER BY CreatedFor,Year DESC
			</cfquery>
		</cfif>
		<cfif mode EQ 'popular'>
			<cfquery name="RS2" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
				SELECT * FROM cracktros ORDER BY Clicks DESC
			</cfquery>
		</cfif>
		<cfif mode EQ 'youtube'>
			<cfquery name="RS2" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
				SELECT * FROM cracktros WHERE YouTube IS NOT NULL ORDER BY CreatedFor DESC
			</cfquery>
		</cfif>
		<cfif mode EQ 'dosonly'>
			<cfquery name="RS2" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
				SELECT * FROM cracktros WHERE Windows = 0 ORDER BY CreatedFor,Year DESC
			</cfquery>
		</cfif>
		<cfif mode EQ 'winonly'>
			<cfquery name="RS2" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
				SELECT * FROM cracktros WHERE Windows != 0 ORDER BY CreatedFor,Year DESC
			</cfquery>
		</cfif>
		<cfif mode EQ 'all'>
			<cfquery name="RS2" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
				SELECT * FROM cracktros ORDER BY ID DESC
			</cfquery>
			<cfquery name="RS3" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
				SELECT * FROM cracktros WHERE InGameLoader != 0
			</cfquery>
		</cfif>
		<cfif #mode# EQ 'author'>
			<cfset cracktroOutput="RS1">
		<cfelse>
			<cfset cracktroOutput="RS2">
		</cfif>
		<cfif page GTE 2>
			<cfset queryStart=((page*recordsAtOnce)-DecrementValue(recordsAtOnce))>
		<cfelse>
			<cfset queryStart=page>
		</cfif>
		<cfset numberOfProductions=evaluate(toString(cracktroOutput)&".recordCount")>
		<cfoutput>
			<cfif numberOfProductions EQ 0><div class="boxCrack11">Sorry we could not locate the production <span class="italic">#value#</span></div><cfabort></cfif>
			<!--- navigation --->
			<table style="width:100%;">
      <tr class="boxCrack13">
      	<td colspan="4">
        [<cfloop from="1" to='#ceiling(evaluate(toString(cracktroOutput)&".recordCount")/recordsAtOnce)#' index="i"> <a href="#replaceNoCase(urlValues, "page=#page#", "page=#i#")#" title="Goto page #i#"><cfif i is page><em><strong>#i#</em></strong><cfelse>#i#</cfif></a> </cfloop>] &nbsp; page #page# of #ceiling(evaluate(toString(cracktroOutput)&".recordCount")/recordsAtOnce)#
        </td>
      </tr>
      <tr>
				<td class="boxCrack12">
					<cfif page GT 1 AND numberOfProductions GT recordsAtOnce><a href="#replaceNoCase(urlValues, "page=#page#", "page=#DecrementValue(page)#")#" title="Goto page #DecrementValue(page)#">previous</a></cfif>
					<cfif page GT 1 AND numberOfProductions GT recordsAtOnce AND numberOfProductions GT (queryStart+recordsAtOnce)> / </cfif>
					<cfif numberOfProductions GT (queryStart+(recordsAtOnce-1))><a href="#replaceNoCase(urlValues, "page=#page#", "page=#IncrementValue(page)#")#" title="Goto page #IncrementValue(page)#">next</a></cfif>
				</td>
				<td class="boxCrack13"></td>
				<td class="boxCrack14">view at once: <a href="#replaceNoCase(urlValues, 'recordsAtOnce=#recordsAtOnce#', 'recordsAtOnce=5')#" title="Display 5 productions per page" <cfif recordsAtOnce EQ 5>style="text-decoration:underline;"</cfif>>5</a>, <a href="#replaceNoCase(urlValues, 'recordsAtOnce=#recordsAtOnce#', 'recordsAtOnce=25')#" title="Display 10 productions per page" <cfif recordsAtOnce EQ 25>style="text-decoration:underline;"</cfif>>25</a>, <a href="#replaceNoCase(urlValues, 'recordsAtOnce=#recordsAtOnce#', 'recordsAtOnce=50')#" title="Display 50 productions per page" <cfif recordsAtOnce EQ 50>style="text-decoration:underline;"</cfif>>50</a>, <a href="#replaceNoCase(urlValues, 'recordsAtOnce=#recordsAtOnce#', 'recordsAtOnce=100')#" title="Display 100 productions per page" <cfif recordsAtOnce EQ 100>style="text-decoration:underline;"</cfif>>100</a></td>
				<td><div class="boxCrack15">help: <a href="help.cfm?mode=error" title="Learn how to fix various program errors that might arise">troubleshooting error messages</a></div></td>
			</tr></table>
		</cfoutput>
		<cfoutput query="#cracktroOutput#" startrow="#queryStart#" maxrows="#recordsAtOnce#">
			<cfif mode EQ 'author'>
				<cfquery name="RS2" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT * FROM cracktros WHERE ID = #RS1.CracktroID# ORDER BY CreatedFor,Year ASC
				</cfquery>
			</cfif>
			<cfif fileExists(expandPath("images/cracktro-scenes/#RS2.filename#.png")) IS TRUE><cfset fileExtension=".png">
			<cfelseif fileExists(ExpandPath("images/cracktro-scenes/#RS2.filename#.jpg")) IS TRUE><cfset fileExtension=".jpg">
			<cfelseif fileExists(ExpandPath("images/cracktro-scenes/#RS2.filename#.gif")) IS TRUE><cfset fileExtension=".gif">
			<cfelse><cfset fileExtension="">
			</cfif>
			<cfif fileExists(expandPath("includes/cracktros/#RS2.filename#.zip")) IS TRUE><cfset fileID=#RS2.id#></cfif>
      <!--- Google Adsense --->
      <cfif Evaluate('#cracktroOutput#.currentrow') is (1+queryStart) or Evaluate('#cracktroOutput#.currentrow') is (5+queryStart) or Evaluate('#cracktroOutput#.currentrow') is (10+queryStart)>
      <div style="margin:10px; text-align:center;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="cracktros"></div>
      </cfif>
			<table cellpadding="0" cellspacing="0" class="boxCrack16"><tr><td class="boxCrack17">
			
				<table cellpadding="0" cellspacing="0" class="boxCrack18"><tr>
				<cfif RS2.youtube NEQ "">
					<tr><td class="boxCrack19" style="padding-top:4px;"><a href="http://www.youtube.com/watch?v=#RS2.Youtube#"><img src="images/youtube.png" alt="YouTube video" title="Watch the video recording of this cracktro" /></a></td><td class="boxCrack26" style="vertical-align:top">.watch</td></tr>
				</cfif>
				<cfif IsNumeric(fileID) AND RS2.InGameLoader EQ 0>
					<td><cfif RS2.DateAdded NEQ ""><cfif dateDiff('d', parseDateTime(RS2.DateAdded), now()) LTE application.daysNew><img src="images/new!.gif" alt="New document" /> </cfif></cfif> <a href="cracktros.cfm?id=#RS2.id#" title="Download #RS2.filename#.zip">#RS2.filename#</a></td><td class="boxCrack26"> .file</td>
				<cfelseif RS2.InGameLoader NEQ 0>
					<td><cfif RS2.DateAdded NEQ ""><cfif dateDiff('d', parseDateTime(RS2.DateAdded), now()) LTE application.daysNew><img src="images/new!.gif" alt="New document" /> </cfif></cfif> <span class="line-through">#RS2.filename#</span></td><td class="boxCrack26"> .file</td>
				<cfelse>
					<td><cfif RS2.DateAdded NEQ ""><cfif dateDiff('d', parseDateTime(RS2.DateAdded), now()) LTE application.daysNew><img src="images/new!.gif" alt="New document" /> </cfif></cfif> <span class="red">#RS2.filename#</span></td><td class="boxCrack26"> .file</td>
				</tr></cfif>
				<tr>
				<td><a href="cracktros.cfm?mode=group&amp;value=#RS2.CreatedFor#&amp;recordsAtOnce=#recordsAtOnce#" title="View other productions created for #RS2.CreatedFor#">#RS2.CreatedFor#</a></td><td class="boxCrack26"> .for</td>
				</tr><tr>
				<cfif RS2.Installer NEQ 0>
					<td>install application</td><td class="boxCrack26"> .type</td>
				<cfelseif RS2.InGameLoader NEQ 0>
					<td><span class="red">ingame loader</span></td><td class="boxCrack26"> .type</td>
				<cfelse>
					<td>crack-intro</td><td class="boxCrack26"> .type</td>
				</cfif>
				</tr><tr>
				<!--- extra author code --->
				<cfquery name="RSAuthors" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT Authors FROM cracktrosties WHERE CracktroID = #RS2.ID#
				</cfquery>
				<cfif RSAuthors.recordcount NEQ 0>
					<td><cfloop query="RSAuthors"><a href="cracktros.cfm?mode=author&amp;value=#RSAuthors.Authors#&amp;recordsAtOnce=#recordsAtOnce#" title="View other productions that #RSAuthors.Authors# has worked on">#RSAuthors.Authors#</a><cfif RSAuthors.currentrow LT RSAuthors.recordcount>, </cfif></cfloop></td><td class="boxCrack26"> .by</td>
				</cfif>
				</tr><tr>
					<td><a href="cracktros.cfm?mode=year&amp;value=#RS2.Year#&amp;recordsAtOnce=#recordsAtOnce#" title="View other productions from #RS2.Year#">#RS2.year#</a></td><td class="boxCrack26">.year</td>
				</tr>
				<cfif RS2.InGameLoader EQ 0>
					<tr><td>#RS2.clicks#</td><td class="boxCrack26">.dls</td></tr>
				</cfif>
				<tr>
				<cfif RS2.Windows NEQ 0>
					<td>windows</td><td class="boxCrack26">.o/s</td>
				<cfelse>
					<td><a href="help.cfm?mode=dos" title="Goto our DOS help guide">ms-dos</a></td><td class="boxCrack26">.o/s</td>
				</cfif>
				</tr>
				<cfif RS2.game NEQ "">
					<tr><td style="margin-top:4px;">#RS2.game#</td><td>&nbsp;</td></tr>
				</cfif>
				<cfif RS2.notes NEQ "">
					<tr><td style="font-size:9px;margin-top:4px;">#RS2.notes#</td><td>&nbsp;</td></tr>
				</cfif>
				<cfif RS2.Windows NEQ 0 AND RS2.DesignFor9x NEQ 0>
					<tr><td style="font-size:9px;margin-top:4px;">probably will only run on windows 98/me</td><td>&nbsp;</td></tr>
				<cfelseif RS2.Compat2000XP NEQ 0>
					<tr><td div style="font-size:9px;margin-top:4px;">windows xp compatible</td><td>&nbsp;</td></tr>
				</cfif>
				</table>
			</td><td>
				<div style="float:left; margin-left:20px;">
					<cfif fileExtension NEQ "">
						<img src="images/cracktro-scenes/#RS2.filename##fileExtension#" class="boxCrack20" alt="#RS2.filename# Cracktro Screenshot" />
					</cfif>
				</div>
			</td></tr></table>
		</cfoutput>
		<cfoutput>
			<!--- navigation --->
			<table class="boxCrack21"><tr>
				<td class="boxCrack12">
					<cfif page GT 1 AND numberOfProductions GT recordsAtOnce><a href="#replaceNoCase(urlValues, "page=#page#", "page=#DecrementValue(page)#")#" title="Goto page #DecrementValue(page)#">previous</a></cfif>
					<cfif page GT 1 AND numberOfProductions GT recordsAtOnce AND numberOfProductions GT (queryStart+recordsAtOnce)> / </cfif>
					<cfif numberOfProductions GT (queryStart+(recordsAtOnce-1))><a href="#replaceNoCase(urlValues, "page=#page#", "page=#IncrementValue(page)#")#" title="Goto page #IncrementValue(page)#">next</a></cfif>
				</td>
				<td class="boxCrack13">page #page# of #ceiling(evaluate(toString(cracktroOutput)&".recordCount")/recordsAtOnce)#</td>
				<td class="boxCrack14">view at once: <a href="#replaceNoCase(urlValues, 'recordsAtOnce=#recordsAtOnce#', 'recordsAtOnce=5')#" title="Display 5 productions per page" <cfif recordsAtOnce EQ 5>style="text-decoration:underline;"</cfif>>5</a>, <a href="#replaceNoCase(urlValues, 'recordsAtOnce=#recordsAtOnce#', 'recordsAtOnce=25')#" title="Display 25 productions per page" <cfif recordsAtOnce EQ 25>style="text-decoration:underline;"</cfif>>25</a>, <a href="#replaceNoCase(urlValues, 'recordsAtOnce=#recordsAtOnce#', 'recordsAtOnce=50')#" title="Display 50 productions per page" <cfif recordsAtOnce EQ 50>style="text-decoration:underline;"</cfif>>50</a>, <a href="#replaceNoCase(urlValues, 'recordsAtOnce=#recordsAtOnce#', 'recordsAtOnce=100')#" title="Display 100 productions per page" <cfif recordsAtOnce EQ 100>style="text-decoration:underline;"</cfif>>100</a></td>
				<td><div class="boxCrack15">help: <a href="help.cfm?mode=error" title="Learn how to fix various program errors that might arise">troubleshooting error messages</a></div></td>
			</tr></table>
		</cfoutput>
	</cffunction>
	
	<cffunction name="download" access="public" returntype="string" hint="Record when a production has been downloaded">
		<cfargument name="id" required="yes" type="numeric">
		<cfquery name="RS1" datasource="#application.crackSource#">
			SELECT * FROM cracktros WHERE id = #url.id#
		</cfquery>
		<cfif IsDefined("RS1.id") AND IsNumeric(RS1.id)>
			<cfquery datasource="#application.crackSource#">
				<cflock scope="application" type="exclusive" timeout="5">
				<cfif RS1.Clicks EQ "">
					<!--- if the current id has no views, then start with 1 --->
					UPDATE cracktros SET Clicks=1
					WHERE id=#id#
				<cfelse>
					<!--- if the current id is an integer, then increase it --->
					UPDATE cracktros SET Clicks=#IncrementValue(RS1.Clicks)#
					WHERE id=#id#
				</cfif>
				</cflock>
			</cfquery>
			<cfinvoke component="download" method="IPCheck">
			<cflocation addtoken="no" url="includes/cracktros/#RS1.filename#.zip">
		<cfelse>
			<div class="red">There is an error in the url supplied</div><cfabort>
		<cflocation addtoken="no" url="cracktro-detail.cfm">
		</cfif>
	</cffunction>

	<cffunction name="filter" access="public" returntype="string" hint="Display information on the number of productions as well as a filtering form">
		<cfargument name="mode" required="yes">
		<cfargument name="value" required="no" default="">
		<!--- tempary fix for TRSI group list problem --->
		<cfif IsDefined("url.value") AND urldecode(cgi.query_string) CONTAINS 'value=Tristar & Red Sector Inc'>
			<cfset value="Tristar & Red Sector Inc">
		</cfif>
		<!---  --->
		<cfswitch expression="#mode#">
			<cfcase value="listauthor">
				<cfquery name="RS1" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT DISTINCT Author FROM cracktrosauthors
				</cfquery>
			</cfcase>
			<cfcase value="listgroup">
				<cfquery name="RS2" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT DISTINCT CreatedFor FROM cracktros
				</cfquery>
			</cfcase>
			<cfcase value="listfile">
				<cfquery name="RS4" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT * FROM cracktros ORDER BY"Clicks"DESC
				</cfquery>
				<cfquery name="RS5" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT * FROM cracktros WHERE InGameLoader != 0
				</cfquery>
			</cfcase>
			<cfcase value="author">
				<cfquery name="RS3" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT * FROM cracktrosties WHERE Authors = '#value#'
				</cfquery>
			</cfcase>
			<cfcase value="year">
				<cfif IsNumeric(value)>
					<cfquery name="RS4" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
						SELECT * FROM cracktros WHERE Year= #value# ORDER BY CreatedFor,filename ASC
					</cfquery>
				<cfelse>
					Year value must be numeric
					<cfabort>
				</cfif>
			</cfcase>
			<cfcase value="group">
				<cfquery name="RS4" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT * FROM cracktros WHERE CreatedFor= '#value#' ORDER BY Year,Author ASC
				</cfquery>
			</cfcase>
			<cfcase value="file">
				<cfquery name="RS4" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT * FROM cracktros WHERE filename LIKE '#value#%' ORDER BY CreatedFor,filename ASC
				</cfquery>
			</cfcase>
			<cfcase value="dosonly">
				<cfquery name="RS4" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT * FROM cracktros WHERE Windows = 0 ORDER BY CreatedFor,Year DESC
				</cfquery>
			</cfcase>
			<cfcase value="winonly">
				<cfquery name="RS4" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT * FROM cracktros WHERE Windows != 0 ORDER BY CreatedFor,Year DESC
				</cfquery>
			</cfcase>
			<cfcase value="installer">
				<cfquery name="RS4" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT * FROM cracktros WHERE Installer != 0 ORDER BY CreatedFor,Year DESC
				</cfquery>
			</cfcase>
			<cfcase value="youtube">
				<cfquery name="RS4" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT * FROM cracktros WHERE YouTube IS NOT NULL
				</cfquery>
			</cfcase>
			<cfcase value="popular">
				<cfquery name="RS4" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT * FROM cracktros ORDER BY"Clicks"DESC
				</cfquery>
				<cfquery name="RS5" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT * FROM cracktros WHERE InGameLoader != 0
				</cfquery>
			</cfcase>
			<cfcase value="all">
				<cfquery name="RS4" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT * FROM cracktros ORDER BY"ID"DESC
				</cfquery>
				<cfquery name="RS5" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT * FROM cracktros WHERE InGameLoader != 0
				</cfquery>
			</cfcase>
		</cfswitch>
		<cfoutput>
		<table cellpadding="0" cellspacing="0" class="boxGroup09" style="margin-top:10px;"><tr>
			<td style="width:50%;"><div class="boxGroup10">
				<cfswitch expression="#mode#">
					<cfcase value="listauthor">#RS1.RecordCount# different authors are listed</cfcase>
					<cfcase value="listgroup">#RS2.RecordCount# different groups listed</cfcase>
					<cfcase value="group"><span class="italic">#value#</span> productions listed, there are #RS4.RecordCount#</cfcase>
					<cfcase value="author"><span class="italic">#value#</span> has worked on #RS3.RecordCount# productions</cfcase>
					<cfcase value="year"><span class="italic">#value#</span> productions listed, there are #RS4.RecordCount#</cfcase>
					<cfcase value="youtube"><span class="italic">YouTube</span> videos listed, there are #RS4.RecordCount#</cfcase>
					<cfcase value="file">
						<cfif len(value) EQ 1 AND RS4.RecordCount GT 0>
							#RS4.RecordCount# productions begin with <span class="italic">#ucase(value)#</span>
						<cfelseif len(value) GT 1 AND RS4.RecordCount GT 0>
							#value#
						<cfelseif len(value) EQ 0 AND RS4.RecordCount GT 0>
							We have #RS4.RecordCount# cracktros in total
						<cfelse>
							<span class="italic">#value#</span> can not be located
						</cfif>
					</cfcase>
					<cfcase value="winonly"><span class="italic">Windows</span> productions listed, there are #RS4.RecordCount#</cfcase>
					<cfcase value="dosonly"><span class="italic">DOS</span> productions listed, there are #RS4.RecordCount#</cfcase>
					<cfcase value="installer"><span class="italic">Installers</span> listed, there are #RS4.RecordCount#</cfcase>
					<cfcase value="all,popular,listfile"><span class="italic">#(RS4.RecordCount - RS5.RecordCount)#</span> productions for download</cfcase>
					<cfcase value=""></cfcase>
				</cfswitch>
			</div></td>
			<td class="boxCrack03" style="width:50%; vertical-align:middle;">
				<div class="boxGroup25" style="margin-left:auto; margin-right:auto;">
					<form action="cracktros.cfm" method="get" id="cracktroFilter" style="margin:0px;">
						<fieldset style="border:0px; margin:0px; padding:0px;">
						List 
						<select name="mode">
							<option value="all"<cfif mode EQ "all"> selected="selected"</cfif>>New Additions</option>
							<option value="popular"<cfif mode EQ "popular"> selected="selected"</cfif>>Most Popular</option>
							<option value="listgroup"<cfif mode EQ "listgroup" OR mode EQ "group"> selected="selected"</cfif>>Groups</option>
							<option value="listauthor"<cfif mode EQ "listauthor" OR mode EQ "author"> selected="selected"</cfif>>Authors</option>
							<option value="listfile"<cfif mode EQ "listfile" OR mode EQ "file"> selected="selected"</cfif>>Filenames</option>
							<option value="listyear"<cfif mode EQ "listyear" OR mode EQ "year"> selected="selected"</cfif>>Years</option>
							<option value="dosonly"<cfif mode EQ "dosonly"> selected="selected"</cfif>>DOS Only</option>
							<option value="winonly"<cfif mode EQ "winonly"> selected="selected"</cfif>>Windows Only</option>
							<option value="installer"<cfif mode EQ "installer"> selected="selected"</cfif>>Installers</option>
							<option value="youtube"<cfif mode EQ "youtube"> selected="selected"</cfif>>YouTube Videos</option>
						</select>
						<input type="submit" name="list" value="submit" />
						</fieldset>
					</form>
				</div>
			</td></tr>
		</table>
	</cfoutput>
	</cffunction>
	
	<cffunction name="list" access="public" returntype="string" hint="Various list options to help filter the productions">
		<cfargument name="mode" required="yes">
		<cfset var lastGroup="">
		<cfset var groupCount=1>
		<cfset var discoverGroupCount=0>
		<cfset var discoverGroupCountHalf="">
		<cfset var AuthorCountQuarter="">
		<cfset var ACQ1="">
		<cfset var ACQ2="">
		<cfset var ACQCount=0>
		<cfset var yearCount=0>
		
		<cfquery name="RS1" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
			SELECT DISTINCT CreatedFor FROM cracktros ORDER BY CreatedFor ASC
		</cfquery>
		<cfquery name="RS2" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
			SELECT DISTINCT Authors FROM cracktrosties
		</cfquery>
		<cfquery name="RS3" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
			SELECT DISTINCT Year FROM cracktros ORDER BY Year ASC
		</cfquery>
		<cfquery name="RS4" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
			SELECT DISTINCT Year FROM cracktros ORDER BY Year DESC
		</cfquery>
		
		<cfoutput query="RS1">
			<cfif IsDefined('RS1.CreatedFor')>
				<cfquery name="RS5" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT Count(CreatedFor) AS CreatedForSum FROM cracktros WHERE CreatedFor = '#RS1.CreatedFor#'
				</cfquery>
			</cfif>
			<cfif RS1.CurrentRow EQ 1>
				<cfset discoverGroupCount=IncrementValue(discoverGroupCount)>
			</cfif>
			<cfif IsDefined("lastGroup") AND RS1.CreatedFor NEQ lastGroup>
				<cfset discoverGroupCount=IncrementValue(discoverGroupCount)>
			</cfif>
			<cfset lastGroup=RS1.CreatedFor>
		</cfoutput>
		<cfset discoverGroupCountHalf=discoverGroupCount/2>

		<cfif mode EQ 'listgroup'>
			<table cellpadding="0" cellspacing="0" style="width:638px; margin-left:auto; margin-right:auto;"><tr><td style="width:50%; border-left:0px; vertical-align:top;" class="boxCrack04">
			<div class="boxCrack05">
			<cfoutput query="RS1">
			<cfif IsDefined('RS1.CreatedFor')>
				<cfquery name="RS5" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
					SELECT Count(CreatedFor) AS CreatedForSum FROM cracktros WHERE CreatedFor = '#RS1.CreatedFor#'
				</cfquery>
			</cfif>
			<cfif groupCount EQ Round(discoverGroupCountHalf)>
				</div></td><td style="width:50%; vertical-align:top;" class="boxCrack04">
				<div class="boxCrack05">
			</cfif>
			<cfif RS1.CurrentRow EQ 0>
				<cfset groupCount=groupCount+1>
				<table cellpadding="0" cellspacing="0" style="width:100%;"><tr>
					<td style="width:6%;"><span style="text-align:right;" class="fs9"> #RS5.CreatedForSum#</span></td>
					<td style="width:94%;"><a href="cracktros.cfm?mode=group&amp;value=#RS1.CreatedFor#" style="text-align:left;">#RS1.CreatedFor#</a></td>
				</tr></table>
			</cfif>
			<cfif IsDefined("lastGroup") AND RS1.CreatedFor NEQ lastGroup>
				<cfset groupCount=groupCount+1>
				<cfif RS5.RecordCount GTE 10>
					<table cellpadding="0" cellspacing="0" style="width:100%;"><tr>
						<td style="width:6%;"><span style="text-align:right;" class="fs9"> #RS5.CreatedForSum#</span></td>
						<td style="width:94%;"><a href="cracktros.cfm?mode=group&amp;value=#RS1.CreatedFor#" style="text-align:left; font-weight:bold;">#RS1.CreatedFor#</a></td>
					</tr></table>
				<cfelse>
					<table cellpadding="0" cellspacing="0" style="width:100%;"><tr>
						<td style="width:6%;"><span style="text-align:right;" class="fs9"> #RS5.CreatedForSum#</span></td>
						<td style="width:94%;"><a href="cracktros.cfm?mode=group&amp;value=#RS1.CreatedFor#" style="text-align:left;">#RS1.CreatedFor#</a></td>
					</tr></table>
				</cfif>
			</cfif>
			<cfset lastGroup=RS1.CreatedFor>
			</cfoutput>
			</div></td></tr></table>
		</cfif>
		
		<cfif mode EQ 'listauthor'>
			<!--- calculate the number of Authors for 4 seperate columns --->
			<cfset AuthorCountQuarter=round(RS2.RecordCount/3)>
			<cfset ACQ1=AuthorCountQuarter>
			<cfset ACQ2=ACQ1+ACQ1>
			<table cellpadding="0" cellspacing="0" style="width:638px; margin-left:auto; margin-right:auto;"><tr><td style="width:33%; border-left:0px;" class="boxCrack04"><div class="boxCrack05">
				<cfoutput query="RS2">
					<cfquery name="RS6" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
						SELECT Count(Authors) AS authorSum FROM cracktrosties WHERE Authors = '#RS2.Authors#'
					</cfquery>
					<!--- when (rounded up) half the authors have been displayed, insert a new column to split the listing --->
					<cfif ACQCount EQ ACQ1 OR ACQCount EQ ACQ2>
						</div></td><td style="width:33%;" class="boxCrack04"><div class="boxCrack05">
					</cfif>
					<cfset authorCount=RS6.authorSum>
					<div style="float:right;" class="fs9"> #AuthorCount#</div>
					<cfif RS2.CurrentRow EQ 1 AND RS2.RecordCount NEQ 0>
						<a href="cracktros.cfm?mode=author&amp;value=#RS2.Authors#"><cfif AuthorCount GTE 10><span class="bold">#RS2.Authors#</span><cfelse>#RS2.Authors#</cfif></a><br />
						<cfset ACQCount=ACQCount+1>
					</cfif>
					<cfif IsDefined("LastAuthor") AND RS2.Authors NEQ LastAuthor>
						<cfset ACQCount=ACQCount+1>
						<a href="cracktros.cfm?mode=author&amp;value=#RS2.Authors#"><cfif AuthorCount GTE 10><span class="bold">#RS2.Authors#</span><cfelse>#RS2.Authors#</cfif></a><br />
					</cfif>
					<cfset lastAuthor=RS2.Authors>
				</cfoutput>
			</div></td></tr></table>
		</cfif>
		
		<cfif mode EQ 'listyear'>
			<table cellpadding="0" cellspacing="0" class="boxCrack06">
				<tr><td class="boxCrack07">
				<cfoutput query="RS3">
					<cfquery name="RS7" datasource="#application.crackSource#" cachedwithin="#application.cracktroTimeOut#">
						SELECT Count(Year) AS YearSum FROM cracktros WHERE Year=#RS3.Year#
					</cfquery>
					<cfif RS3.CurrentRow EQ 1>
						<cfset yearCount=IncrementValue(yearCount)>
						<cfset yearNewRow=yearCount MOD 6>
						<div class="boxCrack08"><a href="cracktros.cfm?mode=year&amp;value=#RS3.Year#">#RS3.Year#</a><br />
						<span class="boxCrack09">#RS7.YearSum# productions</span></div>
					</cfif>
					<cfif IsDefined("LastYear") AND RS3.Year NEQ lastYear>
						</td>
						<cfif yearNewRow EQ 0>
							</tr><tr>
						</cfif>
						<cfif yearNewRow NEQ 0 AND yearCount GTE RS4.recordcount>
							<tr><td style="border-left:1px solid ##CCCCCC;">
						<cfelseif yearNewRow NEQ 0>
							<td class="boxCrack07" style="border-left:1px solid ##CCCCCC;">
						<cfelseif yearCount GTE RS4.recordcount>
							<td>
						<cfelse>
							<td class="boxCrack07">
						</cfif>
						<cfset yearCount=IncrementValue(yearCount)>
						<cfset yearNewRow=yearCount MOD 6>
						<div class="boxCrack08"><a href="cracktros.cfm?mode=year&amp;value=#RS3.Year#">#RS3.Year#</a><br />
						<span class="boxCrack09">#RS7.YearSum# productions</span></div>
					</cfif>
					<cfset lastYear=RS3.Year>
				</cfoutput>
				</td></tr></table>
			</cfif>
		
			<cfif mode EQ 'listfile'>
				<table cellpadding="0" cellspacing="0" class="boxCrack06" style="width:638px;">
					<tr class="boxCrack10">
						<td><a href="cracktros.cfm?mode=file&amp;value=A">A</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=B">B</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=C">C</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=D">D</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=E">E</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=F">F</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=G">G</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=H">H</a></td>
					</tr>
					<tr class="boxCrack10">
						<td><a href="cracktros.cfm?mode=file&amp;value=I">I</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=J">J</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=K">K</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=L">L</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=M">M</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=N">N</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=O">O</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=P">P</a></td>
					</tr>
					<tr class="boxCrack10">
						<td><a href="cracktros.cfm?mode=file&amp;value=Q">Q</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=R">R</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=S">S</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=T">T</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=U">U</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=V">V</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=W">W</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=X">X</a></td>
					</tr>
					<tr class="boxCrack10">
						<td><a href="cracktros.cfm?mode=file&amp;value=Y">Y</a></td>
						<td><a href="cracktros.cfm?mode=file&amp;value=Z">Z</a></td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</cfif>			
	</cffunction>
	
	<cffunction name="packs" access="public" returntype="string" hint="Displays random cracktro screen captures">
		<cfquery name="filePackA" datasource="#application.dataSource#" cachedwithin="#application.cracktroTimeOut#">
			SELECT * FROM filepacks WHERE id = 2
		</cfquery>
		<cfquery name="filePackB" datasource="#application.dataSource#" cachedwithin="#application.cracktroTimeOut#">
			SELECT * FROM filepacks WHERE id = 6
		</cfquery>
		<cfoutput query="filePackA">
			<table cellpadding="0" cellspacing="0" class="boxCrack22"><tr><td>
				<div class="boxCrack23">
					<cfif nolocal EQ TRUE><cfset downloadAttr="downloads;#filename#;#filesize#;nolocal;#fulltitle#">
					<cfelse><cfset downloadAttr="downloads;#filename#;#filesize#;#fulltitle#">
					</cfif>		
					<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="#downloadAttr#" returnvariable="downloadAttr">	
					<a href='download.cfm?#downloadAttr#'>#fulltitle#</a><br />
					#summarydes#<br />
					Last revised on #dateFormat(lastrevised,"d-mmmm, yyyy")#<br />
					Compressed at #numberformat(filesize/1024,"_____._")# MB<br />
				</div></td>
				<td style="width:164px;"><img src="images/cracktro-scenes/razor-inst-chip02.png" alt="Razor Cracktro" class="boxCrack24" /></td>
				<td style="width:164px;"><img src="images/cracktro-scenes/dvn99grk.png" alt="Divine Cracktro" class="boxCrack24" /></td>
			</tr></table>
		</cfoutput>
		<cfoutput query="filePackB">
			<table cellpadding="0" cellspacing="0" class="boxCrack22"><tr><td>
				<div class="boxCrack23">
					<cfif nolocal EQ TRUE><cfset downloadAttr="downloads;#filename#;#filesize#;nolocal;#fulltitle#">
					<cfelse><cfset downloadAttr="downloads;#filename#;#filesize#;#fulltitle#">
					</cfif>
					<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="#downloadAttr#" returnvariable="downloadAttr">	
					<a href='download.cfm?#downloadAttr#'>#fulltitle#</a><br />
					#summarydes#<br />
					Last revised on #dateFormat(lastrevised,"d-mmmm, yyyy")#<br />
					Compressed at #numberformat(filesize/1024,"_____._")# MB<br />
				</div></td>
				<td style="width:164px;"><img src="images/cracktro-scenes/class-orcus_Install.png" alt="Class Installer" class="boxCrack24" /></td>
				<td style="width:164px;"><img src="images/cracktro-scenes/class-xmas2001-Installer.png" alt="Class Xmas Installer" class="boxCrack24" /></td>
			</tr></table>		
		</cfoutput>
		<cfoutput>
			<table cellpadding="0" cellspacing="0" class="boxCrack25"><tr><td>
				<div class="boxCrack23" style="color:##FFFFFF;">
					<cfset downloadAttr1="downloads;SceneFantasy-Beta.zip;1089;Scene Fantasy Legend Beta">
					<cfset downloadAttr2="downloads;SceneFantasyDemo-CLASS.zip;174;Scene Fantasy Legend Demo">
					<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="#downloadAttr1#" returnvariable="downloadAttr1">
					<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="#downloadAttr2#" returnvariable="downloadAttr2">
					This was a Nintendo style platform game developed by Class and was intended to be themed around the scene.
					The game unfortunately never made it past beta.<br />
					<a href="download.cfm?#downloadAttr1#">Download Beta</a> - (1089kb) [17th Sep 1999]<br />
					<a href="download.cfm?#downloadAttr2#">Download Preview</a> - (174kb) [17th July 1999]
				</div></td>
				<td style="width:330px;"><img src="images/sfl3.png" alt="Scene Fantasy Legend" /></td>
			</tr></table>	
		</cfoutput>	
	</cffunction>
	
	<cffunction name="randomCapture" access="public" returntype="string" hint="Displays random cracktro screen captures">
		<cfset var cracktroNumber=randRange(1,7)>
		<div class="boxCrack01">
		<cfswitch expression="#cracktroNumber#">
			<cfcase value="7"><img src="images/cracktro-scenes/firm8901.png" alt="FiRM cracktro" /><div class="boxCrack02">An early FiRM cracktro (circa 1989)</div></cfcase>
			<cfcase value="6"><img src="images/cracktro-scenes/bsp801.png" alt="Bently Sidewells Production cracktro" /><div class="boxCrack02">An early Bently Sidewell Productions cracktro (circa 1988)</div></cfcase>
			<cfcase value="5"><img src="images/cracktro-scenes/cia801.png" alt="Crackers In Action cracktro" /><div class="boxCrack02">An early Crackers In Action cracktro (circa 1988)</div></cfcase>
			<cfcase value="4"><img src="images/cracktro-scenes/fbi901.png" alt="Future Brain Inc cracktro" /><div class="boxCrack02">A Future Brain Inc cracktro (circa 1989)</div></cfcase>
			<cfcase value="3"><img src="images/cracktro-scenes/humble!.png" alt="The Humble Guys cracktro" /><div class="boxCrack02">A Humble Guys cracktro (circa 1990)</div></cfcase>
			<cfcase value="2"><img src="images/cracktro-scenes/inc101.png" alt="International Network of Crackers cracktro" /><div class="boxCrack02">An overly plasma INC cracktro (circa 1991)</div></cfcase>
			<cfcase value="1"><img src="images/cracktro-scenes/matpoise.png" alt="Razor 1911 cracktro" /><div class="boxCrack02">A Razor 1911 cracktro (circa 1992)</div></cfcase>
		</cfswitch>
		</div>
	</cffunction>
	
</cfcomponent>