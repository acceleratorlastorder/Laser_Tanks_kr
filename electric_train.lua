local eloco = table.deepcopy(data.raw["locomotive"]["locomotive"])
eloco.name = "electric-vehicles-electric-locomotive"
eloco.max_health = 1000
eloco.minable = {mining_time = 1, result = "electric-vehicles-electric-locomotive"}
eloco.weight = 2000
eloco.max_speed = 1.5
--eloco.friction_force = 0.25     
--eloco.air_resistance = 0.00375  
eloco.max_power = "1000kW"
eloco.reversing_power_modifier = 1
eloco.braking_force = 15
eloco.equipment_grid = "electric-vehicles-electric-locomotive"
--eloco.equipment_categories = {"armor","electric-vehicles-equipment"}
eloco.burner = {
    fuel_category = nil,
    effectivity = 1,
    fuel_inventory_size = 0,
    burnt_inventory_size = 0,
    smoke = nil
	}
if not mods["electric-vehicles-lib-reborn"] and not mods["ElectricVehicles3"] then
	eloco.burner.effectivity = 0.44
	eloco.max_power = "1100kW"
end
eloco.color = {r = 0.11, g = 0.96, b = 0.96, a = 0.5}
eloco.stop_trigger = nil
eloco.working_sound = {
    sound = {
        filename = "__Laser_Tanks_kr__/vehicle-motor.ogg",
        volume = 0.2,
    },
    match_speed_to_activity = true,
}

--local eloco_grid = {
--    type = "equipment-grid",
--    name = "electric-vehicles-electric-locomotive",
--    width = 10,
--    height = 10,
--    equipment_categories = {"armor", "electric-vehicles-equipment"},
--  }
--if mods["vtk-armor-plating"] then
--	table.insert(data.raw["equipment-grid"]["electric-vehicles-electric-locomotive"].equipment_categories,"vtk-armor-plating")
--end

local eloco_recipe = {
    type = "recipe",
    name = "electric-vehicles-electric-locomotive",
    enabled = false,
    ingredients =
    {
      {"electric-engine-unit", 20},
      {"advanced-circuit", 10},
      {"steel-plate", 30},
      {"effectivity-module", 1},
      {"speed-module", 1},
    },
    result = "electric-vehicles-electric-locomotive",
  }

local eloco_item = {
    type = "item-with-entity-data",
    name = "electric-vehicles-electric-locomotive",
    icon = "__Laser_Tanks_kr__/graphics/icons/electric-locomotive-2.png",
    icon_size = 32,
    flags = flags_quickbar,
    subgroup = "transport",
    order = "za[train-system]-f[electric-locomotive]",
    place_result = "electric-vehicles-electric-locomotive",
    stack_size = 1,
  }

data:extend({eloco, eloco_item, eloco_recipe})--, eloco_grid})
table.insert(data.raw.technology["laser-rifle-2"].effects,{
        type = "unlock-recipe",
        recipe = "electric-vehicles-electric-locomotive",
      })

