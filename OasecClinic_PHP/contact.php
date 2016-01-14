<?	include("./stat.php"); ?>
<?
if (isset($act))
	if ($act=='add')
	{
		include ('./connect.php');
		$sql = "INSERT INTO contacts (Sujet, Message, Email, Date_Heure) VALUES ('".$Sujet."', '".$Message."', '".$Email."', now())";
		$result = mysql_query($sql);
		header('Location: contact.php?act=ok');
	}
?>
<? $Text = "Contact";?>
<html>
	<head>
		<title>Clinique des Oasis - <?=$Text?></title>
		<script language="Javascript" src="style/js.js"></script>
		<link type=text/css href="./style/style.css" rel=stylesheet>
		<script language="javascript">
			function valideEmail(Email)
			{
				if (document.frm.Email.value.indexOf('@')==-1)
					return false
				else
					return true
			}
			function verif()
			{
				if (!document.frm.Email.value || !document.frm.Sujet.value || !document.frm.Message.value)
					{
						alert ('Tous les champs sont obligatoire !!');
						return false;
						exit;
					}
				if (!valideEmail(document.frm.Email.value))
					{
						alert ('Email non valide !!');
						return false;
						exit;
					}			
			}
		</script>
	</head>
	<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
		<form name="frm" method="post" action="contact.php?act=add">
			<? include("./menu.php") ?>		
			<? include("./top.php") ?>  
			<? include("./center.php") ?>
			
		<table align="center" cellspacing="0"width="760" height="340" bgcolor="#EBF4E3" cellpadding="0" border="1">
				<tr>
					<td valign=top>
						<table width="100%">
							<tr>
								<td width=10 rowspan="2"></td>
								<td>
								<br>
								<p><h3 align="center">
									<?
									if (isset($act))
										if ($act=="ok")
											print "Merci d'avoir posez votre message";
									?>
								</h3></p>
								<p>
									<table align="center">
										<tr>
											<td>Email: </td>
											<td><input type="text" name="Email"> *</td>										
										</tr>							
										<tr>
											<td>Sujet: </td>
											<td><input type="text" name="Sujet"> *</td>												
										</tr>										
										<tr>
											<td valign="top">Message:</td>
											<td valign="top">
												<textarea name="Message" cols="50" rows="7"></textarea> *
											</td>																							
										</tr>
									</table>
									<p align=center>
										<input class="Button" type="submit" value="Envoyer" onClick="javascript: return verif()">&nbsp;
										<input class="Button" type="reset" value="Effacer">
									</p>
								<p><input class="Button" type="button" value="Accueil" onClick="javascript: location.href = 'index.php'"></p>									
							</td></tr>
						</table>
					</td>
				</tr>
			</table>
			<? include("./buttom.php") ?>
		</form>
</body>
</html>