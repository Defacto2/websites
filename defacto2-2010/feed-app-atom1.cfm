<!--- 
Application: 	boxSyndication Atom
Author: 		Ben Garrett
Version: 		see the 'boxSynVersion' variable
File: 			box-atom.cfm
Update:			10009
Modified for Defacto2
 --->

<!--- © civBox Software 2006 --->
 
<!---
Sample Usage

Please read the software manual for more detailed information on each of the attributes

Below is an undocumented sample usage for a pretend Atom blog feed
See example-atom.cfm for a working example of an Atom feed

<cfmodule 
	template="box-atom.cfm" 
	title="My Example Blog"
	link="http://www.myblog.com"
	description="This is the blog of a CF programmer"
	category="Personal Blog, ColdFusion, Programming, CFML"
	copyright="© 2006 CF Programmer"
	authorName="CF Programmer"
	authorEmail="cfprogrammer@myblog.com"
	image="/images/myblogbutton.gif"
	icon="/images/favicon.ico"

	datasource="FakeDSN"
	username="FakeUser"
	password="FakePW"
	table="MyBlog"
	
	itemTitle="blogTitle"
	itemPubDate="datePublished"
	itemUpdatedDate="dateUpdated"
	itemContent="blogContent"
	itemCategory="blogCategory"
	
	itemSourceName="blogSource"
	itemSourceURI="blogSourceURL"
	
	itemAuthorName="blogAuthor"
	itemAuthorEmail="blogAuthorEmail"
	itemContributorName="blogContributor"
	itemContributorEmail="blogContributorEmail"
	itemContributorURI="blogContributorURI"
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
<cfparam name="attributes.output" default="display">
<cfparam name="attributes.password" default="">
<cfparam name="attributes.replaceCharCTL" default="">
<cfparam name="attributes.SQLSelect" default="*">
<cfparam name="attributes.SQLWhere" default="">
<cfparam name="attributes.SQLOrderBy" default="id desc">
<cfparam name="attributes.table" default="">
<cfparam name="attributes.username" default="">
<!--- Declare attributes (channel/feed information) --->
<cfparam name="attributes.authorEmail" default="">
<cfparam name="attributes.authorName" default="">
<cfparam name="attributes.authorURI" default="">
<cfparam name="attributes.category" default="">
<cfparam name="attributes.contributorEmail" default="">
<cfparam name="attributes.contributorName" default="">
<cfparam name="attributes.contributorURI" default="">
<cfparam name="attributes.copyright" default="">
<cfparam name="attributes.description" default="">
<cfparam name="attributes.icon" default="">
<cfparam name="attributes.image" default="">
<cfparam name="attributes.language" default="en-us">
<cfparam name="attributes.link" default="">
<cfparam name="attributes.title" default="">
<cfparam name="attributes.itemUpdatedDateDefault" default="">
<!--- Declare attributes (channel/feed content) --->
<cfparam name="attributes.itemAuthorEmail" default="">
<cfparam name="attributes.itemAuthorName" default="">
<cfparam name="attributes.itemAuthorURI" default="">
<cfparam name="attributes.itemCategory" default="">
<cfparam name="attributes.itemCopyright" default="">
<cfparam name="attributes.itemContent" default="">
<cfparam name="attributes.itemDescription" default="">
<cfif attributes.itemDescription neq "" AND attributes.itemContent eq "">
	<!--- incase people mistakenly use the RSS attribute itemDescription instead of the Atom itemContent --->
	<cfset attributes.itemContent=attributes.itemDescription>
</cfif>
<cfparam name="attributes.itemContributorEmail" default="">
<cfparam name="attributes.itemContributorName" default="">
<cfparam name="attributes.itemContributorURI" default="">
<cfparam name="attributes.itemLink" default="">
<cfparam name="attributes.itemPubDate" default="">
<cfparam name="attributes.itemSourceName" default="">
<cfparam name="attributes.itemSourceURI" default="">
<cfparam name="attributes.itemSourceURL" default="">
<cfif attributes.itemSourceURL neq "" AND attributes.itemSourceURI eq "">
	<!--- incase people mistakenly use the RSS attribute itemSourceURL instead of the Atom itemSourceURI --->
	<cfset attributes.itemSourceURI=attributes.itemSourceURL>
