<%@ Page Language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Voir un contact</title>
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
    						<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > <a href="ListContacts.aspx">Contacts</a> > Voir un Contact</th>
						<tr>
							<td width="10"></td>
							<td>
								<br>
								<p>
									<asp:Button ID="btnDeleteContact" CssClass="Button" Text="Supprimer" OnClick="DeleteContact" Runat="server" Width="60" />&nbsp;	
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" Runat="server" Width="60" />	
								</p>
								<br>
								<table>
									<tr>
										<td><b>Nom:</b></td>
										<td><asp:label id="Nom" runat="server" /></td>
									</tr>
									<tr>
										<td><b>Tél:</b></td>
										<td><asp:label id="Tel" runat="server" /></td>
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
										<td><b>Ville:</b></td>
										<td><asp:label id="Ville" runat="server" /></td>
									</tr>
									<tr>
										<td><b>Pays:</b></td>
										<td><asp:label id="Paye" runat="server" /></td>
									</tr>
									<tr>
										<td><b>Code pays:</b></td>
										<td>
											<asp:label id="Code_Paye" runat="server" />
											<asp:Image id="Flag" runat="server" />
										</td>
									</tr>
									<tr>
										<td><b>Sujet:</b></td>
										<td><asp:label id="Sujet" runat="server" /></td>
									</tr>
									<tr><td valign="top"><b>Message:</b></td></tr>
									<tr>
										<td colspan="2"><span class="Details"><asp:Literal ID="Message" Runat=server /></span></td>
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
		int Nu_Contact = int.Parse(Request.Params["Nu_Contact"]);
		if (CheckNu(Nu_Contact)) {
			btnDeleteContact.Attributes.Add("OnClick", "javascript:return confirm('A ce que vous etre sure ?')");		
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlCommand cmd = new SqlCommand	("select Nom, Tel, Date_Heure, Ville, Paye, Sujet, Message, Intituler from Contacts, Payes where (Nu_Contact = " + Nu_Contact + ") and (Paye = Code_Paye)", connection);										
			SqlDataReader readerdata = cmd.ExecuteReader ();
			while (readerdata.Read ()) {
				Nom.Text = readerdata["Nom"].ToString ();
				Tel.Text = readerdata["Tel"].ToString ();
				Date_Access.Text = readerdata.GetDateTime(2).ToString ("d");
				Heure_Access.Text = readerdata.GetDateTime(2).ToString ("hh:mm");
				Ville.Text = readerdata["Ville"].ToString ();
				Paye.Text = readerdata["Intituler"].ToString ();
				Code_Paye.Text = readerdata["Paye"].ToString ();
				Flag.ImageUrl = "../images/flags/" + readerdata["Paye"].ToString () + ".png";
				Sujet.Text = readerdata["Sujet"].ToString ();		
				Message.Text = readerdata["Message"].ToString ();
			}
			connection.Close ();
		}
		else
			Response.Redirect("../ErreurPage.aspx");
	}
}
void DeleteContact ( Object sender, EventArgs e)
{
	int Nu_Contact= int.Parse(Request.Params["Nu_Contact"]);
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("delete from Contacts where Nu_Contact=" + Nu_Contact, connection);
		command.ExecuteNonQuery ();
		Response.Redirect("ListContacts.aspx");
		}
	finally {
		connection.Close ();
	}
}
bool CheckNu(int Nu_Contact)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from Contacts where Nu_Contact = " + Nu_Contact, connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return ( Nu > 0 );
	connection.Close ();
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("ListContacts.aspx");
}
</script>