<%@ Page Language="c#" debug="true"%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Abonnées</title>
		<script language="Javascript" src="../script/js.js"></script>
		<link type=text/css href="../css/style.css" rel=stylesheet>
		<script language=javascript>
		function SelectAll() {
			re = new RegExp(':chkSelection$') 
			for(i = 0; i < document.frmAbonnaiesList.elements.length; i++) {
				elm = document.frmAbonnaiesList.elements[i]
				if ((elm.type == 'checkbox') && (re.test(elm.name)))
		    	    	elm.checked = document.frmAbonnaiesList.cbSelectAll.checked
			}
		}
		function CheckAll(){
			j = 0
			re = new RegExp(':chkSelection$') 
			for(i = 0; i < document.frmAbonnaiesList.elements.length; i++) {
				elm = document.frmAbonnaiesList.elements[i]
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

    <form id="frmAbonnaiesList" runat="server">
    	<Clinique:Top id="top" runat="server" />
    	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
			<tr>
    			<td width="140" valign=top>
    				<p><Clinique:Left_Admin id="Left" runat="server" /></p>
				</td>		
				<td width="620" valign=top>
    				<table width="100%">
    					<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > Abonnées</th>
						<tr>
							<td width="10"></td>
							<td>
								<br>
								<p>
										 <asp:Button id="btnDelete" CssClass="Button" Text="Supprimer" OnClick="DeleteAbonnaie" Runat="server" Width="60" />&nbsp;
									 <asp:Button CssClass="Button" Text="Retour" OnClick="RetourDefaultPage" Runat="server" Width="60" />									
								</p>
								<b>List des abonnées</b><hr>
								<asp:DataGrid ID="AbonnaiesGrid" Runat="server" Width="100%"
								HeaderStyle-CssClass="Th" 
								ItemStyle-CssClass="Td"
								AutoGenerateColumns="False" 
								OnItemCommand="ViewAbonnaie" 
								PagerStyle-Mode="NumericPages" 
								OnPageIndexChanged="NewPage" 
								AllowPaging=True PageSize="10" 
								CellSpacing="1" 
								CellPadding="4" 
								GridLines=None>
							    <Columns>
								  	<asp:BoundColumn DataField="Nu_Abonnaie" HeaderText="Nu_Abonnaie"  Visible=False/>
								  	<asp:TemplateColumn>
								    	<HeaderTemplate>
								    		<input type="CheckBox" name="cbSelectAll" OnClick="SelectAll('chkSelection')">
								    	</HeaderTemplate>
								        <ItemTemplate>
								        	<asp:CheckBox ID="chkSelection" Runat="server"/>
								        </ItemTemplate>
								   	</asp:TemplateColumn>
								   	<asp:ButtonColumn ButtonType=LinkButton CommandName="View" DataTextField="Compte" HeaderText="Compte" />	    
							 	  	 <asp:BoundColumn HeaderText="Nom" DataField="Nom" />
							 	  	 <asp:BoundColumn HeaderText="Date d'inscription" DataField="Date_Inscription" DataFormatString="{0:d}" />
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
		SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Abonnaie, Compte, Nom, Date_Inscription from Abonnaies order by Date_Inscription DESC", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		AbonnaiesGrid.DataSource = ds;
		AbonnaiesGrid.DataBind ();	
	}
}
void NewPage (Object sender, DataGridPageChangedEventArgs e)
{
	AbonnaiesGrid.CurrentPageIndex = e.NewPageIndex;
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Abonnaie, Compte, Nom, Date_Inscription from Abonnaies order by Date_Inscription DESC", connection);	
	DataSet ds = new DataSet();
	adapter.Fill(ds);
	AbonnaiesGrid.DataSource = ds;
	AbonnaiesGrid.DataBind ();	
}
void DeleteAbonnaie(Object sender, EventArgs e)
{	
	Functions fun = new Functions();
	fun.AddTach(Context.User.Identity.Name, "Suppression", "Abonneés");
	int count = 0;
	StringBuilder Selections = new StringBuilder();
    foreach(DataGridItem dgItem in AbonnaiesGrid.Items){
    	CheckBox chkSelected = (CheckBox)dgItem.FindControl("chkSelection");
        if (chkSelected.Checked){
        	count++;	
        	Selections.Append("'"+dgItem.Cells[0].Text+"', ");
		}	
	}
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("delete from Abonnaies where Nu_Abonnaie in (" + Selections.ToString () + "'')", connection);
		command.ExecuteNonQuery ();
		Response.Redirect("ListAbonnees.aspx");
		}
	finally {
		connection.Close ();
	}
}
void ViewAbonnaie (Object sender, DataGridCommandEventArgs e)
{
	if (e.CommandName == "View")
		Response.Redirect ("ViewAbonnee.aspx?Nu_Abonnaie=" + e.Item.Cells[0].Text);
}
void RetourDefaultPage ( Object sender, EventArgs e)
{
	Response.Redirect("default.aspx");
}
</script>
