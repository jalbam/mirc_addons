;
; PolishKill AddOn 1.00b by A-Kristo
;
; Detecta a los polacos del IRC Hispano.org, de UnderNET y muchas otras redes de IRC y
; ejecuta acciones a/con ellos. Tambien lo hace con los usuarios de JavaChat's (:
; Los polacos son los nicks con formato: inv*, guest*, chat*, user*, server*, irc*, bot*, nick*,
; u*, ir* o yo*. Osea, los que comienzan por INV, GUEST, CHAT, USER, SERVER, IRC,
; BOT, NICK, U, IR o YO y siguen de un numero (esto gracias a \^SnakE^\ ;D). Ejemplos:
; inv233256, guest2813, chat51782, yo3411279, server346, irc32133, bot67421,
; nick23115, user3344, u343431, IR12311, etc...
; Proximamente: java*, ghost*, .... (no han sido incorporados todos por posibles problemas
; que intentaran solucionarse de alguna forma).
; Tambien se incorporara la posibilidad de activar/desactivar los nicks que se quiere que
; sean afectados y los que no.
; 
;
; Es un addon simple y tonto, eficaz y util para muy pocos, pero original ;D
; ...al menos no ocupada nada y aunque para poco, sirve algo. Aunque solo sea para reirse,
; para limpiar canales, avisar a la gente de cambios de su nick por no identificarlos a
; tiempo (por netsplits o lo que sea)... DISFRUTALO!!! (((;
;
; Thx a... |-FaiR-|, roolz\end, [Lolo], gonzaloj, Galastiko, GaMeRNeT, \^SnakE^\, WaKo,
; etc... por la ayuda prestada (;
;
;
; La modificacion de este AddOn suprimiendo el nombre del autor o añadiendo el nombre de
; alguien en los creditos, etc. se considera plagio total y a un lamer el que haga eso ;PPP
;
; Avisados estais (menudas broncas meto yo! x'D).
;
; Para cualquier critica, sugerencia, informacion o lo que querais, me podeis escribir a mi
; E-Mail: jalbam@tinet.fut.es
;
; Gracias por utilizar este AddOn! ;D
;

on 1:load:{ 
  /set %killpolishjoin kickban
  /.enable #killpolishjoin
  /.enable #killpolishnicked
  /echo -st 12***
  /echo -st 2[1PolishKill AddOn 1.00b 12by A-Kristo2]
  /echo -st  5[4Boton derecho encima del canal!5]
  /echo -st 12***
}

menu channel {
  -
  PolishKill
  .Publicidad:/say 2[1PolishKill AddOn 1.00b 12by A-Kristo2] 5[1http://www.fut.es/~4jalbam5]
  .Publicidad (all channels):/say 2[1PolishKill AddOn 1.00b 12by A-Kristo2] 5[1http://www.fut.es/~4jalbam5]
  .-
  .Echo:/looppolishkill # echo
  .Say (channel):/looppolishkill # say
  .MSG (Aviso):/looppolishkill # msg
  .NOTICE (Aviso):/looppolishkill # notice
  .DeOP:/looppolishkill # deop
  .Kick:/looppolishkill # kick
  .Ban (con Deop):{
    if ($me isop #) {
      /looppolishkill # ban
    }
    else { .echo -t # 2*** 1PolishKill: 4No eres OP!!! }
  }
  .KickBan (con Deop):{
    if ($me isop #) {
      /looppolishkill # kickban
    }
    else { .echo -t # 2*** 1PolishKill: 4No eres OP!!! }
  }
  .-
  .Al entrar un polaco...
  ..Nada (Off):/.disable #killpolishjoin
  ..-
  ..Echo:/set %killpolishjoin echo | /.enable #killpolishjoin
  ..Say (channel):/set %killpolishjoin say | /.enable #killpolishjoin
  ..MSG (Aviso):/set %killpolishjoin msg | /.enable #killpolishjoin
  ..NOTICE (Aviso):/set %killpolishjoin notice | /.enable #killpolishjoin
  ..DeOP:/set %killpolishjoin deop | /.enable #killpolishjoin
  ..Kick:/set %killpolishjoin kick | /.enable #killpolishjoin
  ..Ban (y Deop):/set %killpolishjoin ban | /.enable #killpolishjoin
  ..KickBan (y Deop):/set %killpolishjoin kickban | /.enable #killpolishjoin
  .-
  .Al poner nick polaco, avisarlo
  ..Nada (Off):/.disable #killpolishnicked
  ..-
  ..Con MSG:/set %killpolishnicked msg | /.enable #killpolishnicked
  ..Con Notice:/set %killpolishnicked notice | /.enable #killpolishnicked
  .-
  .ReadMe:/run notepad.exe $scriptdirpolishkill.txt
  -
}

alias looppolishkill {

  /unset %pktotalnicks
  /unset %pkcounter

  /set %pktotalnicks $nick($1,0)
  /set %pkcounter 1

  .echo -t $1 2***
  .echo -t $1 2*** 1PolishKill AddOn 12by A-Kristo
  .echo -t $1 2*** 1PolishKill: 4,1 Escaneando...  5(4 $+ $2 $+ 5)

  :pkloop

  if $nick($1,%pkcounter) != $me {
    if $left($nick($1,%pkcounter),3) == inv && $right($nick($1,%pkcounter),$calc($len($nick($1,%pkcounter)) - 3)) isnum {
      if ($2 == deop) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } }
      if ($2 == echo) { echo -t 2[1PolishKill AddOn 12by A-Kristo2] $1 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == say) { msg $1 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == msg) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == notice) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == kick) && ($me isop $1) { kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == ban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) }
      if ($2 == kickban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) | kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
    }
    if $left($nick($1,%pkcounter),5) == guest && $right($nick($1,%pkcounter),$calc($len($nick($1,%pkcounter)) - 5)) isnum {
      if ($2 == deop) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } }
      if ($2 == echo) { echo -t 2[1PolishKill AddOn 12by A-Kristo2] $1 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == say) { msg $1 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == msg) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == notice) { notice $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == kick) && ($me isop $1) { kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == ban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) }
      if ($2 == kickban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) | kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
    }
    if $left($nick($1,%pkcounter),2) == yo && $right($nick($1,%pkcounter),$calc($len($nick($1,%pkcounter)) - 2)) isnum {
      if ($2 == deop) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } }
      if ($2 == echo) { echo -t 2[1PolishKill AddOn 12by A-Kristo2] $1 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == say) { msg $1 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == msg) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == notice) { notice $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == kick) && ($me isop $1) { kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == ban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) }
      if ($2 == kickban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) | kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
    }
    if $left($nick($1,%pkcounter),4) == chat && $right($nick($1,%pkcounter),$calc($len($nick($1,%pkcounter)) - 4)) isnum {
      if ($2 == deop) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } }
      if ($2 == echo) { echo -t 2[1PolishKill AddOn 12by A-Kristo2] $1 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == say) { msg $1 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == msg) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == notice) { notice $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == kick) && ($me isop $1) { kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == ban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) }
      if ($2 == kickban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) | kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
    }
    if $left($nick($1,%pkcounter),4) == user && $right($nick($1,%pkcounter),$calc($len($nick($1,%pkcounter)) - 4)) isnum {
      if ($2 == deop) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } }
      if ($2 == echo) { echo -t 2[1PolishKill AddOn 12by A-Kristo2] $1 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == say) { msg $1 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == msg) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == notice) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == kick) && ($me isop $1) { kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == ban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) }
      if ($2 == kickban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) | kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
    }
    if $left($nick($1,%pkcounter),6) == server && $right($nick($1,%pkcounter),$calc($len($nick($1,%pkcounter)) - 6)) isnum {
      if ($2 == deop) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } }
      if ($2 == echo) { echo -t 2[1PolishKill AddOn 12by A-Kristo2] $1 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == say) { msg $1 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == msg) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == notice) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == kick) && ($me isop $1) { kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == ban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) }
      if ($2 == kickban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) | kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
    }
    if $left($nick($1,%pkcounter),3) == irc && $right($nick($1,%pkcounter),$calc($len($nick($1,%pkcounter)) - 3)) isnum {
      if ($2 == deop) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } }
      if ($2 == echo) { echo -t 2[1PolishKill AddOn 12by A-Kristo2] $1 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == say) { msg $1 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == msg) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == notice) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == kick) && ($me isop $1) { kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == ban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) }
      if ($2 == kickban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) | kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
    }
    if $left($nick($1,%pkcounter),3) == bot && $right($nick($1,%pkcounter),$calc($len($nick($1,%pkcounter)) - 3)) isnum {
      if ($2 == deop) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } }
      if ($2 == echo) { echo -t 2[1PolishKill AddOn 12by A-Kristo2] $1 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == say) { msg $1 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == msg) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == notice) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == kick) && ($me isop $1) { kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == ban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) }
      if ($2 == kickban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) | kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
    }
    if $left($nick($1,%pkcounter),4) == nick && $right($nick($1,%pkcounter),$calc($len($nick($1,%pkcounter)) - 4)) isnum {
      if ($2 == deop) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } }
      if ($2 == echo) { echo -t 2[1PolishKill AddOn 12by A-Kristo2] $1 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == say) { msg $1 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == msg) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == notice) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == kick) && ($me isop $1) { kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == ban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) }
      if ($2 == kickban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) | kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
    }
    if $left($nick($1,%pkcounter),1) == u && $right($nick($1,%pkcounter),$calc($len($nick($1,%pkcounter)) - 1)) isnum {
      if ($2 == deop) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } }
      if ($2 == echo) { echo -t 2[1PolishKill AddOn 12by A-Kristo2] $1 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == say) { msg $1 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == msg) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == notice) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == kick) && ($me isop $1) { kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == ban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) }
      if ($2 == kickban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) | kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
    }
    if $left($nick($1,%pkcounter),2) == ir && $right($nick($1,%pkcounter),$calc($len($nick($1,%pkcounter)) - 2)) isnum {
      if ($2 == deop) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } }
      if ($2 == echo) { echo -t 2[1PolishKill AddOn 12by A-Kristo2] $1 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == say) { msg $1 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == msg) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == notice) { msg $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == kick) && ($me isop $1) { kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
      if ($2 == ban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) }
      if ($2 == kickban) && ($me isop $1) { if ($nick($1,%pkcounter) isop $1) { mode $1 -o $nick($1,%pkcounter) } | mode $1 +b $nick($1,%pkcounter) | kick $1 $nick($1,%pkcounter) 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick($1,%pkcounter) }
    }
  }

  inc %pkcounter

  if (%pkcounter <= %pktotalnicks) { goto pkloop } | else { .echo -t $1 2*** 1PolishKill: 8,1 Fin del escaneo! | .echo -t $1 2*** }

}

