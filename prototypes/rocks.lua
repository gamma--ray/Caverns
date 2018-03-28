local rocks = {}

rocks.default_rock = {
    type = "simple-entity",
    name = "cave-rock",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/stone-rock.png",
    subgroup = "grass",
    order = "b[decorative]-k[stone-rock]-a[big]",
    collision_box = {{-1.1, -1.1}, {1.1, 1.1}},
    selection_box = {{-1.3, -1.3}, {1.3, 1.3}},
    vehicle_impact_sound =  { filename = "__base__/sound/car-stone-impact.ogg", volume = 1.0 },
    minable =
    { mining_particle = "stone-particle", 
      mining_time = 8, result = "stone", count = 20 },
    loot =
    { {item = "stone", probability = 1, count_min = 5, count_max = 10} },
    count_as_rock_for_filtered_deconstruction = true,
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    render_layer = "object",
    max_health = 200,
    resistances =
    { {
        type = "fire",
        percent = 100
    } },
    autoplace =
    {
      order = "a[doodad]-a[rock]",
      peaks = {
        { influence = 0.0002 },
        {
          influence = 0.002;
          min_influence = 0,
          elevation_optimal = 30000,
          elevation_range = 23000,
          elevation_max_range = 30000,
        }
      }
    },
    pictures =
    {
      { filename = "__base__/graphics/decorative/stone-rock/stone-rock-01.png",
        width = 76,
        height = 60,
        shift = {0.1, 0} 
      },
      { filename = "__base__/graphics/decorative/stone-rock/stone-rock-02.png",
        width = 83,
        height = 86,
        shift = {0.2, 0}
      },
      { filename = "__base__/graphics/decorative/stone-rock/stone-rock-03.png",
        width = 126,
        height = 98,
        shift = {0.7, 0}
      },
      { filename = "__base__/graphics/decorative/stone-rock/stone-rock-04.png",
        width = 92,
        height = 108,
        shift = {0.1, 0}
      },
      { filename = "__base__/graphics/decorative/stone-rock/stone-rock-05.png",
        width = 140,
        height = 99,
        shift = {0.5, 0}
      }
    }
}

function rocks.get_rock(dict)
    if not dict then
        dict = {}
    end
    rock = table.deepcopy(rocks.default_rock)
    for k,v in pairs(dict) do
        rock[k] = v
    end
    return rock
end

return rocks