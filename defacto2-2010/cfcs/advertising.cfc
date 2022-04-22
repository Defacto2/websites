<cfcomponent>
	
	<cffunction name="AmazonOmakase" access="public" returntype="string" hint="Amazon Omakase adverts">
		<cfargument name="type" type="string" required="no" default="border">
		<cfif type EQ "border">
			<script type="text/javascript"><!--
			  amazon_ad_tag = "defacto2";  amazon_ad_width = "728";  amazon_ad_height = "90";  amazon_ad_logo = "hide";  amazon_ad_link_target = "new";//--></script>
			<script type="text/javascript" src="http://www.assoc-amazon.com/s/ads.js"></script>
		<cfelseif type EQ "noborder">
			<script type="text/javascript"><!--
			  amazon_ad_tag = "defacto2";  amazon_ad_width = "728";  amazon_ad_height = "90";  amazon_ad_logo = "hide";  amazon_ad_link_target = "new";  amazon_ad_border = "hide";//--></script>
			<script type="text/javascript" src="http://www.assoc-amazon.com/s/ads.js"></script>
		<cfelseif type EQ "mediumsquare">
			<script type="text/javascript"><!--
			  amazon_ad_tag = "defacto2";  amazon_ad_width = "300";  amazon_ad_height = "250";  amazon_color_border = "CCCCCC";  amazon_color_logo = "000000"; amazon_ad_logo = "hide";  amazon_ad_link_target = "new";//--></script>
			<script type="text/javascript" src="http://www.assoc-amazon.com/s/ads.js"></script>
		<cfelseif type EQ "longwide">
			<script type="text/javascript"><!--
			  amazon_ad_tag = "defacto2";  amazon_ad_width = "160";  amazon_ad_height = "600";  amazon_color_border = "CCCCCC";  amazon_color_logo = "000000"; amazon_ad_logo = "hide";  amazon_ad_link_target = "new";//--></script>
			<script type="text/javascript" src="http://www.assoc-amazon.com/s/ads.js"></script>
		</cfif>
	</cffunction>

	<cffunction name="GoogleAdSense" access="public" returntype="string" hint="Displays various Google AdSense adverts">
		<cfargument name="type" type="string" required="true" default="horizontal">
		<cfargument name="color" type="string" default="" required="false">
		<cfif type EQ "horizontal" AND color EQ "pink">
			<script type="text/javascript"><!--
				google_ad_client = "pub-REMOVED";
				google_ad_width = 728;
				google_ad_height = 90;
				google_ad_slot = "4928912474";
				google_color_border = "DDAAAA";
				google_color_bg = "ECF8FF";
				google_color_link = "0033FF";
				google_color_url = "0033FF";
				google_color_text = "000000";
				//--></script>
			<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
		<cfelseif type EQ "horizontal" AND color EQ "sceneshop">			
			<script type="text/javascript"><!--
				google_ad_client = "pub-REMOVED";
				google_ad_width = 728;
				google_ad_height = 90;
				google_ad_slot = "4928912474";
				google_color_border = "E7E4D0";
				google_color_bg = "ECF8FF";
				google_color_link = "0033FF";
				google_color_url = "0033FF";
				google_color_text = "000000";
				//--></script>
			<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
		<cfelseif type EQ "square-upper">
			<script type="text/javascript"><!--
				google_ad_client = "pub-REMOVED";
				google_ad_width = 200;
				google_ad_height = 200;
				google_ad_slot = "5657443088";
			//--></script>
			<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
		<cfelseif type EQ "square-lower">
			<script type="text/javascript"><!--
				google_ad_client = "pub-REMOVED";
				google_ad_width = 200;
				google_ad_height = 200;
				google_ad_slot = "0367088941";
			//--></script>
			<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js"></script>
		<cfelseif type EQ "portal-top">
			<script type="text/javascript"><!--
				google_ad_client = "pub-REMOVED";
				google_ad_slot = "1641694882";
				google_ad_width = 300;
				google_ad_height = 250;
				//-->
				</script>
				<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      </script>
		<cfelseif type EQ "portal-middle">
			<script type="text/javascript"><!--
				google_ad_client = "pub-REMOVED";
				google_ad_slot = "9861144909";
				google_ad_width = 728;
				google_ad_height = 90;
				//-->
				</script>
				<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      </script>
		<cfelseif type EQ "group-detail">
			<script type="text/javascript"><!--
				google_ad_client = "pub-REMOVED";
				google_ad_slot = "9716958722";
				google_ad_width = 728;
				google_ad_height = 90;
				//-->
				</script>
				<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      </script>
		<cfelseif type EQ "download">
			<script type="text/javascript"><!--
				google_ad_client = "pub-REMOVED";
				google_ad_slot = "6020257171";
				google_ad_width = 336;
				google_ad_height = 280;
				//-->
				</script>
				<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      </script>
		<cfelseif type EQ "magazines">
			<script type="text/javascript"><!--
				google_ad_client = "pub-REMOVED";
				google_ad_slot = "9619022672";
				google_ad_width = 728;
				google_ad_height = 90;
				//-->
				</script>
				<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      </script>
		<cfelseif type EQ "documents">
			<script type="text/javascript"><!--
				google_ad_client = "pub-REMOVED";
				google_ad_slot = "1933624064";
				google_ad_width = 728;
				google_ad_height = 90;
				//-->
				</script>
				<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      </script>
		<cfelseif type EQ "cracktros">
			<script type="text/javascript"><!--
				google_ad_client = "pub-REMOVED";
				google_ad_slot = "3913984826";
				google_ad_width = 468;
				google_ad_height = 60;
				//-->
				</script>
				<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      </script>
		<cfelseif type EQ "nfofiles">
			<script type="text/javascript"><!--
				google_ad_client = "pub-REMOVED";
				google_ad_slot = "5520534326";
				google_ad_width = 468;
				google_ad_height = 60;
				//-->
				</script>
				<script type="text/javascript" src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      </script>
		</cfif>
	</cffunction>
</cfcomponent>