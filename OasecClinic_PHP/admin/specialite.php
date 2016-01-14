<? include ("./../stat.php"); ?>
<?
	if (!session_is_registered("account") || !session_is_registered('password'))
		header ("Location: login.php");

	$nuspecialite = $HTTP_GET_VARS["nuspecialite"];

	function CheckNu($nuspecialite)
	{
		include ("./../connect.php");
		$sql = "select * from specialites where Nu_Specialite=$nuspecialite";
		$result = mysql_query($sql);
		$num = mysql_num_rows($result);
		return ( $num > 0 );
	}
	
	if (isset($nuspecialite))
	{	
		if (CheckNu($nuspecialite)) 
		{
			include ("./../connect.php");
			$sql = "select Intituler, Details, Photo from Specialites where Nu_Specialite =" .$nuspecialite;				
			$result = mysql_query($sql);	
			
			while ($col=mysql_fetch_row($result))					
			{
				$Intituler = $col[0];	
				$Details = $col[1];
				$Photo = $col[3];
				if ($Photo == "clinique.jpg" || $Photo =="" || $Photo == null)
					$Photo = "../images/clinique.jpg";
				else
					$Photo = "../images/specialites/" .$Photo;				
			}
		}
		else 
			header("Location: ./../error.php");
	}
		else 
			header("Location: ./../error.php");		
?>
<? $Text = $Intituler; ?>
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
		function modif()
		{
			location.href = "modifspecialite.php?nuspecialite=" + <? print $nuspecialite ;?>
		}				
		function redirect()
		{
			location.href = "specialites.php";
		}
		</script>		
	</head>		
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

    <form name="frm" method="post" action="specialites.php?act=del">		
		<? include("./top.php") ?>  
		<?  include("./center.php") ?>
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
									<input type="button" value="Modifier" class="Button" OnClick="javascript: modif();">&nbsp;
									<input type="submit" value="Supprimer" class="Button" OnClick="javascript:return deleteit();">&nbsp;
									<input type="button" value="Reteur" class="Button" onClick="javascript: redirect();">
								</p>												

								<p><b><? print $Intituler;?></b></p>		
								<p>							
									<img src="<? print $Photo; ?>" border="1" Width=200 Height=150 hspace="5" Align=Right >
									<? print $Details;?>
								</p>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
    	<? include("./buttom.php") ?> 
		<input type="hidden" name="numbers" value="<? print "'".$nuspecialite."'"; ?>">
	</form>
</body>
</html>