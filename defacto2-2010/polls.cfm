<!--- 
File: 		polls.cfm
Version: 	2
Author: 	Ben Garrett
Date: 		10 November 2005
			19 Jun 2006 : New code
Displays the results of polls using flash charts while also allowing readers to view and leave comments.
Okay 1
--->

<!--- INSERT user vote: Save a persons vote to the database --->
<cfparam name="url.vote" default="">
<cfif IsNumeric(url.vote) AND url.vote GT 0 AND url.vote LT 10>
	<cfinvoke component="cfcs.polls" method="saveVote" vote="#url.vote#">
</cfif>

<!--- Set poll ID (defaults to the most recent poll if no valid poll is requested) --->
<cfinvoke component="cfcs.polls" method="totalPolls" returnvariable="totalPolls">
<cfparam name="url.poll" default="#totalPolls#">
<cfset displayPollID=url.poll>
<cfif IsNumeric(displayPollID) IS NOT TRUE OR displayPollID GT totalPolls OR displayPollID LT 1><cfset displayPollID=totalPolls></cfif>

<cfset ODBCDT = "#DateFormat(Now(), 'd/mmm/yyyy')# #TimeFormat(Now(), 'HH:mm:ss')#">
<cfset currentPage=GetFileFromPath(GetTemplatePath())>
<cfinvoke component="cfcs.polls" method="chartQuestions" pollID="#displayPollID#" mode="question" returnvariable="currentPoll">
<cfinvoke component="cfcs.polls" method="voteCheck" pollID="#displayPollID#" returnvariable="voteStatus">
<cfinvoke component="cfcs.polls" method="totalVotes" pollID="#displayPollID#" returnvariable="totalVotes">

<!--- INSERT comment: If a comment form has been submitted, save the comment to the database --->
<cfif IsDefined("FORM.MM_InsertRecord") AND FORM.MM_InsertRecord EQ "commentform">
	<cfquery datasource="#application.poll#">
		INSERT INTO opinionpollscomments (topicNumber, obcTime, nick, subject, comment) VALUES (
		<cfif IsDefined("FORM.topicNumber") AND #FORM.topicNumber# NEQ "">#FORM.topicNumber#<cfelse>NULL</cfif>,
		<cfif IsDefined("FORM.obcTime") AND #FORM.obcTime# NEQ "">###FORM.obcTime###<cfelse>NULL</cfif>,
		<cfif IsDefined("FORM.nick") AND #FORM.nick# NEQ "">'#FORM.nick#'<cfelse>NULL</cfif>,
		<cfif IsDefined("FORM.subject") AND #FORM.subject# NEQ "">'#FORM.subject#'<cfelse>NULL</cfif>,
		<cfif IsDefined("FORM.comment") AND #FORM.comment# NEQ "">'#FORM.comment#'<cfelse>NULL</cfif>)
	</cfquery>
	<cflocation url="#currentPage#?poll=#FORM.topicNumber#" addtoken="no">
</cfif>

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - Poll - #currentPoll#?</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td><cfinvoke component="cfcs.logos" method="sceneArchive">
				<div class="pollHeader">#currentPoll#?</div>
				<cfif voteStatus NEQ "">
					<!--- See if user has already voted on this poll --->
					<cfset activeVote="option" & #voteStatus#>
					<cfinvoke component="cfcs.polls" method="chartQuestions" pollID="#displayPollID#" mode="answer" answerNum="#activeVote#" returnvariable="activeAnswer">
					You voted for: #activeAnswer#
				</cfif>
				<div>
					<!--- Display flash chart --->
					<cfinvoke component="cfcs.polls" method="chart" pollID="#displayPollID#" totalVotes="#totalVotes#">
				</div>
				<div class="pollVotes">Total votes: #totalVotes#</div>
				<div>
					<!--- Display comments about this specific poll --->
					<cfinvoke component="cfcs.polls" method="comments" pollID="#displayPollID#">
				</div>
				<div>
					<!--- Flash form for writting a comment --->
					<cfform action="#currentPage#?id=#displayPollID#" name="commentform" format="flash" skin="HALOorange" timeout="1200" width="660" height="290">
						<cfformgroup type="tabnavigator">
						<cfformgroup type="page" label="Discuss This Poll">
							<cfformgroup type="vertical">
								<cfinput name="obcTime" type="hidden" value="#ODBCDT#">
								<cfinput name="topicNumber" type="hidden" value="#displayPollID#">
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
				</div>
				<div>
					<cfinvoke component="cfcs.polls" method="archivedPolls" displayNumber="0">
				</div>
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>