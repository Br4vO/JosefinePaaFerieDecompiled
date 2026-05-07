on SoundFadeOut kanal, tid
  kanal1 = the volume of sound 1
  kanal2 = the volume of sound 2
  fKanal1 = float(kanal1)
  fKanal2 = float(kanal2)
  deltaVolum1 = float(fKanal1 / float(tid))
  deltaVolum2 = float(fKanal2 / float(tid))
  startTid = the ticks
  sluttTid = startTid + tid
  repeat while the ticks < sluttTid
    akkuratNaa = the ticks
    neste = akkuratNaa + 5
    if kanal = 1 then
      fKanal1 = float(kanal1) - (float(akkuratNaa - startTid) * deltaVolum1)
      set the volume of sound 1 to fKanal1
    else
      if kanal = 2 then
        fKanal2 = float(kanal2) - (float(akkuratNaa - startTid) * deltaVolum2)
        set the volume of sound 2 to fKanal2
      else
        if kanal = 3 then
          fKanal1 = float(kanal1) - (float(akkuratNaa - startTid) * deltaVolum1)
          fKanal2 = float(kanal2) - (float(akkuratNaa - startTid) * deltaVolum2)
          set the volume of sound 1 to fKanal1
          set the volume of sound 2 to fKanal2
        else
          alert("Sound channel parameter error.")
          exit repeat
        end if
      end if
    end if
    repeat while the ticks < neste
      nothing()
    end repeat
  end repeat
  if kanal = 1 then
    sound stop 1
  else
    if kanal = 2 then
      sound stop 2
    else
      if kanal = 3 then
        sound stop 1
        sound stop 2
      end if
    end if
  end if
  set the volume of sound 1 to kanal1
  set the volume of sound 2 to kanal2
end
