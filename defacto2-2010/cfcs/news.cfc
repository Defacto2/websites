<cfcomponent>
	<cffunction name="list" access="public" returntype="string" hint="Display the list of news items (for index.cfm)">
		<cfargument name="page" default="1" hint="">	
		<cfset var currentPage=GetFileFromPath(GetTemplatePath())>
		<cfset var blogID=0>
		<cfset var recordsAtOnce=10>
		<!--- cookie for saving last news item (maybe create a cookie.cfc?)--->
		<cfif IsDefined("cookie.LastRead") AND IsValid("integer", cookie.LastRead)>
			<cfset lastReadID=cookie.LastRead>
			<cfelse>
			<cfset lastReadID=18^9>
		</cfif>
		<!--- news recordset --->
		<cfquery name="RS1" datasource="#application.newsSource#" cachedwithin="#application.newsTimeOut#" timeout="5">
			SELECT * FROM thescenenews ORDER BY id DESC
		</cfquery>
		<cfset items=RS1.recordcount>
		<cfset endrow=round(page*recordsAtOnce)>
		<cfif endrow GT items><cfset endrow=items></cfif>
		<cfoutput>
		<table cellpadding="0" cellspacing="0" class="boxNews01">
			<tr><td>
				<!--- Logo  style="background-image:url(images/tsn-bg.gif);" --->
				<div class="left">
        	<!--- <a href="feed.cfm?mode=introduction">
          <img src="images/feed-16.gif" alt="Feed Infomation" title="Goto our web feed page" class="indexFeedButtons" style="float:right; margin-top:17px;" /></a> --->
					<img src="images/tsn.gif" alt="The Scene News logo" />
					<cfif blogID EQ "0">
					<!--- hide section when page is used as an RSS template --->
						<table width="100%" cellspacing="0" cellpadding="0"><tr>
						<td class="verdana fs11" style="background-color:##CCC; text-align:right; padding-right:10px; padding-left:20px;">
							<div style="float:left;color:##B1BBD1; font-weight:bold;">
								<cfif url.page GT 1><a href="#currentPage#?page=#decrementValue(url.page)#" style="color:##FFF; font-weight:bold;" title="page #decrementValue(url.page)#">later</a></cfif><cfif (items-endrow) GTE recordsAtOnce><cfif url.page GT 1> / </cfif><a href="#currentPage#?page=#incrementValue(url.page)#" style="color:##FFF; font-weight:bold;" title="page #incrementValue(url.page)#">earlier</a></cfif>
							</div>
							<!--- <a href="feed.cfm?mode=introduction"><img src="images/rss.gif" alt="RSS Infomation" title="Goto our RSS web feed page" class="indexFeedButtons" /></a>
							<a href="feed.cfm?mode=introduction"><img src="images/xml.gif" alt="Atom Infomation" title="Goto our Atom web feed page" class="indexFeedButtons" /></a> --->
						</td></tr></table>
					</cfif>
				</div>
				<!--- Display news items --->
				<cfloop query="RS1" startrow="#(endrow-(recordsAtOnce-1))#" endrow="#endrow#">
					<cfif RS1.Hide NEQ 0>
						<cfset recordsAtOnce=IncrementValue(recordsAtOnce)>
					<cfelse>
					<div class="boxNews02"><!--- 
          	<cfif RS1.Defacto2News EQ 0>
          	<script type="text/javascript">
