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
		else 
			header("Location: ./../error.php");
	}
		else 
			header("Location: ./../error.php");		
?>
<? $Text = $Titre; ?>
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
			location.href = "modifnews.php?nunews=" + <? print $nunews ;?>
		}				
		function redirect()
		{
			location.href = "news.php";
		}
		</script>				
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">

    <form name="frm" method="post" action="news.php?act=del">		
		<? include("./top.php") ?>  
		<? include("./center.php") ?>
		<? include("./menu.php") ?>
    	<table align="center" cellspacing="0" width="760" height="340" bgcolor="#EBF4E3" cellpadding="0" border="1">
			<tr>
				<td valign=top>
    				<table width="100%">
    					<tr>
    						<td width=10></td>
    						<td>
    						   <br>
								<p>
									<input type="button" value="Modifier" class="Button" OnClick="javascript: modif();">&nbsp;
									<input type="submit" value="Supprimer" class="Button" OnClick="javascript:return deleteit();">&nbsp;
									<input type="button" value="Reteur" class="Button" onClick="javascript: redirect();">
								</p>		
	    						<p>
									<b><? print $Titre;?></b> <? print $Date_Heure;?>
								</p>
								<p>								
									<img src="<? print $Photo; ?>" border="1" Width=200 Height=150 hspace="5" Align="Right" >
									<? print $Details;?>
								</p>
							</td>
						</tr>		
						<tr>
							<td colspan="2"><p align=right><b>Rédacteur: </b><? print "<a class=link href='mailto:$Email'>$Redacteur</a>";?></p></td>
						</tr>				
					</table>
				</td>
			</tr>
		</table>
    	<? include("./buttom.php") ?> 
		<input type="hidden" name="numbers" value="<? print "'".$nunews."'"; ?>">
	</form>
</body>
</html>