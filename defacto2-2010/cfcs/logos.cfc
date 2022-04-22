<cfcomponent>

	<cffunction name="sceneArchive" access="public" returntype="string" hint="Displays The Scene Archive logo with random cracktro captures">
		<cfargument name="forceIE" type="boolean" required="no" default="no">
		<!--- This code randomly sets 6 unique numbers which correspond to image file names --->
		<cfset var imagesdir="images/">
		<!--- The total number of image files that are available --->
		<cfset var imgMax=52>
		<!--- Set random image number 1 & 2 --->
		<cfset var img1=randrange(1,imgMax)>
		<cfset var img2=randrange(1,imgMax)>
		<cfset var img3="">
		<cfset var img4="">
		<cfset var img5="">
		<cfset var img6="">
		<!--- Compare random image number 1 & 2 to make sure they are not the same --->
		<cfloop condition="img2 EQ img1">
			<!--- If they are the same, change image number 2 to a new random number and re-check --->
			<cfset img2=randrange(1,imgMax)>
		</cfloop>
		<!--- End img1 & img2 check --->
		<cfset img3=randrange(1,imgMax)>
		<cfloop condition="img3 EQ img1 OR img3 EQ img2">
			<cfset img3=randrange(1,imgMax)>
		</cfloop>
		<cfset img4=randrange(1,imgMax)>
		<cfloop condition="img4 EQ img1 OR img4 EQ img2 OR img4 EQ img3">
			<cfset img4=randrange(1,imgMax)>
		</cfloop>
		<cfset img5=randrange(1,imgMax)>
		<cfloop condition="img5 EQ img1 OR img5 EQ img2 OR img5 EQ img3 OR img5 EQ img4">
			<cfset img5=randrange(1,imgMax)>
		</cfloop>
		<cfset img6=randrange(1,imgMax)>
		<cfloop condition="img6 EQ img1 OR img6 EQ img2 OR img6 EQ img3 OR img6 EQ img4 OR img6 EQ img5">
			<cfset img6=randrange(1,imgMax)>
		</cfloop>
		<cfset currentPage=getFileFromPath(getTemplatePath())>
		<!--- Do not show Google Ads on these pages --->
		<cfif currentPage NEQ "cracktros.cfm" AND currentPage NEQ "download.cfm">
			<div class="GoogleAds">
				<!--- Google Ad --->
				<cfinvoke component="advertising" method="GoogleAdSense">
			</div>
		</cfif>
		<cfoutput>
		<table cellspacing="0" cellpadding="0" class="boxSceneArchives"><tr>
			<td style="background-image:url(#imagesdir#thescenearchive-left.gif);"><div style="text-align:left;"><img src="#imagesdir#cycle/#img1#.gif" alt="Random cracktro capture" width="80" height="50" class="SceneArchivesRandCrack" /></div></td>
			<td style="background-image:url(#imagesdir#thescenearchive-left.gif);"><div style="text-align:center;"><img src="#imagesdir#cycle/#img2#.gif" alt="Random cracktro capture" class="SceneArchivesRandCrack" /></div></td>
			<cfif (CGI.HTTP_USER_AGENT CONTAINS "MSIE" AND NOT CGI.HTTP_USER_AGENT CONTAINS "Opera") OR forceIE IS TRUE>
				<td style="background-image:url(#imagesdir#thescenearchive-left.gif); background-color:##FFFFFF; text-align:right;"><img src="#imagesdir#thescenearchive.gif" alt="The Scene Archives title" style="vertical-align:top;" /></td>
			<cfelseif CGI.HTTP_USER_AGENT CONTAINS "gecko" OR forceIE IS TRUE>
				<td style="background-image:url(#imagesdir#thescenearchive-left.gif); background-color:##FFFFFF; text-align:right;"><div style="padding-top:1px;"><img src="#imagesdir#thescenearchive.gif" alt="The Scene Archives title" /></div></td>
			<cfelse>
				<td style="background-image:url(#imagesdir#thescenearchive-left.gif); background-color:##FFFFFF; text-align:right;"><img src="#imagesdir#thescenearchive.gif" alt="The Scene Archives title" style="vertical-align:middle;" /></td>
			</cfif>
			<td style="background-image:url(#imagesdir#thescenearchive-right.gif); width:60px;">&nbsp;</td>
			<td style="background-image:url(#imagesdir#thescenearchive-right.gif);"><div style="text-align:center;"><img src="#imagesdir#cycle/#img3#.gif" alt="Random cracktro capture" class="SceneArchivesRandCrack" /></div></td>
			<td style="background-image:url(#imagesdir#thescenearchive-right.gif);"><div style="text-align:right;"><img src="#imagesdir#cycle/#img4#.gif" alt="Random cracktro capture" class="SceneArchivesRandCrack" /></div></td></tr>
		</table>
		</cfoutput>
	</cffunction>	
	
	<cffunction name="siteLogo" access="public" returntype="string" hint="Displays the Defacto2 header logo and uses it as a home link">
		<cfargument name="forceIE" type="boolean" required="no" default="no">
		<!--[if IE]>&nbsp;<![endif]-->
		<div id="DF2Logo" style="left:50%; width:1000px; position:absolute; margin-left:-500px;">
		<a href="http://www.defacto2.net/feed.cfm?mode=introduction"><img src="images/Feed_32x32.png" alt="Follow our feeds" title="Follow our feeds" style="border:0px; position:absolute; z-index:500; margin-left:806px; margin-top:21px;" /></a>
		<a href="http://www.new.facebook.com/pages/Defacto2/22346884535"><img src="images/FaceBook_32x32.png" alt="Find us on FaceBook" title="Find us on FaceBook" style="border:0px; position:absolute; z-index:500; margin-left:856px; margin-top:21px;" /></a>
		<a href="http://twitter.com/Defacto2"><img src="images/Twitter_32x32.png" alt="Follow our Tweets" title="Follow our Tweets" style="border:0px; position:absolute; z-index:500; margin-left:896px; margin-top:21px;" /></a>
		<a href="http://www.youtube.com/defacto2"><img src="images/Youtube_32x32.png" alt="Discover our YouTube videos" title="Discover our YouTube videos" style="border:0px; position:absolute; z-index:500; margin-left:936px; margin-top:21px;" /></a>
    <!--- <a href="http://www.new.facebook.com/pages/Defacto2/22346884535"><img src="images/findusonfacebook.jpg" alt="Find us on FaceBook" title="Find us on FaceBook" style="border:0px; position:absolute; z-index:500; margin-left:856px; margin-top:21px;" /></a> --->
    <a href="index.cfm"><img src="images/df21.gif" alt="Defacto2 logo" title="Return to the main page" style="border:0px;" /></a>
    </div><cfif CGI.HTTP_USER_AGENT CONTAINS "KHTML">&nbsp;</cfif>
	</cffunction>
	
</cfcomponent>