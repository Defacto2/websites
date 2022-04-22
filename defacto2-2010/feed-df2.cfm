<!--- 
File: feed2.cfm
Version: 2.0
Author: Ben Garrett
Date: 18 August 2007
Feed (web feed, news syndication, RSS, Atom, etc) frontend
 --->

<!--- 
URL format chooses the feed output (RSS 2 or Atom 1)
URL mode chooses the type of information to display
URL list is retained for backwards compatibility
--->
<cfif IsDefined("url.list")><cfset url.mode=url.list></cfif>
<cfparam name="url.format" default="rss2">
<cfparam name="url.mode" default="tsn">

<cfset newssource = "defacto2net">
<cfset thispage = GetFileFromPath(GetCurrentTemplatePath())>

<!--- Displays information about the web feeds --->
<cfif url.mode eq "introduction">
<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - Web Feeds (RSS/Atom) (using BoxSyndication 2)</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" border="0" class="box02">
			<tr><td>
			<div class="functionHeader">Web Feeds (using BoxSyndication 2)</div>
            <div class="boxFeed02">
			Defacto2 supports a number of web feeds utilising the RSS 2.0 format as well as the next generation format, Atom 1.0.
			Currently RSS 2.0 is the more popular by far and is supported by nearly every modern feed reader.
			But you do not require a speciality reader to use our feeds as a number of web browsers such as Firefox, Opera 9 and Internet Explorer 7 and even some e-mail clients read web feeds.
			<p>All these feeds have been validated with Feed Validator and tested with a number of different readers.</p>
			</div>
			
			<table cellpadding="0" cellspacing="0" border="0" style="width:500px; margin-left:auto; margin-right:auto; margin-top:10px;"><tr><td>
				<span style="float:left;"><a href="#thispage#?format=atom1&amp;list=tsn" title="The Scene News &amp; Defacto2 Atom feed"><img src="images/xml.gif" alt="Atom Feed" class="feedIcon" /></a></span>
				<span style="float:left;"><a href="#thispage#?format=rss2&amp;list=tsn" title="The Scene News &amp; Defacto2 RSS feed"><img src="images/rss.gif" alt="RSS Feed" class="feedIcon" /></a></span>
				<span style="float:left; margin-left:40px;">The Scene News with Defacto2 news</span>
			</td></tr><tr><td>
				<span style="float:left;"><a href="#thispage#?format=atom1&amp;list=scenenews" title="The Scene News Atom feed"><img src="images/xml.gif" alt="Atom Feed" class="feedIcon" /></a></span>
				<span style="float:left;"><a href="#thispage#?format=rss2&amp;list=scenenews" title="The Scene News RSS feed"><img src="images/rss.gif" alt="RSS Feed" class="feedIcon" /></a></span>
				<span style="float:left; margin-left:40px;">The Scene News</span>
			</td></tr><tr><td>
				<span style="float:left;"><a href="#thispage#?format=atom1&amp;list=sitenews" title="Defacto2 web site news and updates Atom feed"><img src="images/xml.gif" alt="Atom Feed" class="feedIcon" /></a></span>
				<span style="float:left;"><a href="#thispage#?format=rss2&amp;list=sitenews" title="Defacto2 web site news and updates RSS feed"><img src="images/rss.gif" alt="RSS Feed" class="feedIcon" /></a></span>
				<span style="float:left; margin-left:40px;">Defacto2 news</span>
			</td></tr><tr><td>
				<div style="margin-top:8px;"></div>
				<span style="float:left;"><a href="#thispage#?format=atom1&amp;list=newfiles" title="New files added to the website Atom feed"><img src="images/xml.gif" alt="Atom Feed" class="feedIcon" /></a></span>
				<span style="float:left;"><a href="#thispage#?format=rss2&amp;list=newfiles" title="New files added to the website  RSS feed"><img src="images/rss.gif" alt="RSS Feed" class="feedIcon" /></a></span>
				<span style="float:left; margin-left:40px;">New files</span>
			</td></tr><tr><td>
				<span style="float:left;"><a href="#thispage#?format=atom1&amp;list=filepacks" title="File pack updates Atom feed"><img src="images/xml.gif" alt="Atom Feed" class="feedIcon" /></a></span>
				<span style="float:left;"><a href="#thispage#?format=rss2&amp;list=filepacks" title="File pack updates RSS feed"><img src="images/rss.gif" alt="RSS Feed" class="feedIcon" /></a></span>
				<span style="float:left; margin-left:40px;">File pack updates</span>
			</td></tr><tr><td>
				<span style="float:left;"><a href="#thispage#?format=atom1&amp;list=cracktros" title="Scene Archive cracktro updates Atom feed"><img src="images/xml.gif" alt="Atom Feed" class="feedIcon" /></a></span>
				<span style="float:left;"><a href="#thispage#?format=rss2&amp;list=cracktros" title="Scene Archive cracktro updates RSS feed"><img src="images/rss.gif" alt="RSS Feed" class="feedIcon" /></a></span>
				<span style="float:left; margin-left:40px;">New cracktros</span>
			</td></tr></table>
				<!---
				<span style="float:left;"></span>
				<span style="float:left;"></span>
				<span style="float:left; margin-left:40px;"></span>
				--->

			<div class="feedValidate">
				<a href="http://feedvalidator.org/check.cgi?url=http://www.defacto2.net/#thispage#?format=rss2&amp;list=scenenews" title="Validate a Defacto2 RSS feed"><img src="images\valid-rss.png" alt="[Valid RSS]" style="border:0px; width:88px; height:31px;" /></a>
				&nbsp; &nbsp;
				<a href="http://feedvalidator.org/check.cgi?url=http://www.defacto2.net/#thispage#?format=atom1&amp;list=scenenews" title="Validate a Defacto2 Atom 1.0 feed"><img src="images\valid-atom.png" alt="[Valid Atom 1.0]"  style="border:0px; width:88px; height:31px;" /></a>
			</div>
			Wikipedia has more information on both <a href="http://en.wikipedia.org/wiki/ATOM">Atom</a> and <a href="http://en.wikipedia.org/wiki/RSS_%28file_format%29">RSS</a> web feeds.
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>
</cfif>

