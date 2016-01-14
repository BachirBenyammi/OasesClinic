<%@ Page language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Liens</title>
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
   					<th align=center colspan="2">Liens</th>
   					<tr>
   					<td width=10></td>
   					<td>
   						<br><br>
   						<table width="90%" align=center cellspacing="10">
   							<tr>	   							
   								<td><a href="http://www.sante.dz" target="_blank">Ministère de la Santé</a></td>						
   								<td>FR</td>
   								<td><img src="images/Liens/Sante.jpg" border="1" width="110" height="50"></td>   	   								
   							</tr>
   							
   							<tr>
   								<td><a href="http://fr.dir.yahoo.com/Sante/Medecine/" target="_blank">Yahoo! Médecine</a></td>
   								<td>FR</td>
   								<td><img src="images/Liens/Yahoo.jpg" width="110" height="50" border="1"></td>   								
   							</tr>   
   							 							
   							<tr>
   								<td><a href="http://www.e-sante.fr/" target="_blank">Magazine de la santé</a></td>
   								<td>FR, NL</td>
   								<td><img src="images/Liens/e-sante.jpg" width="110" height="50" border="1"></td>   								
   							</tr> 						   							
   							<tr>
   								<td>
   									<a href="http://www.urgence.com/" target="_blank">Urgence</a>
   								</td>
   								<td>FR</td>
   								<td><img src="images/Liens/Urgence.gif" width="110" height="50" border="1"></td>   								
   							</tr>   	  
   							<tr>
   								<td>
   									<a href="http://www.santemagazine.fr" target="_blank">Santé Magazine - Le Portail</a>
   								</td>
   								<td>FR</td>
   								<td><img src="images/Liens/SanteMagazine.jpg" width="110" height="55" border="1"></td>   								
   							</tr>   
   							<tr>
   								<td>
   									<a href="http://www.sghgsite.com/" target="_blank">Saudi German Hospitals Group</a>
   								</td>
   								<td>EN, AR</td>
   								<td><img src="images/Liens/Sgh.jpg" width="110" height="55" border="1"></td>   								
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