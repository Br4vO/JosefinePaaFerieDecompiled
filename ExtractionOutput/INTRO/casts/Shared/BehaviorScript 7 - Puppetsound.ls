on enterFrame
  global gLanguage
  if soundBusy(2) then
    SoundFadeOut(2, 60)
  end if
  lydNr = item random(4) of "01,02,03,04"
  lydnavn = "IN_" & gLanguage & lydNr
  preloadMember(lydnavn)
  puppetSound(lydnavn)
end
