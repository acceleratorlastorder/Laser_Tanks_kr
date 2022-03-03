local use_own_library = false
if settings.startup["lasertanks-electric-engine"].value and not remote.interfaces["electric-vehicles-lib"] then
require("Electric-Vehicles-Lib-Reborn.control")
use_own_library = true
end


TICKS_PER_UPDATE = 20 --*3 (per 3rd tick)
ENERGY_PER_CHARGE = 749998 -- wtf 500k is buggy?

script.on_init(function()
	global.version = 10
	global.e_vehicles = { }
	global.braking_trains = { }
	global.braking_vehicles = { }
	global.transformers = { }
	global.brakes = { }
	global.vehicles={}
	for _, force in pairs(game.forces) do
		if force.technologies["laser-rifle-1"].researched == true then
			force.recipes["lasercar"].enabled = true
		end
		if force.technologies["laser-rifle-2"].researched == true then
			force.recipes["lasertank"].enabled = true
		end
		if settings.startup["lasertanks-electric-engine"].value and force.technologies["laser-rifle-1"].researched == true then
			force.recipes["electric-vehicles-lo-voltage-transformer"].enabled = true
			force.recipes["electric-vehicles-regen-brake-controller"].enabled = true
		end
		if settings.startup["lasertanks-electric-engine"].value and force.technologies["laser-rifle-2"].researched == true then
			force.recipes["electric-vehicles-hi-voltage-transformer"].enabled = true
		end
	end
	if settings.startup["lasertanks-electric-engine"].value then
	    remote.call("electric-vehicles-lib", "register-transformer", {name = "electric-vehicles-lo-voltage-transformer"})
		remote.call("electric-vehicles-lib", "register-transformer", {name = "electric-vehicles-hi-voltage-transformer"})
		remote.call("electric-vehicles-lib", "register-brake", {name = "electric-vehicles-regen-brake-controller", efficiency = 0.8})
	end
	if string.sub(game.active_mods["base"],1,4) == "0.16" then
		global.player_main = defines.inventory.player_main
		global.player_ammo = defines.inventory.player_ammo
		global.player_guns = defines.inventory.player_guns
	else
		global.player_main = defines.inventory.character_main
		global.player_ammo = defines.inventory.character_ammo
		global.player_guns = defines.inventory.character_guns
	end
end)

script.on_event(defines.events.on_built_entity, function(event)
	if event.created_entity.name == "lasertank" or event.created_entity.name == "lasercar" then
		table.insert(global.vehicles,event.created_entity)
	end
	if use_own_library then on_built_entity(event) end
end)

script.on_configuration_changed(function()
	for _, force in pairs(game.forces) do
		if settings.startup["lasertanks-electric-engine"].value and game.active_mods["electric-vehicles-lib-reborn"] and force.technologies["laser-rifle-1"].researched == true then
			force.recipes["electric-vehicles-lo-voltage-transformer"].enabled = true
			force.recipes["electric-vehicles-regen-brake-controller"].enabled = true
		end
		if settings.startup["lasertanks-electric-engine"].value and game.active_mods["electric-vehicles-lib-reborn"] and force.technologies["laser-rifle-2"].researched == true then
			force.recipes["electric-vehicles-hi-voltage-transformer"].enabled = true
		end
	end
	if not global.version then
		global.e_vehicles = { }
		global.braking_trains = { }
		global.braking_vehicles = { }
		global.transformers = { }
		global.brakes = { }
		global.version = 10
	end
	if use_own_library then 
		ev_on_configuration_changed() 
		ev_rebuild_caches()
	end
	if settings.startup["lasertanks-electric-engine"].value then
	    remote.call("electric-vehicles-lib", "register-transformer", {name = "electric-vehicles-lo-voltage-transformer"})
		remote.call("electric-vehicles-lib", "register-transformer", {name = "electric-vehicles-hi-voltage-transformer"})
		remote.call("electric-vehicles-lib", "register-brake", {name = "electric-vehicles-regen-brake-controller", efficiency = 0.8})
	end
	if string.sub(game.active_mods["base"],1,4) == "0.16" then
		global.player_main = defines.inventory.player_main
		global.player_ammo = defines.inventory.player_ammo
		global.player_guns = defines.inventory.player_guns
	else
		global.player_main = defines.inventory.character_main
		global.player_ammo = defines.inventory.character_ammo
		global.player_guns = defines.inventory.character_guns
	end
end)



function table_length(tbl)
	if tbl == nil then
		return 0
	else
		local count = 0
		for _ in pairs(tbl) do
			count = count + 1
		end
		return count	
	end
end

