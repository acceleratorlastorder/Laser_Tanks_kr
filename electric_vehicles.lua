if settings.startup["lasertanks-electric-engine"].value and not data.raw["equipment-category"]["electric-vehicles-equipment"] then
	require("electricvehicles.categories")
	require("electricvehicles.equipment")
	require("electricvehicles.items")
	require("electricvehicles.recipes")
	require("electricvehicles.technologies")
	if settings.startup["lasertanks-add-train"].value then
		require("electric_train")
	end
end