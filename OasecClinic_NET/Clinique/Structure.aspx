<%@ Page%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Structure générale</title>
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
   					<th align=left colspan="2"><a href="Presentation.aspx">Présentation</a> > Structure générale</th>
   					<tr>
   						<td width="10"></td>
   						<td>
							<br>	
							<p class="Details">	
								<table>
									<tr>
										<td>
											&nbsp;&nbsp;&nbsp;&nbsp; La structure générale de la CLINIQUE des OASIS est sous forme d'un cœur compose de trios parties 	principales:<br>
					  						&nbsp;&nbsp; Partie bleue (Urgences)<br>
					  						&nbsp;&nbsp; Partie orange (Consultations)<br>
					  						&nbsp;&nbsp; Partie jaune (Hospitalisation)<br>		
										</td>
										<td><img src="images/plan.jpg" width="200" height="150" border="1" align=right></td>
									</tr>
									<tr align=center>
										<td><img src="images/urgences.jpg" width="200" height="150" border="1"></td>
										<td><b>Couloir d'urgences</b></td>			
									</tr>	
									<tr align=center>
										<td><b>Couloir consultations</b></td>
										<td><img src="images/consultation.jpg" width="200" height="150" border="1"></td>									
									</tr>
									<tr align=center>
										<td><img src="images/hospital.jpg" width="200" height="150" border="1"></td>										
										<td><b>Couloir d'hospitalisation</b></td>
									</tr>								
								</table>			
							</p>
							<p class="Details"><a href="Presentation.aspx">Présentation</a></p>
							<br>
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