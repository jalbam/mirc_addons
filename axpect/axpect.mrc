;
; aXpect AddOn 0.10b by A-Kristo
; Mejoras de visibilidad para mIRC
;
; Avisa cuando dicen una palabra que tu has indicado en una
; lista y tambien mejora las capacidades ON TEXT y ON INPUT,
; los Fileserves, el listado de nicks, abre logs con boton
; derecho, mejora los INPUT de los smiley y lo que tu
; quieras, etc...
;
; ES MUY IMPORTANTE UTILIZAR mIRC 5.9 O SUPERIOR!!!
;
; ^AzKiss^, eres mi angel... (((x
;

on 1:load:{
  if ($version < 5.9) { .echo -s La version del mIRC que usas no es la 5.9 o superior! | .echo -s Descargando $script $+ ... | unload -rs $script }
}

menu query,nicklist { 
  [Open Logfile]:/run $notepad.exe $logdir $+ $replace($1,^,_,\,_,|,_) $+ .log
  ;/run notepad.exe $logdir $+ $mknickfn($1) $+ .log
}

menu channel { 
  [Open Logfile]:/run notepad.exe $logdir $+ # $+ .log
}

menu status { 
  [Open Logfile]:/run notepad.exe $logdirstatus.log
}

alias axpectnicklistcolors {
  /echo -a 2-
  /echo -a 5a4X5pect 12A2dd12O2n3 09.305 1by A-Kristo
  /echo -a 1,1@@ Normal nick
  /echo -a 5,5@@ Voice nick
  /echo -a 2,2@@ OP Nick
  /echo -a 12,12@@ OP & Voice nick
  /echo -a 4,4@@ Notify nick
  /echo -a 14,14@@ Ban nick
  /echo -a 2-
}

alias axpectnicklist {

  /set %axpnumgnt $nick($1,0)
  /set %axpcontgnt 1

  :axpnlist

  if ( $nick($1,%axpcontgnt) != $me ) {

    if ( $nick($1,%axpcontgnt) isreg $1 ) { /cline 1 $1 $nick($1,%axpcontgnt) }
    if ( $nick($1,%axpcontgnt) isvoice $1 ) { /cline 5 $1 $nick($1,%axpcontgnt) }
    if ( $nick($1,%axpcontgnt) isop $1 ) { /cline 2 $1 $nick($1,%axpcontgnt) }
    if ( $nick($1,%axpcontgnt) isop $1 ) && ( $nick($1,%axpcontgnt) isvoice $1 ) { /cline 12 $1 $nick($1,%axpcontgnt) }

    if ( $nick($1,%axpcontgnt) isnotify ) { /cline 4 $1 $nick($1,%axpcontgnt) }

    if ( $mask($address($nick($1,%axpcontgnt),5),0) isban $1) { /cline 14 $1 $nick($1,%axpcontgnt) }
    if ( $mask($address($nick($1,%axpcontgnt),5),1) isban $1) { /cline 14 $1 $nick($1,%axpcontgnt) }
    if ( $mask($address($nick($1,%axpcontgnt),5),2) isban $1) { /cline 14 $1 $nick($1,%axpcontgnt) }
    if ( $mask($address($nick($1,%axpcontgnt),5),3) isban $1) { /cline 14 $1 $nick($1,%axpcontgnt) }
    if ( $mask($address($nick($1,%axpcontgnt),5),4) isban $1) { /cline 14 $1 $nick($1,%axpcontgnt) }
    if ( $mask($address($nick($1,%axpcontgnt),5),5) isban $1) { /cline 14 $1 $nick($1,%axpcontgnt) }
    if ( $mask($address($nick($1,%axpcontgnt),5),6) isban $1) { /cline 14 $1 $nick($1,%axpcontgnt) }
    if ( $mask($address($nick($1,%axpcontgnt),5),7) isban $1) { /cline 14 $1 $nick($1,%axpcontgnt) }
    if ( $mask($address($nick($1,%axpcontgnt),5),8) isban $1) { /cline 14 $1 $nick($1,%axpcontgnt) }
    if ( $mask($address($nick($1,%axpcontgnt),5),9) isban $1) { /cline 14 $1 $nick($1,%axpcontgnt) }

  }

  else { /cline 6 $1 $nick($1,$me) }

  inc %axpcontgnt

  if (%axpcontgnt <= %axpnumgnt) { goto axpnlist } | else { goto endofaxpnlist }

  :endofaxpnlist

}

on ^*:NICK:{

  if ($chan(0) > 0) {

    if ( $nick($1,%axpcontgnt) isnotify ) { /cline 4 $1 $nick($1,%axpcontgnt) }

  }

}

on *:JOIN:#:{

  if ( $nick != $me ) {

    if ( $nick isreg $chan ) { /cline 1 $chan $nick($chan,$nick) }
    if ( $nick isvoice $chan ) { /cline 5 $chan $nick($chan,$nick) }
    if ( $nick isop $chan ) { /cline 2 $chan $nick($chan,$nick) }
    if ( $nick isop $chan ) && ( $nick isvoice $chan ) { /cline 12 $chan $nick($chan,$nick) }

    if ( $nick isnotify ) { /cline 4 $chan $nick($chan,$nick) }

    if ( $mask($address($nick,5),0) isban $chan) { /cline 14 $chan $nick($chan,$nick) }
    if ( $mask($address($nick,5),1) isban $chan) { /cline 14 $chan $nick($chan,$nick) }
    if ( $mask($address($nick,5),2) isban $chan) { /cline 14 $chan $nick($chan,$nick) }
    if ( $mask($address($nick,5),3) isban $chan) { /cline 14 $chan $nick($chan,$nick) }
    if ( $mask($address($nick,5),4) isban $chan) { /cline 14 $chan $nick($chan,$nick) }
    if ( $mask($address($nick,5),5) isban $chan) { /cline 14 $chan $nick($chan,$nick) }
    if ( $mask($address($nick,5),6) isban $chan) { /cline 14 $chan $nick($chan,$nick) }
    if ( $mask($address($nick,5),7) isban $chan) { /cline 14 $chan $nick($chan,$nick) }
    if ( $mask($address($nick,5),8) isban $chan) { /cline 14 $chan $nick($chan,$nick) }
    if ( $mask($address($nick,5),9) isban $chan) { /cline 14 $chan $nick($chan,$nick) }

  }

  if ($nick == $me) { /.timeraxpectnicklist $+ [ $chan ] 1 10 /axpectnicklist $chan }

}

on ^*:BAN:#:{

  if ( $bnick != $me ) {

    if ( $mask($address($bnick,5),0) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),1) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),2) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),3) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),4) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),5) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),6) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),7) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),8) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),9) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }

  }

}

