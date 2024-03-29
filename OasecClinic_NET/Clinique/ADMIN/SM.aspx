<%@ Page%>
<%@ Import Namespace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Servies M�dicaux</title>
		<script language="Javascript" src="../script/js.js"></script>
		<link type=text/css href="../css/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
    <form runat=server> 
   		<Clinique:Top id="top" runat="server" />
	
    	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
			<tr>
    			<td width="140" valign=top>
    				<p><Clinique:Left_Admin id="Left" runat="server" /></p>
				</td>			
				<td width="620" valign=top>
    				<table width="100%">
    					<th colspan="2" align=left><a href="default.aspx">Accueil</a> > Servies M�dicaux</th>
						<tr>
							<td width="10"></td>
							<td>
								<br>
								<b>Servies M�dicaux</b><hr>
								<table align=center width="80%">
									<tr>
										    <td><b><a href="SM/ListCentres.aspx?Centre_Type=H">H�pitaux</a></b> (<asp:Label id="Hospital" Runat=server />)</td>
											<td><b><a href="SM/ListCentres.aspx?Centre_Type=C">Cliniques</a></b> (<asp:Label id="Clinic" Runat=server />)</td>
									</tr>
									<tr>
											<td><b><a href="SM/ListSpecialites.aspx">Sp�cialistes</a></b> (<asp:Label id="Specialist" Runat=server />)</td>
											<td><b><a href="SM/ListCentres.aspx?Centre_Type=P">Pharmacies</a></b> (<asp:Label id="Pharmacetical" Runat=server />)</td>
									</tr>
									<tr>
											<td><b><a href="SM/ListCentres.aspx?Centre_Type=M">Mat�riel M�dical</a></b> (<asp:Label id="Material" Runat=server />)</td>
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
<script runat=server >
void Page_Load(Object sender, EventArgs e)
{
	Hospital.Text = Nbr_Hospital ().ToString ();
	Clinic.Text =  Nbr_Clinic ().ToString ();
	Specialist.Text = Nbr_Specialiste ().ToString ();
	Pharmacetical.Text = Nbr_Pharmcetical ().ToString ();
	Material.Text = Nbr_Material ().ToString ();
}

int Nbr_Specialiste ()
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open();
	SqlCommand command = new SqlCommand	("select count (*) from SM_Specialistes", connection);
	return (int) command.ExecuteScalar ();
	connection.Close ();
}
int Nbr_Hospital ()
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open();
	SqlCommand command = new SqlCommand	("select count (*) from SM_Centres where Fonction='H'", connection);
	return (int) command.ExecuteScalar ();
	connection.Close ();
}
int Nbr_Clinic ()
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open();
	SqlCommand command = new SqlCommand	("select count (*) from SM_Centres where Fonction='C'", connection);
	return (int) command.ExecuteScalar ();
	connection.Close ();
}
int Nbr_Material ()
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open();
	SqlCommand command = new SqlCommand	("select count (*) from SM_Centres where Fonction='M'", connection);
	return (int) command.ExecuteScalar ();
	connection.Close ();
}
int Nbr_Pharmcetical ()
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open();
	SqlCommand command = new SqlCommand	("select count (*) from SM_Centres where Fonction='P'", connection);
	return (int) command.ExecuteScalar ();
	connection.Close ();
}
</script>

