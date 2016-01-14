<%@ Page%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Actualités</title>
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
    					<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > Actualités</th>
    					<tr>
    					<td width="10"></td>
						<td>
							<br>
							<p>
								 <asp:Button CssClass="Button" Text="Nouveau" OnClick="NewNews" Runat="server" Width="60" />&nbsp;
								 <asp:Button CssClass="Button" Text="Retour" OnClick="RetourDefaultPage" Runat="server" Width="60" />
							</p>								
							<b>List des Actualités</b><hr>
							<asp:DataGrid ID="NewsGrid"  
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
								 	 	<asp:BoundColumn DataField="Nu_News" Visible=False/>
								 	 	<asp:TemplateColumn HeaderText="Titre">
											<ItemTemplate>
													<asp:HyperLink runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Titre")%>' NavigateUrl='<%# String.Format("ViewNews.aspx?Nu_News={0}", DataBinder.Eval(Container.DataItem, "Nu_News")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>	 
							 	  		<asp:BoundColumn HeaderText="Date" DataField="Date_Heure" DataFormatString="{0:d}" /> 
								 	 	<asp:TemplateColumn HeaderText="Rédacteur">
											<ItemTemplate>
													<asp:HyperLink runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Redacteur")%>' NavigateUrl='<%# String.Format("mailto:{0}", DataBinder.Eval(Container.DataItem, "Email")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>	 							 	  		   
							 	  			<asp:TemplateColumn HeaderText="Voir" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:HyperLink runat="server" Text="Voir" NavigateUrl='<%# String.Format("ViewNews.aspx?Nu_News={0}", DataBinder.Eval(Container.DataItem, "Nu_News")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>
							 	  			<asp:TemplateColumn HeaderText="Modifier" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:HyperLink runat="server" Text="Modifier" NavigateUrl='<%# String.Format("ModifNews.aspx?Nu_News={0}", DataBinder.Eval(Container.DataItem, "Nu_News")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="Supprimer" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:HyperLink runat="server" Text="Supprimer" NavigateUrl='<%# String.Format("DeleteNews.aspx?Nu_News={0}", DataBinder.Eval(Container.DataItem, "Nu_News")) %>' />
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
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_News, Titre, Date_Heure, Redacteur, Email from News order by Date_Heure DESC", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		NewsGrid.DataSource = ds;
		NewsGrid.DataBind ();	
	}
}
void NewPage (Object sender, DataGridPageChangedEventArgs e)
{
	NewsGrid.CurrentPageIndex = e.NewPageIndex;
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_News, Titre, Date_Heure, Redacteur, Email from News order by Date_Heure DESC", connection);	
	DataSet ds = new DataSet();
	adapter.Fill(ds);
	NewsGrid.DataSource = ds;
	NewsGrid.DataBind ();	
}
void RetourDefaultPage ( Object sender, EventArgs e)
{
	Response.Redirect("default.aspx");
}
void NewNews ( Object sender, EventArgs e)
{
	Response.Redirect("NewNews.aspx");
}
</script>
