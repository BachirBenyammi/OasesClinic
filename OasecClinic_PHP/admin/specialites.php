<? include ("./../stat.php"); ?>
<?
	if (!session_is_registered("account") || !session_is_registered('password'))
		header ("Location: login.php");
	
	if (isset($act))
		if ($act=="del")	
		{
			include ("./../connect.php");
			$sql = "delete from specialites where Nu_Specialite in (".$numbers."'')";
			$result = mysql_query($sql);
		}				
?>
<? $Text = "Spécialités"; ?>
<html>
	<head>
		<title>CLinique des Oasis - <?=$Text?></title>
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
			location.href = "newspecialite.php";
		}		
		</script>		
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
							<td width=10 rowspan="2"></td>
							<td>
								<br>
								<p>
									<input type="button" value="Nouveau" class="Button" OnClick="javascript: add();">&nbsp;
									<input type="submit" value="Supprimer" class="Button" OnClick="javascript:return CheckAll();">&nbsp;
									<input type="button" value="Reteur" class="Button" onClick="javascript: index();">
								</p>							
								<b>List des spécialités</b><hr>
								<table align="center" width="80%">
									<td class="th"><input type="checkbox" name="cbSelectAll" OnClick="SelectAll('chkSelection')"></td>
									<td class="th">Intituler</td>
							<?
								include ("./../connect.php");
								$sql = "select Nu_Specialite, Intituler from specialites order by Intituler";				
								$result = mysql_query($sql);	
		
								while ($col=mysql_fetch_row($result))					
								{
									$Nu_Specialite = $col[0];		
									$Intituler = $col[1];													
							?>										
								<tr>
									<td class="td"><input type="checkbox" <? print "name=".$Nu_Specialite."_chkSelection"; ?>></td>
									<td class="td"><? print "<a class=link href='specialite.php?nuspecialite=$Nu_Specialite'>$Intituler</a>"; ?></td>
								</tr>	
							<?
								}
							?>	
							</table>
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