<!--- Global feed element variables --->
<cfscript>
	if(url.format eq "atom1") {
		meta.author.name = "Ipggi";
		meta.author.uri = "/contact.cfm";
		meta.id = "http://www.defacto2.net/";
		meta.icon = "images/favicon.ico";
		meta.logo = "images/btn-df2.gif";
		meta.rights = "&##xa9; 1996-#LSDateFormat(Now(),'YYYY')# Defacto2";
		meta.version = "atom_1.0";
	}
	else if(url.format eq "rss2") {
		meta.category.value = "Defacto2";
		meta.copyright = "&##xa9; 1996-#LSDateFormat(Now(),'YYYY')# Defacto2";
		meta.image.link = "http://www.defacto2.net/";
		meta.image.title = "Defacto2 button";
		meta.image.url = "http://www.defacto2.net/images/btn-df2.gif";
		meta.link = "http://www.defacto2.net/";
		meta.version = "rss_2.0";
	}
</cfscript>

<!--- NEWS --->

<cfif ReFindNoCase('^(sitenews|scenenews|tsn)$',url.mode)>
	<cfscript>
		if(url.mode is 'sitenews') { 
			sql = 'Hide <> 1 AND Defacto2News = 1 ORDER BY id desc';
			title = 'Defacto2 - Site Related News';
			info = 'All the latest updates on Defacto2';
		}
		else if(url.mode is 'scenenews') { 
			sql = 'Hide <> 1 AND Defacto2News = 0 ORDER BY id desc';
			title = 'Defacto2 - The Scene News';
			info = 'All the latest news and happenings within the computer underground';
		}
		else if(url.mode is 'tsn') { 
			sql = 'Hide <> 1 ORDER BY id desc';
			title = 'Defacto2 - The Scene News with Site News';
			info = 'All the latest news and happenings within the computer underground';
		}
	</cfscript>

	<cfquery name="getSiteNews" datasource="#newsSource#" cachedwithin="#CreateTimeSpan(0,0,60,0)#" maxrows="10">
		SELECT * FROM thescenenews WHERE #sql#
	</cfquery>
	
	<cfset categorylabel = ArrayNew(1)>
	<cfset categoryterm = ArrayNew(1)>
	<cfset dcformat = ArrayNew(1)>
	<cfset dcpublisher = ArrayNew(1)>
	<cfset idperm = ArrayNew(1)>
	<cfset linktype = ArrayNew(1)>
	<cfset linkurl = ArrayNew(1)>
	<cfset linkuri = ArrayNew(1)>
	<cfset sourcename = ArrayNew(1)>
	<cfset sourceurl = ArrayNew(1)>
	<cfset tagid = ArrayNew(1)>
	<cfset type = ArrayNew(1)>
	
	<cfloop query="getSiteNews">
		<cfset dcformat[currentrow] = "text/html">
		<cfif url.mode is "sitenews" or defacto2news is 1>
			<cfset dcpublisher[currentrow] = "Defacto2">
		<cfelseif Len(source)>
			<cfset dcpublisher[currentrow] = "#source#">
		<cfelse>
			<cfset dcpublisher[currentrow] = "Scene news">
		</cfif>
		<cfif defacto2news is 1>
			<cfset categorylabel[currentrow] = "Defacto2 news">
			<cfset categoryterm[currentrow] = "Defacto2">
		<cfelse>
			<cfset categorylabel[currentrow] = "Scene news">
			<cfset categoryterm[currentrow] = "Scene">
		</cfif>
		<cfset idperm[currentrow] = "false">
		<cfset linkrel[currentrow] = "alternate">
		<cfset linkuri[currentrow] = "/news.cfm?mode=feed&amp;id=#id#">
		<cfset linkurl[currentrow] = "http://www.defacto2.net/news.cfm?mode=feed&amp;id=#id#">
		<cfif Len(source)>
			<cfset sourcename[currentrow] = "#source#">
			<cfif Len(sourcelink)><cfset sourceurl[currentrow] = "#sourcelink#"></cfif>
		</cfif>
		<cfset tagid[currentrow] = "tag:defacto2.net,#DateFormat(OBCTime,'yyyy-mm-dd')#:#id#">
		<cfset type[currentrow] = "html">
		<cfif currentrow is 1><cfset metaupdated = OBCTime></cfif>
	</cfloop>
	<cfset tmp = QueryAddColumn(getSiteNews, 'categorylabel', categorylabel)>
	<cfset tmp = QueryAddColumn(getSiteNews, 'categoryterm', categoryterm)>
	<cfset tmp = QueryAddColumn(getSiteNews, 'dcformat', dcformat)>
	<cfset tmp = QueryAddColumn(getSiteNews, 'dcpublisher', dcpublisher)>
	<cfset tmp = QueryAddColumn(getSiteNews, 'idperm', idperm)>
	<cfset tmp = QueryAddColumn(getSiteNews, 'linkrel', linkrel)>
	<cfset tmp = QueryAddColumn(getSiteNews, 'linkurl', linkurl)>
	<cfset tmp = QueryAddColumn(getSiteNews, 'linkuri', linkuri)>	
	<cfset tmp = QueryAddColumn(getSiteNews, 'sourcename', sourcename)>
	<cfset tmp = QueryAddColumn(getSiteNews, 'sourceurl', sourceurl)>	
	<cfset tmp = QueryAddColumn(getSiteNews, 'tagid', tagid)>
	<cfset tmp = QueryAddColumn(getSiteNews, 'type', type)>
	
	<!--- Map the feed attributes to the query columns. --->
	<cfset columnMapStruct = StructNew()>
	<cfset columnMapStruct.title = "title">
	<cfset columnMapStruct.id = "tagid">
	<cfif url.format eq "atom1">
		<cfset columnMapStruct.authorname = "author">
		<cfset columnMapStruct.authoruri = "sourcelink">
		<cfset columnMapStruct.categorylabel = "categorylabel">
		<cfset columnMapStruct.categoryterm = "categoryterm">
		<cfset columnMapStruct.content = "description">
		<cfset columnMapStruct.contenttype = "type">
		<cfset columnMapStruct.linkhref = "linkuri">
		<cfset columnMapStruct.linkrel = "linkrel">
		<cfset columnMapStruct.publisheddate = "OBCTime">
		<cfset columnMapStruct.updated = "OBCTime">
		<cfset columnMapStruct.dc_source = "sourcelink">
	<cfelseif url.format eq "rss2">
		<cfset columnMapStruct.content = "description">
		<cfset columnMapStruct.idpermalink = "idperm">
		<cfset columnMapStruct.publisheddate = "OBCTime">
		<cfset columnMapStruct.rsslink = "linkurl">
		<cfset columnMapStruct.source = "sourcename">
		<cfset columnMapStruct.sourceurl = "sourceurl">
		<cfset columnMapStruct.dc_creator = "author">
		<cfset columnMapStruct.dc_format = "dcformat">
		<cfset columnMapStruct.dc_publisher = "dcpublisher">
	</cfif>

	<!--- Create the feed metadata. --->
	<cfscript>
		if(url.format eq "atom1") {
			meta.category = ArrayNew(1);
			meta.category[1] = StructNew();
			if(url.mode is 'sitenews') {
				meta.category[1].label = "Defacto2";
				meta.category[1].term = "df2";
				meta.category[1].scheme = "http://www.defacto2.net/feed-df2.cfm?mode=sitenews&format=atom1";
			} else if(url.mode is 'scenenews') {
				meta.category[1].label = "Scene News";
				meta.category[1].term = "scene";
				meta.category[1].scheme = "http://www.defacto2.net/feed-df2.cfm?mode=scenenews&format=atom1";
			} else if(url.mode is 'tsn') {
				meta.category[1].label = "Scene news";
				meta.category[1].term = "scene";
				meta.category[1].scheme = "http://www.defacto2.net/feed-df2.cfm?mode=scenenews&format=atom1";
				meta.category[2] = StructNew();
				meta.category[2].label = "Defacto2 news";
				meta.category[2].term = "df2";
				meta.category[2].scheme = "http://www.defacto2.net/feed-df2.cfm?mode=sitenews&format=atom1";
			}
			meta.link = ArrayNew(1);
			meta.link[1] = StructNew();
			meta.link[1].rel = "self";
			meta.link[1].href = "/feed-df2.cfm?format=atom1&list=#url.mode#";
			meta.link[2] = StructNew();
			meta.link[2].rel = "alternate";
			meta.link[2].href = "/feed-df2.cfm?format=rss2&list=#url.mode#";
			meta.link[2].title = "RSS 2 version of this feed";
			meta.link[3] = StructNew();
			meta.link[3].rel = "related";
			meta.link[3].href = "/";
			meta.link[3].title = "The Scene News";
			meta.subtitle.value = info;
			meta.title.value = title;
			meta.updated = metaupdated;
		} else if(url.format eq "rss2") {
			meta.category.value = "Defacto2";
			meta.description = info;
			meta.title = title;
		}
	</cfscript>
	<!--- Generate the feed --->
	<cf_feed-bs2 query="#getSiteNews#" properties="#meta#" columnMap="#columnMapStruct#" xmlvar="xmloutput">
