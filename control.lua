local caves = require ".caves"
local util  = require ".util"

script.on_event({defines.events.on_player_dropped_item}, function(e)
    caves.init(game)
    player = game.players[e.player_index]
    caves.move_down(player,game)
end
)

script.on_event({defines.events.on_chunk_generated}, function(e)
    surface = e.surface
    
    if util.is_cave(surface.name) then
        lt_x, lt_y, ub_x, ub_y = util.extract_x_y(e.area)
        l = {}
        
        surface.destroy_decoratives(e.area)
        util.remove_simple_and_trees(surface, e.area)
        
        for x = lt_x, ub_x do
            for y = lt_y, ub_y do
                table.insert(l,{name="stone-path",position={x,y}})
            end
        end
        
        surface.set_tiles(l)
    end
end
)

