<%@ Page Language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Admin" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Voir un utilisateur</title>
		<script language="Javascript" src="../script/js.js"></script>
		<link type=text/css href="../css/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

	<form runat="server">
    	<Clinique:Top id="top" runat="server" />
    	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
			<tr>
    			<td width="140" valign=top>
    				<p><Admin:Left_Admin id="Left" runat="server" /></p>
				</td>
				<td width="620" valign=top>
    				<table width="100%">
	    				<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > <a href="ListUsersStats.aspx">Stats. Utilisateurs</a> > Voir un utilisateur</th>    					
						<tr>
							<td width="10"></td>
							<td>
								<br>
								<p>
									<asp:Button ID="btnDeleteUser" CssClass="Button" Text="Supprimer" OnClick="DeleteUser" Runat="server" Width="60" />&nbsp;	
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" Runat="server" Width="60" />													
								</p>
								<table>
									<tr>
										<td><b>Compte:</b></td>
										<td><asp:label id="Compte" runat="server" /></td>
									</tr>								
									<tr>
										<td><b>Nom:</b></td>
										<td><asp:label id="Nom" runat="server" /></td>
									</tr>	
									<tr>
										<td><b>Droit:</b></td>
										<td><asp:label id="Droit" runat="server" /></td>
									</tr>																																											
									<tr>
										<td><b>Date d'inscription:</b></td>
										<td><asp:label id="Date_Inscription" runat="server" /></td>
									</tr>						
								</table>														
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<Clinique:CopyRight id="CopyRight" runat=server />
	</form>
</body>
</html>
<script runat=server>
void Page_Load(Object sender, EventArgs e)
{
	if (!IsPostBack) {
		int Nu_User = int.Parse(Request.Params["Nu_User"]);
		if (CheckNu(Nu_User)) {
			btnDeleteUser.Attributes.Add("OnClick", "javascript:return confirm('A ce que vous etre sure ?')");
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlCommand cmd = new SqlCommand	("select Nom, Compte, Droit, Date_Inscription from Users where Nu_User= " + Nu_User, connection);										
			SqlDataReader readerdata = cmd.ExecuteReader ();
			while (readerdata.Read ()) {
				Nom.Text = readerdata["Nom"].ToString ();
				Compte.Text = readerdata["Compte"].ToString ();
				Droit.Text = readerdata["Droit"].ToString ();
				Date_Inscription.Text = readerdata.GetDateTime(3).ToString ("d");
			}
			connection.Close ();
			}
		else
			Response.Redirect("../ErreurPage.aspx");
	}
}
void DeleteUser ( Object sender, EventArgs e)
{
	int Nu_User = int.Parse(Request.Params["Nu_User"]);
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open();
	SqlCommand command = new SqlCommand	("delete from Users where Nu_User=" + Nu_User, connection);
	command.ExecuteNonQuery ();
	Response.Redirect("ListUsersStats.aspx");
	connection.Close ();
}
bool CheckNu(int Nu_User)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from Users where Nu_User = " + Nu_User, connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return ( Nu > 0 );
	connection.Close ();
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("ListUsersStats.aspx");
}
</script>