<%@ Page%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Suppression d'une Signature</title>
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
	    					<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > <a href="ListSignatures.aspx">Signatures</a> > Suppression d'une Signature</th>
						<tr>
							<td rowspan="2" width="10"></td>
							<td>
								<br>
								<p>
									<b>Confirmation de suppression</b><hr>
										A ce que vous étés sur de supprimer la Signature de <b><asp:Label ID="SignatureNom" Runat=server /></b> ?<br><br>
									<asp:Button CssClass="Button" Text="Oui" OnClick="DeleteSignature" Runat=server Width="60" />&nbsp;
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
		int Nu_Signature = int.Parse(Request.Params["Nu_Signature"]);
		if (CheckSignatureNu(Nu_Signature)){
			SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
			connection.Open ();
			SqlCommand cmd = new SqlCommand("select Nom from Signatures where Nu_Signature = " + Nu_Signature, connection);
			SignatureNom.Text = (string) cmd .ExecuteScalar ();
			connection.Close ();
		}
		else
			Response.Redirect("../ErreurPage.aspx");
	}
}

void DeleteSignature (Object sender, EventArgs e)
{	
	Functions fun = new Functions();
	fun.AddTach(Context.User.Identity.Name, "Suppression", "Signature");
	int Nu_Signature = int.Parse(Request.Params["Nu_Signature"]);
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("delete from Signatures where Nu_Signature =" + Nu_Signature, connection);
		command.ExecuteNonQuery ();
		Response.Redirect("ListSignatures.aspx");
		}
	finally {
		connection.Close ();
	}
}
bool CheckSignatureNu(int Nu_Signature)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from Signatures where Nu_Signature = " + Nu_Signature , connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return ( Nu > 0 );
	connection.Close ();
}
void Reteur (Object sender, EventArgs e)
{
	int Nu_Signature = int.Parse(Request.Params["Nu_Signature"]);
	string source = Request.Params["From"];
	switch(source)
	{
		case "View":
			Response.Redirect("ViewSignature.aspx?Nu_Signature=" + Nu_Signature);
			break;
		default:
			Response.Redirect("ListSignatures.aspx");
			break;
	}
}
</script>
