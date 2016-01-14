<%@ Page%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Spécialistes</title>
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
    					<th align="left" colspan="2"><a href="SM.aspx">Services Médicaux > <a href="Specialites.aspx">Spécialités</a> > <asp:Label ID="Specialite_1" Runat=server /></th>
   					<tr>
   						<td>
   							<br>
							<b><asp:Label ID="Specialite_2" Runat=server /></b>
							&nbsp;<asp:DataGrid ID="SpecialistesGrid"  
							    ItemStyle-CssClass="Td"
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
								 	 	<asp:BoundColumn DataField="Nu_Specialiste" Visible=False/>
								 	 	<asp:BoundColumn DataField="Nom" />
								 	 	<asp:BoundColumn DataField="Tel"/>
								 	 	<asp:BoundColumn DataField="Address" /> 
								 	 	<asp:BoundColumn DataField="Ville" />																				
	  								</Columns>
								</asp:DataGrid></td>
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
		int Nu_Specialite = int.Parse(Request.Params["Nu_Specialite"]);
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		connection.Open();
		SqlCommand command = new SqlCommand	("select Intituler from SM_Specialites where Nu_Specialite=" + Nu_Specialite, connection);
		Specialite_1.Text = (string) command.ExecuteScalar ();
		Specialite_2.Text = Specialite_1.Text;
		connection.Close ();
	
		connection.Open();
		SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Specialiste, Nom, Tel, Address, Villes.Ville from SM_Specialistes, Villes where (Specialite='" + Nu_Specialite + "' and SM_Specialistes.Ville=Villes.Nu_Ville) order by SM_Specialistes.Ville", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		SpecialistesGrid.DataSource = ds;
		SpecialistesGrid.DataBind ();	
	}
}
void NewPage (Object sender, DataGridPageChangedEventArgs e)
{
	SpecialistesGrid.CurrentPageIndex = e.NewPageIndex;
	int Nu_Specialite = int.Parse(Request.Params["Nu_Specialite"]);
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Specialiste, Nom, Tel, Address, Villes.Ville from SM_Specialistes, Villes where (Specialite='" + Nu_Specialite + "' and SM_Specialistes.Ville=Villes.Nu_Ville) order by SM_Specialistes.Ville", connection);	
	DataSet ds = new DataSet();
	adapter.Fill(ds);
	SpecialistesGrid.DataSource = ds;
	SpecialistesGrid.DataBind ();	
}
</script>