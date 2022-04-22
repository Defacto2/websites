<cfcomponent>

	<cffunction name="docType" access="public" hint="HTML document type declaration for all pages">
		<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" >
	</cffunction>
	
	<cffunction name="foot" access="public" returntype="string" hint="Default footer for all pages, including links, copyright and time to load stats">	
		<cfargument name="pageTimer" required="no">
		<cfset var currentPage=GetFileFromPath(GetTemplatePath())>
		<cfoutput>	
		<table cellpadding="0" cellspacing="0" class="box03">
			<tr><td><div class="geneva fs12 white">
				<!--- Copyright notice with dynamic current date --->
				Defacto2 &copy; Copyright 1996-#LSDateFormat(Now(),'YYYY')# - All other files offered are assumed public domain unless noted. We assert no rights over them.
			</div>
			<div class="geneva fs14" style="color:##404040; text-align:center;">
				<!--- Ticktime stop and display --->
				<cfif IsDefined("pageTimer") AND pageTimer NEQ ""><span id="pageTimer">Load time: #pageTimer# secs | </span></cfif>
				<span id="pageTimer">XHTML 1.1 : Valid | Site Security : <a href="http://www.siteadvisor.com/sites/defacto2.net" title="Check our site's security status">Safe</a> | Running : <a href="http://www.adobe.com/coldfusion/">ColdFusion #Left(Replace(Server.ColdFusion.ProductVersion,',','.','all'),5)#</a></span>
<!--- 				<!--- Site map link --->
				<a href="site-map.cfm" title="Site-wide navigation links">Site Map</a> - 
				<!--- Contact link --->
				<a href="contact.cfm" title="Send us an e-mail">Contact Us</a> - 
				<!--- Contributors link --->
				<a href="site-info.cfm?mode=credits" title="Discover who helped make this site possible">Thanks &amp; Contributors</a>
				<!--- Donations, a direct link to the Paypal donation site
				<a href="#urlEncodedFormat('https://www.paypal.com/xclick/business=donations%40defacto2.net&item_name=Defacto2&no_shipping=1&no_note=1&tax=0&currency_code=USD')#" title="Help keep Defacto2 on-line">Donations</a> &nbsp;
				 ---><!--- XHTML 1.1 Validation --->
				<!--- <cfif currentPage NEQ "contact.cfm" AND currentPage NEQ "poll.cfm" AND currentPage NEQ "news.cfm">
					<img src="images/xhtml11.png" alt="XHTML 1.1 valid" style="margin-left:30px; vertical-align:middle;" /> - 
				</cfif> --->
				<!--- <!--- McAfee Security Advisor --->
				<a href="http://www.siteadvisor.com/sites/defacto2.net" title="Check our site's security status">McAfee Site Advisor</a> ---> --->
			</div>
		</td></tr></table>
		</cfoutput>
	</cffunction>
		
	<cffunction name="head" access="public" returntype="string" hint="Meta code used for all pages">
		<cfset var currentPage=GetFileFromPath(GetTemplatePath())>
		<!--- favorite/bookmark icon --->
		<link rel="icon" href="images/favicon.ico" type="image/x-icon" />
		<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
		<!--- stylesheets link --->
		<link href="site-style.css" rel="stylesheet" type="text/css" />
		<!--- live bookmarks! --->
		<link rel="alternate" type="application/atom+xml" title="The Scene News with Defacto2 news" href="feed.cfm?format=atom1&amp;list=tsn" />
		<link rel="alternate" type="application/atom+xml" title="The Scene News" href="feed.cfm?format=atom1&amp;list=scenenews" />
		<link rel="alternate" type="application/atom+xml" title="Defacto2 news" href="feed.cfm?format=atom1&amp;list=sitenews" />
		<link rel="alternate" type="application/atom+xml" title="New files" href="feed.cfm?format=atom1&amp;list=newfiles" />
		<link rel="alternate" type="application/atom+xml" title="New cracktros" href="feed.cfm?format=atom1&amp;list=cracktros" />
		<link rel="alternate" type="application/atom+xml" title="File pack updates" href="feed.cfm?format=atom1&amp;list=filepacks" />
		<!--- google analytics --->
		<script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
		<script type="text/javascript">
			_uacct = "UA-154473-1";
			urchinTracker();
		</script>
		<!--- metatags used for search engine categorising and placing --->
		<meta http-equiv="PICS-Label" content="(PICS-1.1 "http://www.weburbia.com/safe/ratings.htm" l r (s 1))" />
		<cfif currentPage EQ "polls.cfm" OR (currentPage EQ "index.cfm" AND CGI.HTTP_REFERER EQ "polls.cfm")><meta http-equiv="Cache-control" content="no-cache" /></cfif>
		<meta name="robots" content="all" />
		<meta name="revisit-after" content="1 days" />
		<meta name="classification" content="Internet" />
		<meta name="description" content="Defacto2.net is the premier site for the underground scene. We cover all areas from gaming, art, music, emulation and old school. Included with in our pages is the extensive Scene Portal, the regularly updated The Scene News and the now famous The Scene Archives." />
		<meta name="Keywords" content="the scene, warez, pirating, pirate, scene, underground, oldskool, cracktros, crack-intros, games, iso, application, cracks, emulation, hirez, scripting, demos, music, ansi, ascii, art, oldschool, pc" />
		<meta name="distribution" content="Global" />
		<meta name="rating" content="General" />
		<meta name="copyright" content="Defacto2 &amp; Ben Garrett (Ipggi)" />
		<meta name="author" content="Ben Garrett (Ipggi)" />
		<meta name="language" content="English" />
		<!---
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		--->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<cfif getFileFromPath(GetTemplatePath()) EQ "index.cfm">
			<script type="text/javascript">
				<!--
				function MM_swapImgRestore() { //v3.0
				  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
				}
				function MM_preloadImages() { //v3.0
				  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
					var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
					if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
				}
				function MM_findObj(n, d) { //v4.01
				  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
					d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
				  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
				  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
				  if(!x && d.getElementById) x=d.getElementById(n); return x;
				}
				function MM_swapImage() { //v3.0
				  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
				   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
				}
				//-->
			</script>
		</cfif>
	</cffunction>
		
</cfcomponent>