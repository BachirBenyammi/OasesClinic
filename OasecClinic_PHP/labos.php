<?	include("./stat.php"); ?>
<? $Text = "Laboratoires";?>
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
												&nbsp;&nbsp;&nbsp;&nbsp; Le laboratoire est équipe de matériel sophistique  avec 
												contrôle de qualité, fiabilité et rapidité.																		
											</td>
											<td align=center><img src="images/Labo1.jpg" width="200" height="150" border="1"></td>
										</tr>
										<tr align=center>
											<td><img src="images/Labo2.jpg" width="200" height="150" border="1"></td>	
											<td><img src="images/Labo3.jpg" width="200" height="150" border="1"></td>	
										</tr>		
										<tr align=center>
											<td><b>BIOCHIMIE BACT&Eacute;RIOLOGIE, PARASITOLOGIE et MYCOLOGIE</b></td>
											<td><img src="images/Labo4.jpg" width="200" height="150" border="1"></td>
										</tr>	
										<tr align=center>
											<td><img src="images/Labo5.jpg" width="200" height="150" border="1"></td>	
											<td><b>H&Eacute;MATOLOGIE et S&Eacute;ROLOGIE</b></td>
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