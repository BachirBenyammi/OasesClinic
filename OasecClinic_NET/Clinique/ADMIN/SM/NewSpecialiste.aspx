<%@ Page%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Ajouter un Sp�cialiste</title>
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
    						<th  colspan="2" align="left"><a href="../default.aspx">Accueil</a> > <a href="../SM.aspx">Services M�dicaux > <a href="ListSpecialites.aspx">Sp�cialit�s</a> > <asp:HyperLink ID="Specialite" Runat=server /> > Ajouter un Sp�cialiste</th>
						<tr>
							<td width="10" rowspan=2></td>
							<td>
								<br>
								<p>
								 	 	<asp:Button CssClass="Button" Text="Ajouter" OnClick="NewSpecialiste" Runat="server" Width="60" />&nbsp;
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" CausesValidation=False Runat="server" Width="60"/>	
								</p>    
								<b>Ajouter un Sp�cialiste</b><hr>   
								<table>
									<tr>
										<td>Nom:</td>
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
										<td>T�l:</td>
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
		int Nu_Specialite = int.Parse(Request.Params["Nu_Specialite"]);
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		connection.Open();
		SqlCommand command = new SqlCommand	("select Intituler from SM_Specialites where Nu_Specialite=" + Nu_Specialite, connection);
		Specialite.Text = (string) command.ExecuteScalar ();
		Specialite.NavigateUrl = "ListSpecialistes.aspx?Nu_Specialite=" + Nu_Specialite;
		connection.Close();
		connection.Open();
		SqlDataAdapter adapter = new SqlDataAdapter	("select Nu_Ville, Ville from Villes order by Ville", connection);			
   		DataSet ds = new DataSet();
		adapter.Fill(ds);
		Villes.DataSource = ds;
		Villes.DataTextField = "Ville";
		Villes.DataValueField = "Nu_Ville";
		Villes.DataBind ();	
		connection.Close ();	
	}
}
string GetSpecialiteName(int Nu_Specialite)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select Intituler from SM_Specialites where Nu_Specialite= " + Nu_Specialite, connection);
	return (string) cmd .ExecuteScalar ();
	connection.Close ();
}
void NewSpecialiste (Object sender, EventArgs e)
{	
	int Nu_Specialite = int.Parse(Request.Params["Nu_Specialite"]);
	string Ville = Villes.Items[Villes.SelectedIndex].Value;
	Functions fun = new Functions();
	fun.AddTach(Context.User.Identity.Name, "Insertion", "Specialistes/" + GetSpecialiteName(Nu_Specialite));
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("insert into SM_Specialistes (Nom, Tel, Address , Ville, Specialite) values ('" + Nom.Text + "', '" + Tel.Text + "', '" + Address.Text + "', '" + Ville + "', '" + Nu_Specialite + "')", connection);			
   		command.ExecuteNonQuery ();
		Response.Redirect("ListSpecialistes.aspx?Nu_Specialite=" + Nu_Specialite);
		}
	finally {
		connection.Close ();
	}
}
void Retour ( Object sender, EventArgs e)
{
	int Nu_Specialite = int.Parse(Request.Params["Nu_Specialite"]);
	Response.Redirect("ListSpecialistes.aspx?Nu_Specialite=" + Nu_Specialite);
}
</script>