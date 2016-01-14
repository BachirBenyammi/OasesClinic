<%@ Page language="c#" debug="true"%> <%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%> <%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%> <%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>
<html>

<head>
<title>Clinique des Oasis - Historique</title>
<script language="Javascript" src="script/js.js"></script>
<link type="text/css" href="css/style.css" rel="stylesheet">
</head>

<body onload="debuteDate();debuteTemps()" onunload="clearTimeout(ddate);clearTimeout(ttime)">

<form runat="server">
	<Clinique:Menu id="Menu" runat="server" />
	<Clinique:Top id="top" runat="server" />
	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
		<tr>
			<td width="140" valign="top">
			<Clinique:Left id="Left" runat="server" /></td>
			<td width="480" valign="top">
			<table width="100%">
				<tr>
						<th align="left" colspan="2"><a href="Presentation.aspx">Présentation</a> > Historique</th>
				</tr>
				<tr>
					<td width="10"></td>
					<td><br>
					<p class="Details">
						<img src="images/clinique.jpg" width="200" height="150" border="1" align=right>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; La CLINIQUE des OASIS a été inauguré 
						par M. le Ministre algérien de la santé, le 6 Mai 2002.
					</p>
					<p class="Details">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; La clinique était, à l’origine, 
						destiné uniquement aux check-up, c’est-à-dire les 
						bilans médicaux, en moins de 12 heures. Mais après, il a été constaté 
						la nécessité d’installer des blocs opératoires pour la neurochirurgie, 
						les chirurgies cardiaque, maxillo-faciale et la médecine interne.
					</p>
					<p class="Details">
						&nbsp;&nbsp;&nbsp;&nbsp;Cet investissement a pour que les Algériens n’aillent plus 
						aux pays voisins ou en Europe pour se faire soigner, ils auront tout ici et au moindre coût. 
					</p>
					<p class="Details"><a href="Presentation.aspx">Présentation</a></p>
					</td>
				</tr>
			</table>
			</td>
			<td width="140" valign="top">
			<Clinique:Right id="Right" runat="server" /></td>
		</tr>
	</table>
	<Clinique:CopyRight id="CopyRight" runat="server" />
</form>

</body>

</html>
