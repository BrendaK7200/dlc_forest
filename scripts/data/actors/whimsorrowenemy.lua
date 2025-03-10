local actor, super = Class(Actor, "whimsorrowenemy")

function actor:init()
    super.init(self)

    self.name = "Whimsorrow"

    self.width = 67
    self.height = 53

    self.use_light_battler_sprite = true

    self.hitbox = {0, 25, 19, 14}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "lightenemies/whimsorrow"
    self.default = ""

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["lightbattle_hurt"] = {"hurt", 1/8, false},
        ["lightbattle_spared"] = {"hurt", 1/8, false},
    }

    self.offsets = {
        ["hurt"]  = {0, 0},
    }

    self:addLightBattlerPart("body", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/body", 33, 50)
            sprite:setOrigin(0.5, 1)
            --sprite.layer = 400
            sprite:play(0.15)
            return sprite
        end
    })

    self:addLightBattlerPart("wings", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/wings", 33, 50)
            sprite:setOrigin(0.5, 1)
            --sprite.layer = 300
            return sprite
        end
    })
end

return actor