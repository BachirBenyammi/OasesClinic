<%@ Page%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Salles</title>
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
    						<th align=left colspan="2"><a href="Presentation.aspx">Pr�sentation</a> > <a href="Departements.aspx">D�partements</a> > <a href="Bloc.aspx">Bloc op�ratoire</a> > Salles</th>
						<tr>
							<td width=10></td>
							<td>
								<br>
								<p class="Details">		
									<table cellspacing="10">
										<tr>
											<td>								
												<a name="Coelio"></a><b>Salle de Coeliochirurgie</b><br><br>
													&nbsp;&nbsp;&nbsp;&nbsp; Chirurgie coelioscopique abdominale (visc�rale) et pelvienne (gyn�cologie) 
											</td>
											<td align=center><img src="images/Coelio.jpg" width="200" height="150" border="1"></td>
										</tr>			
										<tr>
											<td align=center><img src="images/Orthop.jpg" width="200" height="150" border="1"></td>
											<td>								
												<a name="Orthop"></a><b>Salle d�Orthop�die</b><br><br>
													&nbsp;&nbsp;&nbsp;&nbsp; La salle d�orthop�die situ�e en zone hyper propre, permet la mise en 
												place de mat�riel proth�tique : proth�ses totales de hanche et de genou 
											</td>		
										</tr>			
										<tr>
											<td>								
												<a name="Arthro"></a><b>Salle d�Arthroscopie</b><br><br>
													&nbsp;&nbsp;&nbsp;&nbsp; Les interventions sur les m�nisques et les ligaments par arthroscopie, 
													surtout pur les sportifs, sont assur�es � la CLINIQUE des OASIS par une �quipe chirurgicale 
												chevronn�e disposant d�un mat�riel de pointe
											</td>
											<td align=center><img src="images/Arthro.jpg" width="200" height="150" border="1"></td>
										</tr>											
										<tr>
											<td align=center><img src="images/Valvul1.jpg" width="200" height="150" border="1"></td>
											<td>								
												<a name="Valvul"></a><b>Salle de Chirurgie cardiaque valvulaire</b><br><br>
													&nbsp;&nbsp;&nbsp;&nbsp; Salle Op�ratoire de chirurgie cardiaque valvulaire sous CEC et coronarienne � c�ur battant
											</td>		
										</tr>		
										<tr>
											<td>								
												<a name="Reveil"></a><b>Salle de R�veil sous monitoring</b><br><br>
													&nbsp;&nbsp;&nbsp;&nbsp; Un personnel attentif et comp�tent est charge de la surveillance des 
												malades apr�s leur intervention chirurgicale
											</td>
											<td align=center><img src="images/Reveil.jpg" width="200" height="150" border="1"></td>
										</tr>	
										<tr>
											<td align=center><img src="images/Reanim.jpg" width="200" height="150" border="1"></td>
											<td>								
												<a name="Reanim"></a><b>Salles de R�animation</b><br><br>
													&nbsp;&nbsp;&nbsp;&nbsp; Un personnel attentif et comp�tent est charge de la surveillance des 
												malades apr�s leur intervention chirurgicale.<br><br>
													&nbsp;&nbsp;&nbsp;&nbsp; Les 2 salles de r�animation post-op�ratoire et la salle USIC (unit� de 
													soins intensifs cardiologiques) sont sous double surveillance : pr�sence effective du personnel 
												de r�animation et monitoring.
											</td>		
										</tr>		
										<tr align=center>
											<td><a name="Dechoquage"><b>Salle de d�choquage (r�animation)</b></td>
											<td><img src="images/dechoquage.jpg" width="200" height="150" border="1"></td>
										</tr>	
										<tr align=center>
											<td><a name="Septique"><img src="images/septique.jpg" width="200" height="150" border="1"></td>	
											<td><b>Bloc septique (petite chirurgie)</b></td>
										</tr>																																																																																								
									</table>	
								</p>
								<p class="Details"><a href="Bloc.aspx">Bloc op�ratoire</a></p>
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