<!--- 
File: 		portal.cfm
Version: 	2
Author: 	Ben Garrett
Date:		16 July 2003
			21 Mar 05 : Allowed the disabling of the screenshots
			01 Apr 06 : Added the click count
			15 Jun 06 : New Code
			19 Feb 10 : Added dynamic categories
A dynamic webpage portal that lists sites related to the scene
Okay 1
 --->

<!--- Record click to portal record (and then forward to requested link) --->
<cfparam name="url.id" default="">
<cfif url.id NEQ "" AND IsNumeric(url.id)>
	<cfinvoke component="cfcs.portal" method="recordClick" recordID="#url.id#">
</cfif>

<!--- Scene Portal begins --->
<cfparam name="url.category" default="art">
<cfparam name="url.sort" default="cat2 asc">
<cfset nowMinute=minute(now())>
<cfset nowHour=hour(now())>
<cfset todayDate=Now()>
<cfset df2PortalCount=0>

<cfif NOT IsDefined("cookie.portalScreenshots")>
	<!--- If no portalScreenshots cookie is defined then set image display as OFF --->
	<cfparam name="url.portalimg" default="true">
<cfelseif NOT IsDefined("url.portalimg") AND cookie.portalScreenshots is false>
	<!--- If URL.PI is MISSING and Cookie equals OFF then image display is OFF --->
	<cfparam name="url.portalimg" default="false">	
<cfelseif NOT IsDefined("url.portalimg") AND IsDefined("url.list")>
	<!--- If URL.PI is MISSSING and the FORM has been submitted then display is OFF --->
	<cfparam name="url.portalimg" default="false">
<cfelse>
	<cfparam name="url.portalimg" default="#cookie.portalScreenshots#">
</cfif>

<cfif IsDefined("url.portalimg") AND url.portalimg is false>
	<!--- If url.list exists, save to cookie --->
	<cfcookie name="portalScreenshots" value="false" expires="never">
<cfelseif IsDefined("url.portalimg") AND url.portalimg is true>
	<!--- If url.list is all, kill cookie --->
	<cfcookie name="portalScreenshots" value="true" expires="never">
</cfif>

<!--- Last time the portal links had their online status checked + category indetailed --->
<cfinvoke component="cfcs.portal" method="lastStatusCheck" returnvariable="lastStatusCheck">
<cfinvoke component="cfcs.portal" method="category" group="#URL.Category#" returnvariable="categories">

<!--- Obtain the portal database entries --->
<cfquery name="RS1" datasource="#application.portalSource#" cachedwithin="#application.portalTimeOut#">
	SELECT * FROM thesceneportal WHERE Cat1 = '#URL.category#' ORDER BY #URL.sort#,Name ASC
</cfquery>
<!--- Obtain a unique list of sub-categories for use with portal navigation --->
<cfquery name="RS2" datasource="#application.portalSource#" cachedwithin="#application.portalTimeOut#">
	SELECT DISTINCT Cat2 FROM thesceneportal WHERE Cat1 = '#URL.category#' AND Disable = '0' ORDER BY #URL.sort#,Name ASC
</cfquery>

<!--- Legacy URL 301 redirection --->
<cfif URL.Category is categories.Cat301 and categories.Cat301 is not categories.CatURL>
	<cflocation
    url = "portal.cfm?category=#categories.CatURL#&sort=#url.sort#"
    addToken = "no"
    statusCode = "301">
