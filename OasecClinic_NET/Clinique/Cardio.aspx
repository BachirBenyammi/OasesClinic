<%@ Page%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Cardoilogie</title>
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
    						<th align=left colspan="2"><a href="Presentation.aspx">Pr�sentation</a> > <a href="Departements.aspx">D�partements</a> > Cardoilogie</th>
						<tr>
							<td width=10></td>
							<td>
								<br>
								<p class="Details">		
									<table cellspacing="10">
										<tr>
											<td>								
												&nbsp;&nbsp;&nbsp;&nbsp; Consultations et explorations fonctionnelles:<br>
												&nbsp;&nbsp; &Eacute;preuves d'effort<br>
												&nbsp;&nbsp; Holter ECG et TA<br>
												&nbsp;&nbsp;&nbsp;&nbsp; Cardiologie interventionnelle<br>
												&nbsp;&nbsp; Coronarographie<br>
												&nbsp;&nbsp; Angioplastie avec mise en place de stent<br>
												&nbsp;&nbsp; Cath�t�risme et pose de pacemaker<br>
												&nbsp;&nbsp;&nbsp;&nbsp; Cardiologie p�diatrique<br>
												&nbsp;&nbsp;&nbsp;&nbsp; Chirurgie cardiaque et valvulaire<br>
											</td>
											<td align=center><img src="images/Clinique.jpg" width="200" height="150" border="1"></td>
										</tr>
										<tr align=center>
											<td><img src="images/ChefCardio.jpg" width="200" height="250" border="1"></td>	
											<td><b>Mr RAGISSE Mohamed, chef service des infirmiers de la cardiologie.</b></td>
										</tr>	
										<tr align=center>
											<td><b>Salle de cath�t�risme cardiaque et cardiologie invasive</b></td>
											<td><img src="images/Cathe.jpg" width="200" height="150" border="1"></td>
										</tr>		
										<tr align=center>
											<td><img src="images/Epreuves.jpg" width="200" height="150" border="1"></td>
											<td><b>Salle d'&Eacute;preuves d'effort</b></td>
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