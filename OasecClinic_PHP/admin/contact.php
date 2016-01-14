<? include ("./../stat.php"); ?>
<?
	if (!session_is_registered("account") || !session_is_registered('password'))
	header ("Location: login.php");

	$nucontact = $HTTP_GET_VARS["nucontact"];

	function CheckNu($nucontact)
	{
		include ("./../connect.php");
		$sql = "select * from contacts where Nu_Contact=$nucontact";
		$result = mysql_query($sql);
		$num = mysql_num_rows($result);
		return ( $num > 0 );
	}
	
	if (isset($nucontact))
	{	
		if (CheckNu($nucontact)) 
		{
			include ("./../connect.php");
			$sql = "select Email, Date_Heure, Sujet, Message from Contacts where Nu_Contact = ".$nucontact;				
			$result = mysql_query($sql);	
			
			while ($col=mysql_fetch_row($result))					
			{
				$Email = $col[0];	
				$Date_Heure = $col[1];
				$Sujet = $col[2];
				$Message = $col[3];
			}
		}
		else 
			header("Location: ./../error.php");
	}
		else 
			header("Location: ./../error.php");		
?>
<? $Text = $Sujet;?>
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
			location.href = "contacts.php";
		}
		</script>		
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
    <form name="frm" method="post" action="contacts.php?act=del">		
		<? include("./top.php") ?>  
		<? include("./center.php")?>
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
								<br>
								<table>
									<tr>
										<td><b>Email:</b></td>
										<td><? print "<a class=link href='mailto:$Email'>$Email</a>"; ?></td>
									</tr>								
									<tr>
										<td><b>Date:</b></td>
										<td><? print $Date_Heure;?></td>
									</tr>
									<tr>
										<td><b>Sujet:</b></td>
										<td><? print $Sujet;?></td>
									</tr>
									<tr><td valign="top"><b>Message:</b></td></tr>
									<tr>
										<td colspan="2"><? print $Message;?></td>
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
		<input type="hidden" name="numbers" value="<? print "'".$nucontact."'"; ?>">
	</form>
</body>
</html>