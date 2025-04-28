local encounter, super = Class(LightEncounter)

function encounter:init()
    super.init(self)

    local rnd = love.math.random(1, 20)
    if rnd == 1 then -- maybe could use more unique messages?
        self.text = "[font:main_mono,15]* Nothing but silence."
    elseif rnd == 2 then
        self.text = "[font:main_mono,15]* Alone."
    elseif rnd == 3 then
        self.text = "[font:main_mono,15]* You're seeing things.[wait:5] Keep going."
    else
        self.text = "[font:main_mono,15]* But nobody came."
    end

    self.music = nil
end

function encounter:onBattleStart()
    Game.battle:setState("BUTNOBODYCAME")
    if not Game:getFlag("evershade_geno") then
        Game.world.music:stop()
        Game.world.music:resume()
        Game.world.music:play("evershade_empty", 1)
    end
end

function encounter:onBattleEnd()
    if not Game:getFlag("evershade_geno") then
        Game:setFlag("evershade_geno", true)
        Game.world:startCutscene("evershade", "butnobodycame")
    end
end

return encounter