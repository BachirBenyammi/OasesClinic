<%@ Page%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Spécialistes</title>
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
    						<th align="left" colspan="2"><a href="../default.aspx">Accueil</a> > <a href="../SM.aspx">Services Médicaux > <a href="ListSpecialites.aspx">Spécialités</a> > <asp:Label ID="Specialite_1" Runat=server /></th>
    					<tr>
    					<td width="10"></td>
						<td>
							<br>
							<p>
								 <asp:Button CssClass="Button" Text="Nouveau" OnClick="NewSpecialiste" Runat="server" Width="60" />&nbsp;
								 <asp:Button CssClass="Button" Text="Retour" OnClick="Retour" Runat="server" Width="60" />
							</p>								
							<b><asp:Label ID="Specialite_2" Runat=server /></b><hr>
							<asp:DataGrid ID="SpecialistesGrid"  
							    HeaderStyle-CssClass="Th"
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
								 	 	<asp:BoundColumn DataField="Nom" HeaderText="Nom" />
								 	 	<asp:BoundColumn DataField="Tel" HeaderText="Téléphone" />
								 	 	<asp:BoundColumn DataField="Address" HeaderText="Adresse" /> 
								 	 	<asp:BoundColumn DataField="Ville" HeaderText="Ville" />
							 	  			<asp:TemplateColumn HeaderText="Modifier" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:HyperLink runat="server" Text="Modifier" NavigateUrl='<%# String.Format("ModifSpecialiste.aspx?Nu_Specialiste={0}", DataBinder.Eval(Container.DataItem, "Nu_Specialiste")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="Supprimer" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:HyperLink runat="server" Text="Supprimer" NavigateUrl='<%# String.Format("DeleteSpecialiste.aspx?Nu_Specialiste={0}", DataBinder.Eval(Container.DataItem, "Nu_Specialiste")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>																					
	  								</Columns>
								</asp:DataGrid>						
						</td></tr>
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
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("ListSpecialites.aspx");
}
void NewSpecialiste ( Object sender, EventArgs e)
{
	int Nu_Specialite = int.Parse(Request.Params["Nu_Specialite"]);
	Response.Redirect("NewSpecialiste.aspx?Nu_Specialite=" + Nu_Specialite);
}
</script>
