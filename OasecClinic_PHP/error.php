<?	include("./stat.php"); ?>
<? $Text = "Erreur !!"; ?>
<html>
	<head>
		<title>Clinique des Oasis - Erreur !!</title>
		<link type=text/css href="./style/style.css" rel=stylesheet>
		<script language="Javascript" src="style/js.js"></script>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
	<? include("./menu.php") ?>		
	<? include("./top.php") ?>  
	<? include("./center.php") ?>
<table align="center" cellspacing="0" width="760" height="340" bgcolor="#EBF4E3" cellpadding="0" border="1">
			<tr>
				<td valign=top>
    				<table width="100%">
    					<tr><td>
    						<br>
    						<blockquote>
    						<p align=justify>
    							Une erreur est survenu peut être à cause d'un 
								mouvais remplie ou bien d'un bug au code, 
								Nous sommes vraiment désolé<br><br>
								Retour au <a class=link href="index.php">Page d'accueil</a>
							</p>
							</blockquote>
    					</td></tr>
    				</table>
   				</td>
    		</tr>
    	</table>
   	<? include("./buttom.php") ?>  
</body>
</html>