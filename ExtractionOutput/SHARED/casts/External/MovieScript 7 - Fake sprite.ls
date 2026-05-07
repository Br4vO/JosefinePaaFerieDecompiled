on SetFakeSprite spriteNr
  ink = the ink of sprite spriteNr
  set the castNum of sprite 48 to the castNum of sprite spriteNr
  set the castNum of sprite spriteNr to the number of member "FakeDot"
  set the ink of sprite 48 to ink
  set the stretch of sprite spriteNr to 0
  set the stretch of sprite 48 to 0
  set the locH of sprite 48 to the locH of sprite spriteNr
  set the locV of sprite 48 to the locV of sprite spriteNr
  sprite(48).visible = 1
  sprite(spriteNr).visible = 0
end

on ResetFakeSprite spriteNr
  ink = the ink of sprite 48
  set the castNum of sprite spriteNr to the castNum of sprite 48
  set the castNum of sprite 48 to the number of member "FakeDot"
  set the ink of sprite spriteNr to ink
  set the stretch of sprite spriteNr to 0
  set the stretch of sprite 48 to 0
  set the locH of sprite spriteNr to the locH of sprite 48
  set the locV of sprite spriteNr to the locV of sprite 48
  sprite(spriteNr).visible = 1
  sprite(48).visible = 0
end
