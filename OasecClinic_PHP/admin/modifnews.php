<? include ("./../stat.php"); ?>
<?
	if (!session_is_registered("account") || !session_is_registered('password'))
		header ("Location: login.php");

	$nunews = $HTTP_GET_VARS["nunews"];

	function CheckNu($nunews)
	{
		include ("./../connect.php");
		$sql = "select * from news where Nu_News=$nunews";
		$result = mysql_query($sql);
		$num = mysql_num_rows($result);
		return ( $num > 0 );
	}
	
	if (isset($nunews))
	{	
		if (CheckNu($nunews)) 
		{
			if (isset($act))
			{
				if ($act=="modif")
				{
					$Filename = $HTTP_POST_FILES['Photo']['name'];	
					copy($Photo, "./../images/news/".$Filename);								
					include ("./../connect.php");
					$sql = "update news set Titre = '".$Titre."', Details = '".$Details."', Photo = '".$Filename."', Redacteur = '".$Redacteur."', Email = '".$Email."' where Nu_News =" .$nunews;				
					$result = mysql_query($sql);	
					header("Location: new.php?nunews=".$nunews);
				}
			}
			else
			{
				include ("./../connect.php");
				$sql = "select Titre, Date_Heure, Photo, Details, Redacteur, Email from news where Nu_News =".$nunews;	
				$result = mysql_query($sql);	
				
				while ($col=mysql_fetch_row($result))					
				{
					$Titre = $col[0];	
					$Date_Heure = $col[1];
					$Photo = $col[2];
					$Details = $col[3];
					$Redacteur = $col[4];
					$Email = $col[5];											
					if ($Photo == "clinique.jpg" || $Photo =="" || $Photo == null)
						$Photo = "./../images/clinique.jpg";
					else
						$Photo = "./../images/news/".$Photo;	
				}
			}
		}
		else 
			header("Location: ./../error.php");
	}
		else 
			header("Location: ./../error.php");		
?>
<? $Text = $Titre;?>
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
			location.href = "new.php?nunews=" + <? print $nunews; ?>
		}
		</script>					
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

    <form name="frm" method="post" action="modifnews.php?act=modif&nunews=<? print $nunews; ?>" enctype="multipart/form-data">		
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
									<input type="submit" value="Modifier" class="Button" OnClick="javascript:return modif();">&nbsp;
									<input type="button" value="Reteur" class="Button" onClick="javascript: redirect();">
								</p>									
    							<p>
   									<b>Modifier un évènement</b><hr>    							
									<b>Titre: </b><br>
									<input type="text" name="Titre" value="<? print $Titre; ?>" Size=50>							
								</p>
								<p>
									<b>Photo:</b> (<? print $Photo; ?>)<br>
									<input Type="file" Size="50" name="Photo">
								</p>												
								<p>								
									<b>Détails: </b><br>
									<textarea name="Details" cols="50" rows="7"><? print $Details; ?></textarea>										
								</p>
									<b>Rédacteur: </b><br>
									<input type="text" name="Redacteur" value="<? print $Redacteur; ?>" Size=50>							
								</p>
									<b>Email: </b><br>
									<input type="text" name="Email" value="<? print $Email; ?>" Size=50>							
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