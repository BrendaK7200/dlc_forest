return function(cutscene)
    if Game.world.map.id == "entrance" then
        cutscene:showNametag("Susie")
        cutscene:text("* So far nothing unusual.", "neutral_side", "susie")
        cutscene:text("* Hopefully there will be at least something.", "nervous_side", "susie")
        cutscene:text("* Or this adventure is gonna be boring as heck.", "annoyed", "susie")
        cutscene:hideNametag()
    elseif Game.world.map.id == "pre_evershade" then
        cutscene:showNametag("Susie")
        if not Game:getFlag("evershade_froggit") then
            cutscene:text("* I think I see someone there.", "neutral_side", "susie")
            cutscene:text("* Is that...?", "sus_nervous", "susie")
        else
            if Game:getFlag("evershade_froggitkill") then
                cutscene:text("* Maybe...[wait:5] That encounter with Froggit...", "shy_down", "susie")
                cutscene:text("* Could've turned out better.", "annoyed_down", "susie")
                cutscene:text("* ...", "annoyed_down", "susie")
                cutscene:text("* Let's get going.", "shy_down", "susie")
            else
                cutscene:text("* Good thing we dealt with that Froggit.", "smile", "susie")
                cutscene:showNametag("Brenda")
                cutscene:text("* Yeah,[wait:5] thanks again for that.", "smile", "brenda_lw")
            end
        end
        cutscene:hideNametag()
    elseif Game.world.map.id == "evershade_01" then
        if Game:getFlag("randomencounter#evershade1:violent") and Game:getFlag("randomencounter#evershade1:violent") >= 22 then
            cutscene:showNametag("Susie")
            cutscene:text("* It's awfully quiet in here.", "sus_nervous", "susie")
            cutscene:showNametag("Brenda")
            cutscene:text("* (There's nobody left...)", "down", "brenda_lw")
            if #Game.party == 1 then
                cutscene:text("* (Why...[wait:5] did she do that?)", "down", "brenda_lw")
            else
                cutscene:text("* (Why...[wait:5] did they do that?)", "down", "brenda_lw")
            end
        elseif Game:getFlag("randomencounter#evershade1:violent") and Game:getFlag("randomencounter#evershade1:violent") >= 16 then
            cutscene:showNametag("Brenda")
            cutscene:text("* Why do we...[wait:5] Keep doing that?", "dissapointed", "brenda_lw")
            cutscene:showNametag("Susie")
            cutscene:text("* Doing what?", "neutral_side", "susie")
            cutscene:showNametag("Brenda")
            cutscene:text("* Well,[wait:5] you know...", "suspicious", "brenda_lw")
            cutscene:text("* Killing.[wait:5] Enemies.", "suspicious_b", "brenda_lw")
            cutscene:showNametag("Susie")
            cutscene:text("* I...[wait:5] Honestly don't know.", "shy_down", "susie")
            cutscene:showNametag("Brenda")
            cutscene:text("* (If this continues,[wait:5] then...)", "down", "brenda_lw")
        else
            cutscene:showNametag("Susie")
            cutscene:text("* I think there could be some enemies nearby.", "sus_nervous", "susie")
            cutscene:text("* Gotta stay alert.", "annoyed", "susie")
        end
        cutscene:hideNametag()
    else
        cutscene:text("* Your voice echoes aimlessly.")
    end
end