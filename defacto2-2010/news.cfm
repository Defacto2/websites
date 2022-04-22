<!--- 
File: news.cfm
Version: 1
Author: Ben Garrett
Date: 30 June 2006

Replacement page for the old blog-*.cfm
--->
<cfparam name="url.mode" default="">
<cfparam name="url.id" default="">

<cfset currentPage=GetFileFromPath(GetTemplatePath())>

<!--- INSERT a new comment to the database --->
<cfif IsDefined("FORM.MM_InsertRecord") AND FORM.MM_InsertRecord EQ "commentform">
	<cfquery datasource="#application.newsComments#">
		INSERT INTO thescenenewscomments (blogID, obcTime, nick, subject, comment) VALUES (
		<cfif IsDefined("FORM.newsID") AND #FORM.newsID# NEQ "">#FORM.newsID#<cfelse>NULL</cfif>,
		<cfif IsDefined("FORM.obcTime") AND #FORM.obcTime# NEQ "">#CreateODBCDateTime(ParseDateTime(FORM.obcTime))#<cfelse>NULL</cfif>,
		<cfif IsDefined("FORM.nick") AND #FORM.nick# NEQ "">'#FORM.nick#'<cfelse>NULL</cfif>,
		<cfif IsDefined("FORM.subject") AND #FORM.subject# NEQ "">'#FORM.subject#'<cfelse>NULL</cfif>,
		<cfif IsDefined("FORM.comment") AND #FORM.comment# NEQ "">'#FORM.comment#'<cfelse>NULL</cfif>)
	</cfquery>
	<cflocation url="news.cfm?mode=comments&id=#url.id#" addtoken="no">
</cfif>
<!--- INSERT news item view count (and forward to url) --->
<cfif IsNumeric(url.id) AND url.id GT 1 AND url.mode NEQ "comments">
	<cfquery name="tsnRS" datasource="#application.newsSource#">
		SELECT id, Views FROM thescenenews WHERE id = #url.id#
	</cfquery>
	<cfoutput>
		<cfquery datasource="#application.newsSource#">
			<cflock scope="application" type="exclusive" timeout="10">
				<cfif TSNRS.Views EQ "">
					<!--- if the current id has no views, then start with 1 --->
					UPDATE thescenenews SET Views='1'
					WHERE id=#url.ID#
				<cfelse>
					<!--- if the current id is an integer, then increase it --->
					UPDATE thescenenews SET Views='#IncrementValue(TSNRS.Views)#'
					WHERE id=#url.ID#
				</cfif>
			</cflock>
		</cfquery>
	</cfoutput>
	<!--- forward to the actual article --->
  <cfif StructKeyExists(url,'AMP;URL')>
  	<cfset url.url = url['AMP;URL'] />
  </cfif>
	<cfif url.mode EQ "feed">
		<cflocation url="news.cfm?mode=comments&id=#url.id#" addtoken="no">
	<cfelseif IsDefined("url.url")>
		<cflocation url="#url.url#" addtoken="no">
	<cfelse>
  	<cfdump var="#url#">
		There is an error in the url supplied.
	</cfif>
<cfelseif url.mode NEQ "comments">
	There is an error in the url supplied. Note this form seems to have problems with some browsers such as Google's Chrome.
	<cfabort>
</cfif>

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<cfif url.mode EQ "comments" AND IsNumeric(url.id) AND url.id GT 0>
		<cfquery name="newsRS" datasource="#application.newsSource#">
			SELECT Title FROM thescenenews WHERE id = #url.id# ORDER BY id DESC
		</cfquery>
		<title>Defacto2 - #newsRS.Title#</title>
	<cfelse>
		<title>Defacto2 - News Item</title>
	</cfif>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td>
			<cfif url.mode EQ "comments" AND IsNumeric(url.id) AND url.id GT 0>
				<cfquery name="newsRS" datasource="#application.newsSource#">
					SELECT * FROM thescenenews WHERE id = #url.id# ORDER BY id DESC
				</cfquery>
				<cfquery name="commentsRS" datasource="#application.newsComments#">
					SELECT * FROM thescenenewscomments WHERE blogID = #url.id# ORDER BY obcTime DESC
				</cfquery>
				<div style="text-align:left;">
					<div style="float:right;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="smallhorizontal" color="blue"></div>
					<img src="images/tsn.gif" alt="The Scene News logo" /><br />
				</div>
				<div style="text-align:left; margin-top:6px; margin-left:2px;">
					<cfif newsRS.Defacto2News EQ 1>
						<span class="newsHeadlineDF2">#newsRS.Title#</span>
					<cfelse>
						<span class="newsHeadline">#newsRS.Title#</span>
					</cfif>
					<br />
					<!--- source | date | author --->
					<span class="newsSource">
						<cfif newsRS.Source NEQ ""><a href="news.cfm?id=#newsRS.id#&amp;url=#newsRS.sourceLink#" title="Goto the original news source" target="_blank" >#newsRS.source#</a> |</cfif>
						<span class="italic">#LSDateFormat(DateConvert('local2utc',newsRS.OBCTime),'DD MMM YYYY')# (#LSTimeFormat(DateConvert('local2utc',newsRS.OBCTime),'h:mm tt')#) GMT</span>
						<cfif newsRS.Author NEQ ""> | #newsRS.Author#</cfif> |
						<cfif newsRS.Views EQ "">0<cfelse>#newsRS.Views#</cfif> clicks
					</span>
					<!--- news --->
					<div class="newsBody">#newsRS.Description#</div>
					<!--- comments and complete article link --->
					<div class="newsCommentsCount">
						<cfif newsRS.Defacto2News EQ 0 AND newsRS.sourceLink NEQ ""><span class="italic"> <a href="news.cfm?id=#newsRS.id#&amp;url=#URLEncodedFormat(newsRS.SourceLink,'utf-8')#" title="Goto the original news source">Original source</a></span> | </cfif>
						<!--- <img src="images/digg.png" alt="Digg this article" /> <a href="http://digg.com/submit?phase=2&amp;url=#URLEncodedFormat('http://www.defacto2.net/news.cfm?id=#newsRS.id#&mode=comments','utf-8')#&amp;title=#newsRS.Title#&amp;bodytext=#URLEncodedFormat(REReplaceNoCase(newsRS.Description,'<[^>]*>','','ALL'),'utf-8')#&amp;topic=gaming_news" title="Digg This Article">Digg this article</a> |  --->
						<img src="images/delicious.gif" alt="Delicious bookmark" /> <a href="http://del.icio.us/post?url=#URLEncodedFormat('http://www.defacto2.net/news.cfm?id=#newsRS.id#&mode=comments','utf-8')#&title=#newsRS.Title#" title="Bookmark this article">del.icio.us</a>
					</div>
				</div>
				<!--- Display all comments associated with this article --->
				<cfloop query="commentsRS" >
					<cfoutput>
						<table cellpadding="0" cellspacing="0" class="boxComments">
							<tr>
								<td><div class="boxCommentsTitle">#subject#</div></td>
								<td class="boxCommentsAuthor"> by <strong>#nick#</strong> &nbsp;</td>
								<td class="boxCommentsDate">#LSTimeFormat(DateConvert('local2utc',obcTime),'h:mm')#<span class="lower">#LSTimeFormat(DateConvert('local2utc',obcTime),'tt')#</span> #LSDateFormat(DateConvert('local2utc',obcTime),'d.mmm.yyyy')# <span class="fs9">GMT</span></td>
							</tr>
						</table>
						<div class="boxCommentsText">
							<cfinvoke component="cfcs.utilities" method="commentsClean" text="#comment#">
						</div>
					</cfoutput>
				</cfloop>
				<!--- Comment submission form --->
				<cfset ODBCDT = "#DateFormat(Now(), 'd/mmm/yyyy')# #TimeFormat(Now(), 'HH:mm:ss')#">
        <cfif not FindNoCase('KHTML', CGI.HTTP_USER_AGENT, 1)>
				<cfform action="#currentPage#?mode=comments&#CGI.QUERY_STRING#" name="commentform" format="flash" skin="HALOorange" timeout="1200" width="660" height="290">
					<cfformgroup type="tabnavigator">
					<cfformgroup type="page" label="Discuss This Article">
						<cfformgroup type="vertical">
							<cfinput name="obcTime" type="hidden" value="#ODBCDT#">
							<cfinput name="newsID" type="hidden" value="#url.id#">
							<cfinput name="MM_InsertRecord" type="hidden" value="commentform">
							<cfinput name="nick" type="text" label="Nickname/Alias" required="yes" maxlength="50" message="No nickname was given" />
							<cfinput name="subject" type="text" label="Subject" required="no" maxlength="255" />
							<cftextarea name="comment" height="160" label="Comment" message="No comment was supplied" required="yes"></cftextarea>
						</cfformgroup>
					</cfformgroup>
						<cfformgroup type="page" label="Submit">
							<cfformgroup type="vertical">
								<cfformitem type="text" name="nick" bind="Nick/Alias: {nick.text}"></cfformitem>
								<cfformitem type="text" name="subject" bind="Subject: {subject.text}"></cfformitem>
								<cfformitem type="text" name="comment" bind="Comment: {comment.text}"></cfformitem>
								<cfinput type="submit" name="submit" value="Post Comment" />
							</cfformgroup>
						</cfformgroup>
					<cfformgroup type="page" label="Formatting">
						<cfformgroup type="horizontal">
							<cfformitem type="html"><font size="+2">You can use these format tags in the comment field to modify the format of your text</font></cfformitem>
						</cfformgroup>
						<cfformgroup type="horizontal">
							<cfformitem type="html"><font color="##009933" size="+2">[a][/a]</font><font size="+2"> insert a hyperlink, example </font><font color="##009933" size="+2">[a]</font><font color="##003366" size="+2">http://www.defacto2.net</font><font color="##009933" size="+2">[/a]</font></cfformitem>
						</cfformgroup>
						<cfformgroup type="horizontal">
							<cfformitem type="html"><font color="##009933" size="+2">[b][/b] </font><font size="+2"><b>strong text</b></font></cfformitem>
							<cfformitem type="html"><font color="##009933" size="+2">[i][/i] </font><font size="+2"><i>italic text</i></font></cfformitem>
							<cfformitem type="html"><font color="##009933" size="+2">[u][/u] </font><font size="+2"><u>underlined text</u></font></cfformitem>
						</cfformgroup>
					</cfformgroup>
					</cfformgroup>
				</cfform>
        </cfif>
			<cfelse>
			</cfif>
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>