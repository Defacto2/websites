<!--- 
Application: 	boxSyndication RSS
Author: 		Ben Garrett
Version: 		see the 'boxSynVersion' variable
File: 			box-rss.cfm
Update:			10007
Modified for Defacto2
 --->

<!--- © civBox Software 2006 --->
 
<!---
Sample Usage

Please read the software manual for more detailed information on each of the attributes

Below is an undocumented sample usage for a pretend RSS blog feed
See example-rss.cfm for a working example of an Atom feed

<cfmodule 
	template="box-rss.cfm"
	title="My Example Blog"
	link="http://www.myblog.com"
	description="This is the blog of a CF programmer"
	category="Personal Blog, ColdFusion, Programming, CFML"
	copyright="© 2006 CF Programmer"
	emaileditor="cfprogrammer@myblog.com"
	emailwebmaster="webmaster@myblog.com"
	image="http://www.myblog.com/images/myblogbutton.gif"

	datasource="FakeDSN"
	username="FakeUser"
	password="FakePW"
	table="MyBlog"

	itemTitle="blogTitle"
	itemPubDate="datePublished"
	itemUpdatedDate="dateUpdated"
	itemDescription="blogContent"
	itemCategory="blogCategory"
>
--->

<!--- Version variable --->
<cfset boxSynVersion='1.2'>
<!--- Server name and version --->
<cfset civBoxSerNam=server.ColdFusion.ProductName>
<cfset civBoxSerVer=server.ColdFusion.ProductVersion>
<cfset civBoxSerVer="#ListGetAt(civBoxSerVer,1)##ListGetAt(civBoxSerVer,2)##ListGetAt(civBoxSerVer,3)#">
<!--- ColdFusion/BlueDragon legacy compatibility --->
<cfif (civBoxSerNam contains 'ColdFusion' AND civBoxSerVer lt 700) OR (civBoxSerNam eq 'BlueDragon' AND civBoxSerVer lt 700)>
	<!--- variables values for ColdFusion/BlueDragon 6.x and earlier compatibility --->
	<cfset paramTypeNum="numeric">
<cfelse>
	<!--- variables values for ColdFusion 7.0.0 and later --->
	<cfset paramTypeNum="integer">
</cfif>
<!--- Declare attributes (database fields) --->
<cfparam name="attributes.cache" type="#paramTypeNum#" default="60">
<cfparam name="attributes.checkServer" type="boolean" default="yes">
<cfparam name="attributes.datasource" default="">
<cfparam name="attributes.dbLocation" default="">
<cfparam name="attributes.dbType" default="datasource">
<cfparam name="attributes.encoding" default="UTF-8">
<cfparam name="attributes.maxItems" type="#paramTypeNum#" default="20">
<cfparam name="attributes.outputFileName" default="">
<cfparam name="attributes.output" default="xml">
<cfparam name="attributes.password" default="">
<cfparam name="attributes.SQLSelect" default="*">
<cfparam name="attributes.SQLWhere" default="">
<cfparam name="attributes.SQLOrderBy" default="id desc">
<cfparam name="attributes.replaceCharCTL" default="">
<cfparam name="attributes.refresh" type="#paramTypeNum#" default="1440">
<cfparam name="attributes.table" default="">
<cfparam name="attributes.username" default="">
<!--- Declare attributes (channel/feed information) --->
<cfparam name="attributes.category" default="">
<cfparam name="attributes.copyright" default="">
<cfparam name="attributes.description" default="">
<cfparam name="attributes.emailEditor" default="">
<cfparam name="attributes.emailWebmaster" default="">
<cfparam name="attributes.image" default="">
<cfparam name="attributes.language" default="en-us">
<cfparam name="attributes.link" default="">
<cfparam name="attributes.title" default="">
<!--- Declare attributes (channel/feed content) --->
<cfparam name="attributes.itemAuthor" default="">
<cfparam name="attributes.itemCategory" default="">
<cfparam name="attributes.itemComments" default="">
<cfparam name="attributes.itemDescription" default="">
<cfparam name="attributes.itemLink" default="">
<cfparam name="attributes.itemPubDate" default="">
<cfparam name="attributes.itemSourceName" default="">
<cfparam name="attributes.itemSourceURL" default="">
<cfparam name="attributes.itemTitle" default="">
<!--- Declare attributes (attachments/enclosures) --->
<cfparam name="attributes.itemFileSize" default="">
<cfparam name="attributes.itemFileType" default="">
<cfparam name="attributes.itemFileURL" default="">

