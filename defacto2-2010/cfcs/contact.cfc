<cfcomponent>
	<cffunction name="contactFlash" access="public" returntype="string" hint="Contact form in FLASH">
		<div class="center">
		<cfform action="#CGI.SCRIPT_NAME#" method="post" name="commentform" format="flash" skin="HALOorange" timeout="1200" width="700" height="340" >
			<cfformgroup type="tabnavigator">
			<cfformgroup type="page" label="Contact Us">
			<cfformgroup type="vertical">
<!---			<cfselect name="To" label="To" required="yes" message="No recipient was selected">
			<option>The Scene News</option>
			<option>The Scene Archives</option>
			<option>The Scene Portal</option>
			<option>System Administration</option>
			</cfselect>--->
            <cfinput name="To" type="text" label="To" required="yes" maxlength="50" message="No sender was supplied" value="Defacto2" readonly="yes" />
			<cfinput name="From" type="text" label="From (alias/nick)" required="yes" maxlength="50" message="No sender was supplied" />
			<cfinput name="ReplyTo" type="text" label="Reply-to (email address)" required="yes" maxlength="250" validate="EMAIL" message="A valid e-mail address was not given" />
			<cfinput name="Subject" type="text" label="Subject" required="no" maxlength="255" />
			<cftextarea name="MessageBody" height="160" label="Message" message="No message was supplied" required="yes"></cftextarea>
			</cfformgroup>
			</cfformgroup>
			<cfformgroup type="page" label="Submit">
			<cfformgroup type="vertical">
			<cfformitem type="text" name="To" bind="To: {To.text}"></cfformitem>
			<cfformitem type="text" name="From" bind="From: {From.text}"></cfformitem>
			<cfformitem type="text" name="ReplyTo" bind="Reply-to: {ReplyTo.text}"></cfformitem>
			<cfformitem type="text" name="Subject" bind="Subject: {Subject.text}"></cfformitem>
			<cfformitem type="text" name="Message" bind="Message: {MessageBody.text}"></cfformitem>
			<cfinput type="submit" name="submit" value="Submit Message" />
			</cfformgroup>
			</cfformgroup>
			</cfformgroup>
			<cfinput type="hidden" name="mode" value="contact">
			<cfinput type="hidden" name="format" value="flash">
		</cfform>
		</div>
		<div class="contactAltLink">
			<a href="contact.cfm?mode=contact&amp;format=html">If you can not view this flash form use our HTML form instead</a><br />
			Want to add or modify a listing in The Scene Portal? <a href="contact.cfm?mode=portal&amp;format=flash">Use our Portal Submission form instead</a>
		</div>
	</cffunction>

	<cffunction name="contactHTML" access="public" returntype="string" hint="Contact form in HTML">
		<cfset spamKey="#GenerateSecretKey('DESEDE')#">
		<cfset spamInput="#GenerateSecretKey('DESEDE')#">
		<cfform action="#CGI.SCRIPT_NAME#" method="post" enablecab="yes" style="margin-top:0px; margin-bottom:0x;">
			<cfinput type="hidden" name="spamKey" value="#spamKey#">
			<cfinput type="hidden" name="mode" value="contact">
			<cfinput type="hidden" name="format" value="html">
			<div class="boxForm01">		
			<table cellspacing="0" cellpadding="0" class="boxForm02">
				<tr>
					<td class="boxForm03"><div class="boxForm04">Anti-SPAM</div></td>
					<td class="boxForm05"><cfinput type="text" name="#spamInput#" style="width:336px;" required="yes" value="#spamKey#" class="formInputs" /></td>
				</tr>
				<tr>
					<td class="boxForm03"><div class="boxForm04"></div></td>
					<td class="boxForm05"><cfinput type="text" name="ASGUIN" id="ASGUIN" style="width:336px;" required="yes" value="Copy the above input box text into here (overwrite this message)" message="You need to copy the text from the ANTI-Spam input" class="formInputs" /></td>
				</tr>								  
				<tr>
					<td class="boxForm03"><div class="boxForm04">From</div></td>
					<td class="boxForm05"><cfinput type="text" name="From" style="width:336px;" required="yes" message="You need to fill out the 'From' box" class="formInputs" /></td>
				</tr>
				<tr>
					<td class="boxForm03"><div class="boxForm04">To</div></td>
					<td class="boxForm05">
                    <cfinput type="text" name="To" style="width:336px;" required="yes" message="You need to fill out the 'To' box" class="formInputs" value="Defacto2" readonly="yes" />