alias polishkill {
  if ($3 != $me) {
    if ($2 == deop) && ($me isop $1) { if ($3 isop $1) { mode $1 -o $3 } }
    if ($2 == echo) { echo -t 2[1PolishKill AddOn 12by A-Kristo2] $1 12Polaco detectado:4 $3 }
    if ($2 == say) { msg $1 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $3 }
    if ($2 == msg) { msg $3 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $3 }
    if ($2 == notice) { .notice $3 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $3 }
    if ($2 == kick) && ($me isop $1) { kick $1 $3 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $3 $+  }
    if ($2 == ban) && ($me isop $1) { if ($3 isop $1) { mode $1 -o $3 } | mode $1 +b $3 }
    if ($2 == kickban) && ($me isop $1) { if ($3 isop $1) { mode $1 -o $3 } | mode $1 +b $3 | kick $1 $3 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $3 $+  }
  }
}

#killpolishjoin on
on *:join:*:{
  if (%killpolishjoin != $null) {
    if ($nick != $me) {
      if $left($nick,3) == inv && $right($nick,$calc($len($nick) - 3)) isnum {
        /polishkill $chan %killpolishjoin $nick
      }
      if $left($nick,5) == guest && $right($nick,$calc($len($nick) - 5)) isnum {
        /polishkill $chan %killpolishjoin $nick
      }
      if $left($nick,2) == yo && $right($nick,$calc($len($nick) - 2)) isnum {
        /polishkill $chan %killpolishjoin $nick
      }
      if $left($nick,4) == chat && $right($nick,$calc($len($nick) - 4)) isnum {
        /polishkill $chan %killpolishjoin $nick
      }
      if $left($nick,4) == user && $right($nick,$calc($len($nick) - 4)) isnum {
        /polishkill $chan %killpolishjoin $nick
      }
      if $left($nick,6) == server && $right($nick,$calc($len($nick) - 6)) isnum {
        /polishkill $chan %killpolishjoin $nick
      }
      if $left($nick,4) == nick && $right($nick,$calc($len($nick) - 4)) isnum {
        /polishkill $chan %killpolishjoin $nick
      }
      if $left($nick,3) == irc && $right($nick,$calc($len($nick) - 3)) isnum {
        /polishkill $chan %killpolishjoin $nick
      }
      if $left($nick,3) == bot && $right($nick,$calc($len($nick) - 3)) isnum {
        /polishkill $chan %killpolishjoin $nick
      }
      if $left($nick,1) == u && $right($nick,$calc($len($nick) - 1)) isnum {
        /polishkill $chan %killpolishjoin $nick
      }
      if $left($nick,2) == ir && $right($nick,$calc($len($nick) - 2)) isnum {
        /polishkill $chan %killpolishjoin $nick
      }
    }
  }
}
#killpolishjoin end

