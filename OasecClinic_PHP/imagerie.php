<?	include("./stat.php"); ?>
<? $Text = "Imagerie";?>
<html>
	<head>
		<title>Clinique des Oasis - <?=$Text?></title>
		<script language="Javascript" src="style/js.js"></script>
		<link type=text/css href="./style/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
		<? include("./menu.php") ?>		
		<? include("./top.php") ?>  
		<? include("./center.php")?>
<table align="center" cellspacing="0" width="760" height="340" bgcolor="#EBF4E3" cellpadding="0" border="1">
			<tr>
				<td valign=top>
    				<table width="100%">
						<tr>
							<td width=10></td>
							<td>
								<br>
								<p>		
									<table cellspacing="10">
										<tr>
											<td>				
												<ul>
													<li>Scanner 3D</li>
													<li>Angiographie coronarienne</li>
													<li>Radiologie conventionnelle num�rise</li>
													<li>Mammographie avec st�r�o ponction</li>
													<li>&Eacute;chographie g�n�rale</li>
													<li>&Eacute;chographie cardiovasculaire et doppler</li>
													<li>Panoramique dentaire</li>
													<li>Art�riographie</li>
													<li>Coronarographie</li>
												</ul>				
											</td>
											<td align=center><img src="images/Radio1.jpg" width="200" height="150" border="1"></td>
										</tr>
										<tr align=center>
											<td><img src="images/Radio2.jpg" width="200" height="150" border="1"></td>	
											<td><img src="images/Radio3.jpg" width="200" height="150" border="1"></td>
										</tr>		
										<tr>
											<td><b>Table num�ris�e pour examens radiologiques sp�cialises</b></td>
											<td align=center><img src="images/Radio4.jpg" width="200" height="150" border="1"></td>
										</tr>	
										<tr>
											<td align=center><img src="images/Radio5.jpg" width="200" height="150" border="1"></td>	
											<td><b>Scanner 3d double barrette derni�re g�n�ration</b></td>
										</tr>																																						
									</table>	
								</p>
								<p><input class="Button" type="button" value="D�partements" onClick="javascript: location.href = 'departements.php'"></p>
							</td>
						</tr>	
					</table>
   				</td>
    		</tr>
    	</table>
	<? include("./buttom.php") ?>
</body>
</html>