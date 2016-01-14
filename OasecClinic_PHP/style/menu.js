var clicked=""
var gtype=".gif"
var selstate="_over"
if (typeof(loc)=="undefined" || loc==""){
	var loc=""
	if (document.body){
		var tt = document.body.innerHTML.toLowerCase();
		var last = tt.indexOf("menu.js\"");
		if (last>0){
			var first = tt.lastIndexOf("\"", last);
			if (first>0 && first<last) loc = document.body.innerHTML.substr(first+1,last-first-1);
		}
	}
}

document.write("<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tr>");
document.write("<td><img src=\""+loc+"menu_left.gif\" alt=\"\" width=\"9\" height=\"28\"></td>");
tr(false);
writeButton(loc+"","./../index.php","menu_b1",91,28,"Accueil","",0);
writeButton(loc+"","./../presentation.php","menu_b2",91,28,"Présentation","",0);
writeButton(loc+"","./../actualites.php","menu_b3",91,28,"Actualités","",0);
writeButton(loc+"","./../specialites.php","menu_b4",91,28,"Spécialités","",0);
writeButton(loc+"","./../structure.php","menu_b5",91,28,"Structure","",0);
writeButton(loc+"","./../departements.php","menu_b6",91,28,"Départements","",0);
writeButton(loc+"","./../services.php","menu_b7",91,28,"Services","",0);
writeButton(loc+"","./../address.php","menu_b8",91,28,"Adresse","",0);
tr(true);
document.write("<td><img src=\""+loc+"menu_right.gif\" alt=\"\" width=\"15\" height=\"28\"></td>");
document.write("</tr></table>")
loc="";

function tr(b){}

function turn_over(name) {
	if (document.images != null && clicked != name) {
		document[name].src = document[name+"_over"].src;
	}
}

function turn_off(name) {
	if (document.images != null && clicked != name) {
		document[name].src = document[name+"_off"].src;
	}
}

function reg(gname,name)
{
if (document.images)
	{
	document[name+"_off"] = new Image();
	document[name+"_off"].src = loc+gname+gtype;
	document[name+"_over"] = new Image();
	document[name+"_over"].src = loc+gname+"_over"+gtype;
	document[name+"_on"] = new Image();
	document[name+"_on"].src = loc+gname+"_on"+gtype;
	}
}

function evs(name){ return " onmouseover=\"turn_over('"+ name + "')\" onmouseout=\"turn_off('"+ name + "')\""}

function writeButton(urld, url, name, w, h, alt, target, hsp)
{
	gname = name;
	while(typeof(document[name])!="undefined") name += "x";
	reg(gname, name);
	tr(true);
	document.write("<td>");
	if (alt != "") alt = " alt=\"" + alt + "\"";
	if (target != "") target = " target=\"" + target + "\"";
	if (w > 0) w = " width="+w; else w = "";
	if (h > 0) h = " height="+h; else h = "";	
	var l = clicked!="" || !isCurrentFile(url);
	if (url != "") url = " href=\"" + urld + url + "\"";
	
	if (l) document.write("<a " + url + evs(name) + target + ">");
	else gname += selstate;
	
	gname += gtype;
	
	if (hsp == -1) hsp =" align=right";
	else if (hsp > 0) hsp = " hspace="+hsp;
	else hsp = "";
	
	document.write("<img src=\""+loc+gname+"\" name=\"" + name + "\"" + w + h + alt + hsp + " border=0>");
	
	if (l) document.write("</a>");
		
	document.write("</td>");
	tr(false);
}

function syncFile(f,nf)
{
	var matches = 'home.html*index.html*welcome.html*default.asp';
	var p = f.lastIndexOf('/');
	
	if (p < 1) return "";
	
	var sf = f.substr(p+1, f.length-1);
	if (matches.indexOf(sf) == -1) return "";
	
	return sf;
}

function isCurrentFile(str)
{
	str = str.toLowerCase();
	while (str.length > 3 && str.substring(0,3) == "../")
		str = str.substr(3, str.length-1);
	var fstr = str.indexOf(".htm");
	if (fstr < 1 && str.charAt(str.length-1) != '/') str += "/";
	var current = document.location.href.toLowerCase();
	var fcurrent = current.indexOf(".htm");
	if (fcurrent < 1 && current.charAt(current.length-1) != '/') current += "/";	
	if (fstr != -1 && fcurrent == -1) current += syncFile(str, current);
	if (fstr == -1 && fcurrent != -1) str += syncFile(current, str);
		
	var currsize = current.length;
	var strsize = str.length;

	while (strsize >=0 && currsize >=0)
	{
		if (current.charAt(currsize) != str.charAt(strsize))
			return false;
			
		currsize = currsize -1;
		strsize = strsize -1;
	}
	
	return true;
}
