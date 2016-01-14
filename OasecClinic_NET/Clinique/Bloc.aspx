<%@ Page%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Bloc opératoire</title>
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
    						<th align=left colspan="2"><a href="Presentation.aspx">Présentation</a> > <a href="Departements.aspx">Départements</a> > Bloc opératoire</th>
						<tr>
							<td width=10></td>
							<td>
								<br>
								<p class="Details">		
									<table cellspacing="10">
										<tr>
											<td>								
													&nbsp;&nbsp;&nbsp;&nbsp; Quatre salles opératoires plus une salle du bloc septique, spacieuses, elles sont 
												équipées du matériel d’anesthésie réanimation le plus performant, conçues selon 
												les normes internationales
											</td>
											<td align=center><img src="images/Bloc1.jpg" width="200" height="150" border="1"></td>
										</tr>
										<tr>
											<td align=center><img src="images/Bloc2.jpg" width="200" height="150" border="1"></td>
											<td>
												&nbsp;&nbsp;&nbsp;&nbsp; Toutes les salles opératoires sont équipées d’un matériel 
												sophistiqué et de caméras qui sont branchées à un système de  retransmission en direct 
												dans la salle de conférences
											</td>
										</tr>											
										<tr align=center>
											<td><img src="images/Bloc3.jpg" width="200" height="150" border="1"></td>	
											<td><img src="images/Bloc4.jpg" width="200" height="150" border="1"></td>
										</tr>																																																	
									</table>	
									&nbsp;&nbsp;&nbsp;&nbsp; <a href="Salles.aspx#Coelio">Salle de Coeliochirurgie</a><br>
									&nbsp;&nbsp;&nbsp;&nbsp; <a href="Salles.aspx#Orthop">Salle d’Orthopédie</a><br>
									&nbsp;&nbsp;&nbsp;&nbsp; <a href="Salles.aspx#Arthro">Salle d’Arthroscopie</a><br>
									&nbsp;&nbsp;&nbsp;&nbsp; <a href="Salles.aspx#Valvul">Salle de Chirurgie cardiaque valvulaire</a><br>
									&nbsp;&nbsp;&nbsp;&nbsp; <a href="Salles.aspx#Reveil">Salle de Réveil sous monitoring</a><br>
									&nbsp;&nbsp;&nbsp;&nbsp; <a href="Salles.aspx#Reanim">Salle de Réanimation</a><br>
									&nbsp;&nbsp;&nbsp;&nbsp; <a href="Salles.aspx#Dechoquage">Salle de Déchoquage</a><br>
									&nbsp;&nbsp;&nbsp;&nbsp; <a href="Salles.aspx#Septique">Bloc Septique</a><br>
									<br>
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