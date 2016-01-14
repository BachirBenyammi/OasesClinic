<?
    $ip = $HTTP_GET_VARS['ip'];
    $dotted = preg_split( "/[.]+/", $ip);
    $ip2 = (double) ($dotted[0]*16777216)+($dotted[1]*65536)+($dotted[2]*256)+($dotted[3]);    
    $url = "/get-country/?ip=".$ip2."&user=guest&pass=guest";
    $fp = fsockopen ("www.ip-to-country.com", 80, &$errno, &$errstr, 30);
    if (!$fp)
        echo "$errstr ($errno)<br>\n";
    else 
	{
        fputs ($fp, "GET $url HTTP/1.0\r\nHost: ip-to-country.com\r\n\r\n");
        while (!feof($fp))
            $response .= fgets ($fp,128);
        fclose ($fp);
    }
    $lignes = explode("\n",$response);
    $pays = $lignes[sizeof($lignes)-1];	
?>
	<p align=center><b>Pays d'origine : </b><?=$pays?></p>
	<p align=center><a class=link href="http://www.ip-to-country.com<?=$url?>" target="_blank">ip-to-country.com</a></p>
	<p align=center><a class=link href="" onClick="javascript:window.close()">Fermer</a></p>
