<cfcomponent>
	
	<cffunction name="countDownload" access="public" returntype="string" hint="Records when a document has been downloaded">
		<cfargument name="id" type="numeric" required="yes">
		<cfargument name="reader" type="string" required="no">
		<cfquery name="RS1" datasource="#application.docSource#">
			SELECT Clicks,UniqueID,File FROM documents WHERE UniqueID = #id#
		</cfquery>
    
		<cfoutput>
			<cfif IsDefined("RS1.UniqueID") AND RS1.UniqueID NEQ "">
				<cfquery datasource="#application.docSource#">
				<!--- lock the counter increase to stop race conditions --->
				<cflock scope="application" type="exclusive" timeout="5">
					<cfif RS1.Clicks EQ "">
						<!--- if the current id has no views, then start with 1 --->
						UPDATE documents SET Clicks=1
						WHERE UniqueID=#URL.id#
					<cfelse>
						<!--- if the current id is an integer, then increase it --->
						UPDATE documents SET Clicks=#IncrementValue(RS1.Clicks)#
						WHERE UniqueID=#URL.id#
					</cfif>
					</cflock>
				</cfquery>
				<!--- forward to the actual document --->
				<cfif reader NEQ "" and left(reader,13) eq "text2pdf.cfm?">
					<cflocation addtoken="no" url="#URL.Reader#">
				<cfelse>
					<cflocation addtoken="no" url="#RS1.File#">
				</cfif>
			<cfelse>
				There is an error in the url supplied.<br />
				<cflocation addtoken="no" url="documents.cfm">
			</cfif>
		</cfoutput>
	</cffunction>
	
	<cffunction name="filterMenu" access="public" returntype="string" hint="Display the filter menus">
		<cfargument name="documentsSelection" required="yes">
		<cfargument name="documentsSort" required="yes">
		<cfif documentsSelection EQ "Category">
			<cfquery name="RS1" datasource="#application.docSource#" cachedwithin="#application.docTimeOut#">
				SELECT DISTINCT category FROM documentscategories ORDER BY Category #DocumentsSort#
			</cfquery>
		<cfelseif documentsSelection EQ "Year">
			<cfquery name="RS1" datasource="#application.docSource#" cachedwithin="#application.docTimeOut#">
				SELECT DISTINCT Year FROM documents WHERE Year <> '' ORDER BY Year #DocumentsSort#
			</cfquery>
		<cfelseif documentsSelection EQ "Type">
			<cfquery name="RS1" datasource="#application.docSource#" cachedwithin="#application.docTimeOut#">
				SELECT DISTINCT Type FROM documents ORDER BY Type #documentsSort#
			</cfquery>
		</cfif>
		<cfquery name="RSDocumentCount" datasource="#application.docSource#" cachedwithin="#application.docTimeOut#">
			SELECT Count(Type) AS sum FROM documents
		</cfquery>
		<cfquery name="RSDocumentCountText" datasource="#application.docSource#" cachedwithin="#application.docTimeOut#">
			SELECT Count(Type) AS sum FROM documents WHERE Type = 'text'
		</cfquery>
		<cfquery name="RSDocumentCountPdf" datasource="#application.docSource#" cachedwithin="#application.docTimeOut#">
			SELECT Count(Type) AS sum FROM documents WHERE Type = 'pdf'
		</cfquery>
		<cfquery name="RSDocumentCountXml" datasource="#application.docSource#" cachedwithin="#application.docTimeOut#">
			SELECT Count(Type) AS sum FROM documents WHERE Type = 'xml'
		</cfquery>
		<cfquery name="RSDocumentCountHtml" datasource="#application.docSource#" cachedwithin="#application.docTimeOut#">
			SELECT Count(Type) AS sum FROM documents WHERE Type = 'html'
		</cfquery>
		<cfquery name="RSDocumentCountLink" datasource="#application.docSource#" cachedwithin="#application.docTimeOut#">
			SELECT Count(Type) AS sum FROM documents WHERE Type = 'link'
		</cfquery>
		<cfoutput>
		<table cellpadding="0" cellspacing="0" class="boxDoc03"><tr>
			<td><div class="boxDoc04">#RSDocumentCount.sum# documents; #RSDocumentCountText.sum# text, #RSDocumentCountHtml.sum# html, #RSDocumentCountXml.sum# XML, #RSDocumentCountPdf.sum# PDF and #RSDocumentCountLink.sum# links</div></td>
			<td style="background-color:##C7C8FC">
				<div class="boxDoc04 boxDoc05">
					<form action="documents.cfm##documentSection" method="get" id="docSort" style="margin:0px;">
					<fieldset style="border:0px; margin:0px; padding:0px;">
					Sort the listing 
					<select name="category" size="1">
						<option value="category"<cfif url.category eq "category"> selected="selected"</cfif>>Category</option>
						<option value="year"<cfif url.category eq "year"> selected="selected"</cfif>>Year</option>
						<option value="type"<cfif url.category eq "type"> selected="selected"</cfif>>File Type</option>
					</select>
					<select name="order" size="1">
						<option value="asc"<cfif url.order eq "asc"> selected="selected"</cfif>>ascending</option>
						<option value="desc"<cfif url.order eq "desc"> selected="selected"</cfif>>descending</option>
					</select>
					<input type="submit" name="List" value="submit" />
					</fieldset>
					</form>
				</div>
			</td></tr>
		</table>
		<div class="boxDoc06">
		<cfloop query="RS1">
			<cfquery name="RSDocuments" datasource="#application.docSource#" cachedwithin="#application.docTimeOut#">
				SELECT Category,Year,Type FROM documents
			<cfif documentsSelection EQ "Category">
				WHERE Category = '#RS1.Category#'
			<cfelseif documentsSelection EQ "Year">
				WHERE Year = '#RS1.Year#'
			<cfelseif documentsSelection EQ "Type">
				WHERE Type = '#RS1.Type#'
			</cfif>
				ORDER BY Year, Month, Date, Author ASC
			</cfquery>
			<cfif documentsSelection EQ "Category">
				<a href="###replaceNoCase(RS1.Category,' ','','all')#">#RS1.Category#</a><cfif RS1.currentrow LT RS1.recordcount>,<cfelse>.</cfif>
			<cfelseif documentsSelection EQ "Year">
				<a href="###replaceNoCase(RS1.Year,' ','','all')#">#RS1.Year#</a><cfif RS1.currentrow LT RS1.recordcount AND RS1.Year NEQ "">,<cfelseif RS1.Year NEQ "">.</cfif>
			<cfelseif documentsSelection EQ "Type">
				<a href="###replaceNoCase(RS1.Type,' ','','all')#">#RS1.Type#</a><cfif RS1.currentrow LT RS1.recordcount>,<cfelse>.</cfif>
			</cfif>
		</cfloop>
		</div>
		</cfoutput>
	</cffunction>
	
	<cffunction name="listDocuments" access="public" returntype="string" hint="List all the available documents, including brief infomation and links">
		<cfargument name="documentsSelection" required="yes">
		<cfargument name="documentsSort" required="yes">
		<cfif documentsSelection EQ "Category">
			<cfquery name="RS1" datasource="#application.docSource#" cachedwithin="#application.docTimeOut#">
				SELECT DISTINCT Category FROM documentscategories ORDER BY Category #DocumentsSort#
			</cfquery>
		<cfelseif documentsSelection EQ "Year">
			<cfquery name="RS1" datasource="#application.docSource#" cachedwithin="#application.docTimeOut#">
				SELECT DISTINCT Year FROM documents ORDER BY Year #DocumentsSort#
			</cfquery>
		<cfelseif documentsSelection EQ "Type">
			<cfquery name="RS1" datasource="#application.docSource#" cachedwithin="#application.docTimeOut#">
				SELECT DISTINCT Type FROM documents ORDER BY Type #documentsSort#
			</cfquery>
		</cfif>
		<div class="left">
		<cfoutput query="RS1">
			<cfquery name="RS2" datasource="#application.docSource#" cachedwithin="#application.docTimeOut#">
				SELECT * FROM documents
			<cfif documentsSelection EQ "Category">
				WHERE Category = '#RS1.Category#'
			<cfelseif documentsSelection EQ "Year">
				WHERE Year = '#RS1.Year#'
			<cfelseif documentsSelection EQ "Type">
				WHERE Type = '#RS1.Type#'
			</cfif>
				ORDER BY Year, Month, Date, Author ASC
			</cfquery>
			
			<cfif RS2.RecordCount NEQ 0>
				<cfif documentsSelection EQ "Category">
					<!--- display the category --->
					<a id="#replaceNoCase(RS1.Category,' ','','all')#"></a>
					<div class="boxDoc07">#RS1.Category#</div>
				<cfelseif documentsSelection EQ "Year">
					<a id="#replaceNoCase(RS1.Year,' ','','all')#"></a>
					<div class="boxDoc07">#RS1.Year#</div>
				<cfelseif documentsSelection EQ "Type">
					<a id="#replaceNoCase(RS1.Type,' ','','all')#"></a>
					<div class="boxDoc07">#RS1.Type#</div>
                </cfif>
				
				<cfloop query="RS2">
				<!--- document detail --->
				<table cellpadding="0" cellspacing="0" class="boxDoc08">
					<tr><td rowspan="3" style="vertical-align:top;">
						<div style="width:40px;">
					  	<!--- type (using image icon) --->
						<cfswitch expression="#RS2.Type#">
							<cfcase value="pdf">
								<img src="images/documents/pdf.png" alt="PDF file" title="This is a PDF document" />
							</cfcase>
							<cfcase value="xml">
								<img src="images/documents/xml.gif" alt="XML file" title="This is an XML document" />
							</cfcase>
							<cfcase value="text">
								<img src="images/documents/text.png" alt="Text file" title="This is an ASCII text file" />
							</cfcase>
							<cfcase value="html">
								<img src="images/documents/html.png" alt="HTML file" title="This is a HTML document" />
							</cfcase>
							<cfcase value="link">
								<img src="images/documents/html.png" alt="HTML link" title="This is a web link" />
							</cfcase>
						</cfswitch>
						</div>
						</td>
						<!--- Text2PDF check --->
						<cfif RS2.Year NEQ "" OR RS2.Month NEQ "" OR RS2.Date NEQ "">
							<cfif RS2.Month NEQ ""><cfinvoke component="utilities" method="monthConvert" format="short" month="#RS2.Month#" returnvariable="RS2.Month"></cfif>
							<cfset URLDocumentsInfo="n/a;#RS2.File#;Text Document;#RS2.Description#;#RS2.Author#;#RS2.Date# #RS2.Month# #RS2.Year#">			
						<cfelse>
							<cfset URLDocumentsInfo="n/a;#RS2.File#;Text Document;#RS2.Description#;#RS2.Author#;n/a">					
						</cfif>
						<td colspan="2" style="width:100%;">
							<!--- new! --->
							<cfif RS2.DateAdded NEQ ""><cfif dateDiff('d', parseDateTime(RS2.DateAdded), now()) LTE application.daysNew><img src="images/new!.gif" alt="New document" /></cfif></cfif>
							<span class="arial fs14"><a href="documents.cfm?id=#RS2.UniqueID#" title="View #RS2.Description#">#RS2.Description#</a></span>
							<cfif #RS2.Type# EQ "Text">
								<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="#URLDocumentsInfo#" returnvariable="URLDocumentsInfo"><!--- 	
								<span class="arial fs10"> &nbsp; (<a href="documents.cfm?id=#RS2.UniqueID#&amp;reader=text2pdf.cfm?#URLDocumentsInfo#" title="View this document in a PDF format">View as a <img src="images/explorer/pdf-mini.gif" style="border:0px;" alt="PDF" /></a>)</span> --->
							</cfif>
							<cfif #RS2.Type# EQ "Link"> <span class="verdana fs12 Purple">[external  link]</span></cfif>
							<cfif IsDefined("RS2.Clicks") AND RS2.Clicks neq ""> <span class="lightGrey normal fs9 arial">(#RS2.Clicks#)</span></cfif>
						</td></tr>
						<tr class="verdana fs12">
						<!--- published date --->
						<cfif RS2.Year NEQ "" OR RS2.Month NEQ "" OR RS2.Date NEQ "">
							<td><div style="width:150px;">Date: <span class="maroon">#RS2.Date# #RS2.Month# #RS2.Year#</span></div></td>
                        <cfelse>
							<td><div style="width:150px;">Date: <span class="maroon">n/a</span></div></td>
						</cfif>
						<!--- author --->
						<cfif RS2.Author NEQ "">
							<td style="width:100%;">Author: <span class="green">#RS2.Author#</span></td>
						<cfelse>
							<td style="width:100%;">Author: <span class="green">n/a</span></td>
						</cfif>
					</tr><tr><td colspan="3" class="arial fs14">
						<!--- details --->
						<div style="margin-top:4px; text-align:justify;">#RS2.InDetail#</div></td>
                    </tr></table>
				</cfloop>
			</cfif>
      <!--- Google Adsense --->
      <cfif RS1.currentrow is 1 or RS1.currentrow is 3>
      <div style="margin:10px; text-align:center;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="documents"></div>
      </cfif>
		</cfoutput>			
		</div>
	</cffunction>
	
	<cffunction name="packs" access="public" returntype="string" hint="Display the NFO file packs">
		<cfquery name="filePackA" datasource="#application.dataSource#" cachedwithin="#application.docTimeOut#">
			SELECT * FROM filepacks WHERE id = 5
		</cfquery>
		<cfquery name="filePackB" datasource="#application.dataSource#" cachedwithin="#application.docTimeOut#">
			SELECT * FROM filepacks WHERE id = 7
		</cfquery>
		<cfoutput query="filePackB">
			<cfif nolocal EQ true><cfset downloadAttr="downloads;#filename#;#filesize#;nolocal;#fulltitle#">
			<cfelse><cfset downloadAttr="downloads;#filename#;#filesize#;#fulltitle#">
			</cfif>
			<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="#downloadAttr#" returnvariable="downloadAttr">		
			<div style="float:right;" class="boxDoc01">
			<a href="download.cfm?#downloadAttr#" class="docPackLink" style="color:##FFFFFF;" title="Download #fulltitle#">
				<img src="images/documents/nfo3.png" alt="NFO ANSI" style="float:right; border:0px;" />
				<span class="docPackTitle">#fulltitle#</span><br />
				<span class="docPackSum">#summarydes#</span><br />
				<span class="docPackDes italic">"#fulldes#"</span><br />
				<span class="docPackDate">Last revised on #dateFormat(lastrevised,"d-mmmm, yyyy")#</span>
			</a>
			</div>
		</cfoutput>
		<cfoutput query="filePackA">
			<cfif nolocal eq true><cfset downloadAttr="downloads;#filename#;#filesize#;nolocal;#fulltitle#">
			<cfelse><cfset downloadAttr="downloads;#filename#;#filesize#;#fulltitle#">
			</cfif>
			<cfinvoke component="utilities" method="urlEncryption" mode="encrypt" string="#downloadAttr#" returnvariable="downloadAttr">
			<div class="boxDoc01" style="margin-right:auto;">
			<a href="download.cfm?#downloadAttr#" class="docPackLink" style="color:##FFFFFF;" title="Download #fulltitle#">
				<img src="images/documents/nfo4.png" alt="NFO ANSI" style="float:right; margin-left:3px; border:0px;" />
				<span class="docPackTitle">#fulltitle#</span><br />
				<span class="docPackSum">#summarydes#</span><br />
				<span class="docPackDes">#fulldes#</span><br />
				<span class="docPackDate">Last revised on #dateFormat(lastrevised,"d-mmmm, yyyy")#</span>
			</a>
			</div>
		</cfoutput>
	</cffunction>

</cfcomponent>