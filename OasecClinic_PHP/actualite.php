<?	include("./stat.php"); ?>
<? 
$nunews = $HTTP_GET_VARS["nunews"];

function CheckNu($nunews)
{
	include ("connect.php");
	$sql = "select * from News where Nu_News=$nunews";
	$result = mysql_query($sql);
	$num = mysql_num_rows($result);
	return ( $num > 0 );
}

if (isset($nunews))
{	
	if (CheckNu($nunews)) 
	{
		include ("connect.php");
		$sql = "select * from News where Nu_News= " . $nunews;				
		$result = mysql_query($sql);	
		
		while ($col=mysql_fetch_row($result))					
		{
			$Titre = $col[1];	
			$Details = $col[2];			
			$Date_Heure = $col[6];	
			$Photo = $col[3];			
			$Redacteur = $col[4];
			$email = $col[5];		
			if ($Photo == "clinique.jpg" || $Photo =="" || $Photo == null)
				$Photo = "./images/clinique.jpg";
			else
				$Photo = "./images/news/" . $Photo;			
		}
	}
	else
		header("Location: error.php");
}
	else
		header("Location: error.php");		
?>
<? $Text = $Titre;?>
<html>
	<head>
		<title>Clinique des Oasi - <?=$Text?></title>
		<script language="Javascript" src="style/js.js"></script>
		<link type=text/css href="./style/style.css" rel=stylesheet>
	</head>
	<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
		<? include("./menu.php") ?>		
		<? include("./top.php") ?>  
		<? include("./center.php") ?>		
<table align="center" cellspacing="0"width="760" height="340" bgcolor="#EBF4E3" cellpadding="0" border="1">
			<tr>
				<td valign=top>
    				<table width="100%">
						<tr>
							<td width="10"></td>
							<td>
								<br>
								<p>
									<b><? print $Titre; ?></b> <? print $Date_Heure; ?>
								</p>
								<p>
									<img Width=200 Height=150 border="1" hspace="5" align="left" src="<? print $Photo ?>">
									<? print $Details; ?>
								</p>
								<p align=right><b>Rédacteur: </b><? print "<a class=link href='mailto:$email'>$Redacteur</a>" ?></p>								
							</td>
						</tr>
						<tr>
							<td></td>
							<td><br><p><input class="Button" type="button" value="Actualités" onClick="javascript: location.href = 'actualites.php'"></p>													</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	<? include("./buttom.php") ?>
	</form>
</body>
</html>