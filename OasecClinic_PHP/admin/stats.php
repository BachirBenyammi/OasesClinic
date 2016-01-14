<? include ("./../stat.php"); ?>
<?
	if (!session_is_registered("account") || !session_is_registered('password'))
		header ("Location: login.php");
	
	if (isset($act))
		if ($act=="del")	
		{
			include ("./../connect.php");
			$sql = "delete from visiteurs where Nu_Visiteur in (".$numbers."'')";
			$result = mysql_query($sql);
		}				
?>
<? $Text = "Statistiques sur les visiteurs"; ?>
<html>
	<head>
		<title>Clinique des Oasis - <?=$Text?></title>
		<script language="Javascript" src="../style/js.js"></script>
		<link type=text/css href=".././style/style.css" rel=stylesheet>
		<script language=javascript> 
		function SelectAll() {
			re = new RegExp('_chkSelection$') 		
			for(i = 0; i < document.frm.elements.length; i++) {
				elm = document.frm.elements[i]
				if ((elm.type == 'checkbox') && (re.test(elm.name)))
		    	    	elm.checked = document.frm.cbSelectAll.checked
			}			
		}
		function CheckAll(){
			value = ""
			j = 0
			re = new RegExp('_chkSelection$') 			
			for(i = 0; i < document.frm.elements.length; i++) {
				elm = document.frm.elements[i]
				if ((elm.type == 'checkbox') && (re.test(elm.name)) && (elm.checked))
				{
					value +="'" + elm.name.substring(0, elm.name.indexOf('_')) + "', "
			    	j++
				}
			}
			document.frm.numbers.value = value;			
		   	if (j==0){
		   		alert("Vous avez rien sélecioner !!")
		   		return false;
		   	}
		   	else
		   		return confirm('A ce que vous etre sure ?')					
		}
		function redirect()
		{
			location.href = "index.php";
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
									<input type="submit" value="Supprimer" class="Button" OnClick="javascript:return CheckAll();">&nbsp;
									<input type="button" value="Reteur" class="Button" onClick="javascript: redirect();">
								</p>								
								<p>
									<? 
										include ("./../connect.php");
										$sqlday = "select * from Visiteurs where DAYOFMONTH(Date_Heure) = DAYOFMONTH(now())";				
										$resultday = mysql_query($sqlday);	
										$day_visitros = mysql_num_rows($resultday);		

										$sqlmonth = "select * from Visiteurs where MONTH(Date_Heure) = MONTH(now())";				
										$resultmonth = mysql_query($sqlmonth);	
										$month_visitros = mysql_num_rows($resultmonth);				
										
										$sqlyear = "select * from Visiteurs where YEAR(Date_Heure) = YEAR(now())";				
										$resultyear = mysql_query($sqlyear);	
										$year_visitros = mysql_num_rows($resultyear);		
										
										$sql = "select * from Visiteurs";				
										$result = mysql_query($sql);	
										$total_visitros = mysql_num_rows($result);																															
									?>									
									<b>Satistiques globales: </b><hr>
									<table align="center" width="80%">
										<tr>
											<td class="th"><b>Jour</b></td>
											<td class="th"><b>Mois</b></td>
											<td class="th"><b>Années</b></td>
											<td class="th"><b>Total</b></td>
										</tr>
											<td class="td"><? print $day_visitros;?></td>
											<td class="td"><? print $month_visitros;?></td>
											<td class="td"><? print $year_visitros;?></td>
											<td class="td"><? print $total_visitros;?></td>
										</tr>
									</table>
								</p>														
								<p>
									<b>List des statistiques sur les visiteurs: </b><hr>
														
									<table align="center" width="80%">
										<td class="th"><input type="checkbox" name="cbSelectAll" OnClick="SelectAll('chkSelection')"></td>
										<td class="th">Adresse IP</td>
										<td class="th">Date</td>
										<?
											include ("./../connect.php");
											$sql = "select Nu_Visiteur, Ip_Adresse, Date_Heure from Visiteurs order by Date_Heure DESC";				
											$result = mysql_query($sql);	
					
											while ($col=mysql_fetch_row($result))					
											{
												$Nu_Visiteur = $col[0];		
												$Ip_Adresse = $col[1];									
												$Date_Heure = $col[2];						
										?>										
										<tr>
											<td class="td"><input type="checkbox" <? print "name=".$Nu_Visiteur."_chkSelection"; ?>></td>
											<td class="td"><? print "<a class=link href='visitor.php?nuvisiteur=$Nu_Visiteur'>$Ip_Adresse</a>"; ?></td>
											<td class="td"><? print $Date_Heure; ?></td>
										</tr>	
										<?
											}
										?>										
									</table>
								</p>
							</td>
						</tr>
    				</table>
   				</td>
    		</tr>
    	</table>
    	<? include("./buttom.php") ?> 
		<input type="hidden" name="numbers">
    </form>
</body>
</html>