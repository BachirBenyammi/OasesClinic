<%@ Page%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Plan du Site</title>
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
   				<Clinique:Left id="Left" runat=server />
			</td>
			<td width="480" valign=top>
   				<table width="100%">
   					<th align=center colspan="2">Plan du Site</th>
   					<tr>
   						<td width="10"></td>
   						<td>
							<br>				
							<p class="Details">
								<li><a href="default.aspx">Accueil</a></li>
								<li><a href="Presentation.aspx">Pr�sentation</a></li>
									<ul>
										<li><a href="ListActualites.aspx">Actualit�s</a></li>
										<li><a href="Historique.aspx">Historique</a></li>
										<li><a href="Plan.aspx">Plan</a></li>
										<li><a href="ListSpecialites.aspx">Sp�cialit�s</a></li>
											<ul>
												<asp:DataGrid ID="SpecialitesGrid" Runat="server"
													AutoGenerateColumns="False"   
													GridLines=None >								 
													    <Columns>
															<asp:TemplateColumn>
																<ItemTemplate>
																	<li><asp:HyperLink runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "Intituler")%>' NavigateUrl='<%# String.Format("AfficheSpecialite.aspx?Nu_Specialite={0}", DataBinder.Eval(Container.DataItem, "Nu_Specialite")) %>' /></li>
																</ItemTemplate>
															</asp:TemplateColumn>   
								  						</Columns>
													</asp:DataGrid>
											</ul>
										<li><a href="Departements.aspx">D�partements</a></li>
											<ul>
												<li><a href="Reception.aspx">Hall d'accueil</a></li>
												<li><a href="Consultations.aspx">Consultations</a></li>
												<li><a href="Imagerie.aspx">Imagerie</a></li>
												<li><a href="Bloc.aspx">Bloc op�ratoire</a></li>
												<li><a href="Urgences.aspx">Urgences</a></li>
												<li><a href="Labos.aspx">Laboratoires</a></li>
												<li><a href="Hospitale.aspx">Hospitalisation</a></li>
												<li><a href="Cardio.aspx">Cardiologie</a></li>
												<li><a href="Maternite.aspx">Maternit�</a></li>
												<li><a href="Reeducation.aspx">R��ducation fonctionnelle</a></li>
												<li><a href="Remise.aspx">Remise en forme</a></li>
											</ul>	
										<li><a href="Services.aspx">Services</a></li>
											<ul>
												<li><a href="Services.aspx#Confer">Salle de conf�rences</a></li>
												<li><a href="Services.aspx#Cafeteria">Caf�t�ria</a></li>
												<li><a href="Services.aspx#Parc">Parc</a></li>
												<li><a href="Services.aspx#Navette">Navette</a></li>
											</ul>									
										<li><a href="address.aspx">Adresse</a></li>
									</ul>								
								<li>Ressources</li>
									<ul>
										<li>Rendez-vous</li>
										<li>Q&R</li>
										<li><a href="Livredor.aspx">Livre d'or</a></li>
										<li><a href="Downloads.aspx">T�l�chargement</a></li>
										<li><a href="Liens.aspx">Liens</a></li>
									</ul>
								<li>Gharda�a</li>
									<ul>
										<li><a href="SM.aspx">Services M�dicaux</a></li>
										<ul>
											<li><a href="ListCentres.aspx?Centre_Type=H">H�pitaux</a></li>
											<li><a href="ListCentres.aspx?Centre_Type=C">Cliniques</a></li>
											<li><a href="Specialites.aspx">Sp�cialistes</a></li>
											<li><a href="ListCentres.aspx?Centre_Type=P">Pharmacies</a></li>
											<li><a href="ListCentres.aspx?Centre_Type=M">Mat�riel M�dical</a></li>
										</ul>
										<li><a href="Sites.aspx">Sites web</a></li>									
									</ul>
								<li><a href="Register.aspx">Inscription</a></li>
								<li><a href="Recherche.aspx">Recherche</a></li>
								<li><a href="ListSondages.aspx">Sondages</a></li>
								<li><a href="Sitemap.aspx">Plan du Site</a></li>
								<li><a href="Contact.aspx">Contact</a></li>								
							</p>
							<br>
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
<script runat="server">
void Page_Load(Object sender, EventArgs e)
{
	if (!IsPostBack) {
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Specialite, Intituler from Specialites order by Intituler", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		SpecialitesGrid.DataSource = ds;
		SpecialitesGrid.DataBind ();	
	}
}
</script>