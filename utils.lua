local USE_DEBUG_MODE = true

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

function getEquipementGridList(gridName)
    return data.raw["equipment-grid"][gridName].equipment_categories
end
