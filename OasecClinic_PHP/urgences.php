<?	include("./stat.php"); ?>
<? $Text = "Urgences et soins intensifs";?>
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
							<td width=10></td>
							<td>
								<br>
								<p>		
									<table cellspacing="10">
										<tr>
											<td>
												&nbsp;&nbsp;&nbsp;&nbsp; La clinique mit � votre disposition un service �quip� 
												d'un mat�riel de pointe pour la r�animation et la prise en charge rapide et 
												pr�cise des cas d'urgences avec des appareils modernes de surveillance.<br><br>
												&nbsp;&nbsp;&nbsp;&nbsp; Le service des urgences m�dicochirurgicales fonctionne 
												en permanence 7/7 et 24h/24																			
											</td>
											<td align=center><img src="images/Urgence.jpg" width="200" height="150" border="1"></td>
										</tr>
										<tr align=center>
											<td><img src="images/Medecin.jpg" width="200" height="250" border="1"></td>	
											<td><b>Dr DABOUZ Yacine, m�decin de garde.</b></td>
										</tr>		
										<tr align=center>
											<td><b>Ambulance</b></td>
											<td><img src="images/Ambulance.jpg" width="200" height="150" border="1"></td>	
										</tr>		
										<tr align=center>
											<td><img src="images/Heliport.jpg" width="200" height="150" border="1"></td>										
											<td></a><b>H�liport</b><br>pour les �vacuations d�urgence</td>	
										</tr>																																																		
									</table>	
								</p>
								<p><input class="Button" type="button" value="D�partements" onClick="javascript: location.href = 'departements.php'"></p>
							</td>
						</tr>	
					</table>
   				</td>
    		</tr>
    	</table>
		<? include("./buttom.php") ?>   
</body>
</html>