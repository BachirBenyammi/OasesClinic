<%@ Page language="c#" debug="true"%>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Ssondages</title>
		<script language="Javascript" src="script/js.js"></script>
		<link type=text/css href="css/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

    <form id="frm" runat="server">
    	<Clinique:Top id="top" runat="server" />
    	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
			<tr>
    			<td width="140" valign=top>
    				<p><Clinique:Left id="Left" runat="server" /></p>
				</td>
				
				<td width="480" valign=top>
    				<table width="100%">
    					<th align=center colspan="2">Sondages</th>
    					<tr>
    						<td width="10"></td>
    						<td>
    							<br>
								&nbsp;<asp:DataGrid ID="SondagesGrid" Runat="server" Width="90%" 
									HorizontalAlign=Center
									AutoGenerateColumns="False" 
									OnItemCommand="ViewSondage" 
									CellSpacing="1" 
									CellPadding="4" 
									GridLines=None >
									<Columns>
									 	<asp:BoundColumn DataField="Nu_Sondage" HeaderText="Nu" Visible=False/>				
										<asp:ButtonColumn ButtonType=LinkButton CommandName="View" DataTextField="Sondage" HeaderText="Sondage" />	    
										<asp:BoundColumn DataField="Nbr_Voix" HeaderText="nb. votes" />	    
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
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		SqlDataAdapter adapter = new SqlDataAdapter ("select Sondages.Nu_Sondage as Nu_Sondage, Sondage, sum(Nbr_Voix) as Nbr_Voix from Sondages,Sondages_Choix where Sondages.Nu_Sondage = Sondages_Choix.Nu_Sondage Group by Sondages.Nu_Sondage, Sondage", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		SondagesGrid.DataSource = ds;
		SondagesGrid.DataBind ();	
	}
}
void ViewSondage (Object sender, DataGridCommandEventArgs e)
{
	if (e.CommandName == "View")
		Response.Redirect ("ResultatVote.aspx?Nu_Sondage=" + e.Item.Cells[0].Text);
}
</script>