</cfif>

<!--- FILE PACKS --->

<cfif url.mode eq "filepacks">
	<cfquery name="getSiteNews" datasource="#newsSource#" cachedwithin="#CreateTimeSpan(0,0,0,0)#" maxrows="10">
		SELECT * FROM filepacks ORDER BY lastrevised DESC
	</cfquery>
	
	<cfset linkurl = ArrayNew(1)>
	<cfset linkrel = ArrayNew(1)>
	<cfset categorylabel = ArrayNew(1)>
	<cfset authorname = ArrayNew(1)>
	<cfset rights = ArrayNew(1)>
	<cfset format = ArrayNew(1)>
	<cfset metaupdated = now()>
	<cfset tagid = ArrayNew(1)>
	<cfloop query="getSiteNews">	
		<cfif nolocal>
			<cfset downloadAttr="downloads;#filename#;#filesize#;nolocal;#fulltitle#">
		<cfelse>
			<cfset downloadAttr="downloads;#filename#;#filesize#;#fulltitle#">
		</cfif>
		<cfset linkurl[currentrow] = "http://www.defacto2.net/download.cfm?#cfusion_encrypt(downloadAttr, 'REMOVED')#-EN">
		<cfset linkrel[currentrow] = "alternate">
		<cfswitch expression="#id#">
			<cfcase value="1"><cfset categorylabel[currentrow] = "Scene ISO"></cfcase>
			<cfcase value="2,6"><cfset categorylabel[currentrow] = "cracktros"></cfcase>
			<cfcase value="3,4"><cfset categorylabel[currentrow] = "BBS"></cfcase>
			<cfcase value="5,7"><cfset categorylabel[currentrow] = "NFO"></cfcase>
		</cfswitch>
		<cfswitch expression="#id#">
			<cfcase value="1,2,3,5"><cfset authorname[currentrow] = "Defacto2"><cfset rights[currentrow] = "&##xa9; #DateFormat(lastrevised,'YYYY')# Defacto2"><cfset authoruri[currentrow] = "http://www.defacto2.net"></cfcase>
			<cfcase value="4,7"><cfset authorname[currentrow] = "Toast"><cfset rights[currentrow] = "&##xa9; #DateFormat(lastrevised,'YYYY')# Toast"></cfcase>
			<cfcase value="6"><cfset authorname[currentrow] = "Maktone"><cfset rights[currentrow] = "&##xa9; #DateFormat(lastrevised,'YYYY')# Maktone"><cfset authoruri[currentrow] = "http://www.maktone.tk"></cfcase>
		</cfswitch>
		<cfif Right(filename,3) is ".7z">
			<cfset format[currentrow] = "application/x-7z-compressed">
		<cfelseif Right(filename,4) is ".zip">
			<cfset format[currentrow] = "application/zip">
		</cfif>
		<cfif currentrow is 1><cfset metaupdated = lastrevised></cfif>
		<cfset tagid[currentrow] = "tag:defacto2.net,#DateFormat(lastrevised,'yyyy-mm-dd')#:#id#">
	</cfloop>
	<cfset tmp = QueryAddColumn(getSiteNews, 'linkurl', linkurl)>
	<cfset tmp = QueryAddColumn(getSiteNews, 'linkrel', linkrel)>
	<cfset tmp = QueryAddColumn(getSiteNews, 'categorylabel', categorylabel)>
	<cfset tmp = QueryAddColumn(getSiteNews, 'authorname', authorname)>
	<cfset tmp = QueryAddColumn(getSiteNews, 'authoruri', authoruri)>
	<cfset tmp = QueryAddColumn(getSiteNews, 'rights', rights)>
	<cfset tmp = QueryAddColumn(getSiteNews, 'format', format)>
	<cfset tmp = QueryAddColumn(getSiteNews, 'tagid', tagid)>
	
	<!--- Map the feed attributes to the query columns. --->
	<cfset columnMapStruct = StructNew()>
	<cfset columnMapStruct.title = "fulltitle">
	<cfset columnMapStruct.publisheddate = "lastrevised">
	<cfset columnMapStruct.updated = "lastrevised">
	<cfset columnMapStruct.content = "summarydes">
	<cfset columnMapStruct.categorylabel = "categorylabel">
	<cfset columnMapStruct.categoryterm = "categorylabel">
	<cfset columnMapStruct.authorname = "authorname">
	<cfset columnMapStruct.dc_format = "format">
	<cfif url.format eq "rss2">
		<cfset columnMapStruct.dc_publisher = "authorname">
		<cfset columnMapStruct.dc_rights = "rights">
		<cfset columnMapStruct.id = "linkurl">
	<cfelseif url.format eq "atom1">
		<cfset columnMapStruct.id = "tagid">
		<cfset columnMapStruct.linkhref = "linkurl">
		<cfset columnMapStruct.linkrel = "linkrel">
		<cfset columnMapStruct.authoruri = "authoruri">
		<cfset columnMapStruct.rights = "rights">
	</cfif>

	<!--- Create the feed metadata. --->
	<cfscript>
		meta.title = "Defacto2 - File Pack Updates";
		if(url.format eq "atom1") {
			meta.updated = metaupdated;
			meta.subtitle.value = "Find out instantly when a new updated file pack is ready for download";
			meta.link = ArrayNew(1);
			meta.link[1] = StructNew();
			meta.link[1].rel = "self";
			meta.link[1].href = "/feed-df2.cfm?format=atom1&list=filepacks";
			meta.link[2] = StructNew();
			meta.link[2].rel = "alternate";
			meta.link[2].href = "/feed-df2.cfm?format=rss2&list=filepacks";
			meta.link[2].title = "RSS 2 version of this feed";
			meta.link[3] = StructNew();
			meta.link[3].rel = "related";
			meta.link[3].href = "/";
			meta.link[3].title = "The Scene Archives";
		}
		if(url.format eq "rss2") {
			meta.description = "Find out instantly when a new updated file pack is ready for download";
		}
	</cfscript>
	<!--- Generate the feed --->
	<cf_feed-bs2 query="#getSiteNews#" properties="#meta#" columnMap="#columnMapStruct#" xmlvar="xmloutput">
