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
		<title>Clinique des Oasis - Résultat d'un sondage</title>
		<script language="Javascript" src="script/js.js"></script>
		<link type=text/css href="css/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
<form runat="server" id="frm"> 
	<Clinique:Menu id="Menu" runat="server" />  
 
   	<Clinique:Top id="top" runat="server" />
   	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
		<tr>
   			<td width="140" valign=top>
   				<Clinique:Left id="Left" runat=server />
			</td>
			<td width="480" valign=top>
			<span id="sp">
   				<table width="100%">
   					<th align=left colspan="2"><a href="ListSondages.aspx">Sondages</a> > Résultat</th>
   					<tr>
   						<td width="10"></td>
   						<td>
   							<br>
								<p>
										<asp:label id="Sondage" runat="server" /> <b>(<asp:label id="Nbr_Voix_Total" runat="server" /> votes)</b><br>
								</p>
									<asp:DataGrid ID="SondageGrid" Width="90%" Runat=server
										HorizontalAlign=Center
										AutoGenerateColumns=False 
										CellSpacing="1" 
										CellPadding="4" 
										GridLines=None >
										<Columns>
											<asp:BoundColumn DataField="Choix" />
											<asp:TemplateColumn>
												<ItemTemplate>
														<img src="images/sondage.gif" width='<%# DataBinder.Eval (Container.DataItem, "Pourcentage") %>%' height="8">
													(<%# DataBinder.Eval (Container.DataItem, "Pourcentage", "{0:f2}") %>%)	
												</ItemTemplate>
											</asp:TemplateColumn>
											<asp:TemplateColumn>
												<ItemTemplate>
													<%# DataBinder.Eval (Container.DataItem, "Nbr_Voix") %> votes
												</ItemTemplate>								
											</asp:TemplateColumn>									
										</Columns>
									</asp:DataGrid>	
								<p>
								<a href="ListSondages.aspx">Sondages</a>
								</p>
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
<script runat=server>
void Page_Load(Object sender, EventArgs e)
{
	if (!IsPostBack) {
		int Nu_Sondage = int.Parse(Request.Params["Nu_Sondage"]);
		if (CheckNu(Nu_Sondage)) {
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlCommand cmd_1 = new SqlCommand	("select Sondage, sum (Nbr_Voix) as Nbr_Voix from Sondages, Sondages_Choix where (Sondages.Nu_Sondage = " + Nu_Sondage + ") and (Sondages.Nu_Sondage = Sondages_Choix.Nu_Sondage) group by Sondage", connection);										
			SqlDataReader readerdata = cmd_1.ExecuteReader ();
			while (readerdata.Read ()) {
				Sondage.Text = readerdata["Sondage"].ToString();
				Nbr_Voix_Total.Text = readerdata["Nbr_Voix"].ToString();
			}
			connection.Close ();
			int Percentage = int.Parse(Nbr_Voix_Total.Text);
			if (Percentage <= 0)
				Percentage = 100;
			connection.Open ();	
				SqlCommand command= new SqlCommand ("select Choix, Nbr_Voix, ((Nbr_Voix *100.00)/" + Percentage + ")  as Pourcentage from Sondages_Choix where Nu_Sondage = " + Nu_Sondage, connection);
			SqlDataReader reader = command.ExecuteReader ();
			SondageGrid.DataSource = reader;
			SondageGrid.DataBind ();
			connection.Close ();
		}
		else
			Response.Redirect("ErreurPage.aspx");
	}
}
bool CheckNu(int Nu_Sondage)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd_Sondage = new SqlCommand("select count (*) from Sondages where Nu_Sondage = " + Nu_Sondage, connection);
	int NuSondage = (int) cmd_Sondage .ExecuteScalar ();
	connection.Close ();
	connection.Open ();
	SqlCommand cmd_Choix = new SqlCommand("select count (*) from Sondages_Choix where Nu_Sondage = " + Nu_Sondage, connection);
	int NuChoix = (int) cmd_Choix .ExecuteScalar ();
	connection.Close ();
	return (( NuSondage > 0 ) && ( NuChoix > 0 ));
}
</script>