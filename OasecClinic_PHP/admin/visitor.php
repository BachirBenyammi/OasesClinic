<? include ("./../stat.php"); ?>
<?
	if (!session_is_registered("account") || !session_is_registered('password'))
		header ("Location: login.php");

	$nuvisiteur = $HTTP_GET_VARS["nuvisiteur"];

	function CheckNu($nuvisiteur)
	{
		include ("./../connect.php");
		$sql = "select * from visiteurs where Nu_Visiteur=$nuvisiteur";
		$result = mysql_query($sql);
		$num = mysql_num_rows($result);
		return ( $num > 0 );
	}
	
	if (isset($nuvisiteur))
	{	
		if (CheckNu($nuvisiteur)) 
		{
			include ("./../connect.php");
			$sql = "select Page, Lien, Language, Ip_Adresse, Navigateur, os, Date_Heure from Visiteurs where Nu_Visiteur=$nuvisiteur";
			$result = mysql_query($sql);	
			
			while ($col=mysql_fetch_row($result))					
			{
				$Page = $col[0];	
				$Lien = $col[1];
				$Language = $col[2];
				$Ip_Adress = $col[3];
				$Navigateur = $col[4];	
				$os = $col[5];
				$Date_Heure = $col[6];				
				if ($Page == "Unknoun") $Page .= " <img src='./../style/unknoun.gif'>";
				if ($Lien == "Unknoun") 
					$Lien .= " <img src='./../style/unknoun.gif'>";
				else
					$Lien = '<a class=link href="<?=$Lien;?>" target="_blank"><?=$Lien;?></a>';
				if ($Language == "Unknoun") $Language .= " <img src='./../style/unknoun.gif'>";
				if ($Ip_Adress == "Unknoun") 
					$Ip_Adr = $Ip_Adress . " <img src='./../style/unknoun.gif'>";
				else
					$Ip_Adr = '<a target="_blank" class=link href="./pays.php?ip='.$Ip_Adress.'">'.$Ip_Adress.'</a>';
				if ($Navigateur == "Unknoun") $Navigateur .= " <img src='./../style/unknoun.gif'>";
				if ($os == "Unknoun") $os .= " <img src='./../style/unknoun.gif'>";																			
			}
		}
		else 
			header("Location: ./../error.php");
	}
		else 
			header("Location: ./../error.php");		
?>
<? $Text = $Ip_Adress; ?>
<html>
	<head>
		<title>Clinique des Oasis - <?=$Text?></title>
		<script language="Javascript" src="../style/js.js"></script>
		<link type=text/css href=".././style/style.css" rel=stylesheet>
		<script language="javascript">
		function deleteit()
		{
		   	return confirm('A ce que vous etre sure ?')					
		}		
		function redirect()
		{
			location.href = "stats.php";
		}
		</script>				
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

    <form name="frm" method="post" action="stats.php?act=del">		
		<? include("./top.php") ?>  
		<? include("./center.php") ?>
		<? include("./menu.php") ?>
    	<table align="center" cellspacing="0" width="760" height="340" bgcolor="#EBF4E3" cellpadding="0" border="1">
			<tr>
				<td valign=top>
    				<table width="100%">			
						<tr>
							<td width="10"></td>
							<td>
								<br>
								<p>
									<input type="submit" value="Supprimer" class="Button" OnClick="javascript:return deleteit();">&nbsp;
									<input type="button" value="Reteur" class="Button" onClick="javascript: redirect();">
								</p>
								<p>
									<table>
										<tr>
											<td><b>Adresse IP:</b></td>
											<td><?=$Ip_Adr;?></td>
										</tr>
										<tr>
											<td><b>Lien de source:</b></td>
											<td><?=$Lien;?></td>
										</tr>												
										<tr>
											<td><b>Page d'access:</b></td>
											<td><? print $Page;?></td>
										</tr>																									
										<tr>
											<td><b>Date:</b></td>
											<td><? print $Date_Heure;?></td>
										</tr>							
										<tr>
											<td><b>Navigateur:</b></td>
											<td><? print $Navigateur;?></td>
										</tr>
										<tr>
											<td><b>Langue:</b></td>
											<td><? print $Language;?></td>
										</tr>	
										<tr>
											<td><b>Système d'exploitation:</b></td>
											<td><? print $os;?></td>
										</tr>																		
									</table>														
								</p>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
    	<? include("./buttom.php") ?> 
		<input type="hidden" name="numbers" value="<? print "'".$nuvisiteur."'"; ?>">
	</form>
</body>
</html>