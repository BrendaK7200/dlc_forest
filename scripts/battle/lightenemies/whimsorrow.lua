local Whimsorrow, super = Class(LightEnemyBattler)

function Whimsorrow:init()
    super.init(self)

    self.name = "Whimsorrow"
    self:setActor("whimsorrowenemy")

    self.max_health = 50
    self.health = 50
    self.attack = 8
    self.defense = -2
    self.money = 2
    self.experience = 8

    if Game:getFlag("randomencounter#evershade1:violent") and Game:getFlag("randomencounter#evershade1:violent") >= 16 then
        self.scared = true
    end
    if self.scared then
        self.money = 0
        self.mercy = 100
    end

    self.dialogue_bubble = "ut_small"
    self.dialogue_offset = {10, 0}

    self.waves = {
        "basic"
    }

    self.dialogue = {
        "*Hiss*",
    }
    if self.scared then
        self.dialogue = {
            "*Whimper*",
        }
    end

    self.low_health_dialogue = "*Whimper*"

    self.check = "ATK 8 DEF -2\n* An agressive insect with tattered wings.\n* Does not like being approached."
    if self.scared then
        --self.check = "ATK 5 DEF 1\n* Cornered like a wild animal."
    end

    self.text = {
        "* Whimsorrow tries to fly but miserably fails.",
        "* Whimsorrow's wings make a buzzing noise.",
        "* Smells like tears.",
    }

    self.spareable_text = "* Whimsorrow doesn't want to attack you anymore."
    if self.scared then
        self.spareable_text = "* Whimsorrow is desperately trying to fly away."
    end
    self.low_health_text = "* Whimsorrow's carapace is getting scratched up."

    if not self.scared then
    end

    self.damage_offset = {0, -60}

    local body = self.sprite.parts.body.sprite
    local wings = self.sprite.parts.wings.sprite
    wings.layer = body.layer - 1

    self.timer = 0
end

function Whimsorrow:getDamageVoice()
    return "hurtbuzz"
end

function Whimsorrow:onDefeat()
    self.money = 2
    super.onDefeat(self)
end

function Whimsorrow:onHurtEnd()
    super.onHurtEnd(self)
    local body = self.sprite.parts.body.sprite
    local wings = self.sprite.parts.wings.sprite
    wings.layer = body.layer - 1
end

function Whimsorrow:onAct(battler, name)
    if name == "Standard" then
        if self.scared then
            return "* ... But "..battler.chara:getName().." had no idea what to do."
        end
        return "* ... But "..battler.chara:getName().." had no idea what to do."
    end

    return super.onAct(self, battler, name)
end

function Whimsorrow:update()
    super.update(self)

    local body = self.sprite.parts.body.sprite
    local wings = self.sprite.parts.wings.sprite
    self.timer = self.timer + DT
    wings.scale_x = math.sin(self.timer*3)/5 + 0.6
end

return Whimsorrow
