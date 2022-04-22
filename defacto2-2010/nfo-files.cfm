<!--- 
File: 		nfo-files.cfm
Version: 	2.0
Author: 	Ben Garrett
Date: 		4 July 2003
			19 Jun 2006 : New code
Displays NFO related files that the user can download including NFO packs, viewers, etc
okay 1
 --->
<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;avw-610.zip;230;local;ACiD View 6.1;" returnvariable="file1">
<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;DAMN_NFO_Viewer_v2.10.exe;240;local;Damn NFO Viewer" returnvariable="file2">
<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;NfoArtScreenSaver.zip;5200;local;NFO Screen Saver" returnvariable="file3">
<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;dizzy.zip;7;local;DIZzy 1.11" returnvariable="file4">
<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;getdiz30.exe;453;local;Get Diz 3.0" returnvariable="file5">
<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;nfo01.exe;577;local;Cool Beans NFO Creator 2" returnvariable="file6">
<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;QuickNFO.zip;330;local;QuickNFO version 0.77" returnvariable="file7">
<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;FNW-NFO_Builder2000.zip;125;local;NFO Builder 2000 1.02" returnvariable="file8">
<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;TMG-nfomaker10.zip;218;local;NFOmakeR v1.0" returnvariable="file9">
<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;nfopad10.exe;359;local;NFO Pad 1.0" returnvariable="file10">
<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;PabloView-092.zip;378;local;PabloView 0.92" returnvariable="file11">
<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;PabloDraw-20870.zip;532;local;PabloDraw 2.08.70" returnvariable="file12">
<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;NFOlux11.zip;2300;local;NFOlux 1.1" returnvariable="file13">
<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;jave5.zip;1540;local;JavE (Java Ascii Versatile Editor)" returnvariable="file14">
<cfinvoke component="cfcs.utilities" method="urlEncryption" mode="encrypt" string="downloads;iNFekt-v0.5.0-setup.exe;1105;local;iNFekt NFO Viewer;" returnvariable="file15">

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
	<title>Defacto2 - NFO Utilities</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td><cfinvoke component="cfcs.logos" method="sceneArchive">
				<div class="menuNavigation"><a href="index.cfm">The Scene Archive</a> \ <a href="documents.cfm">NFO files</a> \ NFO utilities<span style="text-decoration:blink;">_</span></div>
        <div style="margin:10px; text-align:center;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="nfofiles"></div>
        		<!--- iNFekt (2/april/2010) ::TODO::  --->
				<table cellpadding="0" cellspacing="0" class="boxNFOfiles01"><tr><td>
					<h1 class="nfoFilesHeader"><a href="download.cfm?#file15#" title="Download iNFekt">iNFekt NFO Viewer 0.5</a></h1>
					<span class="italic"></span><br />
					<div class="boxNFOfiles04">Last revised on 23rd March 2010 - Compressed at 1,105kb</div></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image151.png" alt="TDU-Jam Nfo" /></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image152.png" alt="TRSi Nfo" class="boxNFOfiles02" /></td>
				</tr></table>
				<!--- ACiD View --->
				<table cellpadding="0" cellspacing="0" class="boxNFOfiles01"><tr><td>
					<h1 class="nfoFilesHeader"><a href="download.cfm?#file1#" title="Download ACiD View">ACiD View 6.1</a></h1>
					<span class="italic">Supported graphical image formats include GIF, JPEG, BMP, and PNG, as well as formats from the days of dial-up BBSing such as ANSI, ASCII and XBIN. Highlights include the ability to slow down an ANSI animation to emulate a desired modem connection, VGA modes, a built in Amiga Topaz font for Amiga ASCII, smooth scrolling, full screen mode, and more.</span><br />
					<div class="boxNFOfiles04">Last revised on 15th October 2003 - Compressed at 230kb</div></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image9.gif" alt="TDU-Jam Nfo" /></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image10.gif" alt="TRSi Nfo" class="boxNFOfiles02" /></td>
				</tr></table>
				<!--- Damn NFO Viewer --->
				<table cellpadding="0" cellspacing="0" class="boxNFOfiles01"><tr><td>
					<h1 class="nfoFilesHeader"><a href="download.cfm?#file2#" title="Download Damn NFO Viewer">Damn NFO Viewer</a></h1>
					<span class="italic">DAMN NFO Viewer is an utility for viewing text files containing ASCII Art (e.g. nfo files), and it proved itself to be handy =) So... if you're fed up with starting some DOS-like file manager each time you need to view nfo file, or ain't too happy with the viewer you use, or (worst case) use Notepad - give this little tool a try.</span><br />
					<div class="boxNFOfiles04">Last revised on 17th April 2003 - Compressed at 240kb</div></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image001.gif" alt="Screenshot" class="boxNFOfiles02" /> </td>
				</tr></table>
				<!--- NFOlux --->
				<table cellpadding="0" cellspacing="0" class="boxNFOfiles01"><tr><td>
					<h1 class="nfoFilesHeader"><a href="download.cfm?#file13#" title="Download NFOlux">NFOlux 1.1</a></h1>
					<span class="italic">NFOlux is a small application that will allow you to create as well as view NFO files. I have seen many NFO viewers but I have never seen one that will do both. [<a href="http://www.nfolux.com">web site</a>]</span><br />
					<div class="boxNFOfiles04">Last revised on November 2006 - Compressed at 2300kb</div></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image103.png" alt="Screenshot" class="boxNFOfiles02" /> </td>
				</tr></table>
				<!--- PabloView --->
				<table cellpadding="0" cellspacing="0" class="boxNFOfiles01"><tr><td>
					<h1 class="nfoFilesHeader"><a href="download.cfm?#file11#" title="Download PabloView">PabloView 0.9</a></h1>
					<span class="italic">PabloView is the result of many, MANY endless hours of work (mainly due to RIP support!!) It is the *ULTIMATE* scene viewing program, since it supports so many different formats, the ability to view Ansi just like in DOS (aspect wise & 9 pixel wide fonts), and it is very easy to use!</span><br />
					<div class="boxNFOfiles04">Last revised on 29th December 2003 - Compressed at 378kb</div></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image101.png" alt="Screenshot" class="boxNFOfiles02" /> </td>
				</tr></table>
				<!--- NFO Screen Saver --->
				<table cellpadding="0" cellspacing="0" class="boxNFOfiles01"><tr><td>
					<h1 class="nfoFilesHeader"><a href="download.cfm?#file3#" title="Download NFO Screen Saver">NFO Screen Saver</a></h1>
					<span class="italic">Have classic NFO files used as as a scene saver. Show your work mates how really cool and oldskool you are.</span><br />
					<div class="boxNFOfiles04">Compressed at 5.2megs</div><br /></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image3.gif" alt="TDU-Jam Nfo" class="boxNFOfiles02" /></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image4.gif" alt="TRSi Nfo" class="boxNFOfiles02" /></td>
				</tr></table>
        <div style="margin:10px; text-align:center;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="nfofiles"></div>
				<!--- DIZzy --->
				<table cellpadding="0" cellspacing="0" class="boxNFOfiles01"><tr><td>
					<h1 class="nfoFilesHeader"><a href="download.cfm?#file4#" title="Download DiZzy">DIZzy 1.12</a></h1>
					<span class="italic">DIZzy displays DIZ, NFO and other confusing, ASCII-extended text files in a pleasing graphic format. It supports drag-and-drop, file associations and command line. DIZzy is an amazingly small, self-contained, flexible and free program.</span><br />
					<div class="boxNFOfiles04">Last revised on 2006 - Compressed at 8kb</div></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image003.gif" alt="Screenshot" class="boxNFOfiles02" /></td>
				</tr></table>
				<!--- Get Diz --->
				<table cellpadding="0" cellspacing="0" class="boxNFOfiles01"><tr><td>
					<h1 class="nfoFilesHeader"><a href="download.cfm?#file5#" title="Download Get Diz">Get Diz 3.0</a></h1>
					<span class="italic">Many downloadable ZIP archives have DIZ and NFO files included within them. Sure, they're simple text files that can be viewed with Notepad, but GetDiz is a freeware text-viewer especially designed for those files. ASCII art is displayed correctly and the user interface is small, handy and specific. Version 3 includes several new features like Print support, URL launch, Find/Replace, Trim copy and Keyword highlights.</span><br />
					<div class="boxNFOfiles04">Last revised on 22nd February 2004 - Compressed at 453kb</div></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image006.gif" alt="Screenshot" class="boxNFOfiles02" /></td>
				</tr></table>
				<!--- PabloDraw --->
				<table cellpadding="0" cellspacing="0" class="boxNFOfiles01"><tr><td>
					<h1 class="nfoFilesHeader"><a href="download.cfm?#file12#" title="Download PabloDraw">PabloDraw 2.0.8</a></h1>
					<span class="italic">An open-source multi-user ansi/ascii editor for windows.</span><br />
					<div class="boxNFOfiles04">Last revised on 4th July 2004 - Compressed at 532kb</div></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image102.png" alt="Screenshot" class="boxNFOfiles02" /> </td>
				</tr></table>
				<!--- Cool Beans NFO Creator --->
				<table cellpadding="0" cellspacing="0" class="boxNFOfiles01"><tr><td>
					<h1 class="nfoFilesHeader"><a href="download.cfm?#file6#" title="Download Cool Beans">Cool Beans NFO Creator 2</a></h1>
					<span class="italic">Great for personal archival use and for posting binaries to USENET, Cool Beans NFO Creator is a small program that generates detailed .nfo text files based on nearly fifty user-input fields.</span><br />
					<div class="boxNFOfiles04"> Last revised on 27th September 2001 - Compressed at 577kb</div></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image005.gif" alt="Screenshot" class="boxNFOfiles02" /></td>
				</tr></table>
				<!--- JavE --->
				<table cellpadding="0" cellspacing="0" class="boxNFOfiles01"><tr><td>
					<h1 class="nfoFilesHeader"><a href="download.cfm?#file14#" title="Download NFOmakeR">JavE (Java Ascii Versatile Editor)</a></h1>
					<span class="italic">This is an Java based ascii editor which works on a variety of operating systems.</span><br />
					<div class="boxNFOfiles04">Last revised on October 2001 - Compressed at 1520KB<br /></div></td>
				</tr></table>
        <div style="margin:10px; text-align:center;"><cfinvoke component="cfcs.advertising" method="GoogleAdSense" type="nfofiles"></div>
				<!--- QuickNFO --->
				<table cellpadding="0" cellspacing="0" class="boxNFOfiles01"><tr><td>
					<h1 class="nfoFilesHeader"><a href="download.cfm?#file7#" title="Download QuickNFO">QuickNFO version 0.77</a></h1>
					<span class="italic">The most fully featured NFO reader / SFV checker available!</span><br />
					<div class="boxNFOfiles04">Last revised on 22nd February 2003 - Compressed at 330kb</div></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image002.gif" alt="Screenshot" class="boxNFOfiles02" /></td>
				</tr></table>
				<!--- NFO Builder 2000 --->
				<table cellpadding="0" cellspacing="0" class="boxNFOfiles01"><tr><td>
					<h1 class="nfoFilesHeader"><a href="download.cfm?#file8#" title="Download NFO Builder">NFO Builder 2000 1.02</a></h1>
					<span class="italic">This program is designed for everybody, who wants to make some ASCII or ANSI art. This includes all these NFO's delivered by cracking groups. Our intention to writ this prog was the problem to design some good NFO for our cracks with tools like the Windows Editor or NFODiz. It was almost impossible to make some creative images or to try out some ideas. The solution to this problem is in front of you!</span>
					<div class="boxNFOfiles04">Last revised on 21st September 2000 Compressed at 125KB</div></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image7.gif" alt="TDU-Jam Nfo" class="boxNFOfiles02" /></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image8.gif" alt="TRSi Nfo" class="boxNFOfiles02" /></td>
				</tr></table>
				<!--- NFOmaker --->
				<table cellpadding="0" cellspacing="0" class="boxNFOfiles01"><tr><td>
					<h1 class="nfoFilesHeader"><a href="download.cfm?#file9#" title="Download NFOmakeR">NFOmakeR v1.0</a></h1>
					<span class="italic">This crap has only been coded because I was bored to death and wanted to try out Delphi. So don't annoy me with fucking bug-reports or something like that. The proggy is bug-free anyway.</span><br />
					<div class="boxNFOfiles04">Last revised on 13th April 2000 - Compressed at 218KB<br /></div></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image5.gif" alt="TDU-Jam Nfo" class="boxNFOfiles02" /></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image6.gif" alt="TRSi Nfo" class="boxNFOfiles02" /></td>
				</tr></table>
				<!--- NFO Pad --->
				<table cellpadding="0" cellspacing="0" class="boxNFOfiles01"><tr><td>
					<h1 class="nfoFilesHeader"><a href="download.cfm?#file10#" title="Download NFO Pad">NFO Pad 1.0</a></h1>
					<span class="italic">NFOpad is a small but flexible nfo-viewer. I know it's a lot of nfo-viewers out there but I don't like any of them, so here's NFOpad. It's more or less a copy of Notepad, but with some extra settings. You can open nfo files (and text documents) and they wil be shown with the appropriate ANSI font. Very handy.</span><br />
					<div class="boxNFOfiles04">Last revised on 8th March 2004 - Compressed at 359kb</div></td>
					<td class="boxNFOfiles03"><img src="images/nfo-files/nfo-image004.gif" alt="Screenshot" class="boxNFOfiles02" /></td>
				</tr></table>
			</td></tr></table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>