var ddate, ddelay, ttime, tdelay;
function debuteDate() {
  if (!document.layers&&!document.all&&!document.getElementById)
  return
  var adate, date, amonth, aday;
  ddelay = 10000;
  adate = new Date();
  aday = adate.getDay()+1;
    if (aday == 1) date = "Dimanche";
  else if (aday == 2) date = "Lundi";
  else if (aday == 3) date = "Mardi";
  else if (aday == 4) date = "Mercredi";
  else if (aday == 5) date = "Jeudi";
  else if (aday == 6) date = "Vendredi";
  else if (aday == 7) date = "Samedi";
  date += " "+adate.getDate();
  amonth = adate.getMonth()+1;
  if (amonth == 1) date += " Janvier";
  else if (amonth == 2) date += " Fevrier";
  else if (amonth == 3) date += " Mars";
  else if (amonth == 4) date += " Avril";
  else if (amonth == 5) date += " Mai";
  else if (amonth == 6) date += " Juin";
  else if (amonth == 7) date += " Juillet";
  else if (amonth == 8) date += " Aout";
  else if (amonth == 9) date += " Septembre";
  else if (amonth == 10) date += " Octobre";
  else if (amonth == 11) date += " Novembre";
  else if (amonth == 12) date += " Decembre";
  
  if (adate.getYear() > 1999)
    date += " " + adate.getYear();
  else date += "  " + (1900 + adate.getYear());
  date = "  " + date;
  if (document.layers){
  document.layers.jour.document.write(date)
  document.layers.jour.document.close()
  }
  else if (document.all)
  jour.innerHTML=date
  else if (document.getElementById)
  document.getElementById("jour").innerHTML=date
  ddate = setTimeout("debuteDate(ddelay)",ddelay);
}

function debuteTemps() {
  if (!document.layers&&!document.all&&!document.getElementById)
  return
  var hhmmss = "  ", mymin, sec;
  tdelay = 60000;
  adate = new Date();
  hhmmss += adate.getHours();
  mymin = adate.getMinutes();
  if (mymin < 10) hhmmss += ":0" + mymin;
  else hhmmss += ":" + mymin;
  if (document.layers){
  document.layers.heure.document.write(hhmmss)
  document.layers.heure.document.close()
  }
  else if (document.all)
  heure.innerHTML=hhmmss
  else if (document.getElementById)
  document.getElementById("heure").innerHTML=hhmmss
  ttime = setTimeout("debuteTemps(tdelay)",tdelay);
}