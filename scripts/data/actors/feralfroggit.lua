local actor, super = Class(Actor, "feralfroggit")

function actor:init()
    super.init(self)

    self.name = "Feral Froggit"

    self.width = 23
    self.height = 23

    self.hitbox = {2, 10, 19, 13}

    self.color = {1, 0, 0}

    self.flip = nil

    self.path = "lightenemies/feralfroggit/overworld"
    self.default = "idle"

    self.voice = nil
    self.portrait_path = nil
    self.portrait_offset = nil

    self.can_blush = false

    self.talk_sprites = {}

    self.animations = {
        ["croak"] = {"croak", 0.75, false, {after = "idle"}},
        ["idle"] = {"idle", 0.25, true}
    }

    self.offsets = {
        ["croak"] = {0, 0},
        ["idle"] = {0, 0},
    }
end

return actor