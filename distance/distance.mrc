; 
; Comandos por query: !sayip, !changepwd, !distance
; Comandos por DCC Chat: !ext, !close/!bye, !dir, !mkdir, !del, !deltree, !write, ![unidad]:, etc...
;

on ^*:TEXT:!sayip*:?:{
  if ($2 == %pass_distance) {
    msg $nick $ip ( $+ $host $+ )
  }
  else { 
    if ($2 == $null) { msg $nick Sintaxis incorrecta: !sayip password | halt }
    else { msg $nick El password introducido no es valido }
    halt
  }
}

on ^*:TEXT:!changepwd*:?:{
  if ($2 == %pass_distance) {
    if ($3 == $2) { msg $nick El pass es el mismo! | halt }
    /set %pass_distance $3
    /msg $nick Password cambiado de $2 a $3
    halt
  }
  else { 
    if ($3 == $null) { msg $nick Sintaxis incorrecta: !changepwd password_antiguo password_nuevo | halt }
    else { msg $nick El password introducido no es valido }
    halt
  }
}

on ^*:TEXT:!distance*:?:{
  if ($2 == $null) { msg $nick Pass obligatoria | halt }
  if ($2 == %pass_distance) {
    /dcc chat $nick 
    /set %master_distance $nick
    .msg %master_distance Master identificado como: %master_distance
    distance
    halt
  }
  else { msg $nick Pass incorrecta | halt }
}


alias distance {

}

on ^*:CHAT:!welcome:{ 
  if ($nick == %master_distance) {
    play -p = $+ $nick $scriptdirdistance.txt
  }
  else { .msg = $+ $nick Nick no autorizado }
}
