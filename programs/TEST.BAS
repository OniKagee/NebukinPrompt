start:
  print "NebukinPrompt - Nebukin Petr Operating System - NebukinBasic DEMO #1"
  print "Press 0 or 1. To exit - press X"
  waitkey x

ifnull:
  if x = 0 then print "Null signal"
  goto start

ifone:
  if x = 1 then sound 500 5
  goto start

ifexit:
  if x = 'x' then end
end