<%@ Page%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Import NameSpace="CliniqueSite"%>

<html>
	<head>
		<title>Connexion</title>
		<link type=text/css href="../css/style.css" rel=stylesheet>
	</head>
<body>
	<form runat=server>
		<table width="80%" height="80%"><tr><td valign=center align=center>
			<tr>
				<td>
					<table cellpadding="0" cellspacing="0" align=center>
						<tr>
							<td colspan="2">
								<br>
								<h3>Veuillez vous connecter</h3>
								<hr align=left width="250">
							</td>
						</tr>
						<tr>
							<td>
								<table>
									<tr>
										<td>Compte:</td>
										<td><asp:TextBox ID="Compte" Runat=server Width="150"/></td>
									</tr>
									<tr>	
										<td>Mot de passe:</td>
										<td><asp:TextBox ID="Mot_de_passe" TextMode="Password" Runat=server Width="150"/></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2">	
								<br>
								<asp:Button CssClass="Button" Text="Connexion" OnClick="OnLogin" Runat=server />
								<h5><asp:Label ID="Output" Runat=server /></h5>
								Retourner au <a href="../default.aspx">Page d&#39;accueil</a>
								<hr align=left width="250">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

<script language="c#" runat="server">
void Page_Load (Object sender, EventArgs e)
{
	FormsAuthentication.SignOut ();
}
void OnLogin (Object sender, EventArgs e)
{
	if (CustomAuthenticate (Compte.Text, Mot_de_passe.Text)) {
		Functions fun = new Functions();
		fun.AddTach(Compte.Text, "Connexion", "Acceuil");
		FormsAuthentication.SetAuthCookie (Compte.Text, false);	
		Response.Redirect ("default.aspx");
	}
	else
		Output.Text = "Connexion non valide";
}

bool CustomAuthenticate (string compte, string mot_de_passe)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open();
	SqlCommand command = new SqlCommand	("select count (*) from Users where Compte ='" + compte + "' and cast (rtrim (Mot_de_passe) as nvarchar) = cast ('" + mot_de_passe + "' as nvarchar)", connection);
	int count = (int) command.ExecuteScalar ();
	return (count > 0 );
	connection.Close ();
}
</script>
