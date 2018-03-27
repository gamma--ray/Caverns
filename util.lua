local util = {}

local separator = "_"

util.mod_name = "caves"

util.cave_surface_prefix = util.mod_name .. separator .. "cave"
local cave_prefix_len = string.len(util.cave_surface_prefix)

function util.is_cave(str)
    return (string.sub(str,1,cave_prefix_len) == util.cave_surface_prefix)
end

function util.get_cave_nr(str)
    return tonumber(string.sub(surface.name,cave_prefix_len+1))
end

function util.remove_simple_and_trees(surface,area)
	for _, entity in pairs(surface.find_entities_filtered{area = area, type="tree"}) do
		if entity.valid then
			entity.destroy()
		end
	end
	for _, entity in pairs(surface.find_entities_filtered{area = area, type="simple-entity"}) do
		if entity.valid then
			entity.destroy()
		end
	end
end

function util.extract_x_y(area)
    left_top     = area.left_top
    right_bottom = area.right_bottom
    lt_x = left_top.x
    lt_y = left_top.y
    ub_x = right_bottom.x
    ub_y = right_bottom.y
    return lt_x, lt_y, ub_x, ub_y
end

return util