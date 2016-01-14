<%@ Page%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - R��ducation fonctionnelle</title>
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
    						<th align=left colspan="2"><a href="Presentation.aspx">Pr�sentation</a> > <a href="Departements.aspx">D�partements</a> > R��ducation fonctionnelle</th>
						<tr>
							<td width=10></td>
							<td>
								<br>
								<p class="Details">		
									<table cellspacing="10">
										<tr>
											<td>
												&nbsp;&nbsp;&nbsp;&nbsp; Une �quipe sp�cialis�e se charge de la r�adaptation des patients 
													apr�s intervention d�orthop�die, de chirurgie cardiaque ou de neurochirurgie et les suites 
													d�accidents professionnels ou de circulation ainsi que les maladies neurologiques ou rhumatismales.
											</td>
											<td align=center><img src="images/Reeducation1.jpg" width="200" height="150" border="1"></td>
										</tr>
										<tr align=center>
											<td><img src="images/Reeducation2.jpg" width="200" height="150" border="1"></td>	
											<td><img src="images/Reeducation3.jpg" width="200" height="150" border="1"></td>	
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