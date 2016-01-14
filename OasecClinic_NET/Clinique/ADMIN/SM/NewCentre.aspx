<%@ Page%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Ajouter un Centre</title>
		<script language="Javascript" src="../../script/js.js"></script>
		<link type=text/css href="../../css/style.css" rel=stylesheet>
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
							<th align="left" colspan="2"><a href="../default.aspx">Accueil</a> > <a href="../SM.aspx">Services Médicaux > <asp:HyperLink ID="Centres" Runat=server /> > Ajouter un(e) <asp:Label ID="Centre_1" Runat=server /></th>
						<tr>
							<td width="10" rowspan=2></td>
							<td>
								<br>
								<p>
								  	<asp:Button CssClass="Button" Text="Ajouter" OnClick="NewCentre" Runat="server" Width="60" />&nbsp;
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" CausesValidation=False Runat="server" Width="60"/>	
								</p>    
								<b>Ajouter un(e) <asp:Label ID="Centre_2" Runat=server /></b><hr>   
								<table>
									<tr>
										<td>Intituler:</td>
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
										<td>Tél:</td>
										<td>
											<asp:TextBox id="Tel" MaxLength="12" Size="12" runat="server" />
											<asp:RequiredFieldValidator
												ControlToValidate="Tel"
												ErrorMessage="*"
												Display="dynamic"
												runat="server" />
										</td>
									</tr>
									<tr>
										<td>Adresse:</td>
										<td>
											<asp:TextBox id="Address" MaxLength="50" Size="50" runat="server" />
											<asp:RequiredFieldValidator
												ControlToValidate="Address"
												ErrorMessage="*"
												Display="dynamic"
												runat="server" />
										</td>
									</tr>
									<tr>
										<td>Ville:</td>
										<td>
											<asp:DropDownList ID="Villes" Runat=server />
											<asp:RequiredFieldValidator
												ControlToValidate="Villes"
												ErrorMessage="*"
												Display="Dynamic"
												Runat=server />		
										</td>
									</tr>
								</table>
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
void Page_Load (Object sender, EventArgs e)
{
	if (!IsPostBack) {
		string Centre_Type = Request.Params["Centre_Type"];
		switch (Centre_Type)
		{
			case "H": Centres.Text = "Hôpitaux";
					  Centre_1.Text = "Hôpital";
					  Centre_2.Text = "Hôpital";
					  break;
			case "P": Centres.Text = "Pharmacies";
					  Centre_1.Text = "Pharmacie";
					  Centre_2.Text = "Pharmacie";				
					  break;
			case "M": Centres.Text = "Matérial Médical";
					  Centre_1.Text = "Matérial Médical";
					  Centre_2.Text = "Matérial Médical";			
					  break;
			case "C": Centres.Text = "Cliniques";
					  Centre_1.Text = "Clinique";
					  Centre_2.Text = "Clinique";			
					  break;				  
		}
		Centres.NavigateUrl = "ListCentres.aspx?Centre_Type=" + Centre_Type;
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		connection.Open();
		SqlDataAdapter adapter = new SqlDataAdapter	("select Nu_Ville, Ville from Villes order by Ville", connection);			
   		DataSet ds = new DataSet();
		adapter.Fill(ds);
		Villes.DataSource = ds;
		Villes.DataTextField = "Ville";
		Villes.DataValueField = "Nu_Ville";
		Villes.DataBind ();	
		connection.Close ();	
	}
}
void NewCentre (Object sender, EventArgs e)
{	
	string Ville = Villes.Items[Villes.SelectedIndex].Value;
	string Fonction  = Request.Params["Centre_Type"];
	string Centre = "Centre";
	switch (Fonction)
		{
			case "H": Centre= "Hôpitaux";
					  break;
			case "P": Centre= "Pharmacies";	
					  break;
			case "M": Centre= "Matérial Médical";
					  break;
			case "C": Centre= "Cliniques";
					  break;				  
		}
	Functions fun = new Functions();
	fun.AddTach(Context.User.Identity.Name, "Insertion", Centre);
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("insert into SM_Centres (Intituler, Tel, Address , Ville, Fonction) values ('" + Intituler.Text + "', '" + Tel.Text + "', '" + Address.Text + "', '" + Ville + "', '" + Fonction + "')", connection);			
   		command.ExecuteNonQuery ();
		Response.Redirect("ListCentres.aspx?Centre_Type=" + Fonction);
		}
	finally {
		connection.Close ();
	}
}
void Retour ( Object sender, EventArgs e)
{
	string Centre_Type = Request.Params["Centre_Type"];
	Response.Redirect("ListCentres.aspx?Centre_Type=" + Centre_Type);
}
</script>