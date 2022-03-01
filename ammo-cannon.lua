data:extend({{
    type = "corpse",
    name = "lasertank-big-scorchmark",
    icon = "__laser_tanks_updated__/graphics/icons/small-scorchmark.png",
    icon_size = 32,
    flags = {"placeable-neutral", "not-on-map", "placeable-off-grid"},
    collision_box = {{-1.5, -1.5}, {1.5, 1.5}},
    collision_mask = {"doodad-layer", "not-colliding-with-itself"},
    selection_box = {{-1, -1}, {1, 1}},
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 10, -- 10 minutes
    final_render_layer = "ground-patch-higher2",
    subgroup = "remnants",
    order="d[remnants]-b[scorchmark]-a[small]",
    animation =
    {
      width = 110,
      height = 90,
      frame_count = 1,
      direction_count = 1,
      filename = "__laser_tanks_updated__/graphics/entity/scorchmark/small-scorchmark.png",
      variation_count = 3,
		scale = 2,
		shift = {0, -0.8},
    },
    ground_patch =
    {
      sheet =
      {
        width = 110,
        height = 90,
        frame_count = 1,
        direction_count = 1,
        x = 110 * 2,
        filename = "__laser_tanks_updated__/graphics/entity/scorchmark/small-scorchmark.png",
        variation_count = 3,
		scale = 2,
		shift = {0, -0.8},
      }
    },
    ground_patch_higher =
    {
      sheet =
      {
        width = 110,
        height = 90,
        frame_count = 1,
        direction_count = 1,
        x = 110,
        filename = "__laser_tanks_updated__/graphics/entity/scorchmark/small-scorchmark.png",
        variation_count = 3,
		scale = 2,
		shift = {0, -0.8},
      }
    }
  },})


--local laser_cannon_explosion = util.table.deepcopy(data.raw["explosion"]["explosion"])
--laser_cannon_explosion.name = "laser-cannon-explosion"
--for k, v in pairs(laser_cannon_explosion.animations) do
--  v.tint = {r = 0.4, g = 0.4, b = 0.4}
--end
--data:extend({laser_cannon_explosion})

local sprites={
		{
        filename = "__laser_tanks_updated__/graphics/1.png",
        flags = { "compressed" },
        width = 409,
        height = 343,
        frame_count = 18,--25
        line_length = 5,
        axially_symmetrical = false,
        direction_count = 1,
        shift = {-1.08, -0.8},
        animation_speed = 0.4,
		tint= {r = 1, g = 1, b = 1, a = 0.85},
		scale = 1.2,
      },
	  {
        filename = "__laser_tanks_updated__/graphics/2.png",
        flags = { "compressed" },
        width = 409,
        height = 396,
        frame_count = 18,--25
        line_length = 5,
        axially_symmetrical = false,
        direction_count = 1,
        shift = {-1.6, -1.21},
        animation_speed = 0.4,
		tint= {r = 1, g = 1, b = 1, a = 0.85},
		scale = 1.2,
      },
	  {
        filename = "__laser_tanks_updated__/graphics/3.png",
        flags = { "compressed" },
        width = 409,
        height = 330,
        frame_count = 18,--30
        line_length = 5,
        axially_symmetrical = false,
        direction_count = 1,
        shift = {-0.04, -0.93},
        animation_speed = 0.4,
		tint= {r = 1, g = 1, b = 1, a = 0.85},
		scale = 1.2,
      },
	  {
        filename = "__laser_tanks_updated__/graphics/4.png",
        flags = { "compressed" },
        width = 512,
        height = 339,
        frame_count = 17,--24
        line_length = 4,
        axially_symmetrical = false,
        direction_count = 1,
        shift = {0.1, -0.1},
        animation_speed = 0.4,
		tint= {r = 1, g = 1, b = 1, a = 0.85},
		scale = 1.1,
      },
	  {
        filename = "__laser_tanks_updated__/graphics/5.png",
        flags = { "compressed" },
        width = 409,
        height = 366,
        frame_count = 19,--25
        line_length = 5,
        axially_symmetrical = false,
        direction_count = 1,
        shift = {-1.4, -1.35},
        animation_speed = 0.4,
		tint= {r = 1, g = 1, b = 1, a = 0.85},
		scale = 1.2,
      },
	  {
        filename = "__laser_tanks_updated__/graphics/6.png",
        flags = { "compressed" },
        width = 341,
        height = 287,
        frame_count = 21,--30
        line_length = 6,
        axially_symmetrical = false,
        direction_count = 1,
        shift = {-0.15, -0},
        animation_speed = 0.4,
		tint= {r = 1, g = 1, b = 1, a = 0.85},
		scale = 1.2,
      },
	  {
        filename = "__laser_tanks_updated__/graphics/7.png",
        flags = { "compressed" },
        width = 341,
        height = 313,
        frame_count = 23,--30
        line_length = 6,
        axially_symmetrical = false,
        direction_count = 1,
        shift = {-1.05, -0.1},
        animation_speed = 0.4,
		tint= {r = 1, g = 1, b = 1, a = 0.85},
		scale = 1.3,
      },
	  {
        filename = "__laser_tanks_updated__/graphics/8.png",
        flags = { "compressed" },
        width = 341,
        height = 310,
        frame_count = 20,--36
        line_length = 6,
        axially_symmetrical = false,
        direction_count = 1,
        shift = {-0.85, 1.1},
        animation_speed = 0.4,
		tint= {r = 1, g = 1, b = 1, a = 0.85},
		scale = 1.4,
      },
	  {
        filename = "__laser_tanks_updated__/graphics/9.png",
        flags = { "compressed" },
        width = 409,
        height = 338,
        frame_count = 25,--30
        line_length = 5,
        axially_symmetrical = false,
        direction_count = 1,
        shift = {-0.15, -0.22},
        animation_speed = 0.4,
		tint= {r = 1, g = 1, b = 1, a = 0.85},
		scale = 1.5,
      },
	  {
        filename = "__laser_tanks_updated__/graphics/10.png",
        flags = { "compressed" },
        width = 341,
        height = 260,
        frame_count = 27,--36
        line_length = 6,
        axially_symmetrical = false,
        direction_count = 1,
        shift = {-1.3, -0.65},
        animation_speed = 0.4,
		tint= {r = 1, g = 1, b = 1, a = 0.85},
		scale = 2.1,
      }
	  
    }
