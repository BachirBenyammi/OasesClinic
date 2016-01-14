<%@ Page%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Suppression d'un Sondage</title>
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
    						<th  colspan="2" align="left"><a href="default.aspx">Accueil</a> > <a href="ListSondages.aspx">Sondages</a> > Suppression d'un Sondage</th>
						<tr>
							<td rowspan="2" width="10"></td>
							<td>
								<br>
								<p>
									<b>Confirmation de suppression</b><hr>
										A ce que vous étés sur de supprimer l'évènement <b><asp:Label ID="SondageTitre" Runat=server /></b> ?<br><br>
									<asp:Button CssClass="Button" Text="Oui" OnClick="DeleteSondage" Runat=server Width="60" />&nbsp;
									<asp:Button CssClass="Button" Text="Non" OnClick="Reteur" Runat=server Width="60" />
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

<script runat="server">
void Page_Load(Object sender, EventArgs e)
{
	if (!IsPostBack) {
		int Nu_Sondage = int.Parse(Request.Params["Nu_Sondage"]);
		if (CheckSondageNu(Nu_Sondage)){
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();
			SqlCommand cmd = new SqlCommand("select Sondage from Sondages where Nu_Sondage= " + Nu_Sondage, connection);
			SondageTitre.Text = (string) cmd .ExecuteScalar ();
			connection.Close ();
		}
		else
			Response.Redirect("../ErreurPage.aspx");
	}
}

void DeleteSondage (Object sender, EventArgs e)
{	
	Functions fun = new Functions();
	fun.AddTach(Context.User.Identity.Name, "Suppression", "Sondages");
	int Nu_Sondage = int.Parse(Request.Params["Nu_Sondage"]);
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open();
	SqlCommand command = new SqlCommand	("delete from Sondages where Nu_Sondage =" + Nu_Sondage, connection);
	command.ExecuteNonQuery ();
	connection.Close ();
	connection.Open();
	SqlCommand cmd = new SqlCommand	("delete from Sondages_Choix where Nu_Sondage =" + Nu_Sondage, connection);
	cmd.ExecuteNonQuery ();
	connection.Close();	
	Response.Redirect("ListSondages.aspx");
}
bool CheckSondageNu(int Nu_Sondage)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from Sondages where Nu_Sondage= " + Nu_Sondage, connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return ( Nu > 0 );
	connection.Close ();
}
void Reteur (Object sender, EventArgs e)
{
	int Nu_Sondage = int.Parse(Request.Params["Nu_Sondage"]);
	string source = Request.Params["From"];
	switch(source)
	{
		case "View":
			Response.Redirect("ViewSondage.aspx?Nu_Sondage=" + Nu_Sondage);
			break;
		default:
			Response.Redirect("ListSondages.aspx");
			break;
	}
}
</script>
