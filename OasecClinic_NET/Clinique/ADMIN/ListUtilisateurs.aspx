<%@ Page Language="c#" debug="true"%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Utilisateurs</title>
		<script language="Javascript" src="../script/js.js"></script>
		<link type=text/css href="../css/style.css" rel=stylesheet>
		<script language=javascript>
		function SelectAll() {
			re = new RegExp(':chkSelection$') 
			for(i = 0; i < document.frmListUtilisateurs.elements.length; i++) {
				elm = document.frmListUtilisateurs.elements[i]
				if ((elm.type == 'checkbox') && (re.test(elm.name)))
		    	    	elm.checked = document.frmListUtilisateurs.cbSelectAll.checked
			}
		}
		function CheckAll(){
			j = 0
			re = new RegExp(':chkSelection$') 
			for(i = 0; i < document.frmListUtilisateurs.elements.length; i++) {
				elm = document.frmListUtilisateurs.elements[i]
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

    <form id="frmListUtilisateurs" runat="server">
    	<Clinique:Top id="top" runat="server" />
    	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
			<tr>
    			<td width="140" valign=top>
    				<p><Clinique:Left_Admin id="Left" runat="server" /></p>
				</td>
				
				<td width="620" valign=top>
    				<table width="100%">
    					<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > Utilisateurs</th>
						<tr>
							<td width="10"></td>
							<td>
								<br>
	    						<p>								
									 <asp:Button id="btnDelete" CssClass="Button" Text="Supprimer" OnClick="DeleteUser" Runat="server" Width="60" />&nbsp;									
									 <asp:Button CssClass="Button" Text="Nouveau" OnClick="NewUser" Runat="server" Width="60" />&nbsp;					
									 <asp:Button CssClass="Button" Text="Retour" OnClick="RetourDefaultPage" Runat="server" Width="60" />								 		
								</p>
								<b>List des utilisateurs: </b><hr>
								<asp:DataGrid ID="UsersGrid" Runat="server"
									HeaderStyle-CssClass="Th" 
									ItemStyle-CssClass="Td"
									AutoGenerateColumns="False" 
									OnItemCommand="ViewUserStat" 
									PagerStyle-Mode="NumericPages" 
									OnPageIndexChanged="NewPage" 
									AllowPaging=True PageSize="10"
									CellSpacing="1" 
									CellPadding="4" 
									GridLines=None >							
									<Columns>
									 	<asp:BoundColumn DataField="Nu_User" HeaderText="Nu_User"  Visible=False/>
									  	<asp:TemplateColumn>
									    	<HeaderTemplate>
									    		<input type="CheckBox" name="cbSelectAll" OnClick="SelectAll('chkSelection')">
									    	</HeaderTemplate>
									        <ItemTemplate>
									        	<asp:CheckBox ID="chkSelection" Runat="server"/>
									        </ItemTemplate>
									   	</asp:TemplateColumn>					
											<asp:ButtonColumn ButtonType=LinkButton CommandName="View" DataTextField="Compte" HeaderText="Compte" />
										<asp:BoundColumn DataField="Nom" HeaderText="Nom" />
										<asp:BoundColumn DataField="Droit" HeaderText="Droit" />    
											<asp:BoundColumn DataField="Date_Inscription" HeaderText="Date d'inscription" DataFormatString="{0:d}" />   
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

<script runat="server">
void Page_Load(Object sender, EventArgs e)
{
	if (!IsPostBack) {
		btnDelete.Attributes.Add("OnClick", "javascript:return CheckAll()");
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		Functions fun = new Functions();
		string role = fun.GetUserRole(Context.User.Identity.Name);
		string sql;
		if (role == "Directeur")
			sql = "select * from Users where (Droit <> 'Directeur') and (Droit <> 'Webmaster') order by Date_Inscription DESC";
		else
			sql = "select * from Users where (Droit <> 'Webmaster') order by Date_Inscription DESC";
		SqlDataAdapter adapter = new SqlDataAdapter (sql, connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		UsersGrid.DataSource = ds;
		UsersGrid.DataBind ();			
	}
}
void NewPage (Object sender, DataGridPageChangedEventArgs e)
{
	UsersGrid.CurrentPageIndex = e.NewPageIndex;
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	Functions fun = new Functions();
	string role = fun.GetUserRole(Context.User.Identity.Name);
	string sql;
	if (role == "Directeur")
		sql = "select * from Users where Droit <> 'Directeur' order by Date_Inscription DESC";
	else 
		sql = "select * from Users order by Date_Inscription DESC";
	SqlDataAdapter adapter = new SqlDataAdapter (sql, connection);	
	DataSet ds = new DataSet();
	adapter.Fill(ds);
	UsersGrid.DataSource = ds;
	UsersGrid.DataBind ();	
}
void DeleteUser(Object sender, EventArgs e)
{	
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
		SqlCommand command = new SqlCommand	("delete from Users where Nu_User in (" + Selections.ToString () + "'')", connection);
		command.ExecuteNonQuery ();
		Response.Redirect("ListUtilisateurs.aspx");
		}
	finally {
		connection.Close ();
	}
}
void ViewUserStat (Object sender, DataGridCommandEventArgs e)
{
	if (e.CommandName == "View")
		Response.Redirect ("ViewUserStats.aspx?Nu_User=" + e.Item.Cells[0].Text);
}
void RetourDefaultPage ( Object sender, EventArgs e)
{
	Response.Redirect("default.aspx");
}
void NewUser ( Object sender, EventArgs e)
{
	Response.Redirect("NewUser.aspx");
}
</script>
