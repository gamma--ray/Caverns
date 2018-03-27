local util = require("util")

local caves = {}

local layers  = {}
local init    = false
local n_layer = 0

local cave_gen_settings = nil

function caves.add_layer(game)
    surface = game.create_surface(util.cave_surface_prefix .. n_layer, cave_gen_settings)
    surface.daytime = 0.5
    surface.freeze_daytime = true
    n_layer = n_layer + 1
end

function caves.init(game)
    if not init then
        cave_gen_settings = game.surfaces["nauvis"].map_gen_settings
        for _,v in pairs(cave_gen_settings.autoplace_controls) do
            v.frequency = "none"
        end
        
        init = true
    end
end

function caves.move_up(player, game)
    surface = player.surface
    
    if util.is_cave(surface.name) then
        cave_lvl = util.get_cave_nr(surface.name)
        player.teleport(player.position,"cave"..(cave_lvl-1))
    end
end

function caves.move_down(player, game)
    surface = player.surface
    if surface.name == "nauvis" then
        cave_lvl=-1
    elseif util.is_cave(surface.name) then
        cave_lvl = util.get_cave_nr(surface.name)
    else return end
    
    if cave_lvl+1 == n_layer then
        caves.add_layer(game)
    end
    
    player.teleport(player.position,util.cave_surface_prefix .. (cave_lvl+1))
end

return caves