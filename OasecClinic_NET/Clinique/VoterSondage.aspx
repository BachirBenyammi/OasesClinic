<%@ Page language="c#" debug="true"%>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Voter sur un sondage</title>
		<script language="Javascript" src="script/js.js"></script>
		<link type=text/css href="css/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
<form runat="server" id="frm"> 
	<Clinique:Menu id="Menu" runat="server" />  
 
   	<Clinique:Top id="top" runat="server" />
   	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
		<tr>
   			<td width="140" valign=top>
   				<Clinique:Left id="Left" runat=server />
			</td>
			<td width="480" valign=top>
   				<table width="100%">
   					<th align=left colspan="2"><a href="ListSondages.aspx">Sondages</a> > Voter</th>
   					<tr>
   						<td width="10"></td>
   						<td>
   							<br>
							 <p>
							 	Merci d'avoir perticipez a ce vote 
							 </p>
							 <p>
								<asp:LinkButton ID="ResultBtn" Runat=server Text="Résultat" OnClick="Resultat" />
							 </p>
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
<script runat=server>
void Page_Load(Object sender, EventArgs e)
{
	if(!IsPostBack){
		int Nu_Sondage = int.Parse(Request.Params["Nu_Sondage"]);
		int Choix_Nu = int.Parse(Request.Params["Choix_Nu"]);
		if (ExistSondage(Nu_Sondage, Choix_Nu) && FirstVote(Nu_Sondage)){
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlCommand cmd = new SqlCommand	("update Sondages_Choix set Nbr_Voix = Nbr_Voix + 1 where (Nu_Sondage = " + Nu_Sondage +") and (Choix_Nu = " + Choix_Nu + ")", connection);										
			cmd.ExecuteNonQuery();
			HttpCookie MyCookie = new HttpCookie(Nu_Sondage.ToString());
			MyCookie.Value = Choix_Nu.ToString(); 
			DateTime Dt = DateTime.Today;
			MyCookie.Expires = Dt.Add(new TimeSpan(1,0,0,0));
			HttpContext.Current.Response.Cookies.Add(MyCookie);
		}
		else
			Response.Redirect("ErreurPage.aspx");
	}
}
bool ExistSondage(int Nu_Sondage, int Choix_Nu)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();	
	SqlCommand cmd = new SqlCommand	("select count(Nu_Sondage) from Sondages_Choix where (Nu_Sondage = " + Nu_Sondage +") and (Choix_Nu = " + Choix_Nu + ")", connection);										
	int nu = (int) cmd.ExecuteScalar ();
	return (nu == 1);
	connection.Close ();
}
bool FirstVote(int Nu_Sondage)
{
	return HttpContext.Current.Request.Cookies[Nu_Sondage.ToString()] == null;
}
void Resultat(Object sender, EventArgs e)
{
	Response.Redirect("ResultatVote.aspx?Nu_Sondage=" + Request.Params["Nu_Sondage"]);
}
</script>