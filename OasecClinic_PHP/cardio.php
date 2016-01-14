<?	include("./stat.php"); ?>
<? $Text = "Cardoilogie";?>
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
									<table cellspacing="10">
										<tr>
											<td>
												<blockquote>				
										      		Consultations et explorations fonctionnelles:
											  	</blockquote>
											  <ul>
												  <li>&Eacute;preuves d'effort</li>
												  <li>Holter ECG et TA</li>
												  <li>Cardiologie interventionnelle</li>
												  <li>Coronarographie</li>
												  <li>Angioplastie avec mise en place de stent</li>
												  <li>Cathétérisme et pose de pacemaker</li>
												  <li>Cardiologie pédiatrique</li>
												  <li>Chirurgie cardiaque et valvulaire</li>
												</ul>
											</td>
											<td align=center><img src="images/Clinique.jpg" width="200" height="150" border="1"></td>
									  </tr>
										<tr align=center>
											<td><img src="images/ChefCardio.jpg" width="200" height="250" border="1"></td>	
											<td><b>Mr RAGISSE Mohamed, chef service des infirmiers de la cardiologie.</b></td>
										</tr>	
										<tr align=center>
											<td><b>Salle de cathétérisme cardiaque et cardiologie invasive</b></td>
											<td><img src="images/Cathe.jpg" width="200" height="150" border="1"></td>
										</tr>		
										<tr align=center>
											<td><img src="images/Epreuves.jpg" width="200" height="150" border="1"></td>
											<td><b>Salle d'&Eacute;preuves d'effort</b></td>
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