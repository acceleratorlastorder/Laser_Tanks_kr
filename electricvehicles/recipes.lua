data:extend
{
  {
    type = "recipe",
    name = "electric-vehicles-lo-voltage-transformer",
    enabled = false,
    ingredients =
    {
      {"iron-plate", 10},
      {"copper-cable", 50},
    },
    result = "electric-vehicles-lo-voltage-transformer",
  },
  {
    type = "recipe",
    name = "electric-vehicles-hi-voltage-transformer",
    enabled = false,
    ingredients =
    {
      {"steel-plate", 30},
      {"plastic-bar", 10},
      {"copper-cable", 200},
      {type = "fluid", name = "lubricant", amount = 5},
    },
    result = "electric-vehicles-hi-voltage-transformer",
    category = "crafting-with-fluid",
  },
  {
    type = "recipe",
    name = "electric-vehicles-regen-brake-controller",
    enabled = false,
    ingredients =
    {
      {"processing-unit", 1},
      {"effectivity-module", 1},
    },
    result = "electric-vehicles-regen-brake-controller",
  }
}
