data:extend
{
  {
    type = "equipment-grid",
    name = "electric-vehicles-electric-car",
    width = 10,
    height = 5,
    equipment_categories = {"armor", "electric-vehicles-equipment"},
  },
  {
    type = "equipment-grid",
    name = "electric-vehicles-electric-locomotive",
    width = 10,
    height = 10,
    equipment_categories = {"armor", "electric-vehicles-equipment"},
  },
  {
    type = "equipment-grid",
    name = "electric-vehicles-electric-tank",
    width = 10,
    height = 10,
    equipment_categories = {"armor", "electric-vehicles-equipment"},
  },
  {
    type = "battery-equipment",
    name = "electric-vehicles-lo-voltage-transformer",
    sprite =
    {
      filename = "__laser_tanks_updated__/graphics/equipment/lo-voltage-transformer.png",
      width = 32,
      height = 64,
      priority = "medium"
    },
    shape =
    {
      width = 1,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = math.ceil(300 / 60) .. "kJ",
      input_flow_limit = 300 .. "kW",
      output_flow_limit = "0W",
      usage_priority = "primary-input"
    },
    categories = {"electric-vehicles-equipment"},
  },
  {
    type = "battery-equipment",
    name = "electric-vehicles-hi-voltage-transformer",
    sprite =
    {
      filename = "__laser_tanks_updated__/graphics/equipment/hi-voltage-transformer.png",
      width = 64,
      height = 64,
      priority = "medium"
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = math.ceil(5 / 60) .. "MJ",
      input_flow_limit = 5 .. "MW",
      output_flow_limit = "0W",
      usage_priority = "primary-input"
    },
    categories = {"electric-vehicles-equipment"},
  },
  {
    type = "battery-equipment",
    name = "electric-vehicles-regen-brake-controller",
    sprite =
    {
      filename = "__laser_tanks_updated__/graphics/equipment/regen-brake-controller.png",
      width = 64,
      height = 64,
      priority = "medium"
    },
    shape =
    {
      width = 2,
      height = 2,
      type = "full"
    },
    energy_source =
    {
      type = "electric",
      buffer_capacity = math.ceil(10 / 60) .. "MJ",
      input_flow_limit = "0MW",
      output_flow_limit = 10 .. "MW",
      usage_priority = "primary-output"
    },
    categories = {"electric-vehicles-equipment"},
  },
}
--if mods["vtk-armor-plating"] then
--	table.insert(data.raw["equipment-grid"]["electric-vehicles-electric-locomotive"].equipment_categories,"vtk-armor-plating")
--	table.insert(data.raw["equipment-grid"]["electric-vehicles-electric-car"].equipment_categories,"vtk-armor-plating")
--	table.insert(data.raw["equipment-grid"]["electric-vehicles-electric-tank"].equipment_categories,"vtk-armor-plating")
--end