local generated_animations = {}


local laser_cannon_shell_explosion_2 = util.table.deepcopy(data.raw["explosion"]["big-explosion"])
laser_cannon_shell_explosion_2.name = "laser-cannon-shell-explosion-2"
--laser_cannon_shell_explosion_2.animations = generated_animations
laser_cannon_shell_explosion_2.created_effect = nil
--laser_cannon_shell_explosion_2.light = {intensity = 0.9, size = 25, color = {r=(r+9)/10, g=(g+9)/10, b=(b+9)/10}}
laser_cannon_shell_explosion_2.sound =
    {
      aggregation =
      {
        max_count = 1,
        remove = true
      },
      variations =
      {
        {
          filename = "__laser_tanks_updated__/sound/fight/old/explosion2.ogg",
          volume = 1
        }
      }
    }
	
local r =  settings.startup["lasertanks-color-r"].value
local g =  settings.startup["lasertanks-color-g"].value
local b =  settings.startup["lasertanks-color-b"].value

for i=10,settings.startup["lasertanks-explosions"].value+1, -1 do
	sprites[i]=nil
end
if settings.startup["lasertanks-override-color"].value then
	local tinted_sprites = {}
	for i, data in pairs(sprites) do
		table.insert(tinted_sprites,{layers={table.deepcopy(data),table.deepcopy(data)}})
		tinted_sprites[i].layers[1].filename = "__laser_tanks_updated__/graphics/"..i.."_white.png"
		tinted_sprites[i].layers[2].filename = "__laser_tanks_updated__/graphics/"..i.."_tint.png"
		tinted_sprites[i].layers[2].tint= {r = r, g = g, b = b, a = 0.85}
	end
	laser_cannon_shell_explosion_2.animations = tinted_sprites
	laser_cannon_shell_explosion_2.light = {intensity = 0.9, size = 25, color = {r=(r+9)/10, g=(g+9)/10, b=(b+9)/10}}
	data:extend({laser_cannon_shell_explosion_2})
	--data.raw.projectile["lasertanks-projectile-1"].animation.tint = {r=r, g=g, b=b}
	--data.raw.projectile["lasertanks-projectile-2"].animation.tint = {r=r, g=g, b=b}
	--data.raw.projectile["lasertanks-projectile-3"].animation.tint = {r=r, g=g, b=b}
	--data.raw.projectile["lasertanks-cannon-projectile-1"].animation.tint = {r=r, g=g, b=b}
	--data.raw.projectile["lasertanks-cannon-projectile-2"].animation.tint = {r=r, g=g, b=b}
	--data.raw.projectile["lasertanks-cannon-projectile-3"].animation.tint = {r=r, g=g, b=b}
else
	local laser_cannon_shell_explosion_3 = table.deepcopy(laser_cannon_shell_explosion_2)
	laser_cannon_shell_explosion_3.name = "laser-cannon-shell-explosion-3"
	laser_cannon_shell_explosion_3.animations = table.deepcopy(sprites)
	laser_cannon_shell_explosion_3.light = {intensity = 0.9, size = 25, color = {r=(0.2+9)/10, g=(g+9)/10, b=(0.8+9)/10}}
	data:extend({laser_cannon_shell_explosion_3})
	
	for i, data in pairs(sprites) do
		data.filename = "__laser_tanks_updated__/graphics/"..i.."_pink.png"
	end
	laser_cannon_shell_explosion_2.animations = table.deepcopy(sprites)
	laser_cannon_shell_explosion_2.light = {intensity = 0.9, size = 25, color = {r=(1+9)/10, g=(0+9)/10, b=(0+9)/10}}
	data:extend({laser_cannon_shell_explosion_2})
