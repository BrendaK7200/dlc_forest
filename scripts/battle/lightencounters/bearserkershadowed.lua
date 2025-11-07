local BearserkerShadowed, super = Class(LightEncounter)

function BearserkerShadowed:init()
    super.init(self)

    self.text = "* Nowhere to hide."

    self.music = "battle_caught"

    self:addEnemy("bearserkershadowed")

    self.can_flee = true

    self.kill_count = 0

end

return BearserkerShadowed