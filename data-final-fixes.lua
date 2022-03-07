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

