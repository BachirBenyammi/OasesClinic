<%@ Page%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Services</title>
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
    						<th align=left colspan="2"><a href="Presentation.aspx">Présentation</a> > Services</th>
						<tr>
							<td width=10></td>
							<td>
								<br>
								<p class="Details">		
									<table cellspacing="10">
										<tr>
											<td>
												&nbsp;&nbsp;&nbsp;&nbsp; La CLINIQUE des OASIS mit à votre disposition les services suivants:																		
											</td>
											<td align=center><img src="images/Clinique.jpg" width="200" height="150" border="1"></td>
										</tr>	
										<tr align=center>
											<td><a name="Confer"></a><img src="images/Services/Conferences.jpg" width="200" height="150" border="1"></td>	
											<td><b>Salle de conférences</b></td>
										</tr>
										<tr align=center>
											<td><a name="Cafeteria"></a><b>Cafétéria</b></td>										
											<td><img src="images/Services/Cafeteria.jpg" width="200" height="150" border="1"></td>	
										</tr>	
										<tr align=center>
											<td><a name="Parc"></a><img src="images/Services/Parc.jpg" width="200" height="150" border="1"></td>											
											<td><b>Parc</b></td>										
										</tr>																
										<tr align=center>
											<td><b>Navette</b></td>										
											<td><a name="Navette"></a><img src="images/Services/Navette.jpg" width="200" height="150" border="1"></td>	
										</tr>										
										</table>
								</p>
								<p class="Details"><a href="Presentation.aspx">Présentation</a></p>
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