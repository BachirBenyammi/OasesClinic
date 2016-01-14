<%@ Page%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Modifier un Spécialiste</title>
		<script language="Javascript" src="../../script/js.js"></script>
		<link type=text/css href="../../css/style.css" rel=stylesheet>
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
								<th  colspan="2" align="left"><a href="../default.aspx">Accueil</a> > <a href="../SM.aspx">Services Médicaux > <a href="ListSpecialites.aspx">Spécialités</a> > <asp:HyperLink ID="Specialite" Runat=server /> > Modifier un Spécialiste</th>
						<tr>
							<td width="10" rowspan=2></td>
							<td>
								<br>
								<p>
								  		<asp:Button CssClass="Button" Text="Supprimer" OnClick="DeleteSpecialiste" Runat="server" Width="60" />&nbsp;
								  	<asp:Button CssClass="Button" Text="Modifier" OnClick="ModifSpecialiste" Runat="server" Width="60" />&nbsp;
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" CausesValidation=False Runat="server" Width="60"/>	
								</p>    
								<b>Modifier un Spécialiste</b><hr>   
								<table>
									<tr>
										<td>Intituler:</td>
										<td>	
											<asp:TextBox id="Nom" MaxLength="50" Size="50" runat="server" />
											<asp:RequiredFieldValidator
												ControlToValidate="Nom"
												ErrorMessage="*"
												Display="dynamic"
												runat="server" />		
										</td>
									</tr>
									<tr>
										<td>Tél:</td>
										<td>
											<asp:TextBox id="Tel" MaxLength="12" Size="12" runat="server" />
											<asp:RequiredFieldValidator
												ControlToValidate="Tel"
												ErrorMessage="*"
												Display="dynamic"
												runat="server" />
										</td>
									</tr>
									<tr>
										<td>Adresse:</td>
										<td>
											<asp:TextBox id="Address" MaxLength="50" Size="50" runat="server" />
											<asp:RequiredFieldValidator
												ControlToValidate="Address"
												ErrorMessage="*"
												Display="dynamic"
												runat="server" />
										</td>
									</tr>
									<tr>
										<td>Ville:</td>
										<td>
											<asp:DropDownList ID="Villes" Runat=server />
											<asp:RequiredFieldValidator
												ControlToValidate="Villes"
												ErrorMessage="*"
												Display="Dynamic"
												Runat=server />		
										</td>
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

<script runat="server">
void Page_Load (Object sender, EventArgs e)
{
	if (!IsPostBack) {
		int Nu_Specialiste = int.Parse(Request.Params["Nu_Specialiste"]);
		string ville = "";
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		connection.Open();
		SqlCommand command = new SqlCommand	("select Nom, Tel, Address, Intituler, Specialite, Ville from SM_Specialistes, SM_Specialites where (Nu_Specialiste=" + Nu_Specialiste + " and Nu_Specialite=Specialite)", connection);
		SqlDataReader reader = command.ExecuteReader ();
		while (reader.Read ()) {
			Nom.Text = reader.GetString(0);
			Tel.Text = reader.GetString(1);
			Address.Text = reader["Address"].ToString();
			Specialite.Text = reader["Intituler"].ToString();
			Specialite.NavigateUrl = "ListSpecialistes.aspx?Nu_Specialite=" + reader["Specialite"].ToString();
			ville = reader["Ville"].ToString();
		}
		connection.Close ();
		connection.Open();
		SqlDataAdapter adapter = new SqlDataAdapter	("select Nu_Ville, Ville from Villes order by Ville", connection);			
   		DataSet ds = new DataSet();
		adapter.Fill(ds);
		Villes.DataSource = ds;
		Villes.DataTextField = "Ville";
		Villes.DataValueField = "Nu_Ville";
		Villes.DataBind ();	
		connection.Close ();	
		Villes.Items.FindByValue(ville).Selected = true;
	}
}

void ModifSpecialiste (Object sender, EventArgs e)
{	
	string Ville = Villes.Items[Villes.SelectedIndex].Value;
	int Nu_Specialiste = int.Parse(Request.Params["Nu_Specialiste"]);
	int Nu_Specialite = GetSpecialiteNu(Nu_Specialiste);
	Functions fun = new Functions();
	fun.AddTach(Context.User.Identity.Name, "Insertion", "Spécialiste/" + GetSpecialiteName(Nu_Specialiste));
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("update SM_Specialistes set Nom='" + Nom.Text + "', Tel='" + Tel.Text + "', Address='" + Address.Text + "', Ville='" + Ville + "', Specialite= '" + Nu_Specialite+ "' where Nu_Specialiste=" + Nu_Specialiste, connection);			
   		command.ExecuteNonQuery ();
		Response.Redirect("ListSpecialistes.aspx?Nu_Specialite=" + Nu_Specialite);
		}
	finally {
		connection.Close ();
	}
}
byte GetSpecialiteNu(int Nu_Specialiste)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select Specialite from SM_Specialistes where Nu_Specialiste= " + Nu_Specialiste, connection);
	return (byte) cmd .ExecuteScalar ();
	connection.Close ();
}
string GetSpecialiteName(int Nu_Specialite)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select Intituler from SM_Specialites where Nu_Specialite= " + Nu_Specialite, connection);
	return (string) cmd .ExecuteScalar ();
	connection.Close ();
}
void DeleteSpecialiste ( Object sender, EventArgs e)
{
	int Nu_Specialiste = int.Parse(Request.Params["Nu_Specialiste"]);
	Response.Redirect("DeleteSpecialiste.aspx?From=Modif&Nu_Specialiste=" + Nu_Specialiste);
}
void Retour ( Object sender, EventArgs e)
{
	int Nu_Specialiste= int.Parse(Request.Params["Nu_Specialiste"]);
	Response.Redirect("ListSpecialiste.aspx?Nu_Specialite=" + GetSpecialiteNu(Nu_Specialiste));
}
</script>