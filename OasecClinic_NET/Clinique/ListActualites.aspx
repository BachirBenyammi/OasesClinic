<%@ Page Language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Actualités</title>
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
    				<p><Clinique:Left id="Left" runat="server" /></p>
				</td>
				
				<td width="480" valign=top>
    				<table width="100%">
    						<th align=left colspan="2"><a href="Presentation.aspx">Présentation</a> > Actualités</th>
						<tr>
							<td width=10 rowspan="2"></td>
							<td>
								<br>
								<p>
									<b>Actualités:</b>		
									</p>
									<asp:DataGrid ID="NewsGrid" 
										Runat="server" 
										width="100%"							
										AutoGenerateColumns="False" 
										PagerStyle-Mode="NumericPages" 
										OnPageIndexChanged="newpage" 
										AllowPaging=True 
										PageSize="10" 
										CellSpacing="1" 
										CellPadding="4" 
										GridLines=None>								 
								   		<Columns>
							 	 			<asp:BoundColumn DataField="Nu_News" Visible=False/>
							 	 			<asp:TemplateColumn>
							 	 				<ItemTemplate>
							 	 					<img src="images/news.gif" align=absmiddle>
							 	 						<asp:HyperLink runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Titre")%>' NavigateUrl='<%# String.Format("AfficheActualite.aspx?Nu_News={0}", DataBinder.Eval(Container.DataItem, "Nu_News")) %>' />
							 	 				</ItemTemplate>
							 	 			</asp:TemplateColumn>  
									  		<asp:BoundColumn DataField="Date_Heure" DataFormatString="{0:d}" />
		  								</Columns>
									</asp:DataGrid>
								<p>
									<b>Historiques:</b>								
									</p>
									<asp:DataGrid ID="HistoricGrid" 
										Runat="server" 
										width="100%"							
										AutoGenerateColumns="False" 
										PagerStyle-Mode="NumericPages" 
										OnPageIndexChanged="NewPage" 
										AllowPaging=True 
										PageSize="10" 
										CellSpacing="1" 
										CellPadding="4" 
										GridLines=None>								 
							   			<Columns>
						 	 				<asp:BoundColumn DataField="Nu_News" HeaderText="Nu_News"  Visible=False/>
						 	 				<asp:TemplateColumn>
						 	 					<ItemTemplate>
						 	 						<img src="images/news.gif" align=absmiddle>
						 	 							<asp:HyperLink runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Titre")%>' NavigateUrl='<%# String.Format("AfficheActualite.aspx?Nu_News={0}", DataBinder.Eval(Container.DataItem, "Nu_News")) %>' />
						 	 					</ItemTemplate>
						 	 				</asp:TemplateColumn>  
									  		<asp:BoundColumn DataField="Date_Heure" DataFormatString="{0:d}" />
	  									</Columns>
									</asp:DataGrid>	
								<p><a href="Presentation.aspx">Présentation</a></p>							
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
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_News, Titre, Date_Heure from News where year(Date_Heure)="+DateTime.Now.Year.ToString()+" order by Date_Heure DESC", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		NewsGrid.DataSource = ds;
		NewsGrid.DataBind ();
		connection.Close();
		connection.Open();	
		SqlDataAdapter Adapter = new SqlDataAdapter ("select Nu_News, Titre, Date_Heure from News where year(Date_Heure)<>"+DateTime.Now.Year.ToString()+" order by Date_Heure DESC", connection);	
		DataSet Ds = new DataSet();
		Adapter.Fill(Ds);
		HistoricGrid.DataSource = Ds;
		HistoricGrid.DataBind ();		
	}
}
void newpage (Object sender, DataGridPageChangedEventArgs e)
{
	NewsGrid.CurrentPageIndex = e.NewPageIndex;
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_News, Titre, Date_Heure from News where year(Date_Heure)="+DateTime.Now.Year.ToString()+" order by Date_Heure DESC", connection);	
	DataSet ds = new DataSet();
	adapter.Fill(ds);
	NewsGrid.DataSource = ds;
	NewsGrid.DataBind ();	
}
void NewPage (Object sender, DataGridPageChangedEventArgs e)
{
	HistoricGrid.CurrentPageIndex = e.NewPageIndex;
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_News, Titre, Date_Heure from News where year(Date_Heure)<>"+DateTime.Now.Year.ToString()+" order by Date_Heure DESC", connection);	
	DataSet ds = new DataSet();
	adapter.Fill(ds);
	HistoricGrid.DataSource = ds;
	HistoricGrid.DataBind ();			
}
</script>
