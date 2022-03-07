require("env")
require("utils")

if mods["Krastorio2"] then
    local car_prototype = getPrototype("car", "lasercar")
    local tank_prototype = getPrototype("car", "lasertank")
    local train_prototype = getPrototype("locomotive", TRAIN_EQUIPEMENT_GRID_NAME)

    local car_source = getEquipementGridList("kr-car-grid")
    local tank_source = getEquipementGridList("kr-tank-grid")
    local train_source = getEquipementGridList("kr-locomotive-grid")

    local car_target = getEquipementGridList(car_prototype.equipment_grid)
    local tank_target = getEquipementGridList(tank_prototype.equipment_grid)
    local train_target = getEquipementGridList(train_prototype.equipment_grid)

    copyEquipementGrid(car_source, car_target)
    copyEquipementGrid(tank_source, tank_target)
    copyEquipementGrid(train_source, train_target)

    -- Or simply add in data.lua "universal-equipment" to the list of equipment categories if krastorio2 detected(i wonder why i always go for the more complicated way)
    addTargetMaskItem(car_prototype, "kr-tesla-coil-trigger")
    addTargetMaskItem(tank_prototype, "kr-tesla-coil-trigger")
    addTargetMaskItem(train_prototype, "kr-tesla-coil-trigger")   

    debugLog("Krastorio2 equipment can now be used normally in the mod")
end
