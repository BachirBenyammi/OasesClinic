<? include ("./../stat.php"); ?>
<?
	if (!session_is_registered("account") || !session_is_registered('password'))
		header ("Location: login.php");
	
	if (isset($act))
		if ($act=="add")	
		{
			$Filename = $HTTP_POST_FILES['Photo']['name'];
			copy($Photo, "./../images/news/".$Filename);
			include ("./../connect.php");
			$sql = "insert into news (Titre, Details, Photo, Redacteur, Email, Date_Heure) values ('".$Titre."', '".$Details."', '".$Filename."', '".$Redacteur."', '".$Email."', now())";
			$result = mysql_query($sql);
			header ("Location: ./news.php");
		}					
?>
<? $Text = "Ajouter un nouvel évènement";?>
<html>
	<head>
		<title>Clinique des Oasis - <?=$Text?></title>
		<script language="Javascript" src="../style/js.js"></script>
		<link type=text/css href=".././style/style.css" rel=stylesheet>
		<script language="javascript">
		function reteur()
		{
			location.href = "news.php";
		}
		</script>				
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

    <form name="frm" method="post" action="newnews.php?act=add" enctype="multipart/form-data">		
	
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
									<input type="submit" value="Ajouter" class="Button">&nbsp;
									<input type="button" value="Reteur" class="Button" onClick="javascript: reteur();">
								</p>							
   									<b>Ajouter un nouveau évènement</b><hr>    			
    								<table>
										<tr>										
											<td>Titre: </td>
											<td><input type="text" name="Titre" size="50"></td>								
										<tr>
											<td>Photo: </td>
											<td><input "Photo" Type="file" Size="50" name="Photo"></td>											
										</tr>	
										<tr>
											<td valign="top">Détails:</td>
											<td><textarea name="Details" cols="50" rows="7"></textarea></td>															</tr>		
										<tr>										
											<td>Rédacteur: </td>
											<td><input type="text" name="Redacteur" size="50"></td>												<tr>
										<tr>										
											<td>Email: </td>
											<td><input type="text" name="Email" size="50"></td>	
										<tr>																																									
									</table>
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