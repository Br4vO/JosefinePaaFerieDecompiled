on prepareMovie
  global gLanguage
  counter = 1
  repeat while counter <= the number of castMembers of castLib 1
    if (member(counter).type = #sound) and (char 4 of the name of member counter = gLanguage) then
      preloadMember(counter)
    end if
    counter = 1 + counter
  end repeat
  counter = 1
  repeat while counter <= the number of castMembers of castLib 1
    if (member(counter).type = #sound) and (char 5 of the name of member counter = gLanguage) then
      preloadMember(counter)
    end if
    counter = 1 + counter
  end repeat
  updateStage()
end
