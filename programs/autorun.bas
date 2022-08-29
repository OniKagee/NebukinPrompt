loadpass:
  load "password.sav" 40000
  if r = 1 then end
  x = 40000
  rem get the password to the string
  y = & $1
  for v = 1 to 128
    peek z x
    poke z y
    x = x + 1
    y = y + 1
  next v
  rem decode the password
  y = & $1
  for v = 1 to 128
    peek z x
    peek w y
    w = w - z
    poke w y
    x = x + 1
    y = y + 1
  next v

guess:
  print "PASSWORD: " ;
  input $2
  if $1 = $2 then print "  _   _      _           _    _       _____                           _   "
  if $1 = $2 then print " | \ | |    | |         | |  (_)     |  __ \                         | |  "
  if $1 = $2 then print " |  \| | ___| |__  _   _| | ___ _ __ | |__) | __ ___  _ __ ___  _ __ | |_ "
  if $1 = $2 then print " | . ` |/ _ \ '_ \| | | | |/ / | '_ \|  ___/ '__/ _ \| '_ ` _ \| '_ \| __|"
  if $1 = $2 then print " | |\  |  __/ |_) | |_| |   <| | | | | |   | | | (_) | | | | | | |_) | |_ "
  if $1 = $2 then print " |_| \_|\___|_.__/ \__,_|_|\_\_|_| |_|_|   |_|  \___/|_| |_| |_| .__/ \__|"
  if $1 = $2 then print "                                                               | |"
  if $1 = $2 then print "                                                               |_|"
  if $1 = $2 then print "                       Pozhalyista, vvedite parol*"
  if $1 = $2 then sound 1000 1
  if $1 = $2 then sound 1000 1
  if $1 = $2 then sound 1000 1
  if $1 = $2 then goto wipe
  pause 20
  print "Password incorrect. Try again."
  sound 20000 1
  g = g + 1
  if g > 3 then cursor off
  if g > 3 then pause 600
  if g > 3 then cursor on
  if g > 3 then g = 0
goto guess

wipe:
  for x = 40000 to 40255
    poke 0 x
  next x
end
