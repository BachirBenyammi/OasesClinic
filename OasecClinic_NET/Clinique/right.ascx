<%@ Control debug="true"%>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<script language=javascript>
	function FinVote() {
		alert("Vous avez déja votez sur ce sondage aujourd'hoi !!");
		return false;
	}
	function NoSelect()	{
		j = 0
		re = new RegExp(':ChoixRadoiList$') 
		for(i = 0; i < document.forms[0].elements.length; i++) {
			elm = document.forms[0].elements[i]
			if ((elm.type == 'radio') && (re.test(elm.name)) && (elm.checked))
		    	j++
		}
	   	if (j==0){
	   		alert("Sélectionnez un choix svp !!")
	   		return false;
	   	}
	}
</script>
<script runat=server>
void Page_Load(Object sender, EventArgs e)
{
	if(!IsPostBack){
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		int Nu_Sondage = SondageNu();
		LabNuSondage.Text = Nu_Sondage.ToString();
		connection.Open ();	
		SqlCommand cmd_1 = new SqlCommand	("select Sondage from Sondages where Nu_Sondage = " + Nu_Sondage, connection);										
		Sondage.Text = (string) cmd_1.ExecuteScalar ();
		connection.Close ();
		connection.Open ();	
		SqlCommand command = new SqlCommand ("select Nu_Choix, Choix from Sondages_Choix where Nu_Sondage = " + Nu_Sondage, connection);
		SqlDataReader reader = command.ExecuteReader ();
		ChoixRadoiList.DataSource = reader;
		ChoixRadoiList.DataTextField = "Choix";
		ChoixRadoiList.DataValueField = "Nu_Choix";
		ChoixRadoiList.DataBind ();
		connection.Close ();
	
		if (HttpContext.Current.Request.Cookies[LabNuSondage.Text] != null)
			VoteBtn.Attributes.Add("OnClick", "javascript:return FinVote()");
		else
			VoteBtn.Attributes.Add("OnClick", "javascript:return NoSelect()");
	}
}
int SondageNu()
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	ArrayList AL = new ArrayList();
	Random rd = new Random();
	connection.Open();
	SqlDataAdapter adapter = new SqlDataAdapter("Select Nu_Sondage From Sondages", connection);
	DataTable dt = new DataTable();
	adapter.Fill(dt);
	foreach (DataRow dr in dt.Rows)
		AL.Add(dr["Nu_Sondage"]);
	int n = int.Parse(AL[rd.Next(AL.Count)].ToString());
	connection.Close();
	return n;
}
void Voter(Object sender, EventArgs e)
{
	Response.Redirect("VoterSondage.aspx?Nu_Sondage=" + LabNuSondage.Text + "&Choix_Nu=" + ChoixRadoiList.SelectedIndex);
}
void Resultat(Object sender, EventArgs e)
{
	Response.Redirect("ResultatVote.aspx?Nu_Sondage=" + LabNuSondage.Text);
}
void Sondages (Object sender, EventArgs e)
{
	Response.Redirect("ListSondages.aspx");
}
</script>
<body id="FrmRight" runat=server>
<table class="SiteTable">
	<th>Sondage</th>
	<tr>
		<td>
			<asp:Label id="LabNuSondage" Runat=server Visible=False />
			<asp:Label id="Sondage" Runat=server />
		</td>
	</tr>
	<tr>
		<td> 
			<asp:RadioButtonList ID="ChoixRadoiList" Runat=server />
		</td>
	</tr>
	<tr>
		<td>
			<asp:LinkButton ID="VoteBtn" Runat=server Text="Voter" OnClick="Voter" /> 
			<asp:LinkButton Runat=server Text="Résultat" OnClick="Resultat" />
			<asp:LinkButton Runat=server Text="Sondages" OnClick="Sondages" />
		</td>
	</tr>
</table><br>
<table class="SiteTable">
	<th>Rechercher</th>
	<tr><td><input type="Text" size="16"></td></tr>
	<tr><td>Chercher</td></tr>
</table><br>
<table class="SiteTable">
	<th>Ghardaïa</th>
	<tr><td><a href="SM.aspx">Services Médicaux</a></td></tr>
	<tr><td><a href="Sites.aspx">Sites Web</a></td></tr>
</table><br>
<table class="SiteTable">
	<th>Options de page</th>
	<tr><td>
		<a href="#" onclick="window.external.AddFavorite('http://www.cliniquedesoasis.com','Clinique des Oasis');">Ajouter aux favorites</a>
	</td></tr>
	<tr><td>
		<a href="#" onClick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.cliniquedesoasis.com');">Mettre comme page de démarrage</a>
	</td></tr>
	<tr><td><a href="#" onclick="print();">Imprimer</a></td></tr>
	<tr><td><a href='<%Response.Write("mailto:?body="+Request.Url.ToString());%>'>Envoi à un amis</a></td></tr>	
</table>
</body>