<!---                    
					<select name="To" style="width:342px;" class="formInputs">
					<option value="The Scene News" selected >The Scene News</option>
					<option value="The Scene Archives">The Scene Archives</option>
					<option value="The Scene Portal">The Scene Portal</option>
					<option value="Defacto2">System Administration</option>
					</select>                    ---></td>
				</tr>
				<tr>
					<td class="boxForm03"><div class="boxForm04">Reply-to <span class="verdana fs11">(email)</span></div></td>
					<td class="boxForm05"><cfinput type="text" name="ReplyTo" style="width:336px;" required="yes" message="You need to fill out the 'Reply-to' box with an e-mail address" class="formInputs" /></td>
				</tr>
				<tr>
					<td class="boxForm03"><div class="boxForm04">Subject</div></td>
					<td><cfinput type="text" name="Subject" style="width:336px;" required="yes" message="You need to fill out the 'Subject' box" class="formInputs" /></td>
				</tr>
				<tr>
					<td colspan="2"><div class="boxForm06"><textarea name="MessageBody" style="width:400px;" rows="8" ></textarea></div></td>
				</tr>
				<tr>
					<td colspan="2"><div class="boxForm07"><input type="submit" name="Submit" value="Send Message" style="width:120px; " /><input type="reset" name="reset" value="Start Over" style="width:120px;" /></div></td>
				</tr> 
			</table>
			</div>
		</cfform>
	</cffunction>

	<cffunction name="contactSend" access="public" returntype="string" hint="Contact form, email code">
		<cfif IsDefined("FORM.format") AND FORM.format EQ "html" AND FORM.spamKey NEQ FORM.ASGUIN>
			<div class="formAntiSpam">Anti-SPAM block, your submission was not sent</div>
			<cfabort>
		</cfif>			
		<cfprocessingdirective suppresswhitespace="no">
		<cfset UTCHour = GetTimeZoneInfo()>
		<cfset UTCMinute = GetTimeZoneInfo()>
		<cfmail from="""mail.defacto2.net"" <#FORM.ReplyTo#>" to="REMOVED" subject="#FORM.Subject# (#FORM.ReplyTo#)">
		FROM 	: #FORM.From# (#FORM.ReplyTo#)
		SUBJECT : #FORM.Subject#
		SENT AT : #TimeFormat(Now(), "h:mm tt")# #DateFormat(Now(), "DDDD, D-MMM YYYY")# (UTC #UTCHour.utcHourOffset#.#UTCMinute.utcMinuteOffset#) 
		Message :
		
		#FORM.MessageBody#
				
		www.defacto2.net<cfif IsDefined("FORM.format") AND FORM.format EQ "flash"> (flashform)</cfif>
		</cfmail>
		</cfprocessingdirective>
		<div class="formOkay" align="center">Your request was successfully sent.<br />
		We will endeavor to get back to you with a reply as soon as possible.</div>		
	</cffunction>

	<cffunction name="portalFlash" access="public" returntype="string" hint="Portal submission form in Flash">
		<cfquery name="RSdf2Category" datasource="#application.portalSource#" cachedwithin="#application.dailyTimeOut#">
			SELECT CatName FROM thesceneportalcategories
		</cfquery>
		<div class="center">
		<cfform action="#CGI.SCRIPT_NAME#" name="commentform" format="flash" skin="HALOorange" timeout="1200" width="700" height="450" >
			<cfformgroup type="tabnavigator">
			<cfformgroup type="page" label="Scene Portal Submission">
			<cfformgroup type="vertical">
			<cfselect name="Request" label="Request" required="yes" message="No action was selected">
				<option>Submit a new web site to The Scene Portal</option>
				<option>Change the details of an existing web site listing</option>
			</cfselect>
			<cfinput name="From" type="text" label="From (alias/nick)" required="yes" maxlength="50" message="No sender was supplied" />
			<cfinput name="ReplyTo" type="text" label="Reply-to (email address)" required="yes" maxlength="250" validate="EMAIL" message="A valid e-mail address was not given" />
			<cfinput name="WebpageName" type="text" label="Website Title" required="yes" message="No title was given" maxlength="255" />
			<cfinput name="WebpageURL" type="text" label="URL" required="yes" validate="URL" message="A valid URL was not supplied" />
			<cfinput name="Atom1URL" type="text" label="Atom Feed" required="no" validate="URL" message="A valid URL was not supplied" />
			<cfinput name="RSS2URL" type="text" label="RSS2 Feed" required="no" validate="URL" message="A valid URL was not supplied" />
			<cfselect name="WebpageCategory" label="Category" query="RSdf2Category" value="CatName" required="no" message="No category was given"> </cfselect>
			<cftextarea name="MessageBody" height="160" label="Description" message="No description was given" required="no"></cftextarea>
			</cfformgroup>
			</cfformgroup>
			<cfformgroup type="page" label="Submit">
			<cfformgroup type="vertical">
			<cfformitem type="text" name="Request" bind="Request: {Request.text}"></cfformitem>
			<cfformitem type="text" name="From" bind="From: {From.text}"></cfformitem>
			<cfformitem type="text" name="ReplyTo" bind="Reply-to: {ReplyTo.text}"></cfformitem>
			<cfformitem type="text" name="WebsiteName" bind="Title: {WebpageName.text}"></cfformitem>
			<cfformitem type="text" name="WebsiteURL" bind="URL: {WebpageURL.text}"></cfformitem>
			<cfformitem type="text" name="Atom1URL" bind="Atom feed: {Atom1URL.text}"></cfformitem>
			<cfformitem type="text" name="RSS2URL" bind="RSS feed: {RSS2URL.text}"></cfformitem>
			<cfformitem type="text" name="WebpageCategory" bind="Category: {WebpageCategory.text}"></cfformitem>
			<cfformitem type="text" name="Message" bind="Description: {MessageBody.text}"></cfformitem>
			<cfinput type="submit" name="submit" value="Submit Request" />
			</cfformgroup>
			</cfformgroup>
			</cfformgroup>
			<cfinput type="hidden" name="mode" value="portal">
			<cfinput type="hidden" name="format" value="flash">
		</cfform>
		</div>
		<div class="contactAltLink">
			<a href="contact.cfm?mode=portal&amp;format=html">If you can not view this flash form use our HTML form instead</a><br />
		</div>
	</cffunction>
	
	<cffunction name="portalHTML" access="public" returntype="string" hint="Portal submission form in HTML">
		<cfquery name="RSdf2Category" datasource="#application.portalSource#" cachedwithin="#application.dailyTimeOut#">
			SELECT CatName FROM thesceneportalcategories
		</cfquery>
		<cfoutput>
		<cfset spamKey="#GenerateSecretKey('DESEDE')#">
		<cfset spamInput="#GenerateSecretKey('DESEDE')#">
		<cfform action="#CGI.SCRIPT_NAME#" method="post" enablecab="yes" style="margin-top:0px;">
			<cfinput type="hidden" name="spamKey" value="#spamKey#">
			<cfinput type="hidden" name="mode" value="portal">
			<cfinput type="hidden" name="format" value="html">
			<div class="boxForm01" style="margin-top:0px;">
			<table cellspacing="0" cellpadding="0" class="boxForm02">
				<tr>
					<td class="boxForm03"><div class="boxForm04">Anti-SPAM</div></td>
					<td class="boxForm05"><cfinput type="text" name="#spamInput#" style="width:336px;" required="yes" value="#spamKey#" class="formInputs" /></td>
				</tr>
				<tr>
					<td class="boxForm03"></td>
					<td class="boxForm05"><cfinput type="text" name="ASGUIN" id="ASGUIN" style="width:336px;" required="yes" value="Copy the above input box text into here (overwrite this message)" message="You need to copy the text from the ANTI-Spam input" class="formInputs" /></td>
				</tr>
				<tr>
					<td class="boxForm03"><div class="boxForm04">From</div></td>
					<td class="boxForm05"><cfinput type="text" name="From" style="width:336px;" required="yes" message="You need to fill out the 'From' box" class="formInputs" /></td>
				</tr>
				<tr>
					<td class="boxForm03"><div class="boxForm04">Request</div></td>
					<td class="boxForm05"><select name="Request" style="width:342px;" class="formInputs">
					<option value="Add a new site" selected>Add a new site</option>
					<option value="Edit an existing site">Edit an existing site</option>
					</select></td>
				</tr>
				<tr>
					<td class="boxForm03"><div class="boxForm04">Reply-to <span class="verdana fs11">(email)</span></div></td>
					<td class="boxForm05"><cfinput type="text" name="ReplyTo" style="width:336px;" required="yes" message="You need to fill out the 'Reply-to' box with an e-mail address" class="formInputs" /></td>
				</tr>
				<tr>
					<td class="boxForm03"><div class="boxForm04">Web site Name</div></td>
					<td class="boxForm05"><cfinput type="text" name="WebpageName" style="width:336px;" required="yes" message="You need to fill out the 'Webpage Name' box" class="formInputs" /></td>
				</tr>
				<tr>
					<td class="boxForm03"><div class="boxForm04">URL</div></td>
					<td class="boxForm05"><cfinput type="text" name="WebpageURL" value="http://" style="width:336px;" required="yes" message="You need to fill out the 'Webpage URL' box" class="formInputs" /></td>
				</tr>
				<tr>
					<td class="boxForm03"><div class="boxForm04">Atom feed URL</div></td>
					<td class="boxForm05"><cfinput type="text" name="Atom1URL" value="http://" style="width:336px;" required="no" message="You need to fill out the 'Atom URL' box" class="formInputs" /></td>
				</tr>
				<tr>
					<td class="boxForm03"><div class="boxForm04">RSS feed URL</div></td>
					<td class="boxForm05"><cfinput type="text" name="RSS2URL" value="http://" style="width:336px;" required="no" message="You need to fill out the 'RSS2 URL' box" class="formInputs" /></td>
				</tr>				  				  
				<tr>
					<td class="boxForm03"><div class="boxForm04">Category</div></td>
					<td><select name="WebpageCategory" style="width:342px;" class="formInputs">
						<cfloop query="RSdf2Category">
							<option value="#RSdf2Category.CatName#" selected>#RSdf2Category.CatName#</option>
						</cfloop>                   
						</select></td></tr>
				<tr>
					<td colspan="2"><div class="boxForm06"><textarea name="MessageBody" style="width:400px;" rows="8" >Description of the web page ..</textarea></div></td>
				</tr>
				<tr>
					<td colspan="2"><div class="boxForm07"><input type="submit" name="Submit" value="Save & Send" style="width:120px;" /><input type="reset" name="reset" value="Start Over" style="width:120px;" /></div></td>
				</tr>
			</table>
			</div>
		</cfform>
		</cfoutput>
	</cffunction>
	
	<cffunction name="portalSend" access="public" returntype="string" hint="Portal submission, email">
		<cfif IsDefined("FORM.format") AND FORM.format EQ "html" AND FORM.spamKey NEQ FORM.ASGUIN>
			<div class="formAntiSpam">Anti-SPAM block, your submission was not sent</div>
			<cfabort>
		</cfif>
		<!--- Supress coldfusion whitespace --->
		<cfprocessingdirective suppresswhitespace="no">
		<cfset UTCHour = GetTimeZoneInfo()>
		<cfset UTCMinute = GetTimeZoneInfo()>
		<cfmail from="""mail.defacto2.net"" <#FORM.ReplyTo#>" to="REMOVED" subject="#FORM.Request# (#FORM.ReplyTo#)">
		FROM		: #FORM.From# (#FORM.ReplyTo#)
		REQUEST		: #FORM.Request#
		SENT AT		: #TimeFormat(Now(), "h:mm tt")# #DateFormat(Now(), "DDDD, D-MMM YYYY")# (UTC #UTCHour.utcHourOffset#.#UTCMinute.utcMinuteOffset#)
		Name		: #FORM.WebpageName#
		URL			: #FORM.WebpageURL# 
		Atom		: #FORM.Atom1URL# 
		RSS2		: #FORM.RSS2URL# 
		Category	: #FORM.WebpageCategory#
		Description	:
		
		#FORM.MessageBody#
			  
		www.defacto2.net<cfif IsDefined("FORM.format") AND FORM.format EQ "flash"> (flashform)</cfif>
		</cfmail>
		</cfprocessingdirective>
		<div class="formOkay" align="center">Your request was successfully sent.<br />
		We will endeavor to get back to you with a reply as soon as possible.</div>
	</cffunction>
	
</cfcomponent>