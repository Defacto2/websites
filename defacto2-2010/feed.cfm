<!--- 
File: feed.cfm
Version: 1.0
Author: Ben Garrett
Date: 30th March 2006
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

<!--- Displays information about the web feeds --->
<cfif url.mode eq "introduction">
<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - Web Feeds (RSS/Atom)</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" border="0" class="box02">
			<tr><td>
			<div class="functionHeader">Web Feeds</div>
            <div class="boxFeed02">
			Defacto2 supports a number of web feeds utilising the RSS 2.0 format as well as the next generation format, Atom 1.0.
			Currently RSS 2.0 is the more popular by far and is supported by nearly every modern feed reader.
			But you do not require a speciality reader to use our feeds as a number of web browsers such as Firefox, Opera 9 and Internet Explorer 7 and even some e-mail clients read web feeds.
			<p>All these feeds have been validated with Feed Validator and tested with a number of different readers.</p>
			</div>
			
			<table cellpadding="0" cellspacing="0" border="0" style="width:500px; margin-left:auto; margin-right:auto; margin-top:10px;"><tr><td>
				<span style="float:left;"><a href="feed.cfm?format=atom1&amp;list=tsn" title="The Scene News &amp; Defacto2 Atom feed"><img src="images/xml.gif" alt="Atom Feed" class="feedIcon" /></a></span>
				<span style="float:left;"><a href="feed.cfm?format=rss2&amp;list=tsn" title="The Scene News &amp; Defacto2 RSS feed"><img src="images/rss.gif" alt="RSS Feed" class="feedIcon" /></a></span>
				<span style="float:left; margin-left:40px;">The Scene News with Defacto2 news</span>
			</td></tr><tr><td>
				<span style="float:left;"><a href="feed.cfm?format=atom1&amp;list=scenenews" title="The Scene News Atom feed"><img src="images/xml.gif" alt="Atom Feed" class="feedIcon" /></a></span>
				<span style="float:left;"><a href="feed.cfm?format=rss2&amp;list=scenenews" title="The Scene News RSS feed"><img src="images/rss.gif" alt="RSS Feed" class="feedIcon" /></a></span>
				<span style="float:left; margin-left:40px;">The Scene News</span>
			</td></tr><tr><td>
				<span style="float:left;"><a href="feed.cfm?format=atom1&amp;list=sitenews" title="Defacto2 web site news and updates Atom feed"><img src="images/xml.gif" alt="Atom Feed" class="feedIcon" /></a></span>
				<span style="float:left;"><a href="feed.cfm?format=rss2&amp;list=sitenews" title="Defacto2 web site news and updates RSS feed"><img src="images/rss.gif" alt="RSS Feed" class="feedIcon" /></a></span>
				<span style="float:left; margin-left:40px;">Defacto2 news</span>
			</td></tr><tr><td>
				<div style="margin-top:8px;"></div>
				<span style="float:left;"><a href="feed.cfm?format=atom1&amp;list=newfiles" title="New files added to the website Atom feed"><img src="images/xml.gif" alt="Atom Feed" class="feedIcon" /></a></span>
				<span style="float:left;"><a href="feed.cfm?format=rss2&amp;list=newfiles" title="New files added to the website  RSS feed"><img src="images/rss.gif" alt="RSS Feed" class="feedIcon" /></a></span>
				<span style="float:left; margin-left:40px;">New files</span>
			</td></tr><tr><td>
				<span style="float:left;"><a href="feed.cfm?format=atom1&amp;list=filepacks" title="File pack updates Atom feed"><img src="images/xml.gif" alt="Atom Feed" class="feedIcon" /></a></span>
				<span style="float:left;"><a href="feed.cfm?format=rss2&amp;list=filepacks" title="File pack updates RSS feed"><img src="images/rss.gif" alt="RSS Feed" class="feedIcon" /></a></span>
				<span style="float:left; margin-left:40px;">File pack updates</span>
			</td></tr><tr><td>
				<span style="float:left;"><a href="feed.cfm?format=atom1&amp;list=cracktros" title="Scene Archive cracktro updates Atom feed"><img src="images/xml.gif" alt="Atom Feed" class="feedIcon" /></a></span>
				<span style="float:left;"><a href="feed.cfm?format=rss2&amp;list=cracktros" title="Scene Archive cracktro updates RSS feed"><img src="images/rss.gif" alt="RSS Feed" class="feedIcon" /></a></span>
				<span style="float:left; margin-left:40px;">New cracktros</span>
			</td></tr></table>
				<!---
				<span style="float:left;"></span>
				<span style="float:left;"></span>
				<span style="float:left; margin-left:40px;"></span>
				--->

			<div class="feedValidate">
				<a href="http://feedvalidator.org/check.cgi?url=http://www.defacto2.net/feed.cfm?format=rss2&amp;list=scenenews" title="Validate a Defacto2 RSS feed"><img src="images\valid-rss.png" alt="[Valid RSS]" style="border:0px; width:88px; height:31px;" /></a>
				&nbsp; &nbsp;
				<a href="http://feedvalidator.org/check.cgi?url=http://www.defacto2.net/feed.cfm?format=atom1&amp;list=scenenews" title="Validate a Defacto2 Atom 1.0 feed"><img src="images\valid-atom.png" alt="[Valid Atom 1.0]"  style="border:0px; width:88px; height:31px;" /></a>
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

