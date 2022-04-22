<cfcomponent>

	<cffunction name="banners" access="public" returntype="string" hint="Displays the web banners collection">
		<div class="boxGroup13">
			<img src="images/banners/acid-banner.gif" alt="Acid banner" /><br />
			ACiD Productions - 1998 - www.acid.org
		</div>
		<div class="boxGroup13">
			<img src="images/banners/artcore-banner.gif" alt="Artcore banner" /><br />
			Artcore - 1998 - www.artcore.org
		</div>
		<div class="boxGroup13">
			<img src="images/banners/atm-banner.jpg" alt="ATM banner" /><br />
			ATM The Coder - 1998 - www.mygale.org/~atm9x
		</div>
		<div class="boxGroup13">
			<img src="images/banners/chemicalreaction-banner.jpg" alt="Chemical Reaction banner" /><br />
			Chemical Reaction - 1998 - www.creaction.com
		</div>
		<div class="boxGroup13">
			<img src="images/banners/core-banner.gif" alt="Core banner" /><br />
			Core - 1998 - coremongos.home.ml.org
		</div>		
		<div class="boxGroup13">
			<img src="images/banners/council-banner.gif" alt="Council banner" /><br />
			The Council - 1998 - www.the-council.org
		</div>
		<div class="boxGroup13">
			<img src="images/banners/devotion-banner.gif" alt="Devotion banner" /><br />
			Devotion - 1998 - www.devotion.pp.se
		</div>
		<div class="boxGroup13">
			<img src="images/banners/df2-banner.jpg" alt="DF2 banner" /><br />
			Defacto2 - 1998 - www.defacto2.net
		</div>
		<div class="boxGroup13">
			<img src="images/banners/dod-banner.jpg" alt="DOD banner" /><br />
			Drink Or Die - 1998 - www.drinkordie.com
		</div>
		<div class="boxGroup13">
			<img src="images/banners/fairlight-banner.gif" alt="Fairlight banner" /><br />
			Fairlight - 1998 - www.fairlight.org</div>
		<div class="boxGroup13">
			<img src="images/banners/hetero-banner.jpg" alt="Hetero banner" /><br />
			Hetro's Personal Page - 1998 - www.hetro.home.ml.org
		</div>
		<div class="boxGroup13">
			<img src="images/banners/razor-banner.gif" alt="Razor 1911 banner" /><br />
			Razor 1911 - 1998 - www.razor1911.com
		</div>
		<div class="boxGroup13">
			<img src="images/banners/rebels-banner.gif" alt="Rebels banner" /><br />
			Rebels PC - 1998 - www.rebels.org
		</div>
		<div class="boxGroup13">
			<img src="images/banners/trg-banner.gif" alt="TRG banner" /><br />
			Game-Over.net - 1998 - www.game-over.net
		</div>
		<div class="boxGroup13">
			<img src="images/banners/trsi-banner.gif" alt="TRSI banner" /><br />
			Tri-Red Star Incorporation - 1998 - www.trsi.de
		</div>
		<div class="boxGroup13">
			<img src="images/banners/paradigm-banner.GIF" alt="Paradigm banner" /><br />
			Paradigm - 1999 - www.pdmworld.com
		</div>
		<div class="boxGroup13">
			<img src="images/banners/paradox-banner.jpg" alt="Paradox banner" /><br />
			Paradox - 1999 - www.paradogs.com
		</div>
		<div class="boxGroup13">
			<img src="images/banners/prestige-banner.GIF" alt="Prestige banner" /><br />
			Prestige - 1999 - laker.net/prestige/
		</div>
		<div class="boxGroup13">
			<img src="images/banners/sac-banner.GIF" alt="SAC banner" /><br />
			Superior Art Creations - 1999 - come.to/sac/
		</div>
		<div class="boxGroup13">
			<img src="images/banners/lightforce-banner.GIF" alt="Lightforce banner" /><br />
			Lightforce - 1999 - www.thelightforce.home.ml.org
		</div>
		<div class="boxGroup13">
			<img src="images/banners/anthrox-banner.GIF" alt="Anthorx banner" /><br />
			Anthrox - 1999 - www.anthrox.com
		</div>
		<div class="boxGroup13">
			<img src="images/banners/dextrose-banner.GIF" alt="Dextrose banner" /><br />
			Dextrose - 1999 - www.dextrose.com
		</div>
		<div class="boxGroup13">
			<img src="images/banners/quartex-banner.GIF" alt="Quartex banner" /><br />
			Quartex - 1999 - www.giga.com.ar/randy
		</div>
		<div class="boxGroup13">
			<img src="images/banners/scoopex-banner.GIF" alt="Scoopex banner" /><br />
			Scoopex - 1999 - dorit.ihi.ku.dk/~scoopex/
		</div>
		<div class="boxGroup13">
			<img src="images/banners/shining8-banner.GIF" alt="Shining8 banner" /><br />
			Shining Eight - 1999 - user.baden-online.de/~Evrockenb/
		</div>
		<div class="boxGroup13">
			<img src="images/banners/supplex-banner.GIF" alt="Supplex banner" /><br />
			Supplex - 1999 - www.supplex.com <br />
		</div>
	</cffunction>
	
	<cffunction name="detail" access="public" returntype="string" hint="Displays a repository group biography">
		<cfargument name="group" required="yes" hint="Group's name stored in database">
		<cfquery name="RS9" datasource="#application.groupSource#">
			SELECT idName,clicks FROM repositorygroupdetail WHERE idName = '#group#'
		</cfquery>
		<cfoutput>
			<cfif IsDefined("RS9.idName") AND RS9.idName NEQ "">
				<cfquery datasource="#application.groupSource#">
				<!--- lock the counter increase to stop race conditions --->
				<cflock scope="application" type="exclusive" timeout="5">
					<cfif RS9.Clicks EQ "">
						<!--- if the current id has no views, then start with 1 --->
						UPDATE repositorygroupdetail SET Clicks=1
						WHERE idName='#group#'
					<cfelse>
						<!--- if the current id is an integer, then increase it --->
						UPDATE repositorygroupdetail SET Clicks=#IncrementValue(RS9.Clicks)#
						WHERE idName='#group#'
					</cfif>
					</cflock>
				</cfquery>
			<cfelse>
				There is an error in the url supplied.<br />
				<cfabort>
			</cfif>
		</cfoutput>
		<cfquery name="RS1" datasource="#application.groupSource#" cachedwithin="#application.groupsTimeOut#">
			SELECT * FROM repositorygroupdetail WHERE idName = '#group#'
		</cfquery>
		<cfquery name="RS2" datasource="#application.crackSource#" cachedwithin="#application.groupsTimeOut#">
			SELECT Count(CreatedFor) AS sum FROM cracktros WHERE CreatedFor = '#RS1.cracktroLink#'
		</cfquery>
		<cfquery name="RS3" datasource="#application.groupSource#" cachedwithin="#application.groupsTimeOut#">
			SELECT * FROM repositoryfiles WHERE org = '#group#' ORDER BY type,dateYear,dateMonth,dateDay,fileName ASC
		</cfquery>
		<cfoutput>
		<cfif RS1.completeName NEQ "">
			<!--- group logo --->
			<cfif fileExists(expandPath('groups/#RS1.idName#/logo.jpg')) EQ 'Yes'>
				<div class="boxGroup14">
					<img src="groups/#RS1.idName#/logo.jpg" alt="#RS1.completeName# logo" class="groupLogo" />
				</div>
			<cfelseif fileExists(expandPath('groups/#RS1.idName#/logo.gif')) EQ 'Yes'>
				<div class="boxGroup14">
					<img src="groups/#RS1.idName#/logo.gif" alt="#RS1.completeName# logo" class="groupLogo" />
				</div>
			<cfelseif fileExists(expandPath('groups/#RS1.idName#/logo.png')) EQ 'Yes'>
				<div class="boxGroup14">
					<img src="groups/#RS1.idName#/logo.png" alt="#RS1.completeName# logo" class="groupLogo" />
				</div>
			</cfif>
			<!--- group name, year and additional heading information --->
			<h1 class="boxGroup15">#RS1.completeName#.</h1>
			<div class="boxGroup16">#RS1.yearFounded#<cfif RS1.yearFounded NEQ RS1.yearDisbanded>-#RS1.yearDisbanded#</cfif> <cfif RS1.yearAdditional NEQ "">& #RS1.yearAdditional#</cfif> (#RS1.groupType#)</div>
			<cfif RS1.otherName NEQ ""><div class="boxGroup16">#RS1.otherName#</div></cfif>
			<!--- history.cfm file --->
			<cfif FileExists(ExpandPath('groups/#RS1.idName#/history.cfm')) EQ 'Yes'>
				<cfdirectory action="list" filter="history.cfm" name="historyRev" listinfo="yes" recurse="no" directory="#ExpandPath('groups/#RS1.idName#/')#">
				<cfloop query="historyRev"><div class="arial fs10 left">Text revised #DateFormat(ParseDateTime(historyRev.dateLastModified),'d mmmm, yyyy')#</div></cfloop>
				<cfsavecontent variable="writtenHistory"><cfinclude template="../groups/#RS1.idName#/history.cfm"></cfsavecontent>
				<cfif left(writtenHistory,8) NEQ "revision">
					<div style="padding-top:6px; text-align:left">#writtenHistory#</div>
				<cfelse>
					<div class="left">#writtenHistory#</div>
				</cfif>
			<cfelse>
				<div class="boxGroup17">There is currently no detailed history written about this group</div>
			</cfif>
			<div class="boxGroup18">
				<cfif #RS2.sum# GT 0>
					<!--- display number of cracktros --->
					<div class="boxGroup19">We have <span class="bold arial green">#RS2.sum#</span> listed <a href="cracktros.cfm?mode=group&value=#URLEncodedFormat(RS1.cracktroLink)#" title="Goto The Scene Archive #RS1.completeName# cracktro collection">#RS1.completeName# production<cfif #RS2.sum# NEQ 1>s</cfif></a> in our cracktro section</div>
				</cfif>
				<cfif #RS1.currentWebpageURL# NEQ "">
					<!--- group webpage --->
					Web site: <a href="#RS1.currentWebpageURL#" title="Goto the official #RS1.completeName# web site">#RS1.currentWebpageURL#</a><br />
				</cfif>
				<cfif #RS1.archivedWebpageURL# NEQ "">
					<!--- archived group webpage --->
					Archived web site: <a href="#RS1.archivedWebpageURL#" title="Goto an archived snapshot of an old #RS1.completeName# web site">http://www.defacto2.net/#RS1.archivedWebpageURL#</a><br />
				</cfif>
				<cfif #RS1.currentWebpageURL# NEQ "" OR #RS1.archivedWebpageURL# NEQ ""><div style="margin-top:6px;"><cfelse><div></cfif>
				<!--- search defacto2 --->
				<a href="http://www.google.com/custom?domains=www.defacto2.net&q=#RS1.completeName#&sitesearch=www.defacto2.net&sa=Search&client=pub-REMOVED&forid=1&ie=ISO-8859-1&oe=ISO-8859-1&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A67%3BLW%3A800%3BL%3Ahttp%3A%2F%2Fwww.defacto2.net%2Fimages%2Fdf2-google.gif%3BS%3Ahttp%3A%2F%2Fwww.defacto2.net%3BFORID%3A1%3B&hl=en" title="Search through Defacto2 for all references of #RS1.completeName#">Search our site</a> using Google WebSearch for any references of #RS1.completeName#<br />
				<!--- search other web sources such as Google, Pouet --->
				Search other sources:  <cfif #RS1.wikipediaLink# EQ ""><a href="http://en.wikipedia.org/w/index.php?title=Special%3ASearch&search=%22#URLEncodedFormat(RS1.completeName)#+warez%22&fulltext=Search" title="Search the Wikipedia encyclopedia for #RS1.completeName# references">Wikipedia</a>, </cfif><a href="http://www.pouet.net/search.php?what=#URLEncodedFormat(RS1.completeName)#&type=group" title="Search the demo scene site Pouet for #RS1.completeName# references">Pouet.net</a>, <a href="http://www.google.com/search?hl=en&q=&quot;#URLEncodedFormat(RS1.completeName)#&quot;&btnG=Google+Search" title="Search Google for any references of #RS1.completeName#">Google</a>
				<!--- wikipedia article link --->
				<cfif #RS1.wikipediaLink# NEQ "">
					<br /><a href="#RS1.wikipediaLink#" title="Goto the #RS1.completeName# Wikipedia encyclopedia article">Wikipedia the free online encyclopedia has an article on #RS1.completeName#</a>
				</cfif>
				<!--- scene timeline link --->
				<br /><a href="timeline.cfm?startMonth=1&startYear=#RS1.yearFounded#&endMonth=12&endYear=#RS1.yearDisbanded#&events=true&nfo=false&magazines=true&display=Submit&docText=true&docNonPC=true" title="Goto the Scene Timeline">The Scene Timeline</a> during #RS1.completeName#'s lifetime, #RS1.yearFounded#<cfif RS1.yearDisbanded NEQ RS1.yearFounded>-#RS1.yearDisbanded#</cfif>
				</div>
			<!--- NFO links (ISONews) (NFOrce) --->
			<cfif IsDefined("RS1.isonewsLink") AND IsDefined("RS1.nforceLink") AND #RS1.isonewsLink# NEQ "" AND #RS1.nforceLink# NEQ "">
				<div class="boxGroup19">
					The web sites <a href="#RS1.nforceLink#" title="Goto the NFOrce web site">NFOrce</a> and <a href="#RS1.isonewsLink#" title="Goto the ISONews web site">ISONews</a> also have collections of more recent #RS1.completeName# NFO files
				</div>
			<cfelseif IsDefined("RS1.nforceLink") AND #RS1.nforceLink# NEQ ""> 
				<div class="boxGroup19">
					The web site <a href="#RS1.nforceLink#" title="Goto the NFOrce web site">NFOrce</a> has collection of more recent #RS1.completeName# NFO files
				</div>
			<cfelseif IsDefined("RS1.isonewsLink") AND #RS1.isonewsLink# NEQ ""> 
				<div class="boxGroup19">
					The web site <a href="#RS1.isonewsLink#" title="Goto the ISONews web site">ISONews</a> has collection of more recent #RS1.completeName# NFO files
				</div>
			</cfif>
			</div>
		<cfelse>
			<div class="boxGroup17">This group is currently not in our database, but it maybe be added at a future date</div>
		</cfif>
    	<!--- Google Advert --->
      <div style="margin:20px;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="group-detail"></div>
		</cfoutput>
	</cffunction>
	
	<cffunction name="file" access="public" returntype="string" hint="Records the view/download of a file before forwarding the browser to it">
		<cfargument name="file" required="yes" type="numeric" hint="ID of the file">
		<cfargument name="format" required="no" type="string" hint="Format display of the output">
			<cfquery name="RS1" datasource="#application.groupSource#">
				SELECT * FROM repositoryfiles WHERE id = #file#
			</cfquery>
			<cfif RS1.clicks EQ "">
				<cfset count=1>
			<cfelse>
				<cfset count=IncrementValue(RS1.clicks)>
			</cfif>
			<cfquery name="RS2" datasource="#application.groupSource#">
				UPDATE repositoryfiles SET clicks=#count# WHERE id=#file#
			</cfquery>
			<cfif format EQ "gif">
				<cflocation addtoken="no" url="groups/#RS1.org#/#Left(RS1.fileName,(len(RS1.fileName)-4))#.gif">
			<cfelseif format EQ "png">
				<cflocation addtoken="no" url="groups/#RS1.org#/#Left(RS1.fileName,(len(RS1.fileName)-4))#.png">
			<cfelse>
				<cflocation addtoken="no" url="groups/#RS1.org#/#RS1.fileName#">
			</cfif>
	</cffunction>

	<cffunction name="fileList" access="public" returntype="string" hint="Displays the files associated with a repository group listing">
		<cfargument name="group" required="yes" hint="Group's name stored in database">
		<cfargument name="display" default="all" required="no" hint="Filters the files to display">
		<cfquery name="RS1" datasource="#application.groupSource#" cachedwithin="#application.groupsTimeOut#">
			SELECT cracktroLink,completeName FROM repositorygroupdetail WHERE idName = '#group#'
		</cfquery>
		<cfquery name="RS3" datasource="#application.groupSource#" cachedwithin="#application.groupsTimeOut#">
			SELECT Count(org) AS sum FROM repositoryfiles WHERE org = '#group#'<cfif display NEQ "all"> AND type = '#display#'</cfif>
		</cfquery>
		<cfquery name="RS4" datasource="#application.groupSource#" cachedwithin="#application.groupsTimeOut#">
			SELECT DISTINCT type FROM repositoryfiles WHERE org = '#group#' ORDER BY type ASC
		</cfquery>
		<cfquery name="RS5" datasource="#application.groupSource#" cachedwithin="#application.groupsTimeOut#">
			SELECT SUM(Clicks) AS downloadTotal FROM repositoryfiles WHERE org = '#group#'<cfif display NEQ "all"> AND type = '#display#'</cfif>
		</cfquery>		
		<cfif RS1.completeName NEQ "">
			<cfoutput>
			<cfset groupFileTotal=RS3.sum>
			<cfset groupFileCount=-1>
			<a name="files"></a>
			<!--- file filter menu --->
			<cfif RS5.downloadTotal EQ ""><cfset RS5.downloadTotal=0></cfif>
			<cfinvoke component="utilities" method="numberConvert" number="#RS5.downloadTotal#" format="comma" returnvariable="downloadTotalFormated">
			<table cellpadding="0" cellspacing="0" class="boxGroup09" style="margin-top:10px;"><tr>
				<td style="width:50%;"><div class="boxGroup10">#groupFileTotal# repository files with #downloadTotalFormated# downloads</div></td>
				<td style="background-color:##C7C8FC; width:50%;">
					<div class="boxGroup25">
						<cfif RS4.recordCount GT 0>
							filter: <a href="groups.cfm?mode=detail&amp;org=#group#&amp;display=all##files"<cfif display EQ 'all'> style="text-decoration:underline;"</cfif> title="Show all #RS1.completeName# related files">display all</a>, <cfloop query="RS4"><a href="groups.cfm?mode=detail&amp;org=#group#&amp;display=#RS4.type###files"<cfif display EQ '#RS4.type#'> style="border-bottom:1px solid ##666666;"</cfif> title="Show only #RS1.completeName# #RS4.type# files">#RS4.type#</a><cfif RS4.currentrow NEQ RS4.recordcount>, </cfif></cfloop>
						</cfif>
					</div>
				</td></tr>
			</table>
			<!--- file listings (split left and right panes --->
			<div style="padding-top:10px; vertical-align:top;">
				<cfinvoke component="groups" method="fileListContent" group="#group#">
			</div>
		</cfoutput>
	  </cfif>
	</cffunction>
	
	<cffunction name="fileListContent" access="public" returntype="string" hint="see 'fileList'">
		<cfargument name="alignment" required="no" default="left" hint="pane alignment, left or right">
		<cfargument name="group" required="yes" hint="Group's name stored in database">
		<cfquery name="RS1" datasource="#application.groupSource#" cachedwithin="#application.groupsTimeOut#">
			SELECT * FROM repositorygroupdetail WHERE idName = '#group#'
		</cfquery>
		<cfquery name="RS3" datasource="#application.groupSource#" cachedwithin="#application.groupsTimeOut#">
			SELECT * FROM repositoryfiles WHERE org = '#group#'<cfif display NEQ "all"> AND type = '#display#'</cfif> ORDER BY type,dateYear,dateMonth,dateDay,fileName ASC
		</cfquery>
		<cfoutput query="RS3">
			<!--- look for a image thumbnail --->
			<cfif FileExists(ExpandPath('groups/#RS1.idName#/thumb_#RS3.fileName#')) EQ 'Yes'><cfset thumbType="same">
			<cfelseif FileExists(ExpandPath('groups/#RS1.idName#/thumb_#spanExcluding(RS3.fileName,'.')#.gif')) EQ 'Yes'><cfset thumbType="gif">
			<cfelseif FileExists(ExpandPath('groups/#RS1.idName#/thumb_#spanExcluding(RS3.fileName,'.')#.png')) EQ 'Yes'><cfset thumbType="png">
			<cfelse><cfset thumbType="">
			</cfif>
			<!--- file information --->
			<div style="
				width:100%;
				border-top:1px solid ##F0F0F0;
				border-bottom:1px dashed ##F0F0F0;
				margin-bottom:6px;
				text-align:left;
				font-family:Verdana, Arial, Helvetica, sans-serif;
				font-size:12px;
				padding:4px;
				">
				<table cellpadding="0" cellspadding="0">
					<tr>
						<td style="width:200px;">
						<cfif thumbType NEQ "">
						<!--- thumbnail images --->
							<cfif thumbType EQ "same"><img src="groups/#RS1.idName#/thumb_#RS3.fileName#" style="margin:4px;" alt="#RS3.fileName#" />
							<cfelseif thumbType EQ "gif"><img src="groups/#RS1.idName#/thumb_#spanExcluding(RS3.fileName,'.')#.gif" style="margin:4px;" alt="#RS3.fileName#" />
							<cfelseif thumbType EQ "png"><img src="groups/#RS1.idName#/thumb_#spanExcluding(RS3.fileName,'.')#.png" style="margin:4px;" alt="#RS3.fileName#" />
							</cfif>
						</cfif>
						</td>
						<td style="vertical-align:top;">
						<!--- file name --->
						<span style="float:left; width:80px; font-size:10px;">file:
						<!--- new! graphic --->
						<cfif RS3.DateAdded NEQ "">
							<cfif dateDiff('d', parseDateTime(RS3.DateAdded), now()) LTE application.daysNew><img src="images/new!.gif" alt="New!" style="float:right; margin-right:5px;" /></cfif>
						</cfif>
						</span>
						<cfif thumbType NEQ "same" AND FileExists(ExpandPath('groups/#RS1.idName#/#Left(RS3.fileName,(Len(RS3.fileName)-4))#.gif')) EQ 'Yes' AND #LCase(RS3.fileName)# NEQ '#LCase(spanExcluding(RS3.fileName,'.'))#.gif'>
							<a href="groups.cfm?mode=#RS3.id#&format=gif">#spanExcluding(RS3.fileName,'.')#.gif</a> or <a href="groups.cfm?mode=#RS3.id#">#LCase(RS3.fileName)#</a><br />
						<cfelseif thumbType NEQ "same" AND FileExists(ExpandPath('groups/#RS1.idName#/#Left(RS3.fileName,(Len(RS3.fileName)-4))#.png')) EQ 'Yes' AND #LCase(RS3.fileName)# NEQ '#LCase(spanExcluding(RS3.fileName,'.'))#.png'>
							<a href="groups.cfm?mode=#RS3.id#&format=png">#spanExcluding(RS3.fileName,'.')#.png</a> or <a href="groups.cfm?mode=#RS3.id#">#LCase(RS3.fileName)#</a><br />
						<cfelse>
							<a href="groups.cfm?mode=#RS3.id#">#LCase(RS3.fileName)#</a><br />
						</cfif>
						<table cellpadding="0" cellspadding="0" style=" background-color:##FBFBFB; padding:2px; margin-top:2px; margin-bottom:2px;">
						<tr><td style="width:90px; text-align:left; font-size:10px;">
						published:</td><td style="width:150px;">
						<!--- date published --->
						<cfif #RS3.dateDay# NEQ "0" OR #RS3.dateMonth# NEQ "0" OR #RS3.dateYear# NEQ "0">
							<cfif IsDefined("RS3.dateDay") AND RS3.dateDay NEQ "0" AND RS3.dateDay NEQ "">
							<cfinvoke component="utilities" method="numberConvert" number="#RS3.dateDay#" format="oral" returnvariable="dayDateFormated">
							#dayDateFormated# </cfif>
							<cfif RS3.dateMonth NEQ "0">#Left(MonthAsString(RS3.dateMonth),3)#, </cfif>
							<cfif RS3.dateYear NEQ "0">#RS3.dateYear#</cfif>
						</cfif>
						</td><td style="width:90px; text-align:left; font-size:10px;">
						<!--- type of file --->
						type:
						</td><td style="width:130px;">
						#RS3.type#</td>
						<!--- number of downloads --->
						<td style="width:90px; text-align:left; font-size:10px;">downloads:
						</td><td style="width:130px;">
						<cfif RS3.clicks NEQ "">
						<cfinvoke component="utilities" method="numberConvert" number="#RS3.clicks#" format="comma" returnvariable="clicksFormated">
						#clicksFormated#
						<cfelse>0</cfif>
						</td></tr></table>
						<!--- description --->
						<cfif RS3.description NEQ ""><span style="font-size:12px; font-style:italic; color:##CC6633;">#RS3.description#</span><br /></cfif>
						</td>
					</tr>
				</table>
				</div>
		</cfoutput>
	</cffunction>

	<cffunction name="list" access="public" returntype="string" hint="Displays a listing of the groups">
		<cfset var yearLoop="0000">
		<cfset var alphaLoop="">
		<cfquery name="RS1" datasource="#application.groupSource#" cachedwithin="#application.groupsTimeOut#">
			SELECT * FROM repositorygroupdetail ORDER BY #URL.sort#,completeName ASC
		</cfquery>
		<table cellpadding="0" cellspacing="0" class="boxGroup02">
			<cfoutput query="RS1">
				<cfif yearLoop NEQ RS1.yearFounded AND url.sort EQ "yearFounded">
					<!--- year dividers if sorting by year --->
					<tr>
					<cfif RS1.currentrow NEQ 1>
						<td><div class="boxGroup03">#RS1.yearFounded# <span class="fs10 verdana black" style="vertical-align:top;">(<a href="timeline.cfm?startMonth=1&startYear=#RS1.yearFounded#&endMonth=12&endYear=#RS1.yearFounded#&events=true&nfo=true&magazines=true&display=Submit&docText=true&docNonPC=true" title="Goto the Scene Timeline for #RS1.yearFounded#">TL</a>)</span></div></td>
						<td class="boxGroup04"><div class="boxGroup05">&nbsp;</div></td>
						<td class="boxGroup04"><div class="boxGroup05">&nbsp;</div></td>
						<td class="boxGroup04"><div class="boxGroup05">&nbsp;</div></td>					
					<cfelse>
						<td><div class="boxGroup03" style="border-top:none;">#RS1.yearFounded# <span class="fs10 verdana black" style="vertical-align:top;">(<a href="timeline.cfm?startMonth=1&startYear=#RS1.yearFounded#&endMonth=12&endYear=#RS1.yearFounded#&events=true&nfo=true&magazines=true&display=Submit&docText=true&docNonPC=true" title="Goto the Scene Timeline for #RS1.yearFounded#">TL</a>)</span></div></td>
						<td class="boxGroup04">&nbsp;</td>
						<td class="boxGroup04">&nbsp;</td>
						<td class="boxGroup04">&nbsp;</td>					
					</cfif>
					</tr>
					<cfset yearLoop=RS1.yearFounded>
				</cfif>			
				<cfif (alphaLoop NEQ left(RS1.completeName,1) AND url.sort EQ "completeName") OR (url.sort EQ "acronym" AND alphaLoop NEQ left(RS1.acronym,1))>
					<!--- alphabet dividers if sorting by acronym or name --->
					<tr>
					<cfif RS1.currentrow NEQ 1>
						<td><div class="boxGroup03">#ucase(left(evaluate("RS1.#url.sort#"),1))#</div></td>
						<td class="boxGroup04"><div class="boxGroup05">&nbsp;</div></td>
						<td class="boxGroup04"><div class="boxGroup05">&nbsp;</div></td>
						<td class="boxGroup04"><div class="boxGroup05">&nbsp;</div></td>					
					<cfelse>
						<td><div class="boxGroup03" style="border-top:none;">#ucase(left(evaluate("RS1.#url.sort#"),1))#</div></td>
						<td class="boxGroup04">&nbsp;</td>
						<td class="boxGroup04">&nbsp;</td>
						<td class="boxGroup04">&nbsp;</td>					
					</cfif>
					</tr>
					<cfset alphaLoop="#ucase(left(evaluate("RS1.#url.sort#"),1))#">
				</cfif>				
				<tr class="arial fs14">
					<td>
					<cfif url.sort NEQ "yearFounded" AND RS1.currentrow EQ 1>
						<div class="boxGroup06" style="margin-top:6px;"><div class="boxGroup06"><a href="groups.cfm?mode=detail&amp;org=#RS1.idName#" title="Goto the #RS1.completeName# repository">#RS1.completeName#</a></div></td>
						<td class="boxGroup07"><div class="boxGroup08" style="margin-top:6px;"><cfif RS1.acronym EQ "">&nbsp;<cfelse>#ucase(RS1.acronym)#</cfif></div></td>
						<td class="boxGroup07"><div class="boxGroup08" style="margin-top:6px;">#RS1.yearFounded#<cfif RS1.yearFounded neq RS1.yearDisbanded>-#RS1.yearDisbanded#</cfif> <cfif RS1.yearAdditional neq "">&amp; #RS1.yearAdditional#</cfif></div></td>
						<td class="boxGroup07"><div class="boxGroup08" style="font-size:10px; margin-top:6px;"><cfif RS1.clicks NEQ "">#RS1.clicks#<cfelse>0</cfif></div></td>			
					<cfelse>
						<div class="boxGroup06"><a href="groups.cfm?mode=detail&amp;org=#RS1.idName#" title="Goto the #RS1.completeName# repository">#RS1.completeName#</a></div></td>
						<td class="boxGroup07"><div class="boxGroup08"><cfif RS1.acronym EQ "">&nbsp;<cfelse>#ucase(RS1.acronym)#</cfif></div></td>
						<td class="boxGroup07"><div class="boxGroup08">#RS1.yearFounded#<cfif RS1.yearFounded neq RS1.yearDisbanded>-#RS1.yearDisbanded#</cfif> <cfif RS1.yearAdditional neq "">&amp; #RS1.yearAdditional#</cfif></div></td>
						<td class="boxGroup07"><div class="boxGroup08" style="font-size:10px;"><cfif RS1.clicks NEQ "">#RS1.clicks#<cfelse>0</cfif></div></td>
					</cfif>
				</tr>
			</cfoutput>				
		</table>
	</cffunction>
	
	<cffunction name="orderForm" access="public" returntype="string" hint="Displays the form list to sort the order of the group">
		<cfquery name="RS1" datasource="#application.groupSource#" cachedwithin="#application.groupsTimeOut#">
			SELECT Count(idName) AS sum FROM repositorygroupdetail
		</cfquery>
		<cfquery name="RS2" datasource="#application.groupSource#" cachedwithin="#application.groupsTimeOut#">
			SELECT Count(id) AS sum FROM repositoryfiles
		</cfquery>		
		<cfoutput>
		<form action="groups.cfm" method="get" id="groupList" style="margin-bottom:0px;clear:both;">
		<table cellpadding="0" cellspacing="0" class="boxGroup09"><tr>
			<td style="width:50%;"><div class="boxGroup10">We have #RS1.sum# groups in our repository offering #RS2.sum# files</div></td>
			<td style="background-color:##C7C8FC; width:50%;">
				<div class="boxGroup11" style="margin-left:auto; margin-right:auto;">
					<select name="sort" size="1">
						<option value="yearFounded"<cfif url.sort eq "yearFounded"> selected="selected"</cfif>>Years</option>
						<option value="completeName"<cfif url.sort eq "completeName"> selected="selected"</cfif>>Name</option>
						<option value="acronym"<cfif url.sort eq "acronym"> selected="selected"</cfif>>Acronym</option>
					</select> <input type="submit" name="List" value="submit" />
				</div>
			</td></tr>
		</table>
		</form>
		</cfoutput>
	</cffunction>

	<cffunction name="webpages" access="public" returntype="string" hint="Displays both the web banners description, link as well as group webpage snapshot links">
		<cfquery name="RS1" datasource="#application.groupSource#" cachedwithin="#application.groupsTimeOut#">
			SELECT * FROM scenewebsites ORDER BY Year ASC, Month ASC, Date ASC, Description ASC
		</cfquery>
		<cfoutput>
		
		<div class="boxGroup12">
			<a href="groups.cfm?mode=banners" style="color:black; text-decoration:none;" title="View our collection of scene related web-banners">
			When the scene made the public move onto the Internet some groups thought it would be nice to have official group web pages.
			While many of these pages served no real purpose, they were popular never the less.
			Banners where sometimes exchanged with other similar pages to help increase visits to the home page.
			These days security is more paramount and groups do not bother with web pages.
			<br /><br />
			<img src="images/banners/df2-banner.jpg" style="border:0px;" alt="Random banner" /><br />
			</a>
		</div>
		
		<table cellpadding="0" cellspacing="0" class="boxGroup09" style="margin-bottom:6px;"><tr>
			<td><div class="boxGroup10">There are #RS1.recordcount# archived scene web sites</div></td>
			<td style="background-color:##C7C8FC">
				<div style="width:130px; padding:2px;">&nbsp;</div>
			</td></tr>
		</table>
		<cfloop query="RS1">
			<div class="left">
			<cfif RS1.DateAdded NEQ ""><cfif dateDiff('d', parseDateTime(RS1.DateAdded), now()) LTE application.daysNew><img src="images/new!.gif" alt="New!" /></cfif></cfif>
			<a href="#RS1.file#" title="Goto #RS1.description#'s archived web site">#RS1.description#</a></div>
			<div class="boxGroup26">Snapshot: <cfif IsNumeric(RS1.date) IS TRUE><cfinvoke component="utilities" method="numberConvert" number="#RS1.date#" returnvariable="RS1.date">#RS1.date#</cfif><cfif RS1.month GTE 1 AND RS1.month LTE 12><cfinvoke component="utilities" method="monthConvert" month="#RS1.month#" returnvariable="RS1.month">#RS1.month#</cfif> #RS1.year#</div>
			<cfif RS1.link NEQ ""><div class="boxGroup26"><a href="#RS1.Link#">more information</a></div></cfif>
			<div class="boxGroup27">#RS1.inDetail#</div>
		</cfloop>
		</cfoutput>
	</cffunction>
	
</cfcomponent>