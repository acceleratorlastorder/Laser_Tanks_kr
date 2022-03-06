local projectile1 = {
    type = "projectile",
    name = "lasertanks-projectile-1",
    flags = {"not-on-map"},
    acceleration = 0.03,
    action = {
        type = "direct",
        action_delivery = {
            type = "instant",
            target_effects = {
                -- {
                --  type = "create-entity",
                --  entity_name = "laser-bubble"
                -- },
                {type = "damage", damage = {amount = 15, type = "laser"}}
            }
        }
    },
    light = {intensity = 0.5, size = 10},
    animation = {
        filename = "__Laser_Tanks_kr__/graphics/entity/laser/laser-to-tint-medium.png",
        scale = 1.8,
        tint = {r = 1.0, g = 1.0, b = 1.0},
        frame_count = 1,
        width = 12,
        height = 33,
        priority = "high",
        blend_mode = "additive"
    }
}
local ammo1 = {
    type = "ammo",
    name = "lasertanks-ammo-1",
    icon = "__Laser_Tanks_kr__/graphics/flash.png",
    icon_size = 32,
    flags = {"hidden"},
    ammo_type = {
        category = "laser",
        action = {
            type = "direct",
            action_delivery = {
                type = "projectile",
                projectile = "lasertanks-projectile-1",
                starting_speed = 1,
                direction_deviation = 0.3,
                range_deviation = 0.3,
                max_range = 22
            }
        }
    },
    magazine_size = 50,
    subgroup = "ammo",
    order = "c[railgun]",
    stack_size = 1
}
data:extend({projectile1, ammo1})

projectile2 = table.deepcopy(projectile1)
ammo2 = table.deepcopy(ammo1)
projectile2.name = "lasertanks-projectile-2"
projectile2.action.action_delivery.target_effects[1].damage.amount = 21
projectile2.animation.tint = {r = 1.0, g = 0.37, b = 1.0}
projectile2.animation.scale = 1.9
ammo2.name = "lasertanks-ammo-2"
ammo2.ammo_type.action.action_delivery.projectile = "lasertanks-projectile-2"
data:extend({projectile2, ammo2})

projectile3 = table.deepcopy(projectile1)
ammo3 = table.deepcopy(ammo1)
projectile3.name = "lasertanks-projectile-3"
projectile3.action.action_delivery.target_effects[1].damage.amount = 60
projectile3.animation.tint = {r = 0.0, g = 1.0, b = 1.0}
projectile3.animation.scale = 2.0
ammo3.name = "lasertanks-ammo-3"
ammo3.ammo_type.action.action_delivery.projectile = "lasertanks-projectile-3"
data:extend({projectile3, ammo3})

if settings.startup["lasertanks-override-color"].value then
    local r = settings.startup["lasertanks-color-r"].value
    local g = settings.startup["lasertanks-color-g"].value
    local b = settings.startup["lasertanks-color-b"].value
    data.raw.projectile["lasertanks-projectile-1"].animation.tint = {
        r = r,
        g = g,
        b = b
    }
    data.raw.projectile["lasertanks-projectile-2"].animation.tint = {
        r = r,
        g = g,
        b = b
    }
    data.raw.projectile["lasertanks-projectile-3"].animation.tint = {
        r = r,
        g = g,
        b = b
    }
    if r + g + b < 1.2 and (r < 0.4 and g < 0.4 and b < 0.4) then
        data.raw.projectile["lasertanks-projectile-1"].animation.blend_mode =
            "normal"
        data.raw.projectile["lasertanks-projectile-2"].animation.blend_mode =
            "normal"
        data.raw.projectile["lasertanks-projectile-3"].animation.blend_mode =
            "normal"
    end
end
