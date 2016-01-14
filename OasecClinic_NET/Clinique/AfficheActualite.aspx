<%@ Page Language="c#" debug="true"%>

<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasi - Actualités</title>
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
    				<p><Clinique:Left id="Left" runat="server" /></p>
				</td>
				<td width="480" valign=top>
    				<table width="100%">
    						<th align=left colspan="2"><asp:HyperLink ID="ListNews" Runat=server NavigateUrl="ListActualites.aspx" /> > <asp:label id="Titre_0" runat="server" /></th>
						<tr>
							<td width="10"></td>
							<td>
								<br>
								<p>
									<b><asp:label id="Titre" runat="server" /></b> <asp:label id="Date_Heure" runat="server" />
								</p>
								<p>
									<asp:Image ID="Photo" Width=200 Height=150 Runat=server BorderWidth="1" hspace="5" ImageAlign=Left />
									<span class="Details"><asp:Literal ID="Details" Runat=server /></span>
								</p>
							</td>
						</tr>
						<tr>
							<td colspan="2"><p align=right><b>Rédacteur: </b><asp:HyperLink ID="Redacteur" Runat=server /></td>
						</tr>
						<tr><td></td><td><br><asp:HyperLink ID="ListNews_1" Runat=server NavigateUrl="ListActualites.aspx" /></td></tr>
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
				Photo.ImageUrl = "images/news/" + readerdata.GetString(2);
				Date_Heure.Text = readerdata.GetDateTime(1).ToString ("d");		
				Details.Text = readerdata.GetString(3);
				Redacteur.Text = readerdata.GetString(4);
				Redacteur.NavigateUrl = "mailto:" + readerdata.GetString(5);
			}
			connection.Close ();
			Titre_0.Text = Titre.Text;
			if (DateTime.Parse(Date_Heure.Text).Year.ToString()== DateTime.Now.Year.ToString()){
				ListNews.Text = "Actualités";
				ListNews_1.Text = "Actualités";
			}
			else{
				ListNews.Text = "Historiques";
				ListNews_1.Text = "Historiques";
			}
		}
		else
			Response.Redirect("ErreurPage.aspx");
	}
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
</script>