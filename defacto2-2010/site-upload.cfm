<!--- 
File: 		site-upload.cfm
Version: 	2
Author: 	Ben Garrett
Date: 		14 Jun 2006
A form that allows people to upload files to the server that also checks and restricts file type and file sizes
 --->

<!--- Determine incoming directory size and set quota --->
<cfdirectory action="list" directory="c:/websites/urk7tb/includes/incoming/webuploads/" name="incoming" filter="*">
<cfset directoryQuota=104857600>
<cfset directorySize=0>
<cfoutput query="incoming">
	<cfset directorySize=directorySize + incoming.size>
</cfoutput>
<cfset countDir=(directoryQuota - directorySize)>

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - Wanted Files &amp; User Submissions</title>
	<cfinvoke component="cfcs.meta" method="head">
	<script language="JavaScript" type="text/javascript">
	function waiting() {
		alert("Your file will now upload, it might take awhile depending on the size.");
		}
	</script>	
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td class="left">
			<div class="functionHeader">Wanted Files &amp; User Submissions</div>
          <!--- 19/Nov/09 : Moved upload box to the top of the page --->
				<div style="width:600px; font-size:12px; margin-left:auto; margin-right:auto; border:1px solid ##CCCCCC; padding:5px;">
				The form will only save <span class="black">zip, 7-zip, rar</span> or <span class="black">gzip</span> archives. 
				Anything larger then <span class="black">6 megs</span> will end up timing out.
				If you wish to submit a larger collection of files, then <a href="contact.cfm" title="Send us an e-mail">contact us</a> and we can set you up with a temporary FTP account for you to upload to.<div style="padding-top:12px; "></div>

				<!--- CHECK uploaded file --->
				<cfif IsDefined("form.file") AND form.file NEQ "">
					<cfparam name="status" default="">
					<cffile action="upload" filefield="form.file" destination="c:/websites/urk7tb/includes/incoming/temp/" nameconflict="makeunique">
					<cfset uploadTickEnd=GetTickCount()>
					<cfset tickcalc=numberFormat((uploadTickEnd - val(form.tick)) / 1000,"___._")>
					<cfset time=createTimeSpan(0,0,0,round(tickcalc))>
					<div class="courier fs15">
					Upload time: #timeFormat(time,"m")# minutes #timeFormat(time,"s")# seconds
					<p>Validating file ..</p>
					<cfinvoke component="cfcs.utilities" method="byteConversion" value="#VAL(fileSize)#" returnvariable="sizeFormated">
					<cfif cffile.FileSize LT 21000000>
						File Size - <span class="green">Pass</span> (#sizeFormated#)<br />
					<cfelse>
						File Size - <span class="red">Failed</span> (#sizeFormated#)<br /><cfset status="failed">
					</cfif>
					<cfif FILE.ServerFileExt EQ 'zip' OR FILE.ServerFileExt EQ '7z' OR FILE.ServerFileExt EQ 'gz' OR FILE.ServerFileExt EQ 'rar'>
						File Type - <span class="green">Pass</span> (#FILE.ServerFileExt#)
					<cfelse>
						File Type - <span class="red">Failed</span> (#FILE.ServerFileExt#)<cfset status="failed">
					</cfif>
					<cfif status NEQ "failed">
						<cfset tempFile=#GetFileFromPath('#cffile.serverfile#')#>
						<cffile action="move" source="c:/websites/urk7tb/includes/incoming/temp/#tempFile#" destination="c:/websites/urk7tb/includes/incoming/webuploads/" nameconflict="makeunique">
						<cfset UTCHour = GetTimeZoneInfo()>
						<cfset UTCMinute = GetTimeZoneInfo()>
<!--- Send e-mail of a successful submission --->
<cfinvoke component="cfcs.utilities" method="byteConversion" value="#directoryQuota#" returnvariable="directoryQuotaFormated">
<cfinvoke component="cfcs.utilities" method="byteConversion" value="#(directorySize+fileSize)#" returnvariable="directorySizeFormated">
<cfinvoke component="cfcs.utilities" method="byteConversion" value="#countDir-fileSize#" returnvariable="remainingDirQuotaFormated">
<cfinvoke component="cfcs.utilities" method="byteConversion" value="#file.FileSize#" returnvariable="sizeFormated">
<cfprocessingdirective suppresswhitespace="no">
<cfmail from="""mail.defacto2.net"" <#FORM.mail#>" to="REMOVED" subject="New File Upload! (#file.ServerFile#)">
Submitted On: #TimeFormat(Now(), "h:mm tt")# #DateFormat(Now(), "DDDD, D-MMM YYYY")# (UTC #UTCHour.utcHourOffset#.#UTCMinute.utcMinuteOffset#) 

Incoming Directory:
limit: #directoryQuotaFormated#, size: #directorySizeFormated#, quota remaining: <cfif sgn(countDir-fileSize) eq -1 or sgn(countDir-fileSize) eq 0>directory is full<cfelse>#remainingDirQuotaFormated#</cfif>

File Details:
file: #file.ServerFile#, size: #sizeFormated#, time created: #TimeFormat(file.TimeCreated,"HH.mm.ss")# #DateFormat(file.TimeCreated,"dd-mmm-yyyy")#, last modified: #TimeFormat(file.TimeLastModified,"HH.mm.ss")# #DateFormat(file.TimeLastModified,"dd-mmm-yyyy")#

Direct Download Link: http://www.defacto2.net/includes/incoming/webuploads/#file.ServerFile#
						
Sender:
nick: #form.nick# (#form.mail#)
PPHA: #CGI.SERVER_PROTOCOL# #CGI.SERVER_PORT# #CGI.REMOTE_HOST# #CGI.REMOTE_ADDR#

Description:
#FORM.body#
				
www.defacto2.net
</cfmail>
</cfprocessingdirective>
							<p class="green">Upload Successful</p>
							</div>
							Thank you for your submission, your files will be looked at shortly. <a href="site-upload.cfm">Return to the upload form</a>.
                            <!--- 16-Nov-2009 : Inserted refresh button --->
                   			<hr />
						<cfelse>
							</div>
							<p class="red">Upload Unsuccessful</p>
					</cfif>
					<cfset uploadTickEnd=GetTickCount()>
				<cfelse>	
					<!--- FORM file upload --->
					<cfform action="site-upload.cfm" enctype="multipart/form-data" method="post" onsubmit="waiting();" >
					<div class="boxForm01">
					<cfif sgn(countDir) eq -1 or sgn(countDir) eq 0>
						Sorry the upload directory quota has been reached and we can not accept any more uploads.
						Please try again in a couple of days or get in contact with us to make other arrangements.
					<cfelse>
						<table cellspacing="0" cellpadding="0" class="boxForm02">
							<tr>
								<td class="boxForm03 boxUpload02"><div class="boxForm04">File to upload</div></td>
								<td class="boxForm05"><cfinput type="file" name="file" required="no" size="39" class="formInputs" title="Select a file from your computer"></td>
							</tr>				
							<tr>
								<td class="boxForm03 boxUpload02"><div class="boxForm04">Alias/nick</div></td>
								<td class="boxForm05"><cfinput type="text" name="nick" required="yes" message="You must enter a nick name" style="width:336px;" class="formInputs"></td>
							</tr>
							<tr>
								<td class="boxForm03 boxUpload02"><div class="boxForm04">E-mail</div></td>
								<td class="boxForm05"><cfinput type="text" name="mail" required="yes" message="We require a valid e-mail address" validate="email" style="width:336px;" class="formInputs"></td>
							</tr>
							<tr>
								<td class="boxForm03 boxUpload02"><div class="boxForm04">Description</div></td>
								<td><cftextarea name="body" required="yes" message="Please describe of what you are uploading" style="width:336px; height:100px;" class="formInputs"></cftextarea></td>
							</tr>
							<tr>
								<td colspan="2"><div class="center" style="padding:2px; "><cfinput type="submit" name="submit" value="Upload your file"></div></td>
							</tr>
						</table>
					</cfif>
					</div>
					<input type="hidden" name="tick" value="#GetTickCount()#" />
					</cfform>
				</cfif>
                
                <p>
				Do you have some files that you think we could use?
				Don't worry if you think the files are too new or irrelevant.
				Send them up anyway and we will filter through what we can use.
				</p><p>
				Cracktros, magazines, reports, text files, documents, articles, art work .. anything scene related that we currently are not hosting.
				Simply compress all the files into a single archive and upload them using our file submission form at the bottom of this page.
				</p>
				<p>On that note we're also specifically chasing the following ..</p>
				<div class="maroon">
					<ul>
						<li>Message logs or archives from the old scene BBS networks including <strong>TCSnet</strong>, <strong>CelerityNet</strong>, <strong>FelonyNet</strong>, <strong>CyberCrime</strong>, <strong>InfiNet</strong>
						<span class="fs12"><a href="http://en.wikipedia.org/wiki/Fidonet">(this is an example of a BBS network)</a></span>
						</li>
            <br />
            <li>All issues of <strong>Some Weekly Chart</strong></li>
						<br />
						<li>BBS screen captures and logs <span class="fs12"><a href="http://www.defacto2.net/bbs.cfm?title=streets">(example)</a></span></li>
						<br />
						<li>Cracktros, new or old <span class="fs12"><a href="http://www.defacto2.net/cracktros.cfm?mode=group&value=Fairlight">(example)</a></span></li>
						<br />
						<li>Old group or scene based web pages that we can host as archives <span class="fs12"><a href="http://www.defacto2.net/includes/documentsweb/fairlight/index.html">(example)</a></span></li>
						<br />
						<li>
							Magazines such as
							<ul class="fs12"><br />
              	<li><strong>United States Courier Report</strong> from around 2000</li>
								<li><strong>Courier Weektop Scorecard</strong> issues 31, 32, 39, 40, 61, 66, 67, 92, 97 <span class="fs11"><a href="http://www.defacto2.net/magazines.cfm?mode=detail&title=Courier%20Weektop%20Scorecard">(view)</a></span></li>
								<li><strong>Inquisition</strong> issue 13 [was coded and a text file] <span class="fs11"><a href="http://www.defacto2.net/magazines.cfm?mode=detail&title=Inquisition">(view)</a></span></li>
								<li><strong>The Net Monkey Weekly Report</strong> issues 11, 54 <span class="fs11"><a href="http://www.defacto2.net/magazines.cfm?mode=detail&title=The%20Net%20Monkey%20Weekly%20Report">(view)</a></span></li>
								<li><strong>The Warez Report by The Renegade Chemist</strong> missing issues <span class="fs11"><a href="http://www.defacto2.net/magazines.cfm?mode=detail&title=The%20Warez%20Report">(view)</a></span></li>
								<li><strong>Galatic Review</strong> issues circa 1991 <span class="fs11"><a href="http://www.defacto2.net/magazines.cfm?mode=detail&title=Galactic%20Review">(view)</a></span></li>
								<li><strong>Hype Magazine</strong> issues circa 1992 <span class="fs11"><a href="http://www.defacto2.net/magazines.cfm?mode=detail&title=Hype%20Magazine">(view)</a></span></li>
								<li><strong>Pirates Analyze Warez</strong> circa 1993 <span class="fs11"><a href="http://www.defacto2.net/magazines.cfm?mode=detail&title=Pirates%20Analyze%20Warez">(view)</a></span></li>
								<li><strong>Scooby Snack Magazine</strong> issues 3, 6 <span class="fs11"><a href="http://www.defacto2.net/magazines.cfm?mode=detail&title=Scooby%20Snack%20Magazine">(view)</a></span></li>
								<li><strong>The Bad News</strong> issues 1-9 <span class="fs11"><a href="http://www.defacto2.net/magazines.cfm?mode=detail&title=The%20Bad%20News">(view)</a></span></li><br />
							</ul>
						</li>
					</ul>
				</div>
                
			  </div>
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>