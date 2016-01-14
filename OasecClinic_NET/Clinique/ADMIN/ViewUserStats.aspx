<%@ Page Language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Import NameSpace="System.Data"%>
<%@ Register Tagprefix="Admin" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>
<html>
	<head>
		<title>Clinique des Oasis - Voir les statistiques d'un utilisateur</title>
		<script language="Javascript" src="../script/js.js"></script>
		<link type=text/css href="../css/style.css" rel=stylesheet>
		<script language=javascript>
		function SelectAll() {
			re = new RegExp(':chkSelection$') 
			for(i = 0; i < document.UserStatsfrm.elements.length; i++) {
				elm = document.UserStatsfrm.elements[i]
				if ((elm.type == 'checkbox') && (re.test(elm.name)))
		    	    	elm.checked = document.UserStatsfrm.cbSelectAll.checked
			}
		}
		function CheckAll(){
			j = 0
			re = new RegExp(':chkSelection$') 
			for(i = 0; i < document.UserStatsfrm.elements.length; i++) {
				elm = document.UserStatsfrm.elements[i]
				if ((elm.type == 'checkbox') && (re.test(elm.name)) && (elm.checked))
			    	j++
			}
		   	if (j==0){
		   		alert("Vous avez rien sélecioner !!")
		   		return false;
		   	}
		   	else
		   		return confirm('A ce que vous etre sure ?')
		}
		</script>		
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

	<form id="UserStatsfrm" runat="server">
    	<Clinique:Top id="top" runat="server" />
    	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
			<tr>
    			<td width="140" valign=top>
    				<p><Admin:Left_Admin id="Left" runat="server" /></p>
				</td>
				<td width="620" valign=top>
    				<table width="100%">
    						<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > <a href="ListUtilisateurs.aspx">Utilisateurs</a> > Voir les statistiques d'un utilisateur</th>
						<tr>
							<td width="10"></td>
							<td>
								<br>
								<p>
									<asp:Button ID="btnDeleteUserStats" CssClass="Button" Text="Supprimer" OnClick="DeleteUserStats" Runat="server" Width="60" />&nbsp;	
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" Runat="server" Width="60" />														
								</p>
								<p>
									<b>Utilisateur: </b><asp:Label ID="User" Runat=server /> <br>
										<b>Nombre de tache(s) effecter(s) par cet utilisateur: </b><asp:Label ID="Nu_Tache" Runat=server /> Tache(s)
								</p>
								<asp:DataGrid ID="UsersGrid" Runat="server"
									HeaderStyle-CssClass="Th" 
									ItemStyle-CssClass="Td"
									AutoGenerateColumns="False" 
									PagerStyle-Mode="NumericPages" 
									OnPageIndexChanged="NewPage" 
									AllowPaging=True PageSize="10" 
									CellSpacing="1" 
									CellPadding="4" 
									GridLines=None>							
									<Columns>
										<asp:BoundColumn DataField="Nu_UserStat"  Visible=False/>
									 	<asp:BoundColumn DataField="Nu_User"  Visible=False/>
									  	<asp:TemplateColumn>
									    	<HeaderTemplate>
									    		<input type="CheckBox" name="cbSelectAll" OnClick="SelectAll('chkSelection')">
									    	</HeaderTemplate>
									        <ItemTemplate>
									        	<asp:CheckBox ID="chkSelection" Runat="server"/>
									        </ItemTemplate>
									   	</asp:TemplateColumn>					  
										<asp:BoundColumn DataField="Tache" HeaderText="Tache" /> 
										<asp:BoundColumn DataField="Categorie" HeaderText="Catégorie" /> 
										<asp:BoundColumn DataField="Date_Heure" HeaderText="Date" DataFormatString="{0:d}" />   
										<asp:BoundColumn DataField="Date_Heure" HeaderText="Heure" DataFormatString="{0:hh:mm}" />   									
	  								</Columns>
								</asp:DataGrid>																					
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
		int Nu_User = int.Parse(Request.Params["Nu_User"]); 
		btnDeleteUserStats.Attributes.Add("OnClick", "javascript:return CheckAll()");
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_UserStat, UsersStats.Nu_User, Tache, Categorie, Date_Heure from Users, UsersStats where (UsersStats.Nu_User = " + Nu_User + ")and (UsersStats.Nu_User = Users.Nu_User )  order by Date_Heure DESC", connection);
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		UsersGrid.DataSource = ds;
		UsersGrid.DataBind ();											
		User.Text = CheckCompte(Nu_User);
		Nu_Tache.Text = CheckNu(Nu_User).ToString ();
	}
}
void NewPage (Object sender, DataGridPageChangedEventArgs e)
{
	int Nu_User = int.Parse(Request.Params["Nu_User"]);
	UsersGrid.CurrentPageIndex = e.NewPageIndex;
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_UserStat, UsersStats.Nu_User, Tache, Categorie, Date_Heure from Users, UsersStats where (UsersStats.Nu_User = " + Nu_User + ")and (UsersStats.Nu_User = Users.Nu_User )  order by Date_Heure DESC", connection);
	DataSet ds = new DataSet();
	adapter.Fill(ds);
	UsersGrid.DataSource = ds;
	UsersGrid.DataBind ();	
}
void DeleteUserStats(Object sender, EventArgs e)
{	
	int Nu_User = int.Parse(Request.Params["Nu_User"]);
	int count = 0;
	StringBuilder Selections = new StringBuilder();
    foreach(DataGridItem dgItem in UsersGrid.Items){
    	CheckBox chkSelected = (CheckBox)dgItem.FindControl("chkSelection");
        if (chkSelected.Checked){
        	count++;	
        	Selections.Append("'"+dgItem.Cells[0].Text+"', ");
		}	
	}
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("delete from UsersStats where Nu_UserStat in (" + Selections.ToString () + "'')", connection);
		command.ExecuteNonQuery ();
		Response.Redirect("ViewUserStats.aspx?Nu_User=" + Nu_User);
		}
	finally {
		connection.Close ();
	}
}
int CheckNu(int Nu_User)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select count (*) from UsersStats where Nu_User = " + Nu_User, connection);
	int Nu = (int) cmd .ExecuteScalar ();
	return  Nu;
	connection.Close ();
}
string CheckCompte(int Nu_User)
{
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	connection.Open ();
	SqlCommand cmd = new SqlCommand("select Compte from Users where Nu_User = " + Nu_User, connection);
	string compte = (string) cmd .ExecuteScalar ();
	return  compte;
	connection.Close ();
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("ListUtilisateurs.aspx");
}
</script>