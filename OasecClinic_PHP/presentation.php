<?	include("./stat.php"); ?>
<? $Text = "Pr�sentation"; ?>
<html>
	<head>
		<title>Clinique des Oasis - <?=$Text?></title>
		<script language="Javascript" src="style/js.js"></script>
		<link type=text/css href="./style/style.css" rel=stylesheet>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
	<? include("./menu.php") ?>		
	<? include("./top.php") ?>  
	<? include("./center.php") ?>
	
	<table align="center" cellspacing="0" width="760" height="340" bgcolor="#EBF4E3" cellpadding="0" border="1">
		<tr>
			<td valign=top>
   				<table width="100%">
   					<tr>
   						<td width="10"></td>
   						<td>
							<br>					
							<p>
									<img src="images/clinique.jpg" width="200" height="150" border="1" align=right>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; La CLINIQUE des OASIS a �t� inaugur� 
								par M. le Ministre alg�rien de la sant�, le 6 Mai 2002.
							</p>							
							<p>			
									&nbsp;&nbsp;&nbsp;&nbsp; La CLINIQUE des OASIS est une structure qui r�pond aux 
									normes internationales, elle r�unit les conditions requises pour une m�decine 
								moderne et de qualit�.
							</p>
							<p>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; La clinique �tait, � l�origine, 
								destin� uniquement aux check-up, c�est-�-dire les 
								bilans m�dicaux, en moins de 12 heures. Mais apr�s, il a �t� constat� 
								la n�cessit� d�installer des blocs op�ratoires pour la neurochirurgie, 
								les chirurgies cardiaque, maxillo-faciale et la m�decine interne.
							</p>								
								<p>&nbsp;&nbsp;&nbsp;&nbsp; La clinique est �quip�e d�un mat�riel de 
									pointe pour la r�animation et la prise en charge des cas d�urgence avec des appareils 
								modernes de surveillance.
							</p>
								<p>&nbsp;&nbsp;&nbsp;&nbsp; La clinique a pour vocation de vous apporter 
									un diagnostic pr�cis et des soins personnalis�s dans les meilleures conditions 
								de confort, d'accueil et de rapidit�. Gr�ce � une �quipe m�dicale 
								et soignante de haut niveau et un plateau technique performant.
							</p>
							<p>
									&nbsp;&nbsp;&nbsp;&nbsp;Cet investissement a pour que les Alg�riens n�aillent plus 
									aux pays voisins ou en Europe pour se faire soigner, ils auront tout ici et au moindre co�t. 
							</p>								
							<p>
								<ul>
									<li><a class=link href="actualites.php">Actualit�s et �v�nements</a></il>					
									<li><a class=link href="specialites.php">Sp�cialit�s m�dicales disponibles dans la clinique</a></il>
									<li><a class=link href="structure.php">Structure g�n�rale de la clinique</a></il>
									<li><a class=link href="departements.php">D�partements m�dicales de la clinique</a></il>
									<li><a class=link href="services.php">Autres services</a></il>
									<li><a class=link href="address.php">Comment se rendre � la clinique ?</a></il>
								</ul>
							</p>
								<p><input class="Button" type="button" value="Accueil" onClick="javascript: location.href = 'index.php'"></p>
					</td></tr>
   				</table>
			</td>

   		</tr>
   	</table>
	<? include("./buttom.php") ?>  
</body>
</html>