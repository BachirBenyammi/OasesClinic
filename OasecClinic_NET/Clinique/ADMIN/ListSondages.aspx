<%@ Page Language="c#" debug="true"%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Sondages</title>
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
    					<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > Sondages</th>
    					<tr>
    						<td width="10"></td>
    						<td>
    							<br>
								<p>
									 <asp:Button CssClass="Button" Text="Nouveau" OnClick="NewSondage" Runat="server" Width="60" />&nbsp;
									 <asp:Button CssClass="Button" Text="Retour" OnClick="RetourDefaultPage" Runat="server" Width="60" />
								</p>	    							
    							<b>List des Sondages</b><hr>
								<asp:DataGrid ID="SondagesGrid" Runat="server" 
									HeaderStyle-CssClass="Th" 
									ItemStyle-CssClass="Td"
									AutoGenerateColumns="False" 
									PagerStyle-Mode="NumericPages" 
									OnPageIndexChanged="NewPage" 
									AllowPaging=True PageSize="10" 
									CellSpacing="1" 
									CellPadding="4" 
									GridLines=None
									Width="100%" >
										<Columns>
										 	<asp:BoundColumn DataField="Nu_Sondage" Visible=False/>
									 	 	<asp:TemplateColumn HeaderText="Sondage">
												<ItemTemplate>
														<asp:HyperLink runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Sondage")%>' NavigateUrl='<%# String.Format("ViewSondage.aspx?Nu_Sondage={0}", DataBinder.Eval(Container.DataItem, "Nu_Sondage")) %>' />
												</ItemTemplate>
											</asp:TemplateColumn>											 					   
											<asp:BoundColumn DataField="Nbr_Voix" HeaderText="nb. votes" />	    
								 	  			<asp:TemplateColumn HeaderText="Voir" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
												<ItemTemplate>
														<asp:HyperLink runat="server" Text="Voir" NavigateUrl='<%# String.Format("ViewSondage.aspx?Nu_Sondage={0}", DataBinder.Eval(Container.DataItem, "Nu_Sondage")) %>' />
												</ItemTemplate>
											</asp:TemplateColumn>
												<asp:TemplateColumn HeaderText="Supprimer" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
												<ItemTemplate>
														<asp:HyperLink runat="server" Text="Supprimer" NavigateUrl='<%# String.Format("DeleteSondage.aspx?Nu_Sondage={0}", DataBinder.Eval(Container.DataItem, "Nu_Sondage")) %>' />
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
		SqlDataAdapter adapter = new SqlDataAdapter ("select Sondages.Nu_Sondage as Nu_Sondage, Sondage, sum(Nbr_Voix) as Nbr_Voix from Sondages,Sondages_Choix where Sondages.Nu_Sondage = Sondages_Choix.Nu_Sondage Group by Sondages.Nu_Sondage, Sondage order by sum(Nbr_Voix) DESC", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		SondagesGrid.DataSource = ds;
		SondagesGrid.DataBind ();	
	}
}
void NewPage (Object sender, DataGridPageChangedEventArgs e)
{
	SondagesGrid.CurrentPageIndex = e.NewPageIndex;
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		SqlDataAdapter adapter = new SqlDataAdapter ("select Sondages.Nu_Sondage as Nu_Sondage, Sondage, sum(Nbr_Voix) as Nbr_Voix from Sondages,Sondages_Choix where Sondages.Nu_Sondage = Sondages_Choix.Nu_Sondage Group by Sondages.Nu_Sondage, Sondage order by sum(Nbr_Voix) DESC", connection);
	DataSet ds = new DataSet();
	adapter.Fill(ds);
	SondagesGrid.DataSource = ds;
	SondagesGrid.DataBind ();	
}
void RetourDefaultPage ( Object sender, EventArgs e)
{
	Response.Redirect("default.aspx");
}
void NewSondage ( Object sender, EventArgs e)
{
	Response.Redirect("NewSondage.aspx");
}
</script>
