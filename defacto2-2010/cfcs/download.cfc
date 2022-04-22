<cfcomponent>

	<cffunction name="decipherURL" access="public" returntype="string" hint="Deciphers an encrpyted download url link">
		<cfargument name="section" type="numeric" required="true">
		<cfargument name="url" type="string" required="yes">
		<cfset var result="">
		<cfinvoke component="utilities" method="urlEncryption" mode="decrypt" string="#url#" returnvariable="decryptedURL">
		<cfset result=XMLFormat(getToken(decryptedURL, section, ";"))>
		<cfreturn result>
	</cffunction>
	
	<cffunction name="donations" access="public" returntype="string" hint="Paypal donation button">
		<div style="margin-top:20px;">
			<form action="https://www.paypal.com/cgi-bin/webscr" method="post">
			<fieldset style="margin:0px; padding:0px; border:0px;">
			<input type="hidden" name="cmd" value="_s-xclick" />
			<input type="image" src="images/paypal.png" style="border:0px;" name="submit" alt="Donate to Defacto2" title="Donate to Defacto2" />
			<img alt="" src="https://www.paypal.com/en_AU/i/scr/pixel.gif" style="border:0px;" width="1" height="1" />
			<input type="hidden" name="encrypted" value="REMOVED" />
			</fieldset>
			</form>
		</div>
		<div class="fs13 verdana">Note: you do not need to sign up for a Paypal account to donate, you just need your credit card</div>
	</cffunction>
	
	<cffunction name="downloadFile" access="public" returntype="string" hint="Record the file download and then forward to the actual file">
		<cfargument name="file" required="yes" type="string">
		<cfargument name="server" required="no" type="string">
		<cfquery name="RS1" datasource="#application.dataSource#">
			SELECT * FROM filepacks WHERE filename = '#file#'
		</cfquery>
		<cfoutput>
			<!--- checks to make sure all the url variables are correct --->
			<cfif IsDefined("RS1.filename") AND RS1.filename NEQ "">
				<cfquery datasource="#application.dataSource#">
				<!--- Lock the counter increase to stop race conditions --->
				<cflock scope="application" type="exclusive" timeout="10">
					<cfif RS1.downloads EQ "">
					<!--- If the current id has no views, then start with 1 --->
						UPDATE filepacks SET downloads=1
						WHERE filename='#URL.file#'
					<cfelse>
					<!--- If the current id is an integer, then increase it --->
						UPDATE filepacks SET downloads=#IncrementValue(RS1.downloads)#
						WHERE filename='#URL.file#'
					</cfif>
				</cflock>
				</cfquery>		
			</cfif>
		</cfoutput>
		<cfinvoke component="download" method="IPCheck">
		<!--- forward to the actual file --->
		<cfif server EQ "">
			<cflocation addtoken="no" url="http://www.defacto2.net/includes/downloads/#file#">
		<cfelseif url.server EQ "cpi">
			<cflocation addtoken="no" url="http://defacto2.canadianpiratesinc.com/mirror/downloads/#file#">
		<cfelseif url.server EQ "Untergrund">
			<cflocation addtoken="no" url="ftp://ftp.untergrund.net/users/irokos/magz/defacto2/#file#">
		</cfif>
	</cffunction>
	
	<cffunction name="IPCheck" access="public" returntype="string" hint="">
		<cfif NOT CGI.REFERER CONTAINS "defacto2.net" AND NOT CGI.REFERER CONTAINS "http://server/defacto2/" AND CGI.REFERER NEQ "">
			<div style="font-family:Arial, Helvetica, sans-serif; font-size:16px; color:#FF0000; text-align:center; margin-top:40px;">
				<span style="font-weight:bold;">This download has been automatically blocked!</span><br />
				Defacto2 does not allow the direct linking of files by other sites.<br />
				<a href="http://www.defacto2.net">www.defacto2.net</a><br />
			</div>
			<cfabort>
		</cfif>
	</cffunction>
	
	<cffunction name="readme" access="public" returntype="string">
		<cfargument name="file_name" required="yes" type="string">
		<cfset var fn="">
		<cfif left(reverse(file_name),3) eq "z7.">
			<cfset fn="#mid(file_name,1,(len(file_name)-3))#">
		<cfelseif left(reverse(file_name),3) eq "piz">
			<cfset fn="#mid(file_name,1,(len(file_name)-4))#">
		</cfif>
		<cfif FileExists(ExpandPath("includes/downloads/#fn#-dox.zip")) IS TRUE>
			<cfoutput>
			<span style="font-size:13px; font-family:Arial, Helvetica, sans-serif; font-weight:normal; float:right;"><a href="includes/downloads/#fn#-dox.zip">download the accompanying readme files</a></span>
			</cfoutput>
		</cfif>
	</cffunction>
	
</cfcomponent>