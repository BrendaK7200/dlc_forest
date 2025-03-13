local encounter, super = Class(LightEncounter)

function encounter:init()
    super.init(self)

    -- Text displayed at the bottom of the screen at the start of the encounter
    self.text = "[font:main_mono,15]* But nobody came."

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