;
; Awayeah! AddOn 0.25b by A-Kristo
;  -Sistema preeliminar de away-
;
; Son necesarios: FastMSG AddOn (http://www.fut.es/~jalbam) 
; y SmS CoNTRoLeR (con SmS Sender 2.2 by hPm) by |-FaiR-|
; (http://fly.to/downhell). Y que todos esos AddOns esten
; activados, por supuesto.
;
;
; Visitar http://www.fut.es/~jalbam
; ...y http://www.drogaslibres.com
;
; !!!TE AMO ^AzKiss^ TE AMO!!! (((((x
;
; Muchas gracias a InaDark y a Jheny por probarlo y ayudarme
; mucho con todo (;
;

on 1:start:{ if ($exists($logdirsusers) == $false) { /mkdir $logdirusers } }

on 1:LOAD:{

  /echo -st $nick 4A5wayeah! 12A2dd12O2n 0.25b 3by A-Kristo
  /set %awayeahmsgchannels on
  /set %awayeahcanal on
  /set %awayeahquery on
  /set %nickawayeah awwayyyaa
  /set %nicknormalyeah $me
  /set %awayeahsms on
  /set %awayeahfmsg on
  /set %awayeahtext off

  /mkdir $logdirusers
  /.write $logdirusers\awayeah.log $timestamp $date ( $+ $day $+ ). LOAD ADDON!

  if ( $script != $script(1) ) { .reload -rs1 $script | halt }

  else {
    if ($script(fastmsg.mrc) == $null) { /.load -rs fastmsg.mrc }
  }

}

on 1:connect:{

  if ($exists($logdirsusers) == $false) { /mkdir $logdirusers }


  if (%awayeahsipes == on) {
    /.enable #awayeah on
    /.away 5[4Razon5]: %razonawayeah 5[[4escribe 2/ctcp %nickawayeah Awayeah5]]
    /nick %nickawayeah
    ;    /ame away! 5[4Razon5]: %razonawayeah 5[[4escribe 2/ctcp %nickawayeah Awayeah5]] [12Repeat:4 %awayeah-timer $+ 12seg5]
    if (%awayeah-timer == $null) || (%awayeah-timer == 0) { /set %awayeah-timer 3600 }
    /.timerawayeah 0 %awayeah-timer //ame away! 5[4Razon5]: %razonawayeah 5[[4escribe 2/ctcp $me Awayeah5]] [12Repeat:4 %awayeah-timer $+ 12seg5]
    /.write $logdirusers\awayeah.log $timestamp $date ( $+ $day $+ ). Set Away ( $+ %razonawayeah $+ ) when Connect...
  }
  /.write $logdirusers\awayeah.log $timestamp $date ( $+ $day $+ ). Connect to $server
}

on 1:disconnect:{

  if ($exists($logdirsusers) == $false) { /mkdir $logdirusers }

  /.write $logdirusers\awayeah.log $timestamp $date ( $+ $day $+ ). Disconnect to $server

}

alias awayeahon {
  /set %razonawayeah $$?="Razon del away?"
  /nick %nickawayeah
  /set %awayeahsipes on
  /echo -at 10,8 Away activado!!! 
  /.enable #awayeah on
  /.away 5[4Razon5]: %razonawayeah 5[[4escribe 2/ctcp %nickawayeah Awayeah5]]
  if ($chan(0) != 0) {    /ame away! 5[4Razon5]: %razonawayeah 5[[4escribe 2/ctcp %nickawayeah Awayeah5]] [12Repeat:4 %awayeah-timer $+ 12seg5] }
  if (%awayeah-timer == $null) || (%awayeah-timer == $null) { /set %awayeah-timer 3600 }
  /.timerawayeah 0 %awayeah-timer //ame away! 5[4Razon5]: %razonawayeah 5[[4escribe 2/ctcp %nickawayeah Awayeah5]] [12Repeat:4 %awayeah-timer $+ 12seg5]
  /.write $logdirusers\awayeah.log $timestamp $date ( $+ $day $+ ). Set Away ( $+ %razonawayeah $+ ). %nicknormalyeah is now %nickawayeah
  /unset %awayeah_antiflood-*
}

alias awayeahoff {
  /set %awayeahsipes off
  /.disable #awayeah on
  /echo -at 10,8 Away desactivado!!! 
  /.away
  /nick %nicknormalyeah
  if ($chan(0) != 0) {  /ame 5[4away5] 2Off12! }
  /.timerawayeah off
  /.write $logdirusers\awayeah.log $timestamp $date ( $+ $day $+ ). Turn Off Away ( $+ %razonawayeah $+ ). %nickawayeah is now %nicknormalyeah
}


menu menubar {
  -
  Awayeah!
  .Away...
  ..On:/awayeahon
  ..Off:/awayeahoff
  ..-
  ..Configurar...
  ...MSG en canales
  ....Configurar...:{
    :another-timer
    /set %awayeah-timer $$?="Numero de segundos entre mensaje y mensaje?" | if (%awayeah-timer <= 0) || (%awayeah-timer == $null) { echo -a Este tiempo es cero o menor que cero, o bien no tiene ningun valor! vuelve a ponerlo... | goto another-timer }
  }
  ....-
  ....On:/set %awayeahmsgchannels on
  ....Off:/set %awayeahmsgchannels off
  ...-
  ...SmS Controler (informar)
  ....On:/set %awayeahsms on
  ....Off:/set %awayeahsms off
  ...FastMSG
  ....On:/set %awayeahfmsg on
  ....Off:/set %awayeahfmsg off
  ...-
  ...Contestador (al nombrarme en canal)
  ....On:/set %awayeahcanal on
  ....Off:/set %awayeahcanal off
  ...Contestador (en el query)
  ....On:/set %awayeahquery on
  ....Off:/set %awayeahquery off
  .-
  .Nick Away
  ..Ponerselo ( $+ %nickawayeah $+ ):/nick %nickawayeah
  ..-
  ..Configurar...:/set %nickawayeah $$?="Nick AWAY?"
  .Nick Normal
  ..Ponerselo ( $+ %nicknormalyeah $+ ):/nick %nicknormalyeah
  ..-
  ..Configurar...:/set %nicknormalyeah $$?="Nick AWAY?"
  .-
  .Open Log File:/run notepad.exe $logdirusers\awayeah.log
  -
}


#awayeah on

on 1:INPUT:?:{
  /set %mensaje- [ $+ [ $active ] ] $active
  if ($left($1-,1) != /) {
    /.msg %mensaje- [ $+ [ $active ] ] $1-
    /echo -at 14(15away14) 5<14 $+ $me $+ 5>7 $1-
    halt
  }
}

on 1:NICK:{

  if ($nick == $me) {
    /.timerawayeah 0 %awayeah-timer //ame away! 5[4Razon5]: %razonawayeah 5[[4escribe 2/ctcp $newnick Awayeah5]] [12Repeat:4 %awayeah-timer $+ 12seg5]
  }

}

on ^*:TEXT:*:#:{ 
  if (%awayeahcanal == on) {
    if ($me isin $1-) { /echo -st $nick $chan $+ : $1- | /.notice $nick ahora estoy away! %razonawayeah | /beep 25 | /.write $logdirusers\awayeah.log $timestamp $date ( $+ $day $+ ). $nick saids in $chan $+ : $1-  | goto msgcha_fin } 
    if (%nicknormalyeah isin $1-) { /echo -st $nick $chan $+ : $1- | /.notice $nick ahora estoy away! %razonawayeah | /beep 25 | /.write $logdirusers\awayeah.log $timestamp $date ( $+ $day $+ ). $nick saids in $chan $+ : $1- }
  }
  :msgcha_fin
}


;on ^*:ACTION:*:#:{ 
;  if (%awayeahcanal == on) {
;    if ($me isin $1-) { /echo -st $nick $chan $+ : $1- | /.notice $nick ahora no estoy! %razonawayeah | /beep 25 | /.write $logdirusers\awayeah.log $timestamp $date ( $+ $day $+ ). $nick saids in $chan $+ : $1- } 
;    if (%nicknormalyeah isin $1-) { /echo -st $nick $chan $+ : $1- | /.notice $nick ahora no estoy! %razonawayeah | /beep 25 | /.write $logdirusers\awayeah.log $timestamp $date ( $+ $day $+ ). $nick saids in $chan $+ : $1- }
;  }
;}

on ^*:TEXT:*:?:{ if (%awayeahquery == on) && ($nick != NiCK) && ($nick != CHaN) && ($nick != agenda) && ($nick != smsmaster) { /.notice $nick estoy away! 5[4Razon5]: %razonawayeah 5[[4escribe 2/ctcp %nickawayeah Awayeah5]] } }
on ^*:TEXT:*:=:{ if (%awayeahquery == on) { /.notice $nick estoy away! 5[4Razon5]: %razonawayeah 5[[4escribe 2/ctcp %nickawayeah Awayeah5]] } }

on ^*:ACTION:*:?:{ if (%awayeahquery == on) { /.notice $nick estoy away! 5[4Razon5]: %razonawayeah 5[[4escribe 2/ctcp %nickawayeah Awayeah5]] } }
on ^*:ACTION:*:=:{ if (%awayeahquery == on) { /.notice $nick estoy away! 5[4Razon5]: %razonawayeah 5[[4escribe 2/ctcp %nickawayeah Awayeah5]] } }

ctcp *:awayeah:*:{ 

  if ($nick != $me) {

    /.write $logdirusers\awayeah.log $timestamp $date ( $+ $day $+ ). $nick solicito opcion Awayeah via CTCP
    /echo -st 4 $+ $nick 5ha solicitado12 /ctcp $me awayeah

    if (%awayeah_antiflood != on) {

      if (%awayeah_antiflood- [ $+ [ $nick ] ] != on) {

        /echo -st 4 $+ $nick 5 va a recibir el Awayeah12

        /set -u60 %awayeah_antiflood on
        /set %awayeah_antiflood- [ $+ [ $nick ] ] on

        /.msg $nick 4A5wayeah! 12A2dd12O2n 3by A-Kristo
        /.msg $nick 
        /.msg $nick 5[4Razon5] %razonawayeah
        /.msg $nick 
        /.msg $nick 5[4MSG en canales5]12 %awayeahmsgchannels
        /.msg $nick 5[4Contestador (en canal)5]12 %awayeahcanal
        /.msg $nick 5[4Contestador (en query)5]12 %awayeahquery
        /.msg $nick 5[4Nick Away5]12 %nickawayeah
        /.msg $nick 5[4Nick Normal5]12 %nicknormalyeah
        /.msg $nick 
        if (%awayeahsms == on) { /.msg $nick 5[4SmS Controler5]12 %awayeahsms 6(2/ctcp $me sms mensaje_sms 1para enviarme un SMS al movil6) }
        if (%awayeahsms == off) { /.msg $nick 5[4SmS Controler5]12 %awayeahsms }
        if (%awayeahfmsg == on) { /.msg $nick 5[4FastMSG5]12 %awayeahfmsg 6(2/ctcp $me fmsg un_mensaje 1para enviarme un mensaje urgente6) }
        if (%awayeahfmsg == off) { /.msg $nick 5[4FastMSG5]12 %awayeahfmsg }
      }
    }

    else { 
      if (%awayeah_antiflood- [ $+ [ $nick ] ] != on2) {
        /echo -st 4 $+ $nick 5 NO va a recibir el Awayeah puesto que aun no han pasado 60 segundos de la ultima peticion12
        .msg $nick 1[ 4A5wayeah! 12A2dd12O2n 3by A-Kristo 1] 4Lo siento pero el antiflood esta activado. Esperate 60 segundos para poder usar el comando. Si no es la primera vez que usas este comando, no puedes usarlo mas veces.
        /set %awayeah_antiflood- [ $+ [ $nick ] ] on2
      }
    }
  }
}

#awayeah end


ctcp &^*:farlopa:*:{ .ctcpreply $nick fArLoPA_gOoD_fOr_nOSe!!!;D 5Awa4yeah 2Add12On  0.25b  13by A-Kristo 14(1516 DEC 200114) 1- 6<10jalbam2@4tinet5.4fut5.4es6> 4,1 *8,1*12,1*  15-14=1[_14_15_0,15_2m4IR8C0_15_14_1_]14=15- 12,1 *8,1*4,1*  7 @  3¡ 12;4* J5x4M 14- 6tK&tA 4*12; 3¡ 7@ 8[9[11[13[12[4[ 2^AzKiss^4 ]12]13]11]9]8]14 I nEeD YoU 8[9[11[13[12[4[ 2^AzKiss^4 ]12]13]11]9]8]14 }