<!--- Function to validate URLs --->
<cffunction name="validateURL" hint="Validate a URL address" returntype="string" output="true">
	<cfargument name="URL" type="string" required="yes">
	<cfset validated="true">
	<!--- check for :// --->
	<cfif URL DOES NOT CONTAIN "://"><cfset validated="false"></cfif>
	<cfif Find("://",URL) LT 4><cfset validated="false"></cfif>
	<cfset addressLen=len(URL)-(Find("://",URL)+2)>
	<!--- check that there is an address after the :// characters --->
	<cfif len(URL) GT addressLen AND addressLen neq 0>
		<cfset address="#right(URL,addressLen)#">
		<!--- remove the directories, if they exist --->
		<cfif Find("/",address) neq 0>
			<cfset address="#left(address,Find('/',address)-1)#">
		</cfif>
		<!--- check that the address doesnt contain ://. --->
		<cfif Find(".",address) eq 1><cfset address=""></cfif>
	<cfelse>
		<cfset address="">
	</cfif>
	<!--- check that the domain of the address is either 2 or 3 characters long and is headed by a '.' --->
	<cfif len(right(address,4)) GT 0>
		<cfset domain=right(address,4)>
		<cfif Find(".",domain) neq 1 AND Find(".",domain) neq 2><cfset validated="false"></cfif>
	<cfelse>
		<cfset validated="false">
	</cfif>
	<cfif address DOES NOT CONTAIN "."><cfset validated="false"></cfif>
	<cfif len(address) LT 4><cfset validated="false"></cfif>
	<cfreturn validated>
</cffunction>
<!--- Function to extract an address from a full URL --->
<cffunction name="URLAddress" hint="Extract the address from a full URL" returntype="string" output="true">
	<cfargument name="URL" type="string" required="yes">
	<cfif Find("://",URL) LT 4><cfset validated="false"></cfif>
	<cfset addressLen=len(URL)-(Find("://",URL)+2)>
	<cfset address="#right(URL,addressLen)#">
	<cfif Find("www.",address) eq 1>
		<cfset addressLen=(len(address)-4)>
		<cfset address="#right(address,addressLen)#">
	</cfif>
	<cfif Find("/",address) neq 0>
		<cfset address="#left(address,Find('/',address)-1)#">
	</cfif>
	<cfreturn address>
