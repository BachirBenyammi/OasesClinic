<%@ Page Language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasi - Ajouter un nouveau sondage</title>
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
							<th colspan="2" align="left"><a href="default.aspx">Accueil</a> > <a href="ListSondages.aspx">Sondages</a> > Ajouter un nouveau Sondage</th>
						<tr>
							<td width="10"></td>
							<td>
								<br>
								<p>
								  	<asp:Button CssClass="Button" Text="Ajouter" OnClick="NewSondage" Runat="server" Width="60" />&nbsp;
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" CausesValidation=False Runat="server" Width="60"/>	
								</p>								
								<b>Ajouter un nouveau Sondage</b><hr> 
    							<table>
									<tr>
										<td>Sondage: </td>
										<td>
											<asp:TextBox id="Sondage" MaxLength=50 Size="50" runat="server" />&nbsp;
											<asp:RequiredFieldValidator
											ControlToValidate="Sondage"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />
										</td>
									</tr>							
									<tr>
										<td>Réponse N° 1: </td>
										<td>
											<asp:TextBox id="Answer_1" MaxLength=50 Size="50" runat="server" />&nbsp;
											<asp:RequiredFieldValidator 
											ControlToValidate="Answer_1"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />																		
										</td>																						
									</tr>
									<tr>
										<td>Réponse N° 2: </td>
										<td>
											<asp:TextBox id="Answer_2" MaxLength=50 Size="50" runat="server" />&nbsp;
											<asp:RequiredFieldValidator 
											ControlToValidate="Answer_2"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />													
										</td>																											
									</tr>
									<tr>
										<td>Réponse N° 3: </td>
										<td>
											<asp:TextBox id="Answer_3" MaxLength=50 Size="50" runat="server" />&nbsp;
											<asp:RequiredFieldValidator 
											ControlToValidate="Answer_3"
											ErrorMessage="*"
											Display="dynamic"					
											runat="server" />											
										</td>											
									</tr>
									<tr>
										<td><asp:Label ID="Reponse_4" Enabled=False Text="Réponse N° 4:" Runat=server /> </td>
										<td>
											<asp:TextBox id="Answer_4" Enabled=False MaxLength=50 Size="50" runat="server" />&nbsp;
											<asp:RequiredFieldValidator 
											ControlToValidate="Answer_4"
											ErrorMessage="*"
											Display="dynamic"
											Enabled=False
											ID="RFV_4"
											runat="server" />		
										</td>											
									</tr>
									<tr>
										<td><asp:Label ID="Reponse_5" Enabled=False Text="Réponse N° 5:" Runat=server /> </td>
										<td>
											<asp:TextBox id="Answer_5" Enabled=False MaxLength=50 Size="50" runat="server" />&nbsp;
											<asp:RequiredFieldValidator 
											ControlToValidate="Answer_5"
											ErrorMessage="*"
											Display="dynamic"
											Enabled=False
											ID="RFV_5"
											runat="server" />	
										</td>												
									</tr>
									<tr>
										<td><asp:Label ID="Reponse_6" Enabled=False Text="Réponse N° 6:" Runat=server /> </td>
										<td>
											<asp:TextBox id="Answer_6" Enabled=False MaxLength=50 Size="50" runat="server" />
											<asp:RequiredFieldValidator 
											ControlToValidate="Answer_6"
											ErrorMessage="*"
											Display="dynamic"
											Enabled=False
											ID="RFV_6"
											runat="server" />													
										</td>
									</tr>
									<tr>
										<td colspan="2" align=center>Réponses :
											<asp:RadioButtonList 
												ID="Choix" 
												Runat=server 
												AutoPostBack=True 
												RepeatDirection=Horizontal 
												OnSelectedIndexChanged="ChangedChoix" >
												<asp:ListItem Text="3" Selected />
												<asp:ListItem Text="4" />
												<asp:ListItem Text="5" />
												<asp:ListItem Text="6" />
											</asp:RadioButtonList>
										</td>
									</tr>																																																
									</table>
									</p>
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
void NewSondage (Object sender, EventArgs e)
{	
	Functions fun = new Functions();
	fun.AddTach(Context.User.Identity.Name, "Insertion", "Sondages");
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("insert into Sondages (Sondage) values ('" + Sondage.Text + "')", connection);
   		command.ExecuteNonQuery ();
   		int Nu_Sondage = GetSondagesNu(Sondage.Text);
   			SqlCommand cmd_1 = new SqlCommand ("insert into Sondages_Choix (Choix, Nu_Sondage, Choix_Nu) values ('" + Answer_1.Text + "'," + Nu_Sondage + "," + 1 + ")", connection);
   		cmd_1.ExecuteNonQuery ();
   			SqlCommand cmd_2 = new SqlCommand ("insert into Sondages_Choix (Choix, Nu_Sondage, Choix_Nu) values ('" + Answer_2.Text + "'," + Nu_Sondage + "," + 2 + ")", connection);
   		cmd_2.ExecuteNonQuery ();
			SqlCommand cmd_3 = new SqlCommand ("insert into Sondages_Choix (Choix, Nu_Sondage, Choix_Nu) values ('" + Answer_3.Text + "'," + Nu_Sondage + "," + 3 + ")", connection);
	  	cmd_3.ExecuteNonQuery ();
   		if (Answer_4.Enabled = true){
	   			SqlCommand cmd_4 = new SqlCommand ("insert into Sondages_Choix (Choix, Nu_Sondage, Choix_Nu) values ('" + Answer_3.Text + "'," + Nu_Sondage + "," + 4 + ")", connection);
   			cmd_4.ExecuteNonQuery ();
   		}
   		if (Answer_5.Enabled = true){
	   			SqlCommand cmd_5 = new SqlCommand ("insert into Sondages_Choix (Choix, Nu_Sondage, Choix_Nu) values ('" + Answer_3.Text + "'," + Nu_Sondage + "," + 5 + ")", connection);
   			cmd_5.ExecuteNonQuery ();
   		}
   		if (Answer_6.Enabled = true){
	   			SqlCommand cmd_6 = new SqlCommand ("insert into Sondages_Choix (Choix, Nu_Sondage, Choix_Nu) values ('" + Answer_3.Text + "'," + Nu_Sondage + "," + 6 + ")", connection);
   			cmd_6.ExecuteNonQuery ();
   		}
		Response.Redirect("ListSondages.aspx");
		}
	finally {
		connection.Close ();
	}
}
short GetSondagesNu (string Sondage)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open ();
		SqlCommand command = new SqlCommand("select Nu_Sondage from Sondages where Sondage = '" + Sondage + "'", connection);
		short Nu_Sondage = (short) (command.ExecuteScalar ());
		return Nu_Sondage;
	}
	finally {
		connection.Close ();
	}
}
void ChangedChoix(Object sender, EventArgs e)
{
	switch (Choix.SelectedIndex)
	{
		case 0:
			Reponse_4.Enabled = false;
			Answer_4.Enabled = false;
			RFV_4.Enabled = false;
			Reponse_5.Enabled = false;
			Answer_5.Enabled = false;
			RFV_5.Enabled = false;
			Reponse_6.Enabled = false;
			Answer_6.Enabled = false;
			RFV_6.Enabled = false;
			break;	
		case 1:
			Reponse_4.Enabled = true;
			Answer_4.Enabled = true;
			RFV_4.Enabled = true;	
			Reponse_5.Enabled = false;
			Answer_5.Enabled = false;
			RFV_5.Enabled = false;
			Reponse_6.Enabled = false;
			Answer_6.Enabled = false;	
			RFV_6.Enabled = false;			
			break;
		case 2:
			Reponse_4.Enabled = true;
			Answer_4.Enabled = true;
			RFV_4.Enabled = true;				
			Reponse_5.Enabled = true;
			Answer_5.Enabled = true;
			RFV_5.Enabled = true;
			Reponse_6.Enabled = false;
			Answer_6.Enabled = false;	
			RFV_6.Enabled = false;			
			break;											
		case 3:
			Reponse_4.Enabled = true;
			Answer_4.Enabled = true;
			RFV_4.Enabled = true;	
			Reponse_5.Enabled = true;
			Answer_5.Enabled = true;
			RFV_5.Enabled = true;
			Reponse_6.Enabled = true;
			Answer_6.Enabled = true;	
			RFV_6.Enabled = true;			
			break;
	}
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("ListSondages.aspx");
}</script>
