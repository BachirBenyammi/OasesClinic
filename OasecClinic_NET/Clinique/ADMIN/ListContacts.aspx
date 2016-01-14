<%@ Page Language="c#" debug="true"%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Contacts</title>
		<script language="Javascript" src="../script/js.js"></script>
		<link type=text/css href="../css/style.css" rel=stylesheet>
		<script language=javascript>
		function SelectAll() {
			re = new RegExp(':chkSelection$') 
			for(i = 0; i < document.frmContactsList.elements.length; i++) {
				elm = document.frmContactsList.elements[i]
				if ((elm.type == 'checkbox') && (re.test(elm.name)))
		    	    	elm.checked = document.frmContactsList.cbSelectAll.checked
			}
		}
		function CheckAll(){
			j = 0
			re = new RegExp(':chkSelection$') 
			for(i = 0; i < document.frmContactsList.elements.length; i++) {
				elm = document.frmContactsList.elements[i]
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

    <form id="frmContactsList" runat="server">
    	<Clinique:Top id="top" runat="server" />
    	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
			<tr>
    			<td width="140" valign=top>
    				<p><!-- Left --></p>
    				<p><Clinique:Left_Admin id="Left" runat="server" /></p>
				</td>
				
				<td width="620" valign=top>
    				<table width="100%">
    					<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > Contacts</th>
						<tr>
							<td width="10"></td>
							<td>
								<br>
								<p>
										 <asp:Button id="btnDelete" CssClass="Button" Text="Supprimer" OnClick="DeleteContact" Runat="server" Width="60" />&nbsp;
									 <asp:Button CssClass="Button" Text="Retour" OnClick="RetourDefaultPage" Runat="server" Width="60" />																
								</p>
								<b>List des contacts: </b><hr>
								<asp:DataGrid ID="ContactsGrid" Runat="server"
									HeaderStyle-CssClass="Th" 
									ItemStyle-CssClass="Td"
									AutoGenerateColumns="False" 
									OnItemCommand="ViewContact" 
									PagerStyle-Mode="NumericPages" 
									OnPageIndexChanged="NewPage" 
									AllowPaging=True PageSize="10" 
									CellSpacing="1" 
									CellPadding="4" 
									GridLines=None>								
						   	  		<Columns>
						   		 		<asp:BoundColumn DataField="Nu_Contact" HeaderText="Nu_Contact"  Visible=False/>
								  		<asp:TemplateColumn>
								    		<HeaderTemplate>
								    			<input type="CheckBox" name="cbSelectAll" OnClick="SelectAll('chkSelection')">
								    		</HeaderTemplate>
								    	    <ItemTemplate>
								    	    	<asp:CheckBox ID="chkSelection" Runat="server"/>
								    	    </ItemTemplate>
								   		</asp:TemplateColumn>					
										<asp:ButtonColumn ButtonType=LinkButton CommandName="View" DataTextField="Sujet" HeaderText="Sujet" />	    
										<asp:BoundColumn DataField="Nom" HeaderText="Nom" />
										<asp:BoundColumn DataField="Date_Heure" HeaderText="Date" DataFormatString="{0:d}" />
										<asp:BoundColumn DataField="Date_Heure" HeaderText="Heure" DataFormatString="{0:hh:mm}" />
	  								</Columns>
								</asp:DataGrid>	
						</td></tr>
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
		SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Contact, Nom, Sujet, Date_Heure from Contacts order by Date_Heure DESC", connection);
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		ContactsGrid.DataSource = ds;
		ContactsGrid.DataBind ();	
	}
}
void NewPage (Object sender, DataGridPageChangedEventArgs e)
{
	ContactsGrid.CurrentPageIndex = e.NewPageIndex;
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Contact, Nom, Sujet, Date_Heure from Contacts order by Date_Heure DESC", connection);
	DataSet ds = new DataSet();
	adapter.Fill(ds);
	ContactsGrid.DataSource = ds;
	ContactsGrid.DataBind ();	
}
void DeleteContact(Object sender, EventArgs e)
{	
	int count = 0;
	StringBuilder Selections = new StringBuilder();
    foreach(DataGridItem dgItem in ContactsGrid.Items){
    	CheckBox chkSelected = (CheckBox)dgItem.FindControl("chkSelection");
        if (chkSelected.Checked){
        	count++;	
        	Selections.Append("'"+dgItem.Cells[0].Text+"', ");
		}	
	}
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("delete from Contacts where Nu_Contact in (" + Selections.ToString () + "'')", connection);
		command.ExecuteNonQuery ();
		Response.Redirect("ListContacts.aspx");
		}
	finally {
		connection.Close ();
	}
}
void ViewContact (Object sender, DataGridCommandEventArgs e)
{
	if (e.CommandName == "View")
		Response.Redirect ("ViewContact.aspx?Nu_Contact=" + e.Item.Cells[0].Text);
}
void RetourDefaultPage ( Object sender, EventArgs e)
{
	Response.Redirect("default.aspx");
}
</script>
