<cfcomponent>

	<cffunction name="byteConversion" access="public" returntype="string" hint="Converts a number into a rounded computer unit">
		<cfargument name="value" required="yes" type="numeric">
		<cfargument name="lowestValue" required="no" type="string" default="bytes" hint="Sets the smallest output value (kB,MB,GB,TB) allowed to be displayed">
		<cfargument name="highestValue" required="no" type="string" default="TB" hint="Sets the largest output value (kB,MB,GB,TB) allowed to be displayed">
		<cfargument name="round" required="no" type="boolean" default="yes" hint="Do not show a decimal place for numbers 1 or over">
		<cfset var result=0>
		<cfset var unit="">
		<cfset var bytes=1>
		<cfset var kB=1024>
		<cfset var MB=1048576>
		<cfset var GB=1073741824>
		<cfset var TB=1099511627776><cfsilent>
			<cfset unit="TB">
			<cfif (value LT TB AND lowestValue NEQ "TB") OR highestValue EQ "GB">
				<cfset unit="GB">
			</cfif>
			<cfif (value LT GB AND lowestValue NEQ "GB" AND lowestValue NEQ "TB") OR highestValue EQ "MB">
				<cfset unit="MB">
			</cfif>
			<cfif (value LT MB AND lowestValue NEQ "MB" AND lowestValue NEQ "GB" AND lowestValue NEQ "TB") OR highestValue EQ "kB">
				<cfset unit="kB">
			</cfif>
			<cfif value LT kB AND lowestValue NEQ "kB" AND lowestValue NEQ "MB" AND lowestValue NEQ "GB" AND lowestValue NEQ "TB">
				<cfset unit="bytes">
			</cfif>
			<cfset result=value/evaluate(unit)>
			<cfif result LT 1 AND round IS TRUE>
				<cfset result=numberFormat(result,".99")>
			<cfelseif result LT 1 AND round IS FALSE>
				<cfset result=numberFormat(ceiling(result),"0")>
			<cfelseif result LT 10 AND round IS TRUE>
				<cfset result=numberFormat(round(result*100)/100,"0.00")>
			<cfelseif result LT 10 AND round IS FALSE>
				<cfset result=numberFormat(round(result*100)/100,"0")>
			<cfelseif result LT 100 AND round IS TRUE>
				<cfset result=numberFormat(round(result*10)/10,"90.0")>
			<cfelseif result LT 100 AND round IS FALSE>
				<cfset result=numberFormat(round(result*10)/10,"90")>
			<cfelse>	
				<cfset result=round(result)>
			</cfif>
			<cfinvoke component="utilities" method="numberConvert" number="#result#" format="comma" returnvariable="result">
			<cfset returnValue=result & ' ' & unit>
			<cfreturn returnValue></cfsilent>
	</cffunction>

	<cffunction name="commentsClean" access="public" returntype="string" hint="Converts custom (flash) FORM tags into valid HTML">
		<cfargument name="text" required="yes">
		<cfset text=ReplaceNoCase(text,Chr(13),'[br]','all')>
		<cfset text=ReplaceNoCase(text,'<','&lt;','all')>
		<cfset text=ReplaceNoCase(text,'>','&gt;','all')>
		<cfset text=ReplaceNoCase(text,'[br]','<br />','all')>
		<cfset text=ReplaceNoCase(text,'[p]','<p></p>','all')>
		<cfset text=ReplaceNoCase(text,'[b]','<span style="font-weight:bold;">','all')>
		<cfset text=ReplaceNoCase(text,'[/b]','</span>','all')>
		<cfset text=ReplaceNoCase(text,'[i]','<span style="font-style:italic;">','all')>
		<cfset text=ReplaceNoCase(text,'[/i]','</span>','all')>
		<cfset text=ReplaceNoCase(text,'[u]','<span style="text-decoration:underline;">','all')>
		<cfset text=ReplaceNoCase(text,'[/u]','</span>','all')>
		<!--- convert [a][/a] tags to a valid URL link --->
		<cfoutput>
			<cfset loop=1>
			<cfset urlS=FindNoCase("[a]", text)>
			<cfset urlE=FindNoCase("[/a]", text)>
			<cfloop condition="urlE NEQ 0">
				<cfif urlS GT 0>
					<cfset urladdress=mid(text,(urlS+3),(urlE-3-urlS))>
					<cfset text=ReplaceNoCase(text,'[a]#urladdress#[/a]','<a href="#urladdress#">#urladdress#</a>','one')>
				</cfif>
				<cfset urlS=FindNoCase("[a]", text,(urlE+3))>
				<cfset urlE=FindNoCase("[/a]", text,(urlE+3))>
				<cfset loop=loop+1>
			</cfloop>
			#text#
		</cfoutput>
	</cffunction>
	
	<cffunction name="downloadTime" access="public" hint="Calculates the time a file will take to download">
		<cfargument name="size" required="yes" type="numeric">
		<cfargument name="speed" required="yes" type="numeric" hint="56 = 56kb, 512 = 512kb, 1038 = 1.5 Mb">
		<cfset var totalSeconds=(size*1024)/((1024*speed)*100)>
		<cfset var string="">
		<cfset var hourPlural="">
		<cfset var minPlural="">
		<cfset var hours=totalSeconds/3600>
		<cfset var minutes=totalSeconds/60>
		<cfset var seconds=totalSeconds MOD 60>
		<cfif minutes GTE 60><cfset minutes=minutes MOD 60></cfif>
		<cfif hours GTE 1>
			<cfif hours GT 2>
				<cfset hourPlural=" hours ">
			<cfelse>
				<cfset hourPlural=" hour ">
			</cfif>
			<cfset string=fix(hours) & hourPlural>
		</cfif>
		<cfif minutes GTE 1 AND hours LT 1>
			<cfif minutes GT 2>
				<cfset minPlural=" minutes ">
			<cfelse>
				<cfset minPlural=" minute ">
			</cfif>
			<cfset string=string & fix(minutes) & minPlural>
		</cfif>
		<cfif minutes GTE 1 AND hours GTE 1>
			<cfif minutes GT 0 AND minutes LTE 10>
				<cfset string=string & " and 10 minutes">
			<cfelseif minutes GT 10 AND minutes LTE 20>
				<cfset string=string & " and 20 minutes">
			<cfelseif minutes GT 20 AND minutes LTE 30>
				<cfset string=string & " and 30 minutes">
			<cfelseif minutes GT 30 AND minutes LTE 40>
				<cfset string=string & " and 40 minutes">
			<cfelseif minutes GT 40 AND minutes LTE 50>
				<cfset string=string & " and 50 minutes">
			<cfelseif minutes GT 50 AND minutes LTE 60>
				<cfset string=string & " and 55 minutes">
			</cfif>
		</cfif>		
		<cfif seconds GT 0 AND minutes LT 1 AND hours LT 1>
			<cfif seconds GT 0 AND seconds LTE 10>
				<cfset string="10 seconds">
			<cfelseif seconds GT 10 AND seconds LTE 20>
				<cfset string="10 to 20 seconds">
			<cfelseif seconds GT 20 AND seconds LTE 30>
				<cfset string="20 to 30 seconds">
			<cfelseif seconds GT 30 AND seconds LTE 40>
				<cfset string="30 to 40 seconds">
			<cfelseif seconds GT 40 AND seconds LTE 50>
				<cfset string="40 to 50 seconds">
			<cfelseif seconds GT 50 AND seconds LTE 60>
				<cfset string="a minute">
			</cfif>
			
		</cfif>
		<cfreturn string>
	</cffunction>	

	<cffunction name="monthConvert" access="public" hint="Converts a numeric month into it's string name">
		<cfargument name="month" required="yes" type="numeric">
		<cfargument name="format" required="no" default="long">
		<cfset var returnString="">
		<cfif format EQ "long">
		<cfswitch expression="#month#">
			<cfcase value="1"><cfset returnString="January"></cfcase>
			<cfcase value="2"><cfset returnString="February"></cfcase>
			<cfcase value="3"><cfset returnString="March"></cfcase>
			<cfcase value="4"><cfset returnString="April"></cfcase>
			<cfcase value="5"><cfset returnString="May"></cfcase>
			<cfcase value="6"><cfset returnString="June"></cfcase>
			<cfcase value="7"><cfset returnString="July"></cfcase>
			<cfcase value="8"><cfset returnString="August"></cfcase>
			<cfcase value="9"><cfset returnString="September"></cfcase>
			<cfcase value="10"><cfset returnString="October"></cfcase>
			<cfcase value="11"><cfset returnString="November"></cfcase>
			<cfcase value="12"><cfset returnString="December"></cfcase>
		</cfswitch>
		<cfelseif format EQ "short">
		<cfswitch expression="#month#">
			<cfcase value="1"><cfset returnString="Jan"></cfcase>
			<cfcase value="2"><cfset returnString="Feb"></cfcase>
			<cfcase value="3"><cfset returnString="Mar"></cfcase>
			<cfcase value="4"><cfset returnString="Apr"></cfcase>
			<cfcase value="5"><cfset returnString="May"></cfcase>
			<cfcase value="6"><cfset returnString="Jun"></cfcase>
			<cfcase value="7"><cfset returnString="Jul"></cfcase>
			<cfcase value="8"><cfset returnString="Aug"></cfcase>
			<cfcase value="9"><cfset returnString="Sep"></cfcase>
			<cfcase value="10"><cfset returnString="Oct"></cfcase>
			<cfcase value="11"><cfset returnString="Nov"></cfcase>
			<cfcase value="12"><cfset returnString="Dec"></cfcase>
		</cfswitch>
		</cfif>
		<cfreturn returnString>
	</cffunction>

	<cffunction name="numberConvert" access="public" returntype="string" hint="Formats a number and outputs the result">
		<cfargument name="number" required="yes" type="numeric">
		<cfargument name="format" required="no" default="oral" hint="oral or comma">
		<cfset var suffix="">
		<cfset var value="">
		<cfset var decimal="">
		<cfset var integer="">
		<cfif format EQ "oral">
			<!--- convert number to use an oral suffix --->
			<cfset value=right(number,1)>
			<cfif (value GTE 4 AND value LTE 9) OR value EQ 0 OR (number GTE 11 AND number LTE 13)>
				<cfset suffix="th">
			<cfelseif value EQ 1>
				<cfset suffix="st">
			<cfelseif value EQ 2>
				<cfset suffix="nd">		
			<cfelseif value EQ 3>
				<cfset suffix="rd">
			</cfif>
			<cfset returnValue=(number & suffix)>
			<cfreturn returnValue>
		<cfelseif format EQ "comma">
			<!--- format number with commas --->
			<cfset decimal=listLast(number,".")>
			<cfset integer=listFirst(number,".")>
			<cfif decimal EQ integer><cfset decimal=0></cfif>
			<cfset integer=REReplace(reverse(integer), "([0-9][0-9][0-9])", "\1,", "ALL")>
			<cfset integer=REReplace(integer, ",$", "")>
			<cfset integer=REReplace(integer, ",([^0-9]+)", "\1")>
			<cfif decimal EQ 0>
				<cfset returnValue=reverse(integer)>
			<cfelse>
				<cfset returnValue=reverse(integer) & '.' & decimal>
			</cfif>
			<cfreturn returnValue>
		</cfif>
		
	</cffunction>

	<cffunction name="pageTimer" access="public" returntype="string" hint="Page Timer, records then displays how long the CFM template takes to process">
		<cfargument name="mode" required="yes">
		<cfif mode EQ "start">
			<cfset pageTimerClock=GetTickCount()>
			<cfreturn pageTimerClock>
		<cfelseif IsNumeric(mode) EQ TRUE>
			<cfset returnValue=numberFormat((GetTickCount() - mode) / 1000,"___._")>
			<cfreturn returnValue>
		</cfif>
	</cffunction>

	<cffunction name="urlEncryption" access="public" returntype="string" hint="Encrypts/decrypts a string for safe URL transfer">
		<cfargument name="mode" required="yes" hint="encrypt or decrypt">
		<cfargument name="string" required="yes" hint="string to encrypt/decrypt">
		<cfargument name="key" required="no" default="#application.urlEncryptionKey#" hint="encryption key to use">
		<cfif mode EQ "encrypt">
			<cfset returnValue=cfusion_encrypt(string, key)>
			<cfset returnValue=returnValue & "-EN">
			<cfreturn returnValue>
		<cfelseif mode EQ "decrypt" AND right(string,3) EQ "-EN">
			<cfset returnValue=cfusion_decrypt(left(string,len(string)-3), key)>
			<cfreturn returnValue>
		</cfif>
	</cffunction>
	
	<cffunction name="botScan" access="public" returntype="string" hint="Scans the HTTP User Agent and checks if it is an internet bot">
		<!--- return browser, bot, unknown --->
		<cfset var tmp="unknown">
		<cfset var useragent="#CGI.HTTP_USER_AGENT#">
		<cfset var botlist="google,yahoo,slurp,msnbot,ichiro,Teoma,Ask Jeeves,spider,snapbot,OmniExplorer,NASA,crawl,robot,heritix,MJ12bot,gigabot,geniebot,findlinks,krawl">
		<cfloop list="botlist" index="i">
			<cfif useragent CONTAINS i>
				<cfset tmp="bot">
				<cfreturn tmp>
			</cfif>
		</cfloop>
		<cfreturn tmp>
	</cffunction>
	
</cfcomponent>