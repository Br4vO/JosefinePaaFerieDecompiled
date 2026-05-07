on WaitForNTicks nrOfTicks
  endTicks = the ticks + nrOfTicks
  repeat while the ticks < endTicks
    nothing()
  end repeat
end

on WaitSoundBusy channel
  repeat while soundBusy(channel)
    nothing()
  end repeat
end