</cfif>

<!--- CRACKTROS --->

<cfif url.mode eq "cracktros">
	<cfquery name="getCracktros" datasource="#newsSource#" cachedwithin="#CreateTimeSpan(0,0,0,0)#" maxrows="10">
		SELECT * FROM cracktros ORDER BY id desc
	</cfquery>

	<cfset authoruri = ArrayNew(1)>	
	<cfset dcformat = ArrayNew(1)>
	<cfset dcpublisher = ArrayNew(1)>
	<cfset dcauthor = ArrayNew(1)>
	<cfset rights = ArrayNew(1)>
	<cfset linkurl = ArrayNew(1)>
	<cfset linkrel = ArrayNew(1)>
	<cfset content = ArrayNew(1)>
	<cfset category = ArrayNew(1)>
	<cfset tagid = ArrayNew(1)>
	<cfset metaupdated = ArrayNew(1)>
	<cfset contenttype = ArrayNew(1)>
	<cfset idpermalink = ArrayNew(1)>
	
	<cfloop query="getCracktros">
		<cfif Len(author)>
			<cfset authoruri[currentrow] = "http://www.defacto2.net/cracktros.cfm?mode=author&value=#URLEncodedFormat(author)#">
		</cfif>
		<cfset contenttype[currentrow] = "html">
		<cfset dcformat[currentrow] = "application/zip">
		<cfset dcpublisher[currentrow] = "#createdfor#">
		<cfset dcauthor[currentrow] = "#author#">
		<cfset rights[currentrow] = "&##xa9; #year# #createdfor#">
		<cfset linkurl[currentrow] = "http://www.defacto2.net/cracktros.cfm?mode=file&value=#filename#">
		<cfset linkrel[currentrow] = "alternate">
		<cfset content[currentrow] = "File: #filename#<br />Group: #CreatedFor#<br />Year: #Year#<br />Author: #Author#<p></p><img src='http://www.defacto2.net/images/cracktro-scenes/#filename#.png' alt='#filename# Screenshot' title='#filename# Screenshot' />">
		<cfif installer is 0 and ingameloader is 0>
			<cfset category[currentrow] = "cracktro">
		<cfelseif installer is 1>
			<cfset category[currentrow] = "installer">
		<cfelseif installer is 0 and ingameloader is 1>
			<cfset category[currentrow] = "in-game loader">
		</cfif>
		<cfset tagid[currentrow] = "tag:defacto2.net,#DateFormat(dateAdded,'yyyy-mm-dd')#:#id#">
		<cfset idpermalink[currentrow] = "false">
		<cfif currentrow is 1><cfset metaupdated = dateAdded></cfif>
	</cfloop>
	
	<cfset tmp = QueryAddColumn(getCracktros, 'authoruri', authoruri)>
	<cfset tmp = QueryAddColumn(getCracktros, 'contenttype', contenttype)>
	<cfset tmp = QueryAddColumn(getCracktros, 'dcformat', dcformat)>
	<cfset tmp = QueryAddColumn(getCracktros, 'dcpublisher', dcpublisher)>
	<cfset tmp = QueryAddColumn(getCracktros, 'dcauthor', dcauthor)>
	<cfset tmp = QueryAddColumn(getCracktros, 'rights', rights)>
	<cfset tmp = QueryAddColumn(getCracktros, 'linkurl', linkurl)>
	<cfset tmp = QueryAddColumn(getCracktros, 'linkrel', linkrel)>
	<cfset tmp = QueryAddColumn(getCracktros, 'content', content)>
	<cfset tmp = QueryAddColumn(getCracktros, 'category', category)>
	<cfset tmp = QueryAddColumn(getCracktros, 'tagid', tagid)>
	<cfset tmp = QueryAddColumn(getCracktros, 'idpermalink', idpermalink)>
	
	<!--- Map the feed attributes to the query columns. --->
	<cfset columnMapStruct = StructNew()>
	<cfset columnMapStruct.title = "Filename">
	<cfset columnMapStruct.publisheddate = "dateAdded">
	<cfset columnMapStruct.content = "content">
	<cfset columnMapStruct.id = "tagid">
	<cfif url.format eq "rss2">
		<cfset columnMapStruct.categorylabel = "category">
		<cfset columnMapStruct.rsslink = "linkurl">
		<cfset columnMapStruct.dc_rights = "rights">
		<cfset columnMapStruct.dc_creator = "author">
		<cfset columnMapStruct.dc_publisher = "dcpublisher">
		<cfset columnMapStruct.dc_format = "dcformat">
		<cfset columnMapStruct.idpermalink = "idpermalink">
	<cfelseif url.format eq "atom1">
		<cfset columnMapStruct.contenttype = "contenttype">
		<cfset columnMapStruct.categoryterm = "category">
		<cfset columnMapStruct.updated = "dateAdded">
		<cfset columnMapStruct.authorname = "author">
		<cfset columnMapStruct.authoruri = "authoruri">
		<cfset columnMapStruct.linkhref = "linkurl">
		<cfset columnMapStruct.linkrel = "linkrel">
		<cfset columnMapStruct.rights = "rights">
	</cfif>
	<!--- Create the feed metadata. --->
	<cfscript>
		meta.title = "Defacto2 - Cracktros in The Scene Archives";
		if(url.format eq "atom1") {
			meta.category = ArrayNew(1);
			meta.category[1] = StructNew();
			meta.category[1].term = "The Scene";
			meta.category[2] = StructNew();
			meta.category[2].term = "Cracktros";
			meta.category[3] = StructNew();
			meta.category[3].term = "Intros";
			meta.category[4] = StructNew();
			meta.category[4].term = "Installers";
			meta.link = ArrayNew(1);
			meta.link[1] = StructNew();
			meta.link[1].rel = "self";
			meta.link[1].href = "/feed-df2.cfm?format=atom1&list=cracktros";
			meta.link[2] = StructNew();
			meta.link[2].rel = "alternate";
			meta.link[2].href = "/feed-df2.cfm?format=rss2&list=cracktros";
			meta.link[2].title = "RSS 2 version of this feed";
			meta.link[3] = StructNew();
			meta.link[3].rel = "related";
			meta.link[3].href = "/cracktros.cfm";
			meta.link[3].title = "The Scene Archives Cracktros";
			meta.subtitle.value = "Find out instantly when a new updated cracktro or installer is placed online";
			meta.updated = metaupdated;
		}
		if(url.format eq "rss2") {
			meta.category = ArrayNew(1);
			meta.category[1] = StructNew();
			meta.category[1].value = "The Scene";
			meta.category[2] = StructNew();
			meta.category[2].value = "Cracktros";
			meta.category[3] = StructNew();
			meta.category[3].value = "Intros";
			meta.category[4] = StructNew();
			meta.category[4].value = "Installers";
			meta.description = "Find out instantly when a new updated cracktro or installer is placed online";
			meta.lastBuildDate = metaupdated;
		}
	</cfscript>
	<!--- Generate the feed --->
	<cf_feed-bs2 query="#getCracktros#" properties="#meta#" columnMap="#columnMapStruct#" xmlvar="xmloutput">

