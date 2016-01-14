<%@ Page%>
<%@ Import Namespace="System.Data"%>
<%@ Import Namespace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Centres Médicaux</title>
		<script language="Javascript" src="script/js.js"></script>
		<link type=text/css href="css/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
<form runat="server">
	<Clinique:Menu id="Menu" runat="server" />  
   	<Clinique:Top id="top" runat="server" />
   	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
		<tr>
   			<td width="140" valign=top>
   				<Clinique:Left id="Left" runat=server />
			</td>
			<td width="480" valign=top>
   				<table width="100%">
						<th align="left" colspan="2"><a href="SM.aspx">Services Médicaux</a> > <asp:Label ID="Centres_1" Runat=server /></th>
   					<tr>
   						<td width="10"></td>
   						<td>
   							<br>
							<b>List des <asp:Label ID="Centres_2" Runat=server /></b>
							&nbsp;<asp:DataGrid ID="CentresGrid"  
								AutoGenerateColumns="False" 
								PagerStyle-Mode="NumericPages" 
								OnPageIndexChanged="NewPage" 
								AllowPaging=True PageSize="10" 
								CellPadding="4" 
								CellSpacing="1" 
								Runat="server"  
								Width="100%"
								GridLines=None >
								    <Columns>
								 	 	<asp:BoundColumn DataField="Nu_Centre" Visible=False/>
								 	 	<asp:BoundColumn DataField="Intituler" />
								 	 	<asp:BoundColumn DataField="Tel" />
								 	 	<asp:BoundColumn DataField="Address" /> 
								 	 	<asp:BoundColumn DataField="Ville" />																				
	  								</Columns>
								</asp:DataGrid>
							<p><a href="SM.aspx">Services Médicaux</a></p>
						</td>
					</tr>
   				</table>
			</td>
			<td width="140" valign=top>
				<Clinique:Right id="Right" runat="server" />
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
		string Centre_Type = Request.Params["Centre_Type"];
		switch (Centre_Type)
		{
			case "H": Centres_1.Text = "Hôpitaux";
					  Centres_2.Text = "Hôpitaux";
					  break;
			case "P": Centres_1.Text = "Pharmacies";		
					  Centres_2.Text = "Pharmacies";	
					  break;
			case "M": Centres_1.Text = "Matérial Médical";		
					  Centres_2.Text = "Matérial Médical";	
					  break;
			case "C": Centres_1.Text = "Cliniques";	
					  Centres_2.Text = "Cliniques";
					  break;				  
		}
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Centre, Intituler, Tel, Address, Villes.Ville from SM_Centres, Villes where (Fonction='" + Centre_Type + "' and SM_Centres.Ville=Villes.Nu_Ville) order by Intituler DESC", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		CentresGrid.DataSource = ds;
		CentresGrid.DataBind ();	
	}
}
void NewPage (Object sender, DataGridPageChangedEventArgs e)
{
	CentresGrid.CurrentPageIndex = e.NewPageIndex;
	string Centre_Type = Request.Params["Centre_Type"];
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Centre, Intituler, Tel, Address, Villes.Ville from SM_Centres, Villes where (Fonction='" + Centre_Type + "' and SM_Centres.Ville=Villes.Nu_Ville) order by Intituler DESC", connection);	
	DataSet ds = new DataSet();
	adapter.Fill(ds);
	CentresGrid.DataSource = ds;
	CentresGrid.DataBind ();	
}
</script>