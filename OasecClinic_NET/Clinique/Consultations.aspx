<%@ Page%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Consultations</title>
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
    						<th align=left colspan="2"><a href="Presentation.aspx">Pr�sentation</a> > <a href="Departements.aspx">D�partements</a> > Consultations</th>
						<tr>
							<td width=10></td>
							<td>
								<br>
								<p class="Details">		
									&nbsp;&nbsp;&nbsp;&nbsp; Chaque m�decin sp�cialiste 
									dispose d'un bureau de consultation et d'un salle d'attente.				
									<table cellspacing="10">
										<tr>
											<td>
												<b>Salle de consultation NEURO:</b><br><br>
												&nbsp;&nbsp;&nbsp;&nbsp; La salle de consultation de NEUROLOGIE dispose du mat�riel 
												d�explorations neurologiques: EEG, EMG, POTENTIELS EVOQUES AUDITIF, VISUEL et SOMESTHESIQUE.	
											</td>
											<td align=center><img src="images/Neuro1.jpg" width="200" height="150" border="1"></td>
										</tr>
										<tr align=center>
											<td><img src="images/Neuro2.jpg" width="200" height="150" border="1"></td>	
											<td><img src="images/Neuro3.jpg" width="200" height="150" border="1"></td>
										</tr>	
										<tr>
											<td>
												<b>Salle de consultation ORL:</b><br><br>
												&nbsp;&nbsp;&nbsp;&nbsp; Fauteuil de consultation O.R.L avec Microscope et explorations: 
													AUDIOM&Eacute;TRIE, IMPEDANCEMETRIE, VIDEONYSTAGMOGRAPHIE, POTENTIEL EVOQUE AUDITIF, ECHO des SINUS, 
												NASOFIBROSCOPE avec camera.
											</td>
											<td align=center><img src="images/Orl.jpg" width="200" height="150" border="1"></td>
										</tr>										
										<tr>
											<td colspan="2">
												<b>Salle d'attente:</b><br><br>
												&nbsp;&nbsp;&nbsp;&nbsp; Les salles d�attente sont a�r�es, spacieuses et sont �quip�es 
												d�un moniteur de t�l�vision avec plusieurs cha�nes et de l�air conditionn� �t� � hiver 
											</td>
										</tr>
										<tr align=center>
											<td><img src="images/Attente1.jpg" width="200" height="150" border="1"></td>
											<td><img src="images/Attente2.jpg" width="200" height="150" border="1"></td>
										</tr>																			
									</table>	
								</p>
								<p class="Details"><a href="Departements.aspx">D�partements</a></p>
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