</cfif>

<cfif url.mode eq "newfiles">
	<cfinvoke component="cfcs.statistics" method="newestFiles" outputmode="feed" limit="20">
	
	<cfset contenttype = ArrayNew(1)>
	<cfset idpermalink = ArrayNew(1)>
	<cfset linkrel = ArrayNew(1)>
	<cfset tagid = ArrayNew(1)>
	
	<cfloop query="application.RSCombined">
		<cfset contenttype[currentrow] = "html">
		<cfset idpermalink[currentrow] = "false">
		<cfset linkrel[currentrow] = "alternate">
		<cfset tagid[currentrow] = "tag:defacto2.net,#DateFormat(dateAdded,'yyyy-mm-dd')#:#filetype#-#id#">
		<cfif currentrow is 1><cfset metaupdated = dateAdded></cfif>
	</cfloop>

	<cfset tmp = QueryAddColumn(application.RSCombined, 'contenttype', contenttype)>
	<cfset tmp = QueryAddColumn(application.RSCombined, 'idpermalink', idpermalink)>
	<cfset tmp = QueryAddColumn(application.RSCombined, 'linkrel', linkrel)>
	<cfset tmp = QueryAddColumn(application.RSCombined, 'tagid', tagid)>
	
	<!--- Map the feed attributes to the query columns. --->
	<cfset columnMapStruct = StructNew()>
	<cfset columnMapStruct.title = "linkText">
	<cfset columnMapStruct.publisheddate = "dateAdded">
	<cfset columnMapStruct.content = "feedText">
	<cfset columnMapStruct.id = "tagid">
	<cfif url.format eq "rss2">
		<cfset columnMapStruct.categorylabel = "fileType">
		<cfset columnMapStruct.rsslink = "feedLink">
		<cfset columnMapStruct.idpermalink = "idpermalink">
	<cfelseif url.format eq "atom1">
		<cfset columnMapStruct.contenttype = "contenttype">
		<cfset columnMapStruct.categoryterm = "fileType">
		<cfset columnMapStruct.updated = "dateAdded">
		<cfset columnMapStruct.linkhref = "feedLink">
		<cfset columnMapStruct.linkrel = "linkrel">
	</cfif>
	
	<!--- Create the feed metadata. --->
	<cfscript>
		meta.title = "Defacto2 - Newest Files";
		if(url.format eq "atom1") {		
			meta.author.name = "Defacto2";
			meta.category = ArrayNew(1);
			meta.category[1] = StructNew();
			meta.category[1].term = "The Scene";
			meta.category[2] = StructNew();
			meta.category[2].term = "Cracktros";
			meta.category[3] = StructNew();
			meta.category[3].term = "Documents";
			meta.category[4] = StructNew();
			meta.category[4].term = "Magazines";
			meta.link = ArrayNew(1);
			meta.link[1] = StructNew();
			meta.link[1].rel = "self";
			meta.link[1].href = "/feed-df2.cfm?format=atom1&list=newfiles";
			meta.link[2] = StructNew();
			meta.link[2].rel = "alternate";
			meta.link[2].href = "/feed-df2.cfm?format=rss2&list=newfiles";
			meta.link[2].title = "RSS 2 version of this feed";
			meta.link[3] = StructNew();
			meta.link[3].rel = "related";
			meta.link[3].href = "/";
			meta.link[3].title = "The Scene Archives";
			meta.subtitle.value = "Find out instantly when a new file is offered on the web site";
			meta.updated = metaupdated;
		}
		if(url.format eq "rss2") {
			meta.category = ArrayNew(1);
			meta.category[1] = StructNew();
			meta.category[1].value = "The Scene";
			meta.category[2] = StructNew();
			meta.category[2].value = "Cracktros";
			meta.category[3] = StructNew();
			meta.category[3].value = "Documents";
			meta.category[4] = StructNew();
			meta.category[4].value = "Magazines";
			meta.description = "Find out instantly when a new file is offered on the web site";
			meta.lastBuildDate = metaupdated;
		}
	</cfscript>
	<!--- Generate the feed --->
	<cf_feed-bs2 query="#application.RSCombined#" properties="#meta#" columnMap="#columnMapStruct#" xmlvar="xmloutput">
</cfif>

<cfif IsDefined("xmloutput") and Len(xmloutput)>
	<cfcontent type="text/xml"><cfoutput>#xmloutput#</cfoutput>
</cfif>