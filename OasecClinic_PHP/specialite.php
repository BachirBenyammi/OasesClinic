<?	include("./stat.php"); ?>
<?
$nuspecialite = $HTTP_GET_VARS["nuspecialite"];

function CheckNu($nuspecialite)
{
	include ("connect.php");
	$sql = "select * from Specialites where Nu_Specialite=$nuspecialite";
	$result = mysql_query($sql);
	$num = mysql_num_rows($result);
	return ( $num > 0 );
}

if (isset($nuspecialite))
{
	if (CheckNu($nuspecialite))
	{
		include ("connect.php");
		$sql = "select Intituler, Details, Photo from Specialites where Nu_Specialite= " . $nuspecialite;
		$result = mysql_query($sql);

		while ($col=mysql_fetch_row($result))
		{
			$Intituler = $col[0];
			$Details = $col[1];
			$Photo = $col[2];
			if ($Photo == "clinique.jpg" || $Photo =="" || $Photo == null)
				$Photo = "./images/clinique.jpg";
			else
				$Photo = "./images/specialites/" . $Photo;
		}
	}
	else
		header("Location: error.php");
}
	else
		header("Location: error.php");
?>
<? $Text = $Intituler;?>
<html>
		<head>
			<title>Clinique des Oasis - <?=$Text?></title>
			<script language="Javascript" src="style/js.js"></script>
			<link type=text/css href="./style/style.css" rel=stylesheet>
		</head>
		<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
			<? include("./menu.php") ?>
			<? include("./top.php") ?>
			<? include("./center.php")?>
<table align="center" cellspacing="0"width="760" height="340" bgcolor="#EBF4E3" cellpadding="0" border="1">
				<tr>
					<td valign=top>
						<table width="100%">
							<tr>
								<td width="10"></td>
								<td>
									<br>
									<p>
										<b><? print $Intituler ?></b>
									</p>
									<p>
										<img Width=200 Height=150 border="1" hspace="5" align="right" src="<? print $Photo ?>">
										<? print $Details ?>
									</p>
								</td>
							</tr>
							<tr><td></td><td><br><p><input class="Button" type="button" value="Spécialités" onClick="javascript: location.href = 'specialites.php'"></p></td></tr>
						</table>
					</td>
				</tr>
			</table>
			<? include("./buttom.php") ?>
		</body>
	</html>