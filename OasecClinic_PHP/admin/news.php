<? include ("./../stat.php"); ?>
<?
	if (!session_is_registered("account") || !session_is_registered('password'))
		header ("Location: login.php");
	
	if (isset($act))
		if ($act=="del")	
		{
			include ("./../connect.php");
			$sql = "delete from news where Nu_News in (".$numbers."'')";
			$result = mysql_query($sql);
		}				
?>
<? $Text = "Actualités"; ?>
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
		function index()
		{
			location.href = "index.php";
		}
		function add()
		{
			location.href = "newnews.php";
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
    					<td width="10"></td>
						<td>
							<br>
								<p>
									<input type="button" value="Nouveau" class="Button" OnClick="javascript: add();">&nbsp;
									<input type="submit" value="Supprimer" class="Button" OnClick="javascript:return CheckAll();">&nbsp;
									<input type="button" value="Reteur" class="Button" onClick="javascript: index();">
								</p>								
							<b>List des Actualités</b><hr>
								<table align="center" width="80%">
									<td class="th"><input type="checkbox" name="cbSelectAll" OnClick="SelectAll('chkSelection')"></td>
									<td class="th">Titre</td>
									<td class="th">Date</td>
									<td class="th">Rédacteur</td>
							<?
								include ("./../connect.php");
								$sql = "select Nu_News, Titre, Date_Heure, Redacteur, Email from News order by Date_Heure DESC";									
								$result = mysql_query($sql);	
		
								while ($col=mysql_fetch_row($result))					
								{
									$Nu_News = $col[0];		
									$Titre = $col[1];
									$Date_Heure = $col[2];
									$Redacteur = $col[3];
									$Email = $col[4];													
							?>										
								<tr>
									<td class="td"><input type="checkbox" <? print "name=".$Nu_News."_chkSelection"; ?>></td>
									<td class="td"><? print "<a class=link href='new.php?nunews=$Nu_News'>$Titre</a>"; ?></td>
									<td class="td"><? print $Date_Heure; ?></td>
									<td class="td"><? print "<a class=link href='mailto:$Email'>$Redacteur</a>"; ?></td>
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