digg_url = 'http://www.defacto2.net/news.cfm?id=#RS1.id#&mode=comments';
digg_title = '#RS1.Title#';
digg_bodytext = '#REReplaceNoCase(RS1.Description,"<[^>]*>","","ALL")#';
digg_media = 'news';
digg_topic = 'gaming_news"';
digg_skin = 'compact';
digg_window = 'new';
</script>
<script src="http://digg.com/tools/diggthis.js" type="text/javascript"></script>
						</cfif> --->
						<cfif RS1.Defacto2News NEQ 0>
							<h1 class="newsHeadlineDF2">#RS1.Title#</h1>
						<cfelse>
							<h1 class="newsHeadline">#RS1.Title#</h1>
						</cfif>
						<!--- source | date | author --->
						<span class="newsSource">
							<cfif RS1.ID GT lastReadID><img src="images/new!.gif" alt="New item" /> &nbsp;</cfif>
							<cfif RS1.Source NEQ ""><a href="news.cfm?id=#RS1.id#&amp;url=#URLEncodedFormat(SourceLink,'utf-8')#" title="Goto the original news source">#source#</a> |</cfif>
							<span class="italic">#LSDateFormat(DateConvert('local2utc',RS1.OBCTime),'DD MMM YYYY')# (#LSTimeFormat(DateConvert('local2utc',RS1.OBCTime),'h:mm tt')#) GMT</span>
							<cfif RS1.Author NEQ ""> | #RS1.Author#</cfif> |
							<cfif RS1.Views EQ "">0<cfelse>#RS1.Views#</cfif> clicks
						</span>
						<!--- news --->
						<cfset RS1.Description="#replaceNoCase(RS1.Description,'<p></p>','<br /><br />','all')#">
						<h2 class="newsBody">#ReplaceNoCase(RS1.Description,'&','&amp;','all')#</h2>
						<!--- comments and complete article link --->
						<div class="newsCommentsCount" <cfif RS1.currentrow NEQ recordsAtOnce>style="padding-bottom:10px; border-bottom:1px dashed ##cccccc; width:100%;"</cfif>>
							<cfinvoke component="news" method="blogCount" id="#RS1.ID#">
							<cfif RS1.Defacto2News EQ 0 AND SourceLink NEQ ""><span class="italic"> <a href="news.cfm?id=#RS1.id#&amp;url=#URLEncodedFormat(SourceLink,'utf-8')#" title="Goto the original news source">Original source</a></span> | </cfif>
							<!--- <img src="images/digg.png" alt="Digg this article" /> <a href="http://digg.com/submit?phase=2&amp;url=#URLEncodedFormat('http://www.defacto2.net/news.cfm?id=#RS1.id#&mode=comments','utf-8')#&amp;title=#RS1.Title#&amp;bodytext=#URLEncodedFormat(REReplaceNoCase(RS1.Description,'<[^>]*>','','ALL'),'utf-8')#&amp;topic=gaming_news" title="Digg This Article">Digg this article</a> --->
							<img src="images/delicious.gif" alt="Delicious bookmark" /> <a href="http://del.icio.us/post?url=#URLEncodedFormat('http://www.defacto2.net/news.cfm?id=#RS1.id#&mode=comments','utf-8')#&amp;title=#RS1.Title#" title="Bookmark this article">del.icio.us</a>
						</div>
						
					</div>
					</cfif>
				</cfloop>
				<div class="verdana fs11" style="float:left;color:##000000; font-weight:bold; padding-left:20px;">
					<cfif url.page GT 1><a href="#currentPage#?page=#decrementValue(url.page)#" style="color:##000000; font-weight:bold;" title="page #decrementValue(url.page)#">later</a></cfif><cfif (items-endrow) GTE recordsAtOnce><cfif url.page GT 1> / </cfif><a href="#currentPage#?page=#incrementValue(url.page)#" style="color:##000000; font-weight:bold;" title="page #incrementValue(url.page)#">earlier</a></cfif>
				</div>
			</td></tr>
		</table>
		</cfoutput>
	</cffunction>
	
	<cffunction name="blogCount" access="public" returntype="string" hint="Display the number of news item comments using a link to the comments page">
		<cfargument name="ID" type="numeric" required="yes">
		<cfset var blogCount=0>
		<cflock name="blogCnt" timeout="10" type="readonly">
		<cfquery name="RS1" datasource="#application.newsComments#">
			SELECT ID, blogID FROM thescenenewscomments WHERE blogID = #ID#
		</cfquery>
		</cflock>
		<cfloop query="RS1"><cfset blogCount=IncrementValue(blogCount)></cfloop>
		<cfoutput>
			<a href="news.cfm?mode=comments&amp;id=#id#" title="Leave a comment" style="margin-right:30px;">
			<cfif blogCount EQ 0>Leave a comment<cfelse>#blogCount# </cfif><cfif blogCount GT 1>comments<cfelseif blogCount NEQ 0>comment</cfif></a>
		</cfoutput>
	</cffunction>
	
</cfcomponent>