</cfif>

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - The #RS1.Cat1# Scene Portal</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td>
				<h1 class="boxPortal01" style="font-family:'Comic Sans MS', cursive; font-size:24px; color:##FFF;">The Scene Portal - #categories.CatName#<!---<img src="images/thesceneportal.gif" alt="The Scene Portal" />---></h1>
				<div class="portalIntro">
        <table cellpadding="0" cellspacing="0">
        	<tr>
          	<td><div style="margin:20px;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="portal-top"></div></td>
            <td><p>#categories.CatDesc#</p>
            <!--- Category menu list --->
            <cfif url.sort contains "cat2">
                <ul style="padding:0px;margin:0px;">
                	<li style="list-style-type: none; font-family:Verdana, Arial, Helvetica, sans-serif; background-color:##9FB42C; color:##FFF; padding:1px; margin-bottom:4px; text-indent:10px; font-weight:bold;">Categories</li>
                	<cfloop query="RS2"><cfif Len(RS2.Cat2)><li style="display: inline; padding-right: 10px; list-style-type: none;"><a href="portal.cfm?#CGI.QUERY_STRING####Replace(RS2.Cat2,' ','-')#">#RS2.Cat2#</a></li></cfif>
                    </cfloop>
                </ul>
            </td></cfif>
          </tr>
        </table>
        </div>
				<cfinvoke component="cfcs.advertising" method="GoogleAdSense">
				<table cellpadding="0" cellspacing="0" class="boxPortal02">
					<tr><td style="width:260px;">#categories.CatName# Listings</td>
						<td class="boxPortal03" style="text-align:right; vertical-align:middle;">
							<!--- order by form and display/hide captures option --->
							<form action="portal.cfm" method="get" id="portalSort" style="margin-bottom:0px; margin-right:30px;">
								<fieldset style="border:0px; margin:0px; padding:0px;">
								Sort the listing 
								<input type="hidden" name="Category" value="#url.category#" />
								<select name="Sort" size="1" style="font-family:Verdana, Arial, Helvetica, sans-serif; font-size:10px;">
									<option value="name"<cfif url.sort eq "name"> selected="selected"</cfif>>Name</option>
									<option value="cat2 asc"<cfif url.sort contains "cat2"> selected="selected"</cfif>>Category</option>
									<option value="rate desc"<cfif url.sort eq "rate desc"> selected="selected"</cfif>>Rating</option>
									<option value="date desc"<cfif url.sort eq "date desc"> selected="selected"</cfif>>New</option>
								</select>
								<input type="submit" name="List" value="Reorder" class="portalSubmit" />
								<cfif url.portalimg is true>
									<input type="checkbox" name="portalimg" checked="checked" />
								<cfelse>
									<input type="checkbox" name="portalimg" />
								</cfif>
								Display captures
								</fieldset>
							</form>
				</td></tr></table>
				<table cellpadding="0" cellspacing="0" class="boxPortal04"><tr>
					<td><div style="text-align:left; padding-top:4px;"><img src="images/new!.gif" alt="New!" style="vertical-align:middle;" /> For the month &nbsp; <img src="images/star.gif" alt="Star" style="vertical-align:middle;" /> Web site rating <img src="images/star-o.gif" alt="Star" style="vertical-align:middle;" /> Product rating (0 stars = not reviewed)</div></td>
					<td><div style="text-align:right;"><a href="contact.cfm?mode=portal&amp;format=flash" title="Goto our contact forms">Add or update a web site</a></div></td>				
				</tr></table>
				</cfoutput>
				<cfset previousCat="">
				<cfoutput query="RS1">
					<cfif #RS1.Disable# EQ 0>
						<cfif previousCat neq RS1.Cat2 and url.sort contains "cat2">
                        <a id="#Replace(RS1.Cat2,' ','-')#" name="#Replace(RS1.Cat2,' ','-')#"></a>
						<h1 style="text-align:left; font-family:Geneva, Arial, Helvetica, sans-serif; font-size:16px; font-weight:bold; margin:10px 0px 0px 0px; padding:1px; text-indent:20px; background-color:##9FB42C; color:##FFF;">#RS1.Cat2#</h1></cfif>
						<cfset previousCat=RS1.Cat2>
						<cfset df2PortalCount=df2PortalCount+1>
						<table cellpadding="0" cellspacing="0" class="boxPortal05"><tr>
						<td style="vertical-align:text-top;">
							<!--- site's name, link and online status --->
							<cfset cleanTitle=urlDecode(urlEncodedFormat(RS1.Name,'utf-8'),'utf-8')>
							<h2 class="portalTitle" style="margin:0px;"><a href="portal.cfm?id=#RS1.id#" class="portalTitle" title="Goto #cleanTitle#">#cleanTitle#</a></h2>
							<cfif IsDefined("RS1.Status") AND left(RS1.Status,3) NEQ "200" AND left(RS1.Status,3) NEQ "301" AND left(RS1.Status,3) NEQ "302" AND left(RS1.Status,3) NEQ "500" AND left(RS1.Status,3) NEQ "403" AND RS1.Status NEQ "">
								<div class="portalStatus">Site status: #RS1.Status#</div>
								<div class="portalStatusLC">Last checked <cfif (NowHour-Hour(lastStatusCheck)) gt 1>#(NowHour-Hour(lastStatusCheck))# hour<cfif (NowHour-Hour(lastStatusCheck)) neq 1>s</cfif> and </cfif>#(NowMinute-Minute(lastStatusCheck))# minutes ago</div>
							</cfif>
							<!--- display 'NEW!' gfx if entry is recent --->
							<cfif IsDefined("RS1.date") AND #DateCompare(todayDate, RS1.date, "m")# NEQ 1><img src="images/new!.gif" alt="New!" class="portalNew" /> </cfif>							
							<!--- site's category --->
							<cfif IsDefined("RS1.Cat2") AND #RS1.Cat2# NEQ ""><div class="portalInfo">(#RS1.Cat2#)</div></cfif>			
							<!--- site's description --->
							<cfset cleanDescription=urlDecode(urlEncodedFormat(RS1.Description,'utf-8'),'utf-8')>
							<div class="portalBody"<cfif #RS1.Disable# NEQ 0> style="color:##999999;"</cfif>>#cleanDescription#</div>
							<!--- site's rss & atom feeds --->
							<cfif IsDefined("RS1.RSS2URL") AND #RS1.RSS2URL# NEQ ""><a href="#RS1.RSS2URL#"><img src="images/rss.gif" alt="RSS Link" title="Display #cleanTitle#'s RSS feed" style="border:0px; vertical-align:bottom;" /></a> &nbsp; </cfif>
							<cfif IsDefined("RS1.Atom1URL") AND #RS1.Atom1URL# NEQ ""><a href="#RS1.Atom1URL#"><img src="images/xml.gif" alt="Atom Link" title="Display #cleanTitle#'s Atom feed" style="border:0px; vertical-align:bottom;" /></a></cfif>							
						</td>
						<td class="boxPortal06">
							<!--- site's rating, out of 5 stars --->
							<cfif IsDefined("RS1.RateProduct") AND RS1.RateProduct NEQ 0>
								<cfinvoke component="cfcs.portal" method="siteRating" rating="#RS1.Rate#" type="product">
							<cfelse>
								<cfinvoke component="cfcs.portal" method="siteRating" rating="#RS1.Rate#" type="website">
							</cfif>
							<cfif IsDefined("RS1.Clicks") AND #RS1.Clicks# NEQ ""><div class="boxPortal07" style="">#RS1.Clicks#</div></cfif>
						</td>
						<cfif IsDefined("cookie.portalScreenshots") AND cookie.portalScreenshots is true>
							<td rowspan="3" style="width:162px; text-align:center;">
								<!--- site's button advert and capture --->
								<cfinvoke component="cfcs.portal" method="buttonAd" id="#RS1.ID#" title="#cleanTitle#">
								<cfinvoke component="cfcs.portal" method="capture" id="#RS1.ID#" title="#cleanTitle#">
							</td>
						</cfif>		
						</tr></table>
					</cfif>
<!---            
			19/Feb/10: Disabled non-performing advert.
          <cfif df2PortalCount is 3 or df2PortalCount is 10>
          <!--- Google Adverts --->
						<table cellpadding="0" cellspacing="0" class="boxPortal05">
            	<tr>
								<td style="vertical-align:middle;"><div style="text-align:center;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="portal-middle" color="pink"></div></td>
            	</tr>
            </table>
          </cfif>
          --->
				</cfoutput>
				<cfoutput>
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>