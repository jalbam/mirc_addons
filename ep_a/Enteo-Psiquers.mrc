;
; Enteo-Psiquers AddOn 0.10b for mIRC by A-Kristo
;
; Muestra informacion actualizada de las novedades de
; Enteo-Psiquers todos los Lunes! (para que de tiempo a pedir
; algo y que llegue el fin de semana! ;D
; Ademas, si recibe el [CTCP Enteo-Psiquers] descargara las
; noticias automaticamente; al igual que cada vez que se abre
; el mIRC o cuando se escriba /enteopsiquers (o se acceda
; desde el menu).
;
;
; Pagina:
; http://www.DrogasLibres.com (URL redirigida a la real)
; http://www.fut.es/~jalbam/enteo-psiquers/index.htm (URL real)
; 
; Estadisticas:
; http://v1.nedstatbasic.net/s?tab=1&link=1&id=185047&name=enteo-psiquers enteo-psiquers (Nedstat basic)
; http://miarroba.com/contadores/stats.php?id=9857 (miarroba.com counters)
;
; TE AMO MARTA!!! ;DDD @@@@@@@@; (((((x
;


on 1:connect:{ 
  if ($exists($scriptdir $+ news) == $false) { .mkdir $scriptdir $+ news }
  if ($day == monday) { enteopsiquers } 
}

on 1:load:{ 
  if ($exists($scriptdir $+ news) == $false) { .mkdir $scriptdir $+ news }
  if ( $script != $script(1) ) { .reload -rs1 $script | halt }
  else { enteopsiquers }
}

on 1:start:{ 
  if ($exists($scriptdir $+ news) == $false) { .mkdir $scriptdir $+ news }
  enteopsiquers 
}


alias enteopsiquers {

  /.sockclose enteopsiquers

  if ($exists($scriptdir $+ news) == $false) { .mkdir $scriptdir $+ news }

  /window -kwdn @Enteo-Psiquers 20 20 750 350 $scriptdirenteo-psiquers.mnu
  /titlebar @Enteo-Psiquers News
  /clear @Enteo-Psiquers

  echo -t @Enteo-Psiquers 0Noticias de Enteo-Psiquers ( $+ $date $+ )
  echo -t @Enteo-Psiquers Noticias de Enteo-Psiquers ( $+ $date $+ )
  echo -t @Enteo-Psiquers 10Wait for connection... 3(be patient please! this operation will take some minutes to be completed [thx Kaervek x'D])
  echo -t @Enteo-Psiquers 0Noticias de Enteo-Psiquers ( $+ $date $+ )

  /set %enteofileud enteo-psiquers.txt
  /set %enteofileoffline enteo-psiquers_ $+ $replace($date,/,-) $+ .txt

  /.remove $scriptdirnews\ $+ %enteofileoffline

  /set %enteoweb.ipserver www.fut.es
  /set %enteoweb.path /~jalbam/enteo-psiquers/ $+ %enteofileud

  if (portfree(80) == $false) { echo -t @Enteo-Psiquers 12Error! 4Port 80 is in use! 2Close the Net-programs and do this again! | goto enteo-puerto_ocupado }

  /.sockopen enteopsiquers %enteoweb.ipserver 80

  :enteo-puerto_ocupado

}


on *:sockopen:enteopsiquers:{
  if ($exists($scriptdir $+ news) == $false) { .mkdir $scriptdir $+ news }
  if ($sockerr) { echo -t @Enteo-Psiquers 4Error! Can't Connect to5 %enteoweb.ipserver | return }
  if ($sokerr != 0) {
    /.remove $scriptdirnews\ $+ %enteofileoffline
    /.remove $scriptdir $+ %enteofileoffline
    echo -t @Enteo-Psiquers 4- 
    echo -t @Enteo-Psiquers 4E5nteo6-4P5siquers 2Add12On 3news update 6by 1A-Kristo
    echo -t @Enteo-Psiquers 3Testing for update to news 13(6 $+ %enteofileud $+ 13)3...
    if ($portfree(80) == $false) { echo -t @Enteo-Psiquers 10Port1 80 10ocupped! }
    else { .echo -t @Enteo-Psiquers 10Port1 80 10free! }
    echo -t @Enteo-Psiquers 6Open sock13 $sockname $+ . 7Please wait...
    echo -t @Enteo-Psiquers 4Established Connection:12 $sock(enteopsiquers).IP 2with port12 $sock(enteopsiquers).port
    echo -t @Enteo-Psiquers 4- 
    echo -t @enteo-Psiquers 0Noticias de Enteo-Psiquers ( $+ $date $+ )
    echo @Enteo-Psiquers 0...this is file:
    sockwrite -tn $sockname GET %enteoweb.path
  }
}

on *:sockread:enteopsiquers:{
  sockread %enteoweb.read 
  //.write $scriptdirnews\ $+ %enteofileoffline 1 %enteoweb.read
  echo @Enteo-Psiquers 1 %enteoweb.read
  unset %enteoweb.read
}

on *:sockclose:enteopsiquers:{ 
  echo -t @enteo-Psiquers 0Noticias de Enteo-Psiquers ( $+ $date $+ )
  echo -t @Enteo-Psiquers 5Socket6 $sockname 5close!
  echo -t @Enteo-Psiquers 14File1 %enteofileud 14saved as1 %enteofileoffline 14(in1 $scriptdirnews\ $+ 14) from1 http:// $+ %enteoweb.ipserver 14(1 $+ %enteoweb.ipserver $+ %enteoweb.path $+ 14)
  echo -t @enteo-Psiquers 0Noticias de Enteo-Psiquers ( $+ $date $+ )
  echo -t @Enteo-Psiquers 4-
  echo -t @Enteo-Psiquers 4 Play12 %enteofileoffline 4now... only if possible 14(3wait 15secs14)1:
  echo -t @Enteo-Psiquers 4-
  echo -t @enteo-Psiquers 0Noticias de Enteo-Psiquers ( $+ $date $+ )
  echo @Enteo-Psiquers 0playing file ;D


  ;  if ($exists($scriptdirnews\ $+ %enteofileoffline) == $true) { 

  ;    //.timer- $+ %enteofileoffline 1 5  /.play -e @Enteo-Psiquers $scriptdirnews\ $+ %enteofileoffline

  /.play -e @Enteo-Psiquers $scriptdirnews\ $+ %enteofileoffline

  ; }

}

on 1:PLAYEND:{
  echo @Enteo-Psiquers 0Playing file is completed
  echo -t @Enteo-Psiquers 4-
  echo -t @Enteo-Psiquers 10Play of4 %enteofileoffline 10filename has been completed!
  echo -t @Enteo-Psiquers 4-

}


menu menubar {
  -
  Enteo-Psiquers AddOn
  .Bajar Noticias de hoy!:/enteopsiquers
  .-
  .Abrir Noticias de hoy (ya bajadas) {
    if ($exists($scriptdirnews\ $+ %enteofileoffline) == $true) { run notepad $scriptdirnews\ $+ %enteofileoffline }
  }
  .Abrir directorio de todas las noticias (ya bajadas):{
    if ($exists($scriptdirnews) == $true) { run explorer $scriptdirnews\ }
  }
  .-
  .Publicidad:/ame use... 4E5nteo6-4P5siquers 2Add12On 3news update 6by 1A-Kristo 14[12http://www.fut.es/~jalbam14]
  -
}

ctcp &^*:enteo-psiquers:*:{
  .ctcpreply $nick 4E5nteo6-4P5siquers 2Add12On 3news update 14(downloading news...)
  /enteopsiquers
}
