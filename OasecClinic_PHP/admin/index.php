<? include ("./../stat.php"); ?>
<?
	if (!session_is_registered("account") || !session_is_registered('password'))
		header ("Location: login.php");
?>
<? $Text = "Administration du site"; ?>
<html>
	<head>
		<title>Clinique des Oasis - <?=$Text?></title>
		<script language="Javascript" src="./../style/js.js"></script>
		<link type=text/css href="./../style/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">	
	
	<? include("./top.php") ?>  
	<? include("./menu.php") ?>
	<? include("./center.php") ?> 
    	<table align="center" cellspacing="0" width="760" height="340" cellpadding="0" border="1" bgcolor="#EBF4E3">
			<tr>		
				<td valign=top>
    				<table width="100%" align="center">
						<tr>
							<td>
							<?
								include ("./../connect.php");
								
								$sql = "select Nu_News from news";
								$result = mysql_query($sql);
								$news = mysql_num_rows($result);

								$sql = "select Nu_Specialite from specialites";
								$result = mysql_query($sql);
								$specialites = mysql_num_rows($result);
								
								$sql = "select Nu_Visiteur from visiteurs";
								$result = mysql_query($sql);
								$visitors = mysql_num_rows($result);
																																
								$sql = "select Nu_Contact from contacts";
								$result = mysql_query($sql);
								$contacts = mysql_num_rows($result);
						
							?>
							<table width="80%" align="center">
								<tr align="center" height="100">
									<td><br>
										<table border="1" width="70%" height="70%">
											<th><a class=link href="news.php">Actualités</a></th>										
											<tr>								
												<td class="Td" align="center"><?=$news?></td>
											</tr>
										</table>
									</td>
									<td><br>
										<table border="1" width="70%" height="70%">
											<th><a class=link href="specialites.php">Spécialités</a></th>										
											<tr>											
												<td class="Td" align="center"><?=$specialites?></td>												
											</tr>
										</table>												
									</td>
								</tr>
								<tr align="center" height="100">
									<td><br>
										<table border="1" width="70%" height="70%">
											<th><a class=link href="stats.php">Statistiques</a></th>										
											<tr>										
												<td class="Td" align="center"><?=$visitors?></td>												
											</tr>
										</table>												
									</td>
									<td><br>
										<table border="1" width="70%" height="70%">
											<th><a class=link href="contacts.php">Contacts</a></th>																			
											<tr>																												
												<td class="Td" align="center"><?=$contacts?></td>												
											</tr>
										</table>												
									</td>									
								</tr>
							</table>
						</td></tr>
    				</table>
   				</td>
    		</tr>
    	</table>
    	<? include("./buttom.php") ?> 
</body>
</html>