</cfif>
<cfparam name="attributes.itemUpdatedDate" default="">
<!--- Declare attributes (attachments/enclosures) --->
<cfparam name="attributes.itemFileLength" default="">
<cfparam name="attributes.itemFileSize" default="">
<cfparam name="attributes.itemFileTitle" default="">
<cfparam name="attributes.itemFileType" default="">
<cfparam name="attributes.itemFileURI" default="">
<cfparam name="attributes.itemFileURL" default="">
<cfif attributes.itemFileURL neq "" AND attributes.itemFileURI eq "">
	<!--- incase people mistakenly use the RSS attribute itemFileURL instead of the Atom itemFileURI --->
	<cfset attributes.itemFileURI=attributes.itemFileURL>
</cfif>

<!--- Defacto2: Extra attributes --->
<cfparam name="attributes.filter" default="">


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
<!--- Function to check that URI has a required / --->
<cffunction name="URLFS" hint="Check that the address is complete" returntype="string" output="true">
	<cfargument name="URL" type="string" required="yes">
	<cfif reverse(URL) neq "/">
		<cfset address="#URL#/">
	</cfif>
	<cfreturn address>
</cffunction>
<!--- Defacto2 Extra function: Encrypts a string using URL safe encryption --->
<cfscript>
function urlEncrypt(urlString){
	var plainString = cfusion_encrypt(urlString, "#application.urlEncryptionKey#");
	var codedString = plainString & "-EN";
	return codedString;
} 
</cfscript>
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
	detail="Missing: 'itemTitle' - You must provide a table field which contains the titles (names) of the entries">
</cfif>
<cfif attributes.itemUpdatedDate eq "" AND attributes.itemUpdatedDateDefault eq "">
	<cfthrow message="A required attribute was not provided"
	detail='Missing: "itemUpdatedDate" - You must provide a table field which details the last major update of the entries
	<p></p>Or supply the a default universal date using the itemUpdatedDateDefault attribute<p></p>
	itemUpdatedDateDefault="yy,mm,dd"<br>
	yy = year (two or four digit)<br>
	mm = numeric month<br>
	dd = numeric date
	'>
</cfif>
<cfif validateURL(attributes.link) eq "false">
	<cfthrow message="Incomplete or invalid URL"
	detail="Invalid: 'link' (#attributes.link#) - You must provide a full URL address for the link attribute, ie http://www.myexamplesite.com">
</cfif>
<cfif attributes.authorEmail neq "" AND ListLen(attributes.authorEmail) neq ListLen(attributes.authorName)>
	<cfthrow message="authorEmail listLen mismatch"
	detail="When used, the authorEmail attribute must contain the same number of list items as the authorName attribute
	<br>Note: ColdFusion ignores empty list items. If you wish to create an empty item use a - (dash) instead
	<p></p>
	authorName:	'#attributes.authorName#'<br>
	authorEmail:	'#attributes.authorEmail#'
	">
	</cfif>
<cfif attributes.authorURI neq "" AND ListLen(attributes.authorURI) neq ListLen(attributes.authorName)>
	<cfthrow message="authorURI list mismatch"
	detail="When used, the authorURI attribute must contain the same number of list items as the authorName attribute
	<br>Note: ColdFusion ignores empty list items. If you wish to create an empty item use a - (dash) instead
	<p></p>
	authorName:	'#attributes.authorName#'<br>
	authorURI:	'#attributes.authorURI#'
	">
</cfif>
<cfif attributes.contributorEmail neq "" AND ListLen(attributes.contributorEmail) neq ListLen(attributes.contributorName)>
	<cfthrow message="contributorEmail listLen mismatch"
	detail="When used, the contributorEmail attribute must contain the same number of list items as the contributorName attribute
	<br>Note: ColdFusion ignores empty list items. If you wish to create an empty item use a - (dash) instead
	<p></p>
	contributorName:	'#attributes.contributorName#'<br>
	contributorEmail:	'#attributes.contributorEmail#'
	">
