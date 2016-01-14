<? include ("./../stat.php"); ?>
<?
	if (!session_is_registered("account") || !session_is_registered('password'))
		header ("Location: login.php");
	
	if (isset($act))
		if ($act=="del")	
		{
			include ("./../connect.php");
			$sql = "delete from contacts where Nu_Contact in (".$numbers."'')";
			$result = mysql_query($sql);
		}				
?>
<? $Text = "Contacts"; ?>
<html>
	<head>
		<title>Clinique des Oasis - <?=$Text?></title>
		<script language="Javascript" src="./../style/js.js"></script>
		<link type=text/css href="./../style/style.css" rel=stylesheet>
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

    <form name="frm" method="post" action="contacts.php?act=del">		
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
								<b>List des contacts: </b><hr>
									<table align="center" width="80%">
										<td class="th"><input type="checkbox" name="cbSelectAll" OnClick="SelectAll('chkSelection')"></td>
										<td class="th">Sujet</td>
										<td class="th">Email</td>
										<td class="th">Date</td>
										<?
											include ("./../connect.php");
											$sql = "select Nu_Contact, Sujet, Email, Date_Heure from contacts order by Date_Heure DESC";				
											$result = mysql_query($sql);	
					
											while ($col=mysql_fetch_row($result))					
											{
												$Nu_Contact = $col[0];		
												$Sujet = $col[1];									
												$Email = $col[2];		
												$Date_Heure = $col[3];						
										?>										
										<tr>
											<td class="td"><input type="checkbox" <? print "name=".$Nu_Contact."_chkSelection"; ?>></td>
											<td class="td"><? print "<a class=link href='contact.php?nucontact=$Nu_Contact'>$Sujet</a>"; ?></td>
											<td class="td"><? print "<a class=link href='mailto:$Email'>$Email</a>"; ?></td>
											<td class="td"><? print $Date_Heure; ?></td>
										</tr>	
										<?
											}
										?>										
									</table>
						</td></tr>
    				</table>
   				</td>
    		</tr>
    	</table>
    	<? include("./buttom.php") ?> 
		<input type="hidden" name="numbers">
    </form>
</body>
</html>