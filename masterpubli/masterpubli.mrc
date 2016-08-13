menu channel {
  -
  MasterPubli AddOn
  .Frase publicitaria...:/.set %masterpubli-frase $$?="Frase?"
  .-
  .Publicidad en canales...:/set %masterpubli-channels $$?="Que canales? (separados por comas si son varios y con '#' delante)"
  .Publicidad en todos los canales:/set %masterpubli-channels *
  .-
  .Anunciar AddOn:/amsg 5M4aster2P12ubli 3AddOn 140.0155 10by 1A-Kristo 6[12http://www.fut.es/~jalbam6]
  -
}

on ^*:JOIN:%masterpubli-channels:{

  if ($nick !isop $chan) && ($nick != $me) {
    /.timermasterpubli-to- [ $+ [ $nick ] ] 1 30 /.msg $nick %masterpubli-frase
  }

}
