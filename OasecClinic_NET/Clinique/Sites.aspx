<%@ Page language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Sites Web</title>
		<script language="Javascript" src="script/js.js"></script>
		<link type=text/css href="css/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
<form runat="server">
	<Clinique:Menu id="Menu" runat="server" />  
   	<Clinique:Top id="top" runat="server" />
   	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
		<tr>
   			<td width="140" valign=top>
   				<Clinique:Left id="Left" runat=server />
			</td>
			<td width="480" valign=top>
   				<table width="100%">
   					<th align=center colspan="2">Sites Web</th>
   					<tr>
   					<td width=10></td>
   					<td>
   						<br><br>
   						<table width="90%" align=center cellspacing="10">
   							<tr>	   							
   								<td><a href="http://www.mzab.online.fr" target="_blank">Photos de GHARDA&Iuml;A sur MZAB PHOTOS</a></td>						
   								<td>EN, FR, AR</td>
   								<td><img src="images/Sites/MzabPhotos.jpg" border="1" width="110" height="50"></td>   	   								
   							</tr>
   							<tr>
   								<td><a href="http://www.mzab-online.com" target="_blank">Infos sur GHARDA&Iuml;A sur Mzab Online</a></td>
   								<td>FR, AR</td>
   								<td><img src="images/Sites/MzabOnline.gif" width="110" height="50" border="1"></td>   								
   							</tr> 						   							
   							<tr>
   								<td>
   									<a href="http://www.islamicfinder.org/prayerDetail.php?country=algeria&city=Ghardaia&id=28159&email=&home=2004-8-23&lang=arabic&aversion=&athan=" target="_blank">Temps des prières de 	GHARDA&Iuml;A sur ISLAMIC FINDER</a>
   								</td>
   								<td>AR</td>
   								<td><img src="images/Sites/Islamic.jpg" width="110" height="50" border="1"></td>   								
   							</tr>   	  
   							<tr>
   								<td>
   									<a href="http://www.tv5.org/TV5Site/meteo/meteo-ville-4-1308.htm" target="_blank">Météo de 	GHARDA&Iuml;A sur TV5.org</a>
   								</td>
   								<td>FR</td>
   								<td><img src="images/Sites/TV5.jpg" width="110" height="55" border="1"></td>   								
   							</tr>  
   							<tr>
   								<td>
   									<a href="http://www.islamonline.net/calculator/arabic/hijrigregoriancalculator.asp" target="_blank">Conversion Hijri sur ISLAM ONLINE</a>
   								</td>
   								<td>AR</td>
   								<td><img src="images/Sites/IslamOnline.jpg" width="110" height="55" border="1"></td>   								
   							</tr>     							 							  													   							
   							<tr>
   								<td>
   									<a href="http://www.airalgerie.dz" target="_blank">Air Algérie</a>
   								</td>
   								<td>FR</td>
   								<td><img src="images/Sites/Air.jpg" width="110" height="55" border="1"></td>   								
   							</tr>      							
   						</table>
					</td>
					</tr>
   				</table>
			</td>
			<td width="140" valign=top>
				<Clinique:Right id="Right" runat="server" />
   			</td>
   		</tr>
   	</table>
   	<Clinique:CopyRight id="CopyRight" runat=server />
</form>
</body>
</html>