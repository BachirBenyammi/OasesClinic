<%@ Page Language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Modifier une Spécialité</title>
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
							<th colspan="2" align="left"><a href="default.aspx">Accueil</a> > <a href="ListSpecialites.aspx">Spécialités</a> > Modifier une Spécialité</th>
						<tr>
							<td width="10" rowspan=2></td>
							<td>
								<br>
								<p>
								  		<asp:Button CssClass="Button" Text="Supprimer" OnClick="DeleteSpecialite" Runat="server" CausesValidation=False Width="60" />&nbsp;
								 		<asp:Button CssClass="Button" Text="Modifier" OnClick="ModifSpecialite" Runat="server" Width="60" />&nbsp;
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" CausesValidation=False Runat="server" Width="60"/>	
								</p>								
    							<p>
   									<b>Modifier une Spécialités</b><hr>    							
									<b>Intituler: </b><br>
									<asp:TextBox id="Intituler" Size=50 MaxLength="50" runat="server" />
									<asp:RequiredFieldValidator
									ControlToValidate="Intituler"
									ErrorMessage="*"
									Display="dynamic"
									runat="server" />										
								</p>					
								<p>
									<b>Photo: (<asp:Label ID="PhotoPath" Runat=server />) </b><asp:Label ID="PhotoFile" Runat=server />
									<asp:CheckBox id="ChangePicBox" Runat=server
									runat="server" AutoPostBack=True 
									Text="Changer" OnCheckedChanged="ChangePic" /><br>
									<asp:Image ID="Img" Width=200 Height=150 Runat=server BorderWidth="1" hspace="5" /><br>
									<input id="Photo" Type="file" Size="50" name="Photo" runat="server" Visible=false >
								</p>															
								<p>								
									<b>Détails: </b><br>
									<asp:TextBox id="Details" TextMode="MultiLine" Wrap=false Columns="50" rows="7" runat="server" />
									<asp:RequiredFieldValidator
									ControlToValidate="Details"
									ErrorMessage="*"
									Display="dynamic"
									runat="server" /><br>
									<asp:RegularExpressionValidator
									ControlToValidate="Details" 
									ValidationExpression="^(.|\n){1,1000}$"
									Display=Dynamic Runat=server
									ErrorMessage="Les détails doit etre pas passer 1000 caractéres " />												
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
		int Nu_Specialite = int.Parse(Request.Params["Nu_Specialite"]);
		if (CheckNu(Nu_Specialite)) {
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlCommand cmd = new SqlCommand	("select Intituler, Details, Photo from Specialites where Nu_Specialite = " + Nu_Specialite, connection);										
			SqlDataReader readerdata = cmd.ExecuteReader ();
			while (readerdata.Read ()) {
				Intituler.Text = readerdata.GetString(0);	
				Details.Text = readerdata.GetString(1);
				PhotoPath.Text = readerdata["Photo"].ToString();
				if (PhotoPath.Text == "clinique.jpg" || PhotoPath.Text =="")
					Img.ImageUrl = "../images/clinique.jpg";
				else
					Img.ImageUrl = "../images/Specialites/" + PhotoPath.Text;				
			}
			connection.Close ();
		}
		else
			Response.Redirect("../ErreurPage.aspx");
	}
}
void DeleteSpecialite ( Object sender, EventArgs e)
{
	int Nu_Specialite= int.Parse(Request.Params["Nu_Specialite"]);
	Response.Redirect("DeleteSpecialite.aspx?From=Modif&Nu_Specialite=" + Nu_Specialite);
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("ListSpecialites.aspx");
}
bool CheckNu(int Nu_Specialite)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from Specialites where Nu_Specialite = " + Nu_Specialite, connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return ( Nu > 0 );
	connection.Close ();
}
void ModifSpecialite (Object sender, EventArgs e)
{	
	Functions fun = new Functions();
	fun.AddTach(Context.User.Identity.Name, "Modification", "Spécialités");
	int Nu_Specialite= int.Parse(Request.Params["Nu_Specialite"]);
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	string filename = PhotoPath.Text;
	if (ChangePicBox.Checked){
		filename = Photo.PostedFile.FileName.Substring(Photo.PostedFile.FileName.LastIndexOf("\\") + 1 );
		if (filename.Length > 0)
			Photo.PostedFile.SaveAs(MapPath("../images/Specialites/") + filename);
		else filename ="clinique.jpg";
	}	
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("ModifSpecialite", connection);
		command.CommandType = CommandType.StoredProcedure;
		command.Parameters.Add("@Nu_Specialite",Nu_Specialite);
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
void ChangePic (Object sender, EventArgs e)
{
	Photo.Visible = ChangePicBox.Checked;
	Img.Visible = !ChangePicBox.Checked;
}
</script>
