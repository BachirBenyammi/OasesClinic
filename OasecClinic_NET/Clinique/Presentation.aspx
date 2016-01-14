<%@ Page%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Pr�sentation</title>
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
   					<th align=center colspan="2">Pr�sentation</th>
   					<tr>
   						<td width="10"></td>
   						<td>
							<br>					
							<p class="Details">
								<img src="images/clinique.jpg" width="200" height="150" border="1" align=right>
								&nbsp;&nbsp;&nbsp;&nbsp; La CLINIQUE des OASIS est une structure qui r�pond aux 
								normes internationales, elle r�unit les conditions requises pour une m�decine 
								moderne et de qualit�.</p>
							<p class="Details">&nbsp;&nbsp;&nbsp;&nbsp; La clinique est �quip�e d�un mat�riel de 
								pointe pour la r�animation et la prise en charge des cas d�urgence avec des appareils 
								modernes de surveillance.</p>
							<p class="Details">&nbsp;&nbsp;&nbsp;&nbsp; La clinique a pour vocation de vous apporter 
								un diagnostic pr�cis et des soins personnalis�s dans les meilleures conditions 
								de confort, d'accueil et de rapidit�. Gr�ce � une �quipe m�dicale 
								et soignante de haut niveau et un plateau technique performant.</p>
							<p class="Details">
								&nbsp;&nbsp;&nbsp;&nbsp; <a href="ListActualites.aspx">Actualit�s et �v�nements</a><br>
								&nbsp;&nbsp;&nbsp;&nbsp; <a href="Historique.aspx">Un peut d'historique sur la clinique</a><br>
								&nbsp;&nbsp;&nbsp;&nbsp; <a href="Structure.aspx">La structure g�n�rale de la clinique</a><br>
									&nbsp;&nbsp;&nbsp;&nbsp; <a href="ListSpecialites.aspx">Sp�cialit�s m�dicales disponibles dans la clinique</a><br>
								&nbsp;&nbsp;&nbsp;&nbsp; <a href="Departements.aspx">D�partements m�dicales de la clinique</a><br>
								&nbsp;&nbsp;&nbsp;&nbsp; <a href="Services.aspx">Autres services</a><br>
								&nbsp;&nbsp;&nbsp;&nbsp; <a href="address.aspx">Comment se rendre � la clinique ?</a>
							</p>
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