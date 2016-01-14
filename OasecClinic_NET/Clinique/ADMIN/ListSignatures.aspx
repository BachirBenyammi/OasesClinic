<%@ Page%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Signatures</title>
		<script language="Javascript" src="../script/js.js"></script>
		<link type=text/css href="../css/style.css" rel=stylesheet>
	</head>		
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

    <form id="frmListSignatures" runat="server">
    	<Clinique:Top id="top" runat="server" />
    	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
			<tr>
    			<td width="140" valign=top>
    				<p><!-- Left --></p>
    				<p><Clinique:Left_Admin id="Left" runat="server" /></p>
				</td>
				
				<td width="620" valign=top>
    				<table width="100%">
    					<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > Signatures</th>
						<tr>
							<td width="10"></td>
							<td>
								<br>
							   	<p>
									<asp:Button CssClass="Button" Text="Retour" OnClick="RetourDefaultPage" Runat="server" Width="60" />						
								</p>
								<b>List des signatures</b><hr>
								<asp:DataGrid ID="SignaturesGrid" Runat="server" Width="100%"
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
								 		<asp:BoundColumn DataField="Nu_Signature" HeaderText="Nu_Signature"  Visible=False/>		
										 <asp:TemplateColumn HeaderText="Nom">
											<ItemTemplate>
													<asp:HyperLink runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Nom")%>' NavigateUrl='<%# String.Format("ViewSignature.aspx?Nu_Signature={0}", DataBinder.Eval(Container.DataItem, "Nu_Signature")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>												
										<asp:BoundColumn DataField="Email" HeaderText="Email" />
										<asp:BoundColumn DataField="Date_Heure" HeaderText="Date" DataFormatString="{0:d}" />
									 		<asp:TemplateColumn HeaderText="Voir" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:HyperLink runat="server" Text="Voir" NavigateUrl='<%# String.Format("ViewSignature.aspx?Nu_Signature={0}", DataBinder.Eval(Container.DataItem, "Nu_Signature")) %>' />
											</ItemTemplate>
										</asp:TemplateColumn>
											<asp:TemplateColumn HeaderText="Supprimer" HeaderStyle-HorizontalAlign=Right ItemStyle-HorizontalAlign=Right>
											<ItemTemplate>
													<asp:HyperLink runat="server" Text="Supprimer" NavigateUrl='<%# String.Format("DeleteSignature.aspx?Nu_Signature={0}", DataBinder.Eval(Container.DataItem, "Nu_Signature")) %>' />
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
		SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Signature, Nom, Email, Date_Heure from Signatures order by Date_Heure DESC", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		SignaturesGrid.DataSource = ds;
		SignaturesGrid.DataBind ();	
	}
}
void NewPage (Object sender, DataGridPageChangedEventArgs e)
{
	SignaturesGrid.CurrentPageIndex = e.NewPageIndex;
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Signature, Nom, Email, Date_Heure from Signatures order by Date_Heure DESC", connection);	
	DataSet ds = new DataSet();
	adapter.Fill(ds);
	SignaturesGrid.DataSource = ds;
	SignaturesGrid.DataBind ();	
}
void RetourDefaultPage ( Object sender, EventArgs e)
{
	Response.Redirect("default.aspx");
}
</script>