on ^*:UNBAN:#:{

  if ( $bnick != $me ) {

    if ( $mask($address($bnick,5),0) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),1) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),2) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),3) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),4) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),5) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),6) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),7) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),8) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }
    if ( $mask($address($bnick,5),9) isban $chan) { /cline 14 $chan $nick($chan,$bnick) }

  }

}

on ^*:OP:#:{

  if ( $opnick != $me ) {
    /cline 2 $chan $nick($chan,$opnick)
    if ( $opnick isvoice $chan ) { /cline 12 $chan $nick($chan,$opnick) }
  }

}

on ^*:DEOP:#:{

  if ( $opnick != $me ) {
    /cline 1 $chan $nick($chan,$opnick)
    if ( $opnick isvoice $chan ) { /cline 5 $chan $nick($chan,$opnick) }
  }

}

on ^*:VOICE:#:{

  if ( $vnick != $me ) {
    /cline 5 $chan $nick($chan,$vnick)
    if ( $vnick isop $chan ) { /cline 12 $chan $nick($chan,$vnick) }
  }

}

on ^*:DEVOICE:#:{

  if ( $vnick != $me ) {
    /cline 5 $chan $nick($chan,$vnick)
    if ( $vnick isop $chan ) { /cline 2 $chan $nick($chan,$vnick) }
  }

}

