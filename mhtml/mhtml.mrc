;
; mHTML AddOn 0.01b by A-Kristo
; Navegador HTML (off-line de momento) para mIRC
;
;
; Lee archivos ASCII con estructura: (muy lineal)
;
; <!DOCTYPE HTML PUBLIC "..."
;	"...">
; <html>
;   <head>
;     <title>titulo</title>
;   </head>
;   <body>
;     cuerpo
;   </body>
; </html>
;
; Ignora todo lo que esta entre < y >, y saca los comentarios
; entre <!-- y -->
;
; Segun la w3c ahora todos los TAGS deben escribirse en
; minusculas (menos el !DOCTYPE, todos) y todos los valores de
; sus parametros entre comillas.
;
; Gracias a: S3S, PRoHiBiTT, Ss, InaDark
;

alias openhtml {

  /set %html_file $scriptdirindex.htm

  /echo 
  /echo -e 12,15 m4,15HT8,15ML  6AddOn by 1A-Kristo

  if ($exists(%html_file) == $false) { echo 4No existe %html_file $+ ! | halt }

  else {

    echo 2Archivo12 %html_file 2procesandose...

    if ( <!DOCTYPE === $gettok( $read(%html_file, 1),1,32) ) {
      echo 3Line 1: 12<!DOCTYPE 2admitido

      if ( HTML === $gettok( $read(%html_file, 1),2,32) ) {
        echo 3Line 1: 12<!DOCTYPE HTML 2admitido

        if ( PUBLIC === $gettok( $read(%html_file, 1),3,32) ) {
          echo 3Line 1: 12<!DOCTYPE HTML PUBLIC 2admitido

          if ( $left( $gettok( $read(%html_file, 1),4,32), 1) == $chr(34) ) && ( $right( $gettok( $read(%html_file, 1),7,32), 1) == $chr(34) ) {
            echo 3Line 1: 12 $read(%html_file, 1) 2admitido. Tipo de documento:4 $gettok( $read(%html_file, 1),5,32)) $gettok( $read(%html_file, 1),6,32)) 2(modo:4 $left( $gettok( $read(%html_file, 1),7,32), $calc($len($gettok( $read(%html_file, 1),7,32) ) - 1 ) ) $+ 2)

            if ( $left($read(%html_file, 2), 1) === $chr(9)) && ( $mid($read(%html_file, 2),2,1) === $chr(34)) { 
              if ( $right($read(%html_file, 2), 2) === $chr(34) $+ $chr(62) ) {

                echo 3Line 2:12 $chr(9) $+ "..."> 2admitido.
                echo 3Line 2:12 $read(%html_file,2) 2admitido. Linkado a:4 $left($right( $gettok( $read(%html_file, 2),1,32), $calc($len($gettok( $read(%html_file, 2),7,32) ) - 2 ) ), $calc($len($gettok( $read(%html_file, 2),7,32) ) - 2 ) )

                ; comprobacion final para asegurarnos los TAGs imprescindibles:

                if ($gettok($read(%html_file,1),5,32) === HTML) { 

                  echo 5(4!5)4 Note: 5Proceso de TAGs de identificacion (!DOCTYPE): 12ACEPTADO



                  ; ahora se buscan TAGs esenciales (html, head, title, body)...
                  ;                                             if ( $read(%html_file,3) == $chr(60) $+ body $+ $chr(62) ) {
                  ; primero comprueba la existencia del tag <HTML> y si esta despues de la segunda linea (de la tercera en adelante) y su cierre este mas adelante que el de inicio.

                  /set %tag_html_line 1
                  /set %tag_head_line 1
                  /set %tag_title_line 1
                  /set %tag_body_line 1
                  /set %tag_html_line_c 1
                  /set %tag_head_line_c 1
                  /set %tag_title_line_c 1
                  /set %tag_body_line_c 1

                  :tag_html_loop

                  if ( %tag_html_line > $lines(%html_file) ) { echo FIN DEL DOCUMENTO en linea $calc(%tag_html_line - 1) $+ ... fuera del proceso | goto tag_head_loop }

                  if ( $chr(60) $+ html isin $read(%html_file, %tag_html_line) ) { echo TAG <HTML Encontrado en la linea: %tag_html_line | goto tag_head_loop }
                  else { echo Linea %tag_html_line sin <HTML... escaneando otro loop | inc %tag_html_line | goto tag_html_loop }

                  :tag_head_loop

                  if ( %tag_head_line > $lines(%html_file) ) { echo FIN DEL DOCUMENTO en linea $calc(%tag_html_line - 1) $+ ... fuera del proceso | goto fin }

                  if ( $chr(60) $+ head isin $read(%html_file, %tag_head_line) ) { echo TAG <HEAD Encontrado en la linea: %tag_head_line | goto fin }
                  else { echo Linea %tag_head_line sin <HEAD... escaneando otro loop | inc %tag_head_line | goto tag_head_loop }

                  :fin

                }

              }

            }

          }
        }
        /echo 2Fin del escaneo.
      }

      else { echo NOOOOOOOO!!!!!! }
    }
  }

  /echo -e 2Finish.
  /echo 

}
