on mouseDown
  global gLanguage
  i = 3
  repeat while i <= 7
    set the cursor of sprite i to 4
    i = 1 + i
  end repeat
  cursor(4)
  gLanguage = "F"
  go("StartJosefine")
end
