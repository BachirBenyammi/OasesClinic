<?	include("./stat.php"); ?>
<? $Text = "Hall d'accueil";?>
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
									<table width="100%" cellspacing="10">
										<tr>
											<td>
												&nbsp;&nbsp;&nbsp;&nbsp; Un personnel attentif et comp�tent est charg� de fixer les 
												rendez-vous, orienter les patients et fournir les renseignements pratiques pour vous 
												aider � organiser votre d�placement et votre s�jour �ventuel dans la clinique.
											</td>
											<td align=center><img src="images/accueil3.jpg" width="200" height="150" border="1"></td>
										</tr>								
										<tr align=center>
											<td><img src="images/accueil1.jpg" width="200" height="150" border="1"></td>	
											<td><img src="images/accueil2.jpg" width="200" height="150" border="1"></td>
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
