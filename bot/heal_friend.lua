--------------------------
-- [[ Auto Heal Friend ]] --
--------------------------
UI.Label("Heal Friend", customTab)

local friendName = "Friend"
macro(100, "Sio Friend", function()
    local friend = getPlayerByName(friendName)
    if friend and friend:getHealthPercent() < 40 then
        say("exura sio \"" .. friendName)
        delay(1000)
    end
end, customTab)

macro(100, "Enable UH friend", function()
    local healFriend = getCreatureByName(storage.uhFriend)
    if healFriend then
        local healPlayer = healFriend:getName()
        if (healPlayer == storage.uhFriend) then
            -- Default to 20% if uhFriendPercent is not provided
            local healPercent = tonumber(storage.uhFriendPercent) or 20
            if (healFriend:getHealthPercent() < healPercent) then
                useWith(3160, healFriend)
            end
        end
    end
end, customTab)

addLabel("uhname", "Player name:", customTab)
addTextEdit("uhfriend", storage.uhFriend or "", function(widget, text)
    storage.uhFriend = text
end, customTab)

addLabel("uhpercent", "Heal Below %:", customTab)
addTextEdit("uhfriendpercent", storage.uhFriendPercent or "20", function(widget, text)
    storage.uhFriendPercent = text
end, customTab)
UI.Separator(customTab)
