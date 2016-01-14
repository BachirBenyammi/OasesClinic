<%@ Page Language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Voir une Spécialité</title>
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
    						<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > <a href="ListSpecialites.aspx">Spécialités</a> > Voir une Spécialité</th>
						<tr>
							<td width="10"></td>
							<td>
								<br>
								<p>
									<asp:Button CssClass="Button" Text="Supprimer" OnClick="DeleteSpecialite" Runat="server" Width="60" />&nbsp;	
										<asp:Button CssClass="Button" Text="Modifier" OnClick="ModifSpecialite" Runat="server" Width="60" />&nbsp;
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" Runat="server" Width="60" />
								</p>
								<p><b><asp:label id="Intituler" runat="server" /></b></p>		
								<p>							
									<asp:Image ID="Photo" Width=200 Height=150 Runat=server BorderWidth="1" hspace="5" ImageAlign=Right />
									<span class="Details"><asp:Literal ID="Details" Runat=server /></span>
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
<script runat=server>
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
				string PhotoFile = readerdata["Photo"].ToString();
				if (PhotoFile == "clinique.jpg" || PhotoFile =="" || PhotoFile == null)
					Photo.ImageUrl = "../images/clinique.jpg";
				else
					Photo.ImageUrl = "../images/Specialites/" + PhotoFile;
			}
			connection.Close ();
		}
		else
			Response.Redirect("../ErreurPage.aspx");
	}
}
void DeleteSpecialite ( Object sender, EventArgs e)
{
	int Nu_Specialite = int.Parse(Request.Params["Nu_Specialite"]);
	Response.Redirect("DeleteSpecialite.aspx?From=View&Nu_Specialite=" + Nu_Specialite);
}
bool CheckNu(int Nu_Specialite)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from Specialites where Nu_Specialite= " + Nu_Specialite, connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return ( Nu > 0 );
	connection.Close ();
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("ListSpecialites.aspx");
}
void ModifSpecialite ( Object sender, EventArgs e)
{
	int Nu_Specialite = int.Parse(Request.Params["Nu_Specialite"]);
	Response.Redirect("ModifSpecialite.aspx?Nu_Specialite=" + Nu_Specialite);
}
</script>