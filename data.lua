data:extend(
{
  {
    type = "equipment-grid",
    name = "laser-car-equipment-grid",
    width = 8,
    height = 8,
    equipment_categories = {"armor"}
  },
  {
    type = "equipment-grid",
    name = "laser-tank-equipment-grid",
    width = 10,
    height = 9,
    equipment_categories = {"armor"}
  },
 })

 log(mods)

if mods["Krastorio2"] then
	table.insert(data.raw["equipment-grid"]["laser-car-equipment-grid"].equipment_categories,"big-battery-mk2-equipment")
	log("Krastorio2 has been added to the laser-car-equipment-grid")
end

--if mods["vtk-armor-plating"] then
--	table.insert(data.raw["equipment-grid"]["laser-car-equipment-grid"].equipment_categories,"vtk-armor-plating")
--	table.insert(data.raw["equipment-grid"]["laser-tank-equipment-grid"].equipment_categories,"vtk-armor-plating")
--end
	

--guns = { "vehicle-machine-gun" }
-- guns = { "tank-cannon", "tank-machine-gun", "tank-flamethrower" }

local car = table.deepcopy(data.raw.car.car)
local car_item = table.deepcopy(data.raw["item-with-entity-data"].car)
local car_recipe = table.deepcopy(data.raw.recipe.car)

car.name = "lasercar"
car.icon = "__laser_tanks_updated__/graphics/car.png"
car.icon_size = 32
car.order = "a[basic-clips]-a[pistol]-3"
car.minable = {mining_time = 1, result = "lasercar"}
car.guns = { "vehicle-laser-gun" }
car.equipment_grid = "laser-car-equipment-grid"
if settings.startup["lasertanks-electric-engine"].value then
	table.insert(data.raw["equipment-grid"]["laser-car-equipment-grid"].equipment_categories,"electric-vehicles-equipment")
	car.burner =
	{
		effectivity = 1,
		fuel_inventory_size = 0,
	}
	car.consumption = "250kW"
end
--rifle.attack_parameters.damage_modifier = 0.05--2 --submachinegun = 12.5
--car.attack_parameters.ammo_category = "laser-turret"
--car.attack_parameters.cooldown =30
--car.attack_parameters.range = 19
--car.attack_parameters.shell_particle = nil
--car.attack_parameters.sound =     {
--      {
--        filename = "__laser_tanks_updated__/test2.ogg",
--        volume = 0.3
--      },
--
--    }
-------------
car_recipe.name = "lasercar"
car_recipe.energy_required = 60
car_recipe.result = "lasercar"
table.insert(car_recipe.ingredients,{"plastic-bar", 5})

	table.insert(car_recipe.ingredients,{"battery", 30})

-------------

car_item.name = "lasercar"
car_item.icon = "__laser_tanks_updated__/graphics/car.png"
car_item.icon_size = 32
car_item.place_result = "lasercar"


	  
--------------------------------------------------------------------
      
local tank = table.deepcopy(data.raw.car.tank)
local tank_item = table.deepcopy(data.raw["item-with-entity-data"].tank)
local tank_recipe = table.deepcopy(data.raw.recipe.tank)

tank.name = "lasertank"
tank.icon = "__laser_tanks_updated__/graphics/tank.png"
tank.icon_size = 32
tank.order = "a[basic-clips]-a[pistol]-3"
tank.minable = {mining_time = 1, result = "lasertank"}
tank.guns = { "tank-laser-cannon", "vehicle-laser-gun", "tank-flamethrower" }
tank.equipment_grid = "laser-tank-equipment-grid"
if settings.startup["lasertanks-electric-engine"].value then
	table.insert(data.raw["equipment-grid"]["laser-tank-equipment-grid"].equipment_categories,"electric-vehicles-equipment")
	tank.burner =
	{
		effectivity = 1,
		fuel_inventory_size = 0,
	}
end
if data.raw.car["vehicle-laser-tank"] and settings.startup["lasertanks-aai-tank"].value then
	tank.animation = table.deepcopy(data.raw.car["vehicle-laser-tank"].animation)
	tank.turret_animation = table.deepcopy(data.raw.car["vehicle-laser-tank"].turret_animation)
