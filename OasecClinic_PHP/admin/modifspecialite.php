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
			if (isset($act))
			{
				if ($act=="modif")
				{
					$Filename = $HTTP_POST_FILES['Photo']['name'];	
					copy($Photo, "./../images/specialites/".$Filename);				
					include ("./../connect.php");
					$sql = "update specialites set Intituler = '".$Intituler."', Details = '".$Details."', Photo = '".$Filename."' where Nu_Specialite =" .$nuspecialite;				
					$result = mysql_query($sql);	
					header("Location: specialite.php?nuspecialite=".$nuspecialite);
				}
			}
			else
			{
				include ("./../connect.php");
				$sql = "select Intituler, Details, Photo from Specialites where Nu_Specialite =" .$nuspecialite;				
				$result = mysql_query($sql);	
				
				while ($col=mysql_fetch_row($result))					
				{
					$Intituler = $col[0];	
					$Details = $col[1];
					$Photo = $col[2];
				}			
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
		function modif()
		{
		   	return confirm('A ce que vous etre sure ?')					
		}					
		function redirect()
		{
			location.href = "specialite.php?nuspecialite=" + <? print $nuspecialite; ?>
		}
		</script>			
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

    <form name="frm" method="post" action="modifspecialite.php?act=modif&nuspecialite=<? print $nuspecialite; ?>" enctype="multipart/form-data">		
		<? include("./top.php") ?>  
		<? include("./center.php")?>
		<? include("./menu.php") ?>
    	<table align="center" cellspacing="0" width="760" height="340" bgcolor="#EBF4E3" cellpadding="0" border="1">
			<tr>			
				<td valign=top>
					<table width="100%">
						<tr>
							<td width="10" rowspan=2></td>
							<td>
								<br>
								<p>
									<input type="submit" value="Modifier" class="Button" OnClick="javascript:return modif();">&nbsp;
									<input type="button" value="Reteur" class="Button" onClick="javascript: redirect();">
								</p>															
    							<p>
   									<b>Modifier une Spécialités</b><hr>    							
									<b>Intituler: </b><br>
									<input type="text" name="Intituler" value="<? print $Intituler; ?>" Size=50>							
								</p>					
								<p>
									<b>Photo:</b> (<? print $Photo; ?>)<br>
									<input Type="file" Size="50" name="Photo">
								</p>															
								<p>								
									<b>Détails: </b><br>
									<textarea name="Details" cols="50" rows="7"><? print $Details; ?></textarea>										
								</p>
								<br>
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