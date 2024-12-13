local actor, super = Class(Actor, "bearserkershadowed")

function actor:init()
    super.init(self)

    self.name = "???"

    self.width = 185
    self.height = 199

    self.use_light_battler_sprite = true

    self.hitbox = {0, 25, 19, 14}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "lightenemies/bearserker"
    self.default = ""

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["lightbattle_hurt"] = {"shadowed", 1/8, false}
    }

    self.offsets = {
        ["shadowed"]  = {0, 0},
    }

    self:addLightBattlerPart("main", {
        ["create_sprite"] = function()
            local sprite = Sprite(self.path.."/shadowed", 80, 220)
            sprite:setOrigin(0.5, 1)
            --sprite.layer = 400
            return sprite
        end
    })
end

return actor