<? include ("./../stat.php"); ?>
<?
	if (!session_is_registered("account") || !session_is_registered('password'))
		header ("Location: login.php");
	
	if (isset($act))
		if ($act=="add")	
		{
			$Filename = $HTTP_POST_FILES['Photo']['name'];	
			copy($Photo, "./../images/specialites/".$Filename);
			include ("./../connect.php");
			$sql = "insert into specialites (Intituler, Photo, Details) values ('".$Intituler."', '".$Filename."', '".$Details."')";
			$result = mysql_query($sql);
			header ("Location: ./specialites.php");
		}				
?>
<? $Text = "Ajouter une nouvelle Spécialité";?> 
<html>
	<head>
		<title>Clinique des Oasis - <?=$Text?></title>
		<script language="Javascript" src="../style/js.js"></script>
		<link type=text/css href=".././style/style.css" rel=stylesheet>
		<script language="javascript">
		function reteur()
		{
			location.href = "specialites.php";
		}
		</script>				
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

    <form name="frm" method="post" action="newspecialite.php?act=add" enctype="multipart/form-data">		
		<? include("./top.php") ?>  
		<? include("./center.php") ?>
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
									<input type="submit" value="Ajouter" class="Button">&nbsp;
									<input type="button" value="Reteur" class="Button" onClick="javascript: reteur();">
								</p>	  							
    								<b>Ajouter une nouvelle Spécialité</b><hr>   
    								<table>
										<tr>
											<td>Intituler: </td>
											<td><input type="text" name="Intituler" size="50">									
											</td>
										</tr>
										<tr>
											<td>Photo: </td>
											<td><input "Photo" Type="file" Size="50" name="Photo"></td>											
										</tr>											
										<tr>
											<td valign="top">Détails:</td>
											<td><textarea name="Details" cols="50" rows="7"></textarea></td>										
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
    </form>
</body>
</html>

	string filename = Photo.PostedFile.FileName.Substring(Photo.PostedFile.FileName.LastIndexOf("\\") + 1 );
	if (filename.Length > 0)
		Photo.PostedFile.SaveAs(MapPath("../images/Specialites/") + filename);
	else filename ="clinique.jpg";	