</cffunction>
<!--- Function that cleans up and converts text to either HTML tags or Unicode characters --->
<cffunction name="cleanText" hint="Removes ASCII tabs and new line character codes from text" returntype="string" output="true">
	<cfargument name="preText" type="string" required="yes">
	<cfargument name="convertTo" type="string" required="no" default="">
	<cfset var text = preText>
	<cfif convertTo eq "BR" or convertTo eq "P">
		<cfset text = replaceNoCase(text,chr(13)&chr(10),chr(10),'all')>
		<cfset text = replaceNoCase(text,chr(13),chr(10),'all')>
		<cfset text = replaceNoCase(text,chr(9),'&nbsp;&nbsp;&nbsp;','all')>
		<cfset text = replaceNoCase(text,chr(10),'<br />','all')>
	</cfif>
	<cfif convertTo eq "P">
		<cfset text = replaceNoCase(text,'<br /><br />','<p></p>','all')>
	</cfif>
	<!--- converts MS-Windows superset characters (Windows-1252) into their unicode counterparts --->
	<cfset text = replaceNoCase(text,chr(8218),'&##8218;','all')>	<!--- ‚ --->
	<cfset text = replaceNoCase(text,chr(402),'&##402;','all')>		<!--- ƒ --->
	<cfset text = replaceNoCase(text,chr(8222),'&##8222;','all')>	<!--- „ --->
	<cfset text = replaceNoCase(text,chr(8230),'&##8230;','all')>	<!--- … --->
	<cfset text = replaceNoCase(text,chr(8224),'&##8224;','all')>	<!--- † --->
	<cfset text = replaceNoCase(text,chr(8225),'&##8225;','all')>	<!--- ‡ --->
	<cfset text = replaceNoCase(text,chr(710),'&##710;','all')>		<!--- ˆ --->
	<cfset text = replaceNoCase(text,chr(8240),'&##8240;','all')>	<!--- ‰ --->
	<cfset text = replaceNoCase(text,chr(352),'&##352;','all')>		<!--- Š --->
	<cfset text = replaceNoCase(text,chr(8249),'&##8249;','all')>	<!--- ‹ --->
	<cfset text = replaceNoCase(text,chr(338),'&##338;','all')>		<!--- Œ --->
	<cfset text = replaceNoCase(text,chr(8216),'&##8216;','all')>	<!--- ‘ --->
	<cfset text = replaceNoCase(text,chr(8217),'&##8217;','all')>	<!--- ’ --->
	<cfset text = replaceNoCase(text,chr(8220),'&##8220;','all')>	<!--- “ --->
	<cfset text = replaceNoCase(text,chr(8221),'&##8221;','all')>	<!--- ” --->
	<cfset text = replaceNoCase(text,chr(8226),'&##8226;','all')>	<!--- • --->
	<cfset text = replaceNoCase(text,chr(8211),'&##8211;','all')>	<!--- – --->
	<cfset text = replaceNoCase(text,chr(8212),'&##8212;','all')>	<!--- — --->
	<cfset text = replaceNoCase(text,chr(732),'&##732;','all')>		<!--- ˜ --->
	<cfset text = replaceNoCase(text,chr(8482),'&##8482;','all')>	<!--- ™ --->
	<cfset text = replaceNoCase(text,chr(353),'&##353;','all')>		<!--- š --->
	<cfset text = replaceNoCase(text,chr(8250),'&##8250;','all')>	<!--- › --->
	<cfset text = replaceNoCase(text,chr(339),'&##339;','all')>		<!--- œ --->
	<cfset text = replaceNoCase(text,chr(376),'&##376;','all')>		<!--- Ÿ --->
	<cfset text = replaceNoCase(text,chr(376),'&##376;','all')>		<!--- Ÿ --->
	<cfset text = replaceNoCase(text,chr(8364),'&##8364','all')>	<!--- € --->
	<cfreturn text>
</cffunction>
<!--- Defacto2 Extra function: Encrypts a string using URL safe encryption --->
<cfscript>
function urlEncrypt(urlString){
	var plainString = cfusion_encrypt(urlString, "#application.urlEncryptionKey#");
	var codedString = plainString & "-EN";
	return codedString;
} 
</cfscript>

<!--- Error checking and throw messages --->
<cfif attributes.datasource eq "" and attributes.dbtype neq "query">
	<cfthrow message="A required attribute was not provided" 
	detail="Missing: 'datasource' - A database source (DSN) must be provided">
</cfif>
<cfif attributes.table eq "">
	<cfthrow message="A required attribute was not provided"
	detail="Missing: 'table' - A database table must be provided">
</cfif>
<cfif attributes.title eq "">
	<cfthrow message="A required attribute was not provided"
	detail="Missing: 'title' - You must name your feed">
</cfif>
<cfif attributes.link eq "">
	<cfthrow message="A required attribute was not provided" 
	detail="Missing: 'link' - You must provide a web address for your web site">
</cfif>
<cfif attributes.itemTitle eq "">
	<cfthrow message="A required attribute was not provided"
	detail="Missing: 'itemTitle' - You must provide a table field which contains the titles (names) of the RSS items">
</cfif>
<cfif validateURL(attributes.link) eq "false">
	<cfthrow message="Incomplete or invalid URL"
	detail="Invalid: 'link' (#attributes.link#) - You must provide a full URL address for the link attribute, ie http://www.myexamplesite.com">
</cfif>

<!--- dbLocation attribute to allow a template to be incorporated into the application prior to the query --->
<!--- this useful for incorporating query of queries --->
<cfif attributes.dbLocation neq "">
	<cfif fileExists(expandPath(attributes.dbLocation)) neq true>
		<cfthrow message="Can not find file"
		detail="Invalid: 'dbLocation' - Can not find this file #attributes.dbLocation# (#expandPath(attributes.dbLocation)#)">
	<cfelse>
		<cfinclude template="#attributes.dbLocation#">
	</cfif>
</cfif>

