local Encounters, super = Class(RandomEncounter)

function Encounters:init()
    super:init(self)

    self.population = 22
    if Game.world.map.id == "evershade_01" then
        self.encounters = {
            "feralfroggit",
            "whimsorrow",
        }
    elseif Game.world.map.id == "evershade_02" then
        self.encounters = {
            "feralfroggit",
            "whimsorrow",
            "feralfroggitwhimsorrow"
        }
    end
end

return Encounters