<!--- Invokes web feeds --->
<cfif url.mode eq "sitenews" and url.format eq "rss2">
<cf_feed-app-rss2
	SQLWhere="Hide <> 1 AND Defacto2News = 1"
	SQLOrderBy="id desc"
	datasource="#application.newsSource#"
	table="thescenenews"
	title="Defacto2 - Site Related News"
	link="http://www.defacto2.net"
	category="The Scene"
	description="All the latest updates on Defacto2"
	itemtitle="title"
	itempubdate="OBCTime"
	itemdescription="description"
	itemsourceurl="SourceLink"
	itemsourcename="Source"
	cache="60"
	image="http://www.defacto2.net/images/btn-df2.gif"
	copyright="1996-#LSDateFormat(Now(),'YYYY')# Defacto2"
>
</cfif>
<cfif url.mode eq "sitenews" and url.format eq "atom1">
<cf_feed-app-atom1
	SQLWhere="Hide <> 1 AND Defacto2News = 1"
	SQLOrderBy="id desc"
	datasource="#application.newsSource#"
	table="thescenenews"
	title="Defacto2 - Site Related News"
	link="http://www.defacto2.net"
	category="The Scene"
	description="All the latest updates on Defacto2"
	authorname="Defacto2"
	authoruri="contact.cfm"
	itemtitle="title"
	itempubdate="OBCTime"
	itemupdateddate="OBCTime"
	itemdescription="description"
	itemauthorname="Author"
	itemsourceurl="SourceLink"
	itemsourcename="Source"
	cache="60"
	image="images/btn-df2.gif"
	icon="images/favicon.ico"
	copyright="© 1996-#LSDateFormat(Now(),'YYYY')# Defacto2"
>
</cfif>
<cfif url.mode eq "scenenews" and url.format eq "rss2">
<cf_feed-app-rss2
	SQLWhere="Hide <> 1 AND Defacto2News = 0"
	SQLOrderBy="id desc"
	datasource="#application.newsSource#"
	table="thescenenews"
	title="Defacto2 - The Scene News"
	link="http://www.defacto2.net"
	category="The Scene"
	description="All the latest news and happenings within the computer underground"
	itemtitle="title"
	itempubdate="OBCTime"
	itemdescription="description"
	itemsourceurl="SourceLink"
	itemsourcename="Source"
	cache="60"
	image="http://www.defacto2.net/images/btn-df2.gif"
	copyright="© 2004-#LSDateFormat(Now(),'YYYY')# Defacto2"
>
</cfif>
<cfif url.mode eq "scenenews" and url.format eq "atom1">
<cf_feed-app-atom1
	SQLWhere="Hide <> 1 AND Defacto2News = 0"
	SQLOrderBy="id desc"
	datasource="#application.newsSource#"
	table="thescenenews"
	title="Defacto2 - The Scene News"
	link="http://www.defacto2.net"
	category="The Scene"
	description="All the latest news and happenings within the computer underground"
	authorname="Defacto2"
	authoruri="contact.cfm"
	itemtitle="title"
	itempubdate="OBCTime"
	itemupdateddate="OBCTime"
	itemdescription="description"
	itemauthorname="Author"
	itemsourceurl="SourceLink"
	itemsourcename="Source"
	cache="60"
	image="images/btn-df2.gif"
	icon="images/favicon.ico"
	copyright="© 2004-#LSDateFormat(Now(),'YYYY')# Defacto2"
>
</cfif>
<cfif url.mode eq "tsn" and url.format eq "rss2">
<cf_feed-app-rss2
	SQLWhere="Hide <> 1"
	SQLOrderBy="id desc"
	datasource="#application.newsSource#"
	table="thescenenews"
	title="Defacto2 - The Scene News with Site News"
	link="http://www.defacto2.net"
	category="The Scene"
	description="All the latest news and happenings within the computer underground"
	itemtitle="title"
	itempubdate="OBCTime"
	itemdescription="description"
	itemsourceurl="SourceLink"
	itemsourcename="Source"
	cache="60"
	image="http://www.defacto2.net/images/btn-df2.gif"
	copyright="© 1996-#LSDateFormat(Now(),'YYYY')# Defacto2"
>
</cfif>
<cfif url.mode eq "tsn" and url.format eq "atom1">
<cf_feed-app-atom1
	SQLWhere="Hide <> 1"
	SQLOrderBy="id desc"
	datasource="#application.newsSource#"
	table="thescenenews"
	title="Defacto2 - The Scene News with Site News"
	link="http://www.defacto2.net"
	category="The Scene"
	description="All the latest news and happenings within the computer underground"
	authorname="Defacto2"
	authoruri="contact.cfm"
	itemtitle="title"
	itempubdate="OBCTime"
	itemupdateddate="OBCTime"
	itemdescription="description"
	itemauthorname="Author"
	itemsourceurl="SourceLink"
	itemsourcename="Source"
	cache="60"
	image="images/btn-df2.gif"
	icon="images/favicon.ico"
	copyright="© 2004-#LSDateFormat(Now(),'YYYY')# Defacto2"
