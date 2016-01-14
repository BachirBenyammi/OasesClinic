<%@ Page Language="c#" debug="true"%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Statistiques sur les visiteurs</title>
		<script language="Javascript" src="../script/js.js"></script>
		<link type=text/css href="../css/style.css" rel=stylesheet>
		<script language=javascript>
		function SelectAll() {
			re = new RegExp(':chkSelection$') 
			for(i = 0; i < document.frmVisiteursList.elements.length; i++) {
				elm = document.frmVisiteursList.elements[i]
				if ((elm.type == 'checkbox') && (re.test(elm.name)))
		    	    	elm.checked = document.frmVisiteursList.cbSelectAll.checked
			}
		}
		function CheckAll(){
			j = 0
			re = new RegExp(':chkSelection$') 
			for(i = 0; i < document.frmVisiteursList.elements.length; i++) {
				elm = document.frmVisiteursList.elements[i]
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

    <form id="frmVisiteursList" runat="server">
    	<Clinique:Top id="top" runat="server" />
    	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
			<tr>
    			<td width="140" valign=top>
    				<p><!-- Left --></p>
    				<p><Clinique:Left_Admin id="Left" runat="server" /></p>
				</td>
				
				<td width="620" valign=top>
    				<table width="100%">
    					<th align="left" colspan="2"><a href="default.aspx">Accueil</a> > Statistiques</th>
						<tr>
							<td width="10"></td>
							<td>
								<br>
								<p>							
									<asp:Button ID="btnDelete" CssClass="Button" Text="Supprimer" OnClick="DeleteVisiteur" Runat="server" Width="60" />&nbsp;	
									<asp:Button CssClass="Button" Text="Retour" OnClick="Retour" Runat="server" Width="60" />									
								</p>							
								<p>
									<b>Satistiques globales: </b><hr>
									<table>
										<tr>
											<td><b>Jour:</b></td>
											<td><asp:Label ID="Nbr_Visiteurs_jour" Runat=server /></td>
										</tr>
										<tr>
											<td><b>Mois:</b></td>
											<td><asp:Label ID="Nbr_Visiteurs_mois" Runat=server /></td>
										</tr>
										<tr>
											<td><b>Années:</b></td>
											<td><asp:Label ID="Nbr_Visiteurs_annees" Runat=server /></td>
										</tr>
										<tr>
											<td><b>Total:</b></td>
											<td><asp:Label ID="Nbr_Visiteurs_total" Runat=server /></td>
										</tr>
									</table>
								</p>
								<p>
									<b>List des statistiques sur les visiteurs: </b><hr>					
									<asp:DataGrid ID="VisiteursGrid" Runat="server" Width="100%"
										HeaderStyle-CssClass="Th" 
										ItemStyle-CssClass="Td"
										AutoGenerateColumns="False" 
										OnItemCommand="ViewVisiteur" 
										PagerStyle-Mode="NumericPages" 
										OnPageIndexChanged="NewPage" 
										AllowPaging=True PageSize="10" 
										CellSpacing="1" 
										CellPadding="4" 
										GridLines=None >							
										<Columns>
										 	<asp:BoundColumn DataField="Nu_Visiteur" HeaderText="Nu_Visiteur"  Visible=False/>
										  	<asp:TemplateColumn>
										    	<HeaderTemplate>
										    		<input type="CheckBox" name="cbSelectAll" OnClick="SelectAll('chkSelection')">
										    	</HeaderTemplate>
										        <ItemTemplate>
										        	<asp:CheckBox ID="chkSelection" Runat="server"/>
										        </ItemTemplate>
										   	</asp:TemplateColumn>					
											<asp:ButtonColumn ButtonType=LinkButton CommandName="View" DataTextField="Ip_Adress" HeaderText="Ip Adresse" />												
											<asp:BoundColumn DataField="Date_Heure" HeaderText="Date" DataFormatString="{0:d}" />    
											<asp:BoundColumn DataField="Date_Heure" HeaderText="Heure" DataFormatString="{0:hh:mm}" />   
			  							</Columns>
									</asp:DataGrid>
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
		btnDelete.Attributes.Add("OnClick", "javascript:return CheckAll()");
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		int Visiteurs_jour =0, Visiteurs_mois =0, Visiteurs_annees =0, Visiteurs_total =0;
		try{
			connection.Open();
			SqlCommand cmd_1 = new SqlCommand	("select count (*) from Visiteurs where Day(Date_Heure) =" +DateTime.Now.Day, connection);
			Visiteurs_jour = (int) cmd_1.ExecuteScalar ();
		}
		finally{
			connection.Close ();
		}
		try{
			connection.Open();
			SqlCommand cmd_2 = new SqlCommand	("select count (*) from Visiteurs where Month(Date_Heure) =" +DateTime.Now.Month, connection);
			Visiteurs_mois = (int) cmd_2.ExecuteScalar ();
		}
		finally{
			connection.Close ();
		}
		try{
			connection.Open();
			SqlCommand cmd_3 = new SqlCommand	("select count (*) from Visiteurs where Year(Date_Heure) =" +DateTime.Now.Year, connection);
			Visiteurs_annees = (int) cmd_3.ExecuteScalar ();
		}
		finally{
			connection.Close ();
		}
		try{
			connection.Open();			
			SqlCommand cmd_4 = new SqlCommand	("select count (*) from Visiteurs", connection);
			Visiteurs_total= (int) cmd_4.ExecuteScalar ();
		}
		finally{
			connection.Close ();
		}
		Nbr_Visiteurs_jour.Text = Visiteurs_jour.ToString ();
		Nbr_Visiteurs_mois.Text = Visiteurs_mois.ToString ();
		Nbr_Visiteurs_annees.Text = Visiteurs_annees.ToString ();
		Nbr_Visiteurs_total.Text = Visiteurs_total.ToString ();	
		connection.Open ();
		SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Visiteur, Ip_Adress, Date_Heure from Visiteurs order by Date_Heure DESC", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		VisiteursGrid.DataSource = ds;
		VisiteursGrid.DataBind ();	
	}
}
void NewPage (Object sender, DataGridPageChangedEventArgs e)
{
	VisiteursGrid.CurrentPageIndex = e.NewPageIndex;
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Visiteur, Ip_Adress, Date_Heure from Visiteurs order by Date_Heure DESC", connection);	
	DataSet ds = new DataSet();
	adapter.Fill(ds);
	VisiteursGrid.DataSource = ds;
	VisiteursGrid.DataBind ();	
}
void DeleteVisiteur(Object sender, EventArgs e)
{	
	int count = 0;
	StringBuilder Selections = new StringBuilder();
    foreach(DataGridItem dgItem in VisiteursGrid.Items){
    	CheckBox chkSelected = (CheckBox)dgItem.FindControl("chkSelection");
        if (chkSelected.Checked){
        	count++;	
        	Selections.Append("'"+dgItem.Cells[0].Text+"', ");
		}	
	}
	SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
	try {
		connection.Open();
		SqlCommand command = new SqlCommand	("delete from Visiteurs where Nu_Visiteur in (" + Selections.ToString () + "'')", connection);
		command.ExecuteNonQuery ();
		Response.Redirect("ListVisiteursStats.aspx");
		}
	finally {
		connection.Close ();
	}
}
void ViewVisiteur (Object sender, DataGridCommandEventArgs e)
{
	if (e.CommandName == "View")
		Response.Redirect ("ViewVisiteurStat.aspx?Nu_Visiteur=" + e.Item.Cells[0].Text);
}
void Retour ( Object sender, EventArgs e)
{
	Response.Redirect("default.aspx");
}
string StringIp( long IpAddress)
{ ;
	long w = IpAddress % 255;
	long x = ((IpAddress - w)/255) % 255;
	long y = (((IpAddress - w)/255) - x)/255 % 255;
	long z = (((((IpAddress - w)/255) - x)/255) - y)/255 % 255;
	return	z.ToString() + "." + y.ToString() + "." + x.ToString() + "." + w.ToString() ;
}
</script>
