<?	include("./stat.php"); ?>
<? 
	if (!session_is_registered("intro"))
	{
		session_register('intro');
		header ("Location: intro.php");
	}
?>
<? $Text = "Accueil";?>
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

   		<table align="center" cellspacing="0" width="750" height="340" bgcolor="#EBF4E3" cellpadding="0" border="1">
			<tr>
				<td valign=top>
   					<table width="100%">
	   					<tr>
   							<td width="10"></td>
   							<td>
								<br>					
								<p>
									<img src="images/clinique.jpg" width="200" height="150" border="1" align=right>
									Bienvenue au site web de la Clinique des Oasis de Diangonstic et de Soins
								</p>							
							</td>
						</tr>
   					</table>
				</td>
	   		</tr>
   		</table>
		<? include("./buttom.php") ?>   
	</body>
</html>