end
	--rifle.attack_parameters.damage_modifier = 0.05--2 --submachinegun = 12.5
--tank.attack_parameters.ammo_category = "laser-turret"
--tank.attack_parameters.cooldown =30
--tank.attack_parameters.range = 19
--tank.attack_parameters.shell_particle = nil
--tank.attack_parameters.sound =     {
--      {
--        filename = "__laser_tanks_updated__/test2.ogg",
--        volume = 0.3
--      },
--
--    }
-------------
tank_recipe.name = "lasertank"
tank_recipe.energy_required = 60
tank_recipe.normal.result = "lasertank"
tank_recipe.expensive.result = "lasertank"
if not mods["IndustrialRevolution"] then
	table.insert(tank_recipe.normal.ingredients,{"battery", 30})
	table.insert(tank_recipe.expensive.ingredients,{"battery", 30})
	table.insert(tank_recipe.normal.ingredients,{"plastic-bar", 5})
	table.insert(tank_recipe.expensive.ingredients,{"plastic-bar", 5})
end
-------------
tank_item.name = "lasertank"
tank_item.icon = "__laser_tanks_updated__/graphics/tank.png"
tank_item.icon_size = 32
tank_item.place_result = "lasertank"

local vehicle_laser_gun = table.deepcopy(data.raw.gun["tank-machine-gun"])
vehicle_laser_gun.name = "vehicle-laser-gun"
vehicle_laser_gun.icon = "__laser_tanks_updated__/graphics/rapid_laser.png"
vehicle_laser_gun.icon_size = 144
--rifle.attack_parameters.damage_modifier = 0.05--2 --submachinegun = 12.5
vehicle_laser_gun.attack_parameters.ammo_category = "laser"
vehicle_laser_gun.attack_parameters.cooldown =30
vehicle_laser_gun.attack_parameters.range = 20
vehicle_laser_gun.attack_parameters.shell_particle = nil
vehicle_laser_gun.attack_parameters.sound =     
	{
		{
			filename = "__laser_tanks_updated__/test2.ogg",
			volume = 0.3
		},
	
	}
local tank_laser_cannon = table.deepcopy(data.raw.gun["tank-cannon"])
tank_laser_cannon.name = "tank-laser-cannon"
tank_laser_cannon.icon = "__laser_tanks_updated__/graphics/laser_cannon.png"
tank_laser_cannon.icon_size = 144
--rifle.attack_parameters.damage_modifier = 0.05--2 --submachinegun = 12.5
tank_laser_cannon.attack_parameters.ammo_category = "laser"
--tank_laser_cannon.attack_parameters.cooldown =30
--tank_laser_cannon.attack_parameters.range = 19
tank_laser_cannon.attack_parameters.shell_particle = nil
tank_laser_cannon.attack_parameters.sound =     
	{
		{
			filename = "__laser_tanks_updated__/cannon.ogg",
			volume = 0.5
		},
	
	}	  
data:extend({
car, 
car_recipe,
car_item,
tank,
tank_recipe,
tank_item,
vehicle_laser_gun,
tank_laser_cannon,
})
require("ammo")
require("ammo-cannon")
require("charger")
require("electric_vehicles")
if settings.startup["lasertanks-override-color"].value then
	local r =  settings.startup["lasertanks-color-r"].value
	local g =  settings.startup["lasertanks-color-g"].value
	local b =  settings.startup["lasertanks-color-b"].value
	data.raw.item["laserrifle-charger"].icons = {{icon="__laser_tanks_updated__/graphics/charger2.png",tint={r=r, g=g, b=b}},{icon="__laser_tanks_updated__/graphics/charger3.png",tint={r=1.0, g=1.0, b=1.0}}}
	data.raw["battery-equipment"]["laserrifle-charger"].sprite =
    {layers={{
      filename = "__laser_tanks_updated__/graphics/charger2.png",
      width = 144,
      height = 144,
      priority = "medium",
	  tint={r=r, g=g, b=b}
    },{
      filename = "__laser_tanks_updated__/graphics/charger3.png",
      width = 144,
      height = 144,
      priority = "medium",
	  tint={r=1.0, g=1.0, b=1.0}
    }}}
end