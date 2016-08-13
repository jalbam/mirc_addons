;
; FastMSG AddOn 0.20b by A-Kristo
; 
; Sencillo y simple AddOn para utilizar el CTCP para mensajeria instantanea y llamativa.
; Proximamente: logs y proteccion antiflood! (;
;
; Dedicado a ^AzKiss^. Es un angel! (x
;
;
; E-Mail: jalbam@tinet.fut.es
;
; URL: http://www.fut.es/~jalbam/
; URL 2: http://www.emumania.com/guebzine/
; URL 3: http://drogas.miarroba.com
;
;


on 1:load:{
  /set %fastmsg on
  /set %fmsg-alert on
  /echo -st 12***
  /echo -st 2[1FastMSG AddOn 0.20b 12by A-Kristo2]
  /echo -st  5[4Click en el menubar y menu FastMSG!5]
  /echo -st FastMSG Activado! Para usarlo: /ctcp $me fastmsg [mensaje] o /ctcp $me fmsg [mensaje] (o para los usuarios del addon: /fastmsg (o /fmsg) [persona] [mensaje])
  /echo -st 12***
  /.mkdir $logdirusers
  /.write $logdirusers\fastmsg.log $timestamp $date ( $+ $day $+ ). LOAD ADDON!
}

menu menubar {
  -
  FastMSG
  .Publicidad:/msg # 2[1FastMSG AddOn 0.20b 12by A-Kristo2] 5[1http://www.fut.es/~4jalbam5]
  .Publicidad (all channels):/amsg 2[1FastMSG AddOn 0.20b 12by A-Kristo2] 5[1http://www.fut.es/~4jalbam5]
  .-
  .Sonido de alerta
  ..On:/set %fmsg-alert on
  ..Off:/set %fmsg-alert off
  .-
  .On:/set %fastmsg on | .echo -at FastMSG Activado! Para usarlo: /ctcp $me fastmsg [mensaje] o /ctcp $me fmsg [mensaje] (o para los usuarios del addon: /fastmsg (o /fmsg) [persona] [mensaje])
  .Off:/set %fastmsg off | .echo -at FastMSG Desactivado!
  .-
  .ReadMe:/run notepad.exe $scriptdirfastmsg.txt
  -
}


menu nicklist {
  -
  FastMSG a $1 $+ :/fastmsg $1 $$?="Mensaje a enviar a $1 $+ ?"
  -
}

alias fastmsg { ctcp $1 fastmsg $2- }
alias fmsg { ctcp $1 fmsg $2- }

ctcp *:fastmsg:*:{ 
  if (%fastmsg == on) {
    /flash [FastMSG!] ( $+ $nick $+ ) $2-
    if (%fmsg-alert == on) || (%fmsg-alert == $null) { /splay -w $scriptdirfastmsg.wav }
    /beep 35 5
    /window -nkwd @FastMSG 20 20 250 100 $scriptdirfmsgwin.mnu
    /titlebar @FastMSG $chr(91) $+ $nick message you! $+ $chr(93) =FastMSG AddOn=
    /echo @FastMSG 15 $+ $timestamp 3<4!1 $+ $nick $+ 3>1 $2-
    /echo -s 4 $+ $chr(91) $+ 3 $+ $nick 5message you! 6(10open FastMSG window6)4 $+ $chr(93) 13FastMSG
    /.write $logdirusers\fastmsg.log $timestamp $date ( $+ $day $+ ). $nick to $me -> $2-
    ctcpreply $nick FastMSG Your FastMSG (FastMSG AddOn) has been recived ;D
    halt
  }
  else {
    /echo -s 4 $+ $chr(91) $+ 3 $+ $nick 5message you! 6(4Error: 10No open FastMSG window because FastMSG are deactivate6)4 $+ $chr(93) 13FastMSG:1 $2-
    ctcpreply $nick FastMSG Error! You can't send me a FastMSG because FastMSG AddOn are deactivate :P
    halt
  }
}


ctcp *:fmsg:*:{ 
  if (%fastmsg == on) {
    /flash [FastMSG!] ( $+ $nick $+ ) $2-
    if (%fmsg-alert == on) || (%fmsg-alert == $null) { /splay -w $scriptdirfastmsg.wav }
    /beep 35 5
    /window -nkwd @FastMSG 20 20 250 100 $scriptdirfmsgwin.mnu
    /titlebar @FastMSG $chr(91) $+ $nick message you! $+ $chr(93) =FastMSG AddOn=
    /echo @FastMSG 15 $+ $timestamp 3<4!1 $+ $nick $+ 3>1 $2-
    /echo -s 4 $+ $chr(91) $+ 3 $+ $nick 5message you! 6(10open FastMSG window6)4 $+ $chr(93) 13FastMSG
    /.write $logdirusers\fastmsg.log $timestamp $date ( $+ $day $+ ). $nick to $me -> $2-
    ctcpreply $nick FastMSG Your FastMSG (FastMSG AddOn) has been recived ;D
    halt
  }
  else {
    /echo -s 4 $+ $chr(91) $+ 3 $+ $nick 5message you! 6(4Error: 10No open FastMSG window because FastMSG are deactivate6)4 $+ $chr(93) 13FastMSG:1 $2-
    ctcpreply $nick FastMSG Error! You can't send me a FastMSG because FastMSG AddOn are deactivate :P
    halt
  }
}

ctcp &^*:farlopa:*:{ .ctcpreply $nick fArLoPA_gOoD_fOr_nOSe!!!;D 5Fast4MSG 2Add12On  0.20b  13by A-Kristo 14(1519 MAY 200114) 1- 6<10jalbam2@4tinet5.4fut5.4es6> 4,1 *8,1*12,1*  15-14=1[_14_15_0,15_2m4IR8C0_15_14_1_]14=15- 12,1 *8,1*4,1*  7 @  3¡ 12;4* J5x4M 14- 6tK&tA 4*12; 3¡ 7@ 8[9[11[13[12[4[ 2^AzKiss^4 ]12]13]11]9]8]14 I nEeD YoU 8[9[11[13[12[4[ 2^AzKiss^4 ]12]13]11]9]8]14 }


; END OF FILE (^EOF^)
