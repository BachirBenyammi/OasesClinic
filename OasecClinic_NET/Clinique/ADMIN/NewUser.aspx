<%@ Page%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>

<html>
	<head>
		<title>Ajouter un nouveau utilisateur</title>
		<script language="Javascript" src="../script/js.js"></script>
		<link type=text/css href="../css/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

    <form id="frm" runat="server">
    	<Clinique:Top id="top" runat="server" />
    	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
			<tr>
    			<td width="140" valign=top>
     				<p><Clinique:Left_Admin id="Left" runat="server" /></p>
				</td>			
				<td width="620" valign=top>
					<table width="100%">
						<th align="center">Ajouter un nouveau utilisateur</th>
						<tr>
							<td>
								<br>
    							<p>
    							<table>
									<tr>
										<td>Nom d'utilisateur: </td>
										<td><asp:TextBox id="Nom" MaxLength="50" Size="50" runat="server" /></td>			
										<td>
											<asp:RequiredFieldValidator 
											ControlToValidate="Nom"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />
											<asp:RegularExpressionValidator
											ControlToValidate="Nom" 
											ValidationExpression="^[\w\ \-]+$"
											Display=Dynamic Runat=server
											ErrorMessage="Le nom contient des caractères non valides" />										
										</td>												
									</tr>    							
									<tr>
										<td>Nom du compte: </td>
										<td><asp:TextBox id="Compte" MaxLength="15" Size="15" runat="server" /></td>							
										<td>
											<asp:RequiredFieldValidator 
											ControlToValidate="Compte"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />
											<asp:RegularExpressionValidator
											ControlToValidate="Compte" 
											ValidationExpression="^\w+$"
											Display=Dynamic Runat=server
											ErrorMessage="Le nom du compte contient des caractères non valides" />												
										</td>
									</tr>
									<tr>
										<td>Mot de passe: </td>
										<td><asp:Textbox id="Mot_de_passe" MaxLength="15" Size="15"  TextMode="Password" runat="server" /></td>
										<td>
											<asp:RequiredFieldValidator 
											ControlToValidate="Mot_de_passe"
											ErrorMessage="*"
											Display="dynamic"
											runat="server"  />																							
										</td>
									</tr>
									<tr>
										<td>Confirmation: </td>
										<td><asp:Textbox id="Confirm" MaxLength="15" Size="15"  TextMode="Password" runat="server" /></td>
										<td>
											<asp:RequiredFieldValidator 
											ControlToValidate="Confirm"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />		  
											<asp:CompareValidator 
											ControlToValidate="Confirm" 
											ControlToCompare="Mot_de_passe" 
											ErrorMessage="Confirmation difére de mot de passe !!"
											runat="server" />						
										</td>
									</tr>							
									<tr>
										<td>Droit d'acces: </td>
										<td>
											<asp:DropDownList id="Droit" runat="server" />
										</td>
										<td>
											<asp:RequiredFieldValidator 
											ControlToValidate="Droit"
											ErrorMessage="*"
											Display="dynamic"
											runat="server" />									
										</td>
									</tr>
								</table>
								</p>
								<p>
									<a href="ListUtilisateurs.aspx">Retour</a>
										<asp:LinkButton ID="btnNewUser" Text="Ajouter" OnClick="NewUser" runat="server" /><br>
									<asp:Label ID="Output" Runat=server />
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
void Page_Load(Object sender, EventArgs e)
{
	if (!IsPostBack) {
		Droit.Items.Add("");
		Droit.Items.Add("Secretaire");
		Droit.Items.Add("Administrateur");
		Functions fun = new Functions();
		if (fun.GetUserRole(Context.User.Identity.Name) == "Webmaster")	
			Droit.Items.Add("Directeur");			
	}
}
bool ExistUser ()
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("select count (*) from Users where Compte ='" + Compte.Text+ "'", connection);
		int count = (int) command.ExecuteScalar ();
		return (count > 0 );
		}
	finally {
		connection.Close ();
		}
}
void NewUser (Object sender, EventArgs e)
{	
	Functions fun = new Functions();
	fun.AddTach(Context.User.Identity.Name, "Insertion", "Utilisateurs");
	if(!ExistUser()){
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		try {
			connection.Open();
			SqlCommand command = new SqlCommand	("NewUser", connection);
			command.CommandType = CommandType.StoredProcedure;
			command.Parameters.Add("@Compte",Compte.Text);
			command.Parameters.Add("@Nom",Nom.Text);
			command.Parameters.Add("@Mot_de_passe",Mot_de_passe.Text);
			command.Parameters.Add("@Droit",Droit.Items[Droit.SelectedIndex].Text);
			command.Parameters.Add("@Date_Inscription",DateTime.Today);	
			command.ExecuteNonQuery ();
			Response.Redirect("ListUtilisateurs.aspx");
			}
		finally {
			connection.Close ();
		}
	}
	else
		Output.Text = "Utilisateur déja enregistrer !!";
}
</script>
