<?
	session_start();
	if (!session_is_registered("newuser"))
	{
		session_register("newuser");
		
		$Page = getenv("REQUEST_URI");
		if (empty($Page)) 
			$Page = "Unknoun";			
		$Lien = getenv("HTTP_REFERER");
		if (empty($Lien)) 
			$Lien = "Unknoun";			
		$Language = getenv("HTTP_ACCEPT_LANGUAGE");
		if (empty($Language)) 							
			$Language = "Unknoun";			
		$IpAddress = getenv("REMOTE_ADDR");		
		if (empty($IpAddress))
			$IpAddress = getenv("HTTP_X_FORWARDED_FOR");
		if (empty($IpAddress))
			$IpAddress = getenv("SERVER_ADDR");			
		if (empty($IpAddress)) 
			$IpAddress = "Unknoun";
			
		$HUA = getenv("HTTP_USER_AGENT");
		if((strstr($HUA, "Nav")) || 
			(strstr($HUA, "Gold")) || 
				(strstr($HUA, "X11")) || 
					(strstr($HUA, "Mozilla")) || 
						(strstr($HUA, "Netscape")) AND 
							(!strstr($HUA, "MSIE"))) 
								$Navigateur = "Netscape";
		elseif(strstr($HUA, "MSIE")) $Navigateur = "MSIE";
		elseif(strstr($HUA, "Lynx")) $Navigateur = "Lynx";
		elseif(strstr($HUA, "Opera")) $Navigateur = "Opera";
		elseif(strstr($HUA, "WebTV")) $Navigateur = "WebTV";
		elseif(strstr($HUA, "Konqueror")) $Navigateur = "Konqueror";
		elseif((stristr($HUA, "bot")) || 
			(strstr($HUA, "Google")) || 
				(strstr($HUA, "Slurp")) || 
					(strstr($HUA, "Scooter")) || 
						(stristr($HUA, "Spider")) || 
							(stristr($HUA, "Infoseek"))) 
								$Navigateur = "Bot";
		else $Navigateur = "Unknoun";
		if(strstr($HUA, "Win")) $os = "Windows";
		elseif((strstr($HUA, "Mac")) || 
			(strstr($HUA, "PPC"))) $os = "Mac";
		elseif(strstr($HUA, "Linux")) $os = "Linux";
		elseif(strstr($HUA, "FreeBSD")) $os = "FreeBSD";
		elseif(strstr($HUA, "SunOS")) $os = "SunOS";
		elseif(strstr($HUA, "IRIX")) $os = "IRIX";
		elseif(strstr($HUA, "BeOS")) $os = "BeOS";
		elseif(strstr($HUA, "OS/2")) $os = "OS/2";
		elseif(strstr($HUA, "AIX")) $os = "AIX";
		else $os = "Unknoun";

		$link = mysql_connect("localhost","root","");
		mysql_select_db("Clinique_Base");
		$sql = "insert into visiteurs (Page, Lien, Language, Ip_Adresse, Navigateur, os, Date_Heure) values ('".$Page."', '".$Lien."', '".$Language."', '".$IpAddress."', '".$Navigateur."', '".$os."', now())";				
		$result = mysql_query($sql);
	}
?>