<%@ Page%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Urgences et soins intensifs</title>
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
    				<p><Clinique:Left id="Left" runat="server" /></p>
				</td>
				<td width="480" valign=top>
    				<table width="100%">
    						<th align=left colspan="2"><a href="Presentation.aspx">Présentation</a> > <a href="Departements.aspx">Départements</a> > Urgences et soins intensifs</th>
						<tr>
							<td width=10></td>
							<td>
								<br>
								<p class="Details">		
									<table cellspacing="10">
										<tr>
											<td>
												&nbsp;&nbsp;&nbsp;&nbsp; La clinique mit à votre disposition un service équipé 
												d'un matériel de pointe pour la réanimation et la prise en charge rapide et 
												précise des cas d'urgences avec des appareils modernes de surveillance.<br><br>
												&nbsp;&nbsp;&nbsp;&nbsp; Le service des urgences médicochirurgicales fonctionne 
												en permanence 7/7 et 24h/24																			
											</td>
											<td align=center><img src="images/Urgence.jpg" width="200" height="150" border="1"></td>
										</tr>
										<tr align=center>
											<td><img src="images/Medecin.jpg" width="200" height="250" border="1"></td>	
											<td><b>Dr DABOUZ Yacine, médecin de garde.</b></td>
										</tr>		
										<tr align=center>
											<td><b>Ambulance</b></td>
											<td><img src="images/Ambulance.jpg" width="200" height="150" border="1"></td>	
										</tr>		
										<tr align=center>
											<td><img src="images/Heliport.jpg" width="200" height="150" border="1"></td>										
											<td></a><b>Héliport</b><br>pour les évacuations d’urgence</td>	
										</tr>																																																		
									</table>	
								</p>
								<p class="Details"><a href="Departements.aspx">Départements</a></p>
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