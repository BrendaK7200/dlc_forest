function Mod:init()
    print("Loaded "..self.info.name.."!")
end

function Mod:onMapMusic(map, music)
    if music == "evershade_forest" then
        if Game:getFlag("evershade_geno") then
            return "evershade_empty"
        else
            return "evershade_forst"
        end
    end
end