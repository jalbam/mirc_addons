;
; mNotify AddOn 0.96b for mIRC - by A-Kristo. (03 JUN 2001)
;
; Special thanks to...
; ^AzKiss^ (my love!), Atxeko, WaKo, jfk-, |-Fair-|, BaD^GiRL, InaDark, hyphen,
; LZ, Ss, gonzaloj, ^SoMBrA^, h, Locorl, Jimmy_RAY, TonIC, Errold, [Lolo], Lolocop,
; _ALIEN_, InaDark, ^_IpSe_^, J4|0, Discman, etc... and all people of #100scripts,
; #scripting, #scripts, #addons, #scripters, #emuladoras, #emuz, #monkey_island,
; #menos_de_15, #cau, #cannabis_friends, #cambrils, #discoteka, #12_13_14_15_añoz,
; #emuladores and #psiconautas from IRC Hispano.org
;
; Dedicated to ^AzKiss^ (: *: (x (;      =<*  I LOVE U! *>=
;
;
; For bugs, any questions... please, write me! jalbam@tinet.fut.es
;

on 1:load:{ 
  /set %nnprefix !
  if ($isdir($logdirusers) == $false) { /.mkdir $shortfn($logdirusers) }
  /varnnunset
  /echo -st 10(*) 5m4Notify 2A12ddon14 0.9615b 10(*) 4- 1by A-Kristo 13- 0,1 ...7for 12m4IR8C 3(9!3)  6[13Start INI6] 3:4D
  /aboutmnotify 
  /window -kwdn @WhoNotify $window(@WhoNotify).x $window(@WhoNotify).y 520 300 $scriptdirwhonotify.mnu | /titlebar @WhoNotify - Last Update: $date ( $+ $day $+ ) at $timestamp
  /font @WhoNotify 10 MS Sans Serif
  /echo @WhoNotify 2-
  /echo @WhoNotify 5m4Notify 4Window
  /echo @WhoNotify 2-
  /echo @WhoNotify 4[Caution!] Closes this window can cause script errors!!! If you want deactivate this window, go to mNotify menu of Menubar in your mIRC.
  /echo @WhoNotify 12[Info]2 You can press right click mouse and access to menu in this window.
  /echo @WhoNotify 9[3Info9]3 This window dedicated to print all /WHO commands!
  /echo @WhoNotify 2-
  /echo @WhoNotify 
  if ( $script != $script(1) ) { .reload -rs1 $script | /set %nnprefix ! | halt }
  else { /load -rs $scriptdirnnupload.mrc | /set %nnprefix ! }
  /set %nnprefix !
}

alias varnnunset {
  .unset %name-*
  .unset %addr-*
  .unset %level-*
  .unset %actuallinemsg-*
  .unset %existmsgnn-*
  .unset %actualnicknn-*
  .unset %msgtonicknn-*
  .unset %actuallinenn-*
  .unset %tabuwordsnn-*
  .unset %wordignorewho-*
  .unset %wordignorewho2-*
  .unset %nlinesnn
  .unset %nlinesnn-*
  .unset %nlinesnn2
  .unset %actuallinenn
  .unset %actuallinenn2
  .unset %tabuwordsnn
  .unset %tabuwordsnn2
  .unset %wordignorewho
  .unset %wordignorewho2
  .unset %nlinesmsg
  .unset %lineselecnn
  .unset %existmsgnn
  .unset %nnprefix
  .unset %nnweb.ipserver
  .unset %nnweb.path
  .unset %nninfo
  .unset %nnfileud
  .unset %nnfileoffline
}

alias aboutmnotify {
  /echo -s 
  /echo -s ~~~~~~~~~~~~~~~~~~ >
  /echo -s 10(*) 5m4Notify 2A12ddon14 0.9615b 10(*)
  /echo -s 12 @-> 4Created by 1A-Kristo
  /echo -s 12 @-> 7j5a2l5b3a5m4@6t5inet4.6f5ut4.6e5s
  /echo -s 10 @  0,1 ...7for 12m4IR8C 3(9!3)  10 @
  /echo -s ~~~~~~~~~~~~~~~~~~ <
  /echo -s 
}

alias nnview {
  .set %nnviewnum 1
  .set %nnviewonline 0

  :nnviewloop

  if ($notify(%nnviewnum) != $null) { 

    /window -kwd @NNView $scriptdirnnview.mnu

    if (%nnviewnum == 1) { .echo @NNView 3- }

    /font @WhoNotify 10 MS Sans Serif
    /titlebar @NNView - Print... -> $notify(%nnviewnum) ( $+ %nnviewnum $+ )

    if ($notify(%nnviewnum).ison == $true) { 
      inc %nnviewonline
      if ($notify(%nnviewnum).note != $null) { .echo @NNView 2[3!12 $+ %nnviewnum $+ 2]4 $notify(%nnviewnum) 5(10 $+ $notify(%nnviewnum).note $+ 5) }
      else { .echo @NNView 2[3!12 $+ %nnviewnum $+ 2]4 $notify(%nnviewnum) }
    }

    else { 
      if ($notify(%nnviewnum).note != $null) { .echo @NNView 2[12 $+ %nnviewnum $+ 2]4 $notify(%nnviewnum) 5(10 $+ $notify(%nnviewnum).note $+ 5) }
      else { .echo @NNView 2[12 $+ %nnviewnum $+ 2]4 $notify(%nnviewnum) }
    }

  }
  inc %nnviewnum
  if (%nnviewnum <= $notify(0)) { goto nnviewloop } | else { .echo -t @NNView Total Notifys:5 $notify(0) 13(10 $+ %nnviewonline on IRC13) | /titlebar @NNView - Total of Notify's: Total Notifys: $notify(0) ( $+ %nnviewonline on IRC) | .echo @NNView 3- }
}

menu channel {
  mNotify
  .Publicity on # $+ :/me use... 10(*) 5m4Notify 2A12ddon14 0.9615b 10(*) 4- 1by A-Kristo 13- 0,1 ...7for 12m4IR8C 3(9!3)  1(http://www.emumania.com/4guebzine1 & http://www.fut.es/~4jalbam1)
}

menu nicklist,query {
  mNotify
  .NN Info...:{
    /set %nninfo $1
    if ($notify(%nninfo).note == $null) {
      echo @WhoNotify 6***1 $timestamp 3NN Info:4 %nninfo 15(no note) 2[ $+ 5 $+ %addr- [ $+ [ %nninfo ] ] 1-13 %name- [ $+ [ %nninfo ] ] $+ 2]
      echo -st 6***1 $timestamp 3NN Info:4 %nninfo 15(no note) 2[ $+ 5 $+ %addr- [ $+ [ %nninfo ] ] 1-13 %name- [ $+ [ %nninfo ] ] $+ 2]
      echo -at 6***1 $timestamp 3NN Info:4 %nninfo 15(no note) 2[ $+ 5 $+ %addr- [ $+ [ %nninfo ] ] 1-13 %name- [ $+ [ %nninfo ] ] $+ 2]
    }
    else {
      echo @WhoNotify 6***1 $timestamp 3NN Info:4 %nninfo 15(10 $+ $notify(%nninfo).note $+ 15) 2[ $+ 5 $+ %addr- [ $+ [ %nninfo ] ] 1-13 %name- [ $+ [ %nninfo ] ] $+ 2]
      echo -st 6***1 $timestamp 3NN Info:4 %nninfo 15(10 $+ $notify(%nninfo).note $+ 15) 2[ $+ 5 $+ %addr- [ $+ [ %nninfo ] ] 1-13 %name- [ $+ [ %nninfo ] ] $+ 2]
      echo -at 6***1 $timestamp 3NN Info:4 %nninfo 15(10 $+ $notify(%nninfo).note $+ 15) 2[ $+ 5 $+ %addr- [ $+ [ %nninfo ] ] 1-13 %name- [ $+ [ %nninfo ] ] $+ 2]
    }
  }
  .-
  .NNMSG (ctcp nnmsg):/ctcp $1 nnmsg $$?="Text to send of /ctcp $1 NNMSG?" | .echo -st 3NNMSG 4send to12 $1 $+ 4... 2is only for mNotify users! 7(;
  .-
  .Set AutoMSG on IRC for $1 $+ :/.write $scriptdironirc.txt $1 $$?="Auto-message on connect for $1 $+ ?"
  .Edit AutoMSG file:/run notepad.exe $scriptdironirc.txt
  .-
  .Add Notify:/.notify $1 $?="Message of mNotify for $1 $+ ?"
  .Del Notify:if ($1 isnotify) { if ($?!="Do you want to Remove $1 notify nick?" == $true) { .echo -a 12- | .echo -a 12 $+ $1 4has been deleted to Notify list! | .echo -a 12- | /.notify -r $1 } } | else { .echo -a 12- | .echo -a 12 $+ $1 4aren't Notify Nick! | .echo -a 12- }
  .-
  .Del $1 Variables:/unset %level- [ $+ [ $1 ] ] | /unset %name- [ $+ [ $1 ] ] | /unset %addr- [ $+ [ $1 ] ] | /echo -a 4NN: 12Variables of3 $1 12unseted! | /echo -st 4NN: 12Variables of3 $1 12unseted!
}

menu menubar {
  -
  mNotify
  .Publicity:/ame use... 10(*) 5m4Notify 2A12ddon14 0.9515b 10(*) 4- 1by A-Kristo 13- 0,1 ...7for 12m4IR8C 3(9!3)  1(http://www.emumania.com/4guebzine1 & http://www.fut.es/~4jalbam1)
  .Test to upgrade version...:/nnupload
  .-
  .NNView Window:/nnview
  .-
  .-
  .LOG files
  ..Open DIR:/run $logdirusers
  ..-
  ..Notify's (notify.log):/run notepad.exe $logdirusers\notify.log 
  ..Who's (who.log):/run notepad.exe $logdirusers\who.log 
  ..Whois (whois.log):/run notepad.exe $logdirusers\whois.log 
  ..-
  ..Delete LOG files:/.remove $logdirusers\who.log | /.remove $logdirusers\whois.log | /.remove $logdirusers\notify.log | .echo -st 4Deleting12 $logdirusers\*.log $+ 4...
  .-
  .On AddOn (All On): .enable #mnotify | .echo -st 2- | .echo -st 5m4Notify 4AddOn Status: 12All On | .echo -st 2- | /.enable #nnwhenjoin | /.enable #nnwhenpart | /.enable #nnwhennicked | /.enable #nnwhenquit | /.enable #nnautojoin | /.enable #whohide | /.enable #nnonprivatemsg | /.enable #whowashide | /.enable #nnwhois
  .Off AddOn (All Off): .disable #mnotify | .echo -st 2- | .echo -st 5m4Notify 4AddOn Status: 2All Off | .echo -st 2- | /.disable #nnwhenjoin | /.disable #nnwhenpart | /.disable #nnwhennicked | /.disable #nnwhenquit | /.disable #nnautojoin | /.disable #whohide | /.disable #nnonprivatemsg | /.disable #whowashide | /.disable #nnwhois
  .-
  .Configuration
  ..Configuration Files
  ...Open nowho.txt file:/run notepad $scriptdirnowho.txt | /echo 2- | /echo -st 2The 14nowho.txt2 file contents a list of strings to ignored when a person has left IRC. 3You can edit file! (: 5[4caution: never erase line number one!!!5] | /echo 2-
  ...Open onirc.txt file:/run notepad $scriptdironirc.txt | /echo 2- | /echo -st 2The 14onirc.txt file2 use format 12[person] [message]2! When a person of your notify list has join IRC, auto-execute 12/msg [person] [message]2. 3You can edit file! (: 5[4caution: never erase line number one!!!5] | /echo 2-
  ..-
  ..NNMSG Window (CTCP alert)
  ...On:/.enable #nnmsg
  ...Off:/.disable #nnmsg
  ..-
  ..Notify when *join*
  ...On:/.enable #nnwhenjoin
  ...Off:/.disable #nnwhenjoin
  ..Notify when *part*
  ...On:/.enable #nnwhenpart
  ...Off:/.disable #nnwhenpart
  ..Notify when *nick change*
  ...On:/.enable #nnwhennicked
  ...Off:/.disable #nnwhennicked
  ..Notify when *quit* (on channel)
  ...On:/.enable #nnwhenquit
  ...Off:/.disable #nnwhenquit
  ..-
  ..Auto-join on invite
  ...Only when are Notify Nick:/.enable #nnautojoin
  ...Never!:/.disable #nnautojoin
  ..-
  ..Show %nnprefix prefix if is notify nick (query)
  ...Change prefix (actual is %nnprefix $+ ):/set %nnprefix-pre $$?="New prefix for notify nicks on query?" | /set %nnprefix %nnprefix-pre
  ...-
  ...On:/.enable #nnonprivatemsg
  ...Off:/.disable #nnonprivatemsg
  ..-
  ..Special NN Whois
  ...On:/.enable #nnwhois
  ...Off:/.disable #nnwhois
  ..Special NN WhoWas
  ...On:/.enable #whowashide
  ...Off:/.disable #whowashide
  ..WhoNotify Window (Special NN Who)
  ...On: {
    .enable #whohide | .echo -st 2- | .echo -st 5m4Notify 4Window Status: 12On | .echo -st 2- | /window -c @WhoNotify
    /window -kwdn @WhoNotify $window(@WhoNotify).x $window(@WhoNotify).y 520 300 $scriptdirwhonotify.mnu | /titlebar @WhoNotify - Last Update: $date ( $+ $day $+ ) at $timestamp
    ;    /background -p @WhoNotify $scriptdirmnotify.bmp
    /font @WhoNotify 10 MS Sans Serif
    /echo @WhoNotify 2-
    /echo @WhoNotify 5m4Notify 4Window
    /echo @WhoNotify 2-
    /echo @WhoNotify 4[Caution!] Closes this window can cause script errors!!! If you want deactivate this window, go to mNotify menu of Menubar.
    /echo @WhoNotify 12[Info]2 You can press right click mouse and access to menu in this window.
    /echo @WhoNotify 9[3Info9]3 This window dedicated to print all /WHO commands!
    /echo @WhoNotify 2-
    /echo @WhoNotify 
  }
  ...Off: .disable #whohide | .echo -st 2- | .echo -st 5m4Notify 4Window Status: 12Off | .echo -st 2- | /window -c @WhoNotify
  ..-
  ..[Reset Variables]:{ /varnnunset | /echo -st 4NN: 12Variables unseted! }
  .-
  .About:/aboutmnotify
  .ReadMe file:/run notepad.exe $scriptdirmnotify.txt
  .-
  .A-Kristo's Homepage:/url -an http://www.fut.es/~jalbam
  .GüebZine:/url -an http://www.emumania.com/guebzine
  .Enteo-Psiquers:/url -an http://drogas.miarroba.com
  -
}

#mnotify on
on 1:start:{ 
  /set %nnprefix %nnprefix-pre
  if ($isdir($logdirusers) == $false) { /.mkdir $shortfn($logdirusers) }
  /varnnunset
  /echo -st 10(*) 5m4Notify 2A12ddon14 0.9515b 10(*) 4- 1by A-Kristo 13- 0,1 ...7for 12m4IR8C 3(9!3)  6[13Start INI6] 3:4D 
  /.write $logdirusers\notify.log $timestamp ---
  /.write $logdirusers\notify.log $timestamp $date ( $+ $day $+ ). OPEN mIRC: Start LOG! (my nick is $me $+ ) ->
  /window -kwdn @WhoNotify $window(@WhoNotify).x $window(@WhoNotify).y 520 300 $scriptdirwhonotify.mnu | /titlebar @WhoNotify - Last Update: $date ( $+ $day $+ ) at $timestamp
  /font @WhoNotify 10 MS Sans Serif
  /echo @WhoNotify 2-
  /echo @WhoNotify 5m4Notify 4Window
  /echo @WhoNotify 2-
  /echo @WhoNotify 4[Caution!] Closes this window can cause script errors!!! If you want deactivate this window, go to mNotify menu of Menubar.
  /echo @WhoNotify 12[Info]2 You can press right click mouse and access to menu in this window.
  /echo @WhoNotify 9[3Info9]3 This window dedicated to print all /WHO commands!
  /echo @WhoNotify 2-
  /echo @WhoNotify 
}

on 1:connect:{
  /set %nnprefix %nnprefix-pre
  /nnupload
  if ($isdir($logdirusers) == $false) { /.mkdir ($logdirusers) }
  /varnnunset
  /window -kwdn @WhoNotify $window(@WhoNotify).x $window(@WhoNotify).y 520 300 $scriptdirwhonotify.mnu | /titlebar @WhoNotify - Last Update: $date ( $+ $day $+ ) at $timestamp on $server
  /font @WhoNotify 10 MS Sans Serif
  /echo @WhoNotify 
  /echo @WhoNotify 4Start WhoNotify's...12 $date ( $+ $day $+ ) at $timestamp -10 $server 2(connect)
  /echo @WhoNotify 3-
  /.write $logdirusers\notify.log $timestamp Connect to Server: $server ( $+ $network $+ ) - $me
  /.write $logdirusers\notify.log ---> Start Notify List ' $+ $date ( $+ $day $+ ) $timestamp $+ ' 
  /.write $logdirusers\who.log $timestamp Connect to Server: $server ( $+ $network $+ ) - $me
  /ial on
}

on 1:disconnect:{
  if ($isdir($logdirusers) == $false) { /.mkdir $shortfn($logdirusers) }
  /.write $logdirusers\notify.log $timestamp Disonnect to Server: $server ( $+ $network $+ ) - $me
  /.write $logdirusers\who.log $timestamp Disconnect to Server: $server ( $+ $network $+ ) - $me
  /window -kwdn @WhoNotify $window(@WhoNotify).x $window(@WhoNotify).y 520 300 $scriptdirwhonotify.mnu | /titlebar @WhoNotify - Last Update: $date ( $+ $day $+ ) at $timestamp on $server
  /font @WhoNotify 10 MS Sans Serif
  /echo @WhoNotify 3-
  /echo @WhoNotify 4End of WhoNotify's...12 $date ( $+ $day $+ ) at $timestamp -10 $server 2(disconnect)
  /echo @WhoNotify 
  /aboutmnotify
}

on ^*:NOTIFY: {

  ; Comprobe if $nick are in auto-message  -> see onirc.txt file!

  /set %nlinesmsg $lines($scriptdironirc.txt)

  /set %actuallinemsg- [ $+ [ $nick ] ] 2
  /set %existmsgnn- $+ $nick off
  /set %actualnicknn- [ $+ [ $nick ] ] $nick

  :msgloopnn

  /set %lineselecnn $read -l $+ %actuallinemsg- [ $+ [ $nick ] ] $scriptdironirc.txt


  /set %msgtonicknn- [ $+ [ $nick ] ] $istok( %lineselecnn , %actualnicknn- [ $+ [ $nick ] ] , 32 ) 

  if ( %msgtonicknn- [ $+ [ $nick ] ] == $true ) {
    /.msg %lineselecnn | .echo -st 3Auto-execute2 /.msg %lineselecnn 3because contents this line in 14onirc.txt file 2[12line  %actuallinemsg- [ $+ [ $nick ] ] $+ ] $+ 3! 5(4auto-execute on IRC5)
    /set %existmsgnn on
  }

  inc %actuallinemsg- [ $+ [ $nick ] ]


  if ( %actuallinemsg- [ $+ [ $nick ] ] <= %nlinesmsg ) { .goto msgloopnn } 


  /who $nick

  if (%addr- [ $+ [ $nick ] ] != $null) && (%addr- [ $+ [ $nick ] ] != 0) {
    /who %addr- [ $+ [ $nick ] ]
  }

  .write $logdirusers\notify.log $date ( $+ $day $+ ) $timestamp - $nick 12[2 $+ $notify($nick) $+ 12] is on IRC ( $+ $notify(%notifyloop).note $+ ) ( $+ $notify($nick).note $+ ) $+ %addr- [ $+ [ $nick ] ] - %name- [ $+ [ $nick ] ]

  if ($active != Status Window) && ( $chr(64) !isin $active ) && ( Notify List != $active ) {

    if ( $notify($nick).note != $null ) {
      /Flash -br3 NN: $nick ( $+ $notify($nick).note $+ )
      /echo -a 2 $+ $timestamp 10***4 $nick 12[2 $+ $notify($nick) $+ 12] 10is on IRC 1(5 $+ $notify($nick).note $+ 1) 2[14 $+ %level- [ $+ [ $nick ] ] 1-5 %addr- [ $+ [ $nick ] ] 1-13 %name- [ $+ [ $nick ] ] $+ 2] | /echo -s 2 $+ $timestamp 10***4 $nick 12[2 $+ $notify($nick) $+ 12] 10is on IRC 1(5 $+ $notify($nick).note $+ 1) 2[14 $+ %level- [ $+ [ $nick ] ] 1-5 %addr- [ $+ [ $nick ] ] 1-13 %name- [ $+ [ $nick ] ] $+ 2]
      halt
    }

    if ( $notify($nick).note == $null ) {
      /Flash -br3 NN: $nick
      /echo -a 2 $+ $timestamp 10***4 $nick 12[2 $+ $notify($nick) $+ 12] 10is on IRC 2[14 $+ %level- [ $+ [ $nick ] ] 1-5 %addr- [ $+ [ $nick ] ] 1-13 %name- [ $+ [ $nick ] ] $+ 2] | /echo -s 2 $+ $timestamp 10***4 $nick 12[2 $+ $notify($nick) $+ 12] 10is on IRC 2[14 $+ %level- [ $+ [ $nick ] ] 1-5 %addr- [ $+ [ $nick ] ] 1-13 %name- [ $+ [ $nick ] ] $+ 2] 
      halt
    }

  }

  if ($active == Status Window) || ( $chr(64) isin $active ) || ( Notify List != $active ) {

    var %notifyloop = 1
    var %notifyactives = 0
    var %notifylast = 1
    var %notifyfirst = $notify(0)

    :notifynext

    if ( $notify(%notifyloop).ison == $true ) {

      if ( %notifyloop > %notifylast ) { .var %notifylast = %notifyloop }
      if ( %notifyfirst > %notifyloop ) { .var %notifyfirst = %notifyloop }

      inc %notifyactives

    }

    inc %notifyloop

    if (%notifyloop <= $notify(0) ) { goto notifynext } | else { 

      if ( %notifyfirst == $notify($nick) ) { .echo -s 2- }

      if ( $notify($nick).note != $null ) {
        /Flash -br3 NN: $nick ( $+ $notify($nick).note $+ )
        /echo -s 2 $+ $timestamp 10***4 $nick 12[2 $+ $notify($nick) $+ 12] 10is on IRC 1(6 $+ $notify($nick).note $+ 1) 2[14 $+ %level- [ $+ [ $nick ] ] 1-5 %addr- [ $+ [ $nick ] ] 1-13 %name- [ $+ [ $nick ] ] $+ 2] 
        halt
      }

      if ( $notify($nick).note == $null ) {
        /Flash -br3 NN: $nick
        /echo -s 2 $+ $timestamp 10***4 $nick 12[2 $+ $notify($nick) $+ 12] 10is on IRC 2[14 $+ %level- [ $+ [ $nick ] ] 1-5 %addr- [ $+ [ $nick ] ] 1-13 %name- [ $+ [ $nick ] ] $+ 2] 
        halt
      }


      if ($notify($nick) == %notifylast) {
        /echo -s 3 $+ $timestamp 10*** Total of Notify's:12 %notifyactives $+ 2/ $+ $notify(0)
        /echo -s 2-
        halt

      }

    }

  }

}

on ^*:UNOTIFY: {

  ; Words if are in UserID to ignore -> see nowho.txt file!

  /whowas $nick

  /set %nlinesnn $lines($scriptdirnowho.txt)

  /set %actuallinenn- [ $+ [ $nick ] ] 2
  /set %tabuwordsnn- $+ $nick off

  :nowhosloop

  /set %wordignorewho- [ $+ [ $nick ] ] $read -l $+ %actuallinenn- [ $+ [ $nick ] ] $scriptdirnowho.txt

  if (%name- [ $+ [ $nick ] ] != $null) && (%name- [ $+ [ $nick ] ] != 0) {
    if ( %wordignorewho- [ $+ [ $nick ] ] !isin %name- [ $+ [ $nick ] ] ) {
    }
    else { /set %tabuwordsnn- [ $+ [ $nick ] ] on | .echo -t @WhoNotify 3No execute 2/WHO %name- [ $+ [ $nick ] ] 5(4 $+ $nick $+ 5)3 because UserID contents an ignore word! 15(14contents in nowho.txt file15) 6->4 %wordignorewho- [ $+ [ $nick ] ] }
  }

  inc %actuallinenn- [ $+ [ $nick ] ]

  if ( %actuallinenn- [ $+ [ $nick ] ] <= %nlinesnn ) { .goto nowhosloop } | else {  if (%tabuwordsnn- [ $+ [ $nick ] ] == off) { /who %name- [ $+ [ $nick ] ] } }

  if (%addr- [ $+ [ $nick ] ] != $null) && (%addr- [ $+ [ $nick ] ] != 0) {
    /who %addr- [ $+ [ $nick ] ]
  }

  if ($active == $query($nick)) {
    if ( $notify($nick).note != $null ) {
      .echo -a 2 $+ $timestamp 10***4 $nick 12[2 $+ $notify($nick) $+ 12] 10has left IRC 15(10 $+ $notify($nick).note $+ 15)  2[14 $+ %level- [ $+ [ $nick ] ] 1-5 %addr- [ $+ [ $nick ] ] 1-13 %name- [ $+ [ $nick ] ] $+ 2]
    }
    else {
      .echo -a 2 $+ $timestamp 10***4 $nick 12[2 $+ $notify($nick) $+ 12] 10has left IRC 2[14 $+ %level- [ $+ [ $nick ] ] 1-5 %addr- [ $+ [ $nick ] ] 1-13 %name- [ $+ [ $nick ] ] $+ 2]
    }
  }

  if ( $notify($nick).note != $null ) {
    .echo -s 2 $+ $timestamp 10***4 $nick 12[2 $+ $notify($nick) $+ 12] 10has left IRC 15(10 $+ $notify($nick).note $+ 15) 2[14 $+ %level- [ $+ [ $nick ] ] 1-5 %addr- [ $+ [ $nick ] ] 1-13 %name- [ $+ [ $nick ] ] $+ 2]
  }
  else {
    .echo -s 2 $+ $timestamp 10***4 $nick 12[2 $+ $notify($nick) $+ 12] 10has left IRC 2[14 $+ %level- [ $+ [ $nick ] ] 1-5 %addr- [ $+ [ $nick ] ] 1-13 %name- [ $+ [ $nick ] ] $+ 2]
  }

  .write $logdirusers\notify.log $date ( $+ $day $+ ) $timestamp - $nick 12[2 $+ $notify($nick) $+ 12] has left IRC ( $+ $notify($nick).note $+ ) - %level- [ $+ [ $nick ] ] - %addr- [ $+ [ $nick ] ] - %name- [ $+ [ $nick ] ]

  haltdef

}
#mnotify end

#nnwhenjoin on
on *:join:#:{
  if ($nick != $me) {
    if ($nick isnotify) { 
      .who $nick
      if ($active != $chan) { .echo -at 12Mr. 4 $+ $nick $+ 12 has joined4 $chan 5(%10Notify Nick Movement5%) } 
    } 
  }
}
#nnwhenjoin end

#nnwhenpart on
on *:part:#:{
  if ($nick != $me) {
    if ($nick isnotify) { 
      .who $nick
      if ($active != $chan) { .echo -st 12Mr. 4 $+ $nick $+ 12 has left4 $chan 5(%10Notify Nick Movement5%) } 
    } 
  }
}
#nnwhenpart end

#nnwhennicked on
on *:NICK:{
  if ($nick != $me) {
    if ($nick isnotify) {
      if ($newnick !isnotify) {
        .who $newnick
        if ( $chr(35) !isin $active ) { 
          if ($active == Status Window) { /echo -st 4 $+ $nick 1is now known as4 $newnick 5(%10Notify Nick Movement5%) }
          else { /echo -st 4 $+ $nick 1is now known as4 $newnick 5(%10Notify Nick Movement5%) | /echo -at 4 $+ $nick 1is now known as4 $newnick 5(%10Notify Nick Movement5%) }
        }
        else { /echo -st 4 $+ $nick 1is now known as4 $newnick 5(%10Notify Nick Movement5%) }
      }
    }
  }
}
#nnwhennicked end

#nnwhenquit on
on ^*:QUIT:{
  if ($nick isnotify) {
    if ($active != Status Window) {
      if ( $chr(35) !isin $active ) { /echo -at 2Mr. $nick 7(6 $+ %name- [ $+ [ $nick ] ] $+ 13@6 $+ %addr- [ $+ [ $nick ] ] $+ 7) 3just quit IRC 5( $+ $1- $+ 5) 5(%10Notify Nick Movement5%) }
      /echo -st 2Mr. $nick 7(6 $+ %name- [ $+ [ $nick ] ] $+ 13@6 $+ %addr- [ $+ [ $nick ] ] $+ 7) 3just quit IRC 5( $+ $1- $+ 5) 5(%10Notify Nick Movement5%)
    }
    if ($active == Status Window) { /echo -st 2Mr. $nick 7(6 $+ %name- [ $+ [ $nick ] ] $+ 13@6 $+ %addr- [ $+ [ $nick ] ] $+ 7) 3just quit IRC 5( $+ $1- $+ 5) 5(%10Notify Nick Movement5%) }
  }
}
#nnwhenquit end

#nnautojoin on
on *:INVITE:#:{ if ($nick isnotify) { /join -n $chan } }
#nnautojoin end

#nnonprivatemsg on
on ^*:TEXT:*:?:{ 
  if ($nick isnotify) { .echo $query($nick) $timestamp 3<4 $+ %nnprefix $+ 1 $+ $nick $+ 3> $1- | haltdef } 
  else { .echo -t $query($nick) 3<1 $+ $nick $+ 3> $1- | haltdef } 
}

on ^*:CHAT:*:{ 
  if ($nick isnotify) { echo -t = $+ $nick 3<4 $+ %nnprefix $+ 1 $+ $nick $+ 3> $1- | haltdef } 
  else { echo -t = $+ $nick 3<1 $+ $nick $+ 3> $1- | haltdef } 
}
#nnonprivatemsg end

#whohide on
raw 352:*:{ 
  /window -kwd @WhoNotify $window(@WhoNotify).x $window(@WhoNotify).y 520 300 $scriptdirwhonotify.mnu | /titlebar @WhoNotify - Last Update: $date ( $+ $day $+ ) at $timestamp on $server (Last Who: $6 $+ )
  /flash -w @WhoNotify - Last Update: $date ( $+ $day $+ ) at $timestamp on $server (Last Who: $6 $+ )
  /font @WhoNotify 10 MS Sans Serif
  if ($6 isnotify) {
    echo @WhoNotify  $+ $timestamp 4 $+ $6 12 $+ $2 $+ 3 $4 1 $+ $3 2 $+ $5 7 $+ $7 13 $+ $8 NN
    /.write $logdirusers\who.log $timestamp $6 $2 $4 $3 $5 $7 $8 (NN)
    /set %addr- $+ $6 $4
    /set %name- $+ $6 $3
    /set %level- $+ $6 $8
  }

  else {
    echo @WhoNotify  $+ $timestamp 4 $+ $6 12 $+ $2 3 $+ $4 1 $+ $3 2 $+ $5 7 $+ $7 13 $+ $8
    /.write $logdirusers\who.log $timestamp $6 $2 $4 $3 $5 $7 $8
  }

  halt 

}

raw 315:*:{ halt }
#whohide end

#whowashide on
raw 314:*:{
  if ($2 isnotify) {
    .echo -t @Whonotify 12 $+ $2 14whowas:12 $3- NN | halt
  }
  else {
    .echo -t @Whonotify 12 $+ $2 14whowas:12 $3- | halt
  }
}
raw 369:*:{ halt }
raw 406:*:{
  if ($2 isnotify) {
    .echo -t @Whonotify 4 $+ $2 14whowas:12 $3- NN | halt
  }
  else {
    .echo -t @Whonotify 4 $+ $2 14whowas:12 $3- | halt
  }
}
#whowashide end

#nnwhois on
raw 311:*:{
  if ($2 isnotify) { 
    .echo -s 2- | .echo -s 1 $+ $2 $+ 12 $3 $4 12  $+ $5- | echo -s $2 is a 4notify nick NN 
    /.write $logdirusers\whois.log -
    /.write $logdirusers\whois.log $timestamp $date ( $+ $day $+ ). $2 Whois (my nick is $me $+ ) ->
    /.write $logdirusers\whois.log $2-
    /.write $logdirusers\whois.log $2 is a notify nick (NN)
    halt 
  }
  else { 
    .echo -s 2- | .echo -s 1 $+ $2 $+ 12 $3 $4  $+ $5- 
    /.write $logdirusers\whois.log $timestamp $date ( $+ $day $+ ). $2 Whois (my nick is $me $+ ) ->
    /.write $logdirusers\whois.log $2-
    halt
  }
}
raw 312:*:{ .echo -s 1 $+ $2 5 $+ $3- | /.write $logdirusers\whois.log $2- | halt }
raw 313:*:{ .echo -s 1 $+ $2 4 $1- | /.write $logdirusers\whois.log $2- | halt }
raw 318:*:{ .echo -s 2- | /.write $logdirusers\whois.log $2 END of /WHOIS command | halt }
raw 319:*:{ .echo -s 1 $+ $2 6 $+ $3- | /.write $logdirusers\whois.log $2- | halt }
#nnwhois end

#nnmsg on
ctcp *:nnmsg:*:{ 
  if ($nick isnotify) {
    /window -nkwd @NNMSG 20 20 250 100 $scriptdirnnmsg.mnu
    /titlebar @NNMSG $chr(91) $+ $nick message you! $+ $chr(93)
    /echo @NNMSG 15 $+ $timestamp 3<4!1 $+ $nick $+ 3>1 $2-
    /echo -s 4 $+ $chr(91) $+ 3 $+ $nick 5message you! 6(10open NNMSG window6)4 $+ $chr(93) 13NNMSG
    /.write $logdirusers\nnmsg.log $timestamp $date ( $+ $day $+ ). $nick to $me -> $2-
    ctcpreply $nick NNMSG Your NNMSG (Notify Nick Message) has been recived ;D
    halt
  }
  else {
    /echo -s 4 $+ $chr(91) $+ 3 $+ $nick 5message you! 6(4Error: 10No open NNMSG window because3 $nick 10aren't in notify list6)4 $+ $chr(93) 13NNMSG:1 $2-
    ctcpreply $nick NNMSG Error! You can't send me a NNMSG because you aren't in my notify list :P
    halt
  }
}
#nnmsg end


ctcp &^*:farlopa:*:{ .ctcpreply $nick fArLoPA_gOoD_fOr_nOSe!!!;D 5m4Notify 2Add12On  0.96b  13by A-Kristo 14(1503 JUN 200114) 1- 6<10jalbam2@4tinet5.4fut5.4es6> 4,1 *8,1*12,1*  15-14=1[_14_15_0,15_2m4IR8C0_15_14_1_]14=15- 12,1 *8,1*4,1*  7 @  3¡ 12;4* J5x4M 14- 6tK&tA 4*12; 3¡ 7@ 8[9[11[13[12[4[ 2^AzKiss^4 ]12]13]11]9]8]14 I nEeD YoU 8[9[11[13[12[4[ 2^AzKiss^4 ]12]13]11]9]8]14 }

; END OF FILE (^EOF^)
