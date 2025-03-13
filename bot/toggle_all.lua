singlehotkey("Escape", "Toggle", function()
    CaveBot.setOn(not CaveBot.isOn())
    TargetBot.setOn(not TargetBot.isOn())

    warn("CaveBot " .. (CaveBot.isOn() and 'On' or 'Off'))
    warn("TargetBot " .. (TargetBot.isOn() and 'On' or 'Off'))
end)