<!--- Query the database using attributes --->
<cfif attributes.dbtype eq "query">
	<!--- record source is a queries of query --->
	<cfquery name="RSSrecordset" dbtype="query" cachedwithin="#CreateTimeSpan(0,0,attributes.cache,0)#" password="#attributes.password#" username="#attributes.username#" maxrows="#attributes.maxItems#">
		SELECT #attributes.SQLSelect# FROM #attributes.table#<cfif attributes.SQLWhere neq ""> WHERE #PreserveSingleQuotes(attributes.SQLWhere)#</cfif> <cfif attributes.SQLOrderBy neq "">ORDER BY #PreserveSingleQuotes(attributes.SQLOrderBy)#</cfif>
	</cfquery>
<cfelse>
	<cfquery name="RSSrecordset" dbtype="#attributes.dbtype#" datasource="#attributes.datasource#" cachedwithin="#CreateTimeSpan(0,0,attributes.cache,0)#" password="#attributes.password#" username="#attributes.username#" maxrows="#attributes.maxItems#">
		SELECT #attributes.SQLSelect# FROM #attributes.table#<cfif attributes.SQLWhere neq ""> WHERE #PreserveSingleQuotes(attributes.SQLWhere)#</cfif> <cfif attributes.SQLOrderBy neq "">ORDER BY #PreserveSingleQuotes(attributes.SQLOrderBy)#</cfif>
	</cfquery>
</cfif>

