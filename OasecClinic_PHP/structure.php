<?	include("./stat.php"); ?>
<? $Text = "Structure générale"; ?>
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
   						<td width="10"></td>
   						<td>
							<br>	
							<p>	
								<table>
									<tr>
										<td>
											&nbsp;&nbsp;&nbsp;&nbsp; <p>La structure générale de la CLINIQUE des OASIS est sous forme d'un cœur compose de trios parties 	principales:</p>
											<ul>
											  <li>Partie bleue (Urgences)</li>
									          <li>Partie orange (Consultations)</li>
									          <li>Partie jaune (Hospitalisation)</li>
									    	</ul>
										</td>
										<td><img src="images/plan.jpg" width="200" height="150" border="1" align=right></td>
								  </tr>
									<tr align=center>
										<td><img src="images/urgences.jpg" width="200" height="150" border="1"></td>
										<td><b>Couloir d'urgences</b></td>			
									</tr>	
									<tr align=center>
										<td><b>Couloire consultations</b></td>
										<td><img src="images/consultation.jpg" width="200" height="150" border="1"></td>									
									</tr>
									<tr align=center>
										<td><img src="images/hospital.jpg" width="200" height="150" border="1"></td>										
										<td><b>Couloir d'hospitalisation</b></td>
									</tr>								
								</table>			
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