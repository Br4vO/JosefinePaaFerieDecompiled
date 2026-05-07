on Talking castName
  if not soundBusy(1) and (label("Talking") <> 0) then
    preloadCast(castName)
    puppetSound(castName)
    play frame "Talking"
  end if
end