>
</cfif>
<cfif url.mode eq "filepacks" and url.format eq "rss2">
<cf_feed-app-rss2
	datasource="#application.dataSource#"
	table="filepacks"
	title="Defacto2 - File Pack Updates"
	link="http://www.defacto2.net"
	category="The Scene"
	description="Find out instantly when a new updated file pack is ready for download"
	itemtitle="fulltitle"
	itempubdate="lastrevised"
	itemdescription="summarydes"
	cache="60"
	image="http://www.defacto2.net/images/btn-df2.gif"
	copyright="© 1996-#LSDateFormat(Now(),'YYYY')# Defacto2"
>
</cfif>
<cfif url.mode eq "filepacks" and url.format eq "atom1">
<cf_feed-app-atom1
	datasource="#application.dataSource#"
	table="filepacks"
	title="Defacto2 - File Pack Updates"
	link="http://www.defacto2.net"
	category="The Scene"
	description="Find out instantly when a new updated file pack is ready for download"
	authorname="Defacto2"
	authoruri="contact.cfm"
	itemtitle="fulltitle"
	itempubdate="lastrevised"
	itemupdateddate="lastrevised"
	itemdescription="summarydes"
	cache="60"
	image="images/btn-df2.gif"
	icon="images/favicon.ico"
	copyright="© 2004-#LSDateFormat(Now(),'YYYY')# Defacto2"
>
</cfif>
<cfif url.mode eq "cracktros" and url.format eq "rss2">
<cf_feed-app-rss2
	datasource="#application.crackSource#"
	table="cracktros"
	title="Defacto2 - Cracktros in The Scene Archives"
	link="http://www.defacto2.net"
	category="The Scene"
	description="Find out instantly when a new updated cracktro or installer is placed online"
	itemtitle="Filename"
	itempubdate="dateAdded"
	itemcategory="CreatedFor"
	cache="60"
	image="http://www.defacto2.net/images/btn-df2.gif"
	copyright="© 1996-#LSDateFormat(Now(),'YYYY')# Defacto2"
>
</cfif>
<cfif url.mode eq "cracktros" and url.format eq "atom1">
<cf_feed-app-atom1
	datasource="#application.crackSource#"
	table="cracktros"
	title="Defacto2 - Cracktros in The Scene Archives"
	link="http://www.defacto2.net"
	category="The Scene"
	description="Find out instantly when a new updated cracktro or installer is placed online"
	authorname="Defacto2"
	authoruri="contact.cfm"
	itemcategory="CreatedFor"	
	itemtitle="Filename"
	itempubdate="dateAdded"
	itemupdateddate="dateAdded"
	cache="60"
	image="images/btn-df2.gif"
	icon="images/favicon.ico"
	copyright="© 2004-#LSDateFormat(Now(),'YYYY')# Defacto2"
>
</cfif>
<cfif url.mode eq "newfiles" and url.format eq "rss2">
<cfinvoke component="cfcs.statistics" method="newestFiles" outputmode="feed" limit="20">
<cf_feed-app-rss2
	dbtype="query"
	table="application.RSCombined"
	SQLOrderBy="dateAdded desc"
	title="Defacto2 - Newest Files"
	link="http://www.defacto2.net"
	category="The Scene"
	description="Find out instantly when a new file is offered on the web site"
	maxItems="20"
	itemtitle="linkText"
	itempubdate="dateAdded"
	itemcategory="fileType"
	itemdescription="feedText"
	itemlink="feedLink"
	cache="60"
	image="http://www.defacto2.net/images/btn-df2.gif"
	copyright="© 1996-#LSDateFormat(Now(),'YYYY')# Defacto2"
>
</cfif>
<cfif url.mode eq "newfiles" and url.format eq "atom1">
<cfinvoke component="cfcs.statistics" method="newestFiles" outputmode="feed" limit="20">
<cf_feed-app-atom1
	dbtype="query"
	table="application.RSCombined"
	SQLOrderBy="dateAdded desc"
	title="Defacto2 - Newest Files"
	link="http://www.defacto2.net"
	category="The Scene"
	description="Find out instantly when a new file is offered on the web site"
	authorname="Defacto2"
	authoruri="contact.cfm"
	maxItems="20"
	itemtitle="linkText"
	itempubdate="dateAdded"
	itemupdateddate="dateAdded"
	itemcategory="fileType"
	itemdescription="feedText"
	itemlink="feedLink"
	cache="60"
	image="images/btn-df2.gif"
	icon="images/favicon.ico"
	copyright="© 1996-#LSDateFormat(Now(),'YYYY')# Defacto2"
>
</cfif>