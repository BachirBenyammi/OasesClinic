<%@ Page Language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Voir un Abonnée</title>
		<script language="Javascript" src="../script/js.js"></script>
		<link type=text/css href="../css/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

	<form runat="server">
    	<Clinique:Top id="top" runat="server" />
    	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
			<tr>
    			<td width="140" valign=top>
    				<p><Clinique:Left_Admin id="Left" runat="server" /></p>
				</td>
				<td width="620" valign=top>
    				<table width="100%">
	    					<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > <a href="ListAbonnees.aspx">Abonnées</a> > Voir un Abonnée</th>
						<tr>
							<td width="10"></td>
							<td>
								<br>
									<p>
										<asp:Button ID="btnDeleteAbonnaie" CssClass="Button" Text="Supprimer" OnClick="DeleteAbonnaie" Runat="server" Width="60" />&nbsp;	
										<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" Runat="server" Width="60" />
									</p>								
									<p>
										<table border="0">
											<tr>
												<td><b>Compte: </b></td>
												<td><asp:label id="Compte" runat="server" /></td>
											</tr>
											<tr>
												<td><b>Nom: </b></td>
												<td><asp:label id="Nom" runat="server" /></td>
											</tr>
											<tr>
												<td><b>Email: </b></td>
												<td><asp:label id="Email" runat="server" /></td>
											</tr>																
											<tr>
												<td><b>Date d'inscription: </b></td>
												<td><asp:label id="Date_Inscription" runat="server" /></td>
											</tr>
											<tr>
												<td><b>Ville: </b></td>
												<td><asp:label id="Ville" runat="server" /></td>
											</tr>
											<tr>
												<td><b>Pays: </b></td>
												<td>
													<asp:label id="Paye" runat="server" />
													<asp:Image id="Flag" runat="server" />
												</td>
											</tr>	
										</table>														
									</p>
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
		int Nu_Abonnaie = int.Parse(Request.Params["Nu_Abonnaie"]);
		if (CheckNu(Nu_Abonnaie)) {
			btnDeleteAbonnaie.Attributes.Add("OnClick", "javascript:return confirm('A ce que vous etre sure ?')");
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlCommand cmd = new SqlCommand	("select Compte, Nom, Email, Date_Inscription, Ville, Paye, Intituler from Abonnaies, Payes where (Nu_Abonnaie= " + Nu_Abonnaie+ ") and (Paye = Code_Paye)", connection);										
			SqlDataReader readerdata = cmd.ExecuteReader ();
			while (readerdata.Read ()) {
				Compte.Text = readerdata["Compte"].ToString ();
				Nom.Text = readerdata["Nom"].ToString ();
				Email.Text = readerdata["Email"].ToString ();
				Date_Inscription.Text = readerdata.GetDateTime(3).ToString ("d");
				Ville.Text = readerdata["Ville"].ToString ();
				Paye.Text = readerdata["Intituler"].ToString ();
				Flag.ImageUrl = "../images/flags/" + readerdata["Paye"].ToString () + ".png";
			}
			connection.Close ();
		}
		else
			Response.Redirect("../ErreurPage.aspx");
	}
}
void DeleteAbonnaie ( Object sender, EventArgs e)
{
	int Nu_Abonnaie= int.Parse(Request.Params["Nu_Abonnaie"]);
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("delete from Abonnaies where Nu_Abonnaie=" + Nu_Abonnaie, connection);
		command.ExecuteNonQuery ();
		Response.Redirect("ListAbonnees.aspx");
		}
	finally {
		connection.Close ();
	}
}
bool CheckNu(int Nu_Abonnaie)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from Abonnaies where Nu_Abonnaie= " + Nu_Abonnaie, connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return ( Nu > 0 );
	connection.Close ();
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("ListAbonnees.aspx");
}
</script>