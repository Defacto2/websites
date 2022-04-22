<cfcomponent>

	<cffunction name="archivedPolls" access="public" returntype="string" hint="Lists all the previous polls">
		<cfargument name="displayNumber" required="no" default="0" type="numeric" hint="Recent number of polls to list (0 equals list all)">
		<cfquery name="RS1" datasource="#application.poll#" cachedwithin="#application.pollsTimeOut#">
			SELECT topicNumber, question, status FROM opinionpolls ORDER BY topicNumber DESC 
		</cfquery>
			<div class="pollList">
				<cfif displayNumber EQ 0>
					<div style="padding-bottom:6px;">Other Polls</div>
					<div class="pollLinks">
						<cfoutput query="RS1">
							<div style="padding-top:2px;">Poll #topicNumber#: <span style="<cfif topicNumber EQ URL.poll>border-bottom: 1px solid ##CCCCCC;</cfif>"><a href="polls.cfm?poll=#topicNumber#" title="See the results and comments for poll number #topicNumber#">#question#</a></span> <cfif status EQ "open"><span class="fs10 green bold">OPEN</span></cfif></div>
						</cfoutput>
					</div>
				<cfelse>
					<div style="padding-bottom:6px;">Last #displayNumber# Polls</div>
						<div class="pollLinks">
						<cfoutput query="RS1" maxrows="#displayNumber#" startrow="1">
							<div style="padding-top:2px;">Poll #topicNumber#: <span style="<cfif topicNumber EQ URL.poll>border-bottom: 1px solid ##CCCCCC;</cfif>"><a href="polls.cfm?poll=#topicNumber#" title="See the results and comments for poll number #topicNumber#">#question#</a></span> <cfif status EQ "open"><span class="fs10 green bold">OPEN</span></cfif></div>
						</cfoutput>
					</div>
				</cfif>
			</div>
	</cffunction>
	
	<cffunction name="chart" access="public" returntype="string" hint="Displays a large chart of a poll">
		<cfargument name="pollID" required="yes" type="numeric">
		<cfargument name="totalVotes" required="yes" type="numeric">
		<cfargument name="size" required="no" default="large">
		<cfif size EQ "large">
			<cfchart 
				chartwidth="500" 
				chartheight="500" 
				format="flash"
				show3d="no"
				sortXAxis="yes"
				seriesPlacement="stacked"
				showLegend="no"
				style="default.xml"
				>
				<cfchartseries type="horizontalbar" paintStyle="light" seriesColor="##66CC66" >
					<cfset pollCount=1>
					<cflock name="voteFullChart" timeout="20" type="readonly">
						<cfloop condition="pollCount LTE 9">
							<cfset pQO = "RS1.option" & #pollCount#>
							<cfquery name="RS1" datasource="#application.poll#" cachedwithin="#application.pollsTimeOut#">
								SELECT * FROM opinionpolls WHERE topicNumber = #pollID# ORDER BY topicNumber DESC
							</cfquery>
							<cfquery name="RS2" datasource="#application.poll#" cachedwithin="#application.pollsTimeOut#">
								SELECT Count(vote) AS sum FROM opinionpollsvotes WHERE topicNumber = #RS1.topicNumber# AND vote = #pollCount#
							</cfquery>
							<cfif #evaluate(pQO)# NEQ "">
								<cfset percentage=((#RS2.sum#/#totalVotes#)*100)>
								<cfchartdata item="#evaluate(pQO)# (#round(percentage)#%)" value="#RS2.sum#">
							</cfif>
							<cfset pollCount=IncrementValue(pollCount)>
						</cfloop>
					</cflock>
				</cfchartseries>
			</cfchart>
		<cfelseif size EQ "small">
			<cfchart 
				chartwidth="260" 
				chartheight="300" 
				format="png"
				show3d="no"
				sortxaxis="no"
				seriesPlacement="stacked"
				showLegend="no"
				style="default.xml"
				fontSize="8"
				>
				<cfchartseries type="horizontalbar" paintStyle="light" seriesColor="##66CC66" >
					<cfset pollCount=1>
						<cflock name="voteFullChart" timeout="20" type="readonly">
						<cfloop condition="pollCount LTE 9">
							<cfset pQO = "RS1.option" & #pollCount#>
							<cfquery name="RS1" datasource="#application.poll#" cachedwithin="#application.pollsTimeOut#">
								SELECT * FROM opinionpolls WHERE topicNumber = #pollID# ORDER BY topicNumber DESC
							</cfquery>
							<cfquery name="RS2" datasource="#application.poll#" cachedwithin="#application.pollsTimeOut#">
								SELECT Count(vote) AS sum FROM opinionpollsvotes WHERE topicNumber = #RS1.topicNumber# AND vote = #pollCount#
							</cfquery>
							<cfif #evaluate(pQO)# NEQ "">
								<cfset percentage=((#RS2.sum#/#totalVotes#)*100)>
								<cfchartdata item="#evaluate(pQO)# (#round(percentage)#%)" value="#RS2.sum#">
							</cfif>
							<cfset pollCount=IncrementValue(pollCount)>
						</cfloop>
						</cflock>
				</cfchartseries>
			</cfchart>
		</cfif>
	</cffunction>	
	
	<cffunction name="chartQuestions" access="public" returntype="string" hint="Returns details of a specific poll">
		<cfargument name="pollID" required="yes" type="numeric">
		<cfargument name="mode" default="pollID">
		<cfargument name="answerNum" hint="Only required if using mode=answer">
		<cflock name="chartQuestions" timeout="10" type="readonly">
			<cfquery name="RS1" datasource="#application.poll#" cachedwithin="#application.pollsTimeOut#">
				SELECT * FROM opinionpolls WHERE topicNumber = #pollID# ORDER BY topicNumber DESC
			</cfquery>
		</cflock>
		<cfswitch expression="#mode#">
			<cfcase value="pollID"><cfset myResult=RS1.topicNumber></cfcase>
			<cfcase value="question"><cfset myResult=RS1.question></cfcase>
			<cfcase value="answer"><cfset myResult=evaluate("RS1." & answerNum)></cfcase>
		</cfswitch>
		<cfreturn myResult>
	</cffunction>		
	
	<cffunction name="comments" access="public" returntype="string" hint="Displays user comments written about a poll">
		<cfargument name="pollID" required="yes" type="numeric">
		<cflock name="chartComments" timeout="10" type="readonly">
			<cfquery name="RS1" datasource="#application.poll#" cachedwithin="#application.pollsTimeOut#">
				SELECT * FROM opinionpollscomments WHERE topicNumber = #pollID# ORDER BY obcTime ASC
			</cfquery>
		</cflock>
		<cfoutput query="RS1">
				<table cellpadding="0" cellspacing="0" class="boxComments">
					<tr>
						<td><div class="boxCommentsTitle">#subject#</div></td>
						<td class="boxCommentsAuthor"> by <span class="bold">#nick#</span> &nbsp;</td>
						<td class="boxCommentsDate">#LSTimeFormat(DateConvert('local2utc',obcTime),'h:mm')#<span class="lower">#LSTimeFormat(DateConvert('local2utc',obcTime),'tt')#</span> #LSDateFormat(DateConvert('local2utc',obcTime),'d.mmm.yyyy')# <span class="fs9">GMT</span></td>
					</tr>
				</table>
				<div class="boxCommentsText">
					<cfinvoke component="utilities" method="commentsClean" text="#comment#">
				</div>
		</cfoutput>
	</cffunction>
	
	<cffunction name="questions" access="public" returntype="string" hint="Displays the polls questions and voting links">
		<cfinvoke component="polls" method="voteStatus" returnvariable="voteStatus">
		<cfset userVoted=listFirst(voteStatus)>
		<cfif userVoted EQ "yes"><cfset userFavour=listGetAt(voteStatus,2)></cfif>
		<cfquery name="RS1" datasource="#application.poll#" cachedwithin="#application.pollsTimeOut#">
			SELECT topicNumber FROM opinionpolls
		</cfquery>
		<cfquery name="RS2" datasource="#application.poll#" cachedwithin="#application.pollsTimeOut#">
			SELECT * FROM opinionpolls WHERE topicNumber = #RS1.recordcount# ORDER BY topicNumber DESC
		</cfquery>
		<cfoutput>
		<!--- display poll question --->
		<div class="boxPoll01">#RS2.question#?</div>
		<cfif RS2.status EQ 'open' AND userVoted EQ 'no'>
			<!--- list voting options if user has not already voted --->
			<cfset pollCount=1>
			<cfloop condition="pollCount LTE 9">
				<cfset pQO="RS2.option" & #pollCount#>
				<cfset pQOdesc="RS2.option" & #pollCount# & "desc">
				<cfif #Evaluate(pQO)# NEQ "">
					<div class="boxPoll03" style="<cfif #Evaluate(pQOdesc)# EQ "">margin-bottom:4px;</cfif>"><span class="boxPoll06">vote #pollCount#)</span> <a href="polls.cfm?vote=#pollCount#" <cfif #Evaluate(pQOdesc)# NEQ "">title="#Evaluate(pQOdesc)#"</cfif>>#Evaluate(pQO)#</a></div>
				</cfif>
				<cfset pollCount=IncrementValue(pollCount)>
			</cfloop>
		<cfelseif RS2.status EQ 'open' AND userVoted EQ 'yes'>
			<!--- poll is open but the user has already voted --->
			<cfset CLIENT.poll=#RS2.topicNumber#>
			<cfset CLIENT.vote=#userFavour#>
			<cfset userFavourDisp = "RS2.option" & #userFavour#>
			<div class="boxPoll02"><cfif IsDefined("userNewVote")>Your vote for <cfelse>You voted for </cfif><span class="bold">#Evaluate(userFavourDisp)#</span><cfif IsDefined("userNewVote")> has been saved</cfif></div>
			<cfinvoke component="polls" method="totalVotes" pollID="#RS2.topicNumber#" returnvariable="totalVotes">
			<cfinvoke component="polls" method="chart" pollID="#RS2.topicNumber#" totalVotes="#totalVotes#" size="small">
		<cfelse>
			<!--- poll is closed --->
			<div class="boxPoll04">This poll has been closed</div>
		</cfif>
		<div class="boxPoll05"><a href="polls.cfm" title="See the results of this and previous polls">See results</a></div>
		</cfoutput>
	</cffunction>	
	
	<cffunction name="saveVote" access="public" hint="Records the person's vote">
		<cfargument name="vote" required="yes" type="numeric">
		<cfset var userIP=CGI.REMOTE_ADDR>
		<cfinvoke component="polls" method="voteStatus" returnvariable="voteStatus">
		<cfset userVoted=listFirst(voteStatus)>
		<cfquery name="RS1" datasource="#application.poll#">
			SELECT topicNumber FROM opinionpolls
		</cfquery>
		<cfquery name="RS2" datasource="#application.poll#">
			SELECT * FROM opinionpolls WHERE topicNumber = #RS1.recordcount# ORDER BY topicNumber DESC
		</cfquery>
		<cfif RS2.status EQ 'open' AND userVoted EQ 'no'>
			<!--- INSERTS the vote --->
			<cflock name="saveVote" timeout="20" type="exclusive">
			<cfquery datasource="#application.poll#">
				INSERT INTO opinionpollsvotes (topicNumber, userIP, vote) VALUES (
				<cfif IsDefined("RS2.topicNumber") AND #RS2.topicNumber# NEQ "">#RS2.topicNumber#<cfelse>NULL</cfif>,
				<cfif IsDefined("userIP") AND #userIP# NEQ "">'#userIP#'<cfelse>NULL</cfif>,
				<cfif #vote# NEQ "">#vote#<cfelse>NULL</cfif>)
			</cfquery>
			</cflock>
			<cfset CLIENT.poll=#RS2.topicNumber#>
			<cfset CLIENT.vote=#vote#>
		</cfif>	
	</cffunction>
		
	<cffunction name="totalPolls" access="public" returntype="string" hint="Obtain the total number of polls">
		<cfquery name="RS1" datasource="#application.poll#" cachedwithin="#application.pollsTimeOut#">
			SELECT topicNumber FROM opinionpolls
		</cfquery>
		<cfset myResult=RS1.recordcount>
		<cfreturn myResult>
	</cffunction>
		
	<cffunction name="totalVotes" access="public" returntype="string" hint="Returns the total number of votes for a poll">
		<cfargument name="pollID" required="yes" type="numeric">
		<cflock name="totalVotes" timeout="10" type="readonly">
		<cfquery name="RS1" datasource="#application.poll#" cachedwithin="#application.pollsTimeOut#">
			SELECT topicNumber, vote FROM opinionpollsvotes WHERE topicNumber = #pollID#
		</cfquery>
		</cflock>
		<cfset myResult=RS1.recordcount>
		<cfreturn myResult>
	</cffunction>	

	<cffunction name="voteStatus" access="public" returntype="string" hint="">
		<cflock name="voteStat1" timeout="5" type="readonly">
		<cfquery name="RS1" datasource="#application.poll#">
			SELECT topicNumber FROM opinionpolls
		</cfquery>
		</cflock>
		<cflock name="voteStat2" timeout="5" type="readonly">
		<cfquery name="RS2" datasource="#application.poll#">
			SELECT * FROM opinionpolls WHERE topicNumber = #RS1.recordcount# ORDER BY topicNumber DESC
		</cfquery>
		</cflock>
		<cfif RS2.status eq 'open'>
			<!--- obtain clients ip address and sees if the person has voted --->
			<cfset userIP = #CGI.REMOTE_ADDR#>
			<cflock name="voteStat1" timeout="5" type="readonly">
			<cfquery name="RS3" datasource="#application.poll#">
				SELECT * FROM opinionpollsvotes WHERE userIP = '#userIP#' AND topicNumber = #RS2.topicNumber#
			</cfquery>
			</cflock>
			<!--- save the vote and user vote status --->
			<cfif RS3.recordcount NEQ 0>
				<cfset userVoted="yes">
				<cfset userFavour="#RS3.vote#">
			<cfelse>
				<cfset userVoted="no">
			</cfif>
			<cfif IsDefined("CLIENT.poll") AND IsDefined("CLIENT.vote") AND CLIENT.poll EQ RS2.topicnumber>
				<cfset userVoted="yes">
				<cfset userFavour="#CLIENT.vote#">
			</cfif>
		</cfif>
		<cfif IsDefined("userFavour")>
			<cfset returnValue=userVoted & ',' & userFavour>
		<cfelseif IsDefined("userVoted")>
			<cfset returnValue=userVoted>
		<cfelse>
			<cfset returnValue="">
		</cfif>
		<cfreturn returnValue>
	</cffunction>

	<cffunction name="voteCheck" access="public" returntype="string" hint="Checks to see if a person as previously voted on a poll">
		<cfargument name="pollID" required="yes" type="numeric">
		<cfset var userIP=CGI.REMOTE_ADDR>
		<cflock name="voteCheck" timeout="10" type="readonly">
		<cfquery name="RS1" datasource="#application.poll#">
			SELECT * FROM opinionpollsvotes WHERE userIP = '#userIP#' AND topicNumber = #pollID#
		</cfquery>
		</cflock>
		<cfset myResult=RS1.vote>
		<cfreturn myResult>
	</cffunction>

</cfcomponent>