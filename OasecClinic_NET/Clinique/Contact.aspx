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
		<title>Clinique des Oasis - Contact</title>
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
   					<th align=center>Contact</th>
   					<tr><td>
   						<br>
   						<p class="Details"><b><asp:Label ID="Output" Visible=False Runat=server /></b></p>
   						<p class="Details">
   							<table>
								<tr>
									<td>Nom: </td>
									<td>
										<asp:TextBox id="Nom" MaxLength="50" Size="50" runat="server" EnableViewState=False/>
										<asp:RequiredFieldValidator
											ControlToValidate="Nom"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />										
									</td>
								</tr>
								<tr>
									<td>Email: </td>
									<td>
										<asp:TextBox id="Email" Size=50 MaxLength="50" runat="server" EnableViewState=False/>
										<asp:RequiredFieldValidator
											ControlToValidate="Email"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />
										<asp:RegularExpressionValidator 
											ControlToValidate="Email" ValidationExpression="^[\w\.-]+@[\w-]+\.[\w\.-]+$"
											ErrorMessage="Email non valide" 
											Display="Dynamic" 
											Runat=server />
									</td>										
								</tr>
								<tr>
									<td>Tél: </td>
									<td><asp:TextBox id="Tel" MaxLength="18" Size="18" runat="server" EnableViewState=False/></td>									
								</tr>
								<tr>
									<td>Ville: </td>
									<td>
										<asp:TextBox id="Ville" MaxLength="50" Size="50" runat="server" EnableViewState=False/>
										<asp:RequiredFieldValidator
											ControlToValidate="Ville"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />										
									</td>									
								</tr>								
								<tr>
									<td>Pays: </td>
									<td>
										<asp:DropDownList ID="Payes" Runat=server EnableViewState=True/>
										<asp:RequiredFieldValidator
											ControlToValidate="Payes"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />										
									</td>									
								</tr>								
								<tr>
									<td>Sujet: </td>
									<td>
										<asp:TextBox id="Sujet" MaxLength="50" Size="50" runat="server" EnableViewState=False />
										<asp:RequiredFieldValidator
											ControlToValidate="Sujet"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />										
									</td>									
								</tr>										
								<tr>
									<td valign="top">Message:</td>
									<td>
											<asp:TextBox id="Message" MaxLength="50" TextMode="MultiLine" Columns="50" rows="7" runat="server" EnableViewState=False />
										<asp:RequiredFieldValidator
											ControlToValidate="Message"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />
									</td>																							
								</tr>
							</table>
							<p align=center><asp:Button CssClass="Button" Text="   Envoyer   " OnClick="NewContact" Runat=server /></p>
					</td></tr>
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
void Page_Load (Object sender, EventArgs e){
	if(!IsPostBack){
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		SqlDataAdapter adapter = new SqlDataAdapter ("select Code_Paye, Intituler from Payes order by Intituler", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		Payes.DataSource = ds;
		Payes.DataTextField = "Intituler";
		Payes.DataValueField = "Code_Paye";
		Payes.DataBind ();	
	}
}
void NewContact (Object sender, EventArgs e)
{	
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("NewContact", connection);
		command.CommandType = CommandType.StoredProcedure;
		command.Parameters.Add("@Nom",Nom.Text);
		command.Parameters.Add("@Tel",Tel.Text);		
		command.Parameters.Add("@Ville",Ville.Text);
		command.Parameters.Add("@Paye",Payes.Items[Payes.SelectedIndex].Value);		
		command.Parameters.Add("@Sujet",Sujet.Text);
		command.Parameters.Add("@Message",Message.Text);	
		command.Parameters.Add("@Email",Email.Text);	
		command.Parameters.Add("@Date_Heure",DateTime.Now);		
   		command.ExecuteNonQuery ();
		Output.Text = "Merci avoir posez votre message";
		Output.Visible = true;
		}
	finally {
		connection.Close ();
	}
}
</script>