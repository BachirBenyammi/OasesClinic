<?	include("./stat.php"); ?>
<?	$Text = "Actualités";?>
<html>
	<head>
		<title>Clinique des Oasis - <?=$Text?></title>
		<script language="Javascript" src="style/js.js"></script>
		<link type=text/css href="./style/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

    <form>
		<? include("./menu.php") ?>		
		<? include("./top.php") ?>  
		<? include("./center.php")?>
<table align="center" cellspacing="0" width="760" height="340" bgcolor="#EBF4E3" cellpadding="0" border="1">
			<tr>
				
				<td valign=top>
    				<table width="100%">
						<tr>
							<td width=10 rowspan="2"></td>
							<td>
								<br>
								<blockquote>								
								<table width="80%">							
								<?
									include ("connect.php");
									$sql = "select Nu_News, Titre, Date_Heure from News order by Date_Heure DESC";				
									$result = mysql_query($sql);	
			
									while ($col=mysql_fetch_row($result))					
									{
										$Nu_News = $col[0];									
										$Titre = $col[1];		
										$Date_Heure = $col[2];						
								?>
									<tr>
										<td>
											<img src="style/news.gif" align=absmiddle>
											<?	print "<a class=link href='actualite.php?nunews=$Nu_News'>$Titre</a><br>"; ?>
										</td>
										<td align="left"><? print $Date_Heure; ?></td>										
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
    </form>
</body>
</html>