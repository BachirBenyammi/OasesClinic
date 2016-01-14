<%@ Page%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Livre d'or</title>
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
   					<th align=center colspan="2">Livre d'or</th>
   					<tr>
   						<td width="10"></td>
   						<td>
   							<br>
   							<p class="Details"><b><asp:Label ID="Add" Visible=False Runat=server /></b></p>	
   							<p class="Details">
   								<table cellspacing="0" cellpadding="0" width="90%" align=center>
   									<asp:Repeater
   										ID="OrTable"   
										Runat="server">
										<ItemTemplate>
											<tr>
												<td>
													<p>
															<b>Nom:</b> <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Nom")%>' /><br>
															<b>Email:</b> <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Email")%>' />
													</p>
													<p>
														<b>Commentaire:</b><br>
															<asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Details")%>' />
													</p>
													<p align=right>
															<b>Date:</b> <asp:Label runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Date_Heure", "{0:d}") %>' />
														<hr>														
													</p>	
												</td>
											</tr>									
										</ItemTemplate>
									</asp:Repeater>
								</table>
   							</p>
   							<p class="Details">
   							   	<table width="90%" align=center cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<p align=center><b>Ajouter votre signature</b></p>
											<p>
												Nom: <br>
												<asp:TextBox id="Nom" MaxLength="50" Size="50" runat="server" />
												<asp:RequiredFieldValidator
												ControlToValidate="Nom"
												ErrorMessage="*"
												Display="dynamic"
												runat="server" />										
											</p>
											<p>
												Email: <br>
												<asp:TextBox id="Email" Size=50 MaxLength="50" runat="server" />
												<asp:RequiredFieldValidator
													ControlToValidate="Email"
													ErrorMessage="*"
													Display="dynamic"
													runat="server" /><br>
												<asp:RegularExpressionValidator 
													ControlToValidate="Email" ValidationExpression="^[\w\.-]+@[\w-]+\.[\w\.-]+$"
													ErrorMessage="Email non valide" 
													Display="Dynamic" 
													Runat=server />
											</p>
											<p>
												Commentaire:<br>
												<asp:TextBox id="Details" TextMode="MultiLine" Columns="50" rows="7" runat="server" />
												<asp:RequiredFieldValidator
													ControlToValidate="Details"
													ErrorMessage="*"
													Display="dynamic"
													runat="server" /><br>			
												<asp:RegularExpressionValidator
													ControlToValidate="Details" 											
													ValidationExpression="^(.|\n){1,1000}$"
													Display=Dynamic Runat=server
													ErrorMessage="Le Commentaire doit pas passer 1000 caractéres " />												
											</p>
											<p align=center>
												<asp:Button CssClass="Button" Text="   Ajouter   " OnClick="NewSignature" Runat=server />
											</p>
											<br>
										</td>												
									</tr>																								
								</table>   							
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
<script runat="server">
void Page_Load(Object sender, EventArgs e)
{
	if (!IsPostBack) {
		if (Request.Params["From"] == "Signe"){
			Add.Text = "Merci d'avoir signez dans notre livre d'or";
			Add.Visible = true;
		}	
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Signature, Nom, Date_Heure, Details, Email from Signatures order by Date_Heure DESC", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		OrTable.DataSource = ds;
		OrTable.DataBind ();	
	}
}
void NewSignature (Object sender, EventArgs e)
{	
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("NewSignature", connection);
		command.CommandType = CommandType.StoredProcedure;
		command.Parameters.Add("@Nom",Nom.Text);
		command.Parameters.Add("@Details",Details.Text);	
		command.Parameters.Add("@Email",Email.Text);	
		command.Parameters.Add("@Date_Heure",DateTime.Today);			
   		command.ExecuteNonQuery ();
		Response.Redirect("Livredor.aspx?From=Signe");
		}
	finally {
		connection.Close ();
	}
}
</script>