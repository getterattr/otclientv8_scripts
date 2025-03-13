----------------------
-- [[ Autofollow ]] --
----------------------
followName = "autofollow"
if not storage[followName] then
    storage[followName] = {
        player = 'name'
    }
end
local toFollowPos = {}

UI.Label("Auto Follow", customTab)

followTE = UI.TextEdit(storage[followName].player or "name", function(widget, newText)
    storage[followName].player = newText
end, customTab)

local followChange = macro(200, "Follow Change", function()
end, customTab)

local followMacro = macro(20, "Follow", function()
    local target = getCreatureByName(storage[followName].player)
    if target then
        local tpos = target:getPosition()
        toFollowPos[tpos.z] = tpos
    end
    if player:isWalking() then
        return
    end
    local p = toFollowPos[posz()]
    if not p then
        return
    end
    if autoWalk(p, 20, {
        ignoreNonPathable = true,
        precision = 1
    }) then
        delay(100)
    end
end, customTab)

onPlayerPositionChange(function(newPos, oldPos)
    if followChange:isOff() then
        return
    end
    if (g_game.isFollowing()) then
        tfollow = g_game.getFollowingCreature()

        if tfollow then
            if tfollow:getName() ~= storage[followName].player then
                followTE:setText(tfollow:getName())
                storage[followName].player = tfollow:getName()
            end
        end
    end
end)

onCreaturePositionChange(function(creature, newPos, oldPos)
    if creature:getName() == storage[followName].player and newPos then
        toFollowPos[newPos.z] = newPos
    end
end)
UI.Separator(customTab)
