<?	include("./stat.php"); ?>
<? $Text = "Consultations";?>
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
<table align="center" cellspacing="0"width="760" height="340" bgcolor="#EBF4E3" cellpadding="0" border="1">
			<tr>
				<td valign=top>
    				<table width="100%">
						<tr>
							<td width=10></td>
							<td>
								<br>
								<p>		
									&nbsp;&nbsp;&nbsp;&nbsp; Chaque médecin spécialiste 
									dispose d'un bureau de consultation et d'un salle d'attente.				
									<table cellspacing="10">
										<tr>
											<td>
												<b>Salle de consultation NEURO:</b><br><br>
												&nbsp;&nbsp;&nbsp;&nbsp; La salle de consultation de NEUROLOGIE dispose du matériel 
												d’explorations neurologiques: EEG, EMG, POTENTIELS EVOQUES AUDITIF, VISUEL et SOMESTHESIQUE.	
											</td>
											<td align=center><img src="images/Neuro1.jpg" width="200" height="150" border="1"></td>
										</tr>
										<tr align=center>
											<td><img src="images/Neuro2.jpg" width="200" height="150" border="1"></td>	
											<td><img src="images/Neuro3.jpg" width="200" height="150" border="1"></td>
										</tr>	
										<tr>
											<td>
												<b>Salle de consultation ORL:</b><br><br>
												&nbsp;&nbsp;&nbsp;&nbsp; Fauteuil de consultation O.R.L avec Microscope et explorations: 
													AUDIOM&Eacute;TRIE, IMPEDANCEMETRIE, VIDEONYSTAGMOGRAPHIE, POTENTIEL EVOQUE AUDITIF, ECHO des SINUS, 
												NASOFIBROSCOPE avec camera.
											</td>
											<td align=center><img src="images/Orl.jpg" width="200" height="150" border="1"></td>
										</tr>										
										<tr>
											<td colspan="2">
												<b>Salle d'attente:</b><br><br>
												&nbsp;&nbsp;&nbsp;&nbsp; Les salles d’attente sont aérées, spacieuses et sont équipées 
												d’un moniteur de télévision avec plusieurs chaînes et de l’air conditionné été – hiver 
											</td>
										</tr>
										<tr align=center>
											<td><img src="images/Attente1.jpg" width="200" height="150" border="1"></td>
											<td><img src="images/Attente2.jpg" width="200" height="150" border="1"></td>
										</tr>																			
									</table>	
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