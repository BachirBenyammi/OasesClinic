<%@ Page Language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Voir une signature</title>
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
	    					<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > <a href="ListSignatures.aspx">Signatures</a> > Voir une signature</th>
						<tr>
							<td width="10"></td>
							<td>
								<br>
									<p>
										<asp:Button CssClass="Button" Text="Supprimer" OnClick="DeleteSignature" Runat="server" Width="60" />&nbsp;	
										<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" Runat="server" Width="60" />
									</p>
									<p><b>Nom: </b><asp:label id="Nom" runat="server" /></p>
									<p><b>Email: </b><asp:label id="Email" runat="server" /></p>
									<p><b>Date: </b><asp:label id="Date_Heure" runat="server" /></p>
									<p><b>Commentaire: </b></p>
									<p><span class="Details"><asp:Literal ID="Details" Runat=server /></span></p>
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
		int Nu_Signature= int.Parse(Request.Params["Nu_Signature"]);
		if (CheckNu(Nu_Signature)) {
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();	
			SqlCommand cmd = new SqlCommand	("select Nom, Email, Date_Heure, Details from Signatures where Nu_Signature= " + Nu_Signature, connection);										
			SqlDataReader readerdata = cmd.ExecuteReader ();
			while (readerdata.Read ()) {
				Nom.Text = readerdata["Nom"].ToString ();
				Email.Text = readerdata["Email"].ToString ();
				Date_Heure.Text = readerdata.GetDateTime(2).ToString ("d");	
				Details.Text = readerdata["Details"].ToString ();
			}
				connection.Close ();
		}
		else
			Response.Redirect("../ErreurPage.aspx");			
	}
}
void DeleteSignature ( Object sender, EventArgs e)
{	
	int Nu_Signature = int.Parse(Request.Params["Nu_Signature"]);
	Response.Redirect("DeleteSignature.aspx?From=View&Nu_Signature=" + Nu_Signature);	
}
bool CheckNu(int Nu_Signature)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from Signatures where Nu_Signature = " + Nu_Signature, connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return ( Nu > 0 );
	connection.Close ();
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("ListSignatures.aspx");
}
</script>