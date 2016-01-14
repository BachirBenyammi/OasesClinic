<?
	session_start();
	session_unset();
	session_destroy();
?>
<html>
	<head>
		<title>Déconnexion</title>
		<link type="text/css" href=".././style/style.css" rel="stylesheet">
	</head>
<body>
	<table width="80%" height="80%">
		<tr>
			<td valign="center" align="center">
				<table cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td>
							<br>
							<h3>Vouz avez déconnecter !!</h3>
							<hr>
							<p>Pour retourner, visiter <a class=link href="login.php">La page de connexion</a><br>
							Retourner au <a class=link href="../index.php">Page d&#39;accueil</a> </p>
							<hr>
						</td>
					</tr>
				</table>				
			</td>
		</tr>
	</table>
</body>
</html>