end


local projectile1 = {
    type = "projectile",
    name = "lasertanks-cannon-projectile-1",
    flags = {"not-on-map"},
    collision_box = {{-0.3, -1.1}, {0.3, 1.1}},
    acceleration = 0,
    piercing_damage = 150,
	light = {intensity = 0.65, size = 12},
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "damage",
            damage = {amount = 180 , type = "laser"}
          },
         -- {
         --   type = "create-entity",
         --   entity_name = "laser-cannon-explosion"
         -- }
        }
      }
    },
    final_action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "laser-cannon-shell-explosion-2"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 4.25,
			  force = "not-same",
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  {
                    type = "damage",
                    damage = {amount = 300, type = "explosion"}
                  },
                  --{
                  --  type = "create-entity",
                  --  entity_name = "laser-cannon-explosion"
                  --}
                }
              }
            }
          },
          {
            type = "create-entity",
            entity_name = "lasertank-big-scorchmark",
            check_buildability = true
          }
        }
      }
    },
    animation =
    {
      --filename = "__laser_tanks_updated__/graphics/entity/laser/laser-to-tint-medium.png",
      filename = "__laser_tanks_updated__/graphics/dual_laser.png",
	  scale = 3,
      tint = {r=1.0, g=1.0, b=1.0},
      frame_count = 1,
      width = 14,
      height = 33,
      priority = "high",
      blend_mode = "additive"
    }
  }
local ammo1 = {
    type = "ammo",
    name = "lasertanks-cannon-ammo-1",
    icon = "__laser_tanks_updated__/graphics/flash.png",
    icon_size = 32,
    flags = {"hidden"},
    ammo_type =
    {
      category = "laser",
      target_type = "direction",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "lasertanks-cannon-projectile-1",
          starting_speed = 1,
          direction_deviation = 0.05,
          range_deviation = 0.05,
          max_range = 30,
          --source_effects =
          --{
          --  type = "create-explosion",
          --  entity_name = "explosion-gunshot"
          --}
        }
      }
    },
    subgroup = "ammo",
	magazine_size = 10,
    order = "d[explosive-cannon-shell]-c[uranium]",
    stack_size = 1
  }
data:extend({projectile1, ammo1})

projectile2 = table.deepcopy(projectile1)
ammo2 = table.deepcopy(ammo1)
projectile2.name = "lasertanks-cannon-projectile-2"
projectile2.action.action_delivery.target_effects[1].damage.amount = 250
projectile2.final_action.action_delivery.target_effects[2].action.action_delivery.target_effects[1].damage.amount = 305
projectile2.final_action.action_delivery.target_effects[1].entity_name = "laser-cannon-shell-explosion-2"
projectile2.animation.tint = {r=1.0, g=0.37, b=1.0}
projectile2.animation.scale = 3.25
ammo2.name = "lasertanks-cannon-ammo-2"
ammo2.ammo_type.action.action_delivery.projectile = "lasertanks-cannon-projectile-2"
data:extend({projectile2, ammo2})

projectile3 = table.deepcopy(projectile1)
ammo3 = table.deepcopy(ammo1)
projectile3.name = "lasertanks-cannon-projectile-3"
projectile3.action.action_delivery.target_effects[1].damage.amount = 350
projectile3.final_action.action_delivery.target_effects[2].action.action_delivery.target_effects[1].damage.amount = 315
if not settings.startup["lasertanks-override-color"].value then
	projectile3.final_action.action_delivery.target_effects[1].entity_name = "laser-cannon-shell-explosion-3"
end
projectile3.animation.tint = {r=0.0, g=1.0, b=1.0}
projectile3.animation.scale = 3.5
ammo3.name = "lasertanks-cannon-ammo-3"
ammo3.ammo_type.action.action_delivery.projectile = "lasertanks-cannon-projectile-3"
data:extend({projectile3, ammo3})

if settings.startup["lasertanks-override-color"].value then
	data.raw.projectile["lasertanks-cannon-projectile-1"].animation.tint = {r=r, g=g, b=b}
	data.raw.projectile["lasertanks-cannon-projectile-2"].animation.tint = {r=r, g=g, b=b}
	data.raw.projectile["lasertanks-cannon-projectile-3"].animation.tint = {r=r, g=g, b=b}
	if r+g+b < 1.2 and (r<0.4 and g<0.4 and b<0.4)  then
		data.raw.projectile["lasertanks-cannon-projectile-1"].animation.blend_mode = "normal"
		data.raw.projectile["lasertanks-cannon-projectile-2"].animation.blend_mode = "normal"
		data.raw.projectile["lasertanks-cannon-projectile-3"].animation.blend_mode = "normal"
	end
end