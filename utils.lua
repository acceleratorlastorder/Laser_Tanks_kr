local USE_DEBUG_MODE = false

function debugLog(msg) if USE_DEBUG_MODE then log(msg) end end

function copyEquipementGrid(source, target)
    local existingEquipement = {}
    for _, l in ipairs(target) do existingEquipement[l] = true end

    for _, equipementCat in ipairs(source) do
        print(equipementCat)
        if not existingEquipement[equipementCat] then
            table.insert(target, equipementCat)
        end
    end
end

function getPrototype(type, name)
    return data.raw[type][name]
end

function getEquipementGridList(gridName, prototype)
    prototype = prototype and prototype or getPrototype("equipment-grid", gridName)
    return prototype.equipment_categories
end

function addTargetMaskItem(prototype, item)
    local mask = prototype.trigger_target_mask
    if not mask then
        mask = {}
    end

    prototype.trigger_target_mask = mask
    table.insert(mask, item)
end