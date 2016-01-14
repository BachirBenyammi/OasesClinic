<?	include("./stat.php"); ?>
<? $Text = "Services";?>
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
												&nbsp;&nbsp;&nbsp;&nbsp; La CLINIQUE des OASIS mit à votre disposition les services suivants:																		
											</td>
											<td align=center><img src="images/Clinique.jpg" width="200" height="150" border="1"></td>
										</tr>	
										<tr align=center>
											<td><a class=link name="Confer"></a><img src="images/Services/Conferences.jpg" width="200" height="150" border="1"></td>	
											<td><b>Salle de conférences</b></td>
										</tr>
										<tr align=center>
											<td><a class=link name="Cafeteria"></a><b>Cafétéria</b></td>										
											<td><img src="images/Services/Cafeteria.jpg" width="200" height="150" border="1"></td>	
										</tr>	
										<tr align=center>
											<td><a class=link name="Parc"></a><img src="images/Services/Parc.jpg" width="200" height="150" border="1"></td>											
											<td><b>Parc</b></td>										
										</tr>																
										<tr align=center>
											<td><b>Navette</b></td>										
											<td><a class=link name="Navette"></a><img src="images/Services/Navette.jpg" width="200" height="150" border="1"></td>	
										</tr>										
										</table>
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