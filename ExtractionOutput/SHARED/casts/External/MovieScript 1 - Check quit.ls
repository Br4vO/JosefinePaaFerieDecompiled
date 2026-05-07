on keyDown
  tegn = the key
  tastekode = the keyCode
  if char 1 to 4 of the movieName <> "FLAG" then
    if (the commandDown and ((tegn = "q") or (tegn = "Q"))) or (the controlDown and (tastekode = 12)) or (tastekode = 53) then
      if char 1 to 4 of the movieName = "QUIT" then
        DisposePrinter()
        clearGlobals()
        quit()
      else
        if char 1 to 4 of the movieName = "FLAG" then
          quit()
        else
          if char 1 to 4 of the movieName = "FOOD" then
            go("GoQuit")
          else
            puppetSound(1, 0)
            puppetSound(2, 0)
            go("InitQuit", "QUIT")
          end if
        end if
      end if
    end if
  end if
end
