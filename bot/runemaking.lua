----------------------
-- [[ Runemaking ]] --
----------------------
UI.Label("Runemaking", customTab)

local spells = {{
    name = "Sudden Death",
    words = "adori gran mort",
    mana = 985,
    soul = 5
}, {
    name = "Thunderstorm",
    words = "adori mas vis",
    mana = 430,
    soul = 3
}, {
    name = "Great Fireball",
    words = "adori mas flam",
    mana = 530,
    soul = 3
}, {
    name = "Avalanche",
    words = "adori mas frigo",
    mana = 530,
    soul = 3
}}

for i, spell in ipairs(spells) do
    macro(200, spell.name, function()
        if (soul() > spell.soul and mana() > spell.mana and manapercent() > 95) then
            say(spell.words)
            delay(2000)
        end
    end, customTab)
end
