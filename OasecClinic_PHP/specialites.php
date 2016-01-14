<?	include("./stat.php"); ?>
<? $Text = "Spécialités";?>
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
   						<td width="10"></td>
   						<td>
   							<br>
   							<p>La CLINIQUE des OASIS assure les spécialités suivantes:</p>
							<blockquote>
							<table>
							<?
								include ("connect.php");
								$sql = "select Nu_Specialite, Intituler from Specialites order by Intituler";				
								$result = mysql_query($sql);	
		
								while ($col=mysql_fetch_row($result))					
								{
									$Nu_Specialite = $col[0];									
									$Intituler = $col[1];		
							?>
									<tr>
										<td>
											<img src="style/news.gif" align=absmiddle>
											<?	print "<a class=link href='specialite.php?nuspecialite=$Nu_Specialite'>$Intituler</a>" ?>
										</td>							
									</tr>											
							<?							
								}
							?>
							</table>
							</blockquote>
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