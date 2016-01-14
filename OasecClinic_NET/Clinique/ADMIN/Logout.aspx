<%@ Page%> 
<%@ Import NameSpace="System.Data.SqlClient"%> 
<%@ Import NameSpace="CliniqueSite"%>

<html>
	<head>
		<title>Déconnexion</title>
		<link type="text/css" href="../css/style.css" rel="stylesheet">
	</head>
<body>
	<table width="80%" height="80%">
		<tr>
			<td valign="center" align="center">
				<table cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td>
							<br>
							<h3>Vouz avez déconnecter !!</h3>
							<hr>
							<p>Pour retourner, visiter <a href="Login.aspx">La page de connexion</a><br>
							Retourner au <a href="../default.aspx">Page d&#39;accueil</a> </p>
							<hr>
						</td>
					</tr>
				</table>				
			</td>
		</tr>
	</table>
</body>
</html>
<script language="c#" runat="server">
void Page_Load (Object sender, EventArgs e)
{
	Functions fun = new Functions();
	fun.AddTach(Context.User.Identity.Name, "Déconnexion", "Admin");
	FormsAuthentication.SignOut ();
}
</script>
