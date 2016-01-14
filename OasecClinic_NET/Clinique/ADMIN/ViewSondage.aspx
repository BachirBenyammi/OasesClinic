<%@ Page Language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Voir un sondage</title>
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
    						<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > <a href="ListSondages.aspx">Sondages</a> > Voir un Sondage</th>
						<tr>
							<td width="10"></td>
							<td>
								<br>
								<p>
									<asp:Button CssClass="Button" Text="Supprimer" OnClick="DeleteSondage" Runat="server" Width="60" />&nbsp;	
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" Runat="server" Width="60" />
								</p>									
								<p>
										<b><asp:label id="Sondage" runat="server" /> (<asp:label id="Nbr_Voix_Total" runat="server" /> votes)</b><br>
								</p>
									<asp:DataGrid ID="SondageGrid" 							
									ItemStyle-CssClass="Td"
									AutoGenerateColumns=False Runat=server
									CellSpacing="1" 
									CellPadding="4" 
									GridLines=None
									width="100%"  >
										<Columns>
											<asp:BoundColumn DataField="Choix" />
											<asp:TemplateColumn>
												<ItemTemplate>
														<img src="../images/sondage.gif" width='<%# DataBinder.Eval (Container.DataItem, "Pourcentage") %>%' height="8">
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
			Response.Redirect("../ErreurPage.aspx");
	}
}
void DeleteSondage ( Object sender, EventArgs e)
{
	int Nu_Sondage = int.Parse(Request.Params["Nu_Sondage"]);
	Response.Redirect("DeleteSondage.aspx?From=View&Nu_Sondage=" + Nu_Sondage);
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
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("ListSondages.aspx");
}
</script>