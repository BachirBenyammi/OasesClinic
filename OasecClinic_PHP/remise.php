<?	include("./stat.php"); ?>
<? $Text = "Remise en forme";?>
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
									<table cellspacing="10">
										<tr>
											<td>
													&nbsp;&nbsp;&nbsp;&nbsp; Les personnes soumises au stress, les sportifs et les cadres pourront y 
													acc�der sur consultation m�dicale et par abonnement forfaitaire, tout en profitant des conseils 
												de sp�cialistes dans le domaine de l'alimentation de l'hygi�ne de vie.
											</td>
											<td align=center><img src="images/Remise1.jpg" width="200" height="150" border="1"></td>
										</tr>
										<tr align=center>
											<td><img src="images/Remise2.jpg" width="200" height="150" border="1"></td>	
											<td><img src="images/Remise3.jpg" width="200" height="150" border="1"></td>	
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