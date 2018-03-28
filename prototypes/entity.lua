local rocks     = require("rocks")
local ironrock = require("graphics.decorative.iron-rock.iron-rock")

local cave_rock = rocks.get_rock()
local iron_rock = rocks.get_rock({
    name     = "iron-rock",
    minable  = { mining_particle = "iron-ore-particle", 
                mining_time = 8, result = "iron-ore", count = 20 },
    loot     = 
    { {item  = "iron-ore", probability = 1, count_min = 5, count_max = 10} },
    pictures = ironrock.pictures
})

data:extend{cave_rock, iron_rock}