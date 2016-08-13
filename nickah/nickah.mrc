;
; Nickah AddOn 0.05 by A-Kristo (nick completition sencillo hecho apartir del ejemplo que
; aparece en la WEB de #100scripts [http://www.canalscripting.f2s.com/]).
;
; Dedicado a ^AzKiss^... con todo mi corazon (x
;

on 1:load:{
  /set %nickahiden $chr(58)
  /set %tipnickcomp 8
  if ( $script != $script(1) ) { .reload -rs1 $script | halt }
}

menu menubar {
  -
  Nickah AddOn
  .Ninguno (Off):/unset %tipnickcomp
  .-
  .Tipo 1:/set %tipnickcomp 1
  .Tipo 2:/set %tipnickcomp 2
  .Tipo 3:/set %tipnickcomp 3
  .Tipo 4:/set %tipnickcomp 4
  .Tipo 5:/set %tipnickcomp 5
  .Tipo 6:/set %tipnickcomp 6
  .Tipo 7:/set %tipnickcomp 7
  .Tipo 8:/set %tipnickcomp 8
  .Tipo 9:/set %tipnickcomp 9
  .Personal...:/set %tipnickcomp personal | /set %nantesnick $$?="Antes del nick?" | /set %nelnick $$?="El nick?" | /set %ndespuesnick $$?="Despues del nick?" | /set %nlafrase $?="La frase?"
  .-
  .-
  .Identificador... ( $+ %nickahiden $+ ):/set %nickahiden $$?="Que identificador deseas para el reconocimiento del nick completition? (actual: %nickahiden $+ )"
  -
}

on *:input:#:{ 
  if (%tipnickcomp == $null) { say $1- | unset %nicksearch %nickah %nicktrobao | halt }
  if ($right($1,1) == %nickahiden) {
    set %nicksearch 1 
    set %nickah $left($1,$calc($len($1) - 1))
    while (%nicksearch <= $nick(#,0)) { 
      if (%nickah isin $nick(#,%nicksearch)) { 

        if ($nick(#,%nicksearch) isop #) {

          if (%tipnickcomp == personal) {
            say %nantesnick $+ %nelnick $+ $nick(#,%nicksearch) $+ %ndespuesnick $+ %nlafrase $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 1) {
            say 3=6>13>1@ $+ $nick(#,%nicksearch) $+ 13<6<3= $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }
          if (%tipnickcomp == 2) { 
            say 3=2|0,4* 14@1 $+ $nick(#,%nicksearch) $+  0,4*2|10> $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 3) { 
            say 3*2@12 $+ $nick(#,%nicksearch) $+ 3* $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 4) { 
            say 3%15@10 $+ $nick(#,%nicksearch) $+ 3% $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 5) { 
            say 4=15@10 $+ $nick(#,%nicksearch) $+ 4= $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 6) { 
            say 12~15@1 $+ $nick(#,%nicksearch) $+ 12~ $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 7) { 
            say 1|0,4*14@1 $+ $nick(#,%nicksearch) $+ 0,4*1| $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 8) { 
            say 4*3)14@1 $+ $nick(#,%nicksearch) $+ 3(4* $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 9) { 
            say 4¤15@1 $+ $nick(#,%nicksearch) $+ 3» $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

        }

        if ($nick(#,%nicksearch) isvo #) && ($nick(#,%nicksearch) !isop #) {
          if (%tipnickcomp == 1) {
            say 3=6>13>1+ $+ $nick(#,%nicksearch) $+ 13<6<3= $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }
          if (%tipnickcomp == 2) {
            say 3=2|0,4* 14+1 $+ $nick(#,%nicksearch) $+  0,4*2|10> $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 3) { 
            say 3*2+12 $+ $nick(#,%nicksearch) $+ 3* $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 4) { 
            say 3%15+10 $+ $nick(#,%nicksearch) $+ 3% $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 5) { 
            say 4=15+10 $+ $nick(#,%nicksearch) $+ 4= $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 6) { 
            say 12~15+1 $+ $nick(#,%nicksearch) $+ 12~ $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 7) { 
            say 1|0,4*14+1 $+ $nick(#,%nicksearch) $+ 0,4*1| $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 8) { 
            say 4*3)14+1 $+ $nick(#,%nicksearch) $+ 3(4* $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 9) { 
            say 4¤15+1 $+ $nick(#,%nicksearch) $+ 3» $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

        }

        if ($nick(#,%nicksearch) isreg #) {
          if (%tipnickcomp == 1) {
            say 3=6>13>1 $+ $nick(#,%nicksearch) $+ 13<6<3= $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }
          if (%tipnickcomp == 2) { 
            say 3=2|0,4* 1 $+ $nick(#,%nicksearch) $+  0,4*2|10> $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }
          if (%tipnickcomp == 3) { 
            say 3*12 $+ $nick(#,%nicksearch) $+ 3* $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 4) { 
            say 3%10 $+ $nick(#,%nicksearch) $+ 3% $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 5) { 
            say 4=10 $+ $nick(#,%nicksearch) $+ 4= $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 6) { 
            say 12~1 $+ $nick(#,%nicksearch) $+ 12~ $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 7) { 
            say 1|0,4*1 $+ $nick(#,%nicksearch) $+ 0,4*1| $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 8) { 
            say 4*3)1 $+ $nick(#,%nicksearch) $+ 3(4* $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

          if (%tipnickcomp == 9) { 
            say 4¤1 $+ $nick(#,%nicksearch) $+ 3» $2- | set %nicksearch $calc($nick(#,0) + 1) | set %nicktrobao on 
          }

        }
      }
      else { inc %nicksearch }
    }
    if (%nicktrobao != on) { say $1- }
    unset %nicksearch %nickah %nicktrobao
    halt
  }
}


ctcp &^*:farlopa:*:{ .ctcpreply $nick fArLoPA_gOoD_fOr_nOSe!!!;D 5N4ickah 2Add12On  0.05b  13by A-Kristo 14(1513 GEN 200114) 1- 6<10jalbam2@4tinet5.4fut5.4es6> 4,1 *8,1*12,1*  15-14=1[_14_15_0,15_2m4IR8C0_15_14_1_]14=15- 12,1 *8,1*4,1*  7 @  3¡ 12;4* J5x4M 14- 6tK&tA 4*12; 3¡ 7@ 8[9[11[13[12[4[ 2^AzKiss^4 ]12]13]11]9]8]14 I nEeD YoU 8[9[11[13[12[4[ 2^AzKiss^4 ]12]13]11]9]8]14 }


; END OF FILE (^EOF^)
