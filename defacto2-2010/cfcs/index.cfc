<cfcomponent>

	<cffunction name="DF2Button" access="public" returntype="string" hint="Displays a Defacto2 button for web masters to use">
		<div class="link2us">Link To Us</div>
		<a href="http://www.defacto2.net"><img src="images\btn-df2.gif" style="border:0px;" alt="Defacto2 button (88*31)" title="Save our Defacto2 button for use on your web site" /></a>
	</cffunction>

	<cffunction name="extenalFeeds" access="public" returntype="string" hint="">
		<cfoutput>
			<cfset URLToPull="http://www.scene.org/news.rss.pxml?items=4">
			<cfhttp url="#URLToPull#" method="GET" timeout="3"></cfhttp>
			<cfset XMLContent=trim(cfhttp.filecontent)>
			<cfif IsDefined("XMLContent") AND XMLContent neq "">
				<cfset XMLContent=XMLParse(XMLContent)>
				<span class="bold verdana">#XMLContent.rss.channel.title.xmlText#</span><br />
				<div style="padding-left:9px;">
					<cfloop from="1" to="4"  index="idx">
						#DateFormat(XMLContent.rss.channel.item[idx].pubDate.xmlText,"dd-mmm")# <a href="#XMLContent.rss.channel.item[idx].link.xmlText#">#XMLContent.rss.channel.item[idx].title.xmlText#</a><br />
					</cfloop>
				</div>
			</cfif>
			<cfset URLToPull="http://www.pouet.net/export/lastprodsreleased.rss.php?howmany=4">
			<cfhttp url="#URLToPull#" method="GET" timeout="3"></cfhttp>
			<cfset XMLContent=trim(cfhttp.filecontent)>
			<cfset XMLContent=XMLParse(XMLContent)>
			<span class="bold verdana">#XMLContent.rss.channel.title.xmlText# Newest Releases</span><br />
			<div style="padding-left:9px;">
				<cfloop from="1" to="4"  index="idx">
					#DateFormat(XMLContent.rss.channel.item[idx].pubDate.xmlText,"dd-mmm")# <a href="#XMLContent.rss.channel.item[idx].link.xmlText#">#XMLContent.rss.channel.item[idx].title.xmlText#</a><br />
				</cfloop>
			</div>
			
			<cfset URLToPull="http://blog.ericgoldman.org/index.rdf">
			<cfhttp url="#URLToPull#" method="GET" timeout="3"></cfhttp>
			<cfset XMLContent=trim(cfhttp.filecontent)>
			<cfset XMLContent=XMLParse(XMLContent)>
			<span class="bold verdana">#XMLContent.rdf.channel.title.xmlText# Items</span><br />
			<div style="padding-left:9px;">
				<cfloop from="1" to="4"  index="idx">
					 <a href="#XMLContent.rdf.item[idx].link.xmlText#">#XMLContent.rdf.item[idx].title.xmlText#</a><br />
				</cfloop>
			</div>
						
		</cfoutput>
	</cffunction>

	<cffunction name="header" access="public" returntype="string" hint="Navigation header with site search box">
		<table cellpadding="0" cellspacing="0" class="boxIndex04">
			<tr><td>
				<span class="boxIndex05">
					<a href="site-info.cfm?mode=aboutdf2" title="Learn about who we are and our history">What is Defacto2?</a> <span class="boxIndexMenuDividers">•</span> <a href="site-upload.cfm" class="blackLink" title="Upload files onto our server for submission on Defacto2"><span class="bold black">Wanted + Upload Your Files</span></a> <span class="boxIndexMenuDividers">•</span> <a href="contact.cfm" title="Send us an e-mail">Contact Us</a> <span class="boxIndexMenuDividers">•</span> <a href="shop.cfm" title="Browse through a range of scene related products">Scene<span class="italic">Shop</span> Reviews</a> <span class="boxIndexMenuDividers">•</span> <a href="site-info.cfm?mode=credits">Contributors</a> <span class="boxIndexMenuDividers">•</span> <a href="site-map.cfm" title="Site-wide navigation links">Site Map</a>
				</span>
			</td><td>
				<form method="get" action="http://www.defacto2.net/search.cfm" style="margin-bottom:0px;padding:0px;">
					<fieldset style="border:0px; padding:0px; margin:0px;">
					<input type="hidden" name="domains" value="www.defacto2.net" />
					<input type="hidden" name="client" value="pub-REMOVED" />
					<input type="hidden" name="forid" value="1" />
					<input type="hidden" name="ie" value="UTF-8"></input>
					<input type="hidden" name="oe" value="UTF-8"></input>
					<input type="hidden" name="cof" value="GALT:#008000;GL:1;DIV:#336699;VLC:663399;AH:center;BGC:FFFFFF;LBGC:FFFFFF;ALC:0000FF;LC:0000FF;T:000000;GFNT:0000FF;GIMP:0000FF;LH:50;LW:597;L:http://www.defacto2.net/images/df21.gif;S:http://www.defacto2.net;FORID:11"></input>
					<input type="hidden" name="hl" value="en" />
					<input type="hidden" name="sitesearch" value="www.defacto2.net" />
					<input type="hidden" name="flav" value="0000"></input>
					<input type="hidden" name="sig" value="FwAbdqulm2v1f982"></input>
					<input type="text" name="q" size="20" maxlength="255" value="" alt="Search box" />
					<input type="submit" name="sa" value="Search" title="Search our site using Google Search" />
					</fieldset>
				</form>
			</td></tr></table>
		<cfinvoke component="advertising" method="GoogleAdSense" color="pink">
	</cffunction>
	
	<cffunction name="newestFiles" access="public" hint="Listing of the lastest files added to Defacto2">
		<div class="boxIndex06">
		<img src="images/index/newfiles.png" alt="New Files" title="New Files" class="indexLogos1st" />
		<cfinvoke component="cfcs.statistics" method="newestFiles" outputmode="table" limit="9">
		<div style="margin-top:6px; font-size:12px;">(<a href="site-info.cfm?mode=updates&amp;type=new&amp;display=files&amp;List=submit">more ..</a>)</div>
		</div>
	</cffunction>
	
	<cffunction name="thesceneportal" access="public" returntype="string" hint="The Scene Portal navigation box">
		<cfset var divider="">
		<cflock name="tspnavbox1" timeout="20" type="readonly">
			<cfquery name="RS1" datasource="#application.portalSource#" cachedwithin="#application.portalTimeOut#">
				SELECT * FROM thesceneportal WHERE disable = 0 ORDER BY id desc
			</cfquery>
		</cflock>
		<cflock name="tspnavbox2" timeout="20" type="readonly">
			<cfquery name="RS2" datasource="#application.portalSource#" cachedwithin="#application.portalTimeOut#">
				SELECT Count(*) AS total_Records FROM thesceneportal WHERE disable = 0
			</cfquery>
		</cflock>
        <cflock name="tspnavbox3" timeout="20" type="readonly">
			<cfquery name="RS3" datasource="#application.portalSource#" cachedwithin="#application.portalTimeOut#">
				SELECT CatDesc,CatName,CatURL FROM thesceneportalcategories
			</cfquery>
        </cflock>
		<cfoutput>
		<cfinvoke component="utilities" method="numberConvert" number="#DateFormat(RS1.date,'d')#" format="oral" returnvariable="recentDay">
		<div class="boxIndex08">
			<img src="images/index/tsp.png" alt="The Scene Portal" title="The Scene Portal" class="indexLogos" />
            <!--- 19/Feb/10 Replaced manual Portal listing with dynamic listing --->
			<ul class="boxPortalCat01">
            	<cfloop query="RS3"><li><a href="portal.cfm?category=#RS3.CatURL#&amp;sort=cat2" title="Goto The Scene Portal's #CatName# listing">#CatName#</a></li></cfloop>
            	
            <!---
				<li><a href="portal.cfm?category=art&amp;sort=cat2" title="Goto The Scene Portal's art and demo listing">Art and Demo Scenes</a></li>
				<li><a href="portal.cfm?category=Emulation&amp;sort=cat2" title="Goto The Scene Portal's emulation listing">Computer/Console Emulation</a></li>
				<li><a href="portal.cfm?category=Old School&amp;sort=cat2" title="Goto The Scene Portal's old school listing">Old School Scenes</a></li>
				<li><a href="portal.cfm?category=Gaming&amp;sort=cat2" title="Goto The Scene Portal's gaming listing">General Gaming</a></li>
				<li><a href="portal.cfm?category=Music&amp;sort=cat2" title="Goto The Scene Portal's music listing">Computer Music Scene</a></li>
        <li><a href="portal.cfm?category=Torrent&amp;sort=cat2" title="Goto The Scene Portal's torrent listing">Legal Scene Torrents</a></li>
        --->
			</ul>
			<div class="boxPortalCat02" style="letter-spacing:-1px;">
			The Scene Portal is a collection of #RS2.total_Records# categorised web links from around the Internet.
			Below are our most recent additions added on the #recentDay# of #DateFormat(RS1.date,'mmmm')#.
			</div>
			<cfset divider=RS1.date>
			<ul class="boxPortalCat01" style="font-size:12px; margin-top:8px;">
			<cfloop query="RS1">
				<cfif DateFormat(divider,'DD MMM YY') NEQ DateFormat(date,'DD MMM YY')><cfbreak></cfif>
				<li><a href="portal.cfm?id=#id#" title="#HTMLEditFormat(description)#">#name#</a></li>
				<cfset divider=date>
			</cfloop>
			</ul>
			</div>
		</cfoutput>
	</cffunction>
	
	<cffunction name="theSceneArchive" access="public" returntype="string" hint="The Scene Archive menus">	
		<div class="boxIndex08">
			<img src="images/index/tsa.png" alt="The Scene Archives" title="The Scene Archives" class="indexLogos" />	

			<table cellpadding="0" cellspacing="0" class="boxIndex09"><tr>
				<td class="indexTR01"><img src="images/index/index-box-left.png" alt="boxleft" /></td>
				<td class="indexTR02"><a href="groups.cfm" style="cursor:pointer;" title="Goto our group repository" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('groups','','images/index/groupsOver.gif',1)"><img src="images/index/groups.gif" alt="Group Repository" width="150" height="18" style="border:0px;" id="groups" /></a><img src="images/index/index-box-fill.png" alt="boxfill" style="width:37px; height:18px;" /></td>
				<td class="indexTR03"><img src="images/index/index-box-right.png" alt="boxright" /></td>
			</tr></table>
			<div class="indexTR04" style="letter-spacing:-1px;">
				Groups were the bread and butter of the scene and this is our section dedicated to them. This section is a repository for your favourite groups. Where you can find tidbits of information, random pieces of artwork, key NFO files, as well as interviews, documents and web pages.
			</div>
			
			<table cellpadding="0" cellspacing="0" class="boxIndex09"><tr>
				<td class="indexTR01"><img src="images/index/index-box-left.png" alt="boxleft" /></td>
				<td class="indexTR02"><a href="cracktros.cfm" style="cursor:pointer;" title="Goto our crack-intro collection" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('crack-intros','','images/index/cracktrosOver.gif',1)"><img src="images/index/cracktros.gif" alt="Crack-intros" style="border:0px;" id="crack-intros" /></a><img src="images/index/index-box-fill.png" alt="boxfill" style="width:37px; height:18px;" /></td>
				<td class="indexTR03"><img src="images/index/index-box-right.png" alt="boxright" /></td>
			</tr></table>
			<div class="indexTR04" style="letter-spacing:-1px;">
				Crack-intros are an important part of the scene giving programmers the opportunity to show off their talents to competing groups.
			</div>
			
			<table cellpadding="0" cellspacing="0" class="boxIndex09"><tr>
				<td class="indexTR01"><img src="images/index/index-box-left.png" alt="boxleft" /></td>
				<td class="indexTR02"><a href="bbs.cfm" style="cursor:pointer;" title="Goto our Bullentin Board System" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('bbs','','images/index/bbsOver.gif',1)"><img src="images/index/bbs.gif" alt="Bulletin Board Systems" width="150" height="18" style="border:0px;" id="bbs" /></a><img src="images/index/index-box-fill.png" alt="boxfill" style="width:37px; height:18px;" /></td>
				<td class="indexTR03"><img src="images/index/index-box-right.png" alt="boxright" /></td>
			</tr></table>
			<div class="indexTR04" style="letter-spacing:-1px;">
				Bulletin Board Systems were the focal point for communication on the scene. Groups would upload their releases to these BBSes and download their competitors'.
			</div>
			
			<table cellpadding="0" cellspacing="0" class="boxIndex09"><tr>
				<td class="indexTR01"><img src="images/index/index-box-left.png" alt="boxleft" /></td>
				<td class="indexTR02"><a href="documents.cfm" style="cursor:pointer;" title="Goto our document library" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('documents','','images/index/documentsOver.gif',1)"><img src="images/index/documents.gif" alt="Documents &amp; NFOs" width="150" height="18" style="border:0px;" id="documents" /></a><img src="images/index/index-box-fill.png" alt="boxfill" style="width:37px; height:18px;" /></td>
				<td class="indexTR03"><img src="images/index/index-box-right.png" alt="boxright" /></td>
			</tr></table>
			<div class="indexTR04" style="letter-spacing:-1px;">
				Text has given people the voices to spread what they need to say to hundreds or even thousands of people, easily and quickly. The text files listed below obviously have something in relation to the pirate scene.
			</div>
			
			<table cellpadding="0" cellspacing="0" class="boxIndex09"><tr>
				<td class="indexTR01"><img src="images/index/index-box-left.png" alt="boxleft" /></td>
				<td class="indexTR02"><a href="magazines.cfm?mode=code" style="cursor:pointer;" title="Goto our coded magazine collection" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('magazines','','images/index/magazinesOver.gif',1)"><img src="images/index/magazines.gif" alt="Coded Magazines" height="18" style="border:0px;" id="magazines" /></a></td>
				<td style="background-color:#FFFFFF;"><img src="images/index/index-box-fill.png" alt="boxfill" style="width:10px; height:18px;" /><a href="magazines.cfm?mode=web" style="cursor:pointer;" title="Goto our web based magazine collection" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('magazinesWeb','','images/index/magazinesWebOver.gif',1)"><img src="images/index/magazinesWeb.gif" alt="Web Based Magazines" height="18" style="border:0px;" id="magazinesWeb" /></a></td>
				<td class="indexTR03"><img src="images/index/index-box-right.png" alt="boxright" /></td>
			</tr></table>
			<div class="indexTR04" style="letter-spacing:-1px;">
				Emags as they are affectionately known first appeared on the PC scene in the very early nineties and where usually put out by groups on a very limited basis.
			</div>
			
			<table cellpadding="0" cellspacing="0" class="boxIndex09"><tr>
				<td class="indexTR01"><img src="images/index/index-box-left.png" alt="boxleft" /></td>
				<td class="indexTR02"><a href="magazines.cfm?mode=text" style="cursor:pointer;" title="Goto our text based magazine collection" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('reports','','images/index/reportsOver.gif',1)"><img src="images/index/reports.gif" alt="Text Reports" width="150" height="18" style="border:0px;" id="reports" /></a><img src="images/index/index-box-fill.png" alt="boxfill" style="width:37px; height:18px;" /></td>
				<td class="indexTR03"><img src="images/index/index-box-right.png" alt="boxright" /></td>
			</tr></table>
			<div class="indexTR04" style="letter-spacing:-1px;">
				Text based magazines have been around for decades, and have been used to report pirate activities for nearly just as long. Now while text magazines don't have the glitz and glamour of their coded counter parts. Ease of publication, portability and compatibility made this a popular magazine format.
			</div>												
			
		</div>
	</cffunction>
	
	<cffunction name="thisWeekInTheScene" access="public" output="true" hint="This Week In The Scene displays news shorts on historical scene events">
		<cfset var todaysDate=Now()>
		<cfset var todaysDateNum=dateFormat(todaysDate, "d")>
		<cfset var displayCount=1><cfsilent>
		<cfquery name="RS1" datasource="#application.dataSource#" cachedwithin="#application.standardTimeOut#">
			SELECT * FROM theweekin ORDER BY"Year"ASC
		</cfquery>
		<cfif todaysDateNum GTE 1 AND todaysDateNum LTE 7>
			<!--- work out which week we are currently in by comparing the current day of the month (Note the group Z is designed to intentionally mismatch incase there is an error with the day )--->
			<cfset todayGroup="A">
		<cfelseif todaysDateNum GTE 8 AND todaysDateNum LTE 14>
			<cfset todayGroup="B">
		<cfelseif todaysDateNum GTE 15 AND todaysDateNum LTE 21>
			<cfset todayGroup="C">
		<cfelseif todaysDateNum GTE 22 AND todaysDateNum LTE application.daysNew>
			<cfset todayGroup="D">
		<cfelse>
			<cfset todayGroup="Z">
		</cfif>
		</cfsilent><div class="boxIndex08">
		<img src="images/index/thisweek.png" alt="In The Scene, This Week" title="In The Scene, This Week" class="indexLogos" />
			<!--- query loop to scan through every record --->
			<cfloop query="RS1"><cfsilent>
				<!--- work out which week the record is associated with --->
				<cfif RS1.Day GTE 1 AND RS1.Day LTE 7>
					<cfset dayGroup="A">
				<cfelseif RS1.Day GTE 8 AND RS1.Day LTE 14>
					<cfset dayGroup="B">
				<cfelseif RS1.Day GTE 15 AND RS1.Day LTE 21>
					<cfset dayGroup="C">
				<cfelseif RS1.Day GTE 22 AND RS1.Day LTE application.daysNew>
					<cfset dayGroup="D">
				<cfelse>
					<cfset dayGroup="E">
				</cfif>
				<!--- filter out all records that don't match the current month and the current week --->
				</cfsilent><cfif #RS1.Month# EQ DateFormat(todaysDate, "m") AND #todayGroup# EQ #dayGroup#><cfsilent>
					<!--- historyAction trigger is used to cancel the no records reported text --->
					<cfset historyActivation = "Yes">
					<!--- OUTPUT --->
					</cfsilent><div style="letter-spacing: -1px;text-align:justify;#IIf(displayCount GT 1,DE('margin-top:4px; padding-top:2px; border-top:1px dashed CCCCCC;'),DE(''))#"><div class="thisweekYear">#RS1.Year#</div><span class="arial fs13">#RS1.Snippet#</span></div><cfsilent>
					<cfset displayCount=IncrementValue(displayCount)>
					</cfsilent>
				</cfif>
			</cfloop>
			<cfif NOT IsDefined("historyActivation")>
				<!--- If no records are to be displayed, show this message instead --->
				<span class="arial fs12">Nothing happened of note</span>
			</cfif>
		</div>
	</cffunction>
	
</cfcomponent>