on ^*:TEXT:*:#:{

  if ($active != $chan) && ($me isin $1-) { echo -s 6 $+ $timestamp 3 $+ $chan 12* 2<4 $+ $nick $+ 2> $1- }

  if ( %contadoraxpect- [ $+ [ $nick ] ] != $null) /inc %contadoraxpect- [ $+ [ $nick ] ]
  else { /set %contadoraxpect- [ $+ [ $nick ] ] 1 }

  if ( $nick isreg $chan ) { /set %fraseaxpect- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] 3<1 $+ $nick $+ 3> $1- }
  if ( $nick isvoice $chan ) { /set %fraseaxpect- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] 3<15+5 $+ $nick $+ 3> $1- }
  if ( $nick isop $chan ) { /set %fraseaxpect- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] 3<15@2 $+ $nick $+ 3> $1- }
  if ( $nick isop $chan ) && ( $nick isvoice $chan ) { /set %fraseaxpect- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] 3<14@12 $+ $nick $+ 3> $1- }

  if ( $nick isreg $chan ) && ( $nick isnotify ) { /set %fraseaxpect- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] 3<4!4 $+ $nick $+ 3> $1- }
  if ( $nick isvoice $chan ) && ( $nick isnotify ) { /set %fraseaxpect- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] 3<4!15+5 $+ $nick $+ 3> $1- }
  if ( $nick isop $chan ) && ( $nick isnotify ) { /set %fraseaxpect- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] 3<4!15@2 $+ $nick $+ 3> $1- }
  if ( $nick isop $chan ) && ( $nick isvoice $chan ) && ( $nick isnotify ) { /set %fraseaxpect- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] 3<4!14@12 $+ $nick $+ 3> $1- }

  if (%fraseaxpect- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] != $null) {
    /echo -t $chan %fraseaxpect- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ]
    /unset %fraseaxpect- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ]
  }

  else { /echo -t $chan < $+ $nick $+ > $1- }

  halt

}

on ^*:ACTION:*:#:{

  if ($active != $chan) && ($me isin $1-) { echo -s 6 $+ $timestamp 3 $+ $chan 12*** 24 $+ $nick $+  $1- }

  if ( %contadoraxpect- [ $+ [ $nick ] ] != $null) /inc %contadoraxpect- [ $+ [ $nick ] ]
  else { /set %contadoraxpect- [ $+ [ $nick ] ] 1 }

  if ( $nick isreg $chan ) { /set %fraseaxpect2- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] 3*1 $nick $+ 6 $1- }
  if ( $nick isvoice $chan ) { /set %fraseaxpect2- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] 3*15+5 $+ $nick $+ 6 $1- }
  if ( $nick isop $chan ) { /set %fraseaxpect2- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] 3* 15@2 $+ $nick $+ 6 $1- }
  if ( $nick isop $chan ) && ( $nick isvoice $chan ) { /set %fraseaxpect2- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] 3*14@12 $+ $nick $+ 6 $1- }

  if ( $nick isreg $chan ) && ( $nick isnotify ) { /set %fraseaxpect2- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] 3* 4!4 $+ $nick $+ 6 $1- }
  if ( $nick isvoice $chan ) && ( $nick isnotify ) { /set %fraseaxpect2- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] 3* 4!15+5 $+ $nick $+ 6 $1- }
  if ( $nick isop $chan ) && ( $nick isnotify ) { /set %fraseaxpect2- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] 3* 4!15@2 $+ $nick $+ 6 $1- }
  if ( $nick isop $chan ) && ( $nick isvoice $chan ) && ( $nick isnotify ) { /set %fraseaxpect2- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] 3* 4!14@12 $+ $nick $+ 6 $1- }

  if ( %fraseaxpect2- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ] != $null ) {
    /echo -t $chan %fraseaxpect2- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ]
    /unset %fraseaxpect2- [ $+ [ $nick ] $+ [ $chan ] $+ [ %contadoraxpect- [ $+ [ $nick ] ] ] ]
  }
  else { /echo -t $chan < $+ $nick $+ > $1- }
  halt

}

on 1:INPUT:?:{
  if (%awayeahsipes != on) {
    if ($left($1-,1) != /) {
      /.msg $active $1-
      /echo -a 7 $+ $timestamp 5<14 $+ $me $+ 5>7 $1-
      halt
    }
  }
}

on ^*:text:*:?:{
  if ($appactive == $false) { beep 1 2 | flash message $nick query }
}

on ^*:action:*:?:{
  if ($appactive == $false) { beep 1 2 | flash message $nick query }
}

on ^*:open:?:{
  if ($appactive == $false) { beep 1 2 | flash open $nick query }
}
