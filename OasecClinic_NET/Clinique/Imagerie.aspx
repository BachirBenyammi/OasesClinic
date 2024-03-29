<%@ Page%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Imagerie</title>
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
    						<th align=left colspan="2"><a href="Presentation.aspx">Présentation</a> > <a href="Departements.aspx">Départements</a> > Imagerie</th>
						<tr>
							<td width=10></td>
							<td>
								<br>
								<p class="Details">		
									<table cellspacing="10">
										<tr>
											<td>								
												Scanner 3D<br>
												Angiographie coronarienne<br>
												Radiologie conventionnelle numérise<br>
												Mammographie avec stéréo ponction<br>
												&Eacute;chographie générale<br>
												&Eacute;chographie cardiovasculaire et doppler<br>
												Panoramique dentaire<br>
												Artériographie<br>
												Coronarographie<br>
											</td>
											<td align=center><img src="images/Radio1.jpg" width="200" height="150" border="1"></td>
										</tr>
										<tr align=center>
											<td><img src="images/Radio2.jpg" width="200" height="150" border="1"></td>	
											<td><img src="images/Radio3.jpg" width="200" height="150" border="1"></td>
										</tr>		
										<tr>
											<td><b>Table numérisée pour examens radiologiques spécialises</b></td>
											<td align=center><img src="images/Radio4.jpg" width="200" height="150" border="1"></td>
										</tr>	
										<tr>
											<td align=center><img src="images/Radio5.jpg" width="200" height="150" border="1"></td>	
											<td><b>Scanner 3d double barrette dernière génération</b></td>
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