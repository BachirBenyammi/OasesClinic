<%@ Page Language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Ajouter un nouvel évènement</title>
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
							<th colspan="2" align="left"><a href="default.aspx">Accueil</a> > <a href="ListNews.aspx">Actualités</a> > Ajouter un nouvel évènement</th>
						<tr>
							<td width="10"></td>
							<td>
								<br>
								<p>
								  	<asp:Button CssClass="Button" Text="Ajouter" OnClick="NewNews" Runat="server" Width="60" />&nbsp;
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" CausesValidation=False Runat="server" Width="60"/>	
								</p>								
   									<b>Ajouter un nouveau évènement</b><hr>    							
    								<table>
										<tr>										
											<td>Titre: </td>
											<td>
												<asp:TextBox id="Titre" Size=50 MaxLength="50" runat="server" />
												<asp:RequiredFieldValidator
												ControlToValidate="Titre"
												ErrorMessage="*"
												Display="dynamic"
												runat="server" />										
											</td>
										<tr>
											<td>Photo: </td>
											<td><input id="Photo" Type="file" Size="50" name="Photo" runat="server"></td>											
										</tr>	
										<tr>
											<td valign="top">Détails:</td>
											<td>
													<asp:TextBox id="Details" TextMode="MultiLine" Wrap=false Columns="50" rows="7" runat="server" />
												<asp:RequiredFieldValidator
												ControlToValidate="Details"
												ErrorMessage="*"
												Display="dynamic"
												runat="server" />	
											</td>
										</tr>
										<tr>
											<td></td>
											<td>							
												<asp:RegularExpressionValidator
												ControlToValidate="Details" 
												ValidationExpression="^(.|\n){1,1000}$"
												Display=Dynamic Runat=server
												ErrorMessage="Les détails doit etre pas passer 1000 caractéres " />												
											</td>												
										</tr>			
										<tr>										
											<td>Rédacteur: </td>
											<td>
													<asp:TextBox id="Redacteur" Text="Clinique des Oasis" Size=50 MaxLength="50" runat="server" />
												<asp:RequiredFieldValidator
												ControlToValidate="Redacteur"
												ErrorMessage="*"
												Display="dynamic"
												runat="server" />										
											</td>
										<tr>
										<tr>										
											<td>Email: </td>
											<td>
													<asp:TextBox id="Email" Text="contact@cliniquedesoasis.com" Size=50 MaxLength="50" runat="server" />
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
										<tr>																																									
									</table>
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
void NewNews (Object sender, EventArgs e)
{	
	Functions fun = new Functions();
	fun.AddTach(Context.User.Identity.Name, "Insertion", "Actualités");
	string filename = Photo.PostedFile.FileName.Substring(Photo.PostedFile.FileName.LastIndexOf("\\") + 1 );
	if (filename.Length > 0)
		Photo.PostedFile.SaveAs(MapPath("../images/news/") + filename);
	else filename ="clinique.jpg";
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		try {
			connection.Open();
			SqlCommand command = new SqlCommand	("NewNews", connection);
			command.CommandType = CommandType.StoredProcedure;
			command.Parameters.Add("@Titre",Titre.Text);
			command.Parameters.Add("@Details",Details.Text);
			command.Parameters.Add("@Photo",filename);
			command.Parameters.Add("@Date_Heure",DateTime.Today);
			command.Parameters.Add("@Redacteur",Redacteur.Text);
			command.Parameters.Add("@Email",Email.Text);
			command.ExecuteNonQuery ();
			Response.Redirect("ListNews.aspx");
			}
		finally {
			connection.Close ();
		}
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("ListNews.aspx");
}
</script>
