<%@ Page%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Suppression d'un Service Médicale</title>
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
    						<th  colspan="2" align="left"><a href="../default.aspx">Accueil</a> > <a href="../SM.aspx">Services Médicaux > <asp:HyperLink ID="Centres" Runat=server /> > Suppression d'un  Service Médicale</th>
						<tr>
							<td rowspan="2" width="10"></td>
							<td>
								<br>
								<p>
									<b>Confirmation de suppression</b><hr>
										A ce que vous étés sur de supprimer <asp:Label ID="Centre_1" Runat=server /> <b><asp:Label ID="Centre" Runat=server /></b> ?<br><br>
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
		int Nu_Centre = int.Parse(Request.Params["Nu_Centre"]);
		if (CheckCentreNu(Nu_Centre)){
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();
   		    SqlCommand cmd = new SqlCommand("select Intituler from SM_Centres where Nu_Centre = " + Nu_Centre, connection);
			Centre.Text = (string) cmd.ExecuteScalar ();
			string Centre_Type = GetCentreType(Nu_Centre);
			switch (Centre_Type)
			{
				case "H": Centres.Text = "Hôpitaux";
						  Centre_1.Text = "l'hôpitale";
						  break;
				case "P": Centres.Text = "Pharmacies";		
						  Centre_1.Text = "la pharmacie";	
						  break;
				case "M": Centres.Text = "Matérial Médical";	
						  Centre_1.Text = "Le matérial médical";	
						  break;
				case "C": Centres.Text = "Cliniques";	
						  Centre_1.Text = "la clinique";
						  break;					  
			}
			Centres.NavigateUrl = "ListCentres.aspx?Centre_Type=" + Centre_Type; 
			connection.Close ();
		}
		else
			Response.Redirect("../../ErreurPage.aspx");
	}
}
string GetCentreType(int Nu_Centre)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open();
	SqlCommand command = new SqlCommand	("select Fonction from SM_Centres where Nu_Centre=" + Nu_Centre, connection);
	return (string) command.ExecuteScalar ();
	connection.Close ();
}
void Delete (Object sender, EventArgs e)
{	
	int Nu_Centre = int.Parse(Request.Params["Nu_Centre"]);
	string Centre_Type = GetCentreType(Nu_Centre);
	string Centre = "Centre";
	switch (Centre_Type)
	{
		case "H": Centre = "Hôpitaux";
				  break;
		case "P": Centre = "Pharmacies";		
				  break;
		case "M": Centre = "Matérial Médical";			
				  break;
		case "C": Centre = "Cliniques";	
				  break;					  
		}
	Functions fun = new Functions();
	fun.AddTach(Context.User.Identity.Name, "Suppression", Centre);
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("delete from SM_Centres where Nu_Centre =" + Nu_Centre, connection);
		command.ExecuteNonQuery ();
		Response.Redirect("ListCentres.aspx?Centre_Type=" + Centre_Type);
		}
	finally {
		connection.Close ();
	}
}
bool CheckCentreNu(int Nu_Centre)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from SM_Centres where Nu_Centre= " + Nu_Centre, connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return ( Nu > 0 );
	connection.Close ();
}
void Reteur (Object sender, EventArgs e)
{
	int Nu_Centre = int.Parse(Request.Params["Nu_Centre"]);
	string Centre_Type = GetCentreType(Nu_Centre);
	if (Request.Params["From"] == "Modif")
		Response.Redirect("ModifCentre.aspx?Nu_Centre=" + Nu_Centre);
	else 
		Response.Redirect("ListCentres.aspx?Centre_Type=" + Centre_Type);
}
</script>
