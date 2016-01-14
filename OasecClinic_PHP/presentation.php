<?	include("./stat.php"); ?>
<? $Text = "Présentation"; ?>
<html>
	<head>
		<title>Clinique des Oasis - <?=$Text?></title>
		<script language="Javascript" src="style/js.js"></script>
		<link type=text/css href="./style/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
	<? include("./menu.php") ?>		
	<? include("./top.php") ?>  
	<? include("./center.php") ?>
	
	<table align="center" cellspacing="0" width="760" height="340" bgcolor="#EBF4E3" cellpadding="0" border="1">
		<tr>
			<td valign=top>
   				<table width="100%">
   					<tr>
   						<td width="10"></td>
   						<td>
							<br>					
							<p>
									<img src="images/clinique.jpg" width="200" height="150" border="1" align=right>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; La CLINIQUE des OASIS a été inauguré 
								par M. le Ministre algérien de la santé, le 6 Mai 2002.
							</p>							
							<p>			
									&nbsp;&nbsp;&nbsp;&nbsp; La CLINIQUE des OASIS est une structure qui répond aux 
									normes internationales, elle réunit les conditions requises pour une médecine 
								moderne et de qualité.
							</p>
							<p>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; La clinique était, à l’origine, 
								destiné uniquement aux check-up, c’est-à-dire les 
								bilans médicaux, en moins de 12 heures. Mais après, il a été constaté 
								la nécessité d’installer des blocs opératoires pour la neurochirurgie, 
								les chirurgies cardiaque, maxillo-faciale et la médecine interne.
							</p>								
								<p>&nbsp;&nbsp;&nbsp;&nbsp; La clinique est équipée d’un matériel de 
									pointe pour la réanimation et la prise en charge des cas d’urgence avec des appareils 
								modernes de surveillance.
							</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp; La clinique a pour vocation de vous apporter 
									un diagnostic précis et des soins personnalisés dans les meilleures conditions 
								de confort, d'accueil et de rapidité. Grâce à une équipe médicale 
								et soignante de haut niveau et un plateau technique performant.
							</p>
							<p>
									&nbsp;&nbsp;&nbsp;&nbsp;Cet investissement a pour que les Algériens n’aillent plus 
									aux pays voisins ou en Europe pour se faire soigner, ils auront tout ici et au moindre coût. 
							</p>								
							<p>
								<ul>
									<li><a class=link href="actualites.php">Actualités et événements</a></il>					
									<li><a class=link href="specialites.php">Spécialités médicales disponibles dans la clinique</a></il>
									<li><a class=link href="structure.php">Structure générale de la clinique</a></il>
									<li><a class=link href="departements.php">Départements médicales de la clinique</a></il>
									<li><a class=link href="services.php">Autres services</a></il>
									<li><a class=link href="address.php">Comment se rendre à la clinique ?</a></il>
								</ul>
							</p>
								<p><input class="Button" type="button" value="Accueil" onClick="javascript: location.href = 'index.php'"></p>
					</td></tr>
   				</table>
			</td>

   		</tr>
   	</table>
	<? include("./buttom.php") ?>  
</body>
</html>