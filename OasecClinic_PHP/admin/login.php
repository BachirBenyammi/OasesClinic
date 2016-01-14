<? include ("./../stat.php"); ?>
<?
$output = "";
function allowentry($account, $password)
{
	return ($account == "benbac" && $password=='softmicro') ||
			($account == "tapho" && $password=='pleiade');
}
if (isset($act))
	if ($act=="login")
		if (allowentry($account, $password))
		{
			session_register("account"); 
			session_register("password");
			header ("Location: index.php");
		}
		else
			$output = "Connexion non valide";
?>
<html>
	<head>
		<title>Connexion</title>
		<link type=text/css href="./.././style/style.css" rel=stylesheet>
	</head>
<body>
	<form action="login.php?act=login" method="post">
		<table width="80%" height="80%"><tr><td valign=center align=center>
			<tr>
				<td>
					<table cellpadding="0" cellspacing="0" align=center>
						<tr>
							<td colspan="2">
								<br>
								<h3>Veuillez vous connecter</h3>
								<hr align=left width="250">
							</td>
						</tr>
						<tr>
							<td>
								<table>
									<tr>
										<td>Compte:</td>
										<td><input type="text" name="account" size="30"></td>
									</tr>
									<tr>	
										<td>Mot de passe:</td>
										<td><input type="password" name="password" size="30"></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">	
								<br>
								<input type="submit" value="Connexion" Class="Button">&nbsp;
								<input type="reset" value="Effacer" Class="Button">
								<h5>
									<? print $output; ?>
								</h5>
								Retourner au <a class=link href="../index.php">Page d&#39;accueil</a>
								<hr align=left width="250">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>