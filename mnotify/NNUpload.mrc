;
; mNotify 0.96b AddOn UpLoad! from A-Kristo Homepage's (http://www.fut.es/~jalbam/)
; Upgrade to mNotify 1.00b (http://www.fut.es/~jalbam/mnotify097b.zip)
; 
; A-Kristo -[LOVES]- ^AzKiss^
;


on 1:load:{ nnupload }

alias nnupload {

  /set %nnfileud mnotify097b.zip
  /set %nnfileoffline nnupdate097b.zip

  /.remove $scriptdir $+ %nnfileoffline

  /set %nnweb.ipserver www.fut.es
  /set %nnweb.path /~jalbam/ $+ %nnfileud

  /sockopen nnupload %nnweb.ipserver 80

}


on *:sockopen:nnupload:{
  if ($sockerr) { .echo -s 4Error! Can't Connect to5 %nnweb.ipserver | return }
  if ($sokerr != 0) {
    .echo -s 4- 
    .echo -s 4m5Notify 2Add12On 3upgrade
    .echo -s 3Testing for upgrade to new version 13(6 $+ %nnfileud $+ 13)3...
    if ($portfree(80) == $false) { .echo -s 10Port1 80 10ocupped! }
    else { .echo -s 10Port1 80 10free! }
    echo -s 6Open sock13 $sockname $+ . 7Please wait...
    echo -s 4Established Connection:12 $sock(nnupload).IP 2with port12 $sock(nnupload).port
    sockwrite -tn $sockname GET %nnweb.path
    ;    sockwrite -t $sockname GET %nnweb.path
    ;    sockwrite -n $sockname GET %nnweb.path
    ;    sockwrite $sockname GET %nnweb.path

  }
}

on *:sockread:nnupload:{
  sockread %nnweb.read 
  //.write $scriptdir $+ %nnfileoffline %nnweb.read
  unset %nnweb.read
}

on *:sockclose:nnupload:{ 
  .echo -s 5Socket6 $sockname 5close!
  .echo -s 14File1 %nnfileud 14saved as1 %nnfileoffline 14(in1 $scriptdir $+ 14) from1 http:// $+ %nnweb.ipserver
  .echo -s 4-
}
