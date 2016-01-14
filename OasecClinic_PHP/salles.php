<?	include("./stat.php"); ?>
<? $Text = "Salles";?>
<html>
	<head>
		<title>Clinique des Oasis - <?=$Text;?></title>
		<script language="Javascript" src="style/js.js"></script>
		<link type=text/css href="./style/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
		<? include("./menu.php") ?>		
		<? include("./top.php") ?>  
		<? include("./center.php")?>
		
<table align="center" cellspacing="0" width="760" cellpadding="0" border="1" bgcolor="#EBF4E3" height="340">
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
												<a class=link name="Coelio"></a><b>Salle de Coeliochirurgie</b><br><br>
													&nbsp;&nbsp;&nbsp;&nbsp; Chirurgie coelioscopique abdominale (viscérale) et pelvienne (gynécologie) 
											</td>
											<td align=center><img src="images/Coelio.jpg" width="200" height="150" border="1"></td>
										</tr>			
										<tr>
											<td align=center><img src="images/Orthop.jpg" width="200" height="150" border="1"></td>
											<td>								
												<a class=link name="Orthop"></a><b>Salle d’Orthopédie</b><br><br>
													&nbsp;&nbsp;&nbsp;&nbsp; La salle d’orthopédie située en zone hyper propre, permet la mise en 
												place de matériel prothétique : prothèses totales de hanche et de genou 
											</td>		
										</tr>			
										<tr>
											<td>								
												<a class=link name="Arthro"></a><b>Salle d’Arthroscopie</b><br><br>
													&nbsp;&nbsp;&nbsp;&nbsp; Les interventions sur les ménisques et les ligaments par arthroscopie, 
													surtout pur les sportifs, sont assurées à la CLINIQUE des OASIS par une équipe chirurgicale 
												chevronnée disposant d’un matériel de pointe
											</td>
											<td align=center><img src="images/Arthro.jpg" width="200" height="150" border="1"></td>
										</tr>											
										<tr>
											<td align=center><img src="images/Valvul1.jpg" width="200" height="150" border="1"></td>
											<td>								
												<a class=link name="Valvul"></a><b>Salle de Chirurgie cardiaque valvulaire</b><br><br>
													&nbsp;&nbsp;&nbsp;&nbsp; Salle Opératoire de chirurgie cardiaque valvulaire sous CEC et coronarienne à cœur battant
											</td>		
										</tr>		
										<tr>
											<td>								
												<a class=link name="Reveil"></a><b>Salle de Réveil sous monitoring</b><br><br>
													&nbsp;&nbsp;&nbsp;&nbsp; Un personnel attentif et compétent est charge de la surveillance des 
												malades après leur intervention chirurgicale
											</td>
											<td align=center><img src="images/Reveil.jpg" width="200" height="150" border="1"></td>
										</tr>	
										<tr>
											<td align=center><img src="images/Reanim.jpg" width="200" height="150" border="1"></td>
											<td>								
												<a class=link name="Reanim"></a><b>Salles de Réanimation</b><br><br>
													&nbsp;&nbsp;&nbsp;&nbsp; Un personnel attentif et compétent est charge de la surveillance des 
												malades après leur intervention chirurgicale.<br><br>
													&nbsp;&nbsp;&nbsp;&nbsp; Les 2 salles de réanimation post-opératoire et la salle USIC (unité de 
													soins intensifs cardiologiques) sont sous double surveillance : présence effective du personnel 
												de réanimation et monitoring.
											</td>		
										</tr>		
										<tr align=center>
											<td><a class=link name="Dechoquage"><b>Salle de déchoquage (réanimation)</b></td>
											<td><img src="images/dechoquage.jpg" width="200" height="150" border="1"></td>
										</tr>	
										<tr align=center>
											<td><a class=link name="Septique"><img src="images/septique.jpg" width="200" height="150" border="1"></td>	
											<td><b>Bloc septique (petite chirurgie)</b></td>
										</tr>																																																																																								
									</table>	
								</p>
								<p><input class="Button" type="button" value="Bloc opératoire" onClick="javascript: location.href = 'Bloc.php'"></p>
							</td>
						</tr>	
					</table>
   				</td>
    		</tr>
    	</table>
	<? include("./buttom.php") ?>
</body>
</html>