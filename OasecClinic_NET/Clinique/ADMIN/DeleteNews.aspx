<%@ Page Language="c#" debug="true"%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Suppression d'un évènement</title>
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
    						<th  colspan="2" align="left"><a href="default.aspx">Accueil</a> > <a href="ListNews.aspx">Actualités</a> > Suppression d'un évènement</th>
						<tr>
							<td rowspan="2" width="10"></td>
							<td>
								<br>
								<p>
									<b>Confirmation de suppression</b><hr>
										A ce que vous étés sur de supprimer l'évènement <b><asp:Label ID="NewsTitre" Runat=server /></b> ?<br><br>
									<asp:Button CssClass="Button" Text="Oui" OnClick="DeleteNews" Runat=server Width="60" />&nbsp;
									<asp:Button CssClass="Button" Text="Non" OnClick="Reteur" Runat=server Width="60" />
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
		int Nu_News = int.Parse(Request.Params["Nu_News"]);
		if (CheckNewsNu(Nu_News)){
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();
			SqlCommand cmd = new SqlCommand("select Titre from News where Nu_News= " + Nu_News, connection);
			NewsTitre.Text = (string) cmd .ExecuteScalar ();
			connection.Close ();
		}
		else
			Response.Redirect("../ErreurPage.aspx");
	}
}

void DeleteNews(Object sender, EventArgs e)
{	
	Functions fun = new Functions();
	fun.AddTach(Context.User.Identity.Name, "Suppression", "Actualités");
	int Nu_News= int.Parse(Request.Params["Nu_News"]);
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("delete from News where Nu_News =" + Nu_News, connection);
		command.ExecuteNonQuery ();
		Response.Redirect("ListNews.aspx");
		}
	finally {
		connection.Close ();
	}
}
bool CheckNewsNu(int Nu_News)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from News where Nu_News= " + Nu_News, connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return ( Nu > 0 );
	connection.Close ();
}
void Reteur (Object sender, EventArgs e)
{
	int Nu_News = int.Parse(Request.Params["Nu_News"]);
	string source = Request.Params["From"];
	switch(source)
	{
		case "View":
			Response.Redirect("ViewNews.aspx?Nu_News=" + Nu_News);
			break;
		case "Modif":
			Response.Redirect("ModifNews.aspx?Nu_News=" + Nu_News);
			break;
		default:
			Response.Redirect("ListNews.aspx");
			break;
	}
}
</script>
