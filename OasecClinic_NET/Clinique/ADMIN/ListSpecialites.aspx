<%@ Page%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>

<html>
	<head>
		<title>CLinique des Oasis - Spécialités</title>
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
    					<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > Spécialités</th>
						<tr>
							<td width=10 rowspan="2"></td>
							<td>
								<br>
								<p>
							    	   <asp:Button CssClass="Button" Text="Nouveau" OnClick="NewSpecialite" Runat="server" Width="60" />&nbsp;
							    	<asp:Button CssClass="Button" Text="Retour" OnClick="RetourDefaultPage" Runat="server" Width="60" />
								</p>								
								<b>List des spécialités</b><hr>
								<asp:DataGrid ID="SpecialitesGrid" 
								Runat="server" 
								Width="100%" 
								HeaderStyle-CssClass="Th" 
								ItemStyle-CssClass="Td"
								AutoGenerateColumns="False" 
								PagerStyle-Mode="NumericPages" 
								OnPageIndexChanged="NewPage" 
								AllowPaging=True PageSize="10"
								CellSpacing="1" 
								CellPadding="4" 
								GridLines=None >								 
								    <Columns>
								    	<asp:BoundColumn DataField="Nu_Specialite" HeaderText="Nu_Specialite"  Visible=False/>
								    	<asp:TemplateColumn HeaderText="Intituler">
											<ItemTemplate>
													<asp:HyperLink Text='<%# DataBinder.Eval(Container.DataItem, "Intituler")%>' NavigateUrl='<%# String.Format("ViewSpecialite.aspx?Nu_Specialite={0}", DataBinder.Eval(Container.DataItem, "Nu_Specialite")) %>' Runat=server />
											</ItemTemplate>
										</asp:TemplateColumn>
							 	  			<asp:TemplateColumn HeaderText="Voir" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:HyperLink runat="server" Text="Voir" NavigateUrl='<%# String.Format("ViewSpecialite.aspx?Nu_Specialite={0}", DataBinder.Eval(Container.DataItem, "Nu_Specialite")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>
							 	  			<asp:TemplateColumn HeaderText="Modifier" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:HyperLink runat="server" Text="Modifier" NavigateUrl='<%# String.Format("ModifSpecialite.aspx?Nu_Specialite={0}", DataBinder.Eval(Container.DataItem, "Nu_Specialite")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="Supprimer" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:HyperLink runat="server" Text="Supprimer" NavigateUrl='<%# String.Format("DeleteSpecialite.aspx?Nu_Specialite={0}", DataBinder.Eval(Container.DataItem, "Nu_Specialite")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>	
									</Columns>
								</asp:DataGrid>
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
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Specialite, Intituler from Specialites order by Intituler", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		SpecialitesGrid.DataSource = ds;
		SpecialitesGrid.DataBind ();	
	}
}
void NewPage (Object sender, DataGridPageChangedEventArgs e)
{
	SpecialitesGrid.CurrentPageIndex = e.NewPageIndex;
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Specialite, Intituler  from Specialites order by Intituler", connection);	
	DataSet ds = new DataSet();
	adapter.Fill(ds);
	SpecialitesGrid.DataSource = ds;
	SpecialitesGrid.DataBind ();	
}
void RetourDefaultPage ( Object sender, EventArgs e)
{
	Response.Redirect("default.aspx");
}
void NewSpecialite ( Object sender, EventArgs e)
{
	Response.Redirect("NewSpecialite.aspx");
}
</script>
