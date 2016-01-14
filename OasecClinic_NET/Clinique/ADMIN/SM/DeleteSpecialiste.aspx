<%@ Page%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Suppression d'un Spécialiste</title>
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
    						<th  colspan="2" align="left"><a href="../default.aspx">Accueil</a> > <a href="../SM.aspx">Services Médicaux > <a href="ListSpecialites.aspx">Spécialités</a> > <asp:HyperLink ID="Specialite" Runat=server /> > Suppression d'un Spécialiste</th>
						<tr>
							<td rowspan="2" width="10"></td>
							<td>
								<br>
								<p>
									<b>Confirmation de suppression</b><hr>
										A ce que vous étés sur de supprimer le spécialiste <b><asp:Label ID="Specialiste" Runat=server /></b> ?<br><br>
									<asp:Button CssClass="Button" Text="Oui" OnClick="Delete" Runat=server Width="60" />&nbsp;
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
		int Nu_Specialiste = int.Parse(Request.Params["Nu_Specialiste"]);
		if (CheckSpecialisteNu(Nu_Specialiste)){
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();
   		  	  SqlCommand cmd = new SqlCommand("select Nom from SM_Specialistes where Nu_Specialiste = " + Nu_Specialiste, connection);
			Specialiste.Text = (string) cmd.ExecuteScalar ();
			connection.Close ();
			connection.Open();
			SqlCommand command = new SqlCommand	("select Nom, Intituler, Nu_Specialite from SM_Specialistes, SM_Specialites where (Specialite = Nu_Specialite and Nu_Specialiste=" + Nu_Specialiste + ")", connection);
			SqlDataReader reader = command.ExecuteReader ();
			while (reader.Read ()){
				Specialiste.Text = reader["Nom"].ToString();
				Specialite.Text = reader["Intituler"].ToString();
				Specialite.NavigateUrl = "ListSpecialistes.aspx?Nu_Specialite=" + reader["Nu_Specialite"].ToString();
			}
		}
		else
			Response.Redirect("../../ErreurPage.aspx");
	}
}
bool CheckSpecialisteNu(int Nu_Specialiste)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from SM_Specialistes where Nu_Specialiste= " + Nu_Specialiste, connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return ( Nu > 0 );
	connection.Close ();
}
byte GetSpecialiteNu(int Nu_Specialiste)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select Specialite from SM_Specialistes where Nu_Specialiste= " + Nu_Specialiste, connection);
	return (byte) cmd .ExecuteScalar ();
	connection.Close ();
}
void Delete (Object sender, EventArgs e)
{	
	int Nu_Specialiste = int.Parse(Request.Params["Nu_Specialiste"]);
	int Nu_Specialite = GetSpecialiteNu(Nu_Specialiste);
	Functions fun = new Functions();
	fun.AddTach(Context.User.Identity.Name, "Suppression", "Specialisté");
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("delete from SM_Specialistes where Nu_Specialiste =" + Nu_Specialiste, connection);
		command.ExecuteNonQuery ();
		Response.Redirect("ListSpecialistes.aspx?Nu_Specialite=" + Nu_Specialite);
		}
	finally {
		connection.Close ();
	}
}
void Reteur (Object sender, EventArgs e)
{
	int Nu_Specialiste = int.Parse(Request.Params["Nu_Specialiste"]);
	byte Nu_Specialite = GetSpecialiteNu(Nu_Specialiste);
	if (Request.Params["From"] == "Modif")
		Response.Redirect("ModifSpecialiste.aspx?Nu_Specialiste=" + Nu_Specialiste);
	else 
		Response.Redirect("ListSpecialistes.aspx?Nu_Specialite=" + Nu_Specialite);
}
</script>
