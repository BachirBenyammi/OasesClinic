<%@ Page Language="c#" debug="true"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Voir un visiteur</title>
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
    					<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > <a href="ListVisiteursStats.aspx">Statistiques</a> > Voir un visiteur</th>    				
						<tr>
							<td width="10"></td>
							<td>
								<br>
								<p>									
									<asp:Button ID="btnDeleteVisiteur" CssClass="Button" Text="Supprimer" OnClick="DeleteVisiteur" Runat="server" Width="60" />&nbsp;	
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" Runat="server" Width="60" />																								
								</p>
								<p>
								<table>
								<tr>
									<td><b>Ip adresse long:</b></td>
									<td><asp:label id="Ip_Long" runat="server" /></td>
								</tr>
								<tr>
									<td><b>Ip adresse court:</b></td>
									<td><asp:label id="Ip_Short" runat="server" /></td>
								</tr>
								<tr>
									<td><b>Lien de source:</b></td>
									<td><asp:label id="Lien" runat="server" /></td>
								</tr>																
								<tr>
									<td><b>Date:</b></td>
									<td><asp:label id="Date_Access" runat="server" /></td>
								</tr>
								<tr>
									<td><b>Heure:</b></td>
									<td><asp:label id="Heure_Access" runat="server" /></td>
								</tr>								
								<tr>
									<td><b>Navigateur:</b></td>
									<td><asp:label id="Navigateur" runat="server" /></td>
								</tr>
								<tr>
									<td><b>Language:</b></td>
									<td><asp:label id="Language" runat="server" /></td>
								</tr>								
								<tr>
									<td><b>Pays:</b></td>
									<td>
										<asp:label id="Paye" runat="server" />
									</td>							
								</tr>
								<tr>
									<td><b>Code pays:</b></td>
									<td>
										<asp:label id="Code_Paye" runat="server" />
										<asp:Image id="Flag" runat="server" />
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
<script runat=server>
void Page_Load(Object sender, EventArgs e)
{
	if (!IsPostBack) {
		int Nu_Visiteur = int.Parse(Request.Params["Nu_Visiteur"]);
		if (CheckNu(Nu_Visiteur)) {
			decimal IpAdress = 0;
			btnDeleteVisiteur.Attributes.Add("OnClick", "javascript:return confirm('A ce que vous etre sure ?')");
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlCommand cmd = new SqlCommand	("select Ip_Adress, Lien, Date_Heure, Navigateur, Language from Visiteurs where Nu_Visiteur= " + Nu_Visiteur, connection);										
			SqlDataReader readerdata = cmd.ExecuteReader ();
			while (readerdata.Read ()) {
				IpAdress =  (decimal) readerdata["Ip_Adress"];
				Ip_Long.Text = IpAdress.ToString ();
				Lien.Text = readerdata["Lien"].ToString ();
				Navigateur.Text = readerdata["Navigateur"].ToString ();
				Language.Text = readerdata["Language"].ToString ();
				Date_Access.Text = readerdata.GetDateTime(2).ToString ("d");
				Heure_Access.Text = readerdata.GetDateTime(2).ToString ("hh:mm");
			}
			connection.Close ();
			if (GetCode(IpAdress) != null){
				connection.Open ();	
				SqlCommand cmd_1 = new SqlCommand("select Intituler as paye, Payes.Code_Paye as code_paye from Ips_Zones, Payes where ("+ IpAdress +" between First_Ip and Last_Ip) and (Ips_Zones.Code_Paye = Payes.Code_Paye )", connection);										
				SqlDataReader reader = cmd_1.ExecuteReader ();	
				while (reader.Read ()) {
					Paye.Text = reader["paye"].ToString ();
					Code_Paye.Text = reader["code_paye"].ToString ();
					Flag.ImageUrl = "../images/flags/" + reader["code_paye"].ToString () + ".png";
				}
			}
			else{
				Paye.Text = "Unknoun";
				Code_Paye.Text = "Unknoun";
				Flag.ImageUrl = "../images/Unknoun.gif";	
			}					
			Ip_Short.Text = StringIp(IpAdress);
			connection.Close ();
			}
		else
			Response.Redirect("../ErreurPage.aspx");
	}
}
void DeleteVisiteur ( Object sender, EventArgs e)
{
	int Nu_Visiteur = int.Parse(Request.Params["Nu_Visiteur"]);
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open();
	SqlCommand command = new SqlCommand	("delete from Visiteurs where Nu_Visiteur=" + Nu_Visiteur, connection);
	command.ExecuteNonQuery ();
	Response.Redirect("ListVisiteursStats.aspx");
	connection.Close ();
}
bool CheckNu(int Nu_Visiteur)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from Visiteurs where Nu_Visiteur = " + Nu_Visiteur, connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return ( Nu > 0 );
	connection.Close ();
}
string StringIp( decimal IpAddress)
{ 
	decimal w = IpAddress % 255;
	decimal x = ((IpAddress - w)/255) % 255;
	decimal y = (((IpAddress - w)/255) - x)/255 % 255;
	decimal z = (((((IpAddress - w)/255) - x)/255) - y)/255 % 255;
	return	z.ToString() + "." + y.ToString() + "." + x.ToString() + "." + w.ToString() ;
}
string GetCode (decimal Ip_Adress)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand command = new SqlCommand("select Code_Paye from Ips_Zones where ("+Ip_Adress +" between First_Ip and Last_Ip)", connection);
	object code = command.ExecuteScalar ();
	if (code is DBNull)
		return null;
	return (string) code;
	connection.Close ();
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("ListVisiteursStats.aspx");
}
</script>