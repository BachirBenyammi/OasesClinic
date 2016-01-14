<script language=javascript>
	function js_start() {clearInterval(js.sttm);js_init();if (arguments.length>0) js_init2(arguments[0]);js.sttm=setInterval ("doEffect('js')",10);}
	function js_stop() {clearInterval(js.sttm);window.status="";}
	js_init();
	function js_init() {js={stel:0,stft:"",stec:2,stcel:1,stce:-1,stcl:-1,stls:-1,stcs:0,sttg:0,stea:["  Bienvenue au site web de la Clinique des Oasis de Diangonstic et de Soins",0,10,1,"Bienvenue au site web de la Clinique des Oasis de Diangonstic et de Soins",3,10,1]};}
	function js_init2 (en) {js.stea=[js.stea[(en-1)*4],js.stea[(en-1)*4+1],js.stea[(en-1)*4+2],js.stea[(en-1)*4+3]];js.stec=1;js.stel=0;}
	function doEffect(es) {var s=eval(es);if (s.stce==s.stec) {if (s.stcel==s.stel) {clearInterval(s.sttm);window.status=s.stft;return;} else {if (s.stel>0) s.stcel++;s.stce=-1;s.stcl=s.stls;}}if (s.stcl==s.stls) {s.stce++;s.sttx=s.stea[s.stce*4];s.sttp=s.stea[s.stce*4+1];s.stsd=s.stea[s.stce*4+2];s.stls=s.stea[s.stce*4+3];s.stcl=0;s.stsp=1;s.sttg=0;}if (21-s.stsd-s.sttg==0) {var stres=eval("stEffect"+s.sttp+"(s.sttx,s.stsp++,es);");s.sttg=0;if (stres!="") window.status=stres;else {s.stcl++;s.stsp=1;}}s.sttg++;}
	function stEffect0(text,step){if (step>text.length) return "";else return text.substring(0,step);}
	function stEffect3(text,step) {if (step>text.length) return "";else {for (var i=0,r=""; i<text.length-step; i++) r+=" ";return r+text;}}
	js_start();
	function deconnect()
	{
   		return confirm('A ce que vous etre sure ?')				
	}
</script>
<table cellpadding="0" cellspacing="0" align="center">
	<tr>
		<td><img src="./../style/left.gif" height="8"></td>
		<td><img src="./../style/btm.gif" width="734" height="8"></td>
		<td><img src="./../style/right.gif" height="8"></td>
	</tr>
</table>
<table align=center cellpadding=0 cellspacing=0 width=750 bgcolor="#EBF4E3">
	<tr>
		<td rowspan="3"><img src=./../style/logo.gif width="135" height="134"></td>
	</tr>
	<tr>
		<td><span id="jour"></span>&nbsp;<span id="heure"></span></td>
		<td colspan="2" align=right>
			<? 
				if (session_is_registered("account") && session_is_registered('password'))
					print "Bienvenue <b> ".$account."</b> <a class=link href='./index.php'>Admin</a> | <a class=link href='./logout.php' OnClick='javascript:return deconnect();'>[Déconnexion]</a> |";
			?>
			<a class=link href="./../index.php">Accueil</a> | 
			<a class=link href="./../sitemap.php">Plan du site</a> | 
			<a class=link href="./../contact.php">Contact</a>
		</td>
	</tr>
	<tr>
		<td colspan="3" align=center>
			<object classid="clsid:D27CDB6E-AE6D-11CF-96B8-444553540000" id="obj1" border="0" width="384" height="80"
				codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0">
				<param name="movie" value="./../style/pub.swf">
				<param name="quality" value="High">
				<embed src="./../style/pub.swf" pluginspage="http://www.macromedia.com/go/getflashplayer" 
				   type="application/x-shockwave-flash" name="obj1" width="384" height="80" quality="High">
			</object>
		</td>
	</tr>
</table>