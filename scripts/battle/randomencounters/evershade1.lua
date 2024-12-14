local Encounters, super = Class(RandomEncounter)

function Encounters:init()
    super:init(self)

    self.population = 22
    self.encounters = {
        "2feralfroggit",
        "3feralfroggit"
    }
end

return Encounters