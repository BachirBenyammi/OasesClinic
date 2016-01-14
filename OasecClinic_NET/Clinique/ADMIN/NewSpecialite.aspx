<%@ Page Language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Ajouter une nouvelle Spécialité</title>
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
							<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > <a href="ListSpecialites.aspx">Spécialités</a> > Ajouter une nouvelle Spécialité</th>
						<tr>
							<td width="10" rowspan=2></td>
							<td>
								<br>
    							<p>
								<p>
								  	<asp:Button CssClass="Button" Text="Ajouter" OnClick="NewSpecialite" Runat="server" Width="60" />&nbsp;
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" CausesValidation=False Runat="server" Width="60"/>	
								</p>    							
    								<b>Ajouter une nouvelle Spécialité</b><hr>   
    								<table>
										<tr>
											<td>Intituler: </td>
											<td>
												<asp:TextBox id="Intituler" MaxLength="50" Size="50" runat="server" />
												<asp:RequiredFieldValidator
												ControlToValidate="Intituler"
												ErrorMessage="*"
												Display="dynamic"
												runat="server" />										
											</td>
										</tr>
										<tr>
											<td>Photo: </td>
											<td><input id="Photo" Type="file" Size="50" name="Photo" runat="server"></td>											
										</tr>											
										<tr>
											<td valign="top">Détails:</td>
											<td>
													<asp:TextBox id="Details" TextMode="MultiLine" Columns="50" rows="7" runat="server" />
												<asp:RequiredFieldValidator
												ControlToValidate="Details"
												ErrorMessage="*"
												Display="dynamic"
												runat="server" />
											</td>
										<tr>
											<td></td>	
											<td>								
												<asp:RegularExpressionValidator
												ControlToValidate="Details" 											
												ValidationExpression="^(.|\n){1,1000}$"
												Display=Dynamic Runat=server
												ErrorMessage="Les détails doit pas passer 1000 caractéres " />												
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
void NewSpecialite (Object sender, EventArgs e)
{	
	Functions fun = new Functions();
	fun.AddTach(Context.User.Identity.Name, "Insertion", "Spécialites");
	string filename = Photo.PostedFile.FileName.Substring(Photo.PostedFile.FileName.LastIndexOf("\\") + 1 );
	if (filename.Length > 0)
		Photo.PostedFile.SaveAs(MapPath("../images/Specialites/") + filename);
	else filename ="clinique.jpg";	
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("NewSpecialite", connection);
		command.CommandType = CommandType.StoredProcedure;
		command.Parameters.Add("@Intituler",Intituler.Text);
		command.Parameters.Add("@Details",Details.Text);	
		command.Parameters.Add("@Photo",filename);			
   		command.ExecuteNonQuery ();
		Response.Redirect("ListSpecialites.aspx");
		}
	finally {
		connection.Close ();
	}
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("ListSpecialites.aspx");
}
</script>