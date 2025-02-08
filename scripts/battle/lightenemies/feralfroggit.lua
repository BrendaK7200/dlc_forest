local FeralFroggit, super = Class(LightEnemyBattler)

function FeralFroggit:init()
    super:init(self)

    self.name = "Feral Froggit"
    self:setActor("feralfroggitenemy")

    self.max_health = 85
    self.health = 85
    self.attack = 5
    self.defense = 1
    self.money = 5
    self.experience = 10
    
    self.dialogue_bubble = "ut_small"
    self.dialogue_offset = {10, 0}

    self.waves = {
        "flyhalo",
        "ffroggiteye"
    }

    self.dialogue = {
        "*Croak*[wait:5] *Croak*",
    }

    self.low_health_dialogue = "*Croak...*"

    self.check = "ATK 5 DEF 1\n* A Froggit with the mental capacity of a wild animal."

    self.text = {
        "* Feral Froggit sniffs the air for your scent.",
        "* Smells like a swamp.",
        "* How can an amphibian have fur?"
    }

    self.spareable_text = "* Feral Froggit respects your authority."
    self.low_health_text = "* Feral Froggit starts to get skiddish."

    self:registerAct("Compliment")
    self:registerAct("Flirt")
    self:registerAct("Threaten")
    self:registerAct("X-Threaten", nil, "susie")
    self:registerMarcyAct("Jump")

    self.damage_offset = {0, -60}

    local body = self.sprite.parts.body.sprite
    local head = self.sprite.parts.head.sprite
    head.layer = body.layer + 1

    self.timer = 0
end

function FeralFroggit:getDamageVoice()
    return "ehurt1"
end

function FeralFroggit:onHurtEnd()
    super:onHurtEnd(self)
    local body = self.sprite.parts.body.sprite
    local head = self.sprite.parts.head.sprite
    head.layer = body.layer + 1
end

function FeralFroggit:onAct(battler, name)
    if name == "Compliment" then
        return {
            "* You compliment Feral Froggit's fur.",
            "* Feral Froggit had no idea what you said and ignored you."
        }
    elseif name == "Flirt" then
        self.tired = true
        self.dialogue_override = "*Croak?*"
        return {
            "* You flirted with Feral Froggit.",
            "* Feral Froggit was confused and became [color:blue]TIRED[color:reset]."
        }
    elseif name == "Threaten" then
        self:addMercy(50)
        return {
            "* You waived your weapon at Feral Froggit.",
            "* Feral Froggit recognized your attempt at dominance."
        }
    elseif name == "X-Threaten" then
        self:addMercy(100)
        return {
            "* You and Susie waived your weapons at Feral Froggit.",
            "* Feral Froggit now acknowledges you as its superior."
        }
    elseif name == "Jump" then
		local froggits = 0
        for k,v in ipairs(Game.battle.enemies) do
			if v.id == "feralfroggit" then
				froggits = froggits + 1
				v:setTired(true)
			end
		end
        return {
            "* Marcy climbed off of Jamm's back and started hopping around...",
            "* The Feral Froggit" .. ((froggits > 1) and "s" or "") .. " couldn't keep up!\n* They became [color:blue]TIRED[color:white]!"
        }
    elseif name == "Standard" then
        -- Placeholder
        return "* ... But "..battler.chara:getName().." had no idea what to do."
    end

    return super:onAct(self, battler, name)
end

function FeralFroggit:update()
    super:update(self)

    local body = self.sprite.parts.body.sprite
    local head = self.sprite.parts.head.sprite
    self.timer = self.timer + DT
    body.scale_y = math.sin(self.timer*3)/10 + 1
    head.y = -math.sin(self.timer*3)*3 + 40
end

return FeralFroggit
