<%@ Page language="c#" debug="true"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Spécialités</title>
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
   						<th colspan="2" align=left><a href="Presentation.aspx">Présentation</a> > Spécialités</th>
   					<tr>
   						<td width="10"></td>
   						<td>
   							<br>
   							La CLINIQUE des OASIS assurée les spécialités suivantes:
							<asp:DataGrid ID="SpecialitesGrid" Runat="server" Width="100%" 
								AutoGenerateColumns="False"   
								CellSpacing="1" 
								CellPadding="4" 
								GridLines=None >								 
								    <Columns>
							   	 		<asp:BoundColumn DataField="Nu_Specialite"  Visible=False/>
										<asp:TemplateColumn>
											<ItemTemplate>
												<asp:HyperLink runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Intituler")%>' NavigateUrl='<%# String.Format("AfficheSpecialite.aspx?Nu_Specialite={0}", DataBinder.Eval(Container.DataItem, "Nu_Specialite")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>   
			  						</Columns>
							</asp:DataGrid>
							<p class="Details"><a href="Presentation.aspx">Présentation</a></p>
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
		SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Specialite, Intituler from Specialites order by Intituler", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		SpecialitesGrid.DataSource = ds;
		SpecialitesGrid.DataBind ();	
	}
}
</script>