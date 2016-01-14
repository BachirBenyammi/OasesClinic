<?	include("./stat.php"); ?>
<? $Text = "Plan du Site"; ?>
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
								<ul>
									<li><a class=link href="index.php">Accueil</a></li>
									<li><a class=link href="presentation.php">Présentation</a></li>
									<li><a class=link href="actualites.php">Actualités</a></li>
										<ul>
											<?
												include ("./connect.php");
												$sql = "select Nu_News, Titre, Date_Heure from News order by Date_Heure DESC";				
												$result = mysql_query($sql);	
						
												while ($col=mysql_fetch_row($result))					
												{
													$Nu_News = $col[0];									
													$Titre = $col[1];		
													$Date_Heure = $col[2];			
													print "<li><a class=link href='actualite.php?nunews=$Nu_News'>$Titre</a></li>";
												}			
											?>										
										</ul>
									<li><a class=link href="specialites.php">Spécialités</a></li>
										<ul>
											<?
												include ("./connect.php");
												$sql = "select Nu_Specialite, Intituler from Specialites order by Intituler";
												$result = mysql_query($sql);
												
												while ($col=mysql_fetch_row($result))					
												{
													$Nu_Specialite = $col[0];									
													$Intituler = $col[1];									
													print "<li><a class=link href='specialite.php?nuspecialite=$Nu_Specialite'>$Intituler</a></li>";
												}
											?>									
										</ul>
									<li><a class=link href="departements.php">Départements</a></li>
										<ul>
											<li><a class=link href="Consultations.php">Consultations</a></li>
												<ul>
													<li><a class=link href="Reception.php">Hall d'accueil</a></li>
													<li><a class=link href="Labos.php">Laboratoires</a></li>												
												</ul>
										</ul>
										<ul>
											<li><a class=link href="Urgences.php">Urgences</a></li>
												<ul>
													<li><a class=link href="Cardio.php">Cardiologie</a></li>
													<li><a class=link href="Imagerie.php">Imagerie</a></li>
													<li><a class=link href="Bloc.php">Bloc opératoire</a></li>												
												</ul>
										</ul>
										<ul>
											<li><a class=link href="Hospitale.php">Hospitalisation</a></li>
												<ul>
													<li><a class=link href="Maternite.php">Maternité</a></li>
														<li><a class=link href="Reeducation.php">Rééducation fonctionnelle</a></li>
													<li><a class=link href="Remise.php">Remise en forme</a></li>												
												</ul>
										</ul>

									<li><a class=link href="services.php">Services</a></li>
										<ul>
											<li><a class=link href="services.php#Confer">Salle de conférences</a></li>
											<li><a class=link href="services.php#Cafeteria">Cafétéria</a></li>
											<li><a class=link href="services.php#Parc">Parc</a></li>
											<li><a class=link href="services.php#Navette">Navette</a></li>
										</ul>									
									<li><a class=link href="address.php">Adresse</a></li>
									<li><a class=link href="Sitemap.php">Plan du Site</a></li>
									<li><a class=link href="Contact.php">Contact</a></li>								
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