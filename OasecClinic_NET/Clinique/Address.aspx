<%@ Page language="c#" debug="true"%> <%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%> <%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%> <%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>
<html>

<head>
<title>Clinique des Oasis - Addresse</title>
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
						<th align="left" colspan="2"><a href="Presentation.aspx">Présentation</a> > Addresse</th>
				</tr>
				<tr>
					<td width="10"></td>
					<td><br>
						<p class="Details"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comment se rendre à la clinique ?</b></p>
						<p class="Details">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; La CLINIQUE des OASIS est située au 
							GHARDA&Iuml;A, au 600 km sud 
							Alger la capitale d'Algérie.
						</p>
						<p align=center><img src="images/ghardaia.jpg" width="400" height="400" border="1"></p>
						<p class="Details">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 	Elle est au rote nationale numéro un (R.N 1) qui passe par 
							EL MOUSTADJEB - BOUHRAOUA au entrer de la ville de 
							GHARDA&Iuml;A.
						</p>
						<p class="Details">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Et l'adresse complète est la suivante:</p>
						<p class="Details">
	 						&nbsp;&nbsp; EL MOUSTADJEB – BOUHRAOUA<br>
							&nbsp;&nbsp; 47100 GHARDA&Iuml;A
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
