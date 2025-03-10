local actor, super = Class(Actor, "bearserkerenemy")

function actor:init()
    super.init(self)
    self.shadowed = false

    if self.shadowed then
        self.name = "???"
    else
        self.name = "Bearserker"
    end

    self.width = 169
    self.height = 164

    self.use_light_battler_sprite = true

    self.hitbox = {0, 25, 19, 14}

    self.color = {1, 0, 0}

    self.flip = nil

    if self.shadowed then
        self.path = "lightenemies/bearserker/shadowed"
    else
        self.path = "lightenemies/bearserker"
    end
    self.default = ""

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["lightbattle_hurt"] = {"hurt", 1/8, false}
    }

    self.offsets = {
        ["hurt"]  = {0, 0},
    }

    self:addLightBattlerPart("body", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/body", 80, 200)
            sprite:setOrigin(0.5, 1)
            --sprite.layer = 400
            return sprite
        end
    })
    self:addLightBattlerPart("hand_left", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/hand_left", 80, 200)
            sprite:setOrigin(0.5, 1)
            --sprite.layer = 400
            return sprite
        end
    })
    self:addLightBattlerPart("hand_right", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/hand_right", 80, 200)
            sprite:setOrigin(0.5, 1)
            --sprite.layer = 400
            return sprite
        end
    })
end

return actor