script.on_nth_tick(3, function(event)
	local temp_count = table_length(game.connected_players )
	local i

	local player_count = math.floor((temp_count+(global.tick_delayer or 0))/TICKS_PER_UPDATE)
	if not (player_count > 0) then
		global.tick_delayer = (global.tick_delayer or 0) + temp_count
	else
		global.tick_delayer = 0
	
		if not global.iterate_players then
			global.iterate_players = next(game.connected_players ,global.iterate_players)
		elseif not game.connected_players [global.iterate_players] then
			global.iterate_players = nil
		end
		i = 0
		--maxruns = math.min(1,player_count) --max 20/s
		while i< player_count and global.iterate_players do
			if game.connected_players[global.iterate_players].character then
				local playerid = global.iterate_players
				local techlevel = 0
				if game.connected_players [playerid].force.technologies["laser-rifle-1"].researched then
					techlevel = 1
					if game.connected_players [playerid].force.technologies["laser-rifle-2"].researched then
						techlevel = 2
						if game.connected_players [playerid].force.technologies["laser-rifle-3"].researched then
							techlevel = 3
						end
					end
					local stack = game.connected_players[playerid].get_inventory(global.player_main).find_item_stack("lasertanks-ammo-"..techlevel)
					if stack then
						stack.clear()
					end
					stack = game.connected_players[playerid].get_inventory(global.player_main).find_item_stack("lasertanks-cannon-ammo-"..techlevel)
					if stack then
						stack.clear()
					end
					
					stack = game.connected_players[playerid].get_inventory(global.player_ammo).find_item_stack("lasertanks-ammo-"..techlevel)
					if stack then
						stack.clear()
					end
					
					stack = game.connected_players[playerid].get_inventory(global.player_ammo).find_item_stack("lasertanks-cannon-ammo-"..techlevel)
					if stack then
						stack.clear()
					end
				end
			end
			global.iterate_players = next(game.connected_players ,global.iterate_players)	--iterating...
			if not global.iterate_players then
				global.iterate_players = next(game.connected_players ,global.iterate_players)
			end
			i=i+1
		end
	end
	
	temp_count = table_length(global.vehicles)
	local vehicle_count = math.floor((temp_count+(global.tick_delayer_veh or 0))/TICKS_PER_UPDATE)
	if not (vehicle_count > 0) then
		global.tick_delayer_veh = (global.tick_delayer_veh or 0) + temp_count
	else
		global.tick_delayer_veh = 0
	
		if not global.iterate_vehicles then
			global.iterate_vehicles = next(global.vehicles ,global.iterate_vehicles)
		elseif not global.vehicles [global.iterate_vehicles] then
			global.iterate_vehicles = nil
		end
		i = 0
		--maxruns = math.min(1,vehicle_count) --max 20/s
		while i< vehicle_count and global.iterate_vehicles do
			if not global.vehicles[global.iterate_vehicles].valid then
				global.vehicles[global.iterate_vehicles] = nil
				--game.players[1].print("invalid")
			else
				local vehicle = global.vehicles[global.iterate_vehicles]
				local techlevel = 0
				if vehicle.force.technologies["laser-rifle-1"].researched then
					techlevel = 1
					if vehicle.force.technologies["laser-rifle-2"].researched then
						techlevel = 2
						if vehicle.force.technologies["laser-rifle-3"].researched then
							techlevel = 3
						end
					end
					local stack = vehicle.get_inventory(defines.inventory.car_trunk).find_item_stack("lasertanks-ammo-"..techlevel)
					if stack then
						stack.clear()
					end
					stack = vehicle.get_inventory(defines.inventory.car_trunk).find_item_stack("lasertanks-cannon-ammo-"..techlevel)
					if stack then
						stack.clear()
					end
					local gun_index = 2
					if vehicle.name == "lasercar" then
						gun_index = 1
					end
					local ammo = vehicle.get_inventory(defines.inventory.car_ammo)[gun_index]
					if not ammo.valid_for_read then
						ammo = 0
					else
						if ammo.name ~= "lasertanks-ammo-"..techlevel then
							ammo.set_stack{name = "lasertanks-ammo-"..techlevel, count = 1,ammo=ammo.ammo}
						end
						ammo = ammo.ammo
					end
					local cannon_ammo = 10
					if vehicle.name == "lasertank" then
						cannon_ammo = vehicle.get_inventory(defines.inventory.car_ammo)[1]
						if not cannon_ammo.valid_for_read then
							cannon_ammo = 0
						else
							if cannon_ammo.name ~= "lasertanks-cannon-ammo-"..techlevel then
								cannon_ammo.set_stack{name = "lasertanks-cannon-ammo-"..techlevel, count = 1,ammo=cannon_ammo.ammo}
							end
							cannon_ammo = cannon_ammo.ammo
						end
					end
					if ammo <50 or cannon_ammo < 10 then
						local energy = 0
						local modules = 0
						for _, eq in pairs(vehicle.grid.equipment) do
							if eq.name == "laserrifle-charger" then
								energy = energy+eq.energy
								modules = modules+1
								--game.connected_players [playerid].print(eq.energy)
							end
						end
						local inserted = 0
						if ammo < cannon_ammo*5 then
							if energy >= ENERGY_PER_CHARGE/(2.5-techlevel*0.5) then
								inserted = math.min(50-ammo,math.floor(energy/(ENERGY_PER_CHARGE/(2.5-techlevel*0.5))))
								if ammo == 0 then
									vehicle.get_inventory(defines.inventory.car_ammo)[gun_index].set_stack{name = "lasertanks-ammo-"..techlevel, count = 1,ammo=inserted}
								else
									vehicle.get_inventory(defines.inventory.car_ammo)[gun_index].ammo = ammo+inserted
								end
							end
						else
							if energy >= ENERGY_PER_CHARGE*2/(2.5-techlevel*0.5) then
								inserted = math.min(10-cannon_ammo,math.floor(energy/(ENERGY_PER_CHARGE*2/(2.5-techlevel*0.5))))
								if cannon_ammo == 0 then
									vehicle.get_inventory(defines.inventory.car_ammo)[1].set_stack{name = "lasertanks-ammo-"..techlevel, count = 1,ammo=inserted}
								else
									vehicle.get_inventory(defines.inventory.car_ammo)[1].ammo = cannon_ammo+inserted
								end
								inserted = inserted * 2
							end
						end
						for _, eq in pairs(vehicle.grid.equipment) do
							if eq.name == "laserrifle-charger" then
								eq.energy = eq.energy - inserted*(ENERGY_PER_CHARGE/(2.5-techlevel*0.5))/modules
							end
						end
					end
				end
			end
			global.iterate_vehicles = next(global.vehicles ,global.iterate_vehicles)	--iterating...
			if not global.iterate_vehicles then
				global.iterate_vehicles = next(global.vehicles ,global.iterate_vehicles)
			end
			i=i+1
		end
	end
end)
if use_own_library then 
	--script.on_init(on_init)
	--if global.version then -- hmmm.. 
	script.on_load(function(event)
		ev_rebuild_caches(event)
	end)
	--end
	--script.on_configuration_changed(on_configuration_changed)
	
	--script.on_event(defines.events.on_built_entity, on_built_entity)
	script.on_event(defines.events.on_entity_died, ev_on_entity_died)
	script.on_event(defines.events.on_player_placed_equipment, ev_on_player_placed_equipment)
	script.on_event(defines.events.on_player_removed_equipment, ev_on_player_removed_equipment)
	script.on_event(defines.events.on_pre_player_mined_item, ev_on_pre_player_mined_item) -- deprecated?
	script.on_event(defines.events.on_robot_pre_mined, ev_on_robot_pre_mined)
	script.on_event(defines.events.on_tick, ev_on_tick)
	script.on_event(defines.events.on_train_changed_state, ev_on_train_changed_state)
