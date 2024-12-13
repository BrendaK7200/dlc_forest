local BearserkerShadowed, super = Class(LightEnemyBattler)

function BearserkerShadowed:init()
    super:init(self)

    self.name = "???"
    self:setActor("bearserkershadowed")

    self.max_health = 1500
    self.health = 1500
    self.attack = 15
    self.defense = math.huge
    self.money = 0
    self.experience = 0
    
    self.dialogue_bubble = "ut_small"
    self.dialogue_offset = {10, 0}

    self.waves = {
    }

    self.check = "ATK ??? DEF ???\n* There's no hope of defeating it.\n* Run as soon as you can."

    self.text = {
        "* Dust fills the air.",
        "* Your heart is racing.",
        "* The air grows cold.",
        "* Nowhere to hide.",
    }

    self.damage_offset = {40, 0}

    self.timer = 0
    local body = self.sprite.parts.main.sprite
    body:setScale(0.7)
end

function BearserkerShadowed:onAct(battler, name)
    if name == "Standard" then
        return "* ... But "..battler.chara:getName().." had no idea what to do."
    end

    return super:onAct(self, battler, name)
end

function BearserkerShadowed:update()
    super:update(self)

    local body = self.sprite.parts.main.sprite
    self.timer = self.timer + DT
    body.scale_y = math.sin(self.timer/2)/75 + 0.7
end

return BearserkerShadowed