</cfif>
<cfif attributes.contributorURI neq "" AND ListLen(attributes.contributorURI) neq  ListLen(attributes.contributorName)>
	<cfthrow message="contributorURI list mismatch"
	detail="When used, the contributorURI attribute must contain the same number of list items as the contributorName attribute
	<br>Note: ColdFusion ignores empty list items. If you wish to create an empty item use a - (dash) instead
	<p></p>
	contributorName:	'#attributes.contributorName#'<br>
	contributorURI:		'#attributes.contributorURI#'
	">
</cfif>
<cfif attributes.itemContributorEmail neq "" AND ListLen(attributes.itemContributorEmail) neq ListLen(attributes.itemContributorName)>
	<cfthrow message="itemContributorEmail listLen mismatch"
	detail="When used, the itemContributorEmail attribute must contain the same number of list items as the itemContributorName attribute
	<br>Note: ColdFusion ignores empty list items. If you wish to create an empty item use a - (dash) instead
	<p></p>
	itemContributorName:	'#evaluate(attributes.itemContributorName)#'<br>
	itemContributorEmail:	'#evaluate(attributes.itemContributorEmail)#'
	">
</cfif>
<cfif attributes.itemContributorURI neq "" AND ListLen(attributes.itemContributorURI) neq ListLen(attributes.itemContributorName)>
	<cfthrow message="itemContributorURI listLen mismatch"
	detail="When used, the itemContributorURI attribute must contain the same number of list items as the itemContributorName attribute
	<br>Note: ColdFusion ignores empty list items. If you wish to create an empty item use a - (dash) instead
	<p></p>
	itemContributorName:	'#evaluate(attributes.itemContributorName)#'<br>
	itemContributorURI:	'#evaluate(attributes.itemContributorURI)#'
	">
