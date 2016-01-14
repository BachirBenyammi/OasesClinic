<?	include("./stat.php"); ?>
<? $Text = "Addresse";?>
<html>
	<head>
	<title>Clinique des Oasis - <?=$Text?></title>
	<script language="Javascript" src="style/js.js"></script>
	<link type="text/css" href="./style/style.css" rel="stylesheet">
	</head>

<body onload="debuteDate();debuteTemps()" onunload="clearTimeout(ddate);clearTimeout(ttime)">
	<? include("./menu.php") ?>		
	<? include("./top.php") ?>  
	<? include("./center.php")?>
<table align="center" cellspacing="0"width="760" height="340" bgcolor="#EBF4E3" cellpadding="0" border="1">
		<tr>
			<td valign="top">
			<table width="100%">
				<tr>
					<td width="10"></td>
					<td><br>
						<p><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Comment se rendre à la clinique ?</b></p>
						<p>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; La CLINIQUE des OASIS est située au 
							GHARDA&Iuml;A, au 600 km sud Alger la capitale d'Algérie.
						</p>
						<p>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 	Elle est au rote nationale numéro un (R.N 1) qui passe par 
							EL MOUSTADJEB - BOUHRAOUA à l'entrer de la ville de GHARDA&Iuml;A.
						</p>						
						<p align=center><img src="images/clinic.jpg" width="400" height="400" border="1"></p>
						<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Et l'adresse complète est la suivante:</p>
						<p>
	 						&nbsp;&nbsp; EL MOUSTADJEB – BOUHRAOUA<br>
							&nbsp;&nbsp; 47100 GHARDA&Iuml;A
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
