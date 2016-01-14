<%@ Control%>
<%@ Import NameSpace="CliniqueSite"%>
<%@ Register Tagprefix="Clinique" TagName="Menu" src="menu.ascx"%>
<Clinique:Menu id="Menu" runat="server" />
<table bgcolor=#6698FF width="140">
	<th>Utilisateur</th>
	<tr><td>Bien venu M. <% Response.Write(Context.User.Identity.Name);%></td></tr>
    <tr><td><a class="Menu">Mon Profit</a></td></tr>   
	<tr><td><a href="Logout.aspx" class="Menu">D�connexion</a></td></tr>
	<tr><td><br></td></tr>
	<th>Secr�tariat</th>
	<tr><td><a href="ListNews.aspx" class="Menu">Actualit�s</a></td></tr>
	<tr><td><a href="ListSpecialites.aspx" class="Menu">Sp�cialit�s</a></td></tr>
	<tr><td><a href="SM.aspx" class="Menu">Services M�dicaux</a></td></tr>
	<tr><td><a href="ListSondages.aspx" class="Menu">Sondages</a></td></tr>
	<tr><td>Rendez-vous</td></tr>
	<tr><td>Q&amp;R</td></tr>
	<tr><td><br></td></tr>
	<%Functions fun = new Functions(); 
	string Droit = fun.GetUserRole(Context.User.Identity.Name);
	if ((Droit == "Administrateur")||(Droit == "Directeur")||(Droit == "Webmaster")){%>
		<th>Administration</th>
		<tr><td><a href="ListSignatures.aspx" class="Menu">Livre d'or</a></td></tr>
		<tr><td><a href="ListAbonnees.aspx" class="Menu">Abonn�es</a></td></tr>
		<tr><td><a href="ListUtilisateurs.aspx" class="Menu">Utilisateurs</a></td></tr>
		<tr><td><a href="ListVisiteursStats.aspx" class="Menu">Stat. Visiteurs</a></td></tr>
		<tr><td><a href="ListUsersStats.aspx" class="Menu">Stat. Utilisateurs</a></td></tr>
		<tr><td><a href="ListContacts.aspx" class="Menu">Contacts</a></td></tr>	
		<tr><td><br></td></tr>
	<%}
	if (Droit == "Webmaster"){%>
		<th>Webmaster</th>
		<tr><td><a href="ListErreurs.aspx" class="Menu">Erreurs</a></td></tr>
	<%}%>		
		<tr><td><br></td></tr>
</table>
