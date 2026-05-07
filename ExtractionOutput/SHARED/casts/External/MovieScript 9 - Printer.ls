on InitPrinter
  global gSkriver
  if objectp(gSkriver) then
    gSkriver = 0
  end if
  gSkriver = new(xtra("PrintOMatic"))
  if objectp(gSkriver) then
    setProgressMsg(gSkriver, "Printing from Josefine...")
    setDocumentName(gSkriver, "JOSEFINE")
    reset(gSkriver)
  end if
end

on DisposePrinter
  global gSkriver
  if objectp(gSkriver) then
    gSkriver = 0
  end if
end

on CopyrightText
  global gSkriver, gLanguage
  heigth = getPageHeight(gSkriver)
  setTextSize(gSkriver, 8)
  setTextJust(gSkriver, "centered")
  setGray(gSkriver, 100)
  newFrame(gSkriver, rect(0, heigth - 40, 100, heigth), 0)
  append(gSkriver, cast("TheCopyrightText" & gLanguage).text)
end
