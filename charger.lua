sp = {
"automation-science-pack",
"logistic-science-pack",
"chemical-science-pack",
"military-science-pack",
"production-science-pack",
"utility-science-pack"
}
if not data.raw.technology["laser-rifle-1"] then
	
	
	data:extend({
	{
			type = "technology",
			name = "laser-rifle-1",
			icon = "__Laser_Tanks_kr__/graphics/warning.png",
			effects =
			{{
				type = "unlock-recipe",
				recipe = "lasercar"
			},
			{
				type = "unlock-recipe",
				recipe = "laserrifle-charger"
			}},
			prerequisites = { "military-3"},
			unit = {
				count = 250,
				ingredients = {
				{sp[1], 1},
				{sp[2], 1}},
				time = 30
			},
			order = "c-e-c",
			icon_size = 144,
	
	},
		{
			type = "technology",
			name = "laser-rifle-2",
			icon = "__Laser_Tanks_kr__/graphics/warning.png",
			effects =
			{{
				type = "nothing",
				effect_description = {"modifier-description.laser-rifle-2"},
			},
			{
				type = "unlock-recipe",
				recipe = "lasertank"
			}},
			prerequisites = { "military-4","laser-rifle-1"},
			unit = {
				count = 200,
				ingredients = {
				{sp[1], 1},
				{sp[2], 1},
				{sp[3], 1},
				{sp[4], 1},
				{sp[5], 1}},
				time = 30
			},
			order = "c-e-c",
			icon_size = 144,
	
	},
		{
			type = "technology",
			name = "laser-rifle-3",
			icon = "__Laser_Tanks_kr__/graphics/warning.png",
			effects =
			{{
				type = "nothing",
				effect_description = {"modifier-description.laser-rifle-3"},
			}},
			prerequisites = { "uranium-ammo","laser-rifle-2"},
			unit = {
				count = 600,
				ingredients = {
				{sp[1], 1},
				{sp[2], 1},
				{sp[3], 1},
				{sp[4], 1},
				{sp[5], 1},
				{sp[6], 1}},
				time = 30
			},
			order = "c-e-c",
			icon_size = 144,
	
	},
	--recipe
	{
		type = "recipe",
		name = "laserrifle-charger",
		enabled = false,
		energy_required = 10,
		ingredients =
		{
		{"advanced-circuit", 50},
		{"steel-plate", 20},
		{"battery", 50}
		},
		result = "laserrifle-charger"
	},
	--item
	{
		type = "item",
		name = "laserrifle-charger",
		icons = {{icon="__Laser_Tanks_kr__/graphics/charger2.png",tint={r=1.0, g=1.0, b=1.0}},{icon="__Laser_Tanks_kr__/graphics/charger3.png",tint={r=1.0, g=1.0, b=1.0}}},
		icon_size = 144,
		flags = flags_main,
		placed_as_equipment_result = "laserrifle-charger",
		subgroup = "equipment",
		order = "e[robotics]-a[personal-roboport-equipment]",
		stack_size = 20
	},
	--equipment
	{
		type = "battery-equipment",
		name = "laserrifle-charger",
		sprite =
		{layers={{
		filename = "__Laser_Tanks_kr__/graphics/charger2.png",
		width = 144,
		height = 144,
		priority = "medium",
		tint={r=1.0, g=1.0, b=1.0}
		},{
		filename = "__Laser_Tanks_kr__/graphics/charger3.png",
		width = 144,
		height = 144,
		priority = "medium",
		tint={r=1.0, g=1.0, b=1.0}
		}}},
		shape =
		{
		width = 1,
		height = 1,
		type = "full"
		},
		energy_source =
		{
			type = "electric",
			buffer_capacity = "1500KJ",
			input_flow_limit = "750KW",
			drain = "0W",
			output_flow_limit = "0W",
			usage_priority = "primary-input"
		},
		categories = {"armor"},
		order = "b-i-c"
	}
	})
else
data.raw["battery-equipment"]["laserrifle-charger"].energy_source.buffer_capacity = "1500KJ"

table.insert(data.raw.technology["laser-rifle-1"].effects,      {
        type = "unlock-recipe",
        recipe = "lasercar"
      })
data.raw.technology["laser-rifle-1"].icon = "__Laser_Tanks_kr__/graphics/warning.png"
table.insert(data.raw.technology["laser-rifle-2"].effects,      {
        type = "unlock-recipe",
        recipe = "lasertank"
      })
data.raw.technology["laser-rifle-2"].icon = "__Laser_Tanks_kr__/graphics/warning.png"
data.raw.technology["laser-rifle-3"].icon = "__Laser_Tanks_kr__/graphics/warning.png"
end