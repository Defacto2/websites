<cfcomponent>
	
	<cffunction name="checkMagExistance" access="public" returntype="string" hint="Verify the existence of a magazine in the DB">
		<cfargument name="magazine" required="yes">
		<cfquery name="RS1" datasource="#application.magSource#" cachedwithin="#application.magazinesTimeOut#">
			SELECT Count(magTitle) AS sum FROM magazineissues WHERE magTitle = '#magazine#'
		</cfquery>
		<cfif RS1.sum LTE 0>
			<cfoutput><div class="error">Sorry the the magazine '#magazine#' can not be found</div></cfoutput>
			<cfabort>
		</cfif>
	</cffunction>
	
	<cffunction name="details" access="public" returntype="string" hint="Magazine details listing issues and providing links">
		<cfargument name="magazine" required="yes">
		<cfquery name="RS1" datasource="#application.magSource#" cachedwithin="#application.magazinesTimeOut#">
			SELECT * FROM magazinedetail WHERE magPrimName = '#magazine#'
		</cfquery>
		<cfquery name="RS2" datasource="#application.magSource#" cachedwithin="#application.magazinesTimeOut#">
			SELECT * FROM magazineissues WHERE magTitle = '#magazine#' ORDER BY magReleaseDate ASC, magazineissues.magFile ASC
		</cfquery>
		<cfoutput>
		<div class="magTitle">#RS1.magPrimName#<cfif IsDefined("RS1.magPrimBy") AND RS1.magPrimBy NEQ ""> by #RS1.magPrimBy#</cfif>
		<cfif RS1.DateAdded NEQ ""><cfif dateDiff('d', parseDateTime(RS1.DateAdded), now()) LTE application.daysNew> <img src="images/new!.gif" alt="New!" /></cfif></cfif>
		</div>
		<div class="boxMag07">#RS1.magPrimDes#</div>
		<div style="margin:10px;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="magazines"></div>
		<cfloop query="RS2">
			<cfset imageName=spanExcluding('#RS2.magFile#','.')>
			<!--- text2PDF/PNG Check --->
			<cfif right(RS2.magFile,3) EQ "txt">
				<cfset URLMagazineInfo="includes/magazines/#RS1.magPrimDir#/;#RS2.magFile#;#RS1.magPrimName# #RS2.magIssue#;#RS2.magHeadline#;n/a;#LSDateFormat(RS2.magReleaseDate,'D MMMM YYYY')#">
				<cfset URLMagazineInfoPNG="includes/magazines/png.versions/;#left(RS2.magFile, evaluate(find(".", RS2.magFile) -1))#.txt.png;#RS1.magPrimName# #RS2.magIssue#;#RS2.magHeadline#;n/a;#LSDateFormat(RS2.magReleaseDate,'D MMMM YYYY')#">
			<cfelseif #RS1.magPrimBy# NEQ "">
				<cfset URLMagazineInfo="includes/magazines/text.versions/;#left(RS2.magFile, evaluate(find(".", RS2.magFile) -1))#.txt;#RS1.magPrimName# #RS2.magIssue#;#RS2.magHeadline#;#RS1.magPrimBy#;#LSDateFormat(RS2.magReleaseDate,'D MMMM YYYY')#">			
				<cfset URLMagazineInfoPNG="includes/magazines/png.versions/;#left(RS2.magFile, evaluate(find(".", RS2.magFile) -1))#.txt.png;#RS1.magPrimName# #RS2.magIssue#;#RS2.magHeadline#;n/a;#LSDateFormat(RS2.magReleaseDate,'D MMMM YYYY')#">
			<cfelseif #RS1.magPrimBy# EQ "">
				<cfset URLMagazineInfo="includes/magazines/text.versions/;#left(RS2.magFile, evaluate(find(".", RS2.magFile) -1))#.txt;#RS1.magPrimName# #RS2.magIssue#;#RS2.magHeadline#;n/a;#LSDateFormat(RS2.magReleaseDate,'D MMMM YYYY')#">					
				<cfset URLMagazineInfoPNG="includes/magazines/png.versions/;#left(RS2.magFile, evaluate(find(".", RS2.magFile) -1))#.txt.png;#RS1.magPrimName# #RS2.magIssue#;#RS2.magHeadline#;n/a;#LSDateFormat(RS2.magReleaseDate,'D MMMM YYYY')#">
			</cfif>
			<table cellpadding="0" cellspacing="0" class="boxMag08">
				<tr><td style="width:180px;">
				<cfif IsDefined("RS2.magSize") AND RS2.magSize NEQ 0>
					<cfif fileExists(expandPath("images/magazine-scenes/#imagename#.png")) IS "Yes">
						<img src="images/magazine-scenes/#imagename#.png" alt="#RS1.magPrimName# #RS2.magIssue# capture" />
					<cfelseif fileExists(expandPath("images/magazine-scenes/#imagename#.jpg")) IS "Yes">
						<img src="images/magazine-scenes/#imagename#.jpg" alt="#RS1.magPrimName# #RS2.magIssue# capture" />
					<cfelseif fileExists(expandPath("images/magazine-scenes/#imagename#.gif")) IS "Yes">
						<img src="images/magazine-scenes/#imagename#.gif" alt="#RS1.magPrimName# #RS2.magIssue# capture" />
					</cfif>
				</cfif>					
				</td><td style="vertical-align:top;">
				<div style="float:right;" class="lightGrey normal fs10 arial">#RS2.magSize# KB<cfif IsDefined("RS2.Clicks") AND RS2.Clicks neq ""> - #RS2.Clicks# downloads</cfif></div>
				<div class="boxMag09">#RS1.magPrimName# #RS2.magIssue#<cfif RS2.DateAdded NEQ ""><cfif dateDiff('d', parseDateTime(RS2.DateAdded), now()) LTE application.daysNew> <img src="images/new!.gif" alt="New!" /></cfif></cfif></div>
				<cfif IsDefined("RS2.magHeadline") AND RS2.magHeadline NEQ "">
                    <div class="boxMag10">"#RS2.magHeadline#"</div>
				</cfif>
				<cfif IsDefined("RS2.magReleaseDate") AND RS2.magReleaseDate NEQ "">
					<cfinvoke component="utilities" method="numberConvert" number="#(LSDateFormat(RS2.magReleaseDate,'D'))#" returnvariable="date">
					<div class="left">#date# #LSDateFormat(RS2.magReleaseDate,'MMMM YYYY')#</div>
				</cfif>
				<cfif IsDefined("RS2.magSize") AND RS2.magSize EQ "0" AND Right(RS2.magFile,3) NEQ "txt">
					<div class="left red">We do not have a copy of this issue</div>
				</cfif>
				<cfif IsDefined("RS2.magSize") AND RS2.magSize NEQ "0"> 
				<cfif right(RS2.magFile,3) NEQ "txt">
					<cfif fileExists(expandPath("includes/magazines/png.versions/#Left(RS2.magFile, evaluate(find(".", RS2.magFile) -1))#.txt.png")) IS "Yes">
						<!--- PNG edition --->
						<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="#URLMagazineInfoPNG#" returnvariable="encryptedDAttr">
						<div class="left"><a href="magazines.cfm?id=#RS2.magID#&amp;reader=text2png.cfm?#encryptedDAttr#">Read in browser</a></div>
						<!--- ZIP download --->
						<div class="left"><a href="magazines.cfm?id=#RS2.magID#&amp;reader=raw">Download #LCase(RS2.magFile)#</a></div>
					<cfelse>						
						<!--- TEXT edition that also includes pdf & png --->
						<cfif fileExists(expandPath("includes/magazines/png.versions/#Left(RS2.magFile, Evaluate(Find(".", RS2.magFile) -1))#.txt.png")) IS "Yes">
							<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="#URLMagazineInfoPNG#" returnvariable="encryptedDAttr">
							<div class="left"><a href="magazines.cfm?id=#RS2.magID#&amp;reader=text2png.cfm?#encryptedDAttr#">Read in browser</a></div>
						</cfif>
							<div class="left"><a href="magazines.cfm?id=#RS2.magID#&amp;reader=raw">Download #LCase(RS2.magFile)#</a></div>
					</cfif>
					<!--- TEXT edition --->
					<cfif RS2.magTextFile EQ "1">
						<div class="left">
						<a href="magazines.cfm?id=#RS2.magID#&amp;reader=txt">Download text edition</a>
						<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="#URLMagazineInfo#" returnvariable="encryptedDAttr">
						<span class="fs11">(<a href="magazines.cfm?id=#RS2.magID#&amp;reader=text2pdf.cfm?#encryptedDAttr#">View as a <img src="images/explorer/pdf-mini.gif" border="0" alt="PDF" /></a>)</span>
						</div>
					</cfif>
				<cfelse>
					<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="#URLMagazineInfo#" returnvariable="encryptedDAttr">
					<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="#URLMagazineInfoPNG#" returnvariable="encryptedDAttrPNG">
					<div class="left" style="margin-top:6px; margin-bottom:6px;">
					<cfif fileExists(expandPath("includes/magazines/png.versions/#Left(RS2.magFile, Evaluate(Find(".", RS2.magFile) -1))#.txt.png")) IS "Yes">
						<a href="magazines.cfm?id=#RS2.magID#&amp;reader=text2png.cfm?#encryptedDAttrPNG#" title="View #RS1.magPrimName# #RS2.magIssue# in your web browser"><img src="images/documents/html.png" alt="HTML icon" style="border:0px;" /></a>
					</cfif>
						<a href="magazines.cfm?id=#RS2.magID#&amp;reader=text2pdf.cfm?#encryptedDAttr#" title="View #RS1.magPrimName# #RS2.magIssue# as a PDF file"><img src="images/documents/pdf.png" style="border:0px;" alt="PDF icon" /></a>
						<a href="magazines.cfm?id=#RS2.magID#&amp;reader=raw" title="View the original #RS1.magPrimName# #RS2.magIssue# text file"><img src="images/documents/text.png" style="border:0px;" alt="Text icon" /></a>
					</div>
				</cfif>
			<cfelse>
				<div style="class:left;"><a href="contact.cfm" class="verdana fs12 red">This issue is missing, if you have a copy please contact us</a></div><br />
			</cfif>						
		</td></tr></table>
      <!--- Google Adsense --->
      <cfif RS2.currentrow is 10 or RS2.currentrow is 20>
      <div style="margin:10px; text-align:center;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="magazines"></div>
      </cfif>
		</cfloop>
		</cfoutput>
	</cffunction>

	<cffunction name="download" access="public" returntype="string" hint="Records when a magazine has been downloaded">
		<cfargument name="id" required="yes" type="numeric">
		<cfargument name="reader" required="no" type="string">
    	<cftry>
			<cfquery name="RS1" datasource="#application.magSource#">
				SELECT magID,Clicks,magFile,magTitle FROM magazineissues WHERE magID = #id#
			</cfquery>
			<cfoutput>
			<!--- checks to make sure all the url variables are correct --->
			<cfif IsDefined("RS1.magID") AND RS1.magID NEQ "">
				<cfquery datasource="#application.magSource#">
				<!--- lock the counter increase to stop race conditions --->
				<cflock scope="application" type="exclusive" timeout="5">
					<cfif RS1.Clicks EQ "">
					<!--- if the current id has no views, then start with 1 --->
						UPDATE magazineissues SET Clicks=1
						WHERE magID=#URL.id#
					<cfelse>
					<!--- if the current id is an integer, then increase it --->
						UPDATE magazineissues SET Clicks=#IncrementValue(RS1.Clicks)#
						WHERE magID=#URL.id#
					</cfif>
				</cflock>
				</cfquery>
				<cfinvoke component="download" method="IPCheck">
				<!--- coded magazine --->
				<cfif reader EQ "raw">
					<cfquery name="RS2" datasource="#application.magSource#" cachedwithin="#application.magazinesTimeOut#">
						SELECT * FROM magazinedetail WHERE magPrimName = '#RS1.magTitle#'
					</cfquery>
					<cflocation addtoken="no" url="includes/magazines/#RS2.magPrimDir#/#RS1.magFile#">
				<!--- coded magazine text version --->
				<cfelseif reader EQ "txt">
					<cflocation addtoken="no" url="includes/magazines/text.versions/#Left(RS1.magFile, Evaluate(Find(".", RS1.magFile) -1))#.txt">
				<!--- coded magazine png version --->
				<cfelseif reader NEQ "" and left(reader,13) EQ "text2png.cfm?">
					<cflocation addtoken="no" url="#reader#">			
				<!--- pdf version of the magazine --->
				<cfelseif reader NEQ "" and left(URL.reader,13) EQ "text2pdf.cfm?">
					<cflocation addtoken="no" url="#reader#">
				<cfelse>
					<cflocation addtoken="no" url="#RS1.File#">
				</cfif>
			<cfelse>
				There is an error in the url supplied.
				<cfabort>
			</cfif>
			</cfoutput>
      <cfcatch>There is an error with the magazine<cfabort></cfcatch>
      </cftry>
	</cffunction>
	
	<cffunction name="helpDialog" access="public" returntype="string" hint="Help dialog with a link to provide DOS application solutions">
		<a href="help.cfm" id="MagHelpDialog" title="Goto our DOS solutions page">
			<div class="boxMagHelpDialog">
				<div class="bold" style="color:#935902;">Problems running DOS programs under Windows?</div>
				<div style="color:#333333">Jump over to our help page, where we give you solutions to help improve compatibility.</div>
			</div>
		</a>
	</cffunction>
	
	<cffunction name="listMagazines" access="public" returntype="string" hint="List all the magazines">
		<cfargument name="type" default="true">
		<cfquery name="RS1" datasource="#application.magSource#" cachedwithin="#application.magazinesTimeOut#">
			SELECT magPrimBy,magPrimName,magPrimDes,magPrimScreen,dateAdded FROM magazinedetail WHERE magPrimText = '#type#' ORDER BY magPrimName
		</cfquery>
		<cfoutput query="RS1">
		<cfquery name="RS2" datasource="#application.magSource#" cachedwithin="#application.magazinesTimeOut#">
			SELECT magReleaseDate FROM magazineissues WHERE magTitle = '#RS1.magPrimName#' ORDER BY magReleaseDate
		</cfquery>
		<table cellpadding="0" cellspacing="0" class="boxMag01">
		<tr>
			<td>
				<div class="magTitle" style="margin-top:6px;">
					<a href="magazines.cfm?mode=detail&amp;title=#RS1.magPrimName#" style="color:##E04B00;">#RS1.magPrimName#<cfif IsDefined("RS1.magPrimBy") AND RS1.magPrimBy NEQ ""> by #RS1.magPrimBy#</cfif></a>
					<cfif RS1.DateAdded NEQ "">
						<cfif dateDiff('d', parseDateTime(RS1.DateAdded), now()) LTE application.daysNew> &nbsp; <img src="images/new!.gif" alt="New!" /></cfif>
					</cfif>
					<cfset yearsPublished="">
					<cfloop query="RS2">
						<cfset yearsPublished="#yearsPublished#,#DateFormat(magReleaseDate,'YYYY')#">
					</cfloop>
					<cfset previousyear="">
					<cfset displayyear="">
					<div style="font-size:15px; float:right; margin-right:10px; color:##996600">
					<cfloop list="#yearsPublished#" index="index">
						<cfif previousyear neq index>
							<cfif previousyear neq "">
								<cfset displayyear="#displayyear#, #index#">
							<cfelse>
								<cfset displayyear="#index#">
							</cfif>
							<cfset previousyear="#index#">
						</cfif>
					</cfloop>
					#displayyear#
					</div>
				</div>
			</td>
		</tr>
		<tr><td class="boxMag04">
			<!--- Magazine description --->
			<div class="boxMag11">
				<cfif IsDefined("RS1.magPrimScreen")>
					<!--- Display a screenshot preview of the magazine or a logo ---> 
					<cfif fileExists(expandPath("images/magazine-scenes/#RS1.magPrimScreen#.png")) IS "Yes" AND type NEQ "Yes">
						<img src="images/magazine-scenes/#RS1.magPrimScreen#.png" alt="#RS1.magPrimName# Screen" class="magCapture" />
					<cfelseif fileExists(expandPath("images/magazine-scenes/#RS1.magPrimScreen#.jpg")) IS "Yes" AND type NEQ "Yes">
						<img src="images/magazine-scenes/#RS1.magPrimScreen#.jpg" alt="#RS1.magPrimName# Screen" class="magCapture" />
					<cfelseif fileExists(expandPath("images/magazine-scenes/#RS1.magPrimScreen#.gif")) IS "Yes" AND type NEQ "Yes">
						<img src="images/magazine-scenes/#RS1.magPrimScreen#.gif" alt="#RS1.magPrimName# Screen" class="magCapture" />
					<!--- Display a logo for a text based report --->
					<cfelseif fileExists(expandPath("images/magazine-scenes/#RS1.magPrimScreen#.png")) IS "Yes" AND type EQ "Yes">
						<img src="images/magazine-scenes/#RS1.magPrimScreen#.png" alt="#RS1.magPrimName# Logo" class="magCapture" />
					<cfelseif fileExists(expandPath("images/magazine-scenes/#RS1.magPrimScreen#.jpg")) IS "Yes" AND type EQ "Yes">
						<img src="images/magazine-scenes/#RS1.magPrimScreen#.jpg" alt="#RS1.magPrimName# Logo" class="magCapture" />
					<cfelseif fileExists(expandPath("images/magazine-scenes/#RS1.magPrimScreen#.gif")) IS "Yes" AND type EQ "Yes">
						<img src="images/magazine-scenes/#RS1.magPrimScreen#.gif" alt="#RS1.magPrimName# Logo" class="magCapture" />		
					<cfelse>
					</cfif>
				</cfif>
				#Trim(RS1.magPrimDes)#
			</div>
		</td></tr></table>
      <!--- Google Adsense --->
      <cfif RS1.currentrow is 5 or RS1.currentrow is 10>
      <table cellpadding="0" cellspacing="0" class="boxMag01">
      </td></tr>
			<tr><td class="boxMag04">
      <div style="margin:10px; text-align:center;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="magazines"></div>
      </td></tr>
      </table>
      </cfif>
		</cfoutput>
	</cffunction>	

	<cffunction name="secretCodes" access="public" hint="Displays a list of codes used to access hidden parts of various magazines">
		<cfquery name="RS1" datasource="#application.magSource#" cachedwithin="#application.magazinesTimeOut#">
			SELECT * FROM magazinesecretcodes
		</cfquery>
		<div class="menuNavigation"><a href="index.cfm">The Scene Archive</a> \ <a href="magazines.cfm">Magazine collection</a> \ Secret codes<span style="text-decoration:blink;">_</span></div>
		<table cellpadding="0" cellspacing="0" class="boxMag06">
		<cfoutput query="RS1">
			<tr><td class="magTimeLineDate boxMag12">
				#magazine#
			</td>
			<td class="boxMag13">
				#code#
			</td></tr>
		</cfoutput>
			<tr><td colspan="2"><div class="boxMag14">Credit for this compilation goes to <a href="http://www.hugi.scene.org/">Adok at Hugi</a></div></td></tr>
		</table>
	</cffunction>
	
	<cffunction name="title" access="public" returntype="string" hint="HTML broswer title">
		<cfargument name="mode" required="yes">
		<cfargument name="title" required="no">
		<cfswitch expression="#mode#">
			<cfcase value="detail"><cfoutput>#title#</cfoutput> Magazine</cfcase>
			<cfcase value="text">Text Magazine Collection</cfcase>
			<cfcase value="code">Magazine Collection</cfcase>
			<cfcase value="timelineDate,timelineTitle">Magazine Timeline</cfcase>
			<cfcase value="codes">Magazine Secret Codes</cfcase>
			<cfcase value="web">Web Magazines</cfcase>
		</cfswitch>
	</cffunction>

	<cffunction name="webMagazines" access="public" returntype="string" hint="Displays a listing of web based magazines with links to various snapshots">
    <!--- Google Adsense --->
    <div style="margin:10px; text-align:center;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="magazines"></div>
		<table cellpadding="0" cellspacing="0" class="boxMag05">
		<tr>
			<td rowspan="2" style="width:180px;" valign="top">
				<img src="images/magazine-scenes/scenelink.png" alt="Scenelink capture" />
			</td><td>
				<div class="magTitle">Scenelink</div>
				<div class="magWebURL">www.scenelink.org</div>
			</td>
		</tr>
		<tr>
			<td>
			<div class="justify">
				Created to take on the success of previous publications such as Reality Check Network. Scenelink entered the scene with a bang and tried to do things a little different.<p></p>
				Firstly even though they were a magazine that released on a monthly basis, they decided to skip the usual formats and go web only. This meant they could interact with their readers and update their content on the fly. Plus all their back issues where online in one convenient place for everyone to access.<p></p>
				The other influence Scenelink introduced to the scene is that it tried to unite and attract all the old school computer underground elements. Art, code, music, warez, you name it, Scenelink covered it. And for the most part it was successful in its goal of bringing all these scenes together.
			</div>
			<div style="margin-top:10px;"><a href="includes/magazinesweb/scenelink/index.html">View 25th June 1998 snapshot</a></div>
			</td>
		</tr></table>
		<table cellpadding="0" cellspacing="0" class="boxMag05" style="margin-top:20px;">
		<tr>
			<td rowspan="2" style="width:180px;" valign="top">
				<img src="images/magazine-scenes/tsn.gif" alt="Scenelink capture" />
			</td><td>
				<div class="magTitle">The Scene News</div>
				<div class="magWebURL">www.defacto2.net/scene-news/</div>
			</td>
		</tr>
		<tr>
			<td>
			<div class="justify">
				The Scene News was founded on the 19th October 1997 as a joint effort between Defacto2 and Sodom. It's mission was to 'tell readers about the important happenings in the scene in a brief and easy to read format'. And it did that for nearly two years.
			</div>
			<div style="margin-top:10px;">
				<a href="includes/magazinesweb/tsn_august_98/news.html">View 21st August 1998 snapshot</a><span class="bold red">*</span> &nbsp; 
				<a href="includes/magazinesweb/tsn_feb_99/index.html">View 14th September 1999 snapshot</a><br />
				<span class="red fs10">* this a popup window that might not work with IE 6+</span>
			</div>
			</td>
		</tr></table>	
	</cffunction>
	
</cfcomponent>