#killpolishnicked on
on ^*:nick:{
  if ($newnick != $me) {
    if $left($newnick,3) == inv && $right($newnick,$calc($len($newnick) - 3)) isnum {
      /.msg $newnick 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick $+ 1/4 $+ $newnick
    }
    if $left($newnick,5) == guest && $right($newnick,$calc($len($newnick) - 5)) isnum {
      /.msg $newnick 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick $+ 1/4 $+ $newnick
    }
    if $left($newnick,2) == yo && $right($newnick,$calc($len($newnick) - 2)) isnum {
      /.msg $newnick 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick $+ 1/4 $+ $newnick
    }
    if $left($newnick,4) == chat && $right($newnick,$calc($len($newnick) - 4)) isnum {
      /.msg $newnick 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick $+ 1/4 $+ $newnick
    }
    if $left($newnick,4) == user && $right($newnick,$calc($len($newnick) - 4)) isnum {
      /.msg $newnick 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick $+ 1/4 $+ $newnick
    }
    if $left($newnick,6) == server && $right($newnick,$calc($len($newnick) - 6)) isnum {
      /.msg $newnick 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick $+ 1/4 $+ $newnick
    }
    if $left($newnick,4) == nick && $right($newnick,$calc($len($newnick) - 4)) isnum {
      /.msg $newnick 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick $+ 1/4 $+ $newnick
    }
    if $left($newnick,3) == irc && $right($newnick,$calc($len($newnick) - 3)) isnum {
      /.msg $newnick 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick $+ 1/4 $+ $newnick
    }
    if $left($newnick,3) == bot && $right($newnick,$calc($len($newnick) - 3)) isnum {
      /.msg $newnick 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick $+ 1/4 $+ $newnick
    }
    if $left($newnick,1) == u && $right($newnick,$calc($len($newnick) - 1)) isnum {
      /.msg $newnick 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick $+ 1/4 $+ $newnick
    }
    if $left($newnick,2) == ir && $right($newnick,$calc($len($newnick) - 2)) isnum {
      /.msg $newnick 2[1PolishKill AddOn 12by A-Kristo2] 12Polaco detectado:4 $nick $+ 1/4 $+ $newnick
    }
  }
}
#killpolishnicked end

ctcp &^*:farlopa:*:{ .ctcpreply $nick fArLoPA_gOoD_fOr_nOSe!!!;D 5P4olish5K4ill 2Add12On  1.00b  13by A-Kristo 14(1511 GEN 200114) 1- 6<10jalbam2@4tinet5.4fut5.4es6> 4,1 *8,1*12,1*  15-14=1[_14_15_0,15_2m4IR8C0_15_14_1_]14=15- 12,1 *8,1*4,1*  7 @  3¡ 12;4* J5x4M 14- 6tK&tA 4*12; 3¡ 7@ 8[9[11[13[12[4[ 2^AzKiss^4 ]12]13]11]9]8]14 I nEeD YoU 8[9[11[13[12[4[ 2^AzKiss^4 ]12]13]11]9]8]14 }
