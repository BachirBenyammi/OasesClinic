<%@ Page%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Import NameSpace="System.Data"%>
<%@ Import NameSpace="System.Data.SqlClient"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left_Admin" src="leftadmin.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="../../copyright.ascx"%>

<html>
	<head>
		<title>Clinique des Oasis - Spécialités</title>
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
    						<th align="left" colspan="2"><a href="../default.aspx">Accueil</a> > <a href="../SM.aspx">Services Médicaux</a> > Spécialistes</th>
    					<tr>
    					<td width="10"></td>
						<td>
							<br>								
							<b>List des Spécialités</b><hr>
							&nbsp;<asp:DataList ID="dlSpecialite" RepeatColumns="2" Runat=server Width="80%" HorizontalAlign=Center>
								<ItemTemplate>
										<asp:HyperLink runat="server" Text='<%# String.Format("<b>{0}</b>", DataBinder.Eval(Container.DataItem, "Intituler")) %>' NavigateUrl='<%# String.Format("ListSpecialistes.aspx?Nu_Specialite={0}", DataBinder.Eval(Container.DataItem, "Nu_Specialite")) %>' />
									<asp:Label Runat=server Text='<%# String.Format("({0})", DataBinder.Eval(Container.DataItem, "Cnt")) %>' />	
								</ItemTemplate>					
							</asp:DataList></td></tr>
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
		SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"]);
		SqlDataAdapter adapter = new SqlDataAdapter ("select Nu_Specialite, Intituler, Count(Specialite) as Cnt from SM_Specialites, SM_Specialistes where Nu_Specialite = Specialite Group by Nu_Specialite, Intituler order by Intituler", connection);	
		DataSet ds = new DataSet();
		adapter.Fill(ds);
		dlSpecialite.DataSource = ds;
		dlSpecialite.DataBind ();	
	}
}
</script>