end

--					if not global.techlevels then
--						global.techlevels = {}
--					end
--					global.techlevels[game.connected_players [playerid].force.name] = techlevel
--					if game.connected_players [playerid].character and game.connected_players [playerid].character.grid then
--						local energy = 0
--						local modules = 0
--						for _, eq in pairs(game.connected_players [playerid].character.grid.equipment) do
--							if eq.name == "laserrifle-charger" then
--								energy = energy+eq.energy
--								modules = modules+1
--								--game.connected_players [playerid].print(eq.energy)
--							end
--						end
--						--game.connected_players [playerid].print(energy.." >= ".. ENERGY_PER_CHARGE/(2.5-techlevel*0.5))
--						if energy >= ENERGY_PER_CHARGE/(2.5-techlevel*0.5) then
--							local gun, pos =  game.connected_players [playerid].get_inventory(defines.inventory.player_guns).find_item_stack("laserrifle")
--							if gun then
--								if not game.connected_players [playerid].get_inventory(defines.inventory.player_ammo)[pos].valid_for_read then
--									game.connected_players [playerid].get_inventory(defines.inventory.player_ammo)[pos].set_stack{name = "laser-ammo-"..techlevel, count = 1,ammo=1}
--								elseif string.sub(game.connected_players [playerid].get_inventory(defines.inventory.player_ammo)[pos].name,1,11) == "laser-ammo-" then
--									local count = game.connected_players [playerid].get_inventory(defines.inventory.player_ammo)[pos].ammo
--									if game.connected_players [playerid].get_inventory(defines.inventory.player_ammo)[pos].name ~= "laser-ammo-"..techlevel then
--										game.connected_players [playerid].get_inventory(defines.inventory.player_ammo)[pos].set_stack{name = "laser-ammo-"..techlevel, count = count}
--									end
--									local inserted = math.min(100-count,math.floor(energy/(ENERGY_PER_CHARGE/(2.5-techlevel*0.5))))
--									if count <100 then
--										game.connected_players [playerid].get_inventory(defines.inventory.player_ammo)[pos].ammo=count+inserted
--									end
--									for _, eq in pairs(game.connected_players [playerid].character.grid.equipment) do
--										if eq.name == "laserrifle-charger" then
--											eq.energy = eq.energy - inserted*(ENERGY_PER_CHARGE/(2.5-techlevel*0.5))/modules
--										end
--									end
--								end
--							end
--						end
--					end