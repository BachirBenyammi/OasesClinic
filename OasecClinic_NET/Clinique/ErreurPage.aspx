<%@ Page language="c#" debug="true"%>
<%@ Register Tagprefix="Clinique" TagName="Top" src="top.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Right" src="right.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="Left" src="left.ascx"%>
<%@ Register Tagprefix="Clinique" TagName="CopyRight" src="copyright.ascx"%>
<html>
	<head>
		<title>Erreur !!</title>
		<link type=text/css href="css/style.css" rel=stylesheet>
		<script language="Javascript" src="script/js.js"></script>
	</head>
<body onLoad="debuteDate();debuteTemps()" onUnload="clearTimeout(ddate);clearTimeout(ttime)">
    <form runat="server">
    	<Clinique:Top id="top" runat="server" />
    	<table align="center" cellspacing="0" width="760" cellpadding="0" border="1">
			<tr>
    			<td width="140" valign=top>
    				<Clinique:Left id="Left" runat=server />
				</td>
				<td width="480" valign=top>
    				<table width="100%">
    					<th>Erreur !!</th>
    					<tr><td>
    						<br>
    						<blockquote>
    						<p align=justify>
    							Une erreur est survenu peut être à cause d'un 
								mouvais remplie ou bien d'un bug au code, 
								Nous sommes vraiment désolé<br><br>
								Retour au <a href="default.aspx">Page d'accueil</a>
							</p>
							</blockquote>
    					</td></tr>
    				</table>
   				</td>
   				<td width="140" valign=top>
					<Clinique:Right id="Right" runat="server" />
    			</td>
    		</tr>
    	</table>
    	<Clinique:CopyRight id="CopyRight" runat=server />
    </form>
</body>
</html>