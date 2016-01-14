<%@ Page%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Webmaster</title>
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
   					<th align=center>Webmaster</th>
   					<tr><td>
   						<br>
   						<p align="center">
						<img src="Images/Webmaster.jpg" height="307" width="203"></p>
   						<p class="Details">
   							<table width="80%" align=center>
   								<th>A Gauche</th>
   								<th>A Droit</th>
   								<tr>
   									<td>
   										Mr. BENYAMMI Bachir<br>
   										22 ans<br>
   										Diplôme: D.E.U.A<br>
   										Spécialité: Informatique<br>
   										Option: Système d'information<br>
   										Session: Juin 2004<br>
   										Université de Laghouat AMAR Thlidji Algérie<br>
   										<a href="mailtto:benbac20@hotmail.com">Benbac20@hotmail.com</a><br>
   									</td>
   									<td>
   										Mr. BAKLI Mustapha<br>
   										24 ans<br>
   										Diplôme: D.E.U.A<br>
   										Spécialité: Informatique<br>
   										Option: Système d'information<br>
   										Session: Juin 2004<br>
   										Université de Laghouat AMAR Thlidji Algérie<br>
   										<a href="mailtto:tapho2@hotmail.com">Tapho2@hotmail.com</a><br>
   									</td>   									
   								</tr>  								
   								<tr>
   									<td colspan="2">
   										<br>
   											Nous adressons nos vifs remerciements à tous ce qu'on aider de prêt ou de loin pour 
										réalisé ce Site
   										<br>
   									</td>
   								</tr>
   						</table>
   						</p>
   						<p class="Details">
   							
   						</p>
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