<%@ Page Language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Voir une erreur</title>
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
	    					<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > <a href="ListErreurs.aspx">Erreurs</a> > Voir une erreur</th>
						<tr>	
							<td width="10"></td>
							<td>
								<br>
								<p>
									<asp:Button ID="btnDeleteErreur" CssClass="Button" Text="Supprimer" OnClick="DeleteErreur" Runat="server" Width="60" />&nbsp;	
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" Runat="server" Width="60" />
								</p>
								<p>
									<table>
										<tr>
											<td><b>Message :</b></td>
											<td><asp:label id="Message" runat="server" /></td>
										</tr>
										<tr>
											<td><b>Date:</b></td>
											<td><asp:label id="Date_Access" runat="server" /></td>
										</tr>
										<tr>
											<td><b>Heure:</b></td>
											<td><asp:label id="Heure_Access" runat="server" /></td>
										</tr>	
										<tr>
											<td><b>Sourc:</b></td>
											<td><asp:label id="Source" runat="server" /></td>
										</tr>
										<tr>
											<td><b>Url:</b></td>
											<td><asp:label id="Url" runat="server" /></td>
										</tr>
										<tr>
											<td colspan="2">
												<asp:CheckBox id="Traitement" Runat=server
												runat="server" AutoPostBack=True 
												Text="Marque comme déja traité" 
												OnCheckedChanged="TraitementErreur" />
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
		int Nu_Erreur= int.Parse(Request.Params["Nu_Erreur"]);
		if (CheckNu(Nu_Erreur)) {
			btnDeleteErreur.Attributes.Add("OnClick", "javascript:return confirm('A ce que vous etre sure ?')");		
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlCommand cmd = new SqlCommand	("select Message, Date_Heure, Source, Url, Traitement from Erreurs where Nu_Erreur= " + Nu_Erreur, connection);	
			SqlDataReader readerdata = cmd.ExecuteReader ();
			while (readerdata.Read ()) {
				Message.Text = readerdata["Message"].ToString ();
				Source.Text = readerdata["Source"].ToString ();
				Date_Access.Text = readerdata.GetDateTime(1).ToString ("d");
				Heure_Access.Text = readerdata.GetDateTime(1).ToString ("hh:mm");
				Url.Text = readerdata["Url"].ToString ();
				Traitement.Checked  =  readerdata.GetBoolean(4);
			}
			connection.Close ();
		}
		else
			Response.Redirect("../ErreurPage.aspx");
	}
}
void DeleteErreur ( Object sender, EventArgs e)
{
	int Nu_Erreur= int.Parse(Request.Params["Nu_Erreur"]);
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("delete from Erreurs where Nu_Erreur=" + Nu_Erreur, connection);
		command.ExecuteNonQuery ();
		Response.Redirect("ListErreurs.aspx");
		}
	finally {
		connection.Close ();
	}
}
void TraitementErreur( Object sender, EventArgs e)
{
	int check = (Traitement.Checked == false) ? 0 : 1;
	int Nu_Erreur= int.Parse(Request.Params["Nu_Erreur"]);
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("update Erreurs set Traitement =" + check + "where Nu_Erreur=" + Nu_Erreur, connection);
		command.ExecuteNonQuery ();
	}
	finally {
		connection.Close ();
	}
}
bool CheckNu(int Nu_Erreur)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from Erreurs where Nu_Erreur = " + Nu_Erreur, connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return ( Nu > 0 );
	connection.Close ();
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("ListErreurs.aspx");
}
</script>