</cfif>
<cfif attributes.itemUpdatedDateDefault neq "">
 	<cfif ListLen(attributes.itemUpdatedDateDefault) neq 3 OR IsNumeric(ListGetAt(attributes.itemUpdatedDateDefault,1)) eq false OR IsNumeric(ListGetAt(attributes.itemUpdatedDateDefault,2)) eq false OR IsNumeric(ListGetAt(attributes.itemUpdatedDateDefault,3)) eq false>
	<cfthrow message="Incorrect format used for the itemUpdatedDateDefault attribute"
	detail='itemUpdatedDateDefault="yy,mm,dd"<br>
	yy = year (two or four digit)<br>
	mm = numeric month<br>
	dd = numeric date
	<p></p>
	Your itemUpdatedDateDefault value = #attributes.itemUpdatedDateDefault#
	'>
	</cfif>
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
<cfsetting enablecfoutputonly="yes">
<!--- Save content as a variable --->
<cfsavecontent variable="rssXML">
<cfoutput><?xml version="1.0" encoding="#attributes.encoding#" ?>
<feed xmlns="http://www.w3.org/2005/Atom" xml:lang="#attributes.language#">
	</cfoutput>
	<!--- rss generator (ie this application) - please place any modifications (to the app version) after the web address --->
	<cfoutput><generator uri="http://www.civbox.org/" version="#boxSynVersion#">boxSyndication</generator>
	</cfoutput>
	<!--- title of the feed --->
	<cfoutput><title type="html">#XMLFormat(cleanText(attributes.title))#</title>
	</cfoutput>
	<!--- feed identifier --->
	<cfif left(reverse(attributes.link),1) neq "/">
	<cfoutput><id>#XMLFormat(attributes.link)#/</id>
	</cfoutput>
	<cfelse>
	<cfoutput><id>#XMLFormat(attributes.link)#</id>
	</cfoutput>
	</cfif>
	<!--- url to the current feed --->
	<cfif cgi.https EQ "on"><cfset civBoxLinkSelf="https://"><cfelse><cfset civBoxLinkSelf="http://"></cfif>
	<cfset civBoxLinkSelf=civBoxLinkSelf&"#cgi.server_name##cgi.script_name#">
	<cfif #cgi.query_string# neq ""><cfset civBoxLinkSelf=civBoxLinkSelf&"?#cgi.query_string#"></cfif>				
	<cfoutput><link rel="self" href="#XMLFormat(civBoxLinkSelf)#" />
	</cfoutput>
	<!--- url to the feed's web site --->
	<cfset civBoxAltLinkCheck="#URLFS(attributes.link)#">
	<cfoutput><link rel="alternate" href="#XMLFormat(civBoxAltLinkCheck)#" />
	</cfoutput>
	<!--- time the feed was generated --->
	<cfoutput><updated>#dateformat(DateConvert('local2utc',now()), "yyyy-mm-dd")#T#timeformat(DateConvert('local2utc',now()), "HH:mm:ss")#Z</updated>
	</cfoutput>
	<!--- copyright information --->
	<cfif attributes.copyright neq "">
	<cfoutput><rights type="html">#XMLFormat(cleanText(attributes.copyright))#</rights>
	</cfoutput></cfif>
	<!--- phrase or sentence describing the feed --->
	<cfif attributes.description neq "">
	<cfoutput><subtitle>#XMLFormat(cleanText(attributes.description))#</subtitle>
	</cfoutput></cfif>
	<!--- author's details --->
	<cfif attributes.authorName neq "">
	<cfset loopCount=0>
	<cfset loopEnd=#ListLen(attributes.authorName)#>
	<cfloop index="loopCount" from="1" to="#loopEnd#" step="1">
	<cfoutput><author>
		</cfoutput>
		<cfif attributes.authorEmail neq "" AND ListGetAt(attributes.authorEmail, loopCount) neq "-">
		<cfoutput><email>#XMLFormat(trim(ListGetAt(attributes.authorEmail, loopCount)))#</email>
		</cfoutput></cfif>
		<cfif attributes.authorURI neq "" AND ListGetAt(attributes.authorURI, loopCount) neq "-">
		<cfoutput><uri>#XMLFormat(trim(ListGetAt(attributes.authorURI, loopCount)))#<cfif left(reverse(attributes.authorURI),1) neq "/">#XMLFormat("/")#</cfif></uri>
		</cfoutput></cfif>	
		<cfoutput><name>#XMLFormat(trim(ListGetAt(attributes.authorName, loopCount)))#</name>
	</cfoutput>						
	<cfoutput></author>
	</cfoutput>
	</cfloop>
	</cfif>
	<!--- contributor's details --->
	<cfif attributes.contributorName neq "">
	<cfset loopCount=0>
	<cfset loopEnd=#ListLen(attributes.contributorName)#>
	<cfloop index="loopCount" from="1" to="#loopEnd#" step="1">
	<cfoutput><contributor>
		</cfoutput>
		<cfif attributes.contributorEmail neq "" AND ListGetAt(attributes.contributorEmail, loopCount) neq "-">
		<cfoutput><email>#XMLFormat(trim(ListGetAt(attributes.contributorEmail, loopCount)))#</email>
		</cfoutput></cfif>
		<cfif attributes.contributorURI neq "" AND ListGetAt(attributes.contributorURI, loopCount) neq "-">
		<cfoutput><uri>#XMLFormat(trim(ListGetAt(attributes.contributorURI, loopCount)))#<cfif left(reverse(attributes.contributorURI),1) neq "/">#XMLFormat("/")#</cfif></uri>
		</cfoutput></cfif>		
		<cfoutput><name>#XMLFormat(trim(ListGetAt(attributes.contributorName, loopCount)))#</name>
	</cfoutput>					
	<cfoutput></contributor>
	</cfoutput>
	</cfloop>
	</cfif>				
	<!--- feed category --->
	<cfif attributes.category neq "">
	<cfloop index="Category" list="#attributes.category#">
	<cfoutput><category term="#XMLFormat(trim(Category))#" />
	</cfoutput>
	</cfloop>
	</cfif>
	<!--- image (ie a logo) to associate with the feed --->
	<cfif attributes.image neq ""><cfoutput><logo>#attributes.image#</logo>
	</cfoutput></cfif>
	<!--- icon (ie like the favicon used by many website's for browser bookmark links) to associate with the feed --->
	<cfif attributes.icon neq ""><cfoutput><icon>#attributes.icon#</icon>
	</cfoutput></cfif>
	<!--- item information --->
	<cftry><cfloop query="RSSrecordset" startrow="1" endrow="#attributes.maxItems#">
	<cfoutput><entry>
		</cfoutput>
		<!--- item unique ID using date/time function --->
		<cfif attributes.itemPubDate neq "" AND evaluate(attributes.itemPubDate) neq "">
			<cfset civBoxUniqueID="tag:#URLAddress(attributes.link)#,#dateformat(DateConvert('local2utc',evaluate(attributes.itemPubDate)), "yyyy-mm-dd")#:/#evaluate(ListGetAt(attributes.SQLOrderBy,1,' '))#">
		<cfelse>
			<cfset civBoxUniqueID="tag:#URLAddress(attributes.link)#,#dateformat(DateConvert('local2utc',now()), "yyyy-mm-dd")#:/#evaluate(ListGetAt(attributes.SQLOrderBy,1,' '))#">
		</cfif>
		<!--- item title --->
		<cfif evaluate(attributes.itemTitle) neq "">
		<cfoutput><title type="html">#XMLFormat(cleanText(evaluate(attributes.itemTitle)))#</title>
		</cfoutput>
		<cfelse>
		<cfoutput><title type="html">No Title Provided</title>
		</cfoutput></cfif>
		<!--- item copyright --->
		<cfif attributes.itemCopyright neq "" AND evaluate(attributes.itemCopyright) neq ""><rights type="html">#XMLFormat(evaluate(attributes.itemCopyright))#</rights></cfif>
		<!--- item last revised --->
		<cfif attributes.itemUpdatedDate neq "" AND evaluate(attributes.itemUpdatedDate) neq "">
			<cfset itemUpdateCalc="#dateformat(DateConvert('local2utc',evaluate(attributes.itemUpdatedDate)), 'yyyy-mm-dd')#T#timeformat(DateConvert('local2utc',evaluate(attributes.itemUpdatedDate)), 'HH:mm:ss')#Z">
		<cfoutput><updated>#itemUpdateCalc#</updated>
		</cfoutput>
		<cfelseif attributes.itemUpdatedDateDefault neq "">
		<cfset civBoxDateDefault="#attributes.itemUpdatedDateDefault#">
		<cfset y=#ListGetAt(civBoxDateDefault,1)#>
		<cfset m=#ListGetAt(civBoxDateDefault,2)#>
		<cfset d=#ListGetAt(civBoxDateDefault,3)#>
		<cfset civBoxDateDefault=#CreateDate('#y#','#m#','#d#')#>
		<cfset itemUpdateCalc="#dateformat(civBoxDateDefault, 'yyyy-mm-dd')#T#timeformat(civBoxDateDefault, 'HH:mm:ss')#Z">
		<cfoutput><updated>#itemUpdateCalc#</updated>
		</cfoutput>
		<cfelse>
		<cfset itemUpdateCalc="#dateformat(DateConvert('local2utc',now()), 'yyyy-mm-dd')#T#timeformat(DateConvert('local2utc',now()), 'HH:mm:ss')#Z">
		<cfoutput><updated>#itemUpdateCalc#</updated>
		</cfoutput>
		</cfif>
		<!--- item first published --->
		<cfif attributes.itemPubDate neq "" AND evaluate(attributes.itemPubDate) neq "">
		<cfoutput><published>#dateformat(DateConvert('local2utc',evaluate(attributes.itemPubDate)), "yyyy-mm-dd")#T#timeformat(DateConvert('local2utc',evaluate(attributes.itemPubDate)), "HH:mm:ss")#Z</published>		
		</cfoutput></cfif>
		<!--- Defacto2: modification--->
		<cfif attributes.title eq "Defacto2 - Site Related News" or attributes.title eq "Defacto2 - The Scene News" or attributes.title eq "Defacto2 - The Scene News with Site News">
		<cfoutput><link rel="alternate" href="#XMLFormat('http://www.defacto2.net/news.cfm?mode=feed&id=#evaluate(ListGetAt(attributes.SQLOrderBy,1,' '))#')#" />
		</cfoutput></cfif>
		<cfif attributes.table eq "filepacks">
		<cfif RSSrecordset.nolocal eq true><cfset downloadAttr="downloads;#filename#;#filesize#;nolocal;#fulltitle#">
		<cfelse><cfset downloadAttr="downloads;#filename#;#filesize#;#fulltitle#">
		</cfif>
		<cfoutput><link rel="alternate" href="http://www.defacto2.net/download.cfm?#urlEncrypt(downloadAttr)#" />
		</cfoutput></cfif>
		<cfif attributes.table eq "Cracktros">
		<cfoutput><link rel="alternate" href="#XMLFormat('http://www.defacto2.net/cracktros.cfm?mode=file&value=#filename#')#" />
		</cfoutput></cfif>
		<!--- link to the complete article --->
		<cfif attributes.itemLink neq "" AND evaluate(attributes.itemLink) neq "">
		<cfoutput><link rel="alternate" href="#XMLFormat(evaluate(attributes.itemLink))#" />
		</cfoutput></cfif>
		<!--- item author's information --->
		<cfif attributes.itemAuthorName neq "">
		<cfset loopCnt=0>
		<cfloop index="itemAuName" list="#evaluate(attributes.itemAuthorName)#">
		<cfset loopCnt=IncrementValue(loopCnt)>
		<cfoutput><author>
			</cfoutput>
			<cfif attributes.itemAuthorEmail neq "" AND trim(ListGetAt(evaluate(attributes.itemAuthorEmail),loopCnt)) neq "-" AND trim(ListGetAt(evaluate(attributes.itemAuthorEmail),loopCnt)) neq "">
			<cfoutput><email>#XMLFormat(trim(ListGetAt(evaluate(attributes.itemAuthorEmail),loopCnt)))#</email>
			</cfoutput></cfif>
			<cfif attributes.itemAuthorURI neq "" AND trim(ListGetAt(evaluate(attributes.itemAuthorURI),loopCnt)) neq "-" AND trim(ListGetAt(evaluate(attributes.itemAuthorURI),loopCnt)) neq "">
			<cfoutput><uri>#XMLFormat(trim(ListGetAt(evaluate(attributes.itemAuthorURI),loopCnt)))#</uri>
			</cfoutput></cfif>
			<cfoutput><name>#XMLFormat(trim(itemAuName))#</name>
		</cfoutput>
		<cfoutput></author>
		</cfoutput>
		</cfloop>
		<cfelse>
		<cfoutput><author>
			</cfoutput>
			<cfoutput><name><cfif attributes.authorName neq "">#attributes.AuthorName#</cfif></name>
		</cfoutput>
		<cfoutput></author>
		</cfoutput></cfif>
		<!--- item contributor's information  --->
		<cfif attributes.itemContributorName neq "">
		<cfset loopCnt=0>
		<cfloop index="itemCoName" list="#evaluate(attributes.itemContributorName)#">
		<cfset loopCnt=IncrementValue(loopCnt)>
		<cfoutput><contributor>
			</cfoutput>
			<cfif attributes.itemContributorEmail neq "" AND trim(ListGetAt(evaluate(attributes.itemContributorEmail),loopCnt)) neq "-" AND trim(ListGetAt(evaluate(attributes.itemContributorEmail),loopCnt)) neq "">
			<cfoutput><email>#XMLFormat(trim(ListGetAt(evaluate(attributes.itemContributorEmail),loopCnt)))#</email>
			</cfoutput></cfif>
			<cfif attributes.itemContributorURI neq "" AND trim(ListGetAt(evaluate(attributes.itemContributorURI),loopCnt)) neq "-" AND trim(ListGetAt(evaluate(attributes.itemContributorURI),loopCnt)) neq "">
			<cfoutput><uri>#XMLFormat(trim(ListGetAt(evaluate(attributes.itemContributorURI),loopCnt)))#</uri>
			</cfoutput></cfif>		
		<cfoutput><name>#XMLFormat(trim(itemCoName))#</name>
		</cfoutput>
		<cfoutput></contributor>
		</cfoutput>
		</cfloop>
		</cfif>
		<!--- item category --->
		<cfif attributes.itemCategory neq "">
		<cfloop index="itemCat" list="#attributes.itemCategory#">
		<cfloop index="dbcell" list="#itemCat#">
		<cfoutput><category term="#XMLFormat(trim(evaluate(dbcell)))#" />
		</cfoutput>
		</cfloop>
		</cfloop>
		</cfif>				
		<!--- item source --->
		<cfif attributes.itemSourceURI neq "" AND evaluate(attributes.itemSourceURI) neq "">
		<cfoutput><source>
			</cfoutput>
			<cfoutput><link rel="self" href="#XMLFormat(civBoxLinkSelf)#" />
			</cfoutput>
			<cfoutput><id>#XMLFormat(evaluate(attributes.itemSourceURI))#<cfif left(reverse(attributes.itemSourceURI),1) neq "/">#XMLFormat("/")#</cfif></id>
			</cfoutput>
			<cfif attributes.itemSourceName neq "" AND evaluate(attributes.itemSourceName) neq ""><cfoutput><title>#XMLFormat(evaluate(attributes.itemSourceName))#</title>
			</cfoutput></cfif>
			<cfoutput><updated>#itemUpdateCalc#</updated>
		</cfoutput>
		<cfoutput></source>
		</cfoutput>
		</cfif>
		<!--- Defacto2: modified item content --->
		<cfif attributes.itemContent neq "" AND evaluate(attributes.itemContent) neq "" and attributes.table neq "cracktros">
		<cfif attributes.replaceCharCTL eq "P">
		<cfoutput><content type="html">#XMLFormat(cleanText(evaluate(attributes.itemContent),"P"))#</content>
		</cfoutput>
		<cfelseif attributes.replaceCharCTL eq "BR">
		<cfoutput><content type="html">#XMLFormat(cleanText(evaluate(attributes.itemContent),"BR"))#</content>
		</cfoutput>
		<cfelse>
		<cfoutput><content type="html">#XMLFormat(cleanText(evaluate(attributes.itemContent)))#</content>
		</cfoutput>
		</cfif>
		</cfif>
		<!--- Defacto2: modified item content --->
		<cfif attributes.table eq "cracktros">
		<cfoutput><content type="html">#XMLFormat("File: #filename#<br />Group: #CreatedFor#<br />Year: #Year#<br />Author: #Author#<p></p><img src='http://www.defacto2.net/images/cracktro-scenes/#filename#.png' alt='#filename# Screenshot' title='#filename# Screenshot' />")#</content>
		</cfoutput></cfif>
		<!--- attached file --->
		<cfif attributes.itemFileURI neq "" AND evaluate(attributes.itemFileURI) neq "">
		<cfoutput><link href="#evaluate(attributes.itemFileURI)#" rel="enclosure" <cfif attributes.itemFileTitle neq "" AND evaluate(attributes.itemFileTitle) neq "">title="#evaluate(attributes.itemFileTitle)#"</cfif>
		<cfif attributes.itemFileType neq "" AND evaluate(attributes.itemFileType) neq "">type="#evaluate(attributes.itemFileType)#"</cfif>
		<cfif attributes.itemFileLength neq "" AND evaluate(attributes.itemFileLength) neq "">lenth="#evaluate(attributes.itemFileLength)#"</cfif>
		<cfif attributes.itemFileSize neq "" AND evaluate(attributes.itemFileSize) neq "">length="#evaluate(attributes.itemFileSize)#"</cfif> />
		</cfoutput></cfif>
		<cfoutput><id>#civBoxUniqueID#</id>
	</cfoutput>
	<cfif RSSrecordset.currentrow eq RSSrecordset.recordcount>
	<cfoutput></entry>
</cfoutput>
	<cfelse>
	<cfoutput></entry>
	</cfoutput>
	</cfif>
</cfloop>
<cfoutput></feed></cfoutput>
	
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