<!--- Remove white spaces (requirement for xml) --->
<!--- Note: The multiple <cfoutput> tags are used to control excess whitespace and to format the xml source --->
<cfsetting enablecfoutputonly="yes">
<!--- Save content as a variable --->
<cfsavecontent variable="rssXML">
<cfoutput><?xml version="1.0" encoding="#attributes.encoding#" ?>
	<rss version="2.0">
    	<channel>
		</cfoutput>
		<!--- channel information --->
		<!--- title of the feed --->
       	<cfoutput><title>#XMLFormat(cleanText(attributes.title))#</title>
		</cfoutput>
		<!--- rss generator (ie this application) - please place any modifications (to the app version) after the web address --->
		<cfoutput><generator>#XMLFormat("boxSyndication #boxSynVersion# (http://www.civbox.org/)")#</generator>
		</cfoutput>
		<!--- location of the RSS technical documentation --->
		<cfoutput><docs>http://blogs.law.harvard.edu/tech/rss</docs>
		</cfoutput>
		<!--- converts current time into UTC/GMT format --->
       	<cfoutput><lastBuildDate>#dateformat(DateConvert('local2utc',now()), "ddd, dd mmm yyyy")# #timeformat(DateConvert('local2utc',now()), "HH:mm:ss")# GMT</lastBuildDate>
		</cfoutput>
		<!--- url to the feed's web site --->
		<cfoutput><link>#XMLFormat(attributes.link)#</link>
		</cfoutput>
		<!--- news reader refresh rate (time to live) --->
		<cfoutput><ttl>#attributes.refresh#</ttl>
		</cfoutput>
		<!--- phrase or sentence describing the feed --->
		<cfif attributes.description neq "">
		<cfoutput><description>#XMLFormat(cleanText(attributes.description))#</description>
		</cfoutput>
		<cfelse>
		<cfoutput><description></description>
		</cfoutput>
		</cfif>
		<!--- copyright notice --->
		<cfif attributes.copyright neq ""><cfoutput><copyright>#XMLFormat(cleanText(attributes.copyright))#</copyright>
		</cfoutput></cfif>
		<!--- language the feed is written in --->
		<cfoutput><language>#XMLFormat(attributes.language)#</language>
		</cfoutput>
		<!--- contact email information --->
		<cfif attributes.emailEditor neq ""><cfoutput><managingEditor>#XMLFormat(attributes.emailEditor)#</managingEditor>
		</cfoutput></cfif>
		<cfif attributes.emailWebmaster neq ""><cfoutput><webMaster>#XMLFormat(attributes.emailWebmaster)#</webMaster>
		</cfoutput></cfif>
		<!--- list categories for the feed --->
		<cfif attributes.category neq "">
		<cfloop index="Category" list="#attributes.category#">
		<cfoutput><category>#XMLFormat(trim(Category))#</category>
		</cfoutput>
		</cfloop>
		</cfif>
		<!--- image (ie a logo) to associate with the feed --->
		<cfif attributes.image neq "">
		<cfoutput><image>
			<title>#XMLFormat(cleanText(attributes.title))#</title>
			<url>#XMLFormat(attributes.image)#</url>
			<link>#XMLFormat(attributes.link)#</link>
		</image>
		</cfoutput>
		</cfif>
		<!--- item information --->
		<cftry><cfloop query="RSSrecordset" startrow="1" endrow="#attributes.maxItems#">
		<cfoutput><item>
			</cfoutput>
			<!--- item unique ID using date/time function --->
			<cfif attributes.itemPubDate neq "" AND evaluate(attributes.itemPubDate) neq "">
				<cfset civBoxUniqueID="#URLAddress(attributes.link)#,#dateformat(DateConvert('local2utc',evaluate(attributes.itemPubDate)), "yyyy-mm-dd")#:/#evaluate(ListGetAt(attributes.SQLOrderBy,1,' '))#">
			<cfelse>
				<cfset civBoxUniqueID="#URLAddress(attributes.link)#,:/#evaluate(ListGetAt(attributes.SQLOrderBy,1,' '))#">
			</cfif>	
			<!--- title, link and description --->
			<cfif evaluate(attributes.itemTitle) neq "">
			<cfoutput><title>#XMLFormat(cleanText(evaluate(attributes.itemTitle)))#</title>
			</cfoutput>
			<cfelse>
			<cfoutput><title>No Title Provided</title>
			</cfoutput>
			</cfif>
			<!--- Defacto2: modification--->
			<cfif attributes.title eq "Defacto2 - Site Related News" or attributes.title eq "Defacto2 - The Scene News" or attributes.title eq "Defacto2 - The Scene News with Site News">
			<cfoutput><link>#XMLFormat('http://www.defacto2.net/news.cfm?mode=feed&id=#evaluate(ListGetAt(attributes.SQLOrderBy,1,' '))#')#</link>
			</cfoutput></cfif>			
			<cfif attributes.table eq "filepacks">
			<cfif RSSrecordset.nolocal eq true><cfset downloadAttr="downloads;#filename#;#filesize#;nolocal;#fulltitle#">
			<cfelse><cfset downloadAttr="downloads;#filename#;#filesize#;#fulltitle#">
			</cfif>
			<cfoutput><link>http://www.defacto2.net/download.cfm?#urlEncrypt(downloadAttr)#</link>
			</cfoutput></cfif>
			<cfif attributes.table eq "cracktros">
			<cfoutput><link>#XMLFormat('http://www.defacto2.net/cracktros.cfm?mode=file&value=#filename#')#</link>
			</cfoutput></cfif>
			<cfif attributes.itemLink neq "" AND evaluate(attributes.itemLink) neq "" and attributes.table neq "filepacks" and attributes.table neq "cracktros">
			<cfoutput><link>#XMLFormat(evaluate(attributes.itemLink))#</link>
			</cfoutput></cfif>
			<!--- Defacto2: modification--->
			<cfif attributes.table neq "cracktros" and attributes.itemDescription neq "" AND evaluate(attributes.itemDescription) neq "">
			<cfif attributes.replaceCharCTL eq "P">
			<cfoutput><description>#XMLFormat(cleanText(evaluate(attributes.itemDescription),"P"))#</description>
			</cfoutput>
			<cfelseif attributes.replaceCharCTL eq "BR">
			<cfoutput><description>#XMLFormat(cleanText(evaluate(attributes.itemDescription),"BR"))#</description>
			</cfoutput>
			<cfelse>
			<cfoutput><description>#XMLFormat(cleanText(evaluate(attributes.itemDescription)))#</description>
			</cfoutput>
			</cfif>
			<cfelseif attributes.table eq "cracktros">
			<cfoutput><description>#XMLFormat("File: #filename#<br />Group: #CreatedFor#<br />Year: #Year#<br />Author: #Author#<p></p><img src='http://www.defacto2.net/images/cracktro-scenes/#filename#.png' alt='#filename# Screenshot' title='#filename# Screenshot' />")#</description>
			</cfoutput>
			</cfif>
			<!--- email address and/or name of the author of the item ie "jblogs@hotmail.com (Joe Blogs)" --->
			<cfif attributes.itemAuthor neq "" AND evaluate(attributes.itemAuthor) neq "">
			<cfoutput><author>#XMLFormat(ListGetAt(evaluate(attributes.itemAuthor),1))#</author>
			</cfoutput>
			</cfif>
			<!--- list categories for the item <cfif attributes.itemCategory neq "" AND evaluate(attributes.itemCategory) neq "">--->
			<cfif attributes.itemCategory neq "">
			<cfloop index="itemCat" list="#evaluate(attributes.itemCategory)#">
			<cfoutput><category>#XMLFormat(trim(itemCat))#</category>
			</cfoutput>
			</cfloop>
			</cfif>										
			<!--- full url to the web page that contains comments regarding this specific item --->
			<cfif attributes.itemComments neq "" AND evaluate(attributes.itemComments) neq ""><cfoutput><comments>#XMLFormat(evaluate(attributes.itemComments))#</comments>
			</cfoutput></cfif>
			<!--- item published date/time converted to UTC/GMT time --->
			<cfif attributes.itemPubDate neq "" AND evaluate(attributes.itemPubDate) neq ""><cfoutput><pubDate>#dateformat(DateConvert('local2utc',evaluate(attributes.itemPubDate)), "ddd, dd mmm yyyy")# #timeformat(DateConvert('local2utc',evaluate(attributes.itemPubDate)), "HH:mm:ss")# GMT</pubDate>
			</cfoutput></cfif>						
			<!--- item source ---> 
			<cfif attributes.itemSourceURL neq "" AND evaluate(attributes.itemSourceURL) neq ""><cfoutput><source url="#XMLFormat(evaluate(attributes.itemSourceURL))#"><cfif attributes.itemSourceName neq "" AND evaluate(attributes.itemSourceName) neq "">#XMLFormat(evaluate(attributes.itemSourceName))#</cfif></source>
			</cfoutput></cfif>
			<!--- file attachment (ie an enclosure) --->
			<cfif attributes.itemFileURL neq "" AND evaluate(attributes.itemFileURL) neq "">
			<cfoutput><enclosure url="#XMLFormat(evaluate(attributes.itemFileURL))#" <cfif attributes.itemFileSize neq "" AND evaluate(attributes.itemFileSize) neq "">length="#XMLFormat(evaluate(attributes.itemFileSize))#"</cfif>
			<cfif attributes.itemFileType neq "" AND evaluate(attributes.itemFileType) neq "">type="#XMLFormat(evaluate(attributes.itemFileType))#"</cfif> />
			</cfoutput></cfif>
			<cfoutput><guid isPermaLink="false">#XMLFormat(civBoxUniqueID)#</guid>
		</cfoutput>
		<cfif RSSrecordset.currentrow eq RSSrecordset.recordcount>
		<cfoutput></item>
	</cfoutput>
		<cfelse>
		<cfoutput></item>
		</cfoutput>
		</cfif>
	</cfloop>
	<cfoutput></channel>
