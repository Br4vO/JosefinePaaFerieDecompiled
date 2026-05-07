on exitFrame
  global gLanguage
  set the volume of sound 1 to 255
  set the volume of sound 2 to 255
  haand = the number of member "Hand1"
  maske = the number of member "Mask1"
  cursor([haand, maske])
  go("Intro" & gLanguage)
  lyd = "INTRO" & item random(3) of "1,2,3"
  preloadMember(lyd)
  puppetSound(2, lyd)
end
