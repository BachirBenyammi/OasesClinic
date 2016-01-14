<%@ Page%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Départements</title>
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
    						<th align=left colspan="2"><a href="Presentation.aspx">Présentation</a> > Départements</th>
						<tr>
							<td width=10></td>
							<td>
								<br>
								<p class="Details">&nbsp;&nbsp;&nbsp;&nbsp; La CLINIQUE des OASIS se constitue de plusieurs départements sont les suivants	:</p>
								<p class="Details">							
									&nbsp;&nbsp; <a href="Reception.aspx">Hall d'accueil</a><br>
									&nbsp;&nbsp; <a href="Consultations.aspx">Consultations</a><br>
									&nbsp;&nbsp; <a href="Imagerie.aspx">Imagerie</a><br>
									&nbsp;&nbsp; <a href="Bloc.aspx">Bloc opératoire</a><br>
									&nbsp;&nbsp; <a href="Urgences.aspx">Urgences</a><br>
									&nbsp;&nbsp; <a href="Labos.aspx">Laboratoires</a><br>
									&nbsp;&nbsp; <a href="Hospitale.aspx">Hospitalisation</a><br>
									&nbsp;&nbsp; <a href="Cardio.aspx">Cardiologie<br>
									&nbsp;&nbsp; <a href="Maternite.aspx">Maternité</a><br>
									&nbsp;&nbsp; <a href="Reeducation.aspx">Rééducation fonctionnelle</a><br>
									&nbsp;&nbsp; <a href="Remise.aspx">Remise en forme</a><br>
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
