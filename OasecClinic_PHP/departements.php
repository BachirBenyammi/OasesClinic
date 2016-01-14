<?	include("./stat.php"); ?>
<?	$Text = "Départements";?>
<html>
	<head>
		<title>Clinique des Oasis - <?=$Text?></title>
		<script language="Javascript" src="style/js.js"></script>
		<link type=text/css href="./style/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
	<? include("./menu.php") ?>		
	<? include("./top.php") ?>  
	<? include("./center.php")?>
<table align="center" cellspacing="0" width="760" height="340" bgcolor="#EBF4E3" cellpadding="0" border="1">
			<tr>
				<td valign=top>
    				<table width="100%">
						<tr>
							<td width=10></td>
							<td>
								<br>
								<p>
									La clinique se compose de trios blocs principaux:<br>
									<ul>
					  					<li><a class=link href="Consultations.php">Consultations</a></li>									
					  					<li><a class=link href="Urgences.php">Urgences</a></li>
					  					<li><a class=link href="Hospitale.php">Hospitalisation</a></li>
					  				</ul>
								</p>
									<p>Les départements sont distribués de la façon suivante					
									<ul>
										<li>Consultations</li>
											<ul>
												<li><a class=link href="Reception.php">Hall d'accueil</a></li>
												<li><a class=link href="Labos.php">Laboratoires</a></li>
											</ul>	
									</ul>
									<ul>
										<li>Urgences</li>
											<ul>
												<li><a class=link href="Cardio.php">Cardiologie</a></li>
												<li><a class=link href="Imagerie.php">Imagerie</a></li>
												<li><a class=link href="Bloc.php">Bloc opératoire</a></li>												
											</ul>
									</ul>										
									<ul>				
										<li>Hospitalisation</li>		
										<ul>
											<li><a class=link href="Maternite.php">Maternité</a></li>
												<li><a class=link href="Reeducation.php">Rééducation fonctionnelle</a></li>
											<li><a class=link href="Remise.php">Remise en forme</a></li>
										</ul>		
									</ul>							
								</p>
								<p><input class="Button" type="button" value="Accueil" onClick="javascript: location.href = 'index.php'"></p>
							</td>
						</tr>	
					</table>
   				</td>
    		</tr>
    	</table>
	<? include("./buttom.php") ?> 
</body>
</html>
