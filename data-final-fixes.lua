require("env")
require("utils")

data.raw.car["lasertank"].guns = {
    "tank-laser-cannon", "vehicle-laser-gun", "tank-flamethrower"
}
data.raw.car["lasertank"].minable = {mining_time = 1, result = "lasertank"}
data.raw.car["lasercar"].guns = {"vehicle-laser-gun"}
data.raw.car["lasercar"].minable = {mining_time = 1, result = "lasercar"}

if data.raw["locomotive"]["electric-vehicles-electric-locomotive"] and
    data.raw.item["electric-vehicles-electric-locomotive"] then
    data.raw["locomotive"]["electric-vehicles-electric-locomotive"].minable = {
        mining_time = 1,
        result = "electric-vehicles-electric-locomotive"
    }
end

if mods["IndustrialRevolution"] then
    if data.raw.recipe.lasertank.normal and data.raw.recipe.lasertank.expensive then
        for a, b in pairs(data.raw.recipe.lasertank.normal.ingredients) do
            if b[1] == "engine-unit" then
                b[1] = "electric-engine-unit"
            end
        end
        for a, b in pairs(data.raw.recipe.lasertank.expensive.ingredients) do
            if b[1] == "engine-unit" then
                b[1] = "electric-engine-unit"
            end
        end
    end
    if data.raw.recipe.lasercar.normal and data.raw.recipe.lasercar.expensive then
        for a, b in pairs(data.raw.recipe.lasercar.normal.ingredients) do
            if b[1] == "engine-unit" then
                b[1] = "electric-engine-unit"
            end
        end
        for a, b in pairs(data.raw.recipe.lasercar.expensive.ingredients) do
            if b[1] == "engine-unit" then
                b[1] = "electric-engine-unit"
            end
        end
    elseif data.raw.recipe.lasercar.ingredients then
        for a, b in pairs(data.raw.recipe.lasercar.ingredients) do
            if b[1] == "engine-unit" then
                b[1] = "electric-engine-unit"
            end
        end
    end
end

if mods["Krastorio2"] then
    local car_source = getEquipementGridList("kr-car-grid")
    local tank_source = getEquipementGridList("kr-tank-grid")
    local train_source = getEquipementGridList("kr-locomotive-grid")

    local car_target = getEquipementGridList(CAR_EQUIPEMENT_GRID_NAME)
    local tank_target = getEquipementGridList(TANK_EQUIPEMENT_GRID_NAME)
    local train_target = getEquipementGridList(TRAIN_EQUIPEMENT_GRID_NAME)

    copyEquipementGrid(car_source, car_target)
    copyEquipementGrid(tank_source, tank_target)
    copyEquipementGrid(train_source, train_target)

    debugLog("Krastorio2 equipment can now be used normally in the mod")
end