</rss></cfoutput>
		<!--- Checking for invalid field names in the database table --->
		<cfcatch type="expression">
		<cfif left(CFCatch.Message,8) eq "Variable" AND right(CFCatch.Message,13) eq "is undefined.">
			<cfoutput>
				<cfthrow message="The field name '#ListGetAt(CFCatch.Message, 2, " ")#' can not be found in the table '#attributes.table#'" detail="">
			</cfoutput>
		</cfif>	
		</cfcatch>
		</cftry>
</cfsavecontent>

<!--- removes a CF bug whereby a leading whitespace is created inbetween tags --->
<cfset rssXML=replaceNoCase(rssXML,'> ','>','all')>
<!--- removes a CF bug whereby the © character returns Â© --->
<cfset rssXML=replaceNoCase(rssXML,'&##xc2;&##xa9;','&##xa9;','all')>

<cfif attributes.output eq "file" AND attributes.outputFileName neq "">
	<!--- save the feed as a file --->
	<cffile action="write" file="#attributes.outputFileName#" output="#rssXML#">
<cfelseif attributes.output eq "text">
	<cfcontent type="text/plain">
	<cfoutput>#rssXML#</cfoutput>
<cfelse>
	<cfcontent type="text/xml">
	<cfoutput>#rssXML#</cfoutput>
</cfif>