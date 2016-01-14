<style>
.skin0
{
	BORDER-RIGHT: black 2px solid;
	BORDER-TOP: black 2px solid;
	VISIBILITY: hidden;
	BORDER-LEFT: black 2px solid;
	WIDTH: 200px;
	CURSOR: default;
	LINE-HEIGHT: 20px;
	BORDER-BOTTOM: black 2px solid;
	FONT-FAMILY: Verdana;
	POSITION: absolute;
	BACKGROUND-COLOR: menu;
}

.skin1
{
	BORDER-RIGHT: buttonhighlight 2px outset;
	BORDER-TOP: buttonhighlight 2px outset;
	FONT-SIZE: 10px;
	VISIBILITY: hidden;
	BORDER-LEFT: buttonhighlight 2px outset;
	WIDTH: 145px;
	CURSOR: default;
	COLOR: black;
	BORDER-BOTTOM: buttonhighlight 2px outset;
	FONT-FAMILY: Verdana,Geneva, Arial;
	POSITION: absolute;
	BACKGROUND-COLOR: menu;
}

.menuitems
{
PADDING-RIGHT: 10px;
PADDING-LEFT: 3px
}
</style>
<div class="skin0" id="ie5menu" onmouseover="highlightie5()" onclick="jumptoie5()" onmouseout="lowlightie5()">
  <div class="menuitems" url="javascript:history.go(-1)"><img src="images/back.gif" width="12" height="12">&nbsp;Précédent</div>
  <div class="menuitems" url="javascript:history.go(1)"><img src="images/next.gif" width="12" height="12">&nbsp;Suivant</div>
<hr>
  <div class="menuitems" url="Presentation">Présentation</div>  
  <div class="menuitems" url="ListActualites.aspx">Actualités</div>  
  <div class="menuitems" url="Historique.aspx">Historique</div>  
  <div class="menuitems" url="Structure.aspx">Structure</div>  
  <div class="menuitems" url="ListSpecialites.aspx">Spécialités</div>  
  <div class="menuitems" url="Departements.aspx">Départements</div>  
  <div class="menuitems" url="Services.aspx">Services</div>  
  <div class="menuitems" url="Address.aspx">Adresse</div>  
<hr>  
  <div class="menuitems" url="">Rendez-vous</div>
  <div class="menuitems" url="">Q&R</div>
  <div class="menuitems" url="Livredor.aspx">Livre d'or</div>
  <div class="menuitems" url="Downloads.aspx">Téléchargement</a></div>
  <div class="menuitems" url="Liens.aspx">Liens</div>
<hr>
  <div class="menuitems" url="SM.aspx">Services Médicaux</div>
  <div class="menuitems" url="Sites.aspx">Sites Web</a></div>
<hr>  
</div>
<script language=javascript>
if (document.all&&window.print)
{
	if (menuskin==0)
	{
		ie5menu.className="skin0"
	}
	else
	{
		ie5menu.className="skin1"
		document.oncontextmenu=showmenuie5
		document.body.onclick=hidemenuie5
	}
}

var menuskin=1
var display_url=0

function showmenuie5()
{
	var rightedge=document.body.clientWidth-event.clientX
	var bottomedge=document.body.clientHeight-event.clientY

	if (rightedge<ie5menu.offsetWidth)
	ie5menu.style.left=document.body.scrollLeft+event.clientX-ie5menu.offsetWidth
	else
	ie5menu.style.left=document.body.scrollLeft+event.clientX
	
	if (bottomedge<ie5menu.offsetHeight)
	ie5menu.style.top=document.body.scrollTop+event.clientY-ie5menu.offsetHeight
	else
	ie5menu.style.top=document.body.scrollTop+event.clientY

	ie5menu.style.visibility="visible"
	return false
}

function hidemenuie5()
{ie5menu.style.visibility="hidden"}


function highlightie5()
{
	if (event.srcElement.className=="menuitems")
	{
		event.srcElement.style.backgroundColor="highlight"
		event.srcElement.style.color="white"
		if (display_url==1)
		window.status=event.srcElement.url
	}
}

function lowlightie5()
{
	if (event.srcElement.className=="menuitems")
	{
		event.srcElement.style.backgroundColor=""
		event.srcElement.style.color="black"
		window.status=''
	}
}

function jumptoie5()
{
	if (event.srcElement.className=="menuitems")
	{
		if (event.srcElement.getAttribute("target")!=null)
		window.open(event.srcElement.url,event.srcElement.getAttribute("target"))
		else
		window.location=event.srcElement.url
	}
}
</script>