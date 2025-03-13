local FeralFroggit, super = Class(LightEncounter)

function FeralFroggit:init()
    super:init(self)

    self.text = "* You engaged the\nFeral Froggit!"

    self.music = "battle_evershade"

    self:addEnemy("feralfroggit")

    self.can_flee = false

    self.kill_count = 0

end

return FeralFroggit