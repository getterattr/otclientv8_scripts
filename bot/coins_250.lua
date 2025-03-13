macro(500, "replace coins", function()
    for i, container in pairs(getContainers()) do
        for j, item in ipairs(container:getItems()) do
            if item:getCount() == 250 and item:getId() == 3031 then
                g_game.use(item)
                return
            end
        end
    end
end)
