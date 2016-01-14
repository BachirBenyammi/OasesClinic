<%@ Page Language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Voir un évènement</title>
		<script language="Javascript" src="../script/js.js"></script>
		<link type=text/css href="../css/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

	<form runat="server">
    	<Clinique:Top id="top" runat="server" />
    	<table align="center" cellspacing="0" width="760" height="400" cellpadding="0" border="1">
			<tr>
    			<td width="140" valign=top>
    				<p><Clinique:Left_Admin id="Left" runat="server" /></p>
				</td>
				<td width="620" valign=top>
    				<table width="100%">
	    					<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > <a href="ListNews.aspx">Actualités</a> > Voir un évènement</th>
    					<tr>
    						<td width=10></td>
    						<td>
    						   <br>
    						   <p>
									<asp:Button CssClass="Button" Text="Supprimer" OnClick="DeleteNews" Runat="server" Width="60" />&nbsp;	
									<asp:Button CssClass="Button" Text="Modifier" OnClick="ModifNews" Runat="server" Width="60" />&nbsp;
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" Runat="server" Width="60" />							    						   
    						   </p>	
	    						<p>
									<b><asp:label id="Titre" runat="server" /></b> <asp:label id="Date_Heure" runat="server" />
								</p>
								<p>								
									<asp:Image ID="Photo" Width=200 Height=150 Runat=server BorderWidth="1" hspace="5" ImageAlign=Right />
									<span class="Details"><asp:Literal ID="Details" Runat=server /></span>
								</p>
							</td>
						</tr>		
						<tr>
							<td colspan="2"><p align=right><b>Rédacteur: </b><asp:HyperLink ID="Redacteur" Runat=server /></p></td>
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
		int Nu_News = int.Parse(Request.Params["Nu_News"]);
		if (CheckNu(Nu_News)) {
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlCommand cmd = new SqlCommand	("select Titre, Date_Heure, Photo, Details, Redacteur, Email from News where Nu_News = " + Nu_News, connection);										
			SqlDataReader readerdata = cmd.ExecuteReader ();
			while (readerdata.Read ()) {
				Titre.Text = readerdata.GetString(0);
				string PhotoFile = readerdata["Photo"].ToString();
				if (PhotoFile == "clinique.jpg" || PhotoFile =="")
					Photo.ImageUrl = "../images/clinique.jpg";
				else
					Photo.ImageUrl = "../images/News/" + PhotoFile;
				Date_Heure.Text = readerdata.GetDateTime(1).ToString ("d");		
				Details.Text = readerdata.GetString(3);
				Redacteur.Text = readerdata["Redacteur"].ToString();
				Redacteur.NavigateUrl = "mailto:" + readerdata["Email"].ToString();
			}
			connection.Close ();
		}
		else
			Response.Redirect("../ErreurPage.aspx");
	}
}
void DeleteNews ( Object sender, EventArgs e)
{
	int Nu_News= int.Parse(Request.Params["Nu_News"]);
	Response.Redirect("DeleteNews.aspx?From=View&Nu_News=" + Nu_News);
}
bool CheckNu(int Nu_News)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from News where Nu_News= " + Nu_News, connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return ( Nu > 0 );
	connection.Close ();
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("ListNews.aspx");
}
void ModifNews ( Object sender, EventArgs e)
{
	int Nu_News= int.Parse(Request.Params["Nu_News"]);
	Response.Redirect("ModifNews.aspx?Nu_News=" + Nu_News);
}
</script>