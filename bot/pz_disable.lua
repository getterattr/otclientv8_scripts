macro(5000, "PZ Disable", function()
    if isInPz() then
        return
    end
    if not player:isMounted() then
        player:mount()
    end
end)
