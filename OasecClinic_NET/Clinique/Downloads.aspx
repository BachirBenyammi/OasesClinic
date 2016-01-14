<%@ Page language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Téléchargements</title>
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
   					<th align=center colspan="2">Téléchargements</th>
   					<tr>
   						<td align="10"></td>
   						<td>
   						<br>
	   						<table align=center width="80%" border="1" cellpadding="5" cellspacing="0" style="text-align: center">
	   							<tr>
	   								<td>
	   									<a href="downloads/calendrier_dga.zip">
		   									<img src="images/downloads/calendrier_dga.jpg"><br><b>Calendrier 2004</b><br>(396 kb)	
		   								</a>
	   								</td>
	   							</tr>	   						
	   							<tr>
	   								<td>
	   									<a href="downloads/poster_3d.zip">
		   									<img src="images/downloads/poster_3d.jpg"><br><b>Poster</b><br>(550 kb)
		   								</a>	   								
	   								</td>
	   							</tr>
	   							<tr>
	   								<td>
	   									<a href="downloads/carte.zip">
		   									<img src="images/downloads/carte.jpg" width="72" height="45"><br><b>Carte visite</b><br>(18 kb)	
		   								</a>
	   								</td>
	   							</tr>	   							
	   						</table>
					</td></tr>
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