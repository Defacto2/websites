<!--- 
File: help.cfm
Version: 1
Author: Ben Garrett
Date: 26 June 2006

Includes a DOS application tutorial, site information and a 'what is defacto2?' sections
--->

<cfparam name="url.mode" default="dos">

<cfoutput>
<!--- Page timer initialisation --->
<cfinvoke component="cfcs.utilities" method="pageTimer" mode="start" returnvariable="pageTimerST">
<!--- HTML code --->
<cfinvoke component="cfcs.meta" method="docType">
<head>
	<!--- Document title --->
		<title>Defacto2 - 
			<cfif url.mode EQ "dos">Help for Running DOS Applications
			<cfelseif url.mode EQ "error">Deciphering Application Errors</cfif>
		</title>
	<cfinvoke component="cfcs.meta" method="head">
</head>
<body id="DF2Body">
	<cfinvoke component="cfcs.logos" method="siteLogo">
	<table cellpadding="0" cellspacing="0" class="box01">
		<tr><td>
		<table cellpadding="0" cellspacing="0" class="box02">
			<tr><td>
			<cfif url.mode EQ "dos">
			<cfinvoke component="cfcs.logos" method="sceneArchive"></td></tr>
			<tr><td>
				<div class="menuNavigation"><a href="index.cfm">The Scene Archive</a> \ Help for Running DOS Applications<span style="text-decoration:blink;">_</span></div>
				<div class="left">DOS (Disk Operating System) is the name given to the original type of operating systems used on early 16-bit PC computers.
				Similar to how the term Windows is used today to describe the modern based Microsoft operating systems.
				All 32-bit Intel and AMD CPU's sold even nowadays are still backwardly compatible with this base.
				If you were able to find an old floppy drive for your current PC you could probably <a href="http://oldfiles.org.uk/powerload/bootdisk.htm">boot your PC</a> into one of these arcane operating systems.
				<p></p>
				<img src="images/help/msdos.gif" alt="MSDOS logo" style="float:left; padding-right:5px;" />
				DOS based operating systems came in a number of different variants which were released by different companies.
				But the most well known DOS and the benchmark for what most software companies would target development towards was <a href="http://en.wikipedia.org/wiki/MS-DOS">Microsoft's MS-DOS</a>.
				<p></p>
				Interesting enough DOS itself was originally a quick clone of an earlier popular 8bit operating system known as <a href="http://www.dcast.vbox.co.uk/cpm_over.html">CP/M</a> that was first released by Digital Research back in 1974.
				A small company known as Seattle Computer Products created the original DOS, known as <a href="http://en.wikipedia.org/wiki/QDOS">Q-DOS</a> in 1980.
				Q-DOS had similar (though not as extensive) commands to CP/M but used Microsoft's QBasic FAT file system.
				<p></p>
				Microsoft had a contract with IBM to supply the operating system for their new and then secret project, the IBM PC.
				So Microsoft bought a non-exclusive licence to market Q-DOS and hired it's author to port it to the 8088 CPU that IBM were planning to use.
				This version of DOS was known as 86-DOS.
				In April 1981 Microsoft bought all the rights to DOS and changed it's name to MS-DOS.
				IBM then released the first public version of DOS, PC-DOS 1.0 that was used with it's first personal computer, the <a href="http://www.old-computers.com/museum/computer.asp?c=274">IBM 5150 PC</a>.
				<p></p>
				DOS was the defacto operating system for all PC's up until 1995, when the popularization of Microsoft's <a href="http://en.wikipedia.org/wiki/Windows_95">Windows 95</a> eventuated.
				And even then, this and subsequent versions of Windows including 98 and ME all used DOS as their underline base.
				This is important to know because many applications coded by scene's up until the popularization of Windows XP (ie 2001) were programmed to run under DOS.
				<p></p>
				Unfortunately due to it's ancient legacy DOS does things very differently to modern processors and it can be extremely difficult to successfully get DOS applications to run on modern operating systems.
				DOS never had an application programming interface like Direct X for Windows.
				So software developers had to write their own drivers for any external hardware including sound cards, graphic cards and even mice and joysticks.
				<p></p>
				Because there were no uniformed system of communicating with the hardware, different software accessed the hardware in different ways depending on the developer.
				Often software developers would prefer to access the hardware directly because it was quicker and more efficient.
				But this creates problems with modern Windows (2000, XP, Vista) which don't operate with DOS anymore, and instead emulate it using shell commands.
				As modern Windows do not allow the hardware to be access directly. It is a security risk and can cause stability issues with badly programmed applications.
				So this can lead to problems with many DOS applications which are expecting full hardware access, causing them to run with limited capability or at worst crash abruptly before it has even loaded.
				<p></p>
				With this in mind we have created this help page to guide you through some solutions in a bid to get those old DOS applications working on your modern Windows machine.
				</div>
				<div class="left" style="padding-top:10px;">
				DOSBox is a multi-platform DOS-emulator that is designed to run DOS games on modern operating systems.
				It has been ported to numerous OSes including Linux, Mac OS and works like a charm in Windows.
				By emulating the CPU it offers both 286 real mode and 386 protect mode as well as XMS/EMS memory configurations.
				This gives it great compatibility with older games as well as many old DOS scene productions.
				It also supports Tandy/Hercules/CGA/EGA/VGA/VESA graphic modes as well as both the Sound Blaster and Gravis Ultra Sound range of sound cards.
				<p></p>
				In our opinion DOSBox is the best way to run older DOS based scene productions on a modern computer.
				<p style="text-align:center;"><img src="images/help/dosbox.png" alt="DOSBox capture" /></p>
				<ul style="list-style-type:square;">
					<li><a href="http://dosbox.sourceforge.net/">DOSBox official homepage</a></li>
					<li><a href="http://vogons.zetafleet.com/index.php?c=7">DOSBox forums</a></li>
					<li><a href="http://vogons.zetafleet.com/index.php?c=7">DOSBox wiki</a></li>
					<li><a href="http://www.abandonia.com/main.php?nav=index&amp;FAQ=1">DOSBox tutorial</a></li>
				</ul>
				</div>
				</td></tr>
			<cfelseif url.mode EQ "error">
				<cfinvoke component="cfcs.logos" method="sceneArchive"></td></tr>
				<tr><td>
				<div class="menuNavigation"><a href="index.cfm">The Scene Archive</a> \ Deciphering Application Errors<span style="text-decoration:blink;">_</span></div>
				<div class="left">
				Sometimes after you run a newly downloaded program it decides to crash while leaving you with only a cryptic error message to work with.
				So we have compiled a list of common error messages we have encountered while testing the many scene productions hosted on the site.
				And then we have provided solutions or work arounds to get these applications working.
				        <p class="helpHeading">Shinker.err Dispatcher initialization error</p>
				<p><img src="images/help/shrinker-error.png" alt="Shrinker error" /></p>
				This is a common error that occurs with Windows 95/98/ME applications that are compressed with earlier versions of the Shinker compression program.
				Fortunately there is an easy solution.
				You just need to decompress the application using either <a href="http://www.defacto2.net/includes/downloads/dshrnk16.zip">DeShrink 1.6</a> or <a href="http://www.defacto2.net/includes/downloads/shrunp.zip">UnShrinker</a>.
				DeShrink is a standard Windows application while UnShrinker uses the command prompt.
				<p class="helpHeading">Request for 'NPMOD32.DLL'</p>
				NPMOD32.DLL is a Windows development library file designed to play older <a href="http://www.modarchive.com/">module music files</a> which used to be popular in the demo and music scenes.
				Sometimes coders would simply forget to include this file while packaging their application.
				<p></p>
				Fortunately we have a copy of the <a href="http://www.defacto2.net/includes/downloads/NPMOD32.DLL">NPMOD32.DLL</a> for download. To use simply copy the DLL file into the same directory as the application requesting it.
				<p class="helpHeading">'Runtime error 200 at ...' error message</p>
				<p><img src="images/help/200.png" alt="Runtime error 200" class="helpCapture" /></p>
				A runtime error 200 message usually occurs with old DOS applications written in <a href="http://en.wikipedia.org/wiki/Turbo_Pascal">Turbo Pascal</a>.
				Turbo Pascal had a timing bug that would cause it's complied programs to crash when they were running on machines running at 200Mhz or faster.
				It is known as the CRT issue and can be fixed by applying a patch to the effected application.
				Otherwise you can run the application in <a href="http://server/defacto2/help.cfm?mode=dos">DOSBox</a>, which will artificially slow down the speed of the emulated DOS session.
				</div>
				<div class="left" style="padding-top:10px;">
				If you wish to patch the application we have created a guide to help you through it.
				Though this is only recommended for people experienced with DOS or the Windows command prompt.
				<p></p>
				First download <a href="http://www.defacto2.net/includes/downloads/TurboPascal-Unpack.zip">UNP 4.11</a> which is a Turbo Pascal decompression program and then download <a href="http://www.defacto2.net/includes/downloads/ctrfix16.zip">CTRFix 1.16</a> which as it's name says is a CTR bug patching program.
				Create a temporary directory and then unzip both downloaded packages into it.
				<p class="center"><img src="images/help/200-1.png" alt="Temporary directory capture" class="helpCapture" /></p>
				Copy the application effected by the CRT issue into the temporary directory.
				In our example we are going to patch DEFACTO.EXE which belongs to the early <a href="magazines.cfm?title=Defacto">Defacto</a> magazines that we once released.<br />
				Now run the UNP program to decompress the application.
				<p class="center"><img src="images/help/200-2.png" alt="Temporary directory capture" class="helpCapture" /></p>
				Once the decompression is complete, run the CTRFIX program to patch the application.
				<p class="center"><img src="images/help/200-3.png" alt="Temporary directory capture" class="helpCapture" /></p>
				That is all there is to it.
				</div>
				</td></tr>
			</cfif>
			</table>
		</td></tr>
	</table>
	<cfinvoke component="cfcs.utilities" method="pageTimer" mode="#pageTimerST#" returnvariable="pageTimerDisplay">
	<cfinvoke component="cfcs.meta" method="foot" pageTimer="#pageTimerDisplay#">
</body>
</html>
</cfoutput>