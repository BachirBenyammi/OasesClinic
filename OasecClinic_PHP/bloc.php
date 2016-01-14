<?	include("./stat.php"); ?>
<? $Text = "Bloc opératoire";?>
<html>
	<head>
		<title>Clinique des Oasis - <?=$Text?></title>
		<script language="Javascript" src="style/js.js"></script>
		<link type=text/css href="./style/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
		<? include("./menu.php") ?>		
		<? include("./top.php") ?>  
		<? include("./center.php")	?>
<table align="center" cellspacing="0"width="760" height="340" bgcolor="#EBF4E3" cellpadding="0" border="1">
			<tr>
				<td valign=top>
    				<table width="100%">
						<tr>
							<td width=10></td>
							<td>
								<br>
								<p>		
									<table cellspacing="10">
										<tr>
											<td>								
													&nbsp;&nbsp;&nbsp;&nbsp; Quatre salles opératoires plus une salle du bloc septique, spacieuses, elles sont 
												équipées du matériel d’anesthésie réanimation le plus performant, conçues selon 
												les normes internationales
											</td>
											<td align=center><img src="images/Bloc1.jpg" width="200" height="150" border="1"></td>
										</tr>
										<tr>
											<td align=center><img src="images/Bloc2.jpg" width="200" height="150" border="1"></td>
											<td>
												&nbsp;&nbsp;&nbsp;&nbsp; Toutes les salles opératoires sont équipées d’un matériel 
												sophistiqué et de caméras qui sont branchées à un système de  retransmission en direct 
												dans la salle de conférences
											</td>
										</tr>											
										<tr align=center>
											<td><img src="images/Bloc3.jpg" width="200" height="150" border="1"></td>	
											<td><img src="images/Bloc4.jpg" width="200" height="150" border="1"></td>
										</tr>																																																	
									</table>	
									<ul>
										<li><a class=link href="Salles.php#Coelio">Salle de Coeliochirurgie</a></li>
										<li><a class=link href="Salles.php#Orthop">Salle d’Orthopédie</a></li>
										<li><a class=link href="Salles.php#Arthro">Salle d’Arthroscopie</a></li>
										<li><a class=link href="Salles.php#Valvul">Salle de Chirurgie cardiaque valvulaire</a></li>
										<li><a class=link href="Salles.php#Reveil">Salle de Réveil sous monitoring</a></li>
										<li><a class=link href="Salles.php#Reanim">Salle de Réanimation</a></li>
										<li><a class=link href="Salles.php#Dechoquage">Salle de Déchoquage</a></li>
										<li><a class=link href="Salles.php#Septique">Bloc Septique</a></li>
									</ul>
								</p>
								<p><input class="Button" type="button" value="Départements" onClick="javascript: location.href = 'departements.php'"></p>
							</td>
						</tr>	
					</table>
   				</td>
    		</tr>
    	</table>
	<? include("./buttom.php") ?>
</body>
</html>